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

unit OpenGl3.Loader;

{$IFDEF FPC}
  {$mode objfpc}{$H+}{$J-}
{$ENDIF}


interface

uses
  glad_gl, {$IfDef SDL2}SDL2{$EndIf}{$IfDef GLFW3}GLFW3{$EndIf};

function ImGLInit(): Boolean;

implementation

Function GLFuncLoad(proc: PAnsiChar): Pointer;
Begin
  Result := {$IfDef GLFW3}glfwGetProcAddress{$ELSE}SDL_GL_GetProcAddress{$EndIf}(proc);
  Assert(Result <> nil, 'couldn''t load ' + proc);
End;

function ImGLInit(): Boolean;
begin
  Result := gladLoadGL(@GLFuncLoad);
end;

end.

