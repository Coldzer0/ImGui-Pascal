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

Program ImGui_SDL2_OpenGL3_Demo;
{$IFDEF FPC}
  {$mode objfpc}{$H+}{$J-}
{$ENDIF}
{$IfDef LINUX}
  {$IfDef FPC}
    {$LinkLib m}
  {$EndIf}
{$EndIf}
{$IfOpt D-}
  {$IfDef MSWINDOWS}
    {$AppType GUI}
  {$EndIf}
{$ELSE}
{$IfDef MSWINDOWS}
{$AppType console}
{$EndIf}
{$EndIf}


Uses
  {$IFDEF FPC}
  cmem,
  {$ENDIF}
  Math,
  SysUtils,
  sdl2,
  glad_gl,
  PasImGui,
  PasImGui.Utils,
  PasImGui.ImPlot,
  PasImGui.Backend.SDL2,
  PasImGui.Renderer.OpenGL3,
  TestWindow, CustomNodeGraph;

Var
  counter: Integer;
  ShowPascalDemoWindow: Boolean = False;
  ShowAnotherWindow: Boolean = False;
  ShowDemoWindow: Boolean = False;
  ShowNodeWindow: Boolean = False;
  ShowImPlotDemo: Boolean = False;
  ShowImPlotPascalDemo: Boolean = False;
  clearColor: ImVec4;

Var
  ImGuiCtx: PImGuiContext;
  IO: PImGuiIO;
  style : PImGuiStyle;
  quit: Boolean;
  window: PSDL_Window;
  e: TSDL_Event;
  testwin: TTestWindow;
  backup_current_window: PSDL_Window;
  backup_current_context: TSDL_GLContext;
  current: TSDL_DisplayMode;
  flags: Longword;
  gl_context: TSDL_GLContext;
  w, h: Integer;
  glsl_version: PAnsiChar = '';

  // LinePlots
  var
    xs1, ys1 : Array [0..1000] of Single;
    xs2, ys2 : Array [0..19] of Double;

  procedure ImPlotPascalDemoWindow();
  var
    i: Integer;
  begin
    if not ImGui.Begin_('ImPlot Pascal Demo') then
    begin
      ImGui.End_();
      exit;
    end;
    for i := 0 to Pred(1001) do
    begin
      xs1[i] := i * 0.001;
      ys1[i] := 0.5 + 0.5 * Sin(50 * (xs1[i] + ImGui.GetTime() / 10));
    end;
    for i := 0 to Pred(20) do
    begin
      xs2[i] := i * 1/19.0;
      ys2[i] := xs2[i] * xs2[i];
    end;
    if (ImPlot.BeginPlot('Line Plots')) then
    begin
      ImPlot.SetupAxes('x','y');
      ImPlot.PlotLine('f(x)', PSingle(@xs1), PSingle(@ys1), 1001);
      ImPlot.SetNextMarkerStyle(ImPlotMarker_Circle);
      ImPlot.PlotLine('g(x)', PDouble(@xs2), PDouble(@ys2), 20, ImPlotLineFlags_Segments);
      ImPlot.EndPlot();
    end;
    ImGui.End_();
  end;

  Procedure ShowGreetingWindows;
  Var
    draw_list: PImDrawList;
    pos: ImVec2;
  Const
    HelloPascal: PAnsiChar = ' Hello From FreePascal / Delphi ';
  Begin
    Begin
      //ImGui.SetWindowPos(ImVec2.New(100, 100), ImGuiCond_FirstUseEver);
      ImGui.SetNextWindowPosCenter(ImGuiCond_FirstUseEver);
      If Not ImGui.Begin_('Greeting') Then
      Begin
        // Early out if the window is collapsed, as an optimization.
        ImGui.End_;
        exit;
      End;
      ImGui.Text('Hello, world %d', [counter]);
      If ImGui.Button('Add') Then
      Begin
        //button was pressed, do something special!
        Inc(counter);
      End;
      If ImGui.IsItemHovered(ImGuiHoveredFlags_RectOnly) Then
      Begin
        ImGui.SameLine();
        ImGui.Text('button hovered');
      End;

      ImGui.SameLine();
      pos := ImGui.GetCursorScreenPos();

      draw_list := ImGui.GetWindowDrawList();
      draw_list^.AddRectFilled(pos, ImVec2.New(pos.x + 50, pos.y + 20), $88000055);

      pos := ImVec2.New(pos.x + 50 + 20, pos.y);
      ImGui.SetCursorScreenPos(pos);

      draw_list^.AddRectFilled(pos, ImVec2.New(pos.x +
        ImGui.CalcTextSize(HelloPascal).x, pos.y + Trunc(ImGui.GetFont()^.EllipsisWidth * 2)), $88005500);
      ImGui.Text(HelloPascal);

      If ImGui.IsWindowHovered() Then
        ImGui.Text('window hovered')
      Else If ImGui.IsWindowHovered(ImGuiHoveredFlags_AnyWindow) Then
        ImGui.Text('some window hovered');
      ImGui.End_;
    End;

    Pos := ImGui.GetCenterViewPort(ImGui.GetMainViewport());
    Pos.y := Pos.y + 100;
    ImGui.SetNextWindowPos(Pos, ImGuiCond_FirstUseEver, ImVec2.New(0.5, 0.5));
    Begin
      ImGui.Begin_('Another greeting', @showAnotherWindow);
      ImGui.Text('Hello, next world %d', [counter]);
      If ImGui.Button('Not OK!') Then
      Begin
        Dec(counter);
      End;
      ImGui.End_;
    End;
  End;
  var
    GlobalStyleInitalized : Boolean = False;
    color_for_text, color_for_head, color_for_area, color_for_body, color_for_pops: ImVec3;
  Procedure RenderPascalCode();
  Var
    Pos: ImVec2;
  begin
    if not GlobalStyleInitalized then
    begin
      color_for_text := ImVec3.New(236.0 / 255.0, 240.0 / 255.0, 241.0 / 255.0);
      color_for_head := ImVec3.New(41.0 / 255.0, 128.0 / 255.0, 185.0 / 255.0);
      color_for_area := ImVec3.New(57.0 / 255.0, 79.0 / 255.0, 105.0 / 255.0);
      color_for_body := ImVec3.New(44.0 / 255.0, 62.0 / 255.0, 80.0 / 255.0);
      color_for_pops := ImVec3.New(33.0 / 255.0, 46.0 / 255.0, 60.0 / 255.0);
      GlobalStyleInitalized := True;
    end;
    //draw your scene or simple windows
    Pos := ImGui.GetCenterViewPort(ImGui.GetMainViewport());
    Pos.y := Pos.y - 160;
    ImGui.SetNextWindowPos(Pos, ImGuiCond_FirstUseEver, ImVec2.New(0.5, 0.5));
    Begin
      ImGui.Begin_('Hello From FreePascal / Delphi', nil, ImGuiWindowFlags_None);
      ImGui.Text('This is some useful text');

      ImGui.Checkbox('ImGui Demo', @showDemoWindow); ImGui.SameLine();
      ImGui.Checkbox('ImPlot Demo', @ShowImPlotDemo);
      ImGui.Checkbox('ImPlot Pascal Demo', @ShowImPlotPascalDemo);
      ImGui.Checkbox('Pascal Node Window', @showNodeWindow);
      ImGui.Checkbox('Pascal Demo Window', @showPascalDemoWindow);
      ImGui.Checkbox('Another Pascal window', @showAnotherWindow);

      ImGui.Spacing();
      ImGui.Separator();
      ImGui.Text('Global Styling Test');
      ImGui.NewLine();

      ImGui.ColorEdit3('color_for_text', @color_for_text);
      ImGui.ColorEdit3('color_for_head', @color_for_head);
      ImGui.ColorEdit3('color_for_area', @color_for_area);
      ImGui.ColorEdit3('color_for_body', @color_for_body);
      ImGui.ColorEdit3('color_for_pops', @color_for_pops);

      //If (ImGui.Button('Apply')) Then
      //begin
         imgui_easy_theming(color_for_text, color_for_head, color_for_area, color_for_body, color_for_pops);
      //end;

      ImGui.NewLine();
      ImGui.Separator();

      ImGui.ColorEdit3('Background color', @clearColor);

      If (ImGui.Button('Add')) Then
      begin
         Inc(counter);
      end;

      ImGui.SameLine(0.0, -1.0);
      ImGui.Text('counter = %d', [counter]);

      ImGui.Text('Application average %.3f ms/frame (%.f FPS)',
        [1000.0 / IO^.Framerate, IO^.Framerate]);

      ImGui.End_();
    End;

    If showAnotherWindow Then
    Begin
      ShowGreetingWindows;
    End;

    If showDemoWindow Then
    Begin
      ImGui.ShowDemoWindow(@showDemoWindow);
    End;
  End;

  Function PasAllocMem(sz: NativeUInt; {%H-}user_data: Pointer): Pointer; Cdecl;
  Begin
    Result := {$IFDEF FPC}cmem.Malloc(sz);{$ELSE}AllocMem(sz);{$ENDIF}
  End;

  Procedure PasFreeMem(ptr: Pointer; {%H-}user_data: Pointer); Cdecl;
  Begin
    {$IFDEF FPC}cmem.Free(ptr);{$ELSE}FreeMem(ptr);{$ENDIF}
  End;


  {$R *.res}

Begin
  { TODO: This is here for testing - Remove this later :V }
  //DeleteFile('MyApp.ini');

  // Set the Default Alloc & Free to point to Pascal Allocators
  igSetAllocatorFunctions(@PasAllocMem, @PasFreeMem, nil);

  //prevent SDL from raising a debugger exception to name threads
  SDL_SetHint(SDL_HINT_WINDOWS_DISABLE_THREAD_NAMING, '1');

  //open new SDL window with OpenGL rendering support
  If SDL_Init(SDL_INIT_VIDEO or SDL_INIT_TIMER) < 0 Then
  Begin
    if IsConsole then
      Writeln(Format('failed to init: %s', [SDL_GetError()]));
  End;

  // Decide GL+GLSL versions
  {$IfDef DARWIN}
  // GL 3.2 Core + GLSL 150
  // Always required on Mac
  glsl_version = '#version 150';
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_FLAGS, SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 2);
  {$ELSE}
  // GL 4.1 uses GLSL 4.10
  glsl_version := '#version 410';
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_FLAGS, 0);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MAJOR_VERSION, 3);
  SDL_GL_SetAttribute(SDL_GL_CONTEXT_MINOR_VERSION, 0);
  {$EndIf}

  // From 2.0.18: Enable native IME.
  SDL_SetHint(SDL_HINT_IME_SHOW_UI, '1');

  SDL_SetHint(SDL_HINT_RENDER_DRIVER, 'opengl');
  SDL_GL_SetAttribute(SDL_GL_DEPTH_SIZE, 24);
  SDL_GL_SetAttribute(SDL_GL_STENCIL_SIZE, 8);
  SDL_GL_SetAttribute(SDL_GL_DOUBLEBUFFER, 1);
  SDL_GetCurrentDisplayMode(0, @current);

  flags := SDL_WINDOW_OPENGL Or SDL_WINDOW_RESIZABLE Or SDL_WINDOW_ALLOW_HIGHDPI;
  //flags := flags or SDL_WINDOW_FULLSCREEN_DESKTOP;

  h := 720;
  w := 1280;
  window := SDL_CreateWindow('Hello From FreePascal / Delphi (SDL2+OpenGL3)', SDL_WINDOWPOS_CENTERED,
    SDL_WINDOWPOS_CENTERED, w, h, flags);
  If window = nil Then
  Begin
    raise Exception.Create(Format('Failed to create window: %s', [SDL_GetError()]));
    halt;
  End;

  gl_context := SDL_GL_CreateContext(window);
  SDL_GL_SetSwapInterval(1); //enable VSync

  // setup imgui
  ImGui.CreateContext(nil);

  // Setup ImPlot
  ImPlot.Initialize();

  //set docking
  IO := ImGui.GetIO();

  // Ini Config File name
  IO^.IniFilename := 'MyApp.ini';

  // Enable Logging
  ImGuiCtx := ImGui.GetCurrentContext();
  ImGuiCtx^.LogType := ImGuiLogType_TTY;
  ImGuiCtx^.LogEnabled := True;

  // Enable Keyboard Controls
  IO^.ConfigFlags := IO^.ConfigFlags Or ImGuiConfigFlags_NavEnableKeyboard;
  // Enable Docking
  IO^.ConfigFlags := IO^.ConfigFlags Or ImGuiConfigFlags_DockingEnable;
  // Enable Multi-Viewport / Platform Windows
  IO^.ConfigFlags := IO^.ConfigFlags Or ImGuiConfigFlags_ViewportsEnable;


  // Init ImGui SDL2 OpenGL using Pure Pascal
  ImGui_ImplSDL2_InitForOpenGL_Pas(window, gl_context);
  ImGui_OpenGL3_Init(glsl_version);


  { uncomment to set a different gui theme }
  SetupImGuiStyle2(); // Using imgui_easy_theming
  //Imgui.StyleColorsDark(nil);
  //Imgui.StyleColorsLight(ImGui.GetStyle());

  // When viewports are enabled we tweak WindowRounding/WindowBg
  //  so platform windows can look identical to regular ones.
  If (IO^.ConfigFlags And ImGuiConfigFlags_ViewportsEnable) <> 0 Then
  begin
    style := ImGui.GetStyle();
    style^.WindowRounding := 0.0;
    style^.Colors[ImGuiCol_WindowBg].w := 1.0;
  end;

  // Load Fonts
  //IO^.Fonts^.AddFontDefault();
  IO^.Fonts^.AddFontFromFileTTF('fonts/DroidSans.ttf', 25.0);
  IO^.Fonts^.AddFontFromFileTTF('fonts/JetBrainsMonoNerdFontPropo-Italic.ttf ', 28.0);

  // Background Color
  clearColor.x := 0.45;
  clearColor.y := 0.55;
  clearColor.z := 0.60;
  clearColor.w := 1.00;

  testwin := TTestWindow.Create;
  counter := 0;
  quit := False;
  While Not quit Do
  Begin
    //handle input
    While SDL_PollEvent(@e) <> 0 Do
    Begin
      ImGui_ImplSDL2_ProcessEvent_Pas(@e);
      If e.type_ = SDL_QUITEV Then
        quit := True;
      If (e.type_ = SDL_WINDOWEVENT) And (e.window.event = SDL_WINDOWEVENT_CLOSE) And
        (e.window.windowID = SDL_GetWindowID(window)) Then
        quit := True;
    End;

    // start imgui frame
    ImGui_OpenGL3_NewFrame();
    ImGui_ImplSDL2_NewFrame_Pas();
    ImGui.NewFrame();

    // Main UI Code
    Begin
      RenderPascalCode();
      if showNodeWindow then
        ShowExampleAppCustomNodeGraph(@showNodeWindow);
      If showPascalDemoWindow Then
        testwin.Show(showPascalDemoWindow);
      if ShowImPlotDemo then
        ImPlot_ShowDemoWindow(@ShowImPlotDemo);
      if ShowImPlotPascalDemo then
        ImPlotPascalDemoWindow();
    End;

    // render
    ImGui.Render();
    SDL_GL_MakeCurrent(window, gl_context);

    glViewport(0, 0, Trunc(IO^.DisplaySize.x), Trunc(IO^.DisplaySize.y));
    glClearColor(clearColor.x, clearColor.y, clearColor.z, clearColor.w);
    glClear(GL_COLOR_BUFFER_BIT);
    ImGui_OpenGL3_RenderDrawData(ImGui.GetDrawData());


    // IMGUI_DOCK
    If (IO^.ConfigFlags And ImGuiConfigFlags_ViewportsEnable) <> 0 Then
    Begin
      backup_current_window := SDL_GL_GetCurrentWindow();
      backup_current_context := SDL_GL_GetCurrentContext();
      ImGui.UpdatePlatformWindows();
      ImGui.RenderPlatformWindowsDefault(nil, nil);
      SDL_GL_MakeCurrent(backup_current_window, backup_current_context);
    End;

    //show frame on display
    SDL_GL_SwapWindow(window);
    //Assert(glGetError() = GL_NO_ERROR);
  End;
  testwin.Free;

  // clean up
  ImGui_OpenGL3_Shutdown();
  ImGui_ImplSDL2_Shutdown_Pas();
  ImGui.DestroyContext(nil);

  SDL_GL_DeleteContext(gl_context);
  If window <> nil Then
  Begin
    SDL_DestroyWindow(window);
    window := nil;
  End;
  SDL_Quit();
End.

