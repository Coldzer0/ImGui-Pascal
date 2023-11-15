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

Unit CImGui.Impl.SDL2;

{$IfDef FPC}
  {$mode objfpc}{$H+}
{$EndIf}

Interface

Uses
  SDL2, PasImGui.Apis;

Function ImGui_ImplSDL2_InitForOpenGL(window: PSDL_Window;
  sdl_gl_context: Pointer): Boolean; Cdecl; External CIMGUI_LIB;

Function ImGui_ImplSDL2_InitForVulkan(window: PSDL_Window): Boolean; Cdecl; External CIMGUI_LIB;
Function ImGui_ImplSDL2_InitForD3D(window: PSDL_Window): Boolean; Cdecl; External CIMGUI_LIB;
Function ImGui_ImplSDL2_InitForMetal(window: PSDL_Window): Boolean; Cdecl; External CIMGUI_LIB;
Function ImGui_ImplSDL2_InitForSDLRenderer(window: PSDL_Window; renderer: PSDL_Renderer): Boolean; Cdecl; External CIMGUI_LIB;
Function ImGui_ImplSDL2_InitForOther(window: PSDL_Window): Boolean; Cdecl; External CIMGUI_LIB;

Procedure ImGui_ImplSDL2_Shutdown(); Cdecl; External CIMGUI_LIB;
Procedure ImGui_ImplSDL2_NewFrame(); Cdecl; External CIMGUI_LIB;
Function ImGui_ImplSDL2_ProcessEvent(event: PSDL_Event): Boolean; Cdecl; External CIMGUI_LIB;


Implementation

End.
