{
  FreePascal bindings for ImGui

  Copyright (C) 2023 Coldzer0 <Coldzer0 [at] protonmail.ch>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, version 3 of the License.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.
}

Unit PasImGui;
{$IfDef FPC}
  {$mode objfpc}{$H+}
  {$ModeSwitch advancedrecords}
  {$modeswitch typehelpers}
  {.$Define INLINE} {There's a bug in FPC Trunk version when we inline helper functions}
{$EndIf}


Interface

Uses
  SysUtils,
  PasImGui.Enums,
  PasImGui.Types,
  PasImGui.Apis;

Const
  {$if defined(Darwin)}
    SharedSuffix = 'dylib';
  {$elseif defined(linux)}
    {$LinkLib C}
    SharedSuffix = 'so';
  {$elseif defined(MSWINDOWS)}
    SharedSuffix = 'dll';
  {$endif}
  CIMGUI_LIB = 'cimgui.' + SharedSuffix;

Type
  { ImGui }
  ImGui = Class
  Public
    { Context }
    Class Function CreateContext(shared_font_atlas: PImFontAtlas): PImGuiContext;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure DestroyContext(ctx: PImGuiContext); {$IfDef INLINE} inline;{$EndIf}


    { IO }
    Class Function GetIO(): PImGuiIO; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetPlatformIO(): PImGuiPlatformIO; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetStyle(): PImGuiStyle; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetDrawData(): PImDrawData; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure NewFrame(); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure Render(); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ShowUserGuide(); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ShowStyleEditor(ref: PImGuiStyle); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ShowDemoWindow(p_open: PBoolean = nil);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ShowMetricsWindow(p_open: PBoolean = nil);
    {$IfDef INLINE} inline;{$EndIf}


    {Misc}
    Class Function GetMainViewport(): PImGuiViewport; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetCurrentContext(): PImGuiContext; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetDragDropPayload(): PImGuiPayload; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetCenterViewPort(ViewPort : PImGuiViewport) : ImVec2;

    Class Function FindViewportByPlatformHandle(platform_handle: Pointer)
      : PImGuiViewport;

    { Platform }
    Class Procedure DestroyPlatformWindows(); {$IfDef INLINE} inline;{$EndIf}

    { Events }
    Class Procedure AddMouseViewportEvent(id: ImGuiID);
    Class Procedure AddFocusEvent(focused: Boolean);

    Class Procedure AddMouseSourceEvent(Source: ImGuiMouseSource);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure AddMousePosEvent(x: Single; y: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure AddMouseWheelEvent(wheel_x: Single; wheel_y: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure AddMouseButtonEvent(button: Int32; down: Boolean);
    {$IfDef INLINE} inline;{$EndIf}

    Class Procedure AddInputCharactersUTF8(Const str: String);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure AddKeyEvent(key: ImGuiKey; down: Boolean);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetKeyEventNativeData(key: ImGuiKey; native_keycode: Int32;
      native_scancode: Int32; native_legacy_index: Int32);
    {$IfDef INLINE} inline;{$EndIf}


    { window Platform }
    Class Procedure UpdatePlatformWindows(); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure RenderPlatformWindowsDefault(platform_render_arg: Pointer;
      renderer_render_arg: Pointer); {$IfDef INLINE} inline;{$EndIf}

    { Window }
    class function Begin_(Name: String; p_open: PBoolean= nil; flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure End_; {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginChild(str_id: String; size: ImVec2;
      child_flags: ImGuiChildFlags; extra_flags: ImGuiWindowFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginChildEx(id: ImGuiID; size: ImVec2;
      child_flags: ImGuiChildFlags; extra_flags: ImGuiWindowFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndChild; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure GetContentRegionMax(out_: PImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Function GetContentRegionAvail: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetContentRegionAvailWidth: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure GetWindowContentRegionMin(out_: PImVec2);
    {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowContentRegionMax(): ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowContentRegionWidth: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowDrawList(): PImDrawList; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure GetWindowPos(out_: PImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure GetWindowSize(out_: PImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowWidth(): Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowHeight(): Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowCollapsed(): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowFontScale(scale: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowPos(pos: ImVec2; cond: ImGuiCond; pivot: ImVec2);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowPos(pos: ImVec2; cond: ImGuiCond = ImGuiCond_None);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowPosCenter(cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowSize(size: ImVec2;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowSizeConstraints(size_min: ImVec2;
      size_max: ImVec2; custom_callback: ImGuiSizeCallback;
      custom_callback_data: pointer); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowContentSize(size: ImVec2);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowCollapsed(collapsed: Boolean;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowFocus; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowPos(pos: ImVec2; cond: ImGuiCond = ImGuiCond_None);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowSize(size: ImVec2; cond: ImGuiCond = ImGuiCond_None);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowCollapsed(collapsed: Boolean;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowFocus; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowPosByName(Name: PChar; pos: ImVec2;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowSize2(Name: PChar; size: ImVec2;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowCollapsed2(Name: PChar; collapsed: Boolean;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowFocus2(Name: PChar); {$IfDef INLINE} inline;{$EndIf}
    Class Function GetScrollX: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetScrollY: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetScrollMaxX: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetScrollMaxY: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetScrollX(scroll_x: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetScrollY(scroll_y: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetScrollHere(center_y_ratio: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetScrollFromPosY(pos_y: Single; center_y_ratio: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetStateStorage(tree: PImGuiStorage); {$IfDef INLINE} inline;{$EndIf}
    Class Function GetStateStorage(): PImGuiStorage; {$IfDef INLINE} inline;{$EndIf}


    { Parameters stacks (shared) }
    Class Procedure PushFont(font: PImFont); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopFont; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleColor(idx: ImGuiCol; col: ImVec4);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopStyleColor(Count: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleVar(idx: ImGuiStyleVar; val: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleVarVec(idx: ImGuiStyleVar; val: ImVec2);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopStyleVar(Count: Longint = 1); {$IfDef INLINE} inline;{$EndIf}
    Class Function GetFont(): PImFont; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetFontSize: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetFontTexUvWhitePixel(): ImVec2;
    Class Function GetColorU32(idx: ImGuiCol; alpha_mul: Single): ImU32;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function GetColorU32Vec(col: ImVec4): ImU32; {$IfDef INLINE} inline;{$EndIf}

    { Parameters stacks (current window) }
    Class Procedure PushItemWidth(item_width: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopItemWidth; {$IfDef INLINE} inline;{$EndIf}
    Class Function CalcItemWidth: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushTextWrapPos(wrap_pos_x: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopTextWrapPos; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushTabStop(v: Boolean); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopTabStop; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushButtonRepeat(_repeat: Boolean); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopButtonRepeat; {$IfDef INLINE} inline;{$EndIf}

    {Separator}
    Class Procedure SeparatorText(label_: String); {$IfDef INLINE} inline;{$EndIf}

    { Layout }
    Class Procedure Separator; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SameLine(pos_x: Single = 0; spacing_w: Single = -1);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure NewLine; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure Spacing; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure Dummy(size: ImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure Indent(indent_w: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure Unindent(indent_w: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure BeginGroup; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndGroup; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetCursorPos(): ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetCursorPosX: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetCursorPosY: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetCursorPos(local_pos: ImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetCursorPosX(x: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetCursorPosY(y: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Function GetCursorStartPos(): ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetCursorScreenPos(): ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetCursorScreenPos(pos: ImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure igAlignTextToFramePadding; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetTextLineHeight: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetTextLineHeightWithSpacing: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetFrameHeight: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetFrameHeightWithSpacing: Single; {$IfDef INLINE} inline;{$EndIf}

    { Columns }
    Class Procedure Columns(Count: Longint; id: PChar; border: Boolean);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure NextColumn; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetColumnIndex: Longint; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetColumnOffset(column_index: Longint): Single;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetColumnOffset(column_index: Longint; offset_x: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Class Function GetColumnWidth(column_index: Longint): Single;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetColumnWidth(column_index: Longint; Width: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Class Function GetColumnsCount: Longint; {$IfDef INLINE} inline;{$EndIf}

    { ID scopes }
    { If you are creating widgets in a loop you most likely want to push a unique identifier so ImGui can differentiate them }
    { You can also use "##extra" within your widget name to distinguish them from each others (see 'Programmer Guide') }
    Class Procedure PushIdStr(str_id: PChar); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushIdStrRange(str_begin: PChar; str_end: PChar);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushIdPtr(ptr_id: pointer); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushIdInt(int_id: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopId; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetIdStr(str_id: PChar): ImGuiID; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetIdStrRange(str_begin: PChar; str_end: PChar): ImGuiID;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function GetIdPtr(ptr_id: pointer): ImGuiID; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Text }
    Class Procedure Text(Const text_: String);{$IfDef INLINE} inline;{$EndIf}
    Class Procedure Text(Const Fmt: String; Const Args: Array Of Const);
    {$IfDef INLINE} inline;{$EndIf}
    //procedure igTextV(fmt:Pchar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextColored(col: ImVec4; fmt: PChar; args: Array Of Const);
    Class Procedure TextColored(col: ImVec4; Const fmt: String);
    //procedure igTextColoredV(col:ImVec4; fmt:Pchar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextDisabled(Const fmt: String; args: Array Of Const); {inline;}
    Class Procedure TextDisabled(Const fmt: String); {$IfDef INLINE} inline;{$EndIf}
    //procedure igTextDisabledV(fmt:Pchar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextWrapped(Const fmt: String; args: Array Of Const); {inline;}
    Class Procedure TextWrapped(Const fmt: String); {$IfDef INLINE} inline;{$EndIf}
    //procedure igTextWrappedV(fmt:Pchar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextUnformatted(Const _text: String);
    Class Procedure TextUnformatted(Const _text: PChar; Const text_end: PChar = nil);
    Class Procedure LabelText(_label: String; fmt: String);
    Class Procedure LabelText(_label: String; fmt: PChar; args: Array Of Const);
    //procedure igLabelTextV(_label:Pchar; fmt:Pchar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure Bullet; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure BulletText(Const fmt: String; args: Array Of Const); {inline;}
    Class Procedure BulletText(Const fmt: String); {$IfDef INLINE} inline;{$EndIf}
    //procedure igBulletTextV(fmt:Pchar; args:va_list);cdecl;external ImguiLibName;

    { Widgets: Main }
    //Class Function Button(_label: String; size: ImVec2; flags: ImGuiButtonFlags): Boolean;
    Class Function Button(_label: String; size: ImVec2): Boolean;
    Class Function Button(_label: String): Boolean; //overload for default size (0,0)
    Class Function SmallButton(_label: PChar): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InvisibleButton(str_id: PChar; size: ImVec2;
      flags: ImGuiButtonFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure Image(user_texture_id: ImTextureID; size: ImVec2;
      uv0: ImVec2; uv1: ImVec2; tint_col: ImVec4; border_col: ImVec4);
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ImageButton(str_id: PChar; user_texture_id: ImTextureID;
      size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4;
      tint_col: ImVec4): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function Checkbox(_label: PChar; v: PBoolean): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function CheckboxFlags(_label: PChar; flags: PUInt32;
      flags_value: Int32): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function RadioButtonBool(_label: PChar; active: Boolean): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function RadioButton(_label: PChar; v: Plongint;
      v_button: Longint): Boolean; {$IfDef INLINE} inline;{$EndIf}

    Class Function BeginCombo(Const _label, preview_value: String;
      flags: ImGuiComboFlags = ImGuiComboFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndCombo;
    Class Function Combo(_label: String; current_item: Plongint;
      items: PPchar; items_count: Longint; height_in_items: Longint): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function Combo2(_label: String; current_item: Plongint;
      items_separated_by_zeros: PChar; height_in_items: Longint): Boolean;
    {$IfDef INLINE} inline;{$EndIf}


    Class Function ColorButton(desc_id: PChar; col: ImVec4;
      flags: ImGuiColorEditFlags; size: ImVec2): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorEdit3(_label: PChar; col: PSingle;
      flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorEdit4(_label: PChar; col: PSingle;
      flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorPicker3(_label: PChar; col: PSingle;
      flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorPicker4(_label: PChar; col: PSingle;
      flags: ImGuiColorEditFlags; ref_col: PSingle): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetColorEditOptions(flags: ImGuiColorEditFlags);
    {$IfDef INLINE} inline;{$EndIf}

    Class Procedure PlotLines(_label: PChar; values: Psingle;
      values_count: Longint; values_offset: Longint; overlay_text: PChar;
      scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
    {$IfDef INLINE} inline;{$EndIf}

    //TODO : func type
    //procedure igPlotLines2(_label:Pchar; values_getter:function (data:pointer; idx:longint):single; data:pointer; values_count:longint; values_offset:longint;
    //            overlay_text:Pchar; scale_min:single; scale_max:single; graph_size:ImVec2);cdecl;external ImguiLibName;
    Class Procedure PlotHistogram(_label: PChar; values: Psingle;
      values_count: Longint; values_offset: Longint; overlay_text: PChar;
      scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
    {$IfDef INLINE} inline;{$EndIf}

    //TODO : func type
    //procedure igPlotHistogram2(_label:Pchar; values_getter:function (data:pointer; idx:longint):single; data:pointer; values_count:longint; values_offset:longint;
    //            overlay_text:Pchar; scale_min:single; scale_max:single; graph_size:ImVec2);cdecl;external ImguiLibName;
    Class Procedure ProgressBar(fraction: Single; size_arg: ImVec2; overlay: PChar);
    {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Sliders (tip: ctrl+click on a slider to input text) }
    Class Function SliderFloat(_label: PChar; v: Psingle; v_min: Single;
      v_max: Single; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat2(_label: PChar; v: PSingle; v_min: Single;
      v_max: Single; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat3(_label: PChar; v: PSingle; v_min: Single;
      v_max: Single; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat4(_label: PChar; v: PSingle; v_min: Single;
      v_max: Single; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderAngle(_label: PChar; v_rad: Psingle;
      v_degrees_min: Single = -360.0; v_degrees_max: Single = +360.0;
      format: PChar = '%.0f deg';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean; Inline;
    Class Function SliderInt(_label: PChar; v: Plongint; v_min: Longint;
      v_max: Longint; display_format: PChar = '%d';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    class function SliderInt2(_label: PChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function SliderInt3(_label: PChar; v: PInteger; v_min: Longint;
      v_max: Longint; display_format: PChar = '%d';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function SliderInt4(_label: PChar; v: PInteger; v_min: Longint;
      v_max: Longint; display_format: PChar = '%d';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function VSliderFloat(_label: PChar; size: ImVec2; v: Psingle;
      v_min: Single; v_max: Single; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function VSliderInt(_label: PChar; size: ImVec2; v: Plongint;
      v_min: Longint; v_max: Longint; display_format: PChar = '%d';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Drags (tip: ctrl+click on a drag box to input text) }
    // For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every functions, remember than a 'float v[3]' function argument is the same as 'float* v'. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
    { If v_min >= v_max we have no bound }
    Class Function DragFloat(_label: PChar; v: Psingle; v_speed: Single = 1.0;
      v_min: Single = 0.0; v_max: Single = 0.0; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat2(_label: PChar; v: PSingle; v_speed: Single = 1.0;
      v_min: Single = 0.0; v_max: Single = 0.0; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat3(_label: PChar; v: PSingle; v_speed: Single = 1.0;
      v_min: Single = 0.0; v_max: Single = 0.0; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat4(_label: PChar; v: PSingle; v_speed: Single = 1.0;
      v_min: Single = 0.0; v_max: Single = 0.0; display_format: PChar = '%.3f';
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloatRange2(_label: PChar; v_current_min: Psingle;
      v_current_max: Psingle; v_speed: Single; v_min: Single;
      v_max: Single; display_format: PChar; display_format_max: PChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}

    { If v_min >= v_max we have no bound }
    Class Function DragInt(_label: PChar; v: Plongint; v_speed: Single;
      v_min: Longint; v_max: Longint; display_format: PChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function DragInt2(_label: PChar; v: PInteger; v_speed: Single;
      v_min: Longint; v_max: Longint; display_format: PChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function DragInt3(_label: PChar; v: PInteger; v_speed: Single;
      v_min: Longint; v_max: Longint; display_format: PChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function DragInt4(_label: PChar; v: PInteger; v_speed: Single;
      v_min: Longint; v_max: Longint; display_format: PChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function DragIntRange2(_label: PChar; v_current_min: Plongint;
      v_current_max: Plongint; v_speed: Single; v_min: Longint;
      v_max: Longint; display_format: PChar; display_format_max: PChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Input with Keyboard }
    Class Function InputText(_label: PChar; buf: PChar; buf_size: size_t;
      flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None;
      callback: ImGuiInputTextCallback = nil; user_data: pointer = nil): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputTextMultiline(_label: PChar; buf: PChar;
      buf_size: size_t; size: ImVec2;
      flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None;
      callback: ImGuiInputTextCallback = nil; user_data: pointer = nil): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat(_label: PChar; v: Psingle; step: Single;
      step_fast: Single; format: PChar; extra_flags: ImGuiInputTextFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat2(_label: PChar; v: PSingle; format: PChar;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat3(_label: PChar; v: PSingle; format: PChar;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat4(_label: PChar; v: PSingle; format: PChar;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputInt(_label: PChar; v: Plongint; step: Longint;
      step_fast: Longint; extra_flags: ImGuiInputTextFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputInt2(_label: PChar; v: PInteger;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputInt3(_label: PChar; v: PInteger;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputInt4(_label: PChar; v: PInteger;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Trees }
    Class Function TreeNode(_label: String): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNode(str_id: String; fmt: String;
      args: Array Of Const): Boolean; {inline;}
    Class Function TreeNode(str_id: String; fmt: String): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNode(ptr_id: pointer; fmt: String;
      args: Array Of Const): Boolean; {inline;}
    Class Function TreeNode(ptr_id: pointer; fmt: String): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function TreeNodeEx(_label: PChar; flags: ImGuiTreeNodeFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNodeEx(str_id: PChar; flags: ImGuiTreeNodeFlags;
      fmt: String; args: Array Of Const): Boolean; {inline;}
    Class Function TreeNodeEx(str_id: PChar; flags: ImGuiTreeNodeFlags;
      fmt: String): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags;
      fmt: String; args: Array Of Const): Boolean; {inline;}
    Class Function TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags;
      fmt: String): Boolean; {$IfDef INLINE} inline;{$EndIf}
    //todo : vargs
    //    function  igTreeNodeExV(str_id:Pchar; flags:ImGuiTreeNodeFlags; fmt:Pchar; args:va_list):bool;cdecl;external ImguiLibName;
    //todo : vargs
    //    function  igTreeNodeExVPtr(ptr_id:pointer; flags:ImGuiTreeNodeFlags; fmt:Pchar; args:va_list):bool;cdecl;external ImguiLibName;
    Class Procedure TreePushStr(str_id: PChar); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure TreePushPtr(ptr_id: pointer); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure TreePop; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetTreeNodeToLabelSpacing: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextTreeNodeOpen(opened: Boolean;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Function CollapsingHeader(_label: PChar;
      flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function CollapsingHeader(_label: PChar; p_open: PBoolean;
      flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Selectable / Lists }
    Class Function Selectable(_label: String; selected: Boolean;
      flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
    Class Function Selectable(_label: String; selected: Boolean;
      flags: ImGuiSelectableFlags = ImGuiSelectableFlags_None): Boolean;
    //overload for default size (0,0)
    Class Function SelectableEx(_label: PChar; p_selected: PBoolean;
      flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ListBox(_label: PChar; current_item: Plongint;
      items: PPchar; items_count: Longint; height_in_items: Longint): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function BeginListBox(_label: PChar; size: ImVec2): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndListBox; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Value() Helpers. Output single value in "name: value" format (tip: freely declare your own within the ImGui namespace!) }
    Class Procedure ValueBool(prefix: PChar; b: Boolean); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueInt(prefix: PChar; v: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueUInt(prefix: PChar; v: dword); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueFloat(prefix: PChar; v: Single; float_format: PChar);
    {$IfDef INLINE} inline;{$EndIf}

    { Tooltip }
    Class Procedure SetTooltip(fmt: String; args: Array Of Const); {inline}
    Class Procedure SetTooltip(fmt: String); {$IfDef INLINE} inline;{$EndIf}
    //todo : vargs
    //    procedure igSetTooltipV(fmt:Pchar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure BeginTooltip; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndTooltip; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Menus }
    Class Function BeginMainMenuBar(): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndMainMenuBar(); {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginMenuBar(): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndMenuBar(); {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginMenu(_label: PChar; Enabled: Boolean = True): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndMenu; {$IfDef INLINE} inline;{$EndIf}
    Class Function MenuItem(_label: PChar; shortcut: PChar = nil;
      selected: Boolean = False; Enabled: Boolean = True): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function MenuItem(_label: PChar; shortcut: PChar;
      p_selected: PBoolean; Enabled: Boolean = True): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    { Popup }
    Class Procedure OpenPopup(str_id: PChar;
      flags: ImGuiPopupFlags = ImGuiPopupFlags_None); {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopup(str_id: PChar;
      flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopupModal(Name: PChar; p_open: PBoolean = nil;
      extra_flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopupContextItem(str_id: PChar = nil;
      mouse_button: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopupContextWindow(str_id: PChar = nil;
      mouse_button: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopupContextVoid(str_id: PChar = nil;
      mouse_button: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndPopup; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsPopupOpen(str_id: PChar;
      flags: ImGuiPopupFlags = ImGuiPopupFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure CloseCurrentPopup; {$IfDef INLINE} inline;{$EndIf}

    { Logging: all text output from interface is redirected to tty/file/clipboard. Tree nodes are automatically opened. }
    Class Procedure LogToTTY(max_depth: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogToFile(max_depth: Longint; filename: PChar);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogToClipboard(max_depth: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogFinish; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogButtons; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogText(Const fmt: String; args: Array Of Const);
    Class Procedure LogText(Const fmt: String);

    { Drag and Drop }

    { Clipping }
    Class Procedure PushClipRect(clip_rect_min: ImVec2; clip_rect_max: ImVec2;
      intersect_with_current_clip_rect: Boolean); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopClipRect; {$IfDef INLINE} inline;{$EndIf}

    { Styles }
    Class Procedure StyleColorsClassic(dst: PImGuiStyle); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure StyleColorsDark(dst: PImGuiStyle); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure StyleColorsLight(dst: PImGuiStyle); {$IfDef INLINE} inline;{$EndIf}

    { Focus }
    Class Procedure SetItemDefaultFocus(); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetKeyboardFocusHere(offset: Integer = 0);
    {$IfDef INLINE} inline;{$EndIf}

    { Utilities }
    Class Function IsItemHovered(flags: ImGuiHoveredFlags = ImGuiHoveredFlags_None):
      Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsItemActive: Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsItemClicked(mouse_button: ImGuiMouseButton =
      ImGuiMouseButton_Left): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsItemVisible: Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsAnyItemHovered: Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsAnyItemActive: Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure GetItemRectMin(pOut: PImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure GetItemRectMax(pOut: PImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure GetItemRectSize(pOut: PImVec2); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextItemAllowOverlap; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowFocused(flags: ImGuiFocusedFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowHovered(flags: ImGuiHoveredFlags =
      ImGuiHoveredFlags_None): Boolean; {$IfDef INLINE} inline;{$EndIf}

    Class Function IsRectVisible(Const item_size: ImVec2): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsRectVisible(Const rect_min, rect_max: ImVec2): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function GetTime(): Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetFrameCount(): Longint; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetStyleColorName(idx: ImGuiCol): PChar;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function CalcTextSize(_text: PChar; text_end: PChar = nil;
      hide_text_after_double_hash: Boolean = False;
      wrap_width: Single = -1): ImVec2; {$IfDef INLINE} inline;{$EndIf}

    Class Function BeginChildFrame(id: ImGuiID; size: ImVec2;
      extra_flags: ImGuiWindowFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndChildFrame; {$IfDef INLINE} inline;{$EndIf}

    Class Procedure ColorConvertU32ToFloat4(pOut: PImVec4; in_: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorConvertFloat4ToU32(in_: ImVec4): ImU32;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ColorConvertRGBtoHSV(r: Single; g: Single; b: Single;
      out_h: Psingle; out_s: Psingle; out_v: Psingle); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ColorConvertHSVtoRGB(h: Single; s: Single; v: Single;
      out_r: Psingle; out_g: Psingle; out_b: Psingle); {$IfDef INLINE} inline;{$EndIf}

    Class Function GetKeyIndex(key: ImGuiKey): ImGuiKey; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsKeyDown(user_key_index: ImGuiKey): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsKeyPressed(user_key_index: ImGuiKey; _repeat: Boolean): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsKeyReleased(user_key_index: ImGuiKey): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseDown(_button: ImGuiMouseButton): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseClicked(_button: ImGuiMouseButton;
      _repeat: Boolean): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseDoubleClicked(_button: ImGuiMouseButton): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseReleased(_button: ImGuiMouseButton): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseHoveringRect(r_min: ImVec2; r_max: ImVec2;
      clip: Boolean = True): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseDragging(_button: ImGuiMouseButton;
      lock_threshold: Single): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetMousePos: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetMousePosOnOpeningCurrentPopup: ImVec2;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function GetMouseDragDelta(_button: ImGuiMouseButton;
      lock_threshold: Single = -1.0): ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ResetMouseDragDelta(_button: ImGuiMouseButton);
    {$IfDef INLINE} inline;{$EndIf}
    Class Function GetMouseCursor: ImGuiMouseCursor; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetMouseCursor(_type: ImGuiMouseCursor);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextFrameWantCaptureKeyboard(capture: Boolean = True);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextFrameWantCaptureMouse(capture: Boolean = True);
    {$IfDef INLINE} inline;{$EndIf}

    { Helpers functions to access functions pointers in ImGui::GetIO() }
    Class Function MemAlloc(sz: size_t): pointer; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure MemFree(ptr: pointer); {$IfDef INLINE} inline;{$EndIf}
    Class Function GetClipboardText: PChar; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetClipboardText(_text: PChar); {$IfDef INLINE} inline;{$EndIf}

    { Internal state access - if you want to share ImGui state between modules (e.g. DLL) or allocate it yourself }
    Class Function GetVersion(): PChar; {$IfDef INLINE} inline;{$EndIf}
  End;


  { TImFontAtlasHelper }

  TImFontAtlasHelper = Record helper For ImFontAtlas
    Procedure GetTexDataAsAlpha8(out_pixels: PPImU8; out_width: PInt32;
      out_height: PInt32; out_bytes_per_pixel: PInt32);
    Procedure SetTexID(id: ImTextureID); Cdecl;
  End;


  { TImDrawListHelper }

  TImDrawListHelper = Record helper For ImDrawList
    Procedure PushClipRect(clip_rect_min: ImVec2; clip_rect_max: ImVec2;
      intersect_with_current_clip_rect: Boolean); {$IfDef INLINE} inline;{$EndIf}
    Procedure PushClipRectFullScreen(); {$IfDef INLINE} inline;{$EndIf}
    Procedure PopClipRect(); {$IfDef INLINE} inline;{$EndIf}
    Procedure PushTextureID(texture_id: ImTextureID); {$IfDef INLINE} inline;{$EndIf}
    Procedure PopTextureID(); {$IfDef INLINE} inline;{$EndIf}

    { Primitives }
    procedure AddLine(p1: ImVec2; p2: ImVec2; col: ImU32; thickness: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddRect(a: ImVec2; b: ImVec2; col: ImU32; rounding: Single = 0;
      rounding_corners_flags: ImDrawFlags = ImDrawFlags_Closed;
      thickness: Single = 1); {$IfDef INLINE} inline;{$EndIf}

    Procedure AddRectFilled(p_min: ImVec2; p_max: ImVec2; col: ImU32;
      rounding: Single = 0; flags: ImDrawFlags = ImDrawFlags_Closed);
    {$IfDef INLINE} inline;{$EndIf}

    Procedure AddRectFilledMultiColor(a: ImVec2; b: ImVec2; col_upr_left: ImU32;
      col_upr_right: ImU32; col_bot_right: ImU32; col_bot_left: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddQuad(a: ImVec2; b: ImVec2; c: ImVec2; d: ImVec2;
      col: ImU32; thickness: Single); {$IfDef INLINE} inline;{$EndIf}
    Procedure AddQuadFilled(a: ImVec2; b: ImVec2; c: ImVec2; d: ImVec2; col: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddTriangle(a: ImVec2; b: ImVec2; c: ImVec2; col: ImU32;
      thickness: Single); {$IfDef INLINE} inline;{$EndIf}
    Procedure AddTriangleFilled(a: ImVec2; b: ImVec2; c: ImVec2; col: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddCircle(centre: ImVec2; radius: Single; col: ImU32;
      num_segments: Longint; thickness: Single); {$IfDef INLINE} inline;{$EndIf}
    Procedure AddCircleFilled(centre: ImVec2; radius: Single; col: ImU32;
      num_segments: Longint); {$IfDef INLINE} inline;{$EndIf}
    Procedure AddText(pos: ImVec2; col: ImU32; text_begin: PChar; text_end: PChar);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddTextExt(font: ImFont; font_size: Single; pos: ImVec2;
      col: ImU32; text_begin: PChar; text_end: PChar; wrap_width: Single;
      cpu_fine_clip_rect: ImVec4); {$IfDef INLINE} inline;{$EndIf}
    Procedure AddImage(user_texture_id: ImTextureID; a: ImVec2;
      b: ImVec2; uva: ImVec2; uvb: ImVec2; col: ImU32); {$IfDef INLINE} inline;{$EndIf}
    Procedure AddImageQuad(user_texture_id: ImTextureID; Const a, b, c, d: ImVec2;
      Const uva, uvb, uvc, uvd: ImVec2; col: ImU32); {$IfDef INLINE} inline;{$EndIf}
    Procedure AddPolyline(points: PImVec2; num_points: Integer; col: ImU32;
      flags: ImDrawFlags; thickness: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddConvexPolyFilled(points: PImVec2; num_points: Integer; col: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddBezierCubic(p1: ImVec2; p2: ImVec2; p3: ImVec2;
      p4: ImVec2; col: ImU32; thickness: Single; num_segments: Integer);
    {$IfDef INLINE} inline;{$EndIf}

    { Stateful path API, add points then finish with PathFill() or PathStroke() }
    Procedure PathClear(); {$IfDef INLINE} inline;{$EndIf}
    Procedure PathLineTo(pos: ImVec2); {$IfDef INLINE} inline;{$EndIf}
    Procedure PathLineToMergeDuplicate(pos: ImVec2); {$IfDef INLINE} inline;{$EndIf}
    Procedure PathFillConvex(col: ImU32); {$IfDef INLINE} inline;{$EndIf}
    Procedure PathStroke(col: ImU32; flags: ImDrawFlags; thickness: Single);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure PathArcTo(centre: ImVec2; radius: Single; a_min: Single;
      a_max: Single; num_segments: Longint); {$IfDef INLINE} inline;{$EndIf}
    { Use precomputed angles for a 12 steps circle }
    Procedure PathArcToFast(centre: ImVec2; radius: Single;
      a_min_of_12: Longint; a_max_of_12: Longint); {$IfDef INLINE} inline;{$EndIf}
    //procedure PathBezierCurveTo(p1: ImVec2; p2: ImVec2; p3: ImVec2; num_segments: longint);  {$IfDef INLINE} inline;{$EndIf}
    Procedure PathRect(rect_min: ImVec2; rect_max: ImVec2; rounding: Single;
      rounding_corners_flags: ImDrawFlags); {$IfDef INLINE} inline;{$EndIf}

    { Channels }
    Procedure ChannelsSplit(channels_count: Longint); {$IfDef INLINE} inline;{$EndIf}
    Procedure ChannelsMerge(); {$IfDef INLINE} inline;{$EndIf}
    Procedure ChannelsSetCurrent(channel_index: Longint); {$IfDef INLINE} inline;{$EndIf}

    { Advanced }
    { Your rendering function must check for 'UserCallback' label_ ImDrawCmd and call the function instead of rendering triangles. }
    Procedure AddCallback(callback: ImDrawCallback; callback_data: pointer);
    {$IfDef INLINE} inline;{$EndIf}
    { This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible }
    Procedure AddDrawCmd(); {$IfDef INLINE} inline;{$EndIf}

    { Internal helpers }
    { NB: all primitives needs to be reserved via PrimReserve() beforehand! }
    Procedure PrimReserve(idx_count: Longint; vtx_count: Longint);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure PrimRect(a: ImVec2; b: ImVec2; col: ImU32); {$IfDef INLINE} inline;{$EndIf}
    Procedure PrimRectUV(a: ImVec2; b: ImVec2; uv_a: ImVec2; uv_b: ImVec2;
      col: ImU32); {$IfDef INLINE} inline;{$EndIf}
    Procedure PrimQuadUV(a: ImVec2; b: ImVec2; c: ImVec2; d: ImVec2;
      uv_a: ImVec2; uv_b: ImVec2; uv_c: ImVec2; uv_d: ImVec2; col: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure PrimWriteVtx(pos: ImVec2; uv: ImVec2; col: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure PrimWriteIdx(idx: ImDrawIdx); {$IfDef INLINE} inline;{$EndIf}
    Procedure PrimVtx(pos: ImVec2; uv: ImVec2; col: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
  End;

{ ImGuiPlatformMonitor }
Function ImGuiPlatformMonitor_Create(): PImGuiPlatformMonitor;

Implementation

Function ImGuiPlatformMonitor_Create(): PImGuiPlatformMonitor;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := ImGuiPlatformMonitor_ImGuiPlatformMonitor();
  ResetFpuFlags(saved);
End;


//Replacement for (void*)(intptr_t) int cast, used for IDs. Generates warnings
Function ImIDPtr(Const i: Integer): pointer;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := pointer(IntPtr(i));
  ResetFpuFlags(saved);
End;

Function ImColorCreate(Const color: ImVec4): ImU32;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := ImGui.ColorConvertFloat4ToU32(color);
  ResetFpuFlags(saved);
End;


{ ImGui
  Keep functions short, they're mostly just wrappers. Inlining begin/end with trivial function body is ok
}

class function ImGui.CreateContext(shared_font_atlas: PImFontAtlas): PImGuiContext;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igCreateContext(shared_font_atlas);
  ResetFpuFlags(saved);
End;

class procedure ImGui.DestroyContext(ctx: PImGuiContext);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igDestroyContext(ctx);
  ResetFpuFlags(saved);
End;

class function ImGui.GetIO: PImGuiIO;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetIO;
  ResetFpuFlags(saved);
End;

class function ImGui.GetPlatformIO: PImGuiPlatformIO;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetPlatformIO();
  ResetFpuFlags(saved);
End;

class function ImGui.GetStyle: PImGuiStyle;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetStyle;
  ResetFpuFlags(saved);
End;

class function ImGui.GetDrawData: PImDrawData;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetDrawData;
  ResetFpuFlags(saved);
End;

class procedure ImGui.NewFrame;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igNewFrame;
  ResetFpuFlags(saved);
End;

class procedure ImGui.Render;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igRender;
  ResetFpuFlags(saved);
End;

class procedure ImGui.ShowUserGuide;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igShowUserGuide;
  ResetFpuFlags(saved);
End;

class procedure ImGui.ShowStyleEditor(ref: PImGuiStyle);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igShowStyleEditor(ref);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ShowDemoWindow(p_open: PBoolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igShowDemoWindow(p_open);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ShowMetricsWindow(p_open: PBoolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igShowMetricsWindow(p_open);
  ResetFpuFlags(saved);
End;

class function ImGui.GetMainViewport: PImGuiViewport;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetMainViewport();
  ResetFpuFlags(saved);
End;

class function ImGui.GetCurrentContext: PImGuiContext;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetCurrentContext();
  ResetFpuFlags(saved);
End;

class function ImGui.GetDragDropPayload: PImGuiPayload;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetDragDropPayload();
  ResetFpuFlags(saved);
End;

class function ImGui.GetCenterViewPort(ViewPort: PImGuiViewport): ImVec2;
begin
  ImGuiViewport_GetCenter(@Result, ViewPort);
end;

class function ImGui.FindViewportByPlatformHandle(platform_handle: Pointer): PImGuiViewport;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igFindViewportByPlatformHandle(platform_handle);
  ResetFpuFlags(saved);
End;

class procedure ImGui.DestroyPlatformWindows;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igDestroyPlatformWindows();
  ResetFpuFlags(saved);
End;

class procedure ImGui.AddMouseViewportEvent(id: ImGuiID);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_AddMouseViewportEvent(GetIO(), id);
  ResetFpuFlags(saved);
End;

class procedure ImGui.AddFocusEvent(focused: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_AddFocusEvent(GetIO(), focused);
  ResetFpuFlags(saved);
End;

class procedure ImGui.AddMouseSourceEvent(Source: ImGuiMouseSource);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_AddMouseSourceEvent(GetIO(), Source);
  ResetFpuFlags(saved);
End;

class procedure ImGui.AddMousePosEvent(x: Single; y: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_AddMousePosEvent(GetIO(), x, y);
  ResetFpuFlags(saved);
End;

class procedure ImGui.AddMouseWheelEvent(wheel_x: Single; wheel_y: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_AddMouseWheelEvent(GetIO(), wheel_x, wheel_y);
  ResetFpuFlags(saved);
End;

class procedure ImGui.AddMouseButtonEvent(button: Int32; down: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_AddMouseButtonEvent(GetIO(), button, down);
  ResetFpuFlags(saved);
End;

class procedure ImGui.AddInputCharactersUTF8(const str: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_AddInputCharactersUTF8(GetIO(), PChar(str));
  ResetFpuFlags(saved);
End;

class procedure ImGui.AddKeyEvent(key: ImGuiKey; down: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_AddKeyEvent(GetIO(), key, down);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetKeyEventNativeData(key: ImGuiKey; native_keycode: Int32; native_scancode: Int32; native_legacy_index: Int32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImGuiIO_SetKeyEventNativeData(GetIO(), key, native_keycode,
    native_scancode, native_legacy_index);
  ResetFpuFlags(saved);
End;

class procedure ImGui.UpdatePlatformWindows;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igUpdatePlatformWindows();
  ResetFpuFlags(saved);
End;

class procedure ImGui.RenderPlatformWindowsDefault(platform_render_arg: Pointer; renderer_render_arg: Pointer);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igRenderPlatformWindowsDefault(platform_render_arg, renderer_render_arg);
  ResetFpuFlags(saved);
End;

class function ImGui.Begin_(Name: String; p_open: PBoolean; flags: ImGuiWindowFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBegin(PChar(Name), p_open, flags);
  ResetFpuFlags(saved);
End;

class procedure ImGui.End_;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEnd;
  ResetFpuFlags(saved);
End;

class function ImGui.BeginChild(str_id: String; size: ImVec2; child_flags: ImGuiChildFlags; extra_flags: ImGuiWindowFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginChild_Str(PChar(str_id), size, child_flags, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.BeginChildEx(id: ImGuiID; size: ImVec2; child_flags: ImGuiChildFlags; extra_flags: ImGuiWindowFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginChild_ID(id, size, child_flags, extra_flags);
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndChild;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndChild;
  ResetFpuFlags(saved);
End;

class procedure ImGui.GetContentRegionMax(out_: PImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetContentRegionMax(out_);
  ResetFpuFlags(saved);
End;

class function ImGui.GetContentRegionAvail: ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetContentRegionAvail(@Result);
  ResetFpuFlags(saved);
End;

class function ImGui.GetContentRegionAvailWidth: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := GetContentRegionAvail().x;
  ResetFpuFlags(saved);
End;

class procedure ImGui.GetWindowContentRegionMin(out_: PImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetWindowContentRegionMin(out_);
  ResetFpuFlags(saved);
End;

class function ImGui.GetWindowContentRegionMax: ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetWindowContentRegionMax(@Result);
  ResetFpuFlags(saved);
End;

class function ImGui.GetWindowContentRegionWidth: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := GetWindowContentRegionMax().x;
  ResetFpuFlags(saved);
End;

class function ImGui.GetWindowDrawList: PImDrawList;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetWindowDrawList;
  ResetFpuFlags(saved);
End;

class procedure ImGui.GetWindowPos(out_: PImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetWindowPos(out_);
  ResetFpuFlags(saved);
End;

class procedure ImGui.GetWindowSize(out_: PImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetWindowSize(out_);
  ResetFpuFlags(saved);
End;

class function ImGui.GetWindowWidth: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetWindowWidth;
  ResetFpuFlags(saved);
End;

class function ImGui.GetWindowHeight: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetWindowHeight;
  ResetFpuFlags(saved);
End;

class function ImGui.IsWindowCollapsed: Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsWindowCollapsed;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowFontScale(scale: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowFontScale(scale);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextWindowPos(pos: ImVec2; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextWindowPos(pos, cond, ImVec2.New(0, 0));
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextWindowPos(pos: ImVec2; cond: ImGuiCond; pivot: ImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextWindowPos(pos, cond, pivot);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextWindowPosCenter(cond: ImGuiCond);
Begin
  {
  - 2017/09/25 (1.52) - removed SetNextWindowPosCenter() because
    SetNextWindowPos() now has the optional pivot information to do
    the same and more. Kept redirection function (will obsolete).
  }

  igSetNextWindowPos(GetCenterViewPort(GetMainViewport()),cond,ImVec2.New(0.5,0.5));
End;

class procedure ImGui.SetNextWindowSize(size: ImVec2; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextWindowSize(size, cond);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextWindowSizeConstraints(size_min: ImVec2; size_max: ImVec2; custom_callback: ImGuiSizeCallback; custom_callback_data: pointer);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextWindowSizeConstraints(size_min, size_max, custom_callback,
    custom_callback_data);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextWindowContentSize(size: ImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextWindowContentSize(size);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextWindowCollapsed(collapsed: Boolean; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextWindowCollapsed(collapsed, cond);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextWindowFocus;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextWindowFocus;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowPos(pos: ImVec2; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowPos_Vec2(pos, cond);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowSize(size: ImVec2; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowSize_Vec2(size, cond);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowCollapsed(collapsed: Boolean; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowCollapsed_Bool(collapsed, cond);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowFocus;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowFocus_Nil();
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowPosByName(Name: PChar; pos: ImVec2; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowPos_Str(Name, pos, cond);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowSize2(Name: PChar; size: ImVec2; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowSize_Str(Name, size, cond);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowCollapsed2(Name: PChar; collapsed: Boolean; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowCollapsed_Str(Name, collapsed, cond);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetWindowFocus2(Name: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetWindowFocus_Str(Name);
  ResetFpuFlags(saved);
End;

class function ImGui.GetScrollX: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetScrollX;
  ResetFpuFlags(saved);
End;

class function ImGui.GetScrollY: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetScrollY;
  ResetFpuFlags(saved);
End;

class function ImGui.GetScrollMaxX: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetScrollMaxX;
  ResetFpuFlags(saved);
End;

class function ImGui.GetScrollMaxY: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetScrollMaxY;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetScrollX(scroll_x: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetScrollX_Float(scroll_x);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetScrollY(scroll_y: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetScrollY_Float(scroll_y);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetScrollHere(center_y_ratio: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetScrollHereY(center_y_ratio);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetScrollFromPosY(pos_y: Single; center_y_ratio: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetScrollFromPosY_Float(pos_y, center_y_ratio);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetStateStorage(tree: PImGuiStorage);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetStateStorage(tree);
  ResetFpuFlags(saved);
End;

class function ImGui.GetStateStorage: PImGuiStorage;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetStateStorage;
  ResetFpuFlags(saved);
End;



{ Parameters stacks (shared) }
class procedure ImGui.PushFont(font: PImFont);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushFont(font);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopFont;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopFont;
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushStyleColor(idx: ImGuiCol; col: ImVec4);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushStyleColor_Vec4(idx, col);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopStyleColor(Count: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopStyleColor(Count);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushStyleVar(idx: ImGuiStyleVar; val: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushStyleVar_Float(idx, val);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushStyleVarVec(idx: ImGuiStyleVar; val: ImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushStyleVar_Vec2(idx, val);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopStyleVar(Count: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopStyleVar(Count);
  ResetFpuFlags(saved);
End;

class function ImGui.GetFont: PImFont;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetFont;
  ResetFpuFlags(saved);
End;

class function ImGui.GetFontSize: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetFontSize;
  ResetFpuFlags(saved);
End;

class function ImGui.GetFontTexUvWhitePixel: ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetFontTexUvWhitePixel(@Result);
  ResetFpuFlags(saved);
End;

class function ImGui.GetColorU32(idx: ImGuiCol; alpha_mul: Single): ImU32;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetColorU32_Col(idx, alpha_mul);
  ResetFpuFlags(saved);
End;

class function ImGui.GetColorU32Vec(col: ImVec4): ImU32;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetColorU32_Vec4(col);
  ResetFpuFlags(saved);
End;

{ Parameters stacks (current window) }
class procedure ImGui.PushItemWidth(item_width: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushItemWidth(item_width);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopItemWidth;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopItemWidth;
  ResetFpuFlags(saved);
End;

class function ImGui.CalcItemWidth: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igCalcItemWidth;
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushTextWrapPos(wrap_pos_x: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushTextWrapPos(wrap_pos_x);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopTextWrapPos;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopTextWrapPos;
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushTabStop(v: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushTabStop(v);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopTabStop;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopTabStop;
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushButtonRepeat(_repeat: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushButtonRepeat(_repeat);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopButtonRepeat;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopButtonRepeat;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SeparatorText(label_: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSeparatorText(PChar(label_));
  ResetFpuFlags(saved);
End;

{ Layout }
class procedure ImGui.Separator;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSeparator;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SameLine(pos_x: Single; spacing_w: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSameLine(pos_x, spacing_w);
  ResetFpuFlags(saved);
End;

class procedure ImGui.NewLine;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igNewLine;
  ResetFpuFlags(saved);
End;

class procedure ImGui.Spacing;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSpacing;
  ResetFpuFlags(saved);
End;

class procedure ImGui.Dummy(size: ImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igDummy(size);
  ResetFpuFlags(saved);
End;

class procedure ImGui.Indent(indent_w: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igIndent(indent_w);
  ResetFpuFlags(saved);
End;

class procedure ImGui.Unindent(indent_w: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igUnindent(indent_w);
  ResetFpuFlags(saved);
End;

class procedure ImGui.BeginGroup;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igBeginGroup;
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndGroup;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndGroup;
  ResetFpuFlags(saved);
End;

class function ImGui.GetCursorPos: ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetCursorPos(@Result);
  ResetFpuFlags(saved);
End;

class function ImGui.GetCursorPosX: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetCursorPosX;
  ResetFpuFlags(saved);
End;

class function ImGui.GetCursorPosY: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetCursorPosY;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetCursorPos(local_pos: ImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetCursorPos(local_pos);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetCursorPosX(x: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetCursorPosX(x);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetCursorPosY(y: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetCursorPosY(y);
  ResetFpuFlags(saved);
End;

class function ImGui.GetCursorStartPos: ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetCursorStartPos(@Result);
  ResetFpuFlags(saved);
End;

class function ImGui.GetCursorScreenPos: ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetCursorScreenPos(@Result);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetCursorScreenPos(pos: ImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetCursorScreenPos(pos);
  ResetFpuFlags(saved);
End;

class procedure ImGui.igAlignTextToFramePadding;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igAlignTextToFramePadding;
  ResetFpuFlags(saved);
End;

class function ImGui.GetTextLineHeight: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetTextLineHeight;
  ResetFpuFlags(saved);
End;

class function ImGui.GetTextLineHeightWithSpacing: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetTextLineHeightWithSpacing;
  ResetFpuFlags(saved);
End;

class function ImGui.GetFrameHeight: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetFrameHeight;
  ResetFpuFlags(saved);
End;

class function ImGui.GetFrameHeightWithSpacing: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetFrameHeightWithSpacing;
  ResetFpuFlags(saved);
End;

{ Columns }
class procedure ImGui.Columns(Count: Longint; id: PChar; border: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igColumns(Count, id, border);
  ResetFpuFlags(saved);
End;

class procedure ImGui.NextColumn;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igNextColumn;
  ResetFpuFlags(saved);
End;

class function ImGui.GetColumnIndex: Longint;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetColumnIndex;
  ResetFpuFlags(saved);
End;

class function ImGui.GetColumnOffset(column_index: Longint): Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetColumnOffset(column_index);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetColumnOffset(column_index: Longint; offset_x: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetColumnOffset(column_index, offset_x);
  ResetFpuFlags(saved);
End;

class function ImGui.GetColumnWidth(column_index: Longint): Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetColumnWidth(column_index);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetColumnWidth(column_index: Longint; Width: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetColumnWidth(column_index, Width);
  ResetFpuFlags(saved);
End;

class function ImGui.GetColumnsCount: Longint;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetColumnsCount;
  ResetFpuFlags(saved);
End;

{ ID scopes }
{ If you are creating widgets in a loop you most likely want to push a unique identifier so ImGui can differentiate them }
{ You can also use "##extra" within your widget name to distinguish them from each others (see 'Programmer Guide') }
class procedure ImGui.PushIdStr(str_id: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushID_Str(str_id);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushIdStrRange(str_begin: PChar; str_end: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushID_StrStr(str_begin, str_end);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushIdPtr(ptr_id: pointer);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushID_Ptr(ptr_id);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PushIdInt(int_id: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushID_Int(int_id);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopId;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopId;
  ResetFpuFlags(saved);
End;

class function ImGui.GetIdStr(str_id: PChar): ImGuiID;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetID_Str(str_id);
  ResetFpuFlags(saved);
End;

class function ImGui.GetIdStrRange(str_begin: PChar; str_end: PChar): ImGuiID;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetID_StrStr(str_begin, str_end);
  ResetFpuFlags(saved);
End;

class function ImGui.GetIdPtr(ptr_id: pointer): ImGuiID;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetID_Ptr(ptr_id);
  ResetFpuFlags(saved);
End;

{ Widgets: Text }
class procedure ImGui.Text(const text_: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igText(PChar(text_), []);
  ResetFpuFlags(saved);
End;

class procedure ImGui.Text(const Fmt: String; const Args: array of const);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Text(Format(fmt, args));
  ResetFpuFlags(saved);
End;

class procedure ImGui.TextColored(col: ImVec4; fmt: PChar; args: array of const);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  TextColored(col, Format(fmt, args));
  ResetFpuFlags(saved);
End;

class procedure ImGui.TextColored(col: ImVec4; const fmt: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igTextColored(col, PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class procedure ImGui.TextDisabled(const fmt: String; args: array of const);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  TextDisabled(Format(fmt, args));
  ResetFpuFlags(saved);
End;

class procedure ImGui.TextDisabled(const fmt: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igTextDisabled(PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class procedure ImGui.TextWrapped(const fmt: String; args: array of const);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  TextWrapped(Format(fmt, args));
  ResetFpuFlags(saved);
End;

class procedure ImGui.TextWrapped(const fmt: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igTextWrapped(PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class procedure ImGui.TextUnformatted(const _text: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igTextUnformatted(PChar(_text), nil);
  ResetFpuFlags(saved);
End;

class procedure ImGui.TextUnformatted(const _text: PChar;
  const text_end: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igTextUnformatted(_text, text_end);
  ResetFpuFlags(saved);
End;

class procedure ImGui.LabelText(_label: String; fmt: PChar; args: array of const);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  LabelText(_label, Format(fmt, args));
  ResetFpuFlags(saved);
End;

class procedure ImGui.LabelText(_label: String; fmt: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igLabelText(PChar(_label), PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class procedure ImGui.Bullet;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igBullet;
  ResetFpuFlags(saved);
End;

class procedure ImGui.BulletText(const fmt: String; args: array of const);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  BulletText(Format(fmt, args));
  ResetFpuFlags(saved);
End;

class procedure ImGui.BulletText(const fmt: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igBulletText(PChar(fmt), []);
  ResetFpuFlags(saved);
End;

{ Widgets: Main }
class function ImGui.Button(_label: String; size: ImVec2): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igButton(PChar(_label), size);
  ResetFpuFlags(saved);
End;

class function ImGui.Button(_label: String): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := Button(_label, ImVec2.New(0, 0));
  ResetFpuFlags(saved);
End;

class function ImGui.SmallButton(_label: PChar): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSmallButton(_label);
  ResetFpuFlags(saved);
End;

class function ImGui.InvisibleButton(str_id: PChar; size: ImVec2; flags: ImGuiButtonFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInvisibleButton(str_id, size, flags);
  ResetFpuFlags(saved);
End;

class procedure ImGui.Image(user_texture_id: ImTextureID; size: ImVec2; uv0: ImVec2; uv1: ImVec2; tint_col: ImVec4; border_col: ImVec4);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igImage(user_texture_id, size, uv0, uv1, tint_col, border_col);
  ResetFpuFlags(saved);
End;

class function ImGui.ImageButton(str_id: PChar; user_texture_id: ImTextureID; size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4; tint_col: ImVec4): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igImageButton(str_id, user_texture_id, size, uv0, uv1, bg_col, tint_col);
  ResetFpuFlags(saved);
End;

class function ImGui.Checkbox(_label: PChar; v: PBoolean): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igCheckbox(_label, v);
  ResetFpuFlags(saved);
End;

class function ImGui.CheckboxFlags(_label: PChar; flags: PUInt32; flags_value: Int32): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  { TODO: Do we need to implement other igCheckboxFlags funcs - Time : 11/3/2023 11:46:25 PM }
  Result := igCheckboxFlags_UintPtr(_label, flags, flags_value);
  ResetFpuFlags(saved);
End;

class function ImGui.RadioButtonBool(_label: PChar; active: Boolean): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igRadioButton_Bool(_label, active);
  ResetFpuFlags(saved);
End;

class function ImGui.RadioButton(_label: PChar; v: Plongint; v_button: Longint): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igRadioButton_IntPtr(_label, v, v_button);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PlotLines(_label: PChar; values: Psingle; values_count: Longint; values_offset: Longint; overlay_text: PChar; scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPlotLines_FloatPtr(_label, values, values_count, values_offset, overlay_text,
    scale_min, scale_max, graph_size, stride);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PlotHistogram(_label: PChar; values: Psingle; values_count: Longint; values_offset: Longint; overlay_text: PChar; scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPlotHistogram_FloatPtr(_label, values, values_count, values_offset, overlay_text,
    scale_min, scale_max, graph_size, stride);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ProgressBar(fraction: Single; size_arg: ImVec2; overlay: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igProgressBar(fraction, size_arg, overlay);
  ResetFpuFlags(saved);
End;

class function ImGui.BeginCombo(
  const _label, preview_value: String; flags: ImGuiComboFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginCombo(PChar(_label), PChar(preview_value), flags);
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndCombo;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndCombo;
  ResetFpuFlags(saved);
End;

class function ImGui.Combo(_label: String; current_item: Plongint; items: PPchar; items_count: Longint; height_in_items: Longint): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igCombo_Str_arr(PChar(_label), current_item, items,
    items_count, height_in_items);
  ResetFpuFlags(saved);
End;

class function ImGui.Combo2(_label: String; current_item: Plongint; items_separated_by_zeros: PChar; height_in_items: Longint): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igCombo_Str(PChar(_label), current_item, items_separated_by_zeros,
    height_in_items);
  ResetFpuFlags(saved);
End;

class function ImGui.ColorButton(desc_id: PChar; col: ImVec4; flags: ImGuiColorEditFlags; size: ImVec2): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igColorButton(desc_id, col, flags, size);
  ResetFpuFlags(saved);
End;

class function ImGui.ColorEdit3(_label: PChar; col: PSingle; flags: ImGuiColorEditFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igColorEdit3(_label, col, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.ColorEdit4(_label: PChar; col: PSingle; flags: ImGuiColorEditFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igColorEdit4(_label, col, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.ColorPicker3(_label: PChar; col: PSingle; flags: ImGuiColorEditFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igColorPicker3(_label, col, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.ColorPicker4(_label: PChar; col: PSingle; flags: ImGuiColorEditFlags; ref_col: PSingle): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igColorPicker4(_label, col, flags, ref_col);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetColorEditOptions(flags: ImGuiColorEditFlags);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetColorEditOptions(flags);
  ResetFpuFlags(saved);
End;

{ Widgets: Sliders (tip: ctrl+click on a slider to input text) }
class function ImGui.SliderFloat(_label: PChar; v: Psingle; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderFloat(_label, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.SliderFloat2(_label: PChar; v: PSingle; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderFloat2(_label, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.SliderFloat3(_label: PChar; v: PSingle; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderFloat3(_label, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.SliderFloat4(_label: PChar; v: PSingle; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderFloat4(_label, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.SliderAngle(_label: PChar; v_rad: Psingle; v_degrees_min: Single; v_degrees_max: Single; format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderAngle(_label, v_rad, v_degrees_min, v_degrees_max, format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.SliderInt(_label: PChar; v: Plongint; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderInt(_label, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.SliderInt2(_label: PChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderInt2(_label, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.SliderInt3(_label: PChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderInt3(_label, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.SliderInt4(_label: PChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSliderInt4(_label, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.VSliderFloat(_label: PChar; size: ImVec2; v: Psingle; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igVSliderFloat(_label, size, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.VSliderInt(_label: PChar; size: ImVec2; v: Plongint; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igVSliderInt(_label, size, v, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

{ Widgets: Drags (tip: ctrl+click on a drag box to input text) }
// For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every functions, remember than a 'float v[3]' function argument is the same as 'float* v'. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
{ If v_max >= v_max we have no bound }
class function ImGui.DragFloat(_label: PChar; v: Psingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragFloat(_label, v, v_speed, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.DragFloat2(_label: PChar; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragFloat2(_label, v, v_speed, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.DragFloat3(_label: PChar; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragFloat3(_label, v, v_speed, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.DragFloat4(_label: PChar; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragFloat4(_label, v, v_speed, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.DragFloatRange2(_label: PChar; v_current_min: Psingle; v_current_max: Psingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PChar; display_format_max: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragFloatRange2(_label, v_current_min, v_current_max,
    v_speed, v_min, v_max, display_format, display_format_max, flags);
  ResetFpuFlags(saved);
End;
{ If v_max >= v_max we have no bound }
class function ImGui.DragInt(_label: PChar; v: Plongint; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragInt(_label, v, v_speed, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.DragInt2(_label: PChar; v: PInteger; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragInt2(_label, v, v_speed, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.DragInt3(_label: PChar; v: PInteger; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragInt3(_label, v, v_speed, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.DragInt4(_label: PChar; v: PInteger; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragInt4(_label, v, v_speed, v_min, v_max, display_format, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.DragIntRange2(_label: PChar; v_current_min: Plongint; v_current_max: Plongint; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PChar; display_format_max: PChar; flags: ImGuiSliderFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igDragIntRange2(_label, v_current_min, v_current_max,
    v_speed, v_min, v_max, display_format, display_format_max, flags);
  ResetFpuFlags(saved);
End;

{ Widgets: Input }
class function ImGui.InputText(_label: PChar; buf: PChar; buf_size: size_t; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: pointer): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputText(_label, buf, buf_size, flags, callback, user_data);
  ResetFpuFlags(saved);
End;

class function ImGui.InputTextMultiline(_label: PChar; buf: PChar; buf_size: size_t; size: ImVec2; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: pointer): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputTextMultiline(_label, buf, buf_size, size, flags,
    callback, user_data);
  ResetFpuFlags(saved);
End;

class function ImGui.InputFloat(_label: PChar; v: Psingle; step: Single; step_fast: Single; format: PChar; extra_flags: ImGuiInputTextFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputFloat(_label, v, step, step_fast, format, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.InputFloat2(_label: PChar; v: PSingle; format: PChar; extra_flags: ImGuiInputTextFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputFloat2(_label, v, format, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.InputFloat3(_label: PChar; v: PSingle; format: PChar; extra_flags: ImGuiInputTextFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputFloat3(_label, v, format, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.InputFloat4(_label: PChar; v: PSingle; format: PChar; extra_flags: ImGuiInputTextFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputFloat4(_label, v, format, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.InputInt(_label: PChar; v: Plongint; step: Longint; step_fast: Longint; extra_flags: ImGuiInputTextFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputInt(_label, v, step, step_fast, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.InputInt2(_label: PChar; v: PInteger; extra_flags: ImGuiInputTextFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputInt2(_label, v, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.InputInt3(_label: PChar; v: PInteger; extra_flags: ImGuiInputTextFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputInt3(_label, v, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.InputInt4(_label: PChar; v: PInteger; extra_flags: ImGuiInputTextFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igInputInt4(_label, v, extra_flags);
  ResetFpuFlags(saved);
End;

{ Widgets: Trees }
class function ImGui.TreeNode(_label: String): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igTreeNode_Str(PChar(_label));
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNode(str_id: String; fmt: String; args: array of const): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := TreeNode(str_id, Format(fmt, args));
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNode(str_id: String; fmt: String): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igTreeNode_StrStr(PChar(str_id), PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNode(ptr_id: pointer; fmt: String; args: array of const): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := TreeNode(ptr_id, Format(fmt, args));
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNode(ptr_id: pointer; fmt: String): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igTreeNode_Ptr(ptr_id, PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNodeEx(_label: PChar; flags: ImGuiTreeNodeFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igTreeNodeEx_Str(_label, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNodeEx(str_id: PChar; flags: ImGuiTreeNodeFlags; fmt: String; args: array of const): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := TreeNodeEx(str_id, flags, Format(fmt, args));
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNodeEx(str_id: PChar; flags: ImGuiTreeNodeFlags; fmt: String): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igTreeNodeEx_StrStr(str_id, flags, PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags; fmt: String; args: array of const): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := TreeNodeEx(ptr_id, flags, Format(fmt, args));
  ResetFpuFlags(saved);
End;

class function ImGui.TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags; fmt: String): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igTreeNodeEx_Ptr(ptr_id, flags, PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class procedure ImGui.TreePushStr(str_id: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igTreePush_Str(str_id);
  ResetFpuFlags(saved);
End;

class procedure ImGui.TreePushPtr(ptr_id: pointer);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igTreePush_Ptr(ptr_id);
  ResetFpuFlags(saved);
End;

class procedure ImGui.TreePop;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igTreePop;
  ResetFpuFlags(saved);
End;

// ImGui.TreeAdvanceToLabelPos -> use ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetTreeNodeToLabelSpacing());

class function ImGui.GetTreeNodeToLabelSpacing: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetTreeNodeToLabelSpacing;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextTreeNodeOpen(opened: Boolean; cond: ImGuiCond);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextItemOpen(opened, cond);
  ResetFpuFlags(saved);
End;

class function ImGui.CollapsingHeader(_label: PChar; flags: ImGuiTreeNodeFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igCollapsingHeader_TreeNodeFlags(_label, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.CollapsingHeader(_label: PChar; p_open: PBoolean; flags: ImGuiTreeNodeFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igCollapsingHeader_BoolPtr(_label, p_open, flags);
  ResetFpuFlags(saved);
End;

{ Widgets: Selectable / Lists }
class function ImGui.Selectable(_label: String; selected: Boolean; flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSelectable_Bool(PChar(_label), selected, flags, size);
  ResetFpuFlags(saved);
End;

class function ImGui.Selectable(_label: String; selected: Boolean; flags: ImGuiSelectableFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := Selectable(_label, selected, flags, ImVec2.New(0, 0));
  ResetFpuFlags(saved);
End;

class function ImGui.SelectableEx(_label: PChar; p_selected: PBoolean; flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igSelectable_BoolPtr(_label, p_selected, flags, size);
  ResetFpuFlags(saved);
End;

class function ImGui.ListBox(_label: PChar; current_item: Plongint; items: PPchar; items_count: Longint; height_in_items: Longint): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igListBox_Str_arr(_label, current_item, items, items_count, height_in_items);
  ResetFpuFlags(saved);
End;

class function ImGui.BeginListBox(_label: PChar; size: ImVec2): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginListBox(_label, size);
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndListBox;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndListBox;
  ResetFpuFlags(saved);
End;

{ Widgets: Value() Helpers. Output single value in "name: value" format (tip: freely declare your own within the ImGui namespace!) }
class procedure ImGui.ValueBool(prefix: PChar; b: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igValue_Bool(prefix, b);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ValueInt(prefix: PChar; v: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igValue_Int(prefix, v);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ValueUInt(prefix: PChar; v: dword);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igValue_Uint(prefix, v);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ValueFloat(prefix: PChar; v: Single; float_format: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igValue_Float(prefix, v, float_format);
  ResetFpuFlags(saved);
End;

{ Tooltip }
class procedure ImGui.SetTooltip(fmt: String; args: array of const);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  SetTooltip(Format(fmt, args));
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetTooltip(fmt: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetTooltip(PChar(fmt), []);
  ResetFpuFlags(saved);
End;

class procedure ImGui.BeginTooltip;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igBeginTooltip;
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndTooltip;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndTooltip;
  ResetFpuFlags(saved);
End;

{ Widgets: Menus }
class function ImGui.BeginMainMenuBar: Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginMainMenuBar;
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndMainMenuBar;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndMainMenuBar;
  ResetFpuFlags(saved);
End;

class function ImGui.BeginMenuBar: Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginMenuBar;
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndMenuBar;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndMenuBar;
  ResetFpuFlags(saved);
End;

class function ImGui.BeginMenu(_label: PChar; Enabled: Boolean): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginMenu(_label, Enabled);
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndMenu;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndMenu;
  ResetFpuFlags(saved);
End;

class function ImGui.MenuItem(_label: PChar; shortcut: PChar; selected: Boolean; Enabled: Boolean): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igMenuItem_Bool(_label, shortcut, selected, Enabled);
  ResetFpuFlags(saved);
End;

class function ImGui.MenuItem(_label: PChar; shortcut: PChar; p_selected: PBoolean; Enabled: Boolean): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igMenuItem_BoolPtr(_label, shortcut, p_selected, Enabled);
  ResetFpuFlags(saved);
End;

{ Popup }
class procedure ImGui.OpenPopup(str_id: PChar; flags: ImGuiPopupFlags);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igOpenPopup_Str(str_id, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.BeginPopup(str_id: PChar; flags: ImGuiWindowFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginPopup(str_id, flags);
  ResetFpuFlags(saved);
End;

class function ImGui.BeginPopupModal(Name: PChar; p_open: PBoolean; extra_flags: ImGuiWindowFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginPopupModal(Name, p_open, extra_flags);
  ResetFpuFlags(saved);
End;

class function ImGui.BeginPopupContextItem(str_id: PChar; mouse_button: ImGuiPopupFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginPopupContextItem(str_id, mouse_button);
  ResetFpuFlags(saved);
End;

class function ImGui.BeginPopupContextWindow(str_id: PChar; mouse_button: ImGuiPopupFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginPopupContextWindow(str_id, mouse_button);
  ResetFpuFlags(saved);
End;

class function ImGui.BeginPopupContextVoid(str_id: PChar; mouse_button: ImGuiPopupFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginPopupContextVoid(str_id, mouse_button);
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndPopup;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndPopup;
  ResetFpuFlags(saved);
End;

class function ImGui.IsPopupOpen(str_id: PChar; flags: ImGuiPopupFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsPopupOpen_Str(str_id, flags);
  ResetFpuFlags(saved);
End;

class procedure ImGui.CloseCurrentPopup;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igCloseCurrentPopup;
  ResetFpuFlags(saved);
End;

{ Logging: all text output from interface is redirected to tty/file/clipboard. Tree nodes are automatically opened. }
class procedure ImGui.LogToTTY(max_depth: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igLogToTTY(max_depth);
  ResetFpuFlags(saved);
End;

class procedure ImGui.LogToFile(max_depth: Longint; filename: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igLogToFile(max_depth, filename);
  ResetFpuFlags(saved);
End;

class procedure ImGui.LogToClipboard(max_depth: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igLogToClipboard(max_depth);
  ResetFpuFlags(saved);
End;

class procedure ImGui.LogFinish;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igLogFinish;
  ResetFpuFlags(saved);
End;

class procedure ImGui.LogButtons;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igLogButtons;
  ResetFpuFlags(saved);
End;

class procedure ImGui.LogText(const fmt: String; args: array of const);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  LogText(Format(fmt, args));
  ResetFpuFlags(saved);
End;

class procedure ImGui.LogText(const fmt: String);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igLogText(PChar(fmt), []);
  ResetFpuFlags(saved);
End;

{ Clipping }
class procedure ImGui.PushClipRect(clip_rect_min: ImVec2; clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);
  ResetFpuFlags(saved);
End;

class procedure ImGui.PopClipRect;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igPopClipRect;
  ResetFpuFlags(saved);
End;

class procedure ImGui.StyleColorsClassic(dst: PImGuiStyle);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igStyleColorsClassic(dst);
  ResetFpuFlags(saved);
End;

class procedure ImGui.StyleColorsDark(dst: PImGuiStyle);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igStyleColorsDark(dst);
  ResetFpuFlags(saved);
End;

class procedure ImGui.StyleColorsLight(dst: PImGuiStyle);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igStyleColorsLight(dst);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetItemDefaultFocus;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetItemDefaultFocus;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetKeyboardFocusHere(offset: Integer);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetKeyboardFocusHere(offset);
  ResetFpuFlags(saved);
End;

{ Utilities }
class function ImGui.IsItemHovered(flags: ImGuiHoveredFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsItemHovered(flags);
  ResetFpuFlags(saved);
End;

class function ImGui.IsItemActive: Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsItemActive;
  ResetFpuFlags(saved);
End;

class function ImGui.IsItemClicked(mouse_button: ImGuiMouseButton): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsItemClicked(mouse_button);
  ResetFpuFlags(saved);
End;

class function ImGui.IsItemVisible: Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsItemVisible;
  ResetFpuFlags(saved);
End;

class function ImGui.IsAnyItemHovered: Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsAnyItemHovered;
  ResetFpuFlags(saved);
End;

class function ImGui.IsAnyItemActive: Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsAnyItemActive;
  ResetFpuFlags(saved);
End;

class procedure ImGui.GetItemRectMin(pOut: PImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetItemRectMin(pOut);
  ResetFpuFlags(saved);
End;

class procedure ImGui.GetItemRectMax(pOut: PImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetItemRectMax(pOut);
  ResetFpuFlags(saved);
End;

class procedure ImGui.GetItemRectSize(pOut: PImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetItemRectSize(pOut);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextItemAllowOverlap;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextItemAllowOverlap();
  ResetFpuFlags(saved);
End;

class function ImGui.IsWindowFocused(flags: ImGuiFocusedFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsWindowFocused(flags);
  ResetFpuFlags(saved);
End;

class function ImGui.IsWindowHovered(flags: ImGuiHoveredFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsWindowHovered(flags);
  ResetFpuFlags(saved);
End;

class function ImGui.IsRectVisible(const item_size: ImVec2): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsRectVisible_Nil(item_size);
  ResetFpuFlags(saved);
End;

class function ImGui.IsRectVisible(const rect_min, rect_max: ImVec2): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsRectVisible_Vec2(rect_min, rect_max);
  ResetFpuFlags(saved);
End;

class function ImGui.GetTime: Single;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetTime;
  ResetFpuFlags(saved);
End;

class function ImGui.GetFrameCount: Longint;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetFrameCount;
  ResetFpuFlags(saved);
End;

class function ImGui.GetStyleColorName(idx: ImGuiCol): PChar;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetStyleColorName(idx);
  ResetFpuFlags(saved);
End;

class function ImGui.CalcTextSize(_text: PChar; text_end: PChar; hide_text_after_double_hash: Boolean; wrap_width: Single): ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igCalcTextSize(@Result, _text, text_end, hide_text_after_double_hash, wrap_width);
  ResetFpuFlags(saved);
End;

{ TODO: Add ImGuiListClipper - Time : 11/4/2023 12:42:03 AM }

class function ImGui.BeginChildFrame(id: ImGuiID; size: ImVec2; extra_flags: ImGuiWindowFlags): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igBeginChildFrame(id, size, extra_flags);
  ResetFpuFlags(saved);
End;

class procedure ImGui.EndChildFrame;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igEndChildFrame;
  ResetFpuFlags(saved);
End;

class procedure ImGui.ColorConvertU32ToFloat4(pOut: PImVec4; in_: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igColorConvertU32ToFloat4(pOut, in_);
  ResetFpuFlags(saved);
End;

class function ImGui.ColorConvertFloat4ToU32(in_: ImVec4): ImU32;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igColorConvertFloat4ToU32(in_);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ColorConvertRGBtoHSV(r: Single; g: Single; b: Single; out_h: Psingle; out_s: Psingle; out_v: Psingle);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ColorConvertHSVtoRGB(h: Single; s: Single; v: Single; out_r: Psingle; out_g: Psingle; out_b: Psingle);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b);
  ResetFpuFlags(saved);
End;

class function ImGui.GetKeyIndex(key: ImGuiKey): ImGuiKey;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetKeyIndex(key);
  ResetFpuFlags(saved);
End;

class function ImGui.IsKeyDown(user_key_index: ImGuiKey): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsKeyDown_Nil(user_key_index);
  ResetFpuFlags(saved);
End;

class function ImGui.IsKeyPressed(user_key_index: ImGuiKey; _repeat: Boolean): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsKeyPressed_Bool(user_key_index, _repeat);
  ResetFpuFlags(saved);
End;

class function ImGui.IsKeyReleased(user_key_index: ImGuiKey): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsKeyReleased_Nil(user_key_index);
  ResetFpuFlags(saved);
End;

class function ImGui.IsMouseDown(_button: ImGuiMouseButton): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsMouseDown_Nil(_button);
  ResetFpuFlags(saved);
End;

class function ImGui.IsMouseClicked(_button: ImGuiMouseButton; _repeat: Boolean): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsMouseClicked_Bool(_button, _repeat);
  ResetFpuFlags(saved);
End;

class function ImGui.IsMouseDoubleClicked(_button: ImGuiMouseButton): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsMouseDoubleClicked(_button);
  ResetFpuFlags(saved);
End;

class function ImGui.IsMouseReleased(_button: ImGuiMouseButton): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsMouseReleased_Nil(_button);
  ResetFpuFlags(saved);
End;

class function ImGui.IsMouseHoveringRect(r_min: ImVec2; r_max: ImVec2; clip: Boolean): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsMouseHoveringRect(r_min, r_max, clip);
  ResetFpuFlags(saved);
End;

class function ImGui.IsMouseDragging(_button: ImGuiMouseButton; lock_threshold: Single): Boolean;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igIsMouseDragging(_button, lock_threshold);
  ResetFpuFlags(saved);
End;

class function ImGui.GetMousePos: ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetMousePos(@Result);
  ResetFpuFlags(saved);
End;

class function ImGui.GetMousePosOnOpeningCurrentPopup: ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetMousePosOnOpeningCurrentPopup(@Result);
  ResetFpuFlags(saved);
End;

class function ImGui.GetMouseDragDelta(_button: ImGuiMouseButton; lock_threshold: Single): ImVec2;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igGetMouseDragDelta(@Result, _button, lock_threshold);
  ResetFpuFlags(saved);
End;

class procedure ImGui.ResetMouseDragDelta(_button: ImGuiMouseButton);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igResetMouseDragDelta(_button);
  ResetFpuFlags(saved);
End;

class function ImGui.GetMouseCursor: ImGuiMouseCursor;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetMouseCursor;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetMouseCursor(_type: ImGuiMouseCursor);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetMouseCursor(_type);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextFrameWantCaptureKeyboard(capture: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextFrameWantCaptureKeyboard(capture);
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetNextFrameWantCaptureMouse(capture: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetNextFrameWantCaptureMouse(capture);
  ResetFpuFlags(saved);
End;

{ Helpers functions to access functions pointers in ImGui::GetIO() }
class function ImGui.MemAlloc(sz: size_t): pointer;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igMemAlloc(sz);
  ResetFpuFlags(saved);
End;

class procedure ImGui.MemFree(ptr: pointer);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igMemFree(ptr);
  ResetFpuFlags(saved);
End;

class function ImGui.GetClipboardText: PChar;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetClipboardText;
  ResetFpuFlags(saved);
End;

class procedure ImGui.SetClipboardText(_text: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  igSetClipboardText(_text);
  ResetFpuFlags(saved);
End;

{ Internal state access - if you want to share ImGui state between modules (e.g. DLL) or allocate it yourself }
class function ImGui.GetVersion: PChar;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  Result := igGetVersion;
  ResetFpuFlags(saved);
End;

{ TImFontAtlasHelper }

Procedure TImFontAtlasHelper.GetTexDataAsAlpha8(out_pixels: PPImU8;
  out_width: PInt32; out_height: PInt32; out_bytes_per_pixel: PInt32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImFontAtlas_GetTexDataAsAlpha8(@Self, out_pixels, out_width,
    out_height, out_bytes_per_pixel);
  ResetFpuFlags(saved);
End;

Procedure TImFontAtlasHelper.SetTexID(id: ImTextureID); Cdecl;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImFontAtlas_SetTexID(@Self, id);
  ResetFpuFlags(saved);
End;

{ TPImDrawListHelper }
//procedure TPImDrawListHelper.AddRectFilled(p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags);
//begin
//  ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, flags);
//end;


{ TImDrawListHelper }

Procedure TImDrawListHelper.PushClipRect(clip_rect_min: ImVec2;
  clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PushClipRect(@self, clip_rect_min, clip_rect_max,
    intersect_with_current_clip_rect);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PushClipRectFullScreen;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PushClipRectFullScreen(@self);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PopClipRect;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PopClipRect(@self);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PushTextureID(texture_id: ImTextureID);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PushTextureID(@self, texture_id);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PopTextureID;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PopTextureID(@self);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddLine(p1 : ImVec2; p2 : ImVec2; col : ImU32; thickness : Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddLine(@self, p1, p2, col, thickness);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddRect(a: ImVec2; b: ImVec2; col: ImU32;
  rounding: Single; rounding_corners_flags: ImDrawFlags; thickness: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddRect(@self, a, b, col, rounding, rounding_corners_flags, thickness);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddRectFilled(p_min: ImVec2; p_max: ImVec2;
  col: ImU32; rounding: Single; flags: ImDrawFlags);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddRectFilled(@self, p_min, p_max, col, rounding, flags);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddRectFilledMultiColor(a: ImVec2; b: ImVec2;
  col_upr_left: ImU32; col_upr_right: ImU32; col_bot_right: ImU32; col_bot_left: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddRectFilledMultiColor(@self, a, b, col_upr_left,
    col_upr_right, col_bot_right, col_bot_left);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddQuad(a: ImVec2; b: ImVec2; c: ImVec2;
  d: ImVec2; col: ImU32; thickness: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddQuad(@self, a, b, c, d, col, thickness);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddQuadFilled(a: ImVec2; b: ImVec2;
  c: ImVec2; d: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddQuadFilled(@self, a, b, c, d, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddTriangle(a: ImVec2; b: ImVec2; c: ImVec2;
  col: ImU32; thickness: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddTriangle(@self, a, b, c, col, thickness);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddTriangleFilled(a: ImVec2; b: ImVec2;
  c: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddTriangleFilled(@self, a, b, c, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddCircle(centre: ImVec2; radius: Single;
  col: ImU32; num_segments: Longint; thickness: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddCircle(@self, centre, radius, col, num_segments, thickness);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddCircleFilled(centre: ImVec2; radius: Single;
  col: ImU32; num_segments: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddCircleFilled(@self, centre, radius, col, num_segments);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddText(pos: ImVec2; col: ImU32;
  text_begin: PChar; text_end: PChar);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddText_Vec2(@self, pos, col, text_begin, text_end);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddTextExt(font: ImFont; font_size: Single;
  pos: ImVec2; col: ImU32; text_begin: PChar; text_end: PChar;
  wrap_width: Single; cpu_fine_clip_rect: ImVec4);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddText_FontPtr(@self, @font, font_size, pos, col, text_begin,
    text_end, wrap_width, @cpu_fine_clip_rect);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddImage(user_texture_id: ImTextureID;
  a: ImVec2; b: ImVec2; uva: ImVec2; uvb: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddImage(@self, user_texture_id, a, b, uva, uvb, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddImageQuad(user_texture_id: ImTextureID;
  Const a, b, c, d: ImVec2; Const uva, uvb, uvc, uvd: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddImageQuad(@self, user_texture_id, a, b, c, d, uva, uvb, uvc, uvd, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddPolyline(points: PImVec2; num_points: Integer;
  col: ImU32; flags: ImDrawFlags; thickness: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddPolyline(@self, points, num_points, col, flags, thickness);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddConvexPolyFilled(points: PImVec2;
  num_points: Integer; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddConvexPolyFilled(@self, points, num_points, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.AddBezierCubic(p1: ImVec2; p2: ImVec2;
  p3: ImVec2; p4: ImVec2; col: ImU32; thickness: Single; num_segments: Integer);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddBezierCubic(@self, p1, p2, p3, p4, col, thickness, num_segments);
  ResetFpuFlags(saved);
End;

{ Stateful path API, add points then finish with PathFill() or PathStroke() }
Procedure TImDrawListHelper.PathClear;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PathClear(@self);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PathLineTo(pos: ImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PathLineTo(@self, pos);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PathLineToMergeDuplicate(pos: ImVec2);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PathLineToMergeDuplicate(@self, pos);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PathFillConvex(col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PathFillConvex(@self, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PathStroke(col: ImU32; flags: ImDrawFlags;
  thickness: Single);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PathStroke(@self, col, flags, thickness);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PathArcTo(centre: ImVec2; radius: Single;
  a_min: Single; a_max: Single; num_segments: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PathArcTo(@self, centre, radius, a_min, a_max, num_segments);
  ResetFpuFlags(saved);
End;
{ Use precomputed angles for a 12 steps circle }
Procedure TImDrawListHelper.PathArcToFast(centre: ImVec2; radius: Single;
  a_min_of_12: Longint; a_max_of_12: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PathArcToFast(@self, centre, radius, a_min_of_12, a_max_of_12);
  ResetFpuFlags(saved);
End;
//procedure TImDrawListHelper.PathBezierCurveTo(p1: ImVec2; p2: ImVec2; p3: ImVec2; num_segments: longint);
//    begin ImDrawList_PathBezierCurveTo(@self, p1, p2, p3, num_segments) end;
Procedure TImDrawListHelper.PathRect(rect_min: ImVec2; rect_max: ImVec2;
  rounding: Single; rounding_corners_flags: ImDrawFlags);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PathRect(@self, rect_min, rect_max, rounding, rounding_corners_flags);
  ResetFpuFlags(saved);
End;

{ Channels }
Procedure TImDrawListHelper.ChannelsSplit(channels_count: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_ChannelsSplit(@self, channels_count);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.ChannelsMerge;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_ChannelsMerge(@self);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.ChannelsSetCurrent(channel_index: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_ChannelsSetCurrent(@self, channel_index);
  ResetFpuFlags(saved);
End;

{ Advanced }
{ Your rendering function must check for 'UserCallback' label_ ImDrawCmd and call the function instead of rendering triangles. }
Procedure TImDrawListHelper.AddCallback(callback: ImDrawCallback;
  callback_data: pointer);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddCallback(@self, callback, callback_data);
  ResetFpuFlags(saved);
End;
{ This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible }
Procedure TImDrawListHelper.AddDrawCmd;
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_AddDrawCmd(@self);
  ResetFpuFlags(saved);
End;

{ Internal helpers }
Procedure TImDrawListHelper.PrimReserve(idx_count: Longint; vtx_count: Longint);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PrimReserve(@self, idx_count, vtx_count);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PrimRect(a: ImVec2; b: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PrimRect(@self, a, b, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PrimRectUV(a: ImVec2; b: ImVec2; uv_a: ImVec2;
  uv_b: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PrimRectUV(@self, a, b, uv_a, uv_b, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PrimQuadUV(a: ImVec2; b: ImVec2; c: ImVec2;
  d: ImVec2; uv_a: ImVec2; uv_b: ImVec2; uv_c: ImVec2; uv_d: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PrimQuadUV(@self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PrimWriteVtx(pos: ImVec2; uv: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PrimWriteVtx(@self, pos, uv, col);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PrimWriteIdx(idx: ImDrawIdx);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PrimWriteIdx(@self, idx);
  ResetFpuFlags(saved);
End;

Procedure TImDrawListHelper.PrimVtx(pos: ImVec2; uv: ImVec2; col: ImU32);
Var
  saved: Cardinal;
Begin
  saved := SetFpuFlags();
  ImDrawList_PrimVtx(@self, pos, uv, col);
  ResetFpuFlags(saved);
End;



End.
