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
  code from https://github.com/dpethes/imgui-pas
  Additional imgui related code that may come in handy, mostly code samples from various sources

  code from procedural's GpuLib - https://github.com/procedural/gpulib/
  referenced in https://github.com/ocornut/imgui/issues/707
}
unit PasImGui.Utils;

{$IFDEF FPC}
  {$mode Delphi}{$H+}{$J-}
  {$ModeSwitch advancedrecords}
  {$modeswitch typehelpers}
{$ENDIF}

interface

uses
  PasImGui;

Type

  { TImVec2 }
  TImVec2 = Record helper For ImVec2
    class function New(const _x, _y: Single) : ImVec2; static;
  end;

  { TImVec3 }
  TImVec3 = Record helper For ImVec3
    class function New(const _x, _y, _z: Single) : ImVec3; static;
  end;

  { TImVec4 }
  TImVec4 = Record helper For ImVec4
    class function New(const _x, _y, _z: Single; _w: Single = 1.0) : ImVec4; static;
  end;

  { TImDrawCmd }

  TImDrawCmd = Record helper for ImDrawCmd
    function GetTexID : ImTextureID;
  end;



procedure imgui_easy_theming(color_for_text, color_for_head, color_for_area, color_for_body, color_for_pops: ImVec3);
procedure SetupImGuiStyle2();

implementation

class function TImVec2.New(const _x, _y: Single): ImVec2;
begin
  Result.x := _x;
  Result.y := _y;
end;

{ TImVec3 }

class function TImVec3.New(const _x, _y, _z: Single): ImVec3;
begin
  Result.x := _x;
  Result.y := _y;
  Result.z := _z;
end;

{ TImVec4 }

class function TImVec4.New(const _x, _y, _z: Single; _w: Single): ImVec4;
begin
  Result.x := _x;
  Result.y := _y;
  Result.z := _z;
  Result.w := _w;
end;

{ TImDrawCmd }

function TImDrawCmd.GetTexID: ImTextureID;
begin
  Result := Self.TextureId;
end;

//operator Add(lhs, rhs: ImVec2): ImVec2;
//begin
//  Result := ImVec2.new(lhs.x + rhs.x, lhs.y + rhs.y);
//end;
//
//operator Subtract(lhs, rhs: ImVec2): ImVec2;
//begin
//  Result := ImVec2.new(lhs.x - rhs.x, lhs.y - rhs.y);
//end;

procedure imgui_easy_theming(color_for_text, color_for_head, color_for_area, color_for_body, color_for_pops: ImVec3);
var
  style: PImGuiStyle;
begin
  style := ImGui.GetStyle();

  style^.Colors[ImGuiCol_Text] := ImVec4.New( color_for_text.x, color_for_text.y, color_for_text.z, 1.00 );
  style^.Colors[ImGuiCol_TextDisabled] := ImVec4.New( color_for_text.x, color_for_text.y, color_for_text.z, 0.58 );
  style^.Colors[ImGuiCol_WindowBg] := ImVec4.New( color_for_body.x, color_for_body.y, color_for_body.z, 0.95 );
  style^.Colors[ImGuiCol_ChildBg] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 0.58 );
  style^.Colors[ImGuiCol_Border] := ImVec4.New( color_for_body.x, color_for_body.y, color_for_body.z, 0.00 );
  style^.Colors[ImGuiCol_BorderShadow] := ImVec4.New( color_for_body.x, color_for_body.y, color_for_body.z, 0.00 );
  style^.Colors[ImGuiCol_FrameBg] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 1.00 );
  style^.Colors[ImGuiCol_FrameBgHovered] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.78 );
  style^.Colors[ImGuiCol_FrameBgActive] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_TitleBg] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 1.00 );
  style^.Colors[ImGuiCol_TitleBgCollapsed] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 0.75 );
  style^.Colors[ImGuiCol_TitleBgActive] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_MenuBarBg] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 0.47 );
  style^.Colors[ImGuiCol_ScrollbarBg] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 1.00 );
  style^.Colors[ImGuiCol_ScrollbarGrab] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.21 );
  style^.Colors[ImGuiCol_ScrollbarGrabHovered] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.78 );
  style^.Colors[ImGuiCol_ScrollbarGrabActive] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_CheckMark] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.80 );
  style^.Colors[ImGuiCol_SliderGrab] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.50 );
  style^.Colors[ImGuiCol_SliderGrabActive] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_Button] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.50 );
  style^.Colors[ImGuiCol_ButtonHovered] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.86 );
  style^.Colors[ImGuiCol_ButtonActive] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_Header] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.76 );
  style^.Colors[ImGuiCol_HeaderHovered] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.86 );
  style^.Colors[ImGuiCol_HeaderActive] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_Separator] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.32 );
  style^.Colors[ImGuiCol_SeparatorHovered] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.78 );
  style^.Colors[ImGuiCol_SeparatorActive] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_ResizeGrip] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.15 );
  style^.Colors[ImGuiCol_ResizeGripHovered] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.78 );
  style^.Colors[ImGuiCol_ResizeGripActive] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_PlotLines] := ImVec4.New( color_for_text.x, color_for_text.y, color_for_text.z, 0.63 );
  style^.Colors[ImGuiCol_PlotLinesHovered] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_PlotHistogram] := ImVec4.New( color_for_text.x, color_for_text.y, color_for_text.z, 0.63 );
  style^.Colors[ImGuiCol_PlotHistogramHovered] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[ImGuiCol_TextSelectedBg] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.43 );
  style^.Colors[ImGuiCol_PopupBg] := ImVec4.New( color_for_pops.x, color_for_pops.y, color_for_pops.z, 0.92 );
  style^.Colors[ImGuiCol_ModalWindowDimBg] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 0.73 );
end;

procedure SetupImGuiStyle2();
var
  color_for_text, color_for_head, color_for_area, color_for_body, color_for_pops: ImVec3;
begin
  color_for_text := ImVec3.New(236.0 / 255.0, 240.0 / 255.0, 241.0 / 255.0);
  color_for_head := ImVec3.New(41.0 / 255.0, 128.0 / 255.0, 185.0 / 255.0);
  color_for_area := ImVec3.New(57.0 / 255.0, 79.0 / 255.0, 105.0 / 255.0);
  color_for_body := ImVec3.New(44.0 / 255.0, 62.0 / 255.0, 80.0 / 255.0);
  color_for_pops := ImVec3.New(33.0 / 255.0, 46.0 / 255.0, 60.0 / 255.0);
  imgui_easy_theming(color_for_text, color_for_head, color_for_area, color_for_body, color_for_pops);
end;

end.

