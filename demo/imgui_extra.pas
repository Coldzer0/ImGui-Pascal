{
  FreePascal / Delphi bindings for ImGui

  Copyright (C) 2023 Coldzer0 <Coldzer0 [at] protonmail.ch>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
  the Free Software Foundation, version 3 of the License.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU LESSER GENERAL PUBLIC LICENSE for more details.
}
{
  code from https://github.com/dpethes/imgui-pas
  Additional imgui related code that may come in handy, mostly code samples from various sources
}
unit imgui_extra;

{$IFDEF FPC}
  {$mode objfpc}{$H+}{$J-}
{$ENDIF}

interface

uses
  PasImGui.Enums,
  PasImGui.Types,
  PasImGui;

{
  code from procedural's GpuLib - https://github.com/procedural/gpulib/
  referenced in https://github.com/ocornut/imgui/issues/707
}
procedure imgui_easy_theming(color_for_text, color_for_head, color_for_area, color_for_body, color_for_pops: ImVec3);
procedure SetupImGuiStyle2();

implementation

procedure imgui_easy_theming(color_for_text, color_for_head, color_for_area, color_for_body, color_for_pops: ImVec3);
var
  style: PImGuiStyle;
begin
  style := ImGui.GetStyle();
  style^.Colors[Ord(ImGuiCol_Text)] := ImVec4.New( color_for_text.x, color_for_text.y, color_for_text.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_TextDisabled)] := ImVec4.New( color_for_text.x, color_for_text.y, color_for_text.z, 0.58 );
  style^.Colors[Ord(ImGuiCol_WindowBg)] := ImVec4.New( color_for_body.x, color_for_body.y, color_for_body.z, 0.95 );
  style^.Colors[Ord(ImGuiCol_ChildBg)] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 0.58 );
  style^.Colors[Ord(ImGuiCol_Border)] := ImVec4.New( color_for_body.x, color_for_body.y, color_for_body.z, 0.00 );
  style^.Colors[Ord(ImGuiCol_BorderShadow)] := ImVec4.New( color_for_body.x, color_for_body.y, color_for_body.z, 0.00 );
  style^.Colors[Ord(ImGuiCol_FrameBg)] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_FrameBgHovered)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.78 );
  style^.Colors[Ord(ImGuiCol_FrameBgActive)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_TitleBg)] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_TitleBgCollapsed)] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 0.75 );
  style^.Colors[Ord(ImGuiCol_TitleBgActive)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_MenuBarBg)] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 0.47 );
  style^.Colors[Ord(ImGuiCol_ScrollbarBg)] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_ScrollbarGrab)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.21 );
  style^.Colors[Ord(ImGuiCol_ScrollbarGrabHovered)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.78 );
  style^.Colors[Ord(ImGuiCol_ScrollbarGrabActive)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_CheckMark)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.80 );
  style^.Colors[Ord(ImGuiCol_SliderGrab)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.50 );
  style^.Colors[Ord(ImGuiCol_SliderGrabActive)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_Button)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.50 );
  style^.Colors[Ord(ImGuiCol_ButtonHovered)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.86 );
  style^.Colors[Ord(ImGuiCol_ButtonActive)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_Header)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.76 );
  style^.Colors[Ord(ImGuiCol_HeaderHovered)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.86 );
  style^.Colors[Ord(ImGuiCol_HeaderActive)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_Separator)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.32 );
  style^.Colors[Ord(ImGuiCol_SeparatorHovered)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.78 );
  style^.Colors[Ord(ImGuiCol_SeparatorActive)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_ResizeGrip)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.15 );
  style^.Colors[Ord(ImGuiCol_ResizeGripHovered)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.78 );
  style^.Colors[Ord(ImGuiCol_ResizeGripActive)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_PlotLines)] := ImVec4.New( color_for_text.x, color_for_text.y, color_for_text.z, 0.63 );
  style^.Colors[Ord(ImGuiCol_PlotLinesHovered)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_PlotHistogram)] := ImVec4.New( color_for_text.x, color_for_text.y, color_for_text.z, 0.63 );
  style^.Colors[Ord(ImGuiCol_PlotHistogramHovered)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 1.00 );
  style^.Colors[Ord(ImGuiCol_TextSelectedBg)] := ImVec4.New( color_for_head.x, color_for_head.y, color_for_head.z, 0.43 );
  style^.Colors[Ord(ImGuiCol_PopupBg)] := ImVec4.New( color_for_pops.x, color_for_pops.y, color_for_pops.z, 0.92 );
  style^.Colors[Ord(ImGuiCol_ModalWindowDimBg)] := ImVec4.New( color_for_area.x, color_for_area.y, color_for_area.z, 0.73 );
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

