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

{
  Code From https://github.com/dpethes/imgui-pas - Updated by Coldzer0

  Partial translation of imgui demo / ShowTestWindow
  While you're probably better off with the original version as it's way more extensive,
  this is good as
    * a test case for the bindings or
    * a quick guide if something isn't translated in a straightforward way
}
Unit TestWindow;

{$IFDEF FPC}
  {$mode objfpc}{$H+}
{$ENDIF}

{$J+}

Interface

Uses
  Classes,
  SysUtils,
  PasImGui,
  PasImGui.Utils;

Type

  { TTestWindow }
  TTestWindow = Class
  Private
    show_app_main_menu_bar: boolean;
    show_app_console: boolean;
    show_app_log: boolean;
    show_app_layout: boolean;
    show_app_property_editor: boolean;
    show_app_long_text: boolean;
    show_app_auto_resize: boolean;
    show_app_constrained_resize: boolean;
    show_app_fixed_overlay: boolean;
    show_app_manipulating_window_title: boolean;
    show_app_custom_rendering: boolean;
    show_app_style_editor: boolean;

    show_app_metrics: boolean;
    show_app_about: boolean;

    no_titlebar: boolean;
    no_resize: boolean;
    no_move: boolean;
    no_scrollbar: boolean;
    no_collapse: boolean;
    no_menu: boolean;

    Procedure Trees;
  Public
    Constructor Create;
    Procedure Show(Var p_open: boolean);
  End;

Implementation

Procedure ShowHelpMarker(Const desc: AnsiString);
Begin
  ImGui.TextDisabled('(?)');
  If (ImGui.IsItemHovered()) Then
  Begin
    ImGui.BeginTooltip();
    ImGui.PushTextWrapPos(450.0);
    ImGui.TextUnformatted(desc);
    ImGui.PopTextWrapPos();
    ImGui.EndTooltip();
  End;
End;

{ TTestWindow }

Procedure TTestWindow.Trees;
Const  //static vars
  align_label_with_current_x_position: boolean = False;
  selection_mask: integer = 1 shl 2;
  // Dumb representation of what may be user-side selection state. You may carry selection state inside or outside your objects in whatever format you see fit.
Var
  node_open: Boolean;
  node_clicked: Integer;
  i: Integer;
  node_flags: ImGuiTreeNodeFlags;
Begin
  If (ImGui.TreeNode('Basic trees')) Then
  Begin
    For i := 0 To 4 Do
      If (ImGui.TreeNode({%H-}PImGuiID(i), 'Child %d', [i])) Then
      Begin
        ImGui.Text('blah blah');
        ImGui.SameLine();
        If (ImGui.SmallButton('print')) Then
        begin
          ImGui.LogText('Child ' + i.ToString + ' pressed');
          Imgui.LogFinish;
        end;
        ImGui.TreePop();
      End;
    ImGui.TreePop();
  End;

  If (ImGui.TreeNode('Advanced, with Selectable nodes')) Then
  Begin
    ShowHelpMarker('This is a more standard looking tree with selectable nodes.' + #10 +
      'Click to select, CTRL+Click to toggle, click on arrows or double-click to open.');
    ImGui.Checkbox('Align label with current X position)',
      @align_label_with_current_x_position);
    ImGui.Text('Hello!');
    If (align_label_with_current_x_position) Then
      ImGui.Unindent(ImGui.GetTreeNodeToLabelSpacing());
    node_clicked := -1;
    // Temporary storage of what node we have clicked to process selection at the end of the loop. May be a pointer to your own node type, etc.
    ImGui.PushStyleVar(ImGuiStyleVar_IndentSpacing, ImGui.GetFontSize() * 3);
    // Increase spacing to differentiate leaves from expanded contents.
    For i := 0 To 5 Do
    Begin
      // Disable the default open on single-click behavior and pass in Selected flag according to our selection state.
      //ImGuiTreeNodeFlags node_flags := ImGuiTreeNodeFlags_OpenOnArrow | ImGuiTreeNodeFlags_OpenOnDoubleClick | ((selection_mask & (1 << i)) ? ImGuiTreeNodeFlags_Selected : 0);
      node_flags := ImGuiTreeNodeFlags_OpenOnArrow Or
        ImGuiTreeNodeFlags_OpenOnDoubleClick;
      If (selection_mask And (1 shl i)) > 0 Then
        node_flags := node_flags Or ImGuiTreeNodeFlags_Selected;
      If (i < 3) Then
      Begin
        // Node
        node_open := ImGui.TreeNodeEx({%H-}PImGuiID(i), node_flags,
          'Selectable Node %d', [i]);
        If (ImGui.IsItemClicked()) Then
          node_clicked := i;
        If (node_open) Then
        Begin
          ImGui.Text('Blah blah' + #10 + 'Blah Blah');
          ImGui.TreePop();
        End;
      End
      Else
      Begin
        // Leaf: The only reason we have a TreeNode at all is to allow selection of the leaf. Otherwise we can use BulletText() or TreeAdvanceToLabelPos()+Text().
        node_flags := node_flags Or ImGuiTreeNodeFlags_Leaf Or
          ImGuiTreeNodeFlags_NoTreePushOnOpen;
        ImGui.TreeNodeEx({%H-}PImGuiID(i), node_flags, 'Selectable Leaf %d', [i]);
        If (ImGui.IsItemClicked()) Then
          node_clicked := i;
      End;
    End;
    If (node_clicked <> -1) Then
    Begin
      // Update selection state. Process outside of tree loop to avoid visual inconsistencies during the clicking-frame.
      If (ImGui.GetIO()^.KeyCtrl) Then
        selection_mask := selection_mask Xor (1 shl node_clicked)          // CTRL+click to toggle
      Else
        //if (!(selection_mask & (1 << node_clicked))) // Depending on selection behavior you want, this commented bit preserve selection when clicking on item that is part of the selection
        selection_mask := (1 shl node_clicked);           // Click to single-select
    End;
    ImGui.PopStyleVar();
    If (align_label_with_current_x_position) Then
      ImGui.Indent(ImGui.GetTreeNodeToLabelSpacing());
    ImGui.TreePop();
  End;
  ImGui.TreePop();
End;

Constructor TTestWindow.Create;
Begin
  show_app_main_menu_bar := False;
  show_app_console := False;
  show_app_log := False;
  show_app_layout := False;
  show_app_property_editor := False;
  show_app_long_text := False;
  show_app_auto_resize := False;
  show_app_constrained_resize := False;
  show_app_fixed_overlay := False;
  show_app_manipulating_window_title := False;
  show_app_custom_rendering := False;
  show_app_style_editor := False;

  show_app_metrics := False;
  show_app_about := False;

  no_titlebar := False;
  no_resize := False;
  no_move := False;
  no_scrollbar := False;
  no_collapse := False;
  no_menu := False;
End;

Procedure TTestWindow.Show(Var p_open: boolean);
Var
  io: PImGuiIO;
  window_flags: ImGuiWindowFlags;
  draw_list: PImDrawList;
  value_raw, value_with_lock_threshold, mouse_delta: ImVec2;
Begin
  window_flags := ImGuiWindowFlags_None;
  // Demonstrate the various window flags. Typically you would just use the default.
  If (no_titlebar) Then window_flags := window_flags Or ImGuiWindowFlags_NoTitleBar;
  If (no_resize) Then window_flags := window_flags Or ImGuiWindowFlags_NoResize;
  If (no_move) Then window_flags := window_flags Or ImGuiWindowFlags_NoMove;
  If (no_scrollbar) Then window_flags := window_flags Or ImGuiWindowFlags_NoScrollbar;
  If (no_collapse) Then window_flags := window_flags Or ImGuiWindowFlags_NoCollapse;
  If (Not no_menu) Then window_flags := window_flags Or ImGuiWindowFlags_MenuBar;

  ImGui.SetNextWindowSize(ImVec2.New(550, 680), ImGuiCond_FirstUseEver);
  If Not ImGui.Begin_('ImGui Demo (FreePascal / Delphi version)', @p_open, window_flags) Then
  Begin
    // Early out if the window is collapsed, as an optimization.
    ImGui.End_;
    exit;
  End;

  //ImGui::PushItemWidth(ImGui::GetWindowWidth() * 0.65f);    // 2/3 of the space for widget and 1/3 for labels
  ImGui.PushItemWidth(ImGui.GetWindowWidth() * 0.65);
  // Right align, keep 140 pixels for labels

  ImGui.Text('Dear ImGui says hello.');

  // Menu
  If (ImGui.BeginMenuBar()) Then
  Begin
    If (ImGui.BeginMenu('Menu')) Then
    Begin
      ImGui.MenuItem('Open');
      ImGui.MenuItem('Close');
      ImGui.EndMenu();
    End;
    If (ImGui.BeginMenu('Examples')) Then
    Begin
      ImGui.MenuItem('Main menu bar', nil, @show_app_main_menu_bar);
      ImGui.MenuItem('Console', nil, @show_app_console);
      ImGui.MenuItem('Log', nil, @show_app_log);
      ImGui.MenuItem('Simple layout', nil, @show_app_layout);
      ImGui.MenuItem('Property editor', nil, @show_app_property_editor);
      ImGui.MenuItem('Long text display', nil, @show_app_long_text);
      ImGui.MenuItem('Auto-resizing window', nil, @show_app_auto_resize);
      ImGui.MenuItem('Constrained-resizing window', nil,
        @show_app_constrained_resize);
      ImGui.MenuItem('Simple overlay', nil, @show_app_fixed_overlay);
      ImGui.MenuItem('Manipulating window title', nil,
        @show_app_manipulating_window_title);
      ImGui.MenuItem('Custom rendering', nil, @show_app_custom_rendering);
      ImGui.EndMenu();
    End;
    If (ImGui.BeginMenu('Help')) Then
    Begin
      ImGui.MenuItem('Metrics', nil, @show_app_metrics);
      ImGui.MenuItem('Style Editor', nil, @show_app_style_editor);
      ImGui.MenuItem('About ImGui', nil, @show_app_about);
      ImGui.EndMenu();
    End;
    ImGui.EndMenuBar();
  End;

  ImGui.Spacing();
  If ImGui.CollapsingHeader('Help') Then
  Begin
    ImGui.TextWrapped(
      'This window is being created by the ShowTestWindow() function. Please refer to the code for programming reference.'
      + #10#10 +
      'User Guide:');
    ImGui.ShowUserGuide();
  End;

  If ImGui.CollapsingHeader('Window options') Then
  Begin
    ImGui.Checkbox('No titlebar', @no_titlebar);
    ImGui.SameLine(150);
    ImGui.Checkbox('No resize', @no_resize);
    ImGui.Checkbox('No move', @no_move);
    ImGui.SameLine(150);
    ImGui.Checkbox('No scrollbar', @no_scrollbar);
    ImGui.SameLine(300);
    ImGui.Checkbox('No collapse', @no_collapse);
    ImGui.Checkbox('No menu', @no_menu);

    If ImGui.TreeNode('Style') Then
    Begin
      ImGui.ShowStyleEditor(Imgui.GetStyle());
      //this is useful to have, but doesn't need to be translated as an example
      ImGui.TreePop();
    End;

    If ImGui.TreeNode('Logging') Then
    Begin
      ImGui.TextWrapped(
        'The logging API redirects all text output so you can easily capture the content of a window or a block. Tree nodes can be automatically expanded. You can also call ImGui.LogText() to output directly to the log without a visual output.');
      ImGui.LogButtons();
      ImGui.TreePop();
    End;
  End;

  If ImGui.CollapsingHeader('Widgets') Then
  Begin
    If ImGui.TreeNode('Trees') Then
      Trees;
  End;

  If ImGui.CollapsingHeader('Keyboard, Mouse & Focus') Then
  Begin
    If ImGui.TreeNode('Dragging') Then
    Begin
      ImGui.TextWrapped(
        'You can use ImGui::GetMouseDragDelta(0) to query for the dragged amount on any widget.');
      ImGui.Button('Drag Me');
      If ImGui.IsItemActive() Then
      Begin
        io := ImGui.GetIO();
        // Draw a line between the button and the mouse cursor
        draw_list := ImGui.GetWindowDrawList();
        draw_list^.PushClipRectFullScreen;
        draw_list^.AddLine(io^.MouseClickedPos[0], io^.MousePos,
          ImGui.GetColorU32Vec(ImGui.GetStyle()^.Colors[ImGuiCol_DragDropTarget]),
          4.0);
        draw_list^.PopClipRect;

        value_raw := ImGui.GetMouseDragDelta(ImGuiMouseButton_Left, 0.0);
        value_with_lock_threshold := ImGui.GetMouseDragDelta(ImGuiMouseButton_Left);
        mouse_delta := ImGui.GetIO()^.MouseDelta;
        ImGui.SameLine();
        ImGui.TextWrapped(
          'Raw (%.1f, %.1f), WithLockThresold (%.1f, %.1f), MouseDelta (%.1f, %.1f)',
          [value_raw.x, value_raw.y, value_with_lock_threshold.x,
          value_with_lock_threshold.y, mouse_delta.x, mouse_delta.y]);
      End;
      ImGui.TreePop();
    End;
  End;

  ImGui.End_;
End;

End.
