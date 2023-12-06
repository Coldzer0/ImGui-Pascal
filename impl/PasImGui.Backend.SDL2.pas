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

Unit PasImGui.Backend.SDL2;

{$IFDEF FPC}
  {$mode objfpc}{$H+}{$J-}
  {$PackRecords C}
{$ENDIF}
{$POINTERMATH ON}
{$Define SDL_HINT_IME_SHOW_UI}
{$Define SDL_HINT_MOUSE_AUTO_CAPTURE}
{$Define SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH}
{$Define SDL_HAS_CAPTURE_AND_GLOBAL_MOUSE}

Interface

Uses
  {$IfDef MSWINDOWS}
  Windows,
  {$EndIf}
  SDL2,
  PasImGui,
  PasImGui.Utils;

Function ImGui_ImplSDL2_InitForOpenGL_Pas(window: PSDL_Window;
  sdl_gl_context: Pointer): Boolean;
Function ImGui_ImplSDL2_ProcessEvent_Pas(event: PSDL_Event): Boolean;
Procedure ImGui_ImplSDL2_NewFrame_Pas();
Procedure ImGui_ImplSDL2_Shutdown_Pas();

Type
  PImGui_ImplSDL2_Data = ^ImGui_ImplSDL2_Data;

  ImGui_ImplSDL2_Data = Record
    Window: PSDL_Window;
    Renderer: PSDL_Renderer;
    Time: Uint64;
    MouseWindowID: Uint32;
    MouseButtonsDown: Integer;
    MouseCursors: Array [0..Ord(ImGuiMouseCursor_COUNT) - 1] Of PSDL_Cursor;
    LastMouseCursor: PSDL_Cursor;
    PendingMouseLeaveFrame: Integer;
    ClipboardTextData: Pansichar;
    MouseCanUseGlobalState: Boolean;
    MouseCanReportHoveredViewport: Boolean;
    UseVulkan: Boolean;
    WantUpdateMonitors: Boolean;
  End;

  PImGui_ImplSDL2_ViewportData = ^ImGui_ImplSDL2_ViewportData;

  ImGui_ImplSDL2_ViewportData = Record
    Window: PSDL_Window;
    WindowID: Uint32;
    WindowOwned: Boolean;
    GLContext: TSDL_GLContext;
  End;

Implementation

Uses
  SysUtils;

// Done
Function ImGui_ImplSDL2_GetBackendData(): PImGui_ImplSDL2_Data;
Begin
  If ImGui.GetCurrentContext() <> nil Then
    Result := PImGui_ImplSDL2_Data(ImGui.GetIO()^.BackendPlatformUserData)
  Else
    Result := nil;
End;

//--------------------------------------------------------------------------------------------------------
// MULTI-VIEWPORT / PLATFORM INTERFACE SUPPORT
// This is an _advanced_ and _optional_ feature, allowing the backend to create and handle multiple viewports simultaneously.
// If you are new to dear imgui or creating a new binding for dear imgui, it is recommended that you completely ignore this section first..
//--------------------------------------------------------------------------------------------------------

// Done
Procedure ImGui_ImplSDL2_CreateWindow(viewport: PImGuiViewport); Cdecl;
Var
  bd: PImGui_ImplSDL2_Data;
  main_viewport: PImGuiViewport;
  main_viewport_data, vd: PImGui_ImplSDL2_ViewportData;

  use_opengl: Boolean;
  backup_context: TSDL_GLContext;

  sdl_flags: Uint32;
  info: TSDL_SysWMinfo;
Begin
  Initialize(info);
  bd := ImGui_ImplSDL2_GetBackendData();
  vd := AllocMem(SizeOf(ImGui_ImplSDL2_ViewportData));
  viewport^.PlatformUserData := vd;

  main_viewport := ImGui.GetMainViewport();
  main_viewport_data := main_viewport^.PlatformUserData;
  // Share GL resources with main context
  use_opengl := (main_viewport_data^.GLContext <> nil);
  backup_context := nil;
  If use_opengl Then
  Begin
    backup_context := SDL_GL_GetCurrentContext();
    SDL_GL_SetAttribute(SDL_GL_SHARE_WITH_CURRENT_CONTEXT, 1);
    SDL_GL_MakeCurrent(main_viewport_data^.Window, main_viewport_data^.GLContext);
  End;

  sdl_flags := SDL_WINDOW_ALLOW_HIGHDPI;
  If use_opengl Then
    sdl_flags := sdl_flags Or SDL_WINDOW_OPENGL;

  { TODO: SDL Unit needs update - Time : 11/7/2023 7:26:01 PM }
  //if bd^.UseVulkan then
  //  sdl_flags := sdl_flags or SDL_WINDOW_VULKAN;

  sdl_flags := sdl_flags Or (SDL_GetWindowFlags(bd^.Window) And
    SDL_WINDOW_ALLOW_HIGHDPI);

  sdl_flags := sdl_flags Or SDL_WINDOW_HIDDEN;

  If (viewport^.Flags And ImGuiViewportFlags_NoDecoration) <> 0 Then
    sdl_flags := sdl_flags Or SDL_WINDOW_BORDERLESS
  Else
    sdl_flags := sdl_flags Or SDL_WINDOW_RESIZABLE;

  {$IfNDef MSWINDOWS}
  if (viewport^.Flags and ImGuiViewportFlags_NoTaskBarIcon) <> 0 then
    sdl_flags := sdl_flags or SDL_WINDOW_SKIP_TASKBAR;
  {$EndIf}

  If SDL_VERSION_ATLEAST(2, 0, 5) Then
  Begin
    If (viewport^.Flags And ImGuiViewportFlags_TopMost) <> 0 Then
      sdl_flags := sdl_flags Or SDL_WINDOW_ALWAYS_ON_TOP;
  End;


  vd^.Window := SDL_CreateWindow('No Title Yet', Trunc(viewport^.Pos.x),
    Trunc(viewport^.Pos.y), Trunc(viewport^.Size.x), Trunc(viewport^.Size.y),
    sdl_flags);

  vd^.WindowOwned := True;
  If use_opengl Then
  Begin
    vd^.GLContext := SDL_GL_CreateContext(vd^.Window);
    SDL_GL_SetSwapInterval(0);
  End;

  If use_opengl And (backup_context <> nil) Then
    SDL_GL_MakeCurrent(vd^.Window, backup_context);

  viewport^.PlatformHandle := vd^.Window;
  viewport^.PlatformHandleRaw := nil;

  FillChar(info, SizeOf(TSDL_SysWMinfo), 0);
  SDL_VERSION(info.version);
  If SDL_GetWindowWMInfo(vd^.window, @info) = SDL_TRUE Then
  Begin
    {$IfDef MSWINDOWS}
    viewport^.PlatformHandleRaw := {%H-}Pointer(info.win.window);
    {$ElseIf defined(DARWIN)}
    viewport^.PlatformHandleRaw = {%H-}
Pointer(info.cocoa.window);
    {$EndIf}
  End;
End;

// Done
Procedure ImGui_ImplSDL2_DestroyWindow(viewport: PImGuiViewport); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  If vd <> nil Then
  Begin
    If (vd^.GLContext <> nil) And vd^.WindowOwned Then
      SDL_GL_DeleteContext(vd^.GLContext);
    If (vd^.Window <> nil) And vd^.WindowOwned Then
      SDL_DestroyWindow(vd^.Window);

    vd^.GLContext := nil;
    vd^.Window := nil;
    Freemem(vd);
  End;
  viewport^.PlatformHandle := nil;
  viewport^.PlatformUserData := nil;
End;

// Done
Procedure ImGui_ImplSDL2_ShowWindow(viewport: PImGuiViewport); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
  {$IfDef MSWINDOWS}
  _hwnd: Windows.HWND;
  ex_style: LONG;
  {$EndIf}
Begin
  vd := viewport^.PlatformUserData;
  {$IfDef MSWINDOWS}
  _hwnd := {%H-}Windows.HWND(viewport^.PlatformHandleRaw);
  // SDL hack: Hide icon from task bar
  // Note: SDL 2.0.6+ has a SDL_WINDOW_SKIP_TASKBAR flag which is supported
  // under Windows but the way it create the window breaks our seamless transition.
  If (viewport^.Flags And ImGuiViewportFlags_NoTaskBarIcon) <> 0 Then
  Begin
    ex_style := GetWindowLong(_hwnd, GWL_EXSTYLE);
    ex_style := ex_style And Not WS_EX_APPWINDOW;
    ex_style := ex_style Or WS_EX_TOOLWINDOW;
    SetWindowLong(_hwnd, GWL_EXSTYLE, ex_style);
  End;
  // SDL hack: SDL always activate/focus windows :/
  If (viewport^.Flags And ImGuiViewportFlags_NoFocusOnAppearing) <> 0 Then
  Begin
    ShowWindow(_hwnd, SW_SHOWNA);
    Exit;
  End;
  {$EndIf}
  SDL_ShowWindow(vd^.Window);
End;

// Done
Function ImGui_ImplSDL2_GetWindowPos(viewport: PImGuiViewport): ImVec2; Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
  x, y: Integer;
Begin
  vd := viewport^.PlatformUserData;
  x := 0;
  y := 0;
  SDL_GetWindowPosition(vd^.Window, @x, @y);
  Result := ImVec2.New(Single(x), Single(y));
End;

// Done
Procedure ImGui_ImplSDL2_SetWindowPos(viewport: PImGuiViewport; pos: ImVec2); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  SDL_SetWindowPosition(vd^.Window, Trunc(pos.x), Trunc(pos.y));
End;

// Done
Function ImGui_ImplSDL2_GetWindowSize(viewport: PImGuiViewport): ImVec2; Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
  w, h: Integer;
Begin
  vd := viewport^.PlatformUserData;
  w := 0;
  h := 0;
  SDL_GetWindowSize(vd^.Window, @w, @h);
  Result := ImVec2.New(Single(w), Single(h));
End;

// Done
Procedure ImGui_ImplSDL2_SetWindowSize(viewport: PImGuiViewport; size: ImVec2); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  SDL_SetWindowSize(vd^.Window, Trunc(size.x), Trunc(size.y));
End;

// Done
Procedure ImGui_ImplSDL2_SetWindowTitle(viewport: PImGuiViewport; Const title: PAnsiChar); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  SDL_SetWindowTitle(vd^.Window, title);
End;

// Done
Procedure ImGui_ImplSDL2_SetWindowAlpha(viewport: PImGuiViewport; alpha: Single); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  SDL_SetWindowOpacity(vd^.Window, alpha);
End;

// Done
Procedure ImGui_ImplSDL2_SetWindowFocus(viewport: PImGuiViewport); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  SDL_RaiseWindow(vd^.Window);
End;

// Done
Function ImGui_ImplSDL2_GetWindowFocus(viewport: PImGuiViewport): Boolean; Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  Result := (SDL_GetWindowFlags(vd^.Window) And SDL_WINDOW_INPUT_FOCUS) <> 0;
End;

// Done
Function ImGui_ImplSDL2_GetWindowMinimized(viewport: PImGuiViewport): Boolean; Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  Result := (SDL_GetWindowFlags(vd^.Window) And SDL_WINDOW_MINIMIZED) <> 0;
End;

// Done
Procedure ImGui_ImplSDL2_RenderWindow(viewport: PImGuiViewport;
  {%H-}render_arg: Pointer); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  If vd^.GLContext <> nil Then
    SDL_GL_MakeCurrent(vd^.Window, vd^.GLContext);
End;

// Done
Procedure ImGui_ImplSDL2_SwapBuffers(viewport: PImGuiViewport;
  {%H-}render_arg: Pointer); Cdecl;
Var
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  vd := viewport^.PlatformUserData;
  If vd^.GLContext <> nil Then
  Begin
    SDL_GL_MakeCurrent(vd^.Window, vd^.GLContext);
    SDL_GL_SwapWindow(vd^.Window);
  End;
End;

// Done
Procedure ImGui_ImplSDL2_InitPlatformInterface(window: PSDL_Window;
  sdl_gl_context: Pointer);
Var
  platform_io: PImGuiPlatformIO;
  main_viewport: PImGuiViewport;
  vd: PImGui_ImplSDL2_ViewportData;
Begin
  platform_io := ImGui.GetPlatformIO();

  platform_io^.Platform_CreateWindow := @ImGui_ImplSDL2_CreateWindow;
  platform_io^.Platform_DestroyWindow := @ImGui_ImplSDL2_DestroyWindow;
  platform_io^.Platform_ShowWindow := @ImGui_ImplSDL2_ShowWindow;
  platform_io^.Platform_SetWindowPos := @ImGui_ImplSDL2_SetWindowPos;
  platform_io^.Platform_GetWindowPos := @ImGui_ImplSDL2_GetWindowPos;
  platform_io^.Platform_SetWindowSize := @ImGui_ImplSDL2_SetWindowSize;
  platform_io^.Platform_GetWindowSize := @ImGui_ImplSDL2_GetWindowSize;
  platform_io^.Platform_SetWindowFocus := @ImGui_ImplSDL2_SetWindowFocus;
  platform_io^.Platform_GetWindowFocus := @ImGui_ImplSDL2_GetWindowFocus;
  platform_io^.Platform_GetWindowMinimized := @ImGui_ImplSDL2_GetWindowMinimized;
  platform_io^.Platform_SetWindowTitle := @ImGui_ImplSDL2_SetWindowTitle;
  platform_io^.Platform_RenderWindow := @ImGui_ImplSDL2_RenderWindow;
  platform_io^.Platform_SwapBuffers := @ImGui_ImplSDL2_SwapBuffers;

  If SDL_VERSION_ATLEAST(2, 0, 5) Then
  Begin
    platform_io^.Platform_SetWindowAlpha := @ImGui_ImplSDL2_SetWindowAlpha;
  End;

  {$IfDef SDL_HAS_VULKAN}
  platform_io^.Platform_CreateVkSurface := ImGui_ImplSDL2_CreateVkSurface;
  {$EndIf}

  // Register main window handle (which is owned by the main application, not by us)
  // This is mostly for simplicity and consistency, so that our code (e.g. mouse handling etc.) can use same logic for main and secondary viewports.
  main_viewport := ImGui.GetMainViewport();
  vd := AllocMem(SizeOf(ImGui_ImplSDL2_ViewportData));
  vd^.Window := window;
  vd^.WindowID := SDL_GetWindowID(window);
  vd^.WindowOwned := False;
  vd^.GLContext := sdl_gl_context;
  main_viewport^.PlatformUserData := vd;
  main_viewport^.PlatformHandle := vd^.Window;
End;

// Done
Procedure ImGui_ImplSDL2_ShutdownPlatformInterface;
Begin
  ImGui.DestroyPlatformWindows();
End;

//------------------------------------------------------------------------------
// Frame Generation
//------------------------------------------------------------------------------

// Done
Function ImGui_ImplSDL2_GetClipboardText({%H-}user_data: Pointer): PAnsiChar; Cdecl;
Var
  bd: PImGui_ImplSDL2_Data;
Begin
  bd := ImGui_ImplSDL2_GetBackendData();
  If bd^.ClipboardTextData <> nil Then
    SDL_free(bd^.ClipboardTextData);

  bd^.ClipboardTextData := SDL_GetClipboardText();
  Result := bd^.ClipboardTextData;
End;

// Done
Procedure ImGui_ImplSDL2_SetClipboardText({%H-}user_data: Pointer; Const Text: PAnsiChar); Cdecl;
Begin
  SDL_SetClipboardText(Text);
End;

// Done
// Note: native IME will only display if user calls SDL_SetHint(SDL_HINT_IME_SHOW_UI, "1") _before_ SDL_CreateWindow().
Procedure ImGui_ImplSDL2_SetPlatformImeData(viewport: PImGuiViewport;
  Data: PImGuiPlatformImeData); Cdecl;
Var
  r: TSDL_Rect;
Begin
  If Data^.WantVisible Then
  Begin
    r.x := Trunc(Data^.InputPos.x - viewport^.Pos.x);
    r.y := Trunc(Data^.InputPos.y - viewport^.Pos.y + Data^.InputLineHeight);
    r.w := 1;
    r.h := Trunc(Data^.InputLineHeight);
    SDL_SetTextInputRect(@r);
  End;
End;

// Done
Function ImGui_ImplSDL2_KeycodeToImGuiKey(keycode: TSDL_KeyCode): ImGuiKey;
Begin
  Case keycode Of
    SDLK_TAB: Result := ImGuiKey_Tab;
    SDLK_LEFT: Result := ImGuiKey_LeftArrow;
    SDLK_RIGHT: Result := ImGuiKey_RightArrow;
    SDLK_UP: Result := ImGuiKey_UpArrow;
    SDLK_DOWN: Result := ImGuiKey_DownArrow;
    SDLK_PAGEUP: Result := ImGuiKey_PageUp;
    SDLK_PAGEDOWN: Result := ImGuiKey_PageDown;
    SDLK_HOME: Result := ImGuiKey_Home;
    SDLK_END: Result := ImGuiKey_End;
    SDLK_INSERT: Result := ImGuiKey_Insert;
    SDLK_DELETE: Result := ImGuiKey_Delete;
    SDLK_BACKSPACE: Result := ImGuiKey_Backspace;
    SDLK_SPACE: Result := ImGuiKey_Space;
    SDLK_RETURN: Result := ImGuiKey_Enter;
    SDLK_ESCAPE: Result := ImGuiKey_Escape;
    SDLK_QUOTE: Result := ImGuiKey_Apostrophe;
    SDLK_COMMA: Result := ImGuiKey_Comma;
    SDLK_MINUS: Result := ImGuiKey_Minus;
    SDLK_PERIOD: Result := ImGuiKey_Period;
    SDLK_SLASH: Result := ImGuiKey_Slash;
    SDLK_SEMICOLON: Result := ImGuiKey_Semicolon;
    SDLK_EQUALS: Result := ImGuiKey_Equal;
    SDLK_LEFTBRACKET: Result := ImGuiKey_LeftBracket;
    SDLK_BACKSLASH: Result := ImGuiKey_Backslash;
    SDLK_RIGHTBRACKET: Result := ImGuiKey_RightBracket;
    SDLK_BACKQUOTE: Result := ImGuiKey_GraveAccent;
    SDLK_CAPSLOCK: Result := ImGuiKey_CapsLock;
    SDLK_SCROLLLOCK: Result := ImGuiKey_ScrollLock;
    SDLK_NUMLOCKCLEAR: Result := ImGuiKey_NumLock;
    SDLK_PRINTSCREEN: Result := ImGuiKey_PrintScreen;
    SDLK_PAUSE: Result := ImGuiKey_Pause;
    SDLK_KP_0: Result := ImGuiKey_Keypad0;
    SDLK_KP_1: Result := ImGuiKey_Keypad1;
    SDLK_KP_2: Result := ImGuiKey_Keypad2;
    SDLK_KP_3: Result := ImGuiKey_Keypad3;
    SDLK_KP_4: Result := ImGuiKey_Keypad4;
    SDLK_KP_5: Result := ImGuiKey_Keypad5;
    SDLK_KP_6: Result := ImGuiKey_Keypad6;
    SDLK_KP_7: Result := ImGuiKey_Keypad7;
    SDLK_KP_8: Result := ImGuiKey_Keypad8;
    SDLK_KP_9: Result := ImGuiKey_Keypad9;
    SDLK_KP_PERIOD: Result := ImGuiKey_KeypadDecimal;
    SDLK_KP_DIVIDE: Result := ImGuiKey_KeypadDivide;
    SDLK_KP_MULTIPLY: Result := ImGuiKey_KeypadMultiply;
    SDLK_KP_MINUS: Result := ImGuiKey_KeypadSubtract;
    SDLK_KP_PLUS: Result := ImGuiKey_KeypadAdd;
    SDLK_KP_ENTER: Result := ImGuiKey_KeypadEnter;
    SDLK_KP_EQUALS: Result := ImGuiKey_KeypadEqual;
    SDLK_LCTRL: Result := ImGuiKey_LeftCtrl;
    SDLK_LSHIFT: Result := ImGuiKey_LeftShift;
    SDLK_LALT: Result := ImGuiKey_LeftAlt;
    SDLK_LGUI: Result := ImGuiKey_LeftSuper;
    SDLK_RCTRL: Result := ImGuiKey_RightCtrl;
    SDLK_RSHIFT: Result := ImGuiKey_RightShift;
    SDLK_RALT: Result := ImGuiKey_RightAlt;
    SDLK_RGUI: Result := ImGuiKey_RightSuper;
    SDLK_APPLICATION: Result := ImGuiKey_Menu;
    SDLK_0: Result := ImGuiKey_0;
    SDLK_1: Result := ImGuiKey_1;
    SDLK_2: Result := ImGuiKey_2;
    SDLK_3: Result := ImGuiKey_3;
    SDLK_4: Result := ImGuiKey_4;
    SDLK_5: Result := ImGuiKey_5;
    SDLK_6: Result := ImGuiKey_6;
    SDLK_7: Result := ImGuiKey_7;
    SDLK_8: Result := ImGuiKey_8;
    SDLK_9: Result := ImGuiKey_9;
    SDLK_a: Result := ImGuiKey_A;
    SDLK_b: Result := ImGuiKey_B;
    SDLK_c: Result := ImGuiKey_C;
    SDLK_d: Result := ImGuiKey_D;
    SDLK_e: Result := ImGuiKey_E;
    SDLK_f: Result := ImGuiKey_F;
    SDLK_g: Result := ImGuiKey_G;
    SDLK_h: Result := ImGuiKey_H;
    SDLK_i: Result := ImGuiKey_I;
    SDLK_j: Result := ImGuiKey_J;
    SDLK_k: Result := ImGuiKey_K;
    SDLK_l: Result := ImGuiKey_L;
    SDLK_m: Result := ImGuiKey_M;
    SDLK_n: Result := ImGuiKey_N;
    SDLK_o: Result := ImGuiKey_O;
    SDLK_p: Result := ImGuiKey_P;
    SDLK_q: Result := ImGuiKey_Q;
    SDLK_r: Result := ImGuiKey_R;
    SDLK_s: Result := ImGuiKey_S;
    SDLK_t: Result := ImGuiKey_T;
    SDLK_u: Result := ImGuiKey_U;
    SDLK_v: Result := ImGuiKey_V;
    SDLK_w: Result := ImGuiKey_W;
    SDLK_x: Result := ImGuiKey_X;
    SDLK_y: Result := ImGuiKey_Y;
    SDLK_z: Result := ImGuiKey_Z;
    SDLK_F1: Result := ImGuiKey_F1;
    SDLK_F2: Result := ImGuiKey_F2;
    SDLK_F3: Result := ImGuiKey_F3;
    SDLK_F4: Result := ImGuiKey_F4;
    SDLK_F5: Result := ImGuiKey_F5;
    SDLK_F6: Result := ImGuiKey_F6;
    SDLK_F7: Result := ImGuiKey_F7;
    SDLK_F8: Result := ImGuiKey_F8;
    SDLK_F9: Result := ImGuiKey_F9;
    SDLK_F10: Result := ImGuiKey_F10;
    SDLK_F11: Result := ImGuiKey_F11;
    SDLK_F12: Result := ImGuiKey_F12;
    Else
      Result := ImGuiKey_None;
  End;
End;

// Done
Procedure ImGui_ImplSDL2_UpdateKeyModifiers(sdl_key_mods: TSDL_KeyMod);
Begin
  ImGui.AddKeyEvent(ImGuiMod_Ctrl, (sdl_key_mods And KMOD_CTRL) <> 0);
  ImGui.AddKeyEvent(ImGuiMod_Shift, (sdl_key_mods And KMOD_SHIFT) <> 0);
  ImGui.AddKeyEvent(ImGuiMod_Alt, (sdl_key_mods And KMOD_ALT) <> 0);
  ImGui.AddKeyEvent(ImGuiMod_Super, (sdl_key_mods And KMOD_GUI) <> 0);
End;

// FIXME
Function ImGui_ImplSDL2_Init(window: PSDL_Window; renderer: PSDL_Renderer;
  sdl_gl_context: Pointer): Boolean;
Var
  io: PImGuiIO;
  bd: PImGui_ImplSDL2_Data;
  main_viewport: PImGuiViewport;
  mouse_can_use_global_state: Boolean;
  sdl_backend: Pansichar;
  I: Integer;
  info: TSDL_SysWMinfo;
Const
  global_mouse_whitelist: Array[0..4] Of
    Pansichar = ('windows', 'cocoa', 'x11', 'DIVE', 'VMAN');
Begin

  io := ImGui.GetIO();
  Assert(io^.BackendPlatformUserData = nil, 'Already initialized a platform backend!');

  // Check and store if we are on a SDL backend that supports global mouse position
  // ("wayland" and "rpi" don't support it, but we chose to use a white-list instead of a black-list)
  mouse_can_use_global_state := False;
  sdl_backend := SDL_GetCurrentVideoDriver();
  For I := 0 To High(global_mouse_whitelist) Do
  Begin
    If StrIComp(sdl_backend, global_mouse_whitelist[I]) = 0 Then
    Begin
      mouse_can_use_global_state := True;
      Break; // Break the loop early if a match is found
    End;
  End;
  // Setup backend capabilities flags
  bd := AllocMem(SizeOf(ImGui_ImplSDL2_Data));

  io^.BackendPlatformUserData := bd;
  io^.BackendPlatformName := PAnsiChar('imgui_impl_sdl2_pascal');

  // We can honor GetMouseCursor() values (optional)
  io^.BackendFlags := io^.BackendFlags Or ImGuiBackendFlags_HasMouseCursors;
  // We can honor io.WantSetMousePos requests (optional, rarely used)
  io^.BackendFlags := io^.BackendFlags Or ImGuiBackendFlags_HasSetMousePos;
  If mouse_can_use_global_state Then
  Begin
    // We can create multi-viewports on the Platform side (optional)
    io^.BackendFlags := io^.BackendFlags Or ImGuiBackendFlags_PlatformHasViewports;
  End;

  bd^.Window := window;
  bd^.Renderer := renderer;

  // SDL on Linux/OSX doesn't report events for unfocused windows (see https://github.com/ocornut/imgui/issues/4960)
  // We will use 'MouseCanReportHoveredViewport' to set 'ImGuiBackendFlags_HasMouseHoveredViewport' dynamically each frame.

  bd^.MouseCanUseGlobalState := mouse_can_use_global_state;
  {$IfnDef DARWIN}
  bd^.MouseCanReportHoveredViewport := bd^.MouseCanUseGlobalState;
  {$ELSE}
  bd^.MouseCanReportHoveredViewport := False;
  {$EndIf}
  bd^.WantUpdateMonitors := True;

  io^.SetClipboardTextFn := @ImGui_ImplSDL2_SetClipboardText;
  io^.GetClipboardTextFn := @ImGui_ImplSDL2_GetClipboardText;
  io^.ClipboardUserData := nil;
  io^.SetPlatformImeDataFn := @ImGui_ImplSDL2_SetPlatformImeData;

  // Load mouse cursors
  bd^.MouseCursors[ImGuiMouseCursor_Arrow] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_ARROW);
  bd^.MouseCursors[ImGuiMouseCursor_TextInput] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_IBEAM);
  bd^.MouseCursors[ImGuiMouseCursor_ResizeAll] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZEALL);
  bd^.MouseCursors[ImGuiMouseCursor_ResizeNS] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZENS);
  bd^.MouseCursors[ImGuiMouseCursor_ResizeEW] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZEWE);
  bd^.MouseCursors[ImGuiMouseCursor_ResizeNESW] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZENESW);
  bd^.MouseCursors[ImGuiMouseCursor_ResizeNWSE] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_SIZENWSE);
  bd^.MouseCursors[ImGuiMouseCursor_Hand] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_HAND);
  bd^.MouseCursors[ImGuiMouseCursor_NotAllowed] := SDL_CreateSystemCursor(SDL_SYSTEM_CURSOR_NO);

  main_viewport := ImGui.GetMainViewport();
  main_viewport^.PlatformHandle := window;
  main_viewport^.PlatformHandleRaw := nil;

  Initialize(info);
  SDL_VERSION(info.version);
  If SDL_GetWindowWMInfo(window, @info) = SDL_TRUE Then
  Begin
    {$IfDef MSWINDOWS}
    main_viewport^.PlatformHandleRaw := {%H-}Pointer(info.win.window);
    {$ElseIf defined(DARWIN)}
      main_viewport^.PlatformHandleRaw = Pointer(info.cocoa.window);
    {$EndIf}
  End;

  // From 2.0.5 only
  {$IfDef SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH}
  If SDL_VERSION_ATLEAST(2, 0, 5) Then
    SDL_SetHint(SDL_HINT_MOUSE_FOCUS_CLICKTHROUGH, '1');
  {$EndIf}


  // From 2.0.22: Disable auto-capture, this is preventing drag and drop across multiple windows (see #5710)
  {$IfDef SDL_HINT_IME_SHOW_UI}
  If SDL_VERSION_ATLEAST(2, 0, 22) Then
    SDL_SetHint(SDL_HINT_IME_SHOW_UI, '1');
  {$ENDIF}

  // From 2.0.22: Disable auto-capture, this is preventing drag and drop across multiple windows (see #5710)

  {$IfDef SDL_HINT_MOUSE_AUTO_CAPTURE}
  If SDL_VERSION_ATLEAST(2, 0, 22) Then
    SDL_SetHint(SDL_HINT_MOUSE_AUTO_CAPTURE, '0');
  {$EndIf}


  If ((io^.ConfigFlags And ImGuiConfigFlags_ViewportsEnable) <> 0) And
    ((io^.BackendFlags And ImGuiBackendFlags_PlatformHasViewports) <> 0) Then
  Begin
    ImGui_ImplSDL2_InitPlatformInterface(window, sdl_gl_context);
  End;

  Result := True;
End;

// Done
Function ImGui_ImplSDL2_InitForOpenGL_Pas(window: PSDL_Window;
  sdl_gl_context: Pointer): Boolean;
Begin
  Result := ImGui_ImplSDL2_Init(window, nil, sdl_gl_context);
End;

// FIXME: Note that doesn't update with DPI/Scaling
//  change only as SDL2 doesn't have an event for it (SDL3 has).
Procedure ImGui_ImplSDL2_UpdateMonitors;
Var
  platform_io: PImGuiPlatformIO;
  bd: PImGui_ImplSDL2_Data;
  display_count, n: Integer;
  monitor: ImGuiPlatformMonitor;
  r: TSDL_Rect;
  dpi: Single;
Begin
  bd := ImGui_ImplSDL2_GetBackendData();
  platform_io := ImGui.GetPlatformIO();


  bd^.WantUpdateMonitors := False;

  display_count := SDL_GetNumVideoDisplays();

  // Allocate Monitors Vector
  If platform_io^.Monitors.Data = nil Then
  Begin
    platform_io^.Monitors.Data := AllocMem(SizeOf(ImGuiPlatformMonitor) * 8);
    platform_io^.Monitors.Capacity := 8;
  End;

  For n := 0 To Pred(display_count) Do
  Begin
    FillChar(monitor, SizeOf(ImGuiPlatformMonitor), 0);

    SDL_GetDisplayBounds(n, @r);

    monitor.WorkPos := ImVec2.New(Single(r.x), Single(r.y));
    monitor.WorkSize := ImVec2.New(Single(r.w), Single(r.h));
    monitor.MainPos := monitor.WorkPos;
    monitor.MainSize := monitor.WorkSize;

    If SDL_VERSION_ATLEAST(2, 0, 5) Then
    Begin
      SDL_GetDisplayUsableBounds(n, @r);
      monitor.WorkPos := ImVec2.New(Single(r.x), Single(r.y));
      monitor.WorkSize := ImVec2.New(Single(r.w), Single(r.h));
    End;

    If SDL_VERSION_ATLEAST(2, 0, 4) Then
    Begin
      // FIXME-VIEWPORT: On MacOS SDL reports actual monitor DPI scale,
      //    ignoring OS configuration. We may want to set
      //  DpiScale to cocoa_window.backingScaleFactor here.
      dpi := 0.0;
      If Not Boolean(SDL_GetDisplayDPI(n, @dpi, nil, nil)) Then
        monitor.DpiScale := dpi / 96.0;
    End;
    monitor.PlatformHandle := {%H-}Pointer(UIntPtr(n));

    platform_io^.Monitors.Data[n] := monitor;
    Inc(platform_io^.Monitors.Size, 1);
  End;
End;

// Done
Procedure ImGui_ImplSDL2_UpdateMouseData;
Var
  bd: PImGui_ImplSDL2_Data;
  io: PImGuiIO;
  focused_window: PSDL_Window;
  is_app_focused: Boolean;
  mouse_x, mouse_y, window_x, window_y: Integer;
  mouse_viewport_id: ImGuiID;
  mouse_viewport: PImGuiViewport;
  mouse_btn: TSDL_bool;
  sdl_mouse_window: PSDL_Window;
Begin
  bd := ImGui_ImplSDL2_GetBackendData;
  io := ImGui.GetIO;

  // We forward mouse input when hovered or captured (via SDL_MOUSEMOTION) or when focused (below)

  {$IfDef SDL_HAS_CAPTURE_AND_GLOBAL_MOUSE}
  // SDL_CaptureMouse() let the OS know e.g. that our imgui drag outside the SDL window boundaries shouldn't e.g. trigger other operations outside
  mouse_btn := SDL_FALSE;
  If bd^.MouseButtonsDown <> 0 Then
    mouse_btn := SDL_TRUE;
  SDL_CaptureMouse(mouse_btn);

  focused_window := SDL_GetKeyboardFocus;
  is_app_focused := (focused_window <> nil) And
    ((bd^.Window = focused_window) Or
    (ImGui.FindViewportByPlatformHandle(focused_window) <> nil));
  {$ELSE}
  focused_window := bd^.Window;
  // SDL 2.0.3 and non-windowed systems: single-viewport only
  is_app_focused := (SDL_GetWindowFlags(bd^.Window) And SDL_WINDOW_INPUT_FOCUS) <> 0;
  {$EndIf}

  If is_app_focused Then
  Begin
    // (Optional) Set OS mouse position from Dear ImGui if requested (rarely used, only when ImGuiConfigFlags_NavEnableSetMousePos is enabled by user)
    If io^.WantSetMousePos Then
    Begin
      {$IfDef SDL_HAS_CAPTURE_AND_GLOBAL_MOUSE}
      If (io^.ConfigFlags And ImGuiConfigFlags_ViewportsEnable) <> 0 Then
        SDL_WarpMouseGlobal(Trunc(io^.MousePos.x), Trunc(io^.MousePos.y))
      Else
      {$EndIf}
        SDL_WarpMouseInWindow(bd^.Window, Trunc(io^.MousePos.x),
          Trunc(io^.MousePos.y));
    End;

    // (Optional) Fallback to provide mouse position when focused (SDL_MOUSEMOTION already provides this when hovered or captured)
    If bd^.MouseCanUseGlobalState And (bd^.MouseButtonsDown = 0) Then
    Begin
      // Single-viewport mode: mouse position in client window coordinates (io.MousePos is (0,0) when the mouse is on the upper-left corner of the app window)
      // Multi-viewport mode: mouse position in OS absolute coordinates (io.MousePos is (0,0) when the mouse is on the upper-left of the primary monitor)
      SDL_GetGlobalMouseState(@mouse_x, @mouse_y);
      If (io^.ConfigFlags And ImGuiConfigFlags_ViewportsEnable) = 0 Then
      Begin
        SDL_GetWindowPosition(focused_window, @window_x, @window_y);
        Dec(mouse_x, window_x);
        Dec(mouse_y, window_y);
      End;
      ImGui.AddMousePosEvent(Single(mouse_x), Single(mouse_y));
    End;
  End;

  // (Optional) When using multiple viewports: call io.AddMouseViewportEvent() with the viewport the OS mouse cursor is hovering.
  // If ImGuiBackendFlags_HasMouseHoveredViewport is not set by the backend, Dear ImGui will ignore this field and infer the information using its flawed heuristic.
  // - [!] SDL backend does NOT correctly ignore viewports with the _NoInputs flag.
  //       Some backend are not able to handle that correctly. If a backend report an hovered viewport that has the _NoInputs flag (e.g. when dragging a window
  //       for docking, the viewport has the _NoInputs flag in order to allow us to find the viewport under), then Dear ImGui is forced to ignore the value reported
  //       by the backend, and use its flawed heuristic to guess the viewport behind.
  // - [X] SDL backend correctly reports this regardless of another viewport behind focused and dragged from (we need this to find a useful drag and drop target).
  If (io^.BackendFlags And ImGuiBackendFlags_HasMouseHoveredViewport) <> 0 Then
  Begin
    mouse_viewport_id := 0;
    sdl_mouse_window := SDL_GetWindowFromID(bd^.MouseWindowID);
    If sdl_mouse_window <> nil Then
    Begin
      mouse_viewport := ImGui.FindViewportByPlatformHandle(sdl_mouse_window);
      If mouse_viewport <> nil Then
      Begin
        mouse_viewport_id := mouse_viewport^.ID;
      End;
    End;
    ImGui.AddMouseViewportEvent(mouse_viewport_id);
  End;
End;

// Done
Procedure ImGui_ImplSDL2_UpdateMouseCursor;
Var
  io: PImGuiIO;
  bd: PImGui_ImplSDL2_Data;
  imgui_cursor: ImGuiMouseCursor;
  expected_cursor: PSDL_Cursor;
Begin
  io := ImGui.GetIO;
  If (io^.ConfigFlags And ImGuiConfigFlags_NoMouseCursorChange) <> 0 Then
    Exit;

  bd := ImGui_ImplSDL2_GetBackendData;

  imgui_cursor := ImGui.GetMouseCursor;
  If io^.MouseDrawCursor Or (imgui_cursor = ImGuiMouseCursor_None) Then
  Begin
    // Hide OS mouse cursor if imgui is drawing it or if it wants no cursor
    SDL_ShowCursor(Ord(SDL_FALSE));
  End
  Else
  Begin
    // Show OS mouse cursor
    expected_cursor := bd^.MouseCursors[imgui_cursor];
    If expected_cursor = nil Then
      expected_cursor := bd^.MouseCursors[ImGuiMouseCursor_Arrow];

    If bd^.LastMouseCursor <> expected_cursor Then
    Begin
      SDL_SetCursor(expected_cursor);
      // SDL function doesn't have an early out (see #6113)
      bd^.LastMouseCursor := expected_cursor;
    End;
    SDL_ShowCursor(Ord(SDL_TRUE));
  End;
End;

{ TODO: Implement this ^_^ - Time : 11/8/2023 1:06:27 AM }
Procedure ImGui_ImplSDL2_UpdateGamepads;
Begin
  { TODO: Implement this :V - Time : 11/9/2023 5:12:29 PM }
End;

// Done
Procedure ImGui_ImplSDL2_NewFrame_Pas();
Var
  io: PImGuiIO;
  bd: PImGui_ImplSDL2_Data;
  w, h: Integer;
  display_w, display_h: Integer;
  frequency, current_time: Uint64;
Begin
  bd := ImGui_ImplSDL2_GetBackendData();
  Assert(bd <> nil, 'Did you call ImGui_ImplSDL2_Init()?');
  io := imgui.GetIO();

  // Setup display size (every frame to accommodate for window resizing)
  SDL_GetWindowSize(bd^.Window, @w, @h);
  If (SDL_GetWindowFlags(bd^.Window) And SDL_WINDOW_MINIMIZED) <> 0 Then
  Begin
    w := 0;
    h := 0;
  End;

  If bd^.Renderer <> nil Then
    SDL_GetRendererOutputSize(bd^.Renderer, @display_w, @display_h)
  Else
    SDL_GL_GetDrawableSize(bd^.Window, @display_w, @display_h);

  io^.DisplaySize := ImVec2.New(Single(w), Single(h));

  If (w > 0) And (h > 0) Then
    io^.DisplayFramebufferScale :=
      ImVec2.New(Single(display_w) / w, Single(display_h) / h);

  // Update monitors
  If bd^.WantUpdateMonitors Then
    ImGui_ImplSDL2_UpdateMonitors();

  // Setup time step (we don't use SDL_GetTicks() because it is using millisecond resolution)
  // (Accept SDL_GetPerformanceCounter() not returning a monotonically increasing value.
  // Happens in VMs and Emscripten, see #6189, #6114, #3644)
  frequency := SDL_GetPerformanceFrequency;
  current_time := SDL_GetPerformanceCounter;
  If current_time <= bd^.Time Then
    current_time := bd^.Time + 1;
  If bd^.Time > 0 Then
    io^.DeltaTime := Single(double(current_time - bd^.Time) / frequency)
  Else
    io^.DeltaTime := Single(1.0 / 60.0);
  bd^.Time := current_time;


  If ((bd^.PendingMouseLeaveFrame > 0) And (bd^.PendingMouseLeaveFrame >=
    ImGui.GetFrameCount()) And (bd^.MouseButtonsDown = 0)) Then
  Begin
    bd^.MouseWindowID := 0;
    bd^.PendingMouseLeaveFrame := 0;
    ImGui.AddMousePosEvent(-FLT_MAX, -FLT_MAX);
  End;

  // Our io.AddMouseViewportEvent() calls will only be valid when not capturing.
  // Technically speaking testing for 'bd->MouseButtonsDown == 0' would be more rygorous,
  // but testing for payload reduces noise and potential side-effects.
  If (bd^.MouseCanReportHoveredViewport And (ImGui.GetDragDropPayload() = nil)) Then
    io^.BackendFlags := io^.BackendFlags Or ImGuiBackendFlags_HasMouseHoveredViewport
  Else
    io^.BackendFlags := io^.BackendFlags And Not
      ImGuiBackendFlags_HasMouseHoveredViewport;


  ImGui_ImplSDL2_UpdateMouseData();
  ImGui_ImplSDL2_UpdateMouseCursor();

  // Update game controllers (if enabled and available)
  ImGui_ImplSDL2_UpdateGamepads();
End;

// Done
Procedure ImGui_ImplSDL2_Shutdown_Pas();
Var
  platform_io: PImGuiPlatformIO;
  bd: PImGui_ImplSDL2_Data;
  io: PImGuiIO;
  cursor_n: Integer;
Begin
  bd := ImGui_ImplSDL2_GetBackendData();
  Assert(bd <> nil, 'No platform backend to shutdown, or already shutdown?');
  io := imgui.GetIO();

  ImGui_ImplSDL2_ShutdownPlatformInterface();

  If bd^.ClipboardTextData <> nil Then
    SDL_free(bd^.ClipboardTextData);

  For cursor_n := 0 To Pred(ImGuiMouseCursor_COUNT) Do
  Begin
    SDL_FreeCursor(bd^.MouseCursors[cursor_n]);
  End;

  bd^.LastMouseCursor := nil;

  io^.BackendPlatformName := nil;
  io^.BackendPlatformUserData := nil;

  io^.BackendFlags := io^.BackendFlags And Not
    (ImGuiBackendFlags_HasMouseCursors Or ImGuiBackendFlags_HasSetMousePos Or
    ImGuiBackendFlags_HasGamepad Or ImGuiBackendFlags_PlatformHasViewports Or
    ImGuiBackendFlags_HasMouseHoveredViewport);

  // Free Allocated Monitors
  platform_io := ImGui.GetPlatformIO();
  platform_io^.Monitors.Size := 0;
  platform_io^.Monitors.Capacity := 0;
  Freemem(platform_io^.Monitors.Data);
  platform_io^.Monitors.Data := nil;

  Freemem(bd);
End;

// Done
Function ImGui_ImplSDL2_ProcessEvent_Pas(event: PSDL_Event): Boolean;
Var
  ImKey: ImGuiKey;
  mouse_pos: ImVec2;
  window_x, window_y: Integer;
  wheel_x, wheel_y: Single;
  MouseSrc: ImGuiMouseSource;
  mouse_button: Integer;

  bd: PImGui_ImplSDL2_Data;
  io: PImGuiIO;
  window_event: Uint8;
  viewport: PImGuiViewport;
Begin
  Result := False;
  io := ImGui.GetIO();
  bd := ImGui_ImplSDL2_GetBackendData();
  Case event^.type_ Of
    SDL_MOUSEMOTION:
    Begin
      mouse_pos := ImVec2.New(Single(event^.motion.x), Single(event^.motion.y));
      If Int64(io^.ConfigFlags And ImGuiConfigFlags_ViewportsEnable) <> 0 Then
      Begin
        SDL_GetWindowPosition(SDL_GetWindowFromID(event^.motion.windowID),
          @window_x, @window_y);
        mouse_pos.x := mouse_pos.x + window_x;
        mouse_pos.y := mouse_pos.y + window_y;
      End;

      If event^.motion.which = SDL_TOUCH_MOUSEID Then
        ImGui.AddMouseSourceEvent(ImGuiMouseSource_TouchScreen)
      Else
        ImGui.AddMouseSourceEvent(ImGuiMouseSource_Mouse);

      ImGui.AddMousePosEvent(mouse_pos.x, mouse_pos.y);
      Result := True;
    End;
    SDL_MOUSEWHEEL:
    Begin
      wheel_x := -Single(event^.wheel.x);
      wheel_y := Single(event^.wheel.y);

      If event^.wheel.which = SDL_TOUCH_MOUSEID Then
        MouseSrc := ImGuiMouseSource_TouchScreen
      Else
        MouseSrc := ImGuiMouseSource_Mouse;
      ImGui.AddMouseSourceEvent(MouseSrc);

      ImGui.AddMouseWheelEvent(wheel_x, wheel_y);
      Result := True;
    End;
    SDL_MOUSEBUTTONDOWN, SDL_MOUSEBUTTONUP:
    Begin
      mouse_button := -1;
      If (event^.button.button = SDL_BUTTON_LEFT) Then
        mouse_button := 0;
      If (event^.button.button = SDL_BUTTON_RIGHT) Then
        mouse_button := 1;
      If (event^.button.button = SDL_BUTTON_MIDDLE) Then
        mouse_button := 2;
      If (event^.button.button = SDL_BUTTON_X1) Then
        mouse_button := 3;
      If (event^.button.button = SDL_BUTTON_X2) Then
        mouse_button := 4;
      If (mouse_button = -1) Then
        Exit;

      If event^.wheel.which = SDL_TOUCH_MOUSEID Then
        MouseSrc := ImGuiMouseSource_TouchScreen
      Else
        MouseSrc := ImGuiMouseSource_Mouse;
      ImGui.AddMouseSourceEvent(MouseSrc);

      ImGui.AddMouseButtonEvent(mouse_button, (event^.type_ = SDL_MOUSEBUTTONDOWN));

      If (event^.type_ = SDL_MOUSEBUTTONDOWN) Then
        bd^.MouseButtonsDown := bd^.MouseButtonsDown Or (1 Shl mouse_button)
      Else
        bd^.MouseButtonsDown := bd^.MouseButtonsDown And Not (1 Shl mouse_button);
      Result := True;
    End;
    SDL_TEXTINPUT:
    Begin
      ImGui.AddInputCharactersUTF8(event^.Text.Text);
      Result := True;
    End;
    SDL_KEYDOWN, SDL_KEYUP:
    Begin
      ImGui_ImplSDL2_UpdateKeyModifiers(event^.key.keysym.mod_);
      ImKey := ImGui_ImplSDL2_KeycodeToImGuiKey(event^.key.keysym.sym);
      ImGui.AddKeyEvent(ImKey, (event^.type_ = SDL_KEYDOWN));
      // To support legacy indexing (<1.87 user code). Legacy backend uses SDLK_*** as indices to IsKeyXXX() functions.
      ImGui.SetKeyEventNativeData(ImKey, event^.key.keysym.sym,
        event^.key.keysym.scancode, event^.key.keysym.scancode);
      Result := True;
    End;
    // SDL_VERSION_ATLEAST(2,0,9) >> SDL_DISPLAYEVENT
    SDL_DISPLAYEVENT:
    Begin
      bd^.WantUpdateMonitors := True;
      Result := True;
    End;
    SDL_WINDOWEVENT:
    Begin
      // - When capturing mouse, SDL will send a bunch of conflicting LEAVE/ENTER
      //    event on every mouse move, but the final ENTER tends to be right.
      // - However we won't get a correct LEAVE event for a captured window.
      // - In some cases, when detaching a window from main viewport SDL may
      //   send SDL_WINDOWEVENT_ENTER one frame too late,
      //   causing SDL_WINDOWEVENT_LEAVE on previous frame to interrupt drag
      //   operation by clear mouse position. This is why
      //   we delay process the SDL_WINDOWEVENT_LEAVE events by one frame.
      //   See issue #5012 for details.

      window_event := event^.window.event;
      If window_event = SDL_WINDOWEVENT_ENTER Then
      Begin
        bd^.MouseWindowID := event^.window.windowID;
        bd^.PendingMouseLeaveFrame := 0;
      End;

      If window_event = SDL_WINDOWEVENT_LEAVE Then
        bd^.PendingMouseLeaveFrame := ImGui.GetFrameCount() + 1;

      If window_event = SDL_WINDOWEVENT_FOCUS_GAINED Then
        ImGui.AddFocusEvent(True)
      Else If window_event = SDL_WINDOWEVENT_FOCUS_LOST Then
        ImGui.AddFocusEvent(False);

      If (window_event = SDL_WINDOWEVENT_CLOSE) Or (window_event =
        SDL_WINDOWEVENT_MOVED) Or (window_event = SDL_WINDOWEVENT_RESIZED) Then
      Begin
        viewport := ImGui.FindViewportByPlatformHandle(
          SDL_GetWindowFromID(event^.window.windowID));
        If viewport <> nil Then
        Begin
          If window_event = SDL_WINDOWEVENT_CLOSE Then
            viewport^.PlatformRequestClose := True;
          If window_event = SDL_WINDOWEVENT_MOVED Then
            viewport^.PlatformRequestMove := True;
          If window_event = SDL_WINDOWEVENT_RESIZED Then
            viewport^.PlatformRequestResize := True;
          Exit(True);
        End;
      End;
      Result := True;
    End;
    Else
      Result := False;
  End;
End;

End.
