{
  FreePascal / Delphi bindings for ImGui

  Copyright (C) 2023 Coldzer0 <Coldzer0 [at] protonmail.ch>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the MIT License.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  MIT License for more details.
}

unit CustomNodeGraph;

{$IfDef FPC}
  {$mode Delphi}{$H+}
  {$ModeSwitch advancedrecords}
{$EndIf}

Interface

Uses
  Generics.Collections,
  SysUtils,
  PasImGui,
  PasImGui.Types,
  PasImGui.Enums;

Type
  { TNode }

  TNode = Record
    ID: Integer;
    Name: Array [0..31] Of AnsiChar;
    Pos, Size: ImVec2;
    Value: Single;
    Color: ImVec4;
    InputsCount, OutputsCount: Integer;
    function GetInputSlotPos(slotNo: Integer): ImVec2;
    function GetOutputSlotPos(slotNo: Integer): ImVec2;
    constructor Create(id_: Integer;
      const Name_: PAnsiChar; pos_: ImVec2; Value_: Single; color_: ImVec4; inputsCount_, outputsCount_: Integer);
  End;

  { TNodeLink }

  TNodeLink = record
    InputIdx, InputSlot, OutputIdx, OutputSlot: Integer;
    constructor Create(inputIdx_, inputSlot_, outputIdx_, outputSlot_: Integer);
  end;

  Procedure ShowExampleAppCustomNodeGraph(opened: PBoolean);

Implementation
  uses
    Math;

var
  nodes : TList<TNode>;
  links : TList<TNodeLink>;
  scrolling  : ImVec2 = (x:0.0; y:0.0);

  node_hovered_in_list : Integer = -1;
  node_hovered_in_scene : Integer = -1;
  node_selected : Integer = -1;

  open_context_menu : Boolean = False;
  inited : Boolean = False;
  show_grid : Boolean = False;


Procedure ShowExampleAppCustomNodeGraph(opened: PBoolean);
var
  io : PImGuiIO;
  node, node_inp , node_out: TNode;
  link: TNodeLink;
  node_idx, slot_idx, link_idx: Integer;
  offset, win_pos, canvas_sz, p1, p2, node_rect_min, node_rect_max,
    scene_pos: ImVec2;
  draw_list: PImDrawList;
  GRID_COLOR, node_bg_color: ImU32;
  GRID_SZ, x, y: Single;
  old_any_active, node_widgets_active, node_moving_active: Boolean;
const
  NODE_SLOT_RADIUS : Single = 4.0;
  NODE_WINDOW_PADDING : ImVec2 = (x:8.0; y:8.0);
Begin
  ImGui.SetNextWindowSize(ImVec2.New(700, 600), ImGuiCond_FirstUseEver);
  ImGui.SetNextWindowPosCenter(ImGuiCond_FirstUseEver);
  If Not ImGui.Begin_('Greeting') Then
  Begin
    ImGui.End_;  // Early out if the window is collapsed, as an optimization.
    exit;
  End;

  io := ImGui.GetIO();

  if not inited then
  begin
    nodes := TList<TNode>.Create();
    links := TList<TNodeLink>.Create();

    nodes.Add(TNode.Create(0, 'MainTex', ImVec2.New(40, 50), 0.5, ImVec4.New(255, 100, 100), 1, 1));
    nodes.Add(TNode.Create(1, 'BumpMap', ImVec2.New(40, 150), 0.42, ImVec4.New(200, 100, 200), 1, 1));
    nodes.Add(TNode.Create(2, 'Combine', ImVec2.New(270, 80), 1.0, ImVec4.New(0, 200, 100), 2, 2));
    links.Add(TNodeLink.Create(0, 0, 2, 0));
    links.Add(TNodeLink.Create(1, 0, 2, 1));

    inited := True;
  end;
  // Draw a list of nodes on the left side
  ImGui.BeginChild('node_list', ImVec2.New(100, 0));
  ImGui.Text('Nodes');
  ImGui.Separator();

  for node_idx := 0 to Pred(nodes.Count) do
  begin
    node := &nodes[node_idx];
    ImGui.PushIdInt(node.ID);
    if ImGui.Selectable(node.Name, node.ID = node_selected) then
      node_selected := node.ID;

    if ImGui.IsItemHovered() then
    begin
      node_hovered_in_list := node.ID;
      open_context_menu := Boolean(Ord(open_context_menu) or Ord(ImGui.IsMouseClicked(ImGuiMouseButton_Left)));
    end;
    ImGui.PopID();
  end;
  ImGui.EndChild();

  ImGui.SameLine();
  ImGui.BeginGroup();

  // Create our child canvas
  ImGui.Text('Hold middle mouse button to scroll (%.2f,%.2f)', [scrolling.x, scrolling.y]);
  ImGui.SameLine({ImGui.GetWindowWidth() - 100});
  ImGui.Checkbox('Show grid', @show_grid);
  ImGui.PushStyleVar(ImGuiStyleVar_FramePadding, ImVec2.New(1, 1));
  ImGui.PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2.New(0, 0));
  ImGui.PushStyleColor(ImGuiCol_ChildBg, IM_COL32(60, 60, 70, 200));
  ImGui.BeginChild('scrolling_region', ImVec2.New(0, 0), ImGuiChildFlags_None, ImGuiWindowFlags_NoScrollbar or ImGuiWindowFlags_NoMove);
  ImGui.PopStyleVar(); // WindowPadding
  ImGui.PushItemWidth(120.0);

  offset := ImGui.GetCursorScreenPos() + scrolling;
  draw_list := ImGui.GetWindowDrawList();

  if show_grid then
  begin
    GRID_COLOR := IM_COL32(200, 200, 200, 40);
    GRID_SZ := 64.0;
    win_pos := ImGui.GetCursorScreenPos();
    canvas_sz := ImGui.GetWindowSize();

    x := fmod(scrolling.x, GRID_SZ);
    while (x > 0) and (x < canvas_sz.x) do
    begin
      draw_list^.AddLine(ImVec2.New(x, 0.0) + win_pos, ImVec2.New(x, canvas_sz.y) + win_pos, GRID_COLOR);
      x := x + GRID_SZ;
    end;

    y := fmod(scrolling.y, GRID_SZ);
    while (y > 0) and  (y < canvas_sz.y) do
    begin
      draw_list^.AddLine(ImVec2.New(0.0, y) + win_pos, ImVec2.New(canvas_sz.x, y) + win_pos, GRID_COLOR);
      y := y + GRID_SZ;
    end;
  end;

  // Display links
  draw_list^.ChannelsSplit(2);
  draw_list^.ChannelsSetCurrent(0); // Background

  for link_idx := 0 to Pred(links.Count) do
  begin
    link := &links[link_idx];
    node_inp := &nodes[link.InputIdx];
    node_out := &nodes[link.OutputIdx];
    p1 := offset + node_inp.GetOutputSlotPos(link.InputSlot);
    p2 := offset + node_out.GetInputSlotPos(link.OutputSlot);
    draw_list^.AddBezierCubic(p1, p1 + ImVec2.New(+50, 0), p2 + ImVec2.New(-50, 0), p2, IM_COL32(200, 200, 100, 255), 3.0);
  end;

  // Display nodes
  for node_idx := 0 to Pred(nodes.Count) do
  begin
    node := &nodes[node_idx];

    ImGui.PushIdInt(node.ID);
    node_rect_min := offset + node.Pos;

    // Display node contents first
    draw_list^.ChannelsSetCurrent(1); // Foreground
    old_any_active := ImGui.IsAnyItemActive();
    ImGui.SetCursorScreenPos(node_rect_min + NODE_WINDOW_PADDING);
    ImGui.BeginGroup(); // Lock horizontal position
    ImGui.Text('%s', [node.Name]);
    ImGui.SliderFloat('##value', @node.Value, 0.0, 1.0, 'Alpha %.2f');
    ImGui.ColorEdit3('##color', @node.Color.x);
    ImGui.EndGroup();

    // Save the size of what we have emitted and whether any of the widgets are being used
    node_widgets_active := ((not old_any_active) and ImGui.IsAnyItemActive());
    node.Size := ImGui.GetItemRectSize() + NODE_WINDOW_PADDING + NODE_WINDOW_PADDING;
    node_rect_max := node_rect_min + node.Size;

    // Display node box
    draw_list^.ChannelsSetCurrent(0); // Background
    ImGui.SetCursorScreenPos(node_rect_min);
    ImGui.InvisibleButton('node', node.Size);
    if ImGui.IsItemHovered() then
    begin
      node_hovered_in_scene := node.ID;
      open_context_menu := open_context_menu or ImGui.IsMouseClicked(1);
    end;
    node_moving_active := ImGui.IsItemActive();
    if (node_widgets_active or node_moving_active) then
        node_selected := node.ID;
    if (node_moving_active and ImGui.IsMouseDragging(ImGuiMouseButton_Left)) then
        node.Pos := node.Pos + io^.MouseDelta;

    if ((node_hovered_in_list = node.ID) or (node_hovered_in_scene = node.ID) or ((node_hovered_in_list = -1) and (node_selected = node.ID))) then
      node_bg_color := IM_COL32(75, 75, 75, 255)
    else
      node_bg_color := IM_COL32(60, 60, 60, 255);

    draw_list^.AddRectFilled(node_rect_min, node_rect_max, node_bg_color, 4.0);
    draw_list^.AddRect(node_rect_min, node_rect_max, IM_COL32(100, 100, 100, 255), 4.0);

    for slot_idx := 0 to Pred(node.InputsCount) do
      draw_list^.AddCircleFilled(offset + node.GetInputSlotPos(slot_idx), NODE_SLOT_RADIUS, IM_COL32(150, 150, 150, 150));
    for slot_idx  := 0 to Pred(node.OutputsCount) do
      draw_list^.AddCircleFilled(offset + node.GetOutputSlotPos(slot_idx), NODE_SLOT_RADIUS, IM_COL32(150, 150, 150, 150));

    ImGui.PopID();
  end;
  draw_list^.ChannelsMerge();

  // Open context menu
  if ImGui.IsMouseReleased(ImGuiMouseButton_Right) then
  begin
    if ImGui.IsWindowHovered(ImGuiHoveredFlags_AllowWhenBlockedByPopup) or (not ImGui.IsAnyItemHovered()) then
    begin
      node_hovered_in_list := -1;
      node_hovered_in_scene := -1;;
      node_selected := -1;
      open_context_menu := true;
    end;
  end;
  if open_context_menu then
  begin
    ImGui.OpenPopup('context_menu');
    if (node_hovered_in_list <> -1) then
        node_selected := node_hovered_in_list;
    if (node_hovered_in_scene <> -1) then
        node_selected := node_hovered_in_scene;
  end;
  // Draw context menu
  ImGui.PushStyleVar(ImGuiStyleVar_WindowPadding, ImVec2.New(8, 8));
  if ImGui.BeginPopup('context_menu') then
  begin
    scene_pos := ImGui.GetMousePosOnOpeningCurrentPopup() - offset;

    if node_selected <> -1 then
    begin
      node := &nodes[node_selected];
      ImGui.Text('Node "%s"', [node.Name]);
      ImGui.Separator();
      if ImGui.MenuItem('Rename..', nil, false, false) then begin end;
      if ImGui.MenuItem('Delete', nil, false, false) then begin end;
      if ImGui.MenuItem('Copy', nil, false, false) then begin end;
    end
    else
    begin
      if ImGui.MenuItem('Add') then
        nodes.Add(Node.Create(nodes.Count, 'New node', scene_pos, 0.5, ImVec4.New(100, 100, 200), 2, 2));
      if ImGui.MenuItem('Past', nil, false, false) then begin end;
    end;
    ImGui.EndPopup();
  end;
  ImGui.PopStyleVar();

  // Scrolling
  if (ImGui.IsWindowHovered() and (not ImGui.IsAnyItemActive()) and ImGui.IsMouseDragging(ImGuiMouseButton_Middle, 0.0)) then
      scrolling := scrolling + io.MouseDelta;

  ImGui.PopItemWidth();
  ImGui.EndChild();
  ImGui.PopStyleColor();
  ImGui.PopStyleVar();
  ImGui.EndGroup();

  ImGui.End_();
End;

{ TNode }

function TNode.GetInputSlotPos(slotNo: Integer): ImVec2;
begin
  Result.x := Pos.x;
  Result.y := Pos.y + Size.y * Single(slotNo + 1) / (InputsCount + 1);
end;

function TNode.GetOutputSlotPos(slotNo: Integer): ImVec2;
begin
  Result.x := Pos.x + Size.x;
  Result.y := Pos.y + Size.y * Single(slotNo + 1) / (OutputsCount + 1);
end;

constructor TNode.Create(id_: Integer;
  const Name_: PAnsiChar; pos_: ImVec2; Value_: Single; color_: ImVec4; inputsCount_, outputsCount_: Integer);
Begin
  Self.ID := id_;
  StrLCopy(Self.Name, name_, SizeOf(Self.Name) - 1);
  Self.Pos := pos_;
  Self.Value := value_;
  Self.Color := color_;
  Self.InputsCount := inputsCount_;
  Self.OutputsCount := outputsCount_;
End;

{ TNodeLink }

constructor TNodeLink.Create(inputIdx_, inputSlot_, outputIdx_, outputSlot_: Integer);
begin
  Self.InputIdx := inputIdx_;
  Self.InputSlot := inputSlot_;
  Self.OutputIdx := outputIdx_;
  Self.OutputSlot := outputSlot_;
end;

initialization


finalization
  nodes.Free;
  links.Free;

End.

