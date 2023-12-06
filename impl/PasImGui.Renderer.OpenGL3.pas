Unit PasImGui.Renderer.OpenGL3;
{$I ImGuiPasDef.inc}
{$IFDEF FPC}
  {$mode Delphi}{$H+}
{$ENDIF}
{$POINTERMATH ON}

// Debugging
{$IfOpt D+}
  {$If Defined(FPC) or Defined(DelphiXEAndUp)}
    {$Define IMGUI_LOG}
  {$EndIf}
{$EndIf}


// Specific OpenGL ES versions
//{$Define IMGUI_OPENGL_ES2}
//{$Define IMGUI_OPENGL_ES3}

{$If not Defined(IMGUI_OPENGL_ES2) and not Defined(IMGUI_OPENGL_ES3)}
  {$If (Defined(DARWIN) or Defined(IOS)) or Defined(Android)}
    {$Define IMGUI_OPENGL_ES3}
  {$ElseIf defined(AMIGA)}
    {$Define IMGUI_OPENGL_ES2}
  {$EndIf}
{$EndIf}
//{$Define IMGUI_OPENGL_LOADER_CUSTOM} // If you have your own loader :V

// We already know we have 3.+ :V
{$Define GL_VERSION_3_1}
{$Define GL_VERSION_3_2}
{$Define GL_VERSION_3_3}

// Desktop GL 2.0+ has glPolygonMode() which GL ES and WebGL don't have.
{$Define IMGUI_HAS_POLYGON_MODE}

// Vertex arrays are not supported on ES2/WebGL1 unless Emscripten which uses an extension
{$IfNDef IMGUI_OPENGL_ES2}
  {$Define IMGUI_OPENGL_USE_VERTEX_ARRAY}
{$EndIf}

// Desktop GL 3.2+ has glDrawElementsBaseVertex() which GL ES and WebGL don't have.
{$If not Defined(IMGUI_OPENGL_ES2) and not Defined(IMGUI_OPENGL_ES3) and Defined(GL_VERSION_3_2) }
  {$Define IMGUI_OPENGL_MAY_HAVE_VTX_OFFSET}
{$EndIf}

// Desktop GL use extension detection
{$If not Defined(IMGUI_OPENGL_ES2) and not Defined(IMGUI_OPENGL_ES3)}
  {$Define IMGUI_OPENGL_MAY_HAVE_EXTENSIONS}
{$EndIf}
// Desktop GL 3.3+ and GL ES 3.0+ have glBindSampler()
{$If not Defined(IMGUI_OPENGL_ES2) and not Defined(IMGUI_OPENGL_ES3) or Defined(GL_VERSION_3_2) }
  {$Define IMGUI_OPENGL_MAY_HAVE_BIND_SAMPLER}
{$EndIf}

{$If not Defined(IMGUI_OPENGL_ES2) and not Defined(IMGUI_OPENGL_ES3) or Defined(GL_VERSION_3_1) }
  {$Define IMGUI_OPENGL_MAY_HAVE_PRIMITIVE_RESTART}
{$EndIf}


Interface

Uses
  SysUtils,
  glad_gl,
  PasImGui,
  PasImGui.Utils,
  OpenGl3.Loader;

Type
  // OpenGL Data
  ImGui_ImplOpenGL3_Data = Record
    GlVersion: GLuint;
    // Extracted at runtime using GL_MAJOR_VERSION, GL_MINOR_VERSION queries (e.g. 320 for GL 3.2)
    GlslVersionString: Array[0..31] Of AnsiChar;
    // Specified by user or detected based on compile time GL settings.
    GlProfileIsES2: Boolean;
    GlProfileIsES3: Boolean;
    GlProfileIsCompat: Boolean;
    GlProfileMask: GLint;
    FontTexture: GLuint;
    ShaderHandle: GLuint;
    AttribLocationTex: GLint; // Uniforms location
    AttribLocationProjMtx: GLint;
    AttribLocationVtxPos: GLuint;  // Vertex attributes location
    AttribLocationVtxUV: GLuint;
    AttribLocationVtxColor: GLuint;
    VboHandle: GLuint;
    ElementsHandle: GLuint;
    VertexBufferSize: GLsizeiptr;
    IndexBufferSize: GLsizeiptr;
    HasClipOrigin: Boolean;
    UseBufferSubData: Boolean;
  End;
  PImGui_ImplOpenGL3_Data = ^ImGui_ImplOpenGL3_Data;

procedure ImGui_OpenGL3_RenderDrawData(draw_data: PImDrawData);
Function  ImGui_OpenGL3_Init(glsl_version: PAnsiChar): Boolean;
Procedure ImGui_OpenGL3_NewFrame();
Procedure ImGui_OpenGL3_Shutdown();

type
  TGLProc = reference to procedure;
  TError = reference to procedure(msg : string);
const
  ImDrawCallback_ResetRenderState : ImDrawCallback = Pointer(-8);

Implementation

{$IfDef IMGUI_LOG}
procedure OnAssert(const Message, Filename: {$IfDef FPC}ShortString{$ELSE}string{$EndIf}; LineNumber: Integer; ErrorAddr: Pointer);
begin
  raise EAssertionFailed.Create(Format('%s (%s, line %d)', [Message, Filename, LineNumber]));
end;

procedure GL_CALL(ACall : TGLProc; AError: TError);
  var
  gl_err : GLenum;
begin
  ACall();
  gl_err := glGetError();
  if (gl_err <> 0) then
  begin
    AError(Format('GL error 0x%x',  [gl_err]));
  end;
end;
{$EndIf}

Function ImGui_ImplOpenGL3_GetBackendData(): PImGui_ImplOpenGL3_Data;
Begin
  If ImGui.GetCurrentContext() <> nil Then
    Result := PImGui_ImplOpenGL3_Data(ImGui.GetIO()^.BackendRendererUserData)
  Else
    Result := nil;
End;

procedure ImGui_ImplOpenGL3_SetupRenderState(draw_data: PImDrawData; fb_width: Integer; fb_height: Integer; vertex_array_object: GLuint);
var
  bd: PImGui_ImplOpenGL3_Data;
  clip_origin_lower_left: Boolean;
  current_clip_origin: GLenum;
  L, R, T, B, tmp: Single;
  ortho_projection: array[0..3] of array[0..3] of Single;
begin
  bd := ImGui_ImplOpenGL3_GetBackendData();
  // Setup render state: alpha-blending enabled, no face culling, no depth testing, scissor enabled, polygon fill
  glEnable(GL_BLEND);
  glBlendEquation(GL_FUNC_ADD);
  glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE_MINUS_SRC_ALPHA);
  glDisable(GL_CULL_FACE);
  glDisable(GL_DEPTH_TEST);
  glDisable(GL_STENCIL_TEST);
  glEnable(GL_SCISSOR_TEST);

  {$IfDef IMGUI_OPENGL_MAY_HAVE_PRIMITIVE_RESTART}
  if (bd^.GlVersion >= 310) then
      glDisable(GL_PRIMITIVE_RESTART);
  {$EndIf}

  {$IfDef IMGUI_HAS_POLYGON_MODE}
  glPolygonMode(GL_FRONT_AND_BACK, GL_FILL);
  {$EndIf}

  clip_origin_lower_left := False;
  // Support for GL 4.5 rarely used glClipControl(GL_UPPER_LEFT)
  if GLAD_GL_VERSION_4_5 then
  begin
    clip_origin_lower_left := True;
    if (bd^.HasClipOrigin) then
    begin
      current_clip_origin := GLenum(0);
      glGetIntegerv(GL_CLIP_ORIGIN, @GLint(current_clip_origin));
      if (current_clip_origin = GL_UPPER_LEFT) then
      begin
        clip_origin_lower_left := false;
      end;
    end;
  end;
  // Setup viewport, orthographic projection matrix
  // Our visible imgui space lies from draw_data^.DisplayPos (top left) to
  //  draw_data^.DisplayPos+data_data^.DisplaySize (bottom right).
  //    DisplayPos is (0,0) for single viewport apps.

  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glViewport(0, 0, GLsizei(fb_width), GLsizei(fb_height));
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}

  L := draw_data^.DisplayPos.x;
  R := draw_data^.DisplayPos.x + draw_data^.DisplaySize.x;
  T := draw_data^.DisplayPos.y;
  B := draw_data^.DisplayPos.y + draw_data^.DisplaySize.y;

  if GLAD_GL_VERSION_4_5 then
  begin
    if (not clip_origin_lower_left) then
    begin
      tmp := T;
      T := B;
      B := tmp;
    end; // Swap top and bottom if origin is upper left
  end;

  FillChar(ortho_projection, SizeOf(ortho_projection), 0);
  // Initialize the ortho_projection matrix
  ortho_projection[0][0] := 2.0 / (R - L);

  ortho_projection[1][1] := 2.0 / (T - B);
  ortho_projection[2][2] := -1.0;

  ortho_projection[3][0] := (R + L) / (L - R);
  ortho_projection[3][1] := (T + B) / (B - T);
  ortho_projection[3][3] := 1.0;

  glUseProgram(bd^.ShaderHandle);
  glUniform1i(bd^.AttribLocationTex, 0);
  glUniformMatrix4fv(bd^.AttribLocationProjMtx, 1, Boolean(GL_FALSE), @ortho_projection[0][0]);

  {$IfDef IMGUI_OPENGL_MAY_HAVE_BIND_SAMPLER}
  if (bd^.GlVersion >= 330) or (bd^.GlProfileIsES3) then
      glBindSampler(0, 0);
  // We use combined texture/sampler state. Applications using GL 3.3 and GL ES 3.0 may set that otherwise.
  {$EndIf}

  {$IfDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
  glBindVertexArray(vertex_array_object);
  {$EndIf}

  // Bind vertex/index buffers and setup attributes for ImDrawVert
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glBindBuffer(GL_ARRAY_BUFFER, bd^.VboHandle);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, bd^.ElementsHandle);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glEnableVertexAttribArray(bd^.AttribLocationVtxPos);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glEnableVertexAttribArray(bd^.AttribLocationVtxUV);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glEnableVertexAttribArray(bd^.AttribLocationVtxColor);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}

  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glVertexAttribPointer(bd^.AttribLocationVtxPos, 2, GL_FLOAT, Boolean(GL_FALSE), sizeof(ImDrawVert), Pointer(IntPtr(@PImDrawVert(nil)^.pos)));
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glVertexAttribPointer(bd^.AttribLocationVtxUV, 2, GL_FLOAT, Boolean(GL_FALSE), sizeof(ImDrawVert), Pointer(IntPtr(@PImDrawVert(nil)^.uv)));
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glVertexAttribPointer(bd^.AttribLocationVtxColor, 4, GL_UNSIGNED_BYTE, Boolean(GL_TRUE), sizeof(ImDrawVert), Pointer(IntPtr(@PImDrawVert(nil)^.col)));
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}

end;

// OpenGL3 Render function.
// Note that this implementation is little overcomplicated because we are saving/setting up/restoring every OpenGL state explicitly.
// This is in order to be able to run within an OpenGL engine that doesn't do so.
procedure ImGui_OpenGL3_RenderDrawData(draw_data: PImDrawData);
var
  fb_width, fb_height , n, cmd_i: Integer;
  bd: PImGui_ImplOpenGL3_Data;

  last_program, last_texture,
  last_sampler, last_array_buffer,
  last_vertex_array_object : GLuint;

  last_polygon_mode : Array [0..1] of GLint;

  last_viewport : Array [0..3] of GLint;
  last_scissor_box : Array [0..3] of GLint;

  last_active_texture, last_blend_src_rgb,
  last_blend_dst_rgb, last_blend_src_alpha,
  last_blend_dst_alpha, last_blend_equation_rgb,
  last_blend_equation_alpha : GLenum;

  last_enable_blend,
  last_enable_cull_face,
  last_enable_depth_test,
  last_enable_stencil_test,
  last_enable_scissor_test,
  last_enable_primitive_restart: GLboolean;

  vertex_array_object : GLuint;
  clip_off, clip_scale, clip_min, clip_max: ImVec2;

  cmd_list_ptr : PImDrawList;
  vtx_buffer_size, idx_buffer_size: GLsizeiptr;
  pcmd: PImDrawCmd;
Begin
  // Avoid rendering when minimized, scale coordinates for retina displays (screen coordinates != framebuffer coordinates)
  fb_width := Trunc(draw_data^.DisplaySize.x * draw_data^.FramebufferScale.x);
  fb_height := Trunc(draw_data^.DisplaySize.y * draw_data^.FramebufferScale.y);
  if (fb_width <= 0) or (fb_height <= 0) then
    Exit;

  bd := ImGui_ImplOpenGL3_GetBackendData();

  // Backup GL state
  glGetIntegerv(GL_ACTIVE_TEXTURE, @GLint(last_active_texture));
  glActiveTexture(GL_TEXTURE0);
  glGetIntegerv(GL_CURRENT_PROGRAM, @GLint(last_program));
  glGetIntegerv(GL_TEXTURE_BINDING_2D, @GLint(last_texture));

  {$IfDef IMGUI_OPENGL_MAY_HAVE_BIND_SAMPLER}
  if (bd^.GlVersion >= 330) or (bd^.GlProfileIsES3) then
    glGetIntegerv(GL_SAMPLER_BINDING, @GLint(last_sampler))
  else
    last_sampler := 0;
  {$EndIf}

  glGetIntegerv(GL_ARRAY_BUFFER_BINDING, @GLint(last_array_buffer));

  {$IfNDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
  // This is part of VAO on OpenGL 3.0+ and OpenGL ES 3.0+.
  { TODO: Get Back to this later - Time : 11/17/2023 1:45:47 AM }
  {$EndIf}

  {$IfDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
   glGetIntegerv(GL_VERTEX_ARRAY_BINDING, @GLint(last_vertex_array_object));
  {$EndIf}

  {$IfDef IMGUI_HAS_POLYGON_MODE}
   glGetIntegerv(GL_POLYGON_MODE, @last_polygon_mode);
  {$EndIf}

  glGetIntegerv(GL_VIEWPORT, @last_viewport);
  glGetIntegerv(GL_SCISSOR_BOX, @last_scissor_box);
  glGetIntegerv(GL_BLEND_SRC_RGB, @GLint(last_blend_src_rgb));
  glGetIntegerv(GL_BLEND_DST_RGB, @GLint(last_blend_dst_rgb));
  glGetIntegerv(GL_BLEND_SRC_ALPHA, @GLint(last_blend_src_alpha));
  glGetIntegerv(GL_BLEND_DST_ALPHA, @GLint(last_blend_dst_alpha));
  glGetIntegerv(GL_BLEND_EQUATION_RGB, @GLint(last_blend_equation_rgb));
  glGetIntegerv(GL_BLEND_EQUATION_ALPHA, @GLint(last_blend_equation_alpha));

  last_enable_blend := glIsEnabled(GL_BLEND);
  last_enable_cull_face := glIsEnabled(GL_CULL_FACE);
  last_enable_depth_test := glIsEnabled(GL_DEPTH_TEST);
  last_enable_stencil_test := glIsEnabled(GL_STENCIL_TEST);
  last_enable_scissor_test := glIsEnabled(GL_SCISSOR_TEST);

  {$IfDef IMGUI_OPENGL_MAY_HAVE_PRIMITIVE_RESTART}
  if (bd^.GlVersion >= 310) or (bd^.GlProfileIsES3) then
    last_enable_primitive_restart := glIsEnabled(GL_PRIMITIVE_RESTART)
  else
    last_enable_primitive_restart := Boolean(GL_FALSE);
  {$EndIf}

  // Setup desired GL state
  // Recreate the VAO every time (this is to easily allow multiple GL contexts
  //    to be rendered to. VAO are not shared among GL contexts).
  // The renderer would actually work without any VAO bound, but then our
  //    VertexAttrib calls would overwrite the default one currently bound.
  vertex_array_object := 0;
  {$IfDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glGenVertexArrays(1, @vertex_array_object);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$EndIf}
  ImGui_ImplOpenGL3_SetupRenderState(draw_data, fb_width, fb_height, vertex_array_object);

  // Will project scissor/clipping rectangles into framebuffer space
  clip_off := draw_data^.DisplayPos; // (0,0) unless using multi-viewports
  clip_scale := draw_data^.FramebufferScale; // (1,1) unless using retina display which are often (2,2)

  // Render command lists

  for n := 0 to Pred(draw_data^.CmdListsCount) do
  begin
    cmd_list_ptr := draw_data^.CmdLists.Data[n];
    // Upload vertex/index buffers
    // - OpenGL drivers are in a very sorry state nowadays....
    //   During 2021 we attempted to switch from glBufferData() to orphaning+glBufferSubData() following reports
    //   of leaks on Intel GPU when using multi-viewports on Windows.
    // - After this we kept hearing of various display corruptions issues. We started disabling on non-Intel GPU, but issues still got reported on Intel.
    // - We are now back to using exclusively glBufferData(). So bd^.UseBufferSubData IS ALWAYS FALSE in this code.
    //   We are keeping the old code path for a while in case people finding new issues may want to test the bd^.UseBufferSubData path.
    // - See https://github.com/ocornut/imgui/issues/4468 and please report any corruption issues.
    vtx_buffer_size := GLsizeiptr(cmd_list_ptr.VtxBuffer.Size * Integer(SizeOf(ImDrawVert)));
    idx_buffer_size := GLsizeiptr(cmd_list_ptr.IdxBuffer.Size * Integer(sizeof(ImDrawIdx)));
    if (bd^.UseBufferSubData) then
    begin
      if (bd^.VertexBufferSize < vtx_buffer_size) then
      begin
        bd^.VertexBufferSize := vtx_buffer_size;
        {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
        glBufferData(GL_ARRAY_BUFFER, bd^.VertexBufferSize, nil, GL_STREAM_DRAW);
        {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
      end;
      if (bd^.IndexBufferSize < idx_buffer_size) then
      begin
        bd^.IndexBufferSize := idx_buffer_size;
        {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
        glBufferData(GL_ELEMENT_ARRAY_BUFFER, bd^.IndexBufferSize, nil, GL_STREAM_DRAW);
        {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
      end;
      {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
      glBufferSubData(GL_ARRAY_BUFFER, 0, vtx_buffer_size, cmd_list_ptr.VtxBuffer.Data);
      {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
      {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
      glBufferSubData(GL_ELEMENT_ARRAY_BUFFER, 0, idx_buffer_size, cmd_list_ptr.IdxBuffer.Data);
      {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
    end
    else
    begin
      {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
      glBufferData(GL_ARRAY_BUFFER, vtx_buffer_size, cmd_list_ptr.VtxBuffer.Data, GL_STREAM_DRAW);
      {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
      {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
      glBufferData(GL_ELEMENT_ARRAY_BUFFER, idx_buffer_size, cmd_list_ptr.IdxBuffer.Data,GL_STREAM_DRAW);
      {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
    end;

    for cmd_i := 0 to Pred(cmd_list_ptr.CmdBuffer.Size) do
    begin
      pcmd := @cmd_list_ptr.CmdBuffer.Data[cmd_i];
      if @pcmd.UserCallback <> nil then
      begin
        // User callback, registered via ImDrawList::AddCallback()
        // (ImDrawCallback_ResetRenderState is a special callback value used by the user to request the renderer to reset render state.)
        if (@pcmd.UserCallback = @ImDrawCallback_ResetRenderState) then
          ImGui_ImplOpenGL3_SetupRenderState(draw_data, fb_width, fb_height, vertex_array_object)
        else
          pcmd.UserCallback(@cmd_list_ptr, @pcmd);
      end
      else
      begin
        // Project scissor/clipping rectangles into framebuffer space
        clip_min := ImVec2.New((pcmd.ClipRect.x - clip_off.x) * clip_scale.x,
                                (pcmd.ClipRect.y - clip_off.y) * clip_scale.y);
        clip_max := ImVec2.New((pcmd.ClipRect.z - clip_off.x) * clip_scale.x,
                                (pcmd.ClipRect.w - clip_off.y) * clip_scale.y);
        if (clip_max.x <= clip_min.x) or (clip_max.y <= clip_min.y) then
          Continue;
        // Apply scissor/clipping rectangle (Y is inverted in OpenGL)
        {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
        glScissor(Trunc(clip_min.x), Trunc(Single(fb_height - clip_max.y)), Trunc(clip_max.x - clip_min.x), Trunc(clip_max.y - clip_min.y));
        {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
        // Bind texture, Draw
        {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
        glBindTexture(GL_TEXTURE_2D, {%H-}GLuint(pcmd.GetTexID()));
        {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}

        {$IfDef IMGUI_OPENGL_MAY_HAVE_VTX_OFFSET}
          if (bd^.GlVersion >= 320) then
          begin
            {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
            glDrawElementsBaseVertex(GL_TRIANGLES, GLsizei(pcmd.ElemCount), {$IfDef ImD_32}GL_UNSIGNED_INT{$ELSE}GL_UNSIGNED_SHORT{$EndIf} ,Pointer(IntPtr(pcmd.IdxOffset * sizeof(ImDrawIdx))), GLint(pcmd.VtxOffset));
            {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
          end
          else
        {$EndIf}
          {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
          glDrawElements(GL_TRIANGLES, GLsizei(pcmd.ElemCount), {$IfDef ImD_32}GL_UNSIGNED_INT{$ELSE}GL_UNSIGNED_SHORT{$EndIf},Pointer(IntPtr(pcmd.IdxOffset * sizeof(ImDrawIdx))));
          {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
      end;
    end;
  end;
  // Destroy the temporary VAO
  {$IfDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
    {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
    glDeleteVertexArrays(1, @vertex_array_object);
    {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$EndIf}

  // Restore modified GL state
  // This "glIsProgram()" check is required because if the program is
  //   "pending deletion" at the time of binding backup, it will have been deleted by now and will cause an OpenGL error. See #6220.
  if (last_program = 0) or (glIsProgram(last_program)) then
    glUseProgram(last_program);
  glBindTexture(GL_TEXTURE_2D, last_texture);

  {$IfDef IMGUI_OPENGL_MAY_HAVE_BIND_SAMPLER}
  if (bd^.GlVersion >= 330) or (bd^.GlProfileIsES3) then
    glBindSampler(0, last_sampler);
  {$EndIf}
  glActiveTexture(last_active_texture);

  {$IfDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
  glBindVertexArray(last_vertex_array_object);
  {$EndIf}
  glBindBuffer(GL_ARRAY_BUFFER, last_array_buffer);
  {$IfnDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
    { TODO: implement this - Time : 11/17/2023 5:18:38 AM }
  {$EndIf}
  glBlendEquationSeparate(last_blend_equation_rgb, last_blend_equation_alpha);
  glBlendFuncSeparate(last_blend_src_rgb, last_blend_dst_rgb, last_blend_src_alpha, last_blend_dst_alpha);

  if (last_enable_blend)then
      glEnable(GL_BLEND)
  else
      glDisable(GL_BLEND);

  if (last_enable_cull_face) then
      glEnable(GL_CULL_FACE)
  else
      glDisable(GL_CULL_FACE);

  if (last_enable_depth_test) then
      glEnable(GL_DEPTH_TEST)
  else
      glDisable(GL_DEPTH_TEST);

  if (last_enable_stencil_test) then
      glEnable(GL_STENCIL_TEST)
  else
      glDisable(GL_STENCIL_TEST);

  if (last_enable_scissor_test) then
      glEnable(GL_SCISSOR_TEST)
  else
      glDisable(GL_SCISSOR_TEST);

  {$IfDef IMGUI_OPENGL_MAY_HAVE_PRIMITIVE_RESTART}
  if (bd^.GlVersion >= 310) then
    if (last_enable_primitive_restart) then
      glEnable(GL_PRIMITIVE_RESTART)
    else
      glDisable(GL_PRIMITIVE_RESTART);
  {$EndIf}

  {$IfDef IMGUI_HAS_POLYGON_MODE}
  // Desktop OpenGL 3.0 and OpenGL 3.1 had separate polygon draw modes for front-facing and back-facing faces of polygons
  if (bd^.GlVersion <= 310) or (bd^.GlProfileIsCompat) then
  begin
    glPolygonMode(GL_FRONT, GLenum(last_polygon_mode[0]));
    glPolygonMode(GL_BACK, GLenum(last_polygon_mode[1]));
  end
  else
    glPolygonMode(GL_FRONT_AND_BACK, GLenum(last_polygon_mode[0]));
  {$EndIf}

  glViewport(last_viewport[0], last_viewport[1], GLsizei(last_viewport[2]), GLsizei(last_viewport[3]));
  glScissor(last_scissor_box[0], last_scissor_box[1], GLsizei(last_scissor_box[2]), GLsizei(last_scissor_box[3]));
end;

procedure ImGui_ImplOpenGL3_RenderWindow(viewport: PImGuiViewport; render_arg: Pointer); Cdecl;
var
  clear_color : ImVec4;
begin
  if not (viewport^.Flags and ImGuiViewportFlags_NoRendererClear <> 0) then
  begin
    clear_color := ImVec4.New(0.0, 0.0, 0.0, 1.0);
    glClearColor(clear_color.x, clear_color.y, clear_color.z, clear_color.w);
    glClear(GL_COLOR_BUFFER_BIT);
  end;
  ImGui_OpenGL3_RenderDrawData(viewport^.DrawData);
end;

procedure ImGui_ImplOpenGL3_InitPlatformInterface;
var
  platform_io: PImGuiPlatformIO;
begin
  platform_io := ImGui.GetPlatformIO();
  platform_io^.Renderer_RenderWindow := @ImGui_ImplOpenGL3_RenderWindow;
end;

function ImGui_OpenGL3_Init(glsl_version: PAnsiChar): Boolean;
Var
  io: PImGuiIO;
  bd: PImGui_ImplOpenGL3_Data;
  num_extensions: GLint;
  major, minor, current_texture : GLint;
  gl_version_str, extension: PAnsiChar;
  i: Integer;
Const
  VersionInfo =
    'GlVersion = %d '#10 + 'GlProfileIsCompat = %d '#10 +
    'GlProfileMask = 0x%X'#10 + 'GlProfileIsES2 = %d, GlProfileIsES3 = %d'#10 +
    'GL_VENDOR = "%s"'#10 + 'GL_RENDERER = "%s"';
Begin
  io := ImGui.GetIO();
  Assert(io^.BackendRendererUserData = nil, 'Already initialized a renderer backend!');

  // Initialize our loader
  {$If not Defined(IMGUI_OPENGL_ES2) and not Defined(IMGUI_OPENGL_ES3) and not Defined(IMGUI_OPENGL_LOADER_CUSTOM) }
  If Not ImGLInit() Then
  Begin
    If IsConsole Then
      WriteLn('Failed to initialize OpenGL loader!');
    Exit(False);
  End;
  {$EndIf}

  // Setup backend capabilities flags
  bd := AllocMem(SizeOf(ImGui_ImplOpenGL3_Data));
  io^.BackendRendererUserData := bd;
  io^.BackendRendererName := 'Pas_imgui_opengl3';

  // Query for GL version (e.g. 320 for GL 3.2)
  {$IFDEF IMGUI_OPENGL_ES2}
  // GLES 2
  bd^.GlVersion := 200;
  bd^.GlProfileIsES2 := True;
  {$ELSE}
  // Desktop or GLES 3
  major := 0;
  minor := 0;

  glGetIntegerv(GL_MAJOR_VERSION, @major);
  glGetIntegerv(GL_MINOR_VERSION, @minor);
  If (major = 0) And (minor = 0) Then
  Begin
    gl_version_str := PAnsiChar(glGetString(GL_VERSION));
    If IsConsole Then
      WriteLn(Format('%s %d.%d', [gl_version_str, major, minor]));
  End;
  bd^.GlVersion := GLuint(major * 100 + minor * 10);

  If (bd^.GlVersion >= 320) Then
    glGetIntegerv(GL_CONTEXT_PROFILE_MASK, @bd^.GlProfileMask);

  bd^.GlProfileIsCompat := (bd^.GlProfileMask And
    GL_CONTEXT_COMPATIBILITY_PROFILE_BIT) <> 0;

  {$IfDef IMGUI_OPENGL_ES3}
    bd^.GlProfileIsES3 := true;
  {$EndIf}

  bd^.UseBufferSubData := False;
  {$ENDIF}

  {$IfDef IMGUI_LOG}
  if IsConsole then
    WriteLn(Format(VersionInfo, [bd^.GlVersion, Integer(bd^.GlProfileIsCompat),
      bd^.GlProfileMask, Integer(bd^.GlProfileIsES2), Integer(bd^.GlProfileIsES3),
      PAnsiChar(glGetString(GL_VENDOR)), PAnsiChar(glGetString(GL_RENDERER))])); // [DEBUG]
  {$EndIf}

  {$IfDef IMGUI_OPENGL_MAY_HAVE_VTX_OFFSET}
  // We can honor the ImDrawCmd::VtxOffset field, allowing for large meshes.
  if (bd^.GlVersion >= 320) then
      io^.BackendFlags := io^.BackendFlags or ImGuiBackendFlags_RendererHasVtxOffset;
  {$EndIf}
  // We can create multi-viewports on the Renderer side (optional)
  io^.BackendFlags := io^.BackendFlags or ImGuiBackendFlags_RendererHasViewports;

  // Store GLSL version string so we can refer to it later in case we recreate shaders.
  // Note: GLSL version is NOT the same as GL version. Leave this to nullptr if unsure.
  if glsl_version = nil then
  begin
    {$IFDEF IMGUI_OPENGL_ES2}
      glsl_version := '#version 100';
    {$ELSEIF DEFINED(IMGUI_OPENGL_ES3)}
      glsl_version := '#version 300 es';
    {$ELSEIF DEFINED(DARWIN)}
      glsl_version := '#version 150';
    {$ELSE}
      glsl_version := '#version 130';
    {$ENDIF}
  end;

  Assert(strlen(glsl_version) + 2 < Length(bd^.GlslVersionString), 'Ops');
  StrPCopy(bd^.GlslVersionString, glsl_version);
  StrCat(bd^.GlslVersionString, #10); // 1 = 1 as in C++ code :P

  // Make an arbitrary GL call (we don't actually need the result)
  // IF YOU GET A CRASH HERE: it probably means the OpenGL function loader didn't do its job. Let us know!
  glGetIntegerv(GL_TEXTURE_BINDING_2D, @current_texture);

  // Detect extensions we support
  bd^.HasClipOrigin := (bd^.GlVersion >= 450);
  {$IfDef IMGUI_OPENGL_MAY_HAVE_EXTENSIONS}
  bd^.HasClipOrigin := hasExt('GL_ARB_clip_control');
  {$EndIf}

  If (io^.ConfigFlags And ImGuiConfigFlags_ViewportsEnable) <> 0 Then
  Begin
    ImGui_ImplOpenGL3_InitPlatformInterface();
  End;

  Result := True;
End;

function GetGLVersion(GlslVersionString : AnsiString; GLVersion : Integer = 130) : Integer;
var
  Code: Integer;
begin
  Result := GLVersion;
  // Extract the integer following '#version '
  if Pos('#version ', GlslVersionString) = 1 then
  begin
    // Delete the '#version ' part to isolate the number
    Delete(GlslVersionString, 1, Length('#version '));
    GlslVersionString := Trim(GlslVersionString);
    Val(GlslVersionString, Result, Code);
    if (Result = 0) or (Code <> 0) then
      Result := GLVersion;
  end;
end;

// If you get an error please report on github. You may try different GL context version or GLSL version. See GL<>GLSL version table at the top of this file.
function CheckShader(handle: GLuint; desc: PAnsiChar) : Boolean;
Var
  bd: PImGui_ImplOpenGL3_Data;
  status, log_length: GLint;
  buf : AnsiString;
begin
  bd := ImGui_ImplOpenGL3_GetBackendData();
  status := 0; log_length := 0;
  glGetShaderiv(handle, GL_COMPILE_STATUS, @status);
  glGetShaderiv(handle, GL_INFO_LOG_LENGTH, @log_length);
  if boolean(status) = boolean(GL_FALSE) then
  begin
    if IsConsole then
      WriteLn(Format('ERROR: ImGui_ImplOpenGL3_CreateDeviceObjects: failed to compile %s! With GLSL: %s', [desc, bd^.GlslVersionString]));
  end;
  if (log_length > 1) then
  begin
    buf := '';
    SetLength(buf, log_length);
    glGetShaderInfoLog(handle, log_length, nil, @buf[1]);
    if IsConsole then
      WriteLn(Format('%s', [buf]));
    buf := '';
  end;
  Result := boolean(status) = boolean(GL_TRUE)
end;

// If you get an error please report on GitHub. You may try different GL context version or GLSL version.
function CheckProgram(handle: GLuint; desc: PAnsiChar) : Boolean;
Var
  bd: PImGui_ImplOpenGL3_Data;
  status, log_length: GLint;
  buf : AnsiString;
begin
  bd := ImGui_ImplOpenGL3_GetBackendData();
  glGetProgramiv(handle, GL_LINK_STATUS, @status);
  glGetProgramiv(handle, GL_INFO_LOG_LENGTH, @log_length);
  if boolean(status) = boolean(GL_FALSE) then
  begin
    if IsConsole then
      WriteLn(Format('ERROR: ImGui_ImplOpenGL3_CreateDeviceObjects: failed to link %s! With GLSL %s', [desc, bd^.GlslVersionString]));
  end;
  if (log_length > 1) then
  begin
    buf := '';
    SetLength(buf, log_length);
    glGetProgramInfoLog(handle, log_length, nil, @buf[1]);
    if IsConsole then
      WriteLn(Format('%s', [buf]));
    buf := '';
  end;
  Result := boolean(status) = boolean(GL_TRUE)
end;

function ImGui_ImplOpenGL3_CreateFontsTexture() : Boolean;
Var
  bd: PImGui_ImplOpenGL3_Data;
  io: PImGuiIO;
  pixels : PPByte;
  last_texture : GLint;
  width, height : Integer;
begin
  io := ImGui.GetIO();
  bd := ImGui_ImplOpenGL3_GetBackendData();

  // Build texture atlas
  io^.Fonts^.GetTexDataAsRGBA32(@pixels, @width, @height);
  // Load as RGBA 32-bit (75% of the memory is wasted, but default font is so small)
  //  because it is more likely to be compatible with user's existing shaders. If your ImTextureId represent a higher-level concept than just a GL texture id, consider calling GetTexDataAsAlpha8() instead to save on GPU memory.


  // Upload texture to graphics system
  // (Bilinear sampling is required by default.
  //    Set 'io.Fonts->Flags |= ImFontAtlasFlags_NoBakedLines' or 'style.AntiAliasedLinesUseTex = false' to allow point/nearest sampling)
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glGetIntegerv(GL_TEXTURE_BINDING_2D, @last_texture);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}

  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glGenTextures(1, @bd^.FontTexture);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glBindTexture(GL_TEXTURE_2D, bd^.FontTexture);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}

  // Not on WebGL/ES
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glPixelStorei(GL_UNPACK_ROW_LENGTH, 0);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, width, height, 0, GL_RGBA, GL_UNSIGNED_BYTE, pixels);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF}

  // Store our identifier
  io.Fonts^.SetTexID(ImTextureID(IntPtr(bd^.FontTexture)));
  // Restore state
  {$IfDef IMGUI_LOG}GL_CALL(procedure begin {$ENDIF}
  glBindTexture(GL_TEXTURE_2D, last_texture);
  {$IfDef IMGUI_LOG}end, procedure(msg : string) begin Assert(False, msg); end);{$ENDIF};
  Result := True;
end;

function ImGui_ImplOpenGL3_CreateDeviceObjects : Boolean;
Var
  bd: PImGui_ImplOpenGL3_Data;
  vert_handle, frag_handle : GLuint;
  last_texture, last_array_buffer, last_vertex_array : GLint;
  glsl_version : Integer;
  vertex_shader, fragment_shader : PGLchar;
  vertex_shader_with_version: array[0..1] of PAnsiChar;
  fragment_shader_with_version : array[0..1] of PAnsiChar;
const
  vertex_shader_glsl_120: PGLchar =
          'uniform mat4 ProjMtx;' + #10 +
          'attribute vec2 Position;' + #10 +
          'attribute vec2 UV;' + #10 +
          'attribute vec4 Color;' + #10 +
          'varying vec2 Frag_UV;' + #10 +
          'varying vec4 Frag_Color;' + #10 +
          'void main()' + #10 +
          '{' + #10 +
          '    Frag_UV = UV;' + #10 +
          '    Frag_Color = Color;' + #10 +
          '    gl_Position = ProjMtx * vec4(Position.xy,0,1);' + #10 +
          '}' + #10;

  vertex_shader_glsl_130: PGLchar =
          'uniform mat4 ProjMtx;' + #10 +
          'in vec2 Position;' + #10 +
          'in vec2 UV;' + #10 +
          'in vec4 Color;' + #10 +
          'out vec2 Frag_UV;' + #10 +
          'out vec4 Frag_Color;' + #10 +
          'void main()' + #10 +
          '{' + #10 +
          '    Frag_UV = UV;' + #10 +
          '    Frag_Color = Color;' + #10 +
          '    gl_Position = ProjMtx * vec4(Position.xy,0,1);' + #10 +
          '}' + #10;

  vertex_shader_glsl_300_es: PGLchar =
          'precision highp float;' + #10 +
          'layout (location = 0) in vec2 Position;' + #10 +
          'layout (location = 1) in vec2 UV;' + #10 +
          'layout (location = 2) in vec4 Color;' + #10 +
          'uniform mat4 ProjMtx;' + #10 +
          'out vec2 Frag_UV;' + #10 +
          'out vec4 Frag_Color;' + #10 +
          'void main()' + #10 +
          '{' + #10 +
          '    Frag_UV = UV;' + #10 +
          '    Frag_Color = Color;' + #10 +
          '    gl_Position = ProjMtx * vec4(Position.xy,0,1);' + #10 +
          '}' + #10;

  vertex_shader_glsl_410_core: PGLchar =
          'layout (location = 0) in vec2 Position;' + #10 +
          'layout (location = 1) in vec2 UV;' + #10 +
          'layout (location = 2) in vec4 Color;' + #10 +
          'uniform mat4 ProjMtx;' + #10 +
          'out vec2 Frag_UV;' + #10 +
          'out vec4 Frag_Color;' + #10 +
          'void main()' + #10 +
          '{' + #10 +
          '    Frag_UV = UV;' + #10 +
          '    Frag_Color = Color;' + #10 +
          '    gl_Position = ProjMtx * vec4(Position.xy,0,1);' + #10 +
          '}' + #10;

  fragment_shader_glsl_120: PGLchar =
          '#ifdef GL_ES' + #10 +
          '    precision mediump float;' + #10 +
          '#endif' + #10 +
          'uniform sampler2D Texture;' + #10 +
          'varying vec2 Frag_UV;' + #10 +
          'varying vec4 Frag_Color;' + #10 +
          'void main()' + #10 +
          '{' + #10 +
          '    gl_FragColor = Frag_Color * texture2D(Texture, Frag_UV.st);' + #10 +
          '}' + #10;

  fragment_shader_glsl_130: PGLchar =
          'uniform sampler2D Texture;' + #10 +
          'in vec2 Frag_UV;' + #10 +
          'in vec4 Frag_Color;' + #10 +
          'out vec4 Out_Color;' + #10 +
          'void main()' + #10 +
          '{' + #10 +
          '    Out_Color = Frag_Color * texture(Texture, Frag_UV.st);' + #10 +
          '}' + #10;

  fragment_shader_glsl_300_es: PGLchar =
          'precision mediump float;' + #10 +
          'uniform sampler2D Texture;' + #10 +
          'in vec2 Frag_UV;' + #10 +
          'in vec4 Frag_Color;' + #10 +
          'layout (location = 0) out vec4 Out_Color;' + #10 +
          'void main()' + #10 +
          '{' + #10 +
          '    Out_Color = Frag_Color * texture(Texture, Frag_UV.st);' + #10 +
          '}' + #10;

  fragment_shader_glsl_410_core: PGLchar =
          'in vec2 Frag_UV;' + #10 +
          'in vec4 Frag_Color;' + #10 +
          'uniform sampler2D Texture;' + #10 +
          'layout (location = 0) out vec4 Out_Color;' + #10 +
          'void main()' + #10 +
          '{' + #10 +
          '    Out_Color = Frag_Color * texture(Texture, Frag_UV.st);' + #10 +
          '}' + #10;

Begin
  bd := ImGui_ImplOpenGL3_GetBackendData();
  // Backup GL state
  glGetIntegerv(GL_TEXTURE_BINDING_2D, @last_texture);
  glGetIntegerv(GL_ARRAY_BUFFER_BINDING, @last_array_buffer);

  {$IfDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
   glGetIntegerv(GL_VERTEX_ARRAY_BINDING, @last_vertex_array);
  {$EndIf}
  // Parse GLSL version string
  glsl_version := 130;
  glsl_version := GetGLVersion(AnsiString(bd^.GlslVersionString), glsl_version);

  // Select shaders matching our GLSL versions
  if glsl_version < 130 then
  begin
    vertex_shader := vertex_shader_glsl_120;
    fragment_shader := fragment_shader_glsl_120;
  end
  else if glsl_version >= 410 then
  begin
    vertex_shader := vertex_shader_glsl_410_core;
    fragment_shader := fragment_shader_glsl_410_core;
  end
  else if glsl_version = 300 then
  begin
    vertex_shader := vertex_shader_glsl_300_es;
    fragment_shader := fragment_shader_glsl_300_es;
  end
  else
  begin
    vertex_shader := vertex_shader_glsl_130;
    fragment_shader := fragment_shader_glsl_130;
  end;

  // Create shaders
  vertex_shader_with_version[0] := @bd^.GlslVersionString[0];
  vertex_shader_with_version[1] := vertex_shader;
  vert_handle := glCreateShader(GL_VERTEX_SHADER);
  glShaderSource(vert_handle, 2, @vertex_shader_with_version, nil);
  glCompileShader(vert_handle);
  CheckShader(vert_handle, 'vertex shader');

  fragment_shader_with_version[0] := @bd^.GlslVersionString[0];
  fragment_shader_with_version[1] := fragment_shader;
  frag_handle := glCreateShader(GL_FRAGMENT_SHADER);
  glShaderSource(frag_handle, 2, @fragment_shader_with_version, nil);
  glCompileShader(frag_handle);
  CheckShader(frag_handle, 'fragment shader');

  // Link
  bd^.ShaderHandle := glCreateProgram();
  glAttachShader(bd^.ShaderHandle, vert_handle);
  glAttachShader(bd^.ShaderHandle, frag_handle);
  glLinkProgram(bd^.ShaderHandle);
  CheckProgram(bd^.ShaderHandle, 'shader program');

  glDetachShader(bd^.ShaderHandle, vert_handle);
  glDetachShader(bd^.ShaderHandle, frag_handle);
  glDeleteShader(vert_handle);
  glDeleteShader(frag_handle);

  bd^.AttribLocationTex := glGetUniformLocation(bd^.ShaderHandle, 'Texture');
  bd^.AttribLocationProjMtx := glGetUniformLocation(bd^.ShaderHandle, 'ProjMtx');
  bd^.AttribLocationVtxPos := GLuint(glGetAttribLocation(bd^.ShaderHandle, 'Position'));
  bd^.AttribLocationVtxUV := GLuint(glGetAttribLocation(bd^.ShaderHandle, 'UV'));
  bd^.AttribLocationVtxColor := GLuint(glGetAttribLocation(bd^.ShaderHandle, 'Color'));

  // Create buffers
  glGenBuffers(1, @bd^.VboHandle);
  glGenBuffers(1, @bd^.ElementsHandle);

  ImGui_ImplOpenGL3_CreateFontsTexture();
  // Restore modified GL state
  glBindTexture(GL_TEXTURE_2D, last_texture);
  glBindBuffer(GL_ARRAY_BUFFER, last_array_buffer);

  {$IfDef IMGUI_OPENGL_USE_VERTEX_ARRAY}
    glBindVertexArray(last_vertex_array);
  {$EndIf}

  Result := True;
end;

procedure ImGui_OpenGL3_NewFrame;
Var
  bd: PImGui_ImplOpenGL3_Data;
Begin
  bd := ImGui_ImplOpenGL3_GetBackendData();
  Assert(bd <> nil, 'Did you call ImGui_ImplOpenGL3_Init()?');

  if (bd^.ShaderHandle = 0) then
      ImGui_ImplOpenGL3_CreateDeviceObjects();
End;

procedure ImGui_ImplOpenGL3_ShutdownPlatformInterface();
begin
  ImGui.DestroyPlatformWindows();
end;

procedure ImGui_ImplOpenGL3_DestroyFontsTexture;
Var
  bd: PImGui_ImplOpenGL3_Data;
  io: PImGuiIO;
Begin
  bd := ImGui_ImplOpenGL3_GetBackendData();
  io := imgui.GetIO();
  if (bd^.FontTexture > 0) then
  begin
    glDeleteTextures(1, @bd^.FontTexture);
    io^.Fonts^.SetTexID(nil);
    bd^.FontTexture := 0;
  end;
end;

procedure ImGui_ImplOpenGL3_DestroyDeviceObjects;
Var
  bd: PImGui_ImplOpenGL3_Data;
Begin
  bd := ImGui_ImplOpenGL3_GetBackendData();
  if (bd^.VboHandle > 0) then
  begin
    glDeleteBuffers(1, @bd^.VboHandle);
    bd^.VboHandle := 0;
  end;
  if (bd^.ElementsHandle > 0) then
  begin
    glDeleteBuffers(1, @bd^.ElementsHandle);
    bd^.ElementsHandle := 0;
  end;
  if (bd^.ShaderHandle > 0)   then
  begin
    glDeleteProgram(bd^.ShaderHandle);
    bd^.ShaderHandle := 0;
  end;
  ImGui_ImplOpenGL3_DestroyFontsTexture();
end;

procedure ImGui_OpenGL3_Shutdown;
Var
  bd: PImGui_ImplOpenGL3_Data;
  io: PImGuiIO;
Begin
  bd := ImGui_ImplOpenGL3_GetBackendData();
  Assert(bd <> nil, 'No renderer backend to shutdown, or already shutdown?');
  io := imgui.GetIO();

  ImGui_ImplOpenGL3_ShutdownPlatformInterface();
  ImGui_ImplOpenGL3_DestroyDeviceObjects();

  io^.BackendRendererName := nil;
  io^.BackendRendererUserData := nil;

  io^.BackendFlags := io^.BackendFlags and not(ImGuiBackendFlags_RendererHasVtxOffset or ImGuiBackendFlags_RendererHasViewports);
  // Free Allocated data
  Freemem(bd);
End;

{$IfDef IMGUI_LOG}
initialization
  AssertErrorProc := @OnAssert;
{$EndIf}

End.
