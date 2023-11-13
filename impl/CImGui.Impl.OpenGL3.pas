{
  FreePascal bindings for ImGui

  Copyright (C) 2023 Coldzer0 <Coldzer0 [at] protonmail.ch>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
  the Free Software Foundation, version 3 of the License.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU LESSER GENERAL PUBLIC LICENSE for more details.
}

unit CImGui.Impl.OpenGL3;

{$IfDef FPC}
  {$mode objfpc}{$H+}
{$EndIf}

Interface

Uses
  PasImGui.Types,
  PasImGui.Apis;


function  ImGui_Impl_OpenGL3_Init(const glsl_version : PChar = nil) : Boolean;
Procedure ImGui_Impl_OpenGL3_RenderDrawData(draw_data : PImDrawData);
Procedure ImGui_Impl_OpenGL3_NewFrame();
Procedure ImGui_Impl_OpenGL3_Shutdown();

implementation

function  ImGui_ImplOpenGL3_Init(const glsl_version : PChar = nil) : Boolean; cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_Shutdown(); cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_NewFrame(); cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_RenderDrawData(draw_data : PImDrawData); cdecl; external CIMGUI_LIB;

// (Optional) Called by Init/NewFrame/Shutdown
function  ImGui_ImplOpenGL3_CreateFontsTexture(): Boolean; cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_DestroyFontsTexture(); cdecl; external CIMGUI_LIB;
function  ImGui_ImplOpenGL3_CreateDeviceObjects(): Boolean; cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_DestroyDeviceObjects(); cdecl; external CIMGUI_LIB;

function ImGui_Impl_OpenGL3_Init(const glsl_version: PChar): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := ImGui_ImplOpenGL3_Init(glsl_version);
  ResetFpuFlags(saved);
end;

procedure ImGui_Impl_OpenGL3_RenderDrawData(draw_data: PImDrawData);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGui_ImplOpenGL3_RenderDrawData(draw_data);
  ResetFpuFlags(saved);
end;

procedure ImGui_Impl_OpenGL3_NewFrame();
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGui_ImplOpenGL3_NewFrame();
  ResetFpuFlags(saved);
end;

procedure ImGui_Impl_OpenGL3_Shutdown();
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGui_ImplOpenGL3_Shutdown();
  ResetFpuFlags(saved);
end;



end.

