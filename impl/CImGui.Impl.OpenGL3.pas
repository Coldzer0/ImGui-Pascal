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

unit CImGui.Impl.OpenGL3;

{$IfDef FPC}
  {$mode objfpc}{$H+}
{$EndIf}

Interface

Uses
  PasImGui.Types,
  PasImGui.Apis;


function  ImGui_Impl_OpenGL3_Init(const glsl_version : PAnsiChar = nil) : Boolean;
Procedure ImGui_Impl_OpenGL3_RenderDrawData(draw_data : PImDrawData);
Procedure ImGui_Impl_OpenGL3_NewFrame();
Procedure ImGui_Impl_OpenGL3_Shutdown();

implementation

function  ImGui_ImplOpenGL3_Init(const glsl_version : PAnsiChar = nil) : Boolean; cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_Shutdown(); cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_NewFrame(); cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_RenderDrawData(draw_data : PImDrawData); cdecl; external CIMGUI_LIB;

// (Optional) Called by Init/NewFrame/Shutdown
function  ImGui_ImplOpenGL3_CreateFontsTexture(): Boolean; cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_DestroyFontsTexture(); cdecl; external CIMGUI_LIB;
function  ImGui_ImplOpenGL3_CreateDeviceObjects(): Boolean; cdecl; external CIMGUI_LIB;
Procedure ImGui_ImplOpenGL3_DestroyDeviceObjects(); cdecl; external CIMGUI_LIB;

function ImGui_Impl_OpenGL3_Init(const glsl_version: PAnsiChar): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := ImGui_ImplOpenGL3_Init(glsl_version);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
end;

procedure ImGui_Impl_OpenGL3_RenderDrawData(draw_data: PImDrawData);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGui_ImplOpenGL3_RenderDrawData(draw_data);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
end;

procedure ImGui_Impl_OpenGL3_NewFrame();
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGui_ImplOpenGL3_NewFrame();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
end;

procedure ImGui_Impl_OpenGL3_Shutdown();
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGui_ImplOpenGL3_Shutdown();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
end;



end.

