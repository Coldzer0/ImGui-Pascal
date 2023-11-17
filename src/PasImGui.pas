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
    SharedSuffix = 'so';
  {$elseif defined(MSWINDOWS)}
  SharedSuffix = 'dll';
  {$endif}
  CIMGUI_LIB = 'cimgui.' + SharedSuffix;

Const
  IMGUI_VERSION = '1.90.0';
  IMGUI_VERSION_NUM = 19000;

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
    Class Function GetCenterViewPort(ViewPort: PImGuiViewport): ImVec2;

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

    Class Procedure AddInputCharactersUTF8(Const str: AnsiString);
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
    Class Function Begin_(Name: AnsiString; p_open: PBoolean = nil;
      flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure End_; {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginChild(str_id: AnsiString; size: ImVec2;
      child_flags: ImGuiChildFlags = ImGuiChildFlags_None;
      extra_flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
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
    Class Function GetWindowPos: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowSize: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowWidth(): Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowHeight(): Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowCollapsed(): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowFontScale(scale: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowPos(pos: ImVec2; cond: ImGuiCond;
      pivot: ImVec2); Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowPos(pos: ImVec2; cond: ImGuiCond = ImGuiCond_None);
      Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowPosCenter(cond: ImGuiCond = ImGuiCond_None);
    {$IfDef INLINE} inline;{$EndIf}
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
    Class Procedure SetWindowPosByName(Name: PAnsiChar; pos: ImVec2;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowSize2(Name: PAnsiChar; size: ImVec2;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowCollapsed2(Name: PAnsiChar; collapsed: Boolean;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowFocus2(Name: PAnsiChar); {$IfDef INLINE} inline;{$EndIf}
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
    Class Procedure PushStyleColor(idx: ImGuiCol; col: ImU32); Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleColor(idx: ImGuiCol; col: ImVec4); Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopStyleColor(Count: Longint = 1); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleVar(idx: ImGuiStyleVar; val: Single); Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleVar(idx: ImGuiStyleVar; val: ImVec2); Overload;
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
    Class Procedure SeparatorText(label_: AnsiString); {$IfDef INLINE} inline;{$EndIf}

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
    Class Procedure Columns(Count: Longint; id: PAnsiChar; border: Boolean);
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
    Class Procedure PushIdStr(str_id: PAnsiChar); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushIdStrRange(str_begin: PAnsiChar; str_end: PAnsiChar);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushIdPtr(ptr_id: pointer); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushIdInt(int_id: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopId; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetIdStr(str_id: PAnsiChar): ImGuiID; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetIdStrRange(str_begin: PAnsiChar; str_end: PAnsiChar): ImGuiID;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function GetIdPtr(ptr_id: pointer): ImGuiID; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Text }
    Class Procedure Text(Const text_: AnsiString);
      Overload;{$IfDef INLINE} inline;{$EndIf}
    Class Procedure Text(Const Fmt: AnsiString; Const Args: Array Of Const);
      Overload;{$IfDef INLINE} inline;{$EndIf}
    //procedure igTextV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextColored(col: ImVec4; fmt: PAnsiChar;
      args: Array Of Const); Overload;
    Class Procedure TextColored(col: ImVec4; Const fmt: AnsiString); Overload;
    //procedure igTextColoredV(col:ImVec4; fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextDisabled(Const fmt: AnsiString; args: Array Of Const);
      Overload; {inline;}
    Class Procedure TextDisabled(Const fmt: AnsiString); Overload;
    {$IfDef INLINE} inline;{$EndIf}
    //procedure igTextDisabledV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextWrapped(Const fmt: AnsiString; args: Array Of Const);
      Overload; {inline;}
    Class Procedure TextWrapped(Const fmt: AnsiString); Overload;
    {$IfDef INLINE} inline;{$EndIf}
    //procedure igTextWrappedV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextUnformatted(Const _text: AnsiString); Overload;
    Class Procedure TextUnformatted(Const _text: PAnsiChar;
      Const text_end: PAnsiChar = nil); Overload;
    Class Procedure LabelText(_label: AnsiString; fmt: AnsiString); Overload;
    Class Procedure LabelText(_label: AnsiString; fmt: PAnsiChar;
      args: Array Of Const); Overload;
    //procedure igLabelTextV(_label:PAnsiChar; fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure Bullet; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure BulletText(Const fmt: AnsiString; args: Array Of Const);
      Overload; {inline;}
    Class Procedure BulletText(Const fmt: AnsiString); Overload;
    {$IfDef INLINE} inline;{$EndIf}
    //procedure igBulletTextV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;

    { Widgets: Main }
    //Class Function Button(_label: AnsiString; size: ImVec2; flags: ImGuiButtonFlags): Boolean;
    Class Function Button(_label: AnsiString; size: ImVec2): Boolean; Overload;
    Class Function Button(_label: AnsiString): Boolean;
      Overload; //overload for default size (0,0)
    Class Function SmallButton(_label: PAnsiChar): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InvisibleButton(str_id: PAnsiChar; size: ImVec2;
      flags: ImGuiButtonFlags = ImGuiButtonFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure Image(user_texture_id: ImTextureID; size: ImVec2;
      uv0: ImVec2; uv1: ImVec2; tint_col: ImVec4; border_col: ImVec4);
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ImageButton(str_id: PAnsiChar; user_texture_id: ImTextureID;
      size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4;
      tint_col: ImVec4): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function Checkbox(_label: PAnsiChar; v: PBoolean): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function CheckboxFlags(_label: PAnsiChar; flags: PImU32;
      flags_value: Int32): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function RadioButtonBool(_label: PAnsiChar; active: Boolean): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function RadioButton(_label: PAnsiChar; v: PInteger;
      v_button: Longint): Boolean; {$IfDef INLINE} inline;{$EndIf}

    Class Function BeginCombo(Const _label, preview_value: AnsiString;
      flags: ImGuiComboFlags = ImGuiComboFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndCombo;
    Class Function Combo(_label: AnsiString; current_item: PInteger;
      items: PPAnsiChar; items_count: Longint; height_in_items: Longint): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function Combo2(_label: AnsiString; current_item: PInteger;
      items_separated_by_zeros: PAnsiChar; height_in_items: Longint): Boolean;
    {$IfDef INLINE} inline;{$EndIf}


    Class Function ColorButton(desc_id: PAnsiChar; col: ImVec4;
      flags: ImGuiColorEditFlags; size: ImVec2): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorEdit3(_label: PAnsiChar; col: PSingle;
      flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorEdit4(_label: PAnsiChar; col: PSingle;
      flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorPicker3(_label: PAnsiChar; col: PSingle;
      flags: ImGuiColorEditFlags = ImGuiColorEditFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ColorPicker4(_label: PAnsiChar; col: PSingle;
      flags: ImGuiColorEditFlags; ref_col: PSingle): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetColorEditOptions(flags: ImGuiColorEditFlags);
    {$IfDef INLINE} inline;{$EndIf}

    Class Procedure PlotLines(_label: PAnsiChar; values: Psingle;
      values_count: Longint; values_offset: Longint; overlay_text: PAnsiChar;
      scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
    {$IfDef INLINE} inline;{$EndIf}

    //TODO : func type
    //procedure igPlotLines2(_label:PAnsiChar; values_getter:function (data:pointer; idx:longint):single; data:pointer; values_count:longint; values_offset:longint;
    //            overlay_text:PAnsiChar; scale_min:single; scale_max:single; graph_size:ImVec2);cdecl;external ImguiLibName;
    Class Procedure PlotHistogram(_label: PAnsiChar; values: Psingle;
      values_count: Longint; values_offset: Longint; overlay_text: PAnsiChar;
      scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
    {$IfDef INLINE} inline;{$EndIf}

    //TODO : func type
    //procedure igPlotHistogram2(_label:PAnsiChar; values_getter:function (data:pointer; idx:longint):single; data:pointer; values_count:longint; values_offset:longint;
    //            overlay_text:PAnsiChar; scale_min:single; scale_max:single; graph_size:ImVec2);cdecl;external ImguiLibName;
    Class Procedure ProgressBar(fraction: Single; size_arg: ImVec2; overlay: PAnsiChar);
    {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Sliders (tip: ctrl+click on a slider to input text) }
    Class Function SliderFloat(_label: PAnsiChar; v: Psingle;
      v_min: Single; v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat2(_label: PAnsiChar; v: PSingle;
      v_min: Single; v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat3(_label: PAnsiChar; v: PSingle;
      v_min: Single; v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat4(_label: PAnsiChar; v: PSingle;
      v_min: Single; v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderAngle(_label: PAnsiChar; v_rad: Psingle;
      v_degrees_min: Single = -360.0; v_degrees_max: Single = +360.0;
      format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean; Inline;
    Class Function SliderInt(_label: PAnsiChar; v: PInteger; v_min: Longint;
      v_max: Longint; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function SliderInt2(_label: PAnsiChar; v: PInteger;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar;
      flags: ImGuiSliderFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function SliderInt3(_label: PAnsiChar; v: PInteger;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function SliderInt4(_label: PAnsiChar; v: PInteger;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function VSliderFloat(_label: PAnsiChar; size: ImVec2;
      v: Psingle; v_min: Single; v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function VSliderInt(_label: PAnsiChar; size: ImVec2; v: PInteger;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Drags (tip: ctrl+click on a drag box to input text) }
    // For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every functions, remember than a 'float v[3]' function argument is the same as 'float* v'. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
    { If v_min >= v_max we have no bound }
    Class Function DragFloat(_label: PAnsiChar; v: Psingle;
      v_speed: Single = 1.0; v_min: Single = 0.0; v_max: Single = 0.0;
      display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat2(_label: PAnsiChar; v: PSingle;
      v_speed: Single = 1.0; v_min: Single = 0.0; v_max: Single = 0.0;
      display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat3(_label: PAnsiChar; v: PSingle;
      v_speed: Single = 1.0; v_min: Single = 0.0; v_max: Single = 0.0;
      display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat4(_label: PAnsiChar; v: PSingle;
      v_speed: Single = 1.0; v_min: Single = 0.0; v_max: Single = 0.0;
      display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloatRange2(_label: PAnsiChar; v_current_min: Psingle;
      v_current_max: Psingle; v_speed: Single; v_min: Single;
      v_max: Single; display_format: PAnsiChar; display_format_max: PAnsiChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}

    { If v_min >= v_max we have no bound }
    Class Function DragInt(_label: PAnsiChar; v: PInteger; v_speed: Single;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function DragInt2(_label: PAnsiChar; v: PInteger; v_speed: Single;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function DragInt3(_label: PAnsiChar; v: PInteger; v_speed: Single;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function DragInt4(_label: PAnsiChar; v: PInteger; v_speed: Single;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function DragIntRange2(_label: PAnsiChar; v_current_min: PInteger;
      v_current_max: PInteger; v_speed: Single; v_min: Longint;
      v_max: Longint; display_format: PAnsiChar; display_format_max: PAnsiChar;
      flags: ImGuiSliderFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Input with Keyboard }
    Class Function InputText(_label: PAnsiChar; buf: PAnsiChar;
      buf_size: size_t; flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None;
      callback: ImGuiInputTextCallback = nil; user_data: pointer = nil): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputTextMultiline(_label: PAnsiChar; buf: PAnsiChar;
      buf_size: size_t; size: ImVec2;
      flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None;
      callback: ImGuiInputTextCallback = nil; user_data: pointer = nil): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat(_label: PAnsiChar; v: Psingle; step: Single;
      step_fast: Single; format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat2(_label: PAnsiChar; v: PSingle;
      format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat3(_label: PAnsiChar; v: PSingle;
      format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat4(_label: PAnsiChar; v: PSingle;
      format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputInt(_label: PAnsiChar; v: PInteger; step: Longint;
      step_fast: Longint; extra_flags: ImGuiInputTextFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function InputInt2(_label: PAnsiChar; v: PInteger;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputInt3(_label: PAnsiChar; v: PInteger;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputInt4(_label: PAnsiChar; v: PInteger;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Trees }
    Class Function TreeNode(_label: AnsiString): Boolean;
      Overload; {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNode(str_id: AnsiString; fmt: AnsiString;
      args: Array Of Const): Boolean; Overload; {inline;}
    Class Function TreeNode(str_id: AnsiString; fmt: AnsiString): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNode(ptr_id: pointer; fmt: AnsiString;
      args: Array Of Const): Boolean; Overload;{inline;}
    Class Function TreeNode(ptr_id: pointer; fmt: AnsiString): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function TreeNodeEx(_label: PAnsiChar;
      flags: ImGuiTreeNodeFlags): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNodeEx(str_id: PAnsiChar; flags: ImGuiTreeNodeFlags;
      fmt: AnsiString; args: Array Of Const): Boolean; Overload; {inline;}
    Class Function TreeNodeEx(str_id: PAnsiChar; flags: ImGuiTreeNodeFlags;
      fmt: AnsiString): Boolean; Overload; {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags;
      fmt: AnsiString; args: Array Of Const): Boolean; Overload; {inline;}
    Class Function TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags;
      fmt: AnsiString): Boolean; Overload; {$IfDef INLINE} inline;{$EndIf}
    //todo : vargs
    //    function  igTreeNodeExV(str_id:PAnsiChar; flags:ImGuiTreeNodeFlags; fmt:PAnsiChar; args:va_list):bool;cdecl;external ImguiLibName;
    //todo : vargs
    //    function  igTreeNodeExVPtr(ptr_id:pointer; flags:ImGuiTreeNodeFlags; fmt:PAnsiChar; args:va_list):bool;cdecl;external ImguiLibName;
    Class Procedure TreePushStr(str_id: PAnsiChar); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure TreePushPtr(ptr_id: pointer); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure TreePop; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetTreeNodeToLabelSpacing: Single; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextTreeNodeOpen(opened: Boolean;
      cond: ImGuiCond = ImGuiCond_None); {$IfDef INLINE} inline;{$EndIf}
    Class Function CollapsingHeader(_label: PAnsiChar;
      flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function CollapsingHeader(_label: PAnsiChar; p_open: PBoolean;
      flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Selectable / Lists }
    Class Function Selectable(_label: AnsiString; selected: Boolean;
      flags: ImGuiSelectableFlags; size: ImVec2): Boolean; Overload;
    Class Function Selectable(_label: AnsiString; selected: Boolean;
      flags: ImGuiSelectableFlags = ImGuiSelectableFlags_None): Boolean; Overload;
    //overload for default size (0,0)
    Class Function SelectableEx(_label: PAnsiChar; p_selected: PBoolean;
      flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function ListBox(_label: PAnsiChar; current_item: PInteger;
      items: PPAnsiChar; items_count: Longint; height_in_items: Longint): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function BeginListBox(_label: PAnsiChar; size: ImVec2): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndListBox; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Value() Helpers. Output single value in "name: value" format (tip: freely declare your own within the ImGui namespace!) }
    Class Procedure ValueBool(prefix: PAnsiChar; b: Boolean);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueInt(prefix: PAnsiChar; v: Longint);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueUInt(prefix: PAnsiChar; v: ImU32);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueFloat(prefix: PAnsiChar; v: Single; float_format: PAnsiChar);
    {$IfDef INLINE} inline;{$EndIf}

    { Tooltip }
    Class Procedure SetTooltip(fmt: AnsiString; args: Array Of Const); Overload;{inline}
    Class Procedure SetTooltip(fmt: AnsiString); Overload;{$IfDef INLINE} inline;{$EndIf}
    //todo : vargs
    //    procedure igSetTooltipV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure BeginTooltip; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndTooltip; {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Menus }
    Class Function BeginMainMenuBar(): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndMainMenuBar(); {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginMenuBar(): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndMenuBar(); {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginMenu(_label: PAnsiChar; Enabled: Boolean = True): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndMenu; {$IfDef INLINE} inline;{$EndIf}
    Class Function MenuItem(_label: PAnsiChar; shortcut: PAnsiChar = nil;
      selected: Boolean = False; Enabled: Boolean = True): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function MenuItem(_label: PAnsiChar; shortcut: PAnsiChar;
      p_selected: PBoolean; Enabled: Boolean = True): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}

    { Popup }
    Class Procedure OpenPopup(str_id: PAnsiChar;
      flags: ImGuiPopupFlags = ImGuiPopupFlags_None); {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopup(str_id: PAnsiChar;
      flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopupModal(Name: PAnsiChar; p_open: PBoolean = nil;
      extra_flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopupContextItem(str_id: PAnsiChar = nil;
      mouse_button: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopupContextWindow(str_id: PAnsiChar = nil;
      mouse_button: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginPopupContextVoid(str_id: PAnsiChar = nil;
      mouse_button: ImGuiPopupFlags = ImGuiPopupFlags_MouseButtonRight): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure EndPopup; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsPopupOpen(str_id: PAnsiChar;
      flags: ImGuiPopupFlags = ImGuiPopupFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure CloseCurrentPopup; {$IfDef INLINE} inline;{$EndIf}

    { Logging: all text output from interface is redirected to tty/file/clipboard. Tree nodes are automatically opened. }
    Class Procedure LogToTTY(max_depth: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogToFile(max_depth: Longint; filename: PAnsiChar);
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogToClipboard(max_depth: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogFinish; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogButtons; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure LogText(Const fmt: AnsiString; args: Array Of Const); Overload;
    Class Procedure LogText(Const fmt: AnsiString); Overload;

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
    Class Function GetItemRectMin: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetItemRectMax: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetItemRectSize: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextItemAllowOverlap; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowFocused(flags: ImGuiFocusedFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowHovered(flags: ImGuiHoveredFlags =
      ImGuiHoveredFlags_None): Boolean; {$IfDef INLINE} inline;{$EndIf}

    Class Function IsRectVisible(Const item_size: ImVec2): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsRectVisible(Const rect_min, rect_max: ImVec2): Boolean; Overload;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function GetTime(): Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetFrameCount(): Longint; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetStyleColorName(idx: ImGuiCol): PAnsiChar;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function CalcTextSize(_text: PAnsiChar; text_end: PAnsiChar = nil;
      hide_text_after_double_hash: Boolean = False;
      wrap_width: Single = -1): ImVec2; {$IfDef INLINE} inline;{$EndIf}


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
      _repeat: Boolean = False): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseDoubleClicked(_button: ImGuiMouseButton): Boolean; Overload;
    Class Function IsMouseDoubleClicked(_button: ImGuiMouseButton;
      owner_id: ImGuiID): Boolean; Overload;
    Class Function IsMouseReleased(_button: ImGuiMouseButton): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseHoveringRect(r_min: ImVec2; r_max: ImVec2;
      clip: Boolean = True): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsMouseDragging(_button: ImGuiMouseButton;
      lock_threshold: Single = -1.0): Boolean; {$IfDef INLINE} inline;{$EndIf}
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
    Class Function GetClipboardText: PAnsiChar; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetClipboardText(_text: PAnsiChar); {$IfDef INLINE} inline;{$EndIf}

    { Internal state access - if you want to share ImGui state between modules (e.g. DLL) or allocate it yourself }
    Class Function GetVersion(): PAnsiChar; {$IfDef INLINE} inline;{$EndIf}
  End;


  { TImFontAtlasHelper }

  TImFontAtlasHelper = Record helper For ImFontAtlas

    // Fonts APIs
    Function AddFontDefault(): PImFont;
    Function AddFontFromFileTTF(filename: PAnsiChar; size_pixels: Single;
      font_cfg: PImFontConfig = nil; glyph_ranges: PImWchar = nil): PImFont;
    Procedure GetTexDataAsRGBA32(out_pixels: PPImU8; out_width: PInteger;
      out_height: PInteger; out_bytes_per_pixel: PInteger = nil);
    Procedure GetTexDataAsAlpha8(out_pixels: PPImU8; out_width: PInteger;
      out_height: PInteger; out_bytes_per_pixel: PInteger);
    Procedure SetTexID(id: ImTextureID);
  End;


  { TImDrawListHelper }

  //function GetTexID() : ImTextureID;

  TImDrawListHelper = Record helper For ImDrawList
    Procedure PushClipRect(clip_rect_min: ImVec2; clip_rect_max: ImVec2;
      intersect_with_current_clip_rect: Boolean); {$IfDef INLINE} inline;{$EndIf}
    Procedure PushClipRectFullScreen(); {$IfDef INLINE} inline;{$EndIf}
    Procedure PopClipRect(); {$IfDef INLINE} inline;{$EndIf}
    Procedure PushTextureID(texture_id: ImTextureID); {$IfDef INLINE} inline;{$EndIf}
    Procedure PopTextureID(); {$IfDef INLINE} inline;{$EndIf}



    { Primitives }
    Procedure AddLine(p1: ImVec2; p2: ImVec2; col: ImU32; thickness: Single = 1.0);
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
      num_segments: Longint = 0); {$IfDef INLINE} inline;{$EndIf}
    Procedure AddText(pos: ImVec2; col: ImU32; text_begin: PAnsiChar;
      text_end: PAnsiChar);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddTextExt(font: ImFont; font_size: Single; pos: ImVec2;
      col: ImU32; text_begin: PAnsiChar; text_end: PAnsiChar;
      wrap_width: Single; cpu_fine_clip_rect: ImVec4); {$IfDef INLINE} inline;{$EndIf}
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
      p4: ImVec2; col: ImU32; thickness: Single; num_segments: Integer = 0);
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

Function IM_COL32(R, G, B, A: ImU32): ImU32;

Implementation

Function IM_COL32(R, G, B, A: ImU32): ImU32;
Begin
  Result := (A Shl IM_COL32_A_SHIFT) Or (B Shl IM_COL32_B_SHIFT) Or
    (G Shl IM_COL32_G_SHIFT) Or (R Shl IM_COL32_R_SHIFT);
End;

Function ImGuiPlatformMonitor_Create(): PImGuiPlatformMonitor;
Begin
  Result := ImGuiPlatformMonitor_ImGuiPlatformMonitor();
End;


//Replacement for (void*)(intptr_t) int cast, used for IDs. Generates warnings
Function ImIDPtr(Const i: Integer): pointer;
Begin
  Result := pointer(IntPtr(i));
End;

Function ImColorCreate(Const color: ImVec4): ImU32;
Begin
  Result := ImGui.ColorConvertFloat4ToU32(color);
End;


{ ImGui
  Keep functions short, they're mostly just wrappers. Inlining begin/end with trivial function body is ok
}

Class Function ImGui.CreateContext(shared_font_atlas: PImFontAtlas): PImGuiContext;
Begin
  Result := igCreateContext(shared_font_atlas);
End;

Class Procedure ImGui.DestroyContext(ctx: PImGuiContext);
Begin
  igDestroyContext(ctx);
End;

Class Function ImGui.GetIO: PImGuiIO;
Begin
  Result := igGetIO;
End;

Class Function ImGui.GetPlatformIO: PImGuiPlatformIO;
Begin
  Result := igGetPlatformIO();
End;

Class Function ImGui.GetStyle: PImGuiStyle;
Begin
  Result := igGetStyle;
End;

Class Function ImGui.GetDrawData: PImDrawData;
Begin
  Result := igGetDrawData;
End;

Class Procedure ImGui.NewFrame;
Begin
  igNewFrame;
End;

Class Procedure ImGui.Render;
Begin
  igRender;
End;

Class Procedure ImGui.ShowUserGuide;
Begin
  igShowUserGuide;
End;

Class Procedure ImGui.ShowStyleEditor(ref: PImGuiStyle);
Begin
  igShowStyleEditor(ref);
End;

Class Procedure ImGui.ShowDemoWindow(p_open: PBoolean);
Begin
  igShowDemoWindow(p_open);
End;

Class Procedure ImGui.ShowMetricsWindow(p_open: PBoolean);
Begin
  igShowMetricsWindow(p_open);
End;

Class Function ImGui.GetMainViewport: PImGuiViewport;
Begin
  Result := igGetMainViewport();
End;

Class Function ImGui.GetCurrentContext: PImGuiContext;
Begin
  Result := igGetCurrentContext();
End;

Class Function ImGui.GetDragDropPayload: PImGuiPayload;
Begin
  Result := igGetDragDropPayload();
End;

Class Function ImGui.GetCenterViewPort(ViewPort: PImGuiViewport): ImVec2;
Begin
  ImGuiViewport_GetCenter(@Result, ViewPort);
End;

Class Function ImGui.FindViewportByPlatformHandle(platform_handle: Pointer):
PImGuiViewport;
Begin
  Result := igFindViewportByPlatformHandle(platform_handle);
End;

Class Procedure ImGui.DestroyPlatformWindows;
Begin
  igDestroyPlatformWindows();
End;

Class Procedure ImGui.AddMouseViewportEvent(id: ImGuiID);
Begin
  ImGuiIO_AddMouseViewportEvent(GetIO(), id);
End;

Class Procedure ImGui.AddFocusEvent(focused: Boolean);
Begin
  ImGuiIO_AddFocusEvent(GetIO(), focused);
End;

Class Procedure ImGui.AddMouseSourceEvent(Source: ImGuiMouseSource);
Begin
  ImGuiIO_AddMouseSourceEvent(GetIO(), Source);
End;

Class Procedure ImGui.AddMousePosEvent(x: Single; y: Single);
Begin
  ImGuiIO_AddMousePosEvent(GetIO(), x, y);
End;

Class Procedure ImGui.AddMouseWheelEvent(wheel_x: Single; wheel_y: Single);
Begin
  ImGuiIO_AddMouseWheelEvent(GetIO(), wheel_x, wheel_y);
End;

Class Procedure ImGui.AddMouseButtonEvent(button: Int32; down: Boolean);
Begin
  ImGuiIO_AddMouseButtonEvent(GetIO(), button, down);
End;

Class Procedure ImGui.AddInputCharactersUTF8(Const str: AnsiString);
Begin
  ImGuiIO_AddInputCharactersUTF8(GetIO(), PAnsiChar(str));
End;

Class Procedure ImGui.AddKeyEvent(key: ImGuiKey; down: Boolean);
Begin
  ImGuiIO_AddKeyEvent(GetIO(), key, down);
End;

Class Procedure ImGui.SetKeyEventNativeData(key: ImGuiKey; native_keycode: Int32;
  native_scancode: Int32; native_legacy_index: Int32);
Begin
  ImGuiIO_SetKeyEventNativeData(GetIO(), key, native_keycode,
    native_scancode, native_legacy_index);
End;

Class Procedure ImGui.UpdatePlatformWindows;
Begin
  igUpdatePlatformWindows();
End;

Class Procedure ImGui.RenderPlatformWindowsDefault(platform_render_arg: Pointer;
  renderer_render_arg: Pointer);
Begin
  igRenderPlatformWindowsDefault(platform_render_arg, renderer_render_arg);
End;

Class Function ImGui.Begin_(Name: AnsiString; p_open: PBoolean;
  flags: ImGuiWindowFlags): Boolean;
Begin
  Result := igBegin(PAnsiChar(Name), p_open, flags);
End;

Class Procedure ImGui.End_;
Begin
  igEnd;
End;

Class Function ImGui.BeginChild(str_id: AnsiString; size: ImVec2;
  child_flags: ImGuiChildFlags; extra_flags: ImGuiWindowFlags): Boolean;
Begin
  Result := igBeginChild_Str(PAnsiChar(str_id), size, child_flags, extra_flags);
End;

Class Function ImGui.BeginChildEx(id: ImGuiID; size: ImVec2;
  child_flags: ImGuiChildFlags; extra_flags: ImGuiWindowFlags): Boolean;
Begin
  Result := igBeginChild_ID(id, size, child_flags, extra_flags);
End;

Class Procedure ImGui.EndChild;
Begin
  igEndChild;
End;

Class Procedure ImGui.GetContentRegionMax(out_: PImVec2);
Begin
  igGetContentRegionMax(out_);
End;

Class Function ImGui.GetContentRegionAvail: ImVec2;
Begin
  igGetContentRegionAvail(@Result);
End;

Class Function ImGui.GetContentRegionAvailWidth: Single;
Begin
  Result := GetContentRegionAvail().x;
End;

Class Procedure ImGui.GetWindowContentRegionMin(out_: PImVec2);
Begin
  igGetWindowContentRegionMin(out_);
End;

Class Function ImGui.GetWindowContentRegionMax: ImVec2;
Begin
  igGetWindowContentRegionMax(@Result);
End;

Class Function ImGui.GetWindowContentRegionWidth: Single;
Begin
  Result := GetWindowContentRegionMax().x;
End;

Class Function ImGui.GetWindowDrawList: PImDrawList;
Begin
  Result := igGetWindowDrawList;
End;

Class Function ImGui.GetWindowPos(): ImVec2;
Begin
  igGetWindowPos(@Result);
End;

Class Function ImGui.GetWindowSize(): ImVec2;
Begin
  igGetWindowSize(@Result);
End;

Class Function ImGui.GetWindowWidth: Single;
Begin
  Result := igGetWindowWidth;
End;

Class Function ImGui.GetWindowHeight: Single;
Begin
  Result := igGetWindowHeight;
End;

Class Function ImGui.IsWindowCollapsed: Boolean;
Begin
  Result := igIsWindowCollapsed;
End;

Class Procedure ImGui.SetWindowFontScale(scale: Single);
Begin
  igSetWindowFontScale(scale);
End;

Class Procedure ImGui.SetNextWindowPos(pos: ImVec2; cond: ImGuiCond);
Begin
  igSetNextWindowPos(pos, cond, ImVec2.New(0, 0));
End;

Class Procedure ImGui.SetNextWindowPos(pos: ImVec2; cond: ImGuiCond; pivot: ImVec2);
Begin
  igSetNextWindowPos(pos, cond, pivot);
End;

Class Procedure ImGui.SetNextWindowPosCenter(cond: ImGuiCond);
Begin
  {
  - 2017/09/25 (1.52) - removed SetNextWindowPosCenter() because
    SetNextWindowPos() now has the optional pivot information to do
    the same and more. Kept redirection function (will obsolete).
  }

  igSetNextWindowPos(GetCenterViewPort(GetMainViewport()), cond, ImVec2.New(0.5, 0.5));
End;

Class Procedure ImGui.SetNextWindowSize(size: ImVec2; cond: ImGuiCond);
Begin
  igSetNextWindowSize(size, cond);
End;

Class Procedure ImGui.SetNextWindowSizeConstraints(size_min: ImVec2;
  size_max: ImVec2; custom_callback: ImGuiSizeCallback; custom_callback_data: pointer);
Begin
  igSetNextWindowSizeConstraints(size_min, size_max, custom_callback,
    custom_callback_data);
End;

Class Procedure ImGui.SetNextWindowContentSize(size: ImVec2);
Begin
  igSetNextWindowContentSize(size);
End;

Class Procedure ImGui.SetNextWindowCollapsed(collapsed: Boolean; cond: ImGuiCond);
Begin
  igSetNextWindowCollapsed(collapsed, cond);
End;

Class Procedure ImGui.SetNextWindowFocus;
Begin
  igSetNextWindowFocus;
End;

Class Procedure ImGui.SetWindowPos(pos: ImVec2; cond: ImGuiCond);
Begin
  igSetWindowPos_Vec2(pos, cond);
End;

Class Procedure ImGui.SetWindowSize(size: ImVec2; cond: ImGuiCond);
Begin
  igSetWindowSize_Vec2(size, cond);
End;

Class Procedure ImGui.SetWindowCollapsed(collapsed: Boolean; cond: ImGuiCond);
Begin
  igSetWindowCollapsed_Bool(collapsed, cond);
End;

Class Procedure ImGui.SetWindowFocus;
Begin
  igSetWindowFocus_Nil();
End;

Class Procedure ImGui.SetWindowPosByName(Name: PAnsiChar; pos: ImVec2; cond: ImGuiCond);
Begin
  igSetWindowPos_Str(Name, pos, cond);
End;

Class Procedure ImGui.SetWindowSize2(Name: PAnsiChar; size: ImVec2; cond: ImGuiCond);
Begin
  igSetWindowSize_Str(Name, size, cond);
End;

Class Procedure ImGui.SetWindowCollapsed2(Name: PAnsiChar; collapsed: Boolean;
  cond: ImGuiCond);
Begin
  igSetWindowCollapsed_Str(Name, collapsed, cond);
End;

Class Procedure ImGui.SetWindowFocus2(Name: PAnsiChar);
Begin
  igSetWindowFocus_Str(Name);
End;

Class Function ImGui.GetScrollX: Single;
Begin
  Result := igGetScrollX;
End;

Class Function ImGui.GetScrollY: Single;
Begin
  Result := igGetScrollY;
End;

Class Function ImGui.GetScrollMaxX: Single;
Begin
  Result := igGetScrollMaxX;
End;

Class Function ImGui.GetScrollMaxY: Single;
Begin
  Result := igGetScrollMaxY;
End;

Class Procedure ImGui.SetScrollX(scroll_x: Single);
Begin
  igSetScrollX_Float(scroll_x);
End;

Class Procedure ImGui.SetScrollY(scroll_y: Single);
Begin
  igSetScrollY_Float(scroll_y);
End;

Class Procedure ImGui.SetScrollHere(center_y_ratio: Single);
Begin
  igSetScrollHereY(center_y_ratio);
End;

Class Procedure ImGui.SetScrollFromPosY(pos_y: Single; center_y_ratio: Single);
Begin
  igSetScrollFromPosY_Float(pos_y, center_y_ratio);
End;

Class Procedure ImGui.SetStateStorage(tree: PImGuiStorage);
Begin
  igSetStateStorage(tree);
End;

Class Function ImGui.GetStateStorage: PImGuiStorage;
Begin
  Result := igGetStateStorage;
End;



{ Parameters stacks (shared) }
Class Procedure ImGui.PushFont(font: PImFont);
Begin
  igPushFont(font);
End;

Class Procedure ImGui.PopFont;
Begin
  igPopFont;
End;

Class Procedure ImGui.PushStyleColor(idx: ImGuiCol; col: ImU32);
Begin
  igPushStyleColor_U32(idx, col);
End;

Class Procedure ImGui.PushStyleColor(idx: ImGuiCol; col: ImVec4);
Begin
  igPushStyleColor_Vec4(idx, col);
End;

Class Procedure ImGui.PopStyleColor(Count: Longint);
Begin
  igPopStyleColor(Count);
End;

Class Procedure ImGui.PushStyleVar(idx: ImGuiStyleVar; val: Single);
Begin
  igPushStyleVar_Float(idx, val);
End;

Class Procedure ImGui.PushStyleVar(idx: ImGuiStyleVar; val: ImVec2);
Begin
  igPushStyleVar_Vec2(idx, val);
End;

Class Procedure ImGui.PopStyleVar(Count: Longint);
Begin
  igPopStyleVar(Count);
End;

Class Function ImGui.GetFont: PImFont;
Begin
  Result := igGetFont;
End;

Class Function ImGui.GetFontSize: Single;
Begin
  Result := igGetFontSize;
End;

Class Function ImGui.GetFontTexUvWhitePixel: ImVec2;
Begin
  igGetFontTexUvWhitePixel(@Result);
End;

Class Function ImGui.GetColorU32(idx: ImGuiCol; alpha_mul: Single): ImU32;
Begin
  Result := igGetColorU32_Col(idx, alpha_mul);
End;

Class Function ImGui.GetColorU32Vec(col: ImVec4): ImU32;
Begin
  Result := igGetColorU32_Vec4(col);
End;

{ Parameters stacks (current window) }
Class Procedure ImGui.PushItemWidth(item_width: Single);
Begin
  igPushItemWidth(item_width);
End;

Class Procedure ImGui.PopItemWidth;
Begin
  igPopItemWidth;
End;

Class Function ImGui.CalcItemWidth: Single;
Begin
  Result := igCalcItemWidth;
End;

Class Procedure ImGui.PushTextWrapPos(wrap_pos_x: Single);
Begin
  igPushTextWrapPos(wrap_pos_x);
End;

Class Procedure ImGui.PopTextWrapPos;
Begin
  igPopTextWrapPos;
End;

Class Procedure ImGui.PushTabStop(v: Boolean);
Begin
  igPushTabStop(v);
End;

Class Procedure ImGui.PopTabStop;
Begin
  igPopTabStop;
End;

Class Procedure ImGui.PushButtonRepeat(_repeat: Boolean);
Begin
  igPushButtonRepeat(_repeat);
End;

Class Procedure ImGui.PopButtonRepeat;
Begin
  igPopButtonRepeat;
End;

Class Procedure ImGui.SeparatorText(label_: AnsiString);
Begin
  igSeparatorText(PAnsiChar(label_));
End;

{ Layout }
Class Procedure ImGui.Separator;
Begin
  igSeparator;
End;

Class Procedure ImGui.SameLine(pos_x: Single; spacing_w: Single);
Begin
  igSameLine(pos_x, spacing_w);
End;

Class Procedure ImGui.NewLine;
Begin
  igNewLine;
End;

Class Procedure ImGui.Spacing;
Begin
  igSpacing;
End;

Class Procedure ImGui.Dummy(size: ImVec2);
Begin
  igDummy(size);
End;

Class Procedure ImGui.Indent(indent_w: Single);
Begin
  igIndent(indent_w);
End;

Class Procedure ImGui.Unindent(indent_w: Single);
Begin
  igUnindent(indent_w);
End;

Class Procedure ImGui.BeginGroup;
Begin
  igBeginGroup;
End;

Class Procedure ImGui.EndGroup;
Begin
  igEndGroup;
End;

Class Function ImGui.GetCursorPos: ImVec2;
Begin
  igGetCursorPos(@Result);
End;

Class Function ImGui.GetCursorPosX: Single;
Begin
  Result := igGetCursorPosX;
End;

Class Function ImGui.GetCursorPosY: Single;
Begin
  Result := igGetCursorPosY;
End;

Class Procedure ImGui.SetCursorPos(local_pos: ImVec2);
Begin
  igSetCursorPos(local_pos);
End;

Class Procedure ImGui.SetCursorPosX(x: Single);
Begin
  igSetCursorPosX(x);
End;

Class Procedure ImGui.SetCursorPosY(y: Single);
Begin
  igSetCursorPosY(y);
End;

Class Function ImGui.GetCursorStartPos: ImVec2;
Begin
  igGetCursorStartPos(@Result);
End;

Class Function ImGui.GetCursorScreenPos: ImVec2;
Begin
  igGetCursorScreenPos(@Result);
End;

Class Procedure ImGui.SetCursorScreenPos(pos: ImVec2);
Begin
  igSetCursorScreenPos(pos);
End;

Class Procedure ImGui.igAlignTextToFramePadding;
Begin
  igAlignTextToFramePadding;
End;

Class Function ImGui.GetTextLineHeight: Single;
Begin
  Result := igGetTextLineHeight;
End;

Class Function ImGui.GetTextLineHeightWithSpacing: Single;
Begin
  Result := igGetTextLineHeightWithSpacing;
End;

Class Function ImGui.GetFrameHeight: Single;
Begin
  Result := igGetFrameHeight;
End;

Class Function ImGui.GetFrameHeightWithSpacing: Single;
Begin
  Result := igGetFrameHeightWithSpacing;
End;

{ Columns }
Class Procedure ImGui.Columns(Count: Longint; id: PAnsiChar; border: Boolean);
Begin
  igColumns(Count, id, border);
End;

Class Procedure ImGui.NextColumn;
Begin
  igNextColumn;
End;

Class Function ImGui.GetColumnIndex: Longint;
Begin
  Result := igGetColumnIndex;
End;

Class Function ImGui.GetColumnOffset(column_index: Longint): Single;
Begin
  Result := igGetColumnOffset(column_index);
End;

Class Procedure ImGui.SetColumnOffset(column_index: Longint; offset_x: Single);
Begin
  igSetColumnOffset(column_index, offset_x);
End;

Class Function ImGui.GetColumnWidth(column_index: Longint): Single;
Begin
  Result := igGetColumnWidth(column_index);
End;

Class Procedure ImGui.SetColumnWidth(column_index: Longint; Width: Single);
Begin
  igSetColumnWidth(column_index, Width);
End;

Class Function ImGui.GetColumnsCount: Longint;
Begin
  Result := igGetColumnsCount;
End;

{ ID scopes }
{ If you are creating widgets in a loop you most likely want to push a unique identifier so ImGui can differentiate them }
{ You can also use "##extra" within your widget name to distinguish them from each others (see 'Programmer Guide') }
Class Procedure ImGui.PushIdStr(str_id: PAnsiChar);
Begin
  igPushID_Str(str_id);
End;

Class Procedure ImGui.PushIdStrRange(str_begin: PAnsiChar; str_end: PAnsiChar);
Begin
  igPushID_StrStr(str_begin, str_end);
End;

Class Procedure ImGui.PushIdPtr(ptr_id: pointer);
Begin
  igPushID_Ptr(ptr_id);
End;

Class Procedure ImGui.PushIdInt(int_id: Longint);
Begin
  igPushID_Int(int_id);
End;

Class Procedure ImGui.PopId;
Begin
  igPopId;
End;

Class Function ImGui.GetIdStr(str_id: PAnsiChar): ImGuiID;
Begin
  Result := igGetID_Str(str_id);
End;

Class Function ImGui.GetIdStrRange(str_begin: PAnsiChar; str_end: PAnsiChar): ImGuiID;
Begin
  Result := igGetID_StrStr(str_begin, str_end);
End;

Class Function ImGui.GetIdPtr(ptr_id: pointer): ImGuiID;
Begin
  Result := igGetID_Ptr(ptr_id);
End;

{ Widgets: Text }
Class Procedure ImGui.Text(Const text_: AnsiString);
Begin
  igText(PAnsiChar(text_), []);
End;

Class Procedure ImGui.Text(Const Fmt: AnsiString; Const Args: Array Of Const);
Begin
  Text(Format(fmt, args));
End;

Class Procedure ImGui.TextColored(col: ImVec4; fmt: PAnsiChar; args: Array Of Const);
Begin
  TextColored(col, Format(fmt, args));
End;

Class Procedure ImGui.TextColored(col: ImVec4; Const fmt: AnsiString);
Begin
  igTextColored(col, PAnsiChar(fmt), []);
End;

Class Procedure ImGui.TextDisabled(Const fmt: AnsiString; args: Array Of Const);
Begin
  TextDisabled(Format(fmt, args));
End;

Class Procedure ImGui.TextDisabled(Const fmt: AnsiString);
Begin
  igTextDisabled(PAnsiChar(fmt), []);
End;

Class Procedure ImGui.TextWrapped(Const fmt: AnsiString; args: Array Of Const);
Begin
  TextWrapped(Format(fmt, args));
End;

Class Procedure ImGui.TextWrapped(Const fmt: AnsiString);
Begin
  igTextWrapped(PAnsiChar(fmt), []);
End;

Class Procedure ImGui.TextUnformatted(Const _text: AnsiString);
Begin
  igTextUnformatted(PAnsiChar(_text), nil);
End;

Class Procedure ImGui.TextUnformatted(Const _text: PAnsiChar;
  Const text_end: PAnsiChar);
Begin
  igTextUnformatted(_text, text_end);
End;

Class Procedure ImGui.LabelText(_label: AnsiString; fmt: PAnsiChar;
  args: Array Of Const);
Begin
  LabelText(_label, Format(fmt, args));
End;

Class Procedure ImGui.LabelText(_label: AnsiString; fmt: AnsiString);
Begin
  igLabelText(PAnsiChar(_label), PAnsiChar(fmt), []);
End;

Class Procedure ImGui.Bullet;
Begin
  igBullet;
End;

Class Procedure ImGui.BulletText(Const fmt: AnsiString; args: Array Of Const);
Begin
  BulletText(Format(fmt, args));
End;

Class Procedure ImGui.BulletText(Const fmt: AnsiString);
Begin
  igBulletText(PAnsiChar(fmt), []);
End;

{ Widgets: Main }
Class Function ImGui.Button(_label: AnsiString; size: ImVec2): Boolean;
Begin
  Result := igButton(PAnsiChar(_label), size);
End;

Class Function ImGui.Button(_label: AnsiString): Boolean;
Begin
  Result := Button(_label, ImVec2.New(0, 0));
End;

Class Function ImGui.SmallButton(_label: PAnsiChar): Boolean;
Begin
  Result := igSmallButton(_label);
End;

Class Function ImGui.InvisibleButton(str_id: PAnsiChar; size: ImVec2;
  flags: ImGuiButtonFlags): Boolean;
Begin
  Result := igInvisibleButton(str_id, size, flags);
End;

Class Procedure ImGui.Image(user_texture_id: ImTextureID; size: ImVec2;
  uv0: ImVec2; uv1: ImVec2; tint_col: ImVec4; border_col: ImVec4);
Begin
  igImage(user_texture_id, size, uv0, uv1, tint_col, border_col);
End;

Class Function ImGui.ImageButton(str_id: PAnsiChar; user_texture_id: ImTextureID;
  size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4; tint_col: ImVec4): Boolean;
Begin
  Result := igImageButton(str_id, user_texture_id, size, uv0, uv1, bg_col, tint_col);
End;

Class Function ImGui.Checkbox(_label: PAnsiChar; v: PBoolean): Boolean;
Begin
  Result := igCheckbox(_label, v);
End;

Class Function ImGui.CheckboxFlags(_label: PAnsiChar; flags: PImU32;
  flags_value: Int32): Boolean;
Begin
  { TODO: Do we need to implement other igCheckboxFlags funcs - Time : 11/3/2023 11:46:25 PM }
  Result := igCheckboxFlags_UintPtr(_label, flags, flags_value);
End;

Class Function ImGui.RadioButtonBool(_label: PAnsiChar; active: Boolean): Boolean;
Begin
  Result := igRadioButton_Bool(_label, active);
End;

Class Function ImGui.RadioButton(_label: PAnsiChar; v: PInteger;
  v_button: Longint): Boolean;
Begin
  Result := igRadioButton_IntPtr(_label, v, v_button);
End;

Class Procedure ImGui.PlotLines(_label: PAnsiChar; values: Psingle;
  values_count: Longint; values_offset: Longint; overlay_text: PAnsiChar;
  scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
Begin
  igPlotLines_FloatPtr(_label, values, values_count, values_offset, overlay_text,
    scale_min, scale_max, graph_size, stride);
End;

Class Procedure ImGui.PlotHistogram(_label: PAnsiChar; values: Psingle;
  values_count: Longint; values_offset: Longint; overlay_text: PAnsiChar;
  scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
Begin
  igPlotHistogram_FloatPtr(_label, values, values_count, values_offset, overlay_text,
    scale_min, scale_max, graph_size, stride);
End;

Class Procedure ImGui.ProgressBar(fraction: Single; size_arg: ImVec2;
  overlay: PAnsiChar);
Begin
  igProgressBar(fraction, size_arg, overlay);
End;

Class Function ImGui.BeginCombo(Const _label, preview_value: AnsiString;
  flags: ImGuiComboFlags): Boolean;
Begin
  Result := igBeginCombo(PAnsiChar(_label), PAnsiChar(preview_value), flags);
End;

Class Procedure ImGui.EndCombo;
Begin
  igEndCombo;
End;

Class Function ImGui.Combo(_label: AnsiString; current_item: PInteger;
  items: PPAnsiChar; items_count: Longint; height_in_items: Longint): Boolean;
Begin
  Result := igCombo_Str_arr(PAnsiChar(_label), current_item, items,
    items_count, height_in_items);
End;

Class Function ImGui.Combo2(_label: AnsiString; current_item: PInteger;
  items_separated_by_zeros: PAnsiChar; height_in_items: Longint): Boolean;
Begin
  Result := igCombo_Str(PAnsiChar(_label), current_item, items_separated_by_zeros,
    height_in_items);
End;

Class Function ImGui.ColorButton(desc_id: PAnsiChar; col: ImVec4;
  flags: ImGuiColorEditFlags; size: ImVec2): Boolean;
Begin
  Result := igColorButton(desc_id, col, flags, size);
End;

Class Function ImGui.ColorEdit3(_label: PAnsiChar; col: PSingle;
  flags: ImGuiColorEditFlags): Boolean;
Begin
  Result := igColorEdit3(_label, col, flags);
End;

Class Function ImGui.ColorEdit4(_label: PAnsiChar; col: PSingle;
  flags: ImGuiColorEditFlags): Boolean;
Begin
  Result := igColorEdit4(_label, col, flags);
End;

Class Function ImGui.ColorPicker3(_label: PAnsiChar; col: PSingle;
  flags: ImGuiColorEditFlags): Boolean;
Begin
  Result := igColorPicker3(_label, col, flags);
End;

Class Function ImGui.ColorPicker4(_label: PAnsiChar; col: PSingle;
  flags: ImGuiColorEditFlags; ref_col: PSingle): Boolean;
Begin
  Result := igColorPicker4(_label, col, flags, ref_col);
End;

Class Procedure ImGui.SetColorEditOptions(flags: ImGuiColorEditFlags);
Begin
  igSetColorEditOptions(flags);
End;

{ Widgets: Sliders (tip: ctrl+click on a slider to input text) }
Class Function ImGui.SliderFloat(_label: PAnsiChar; v: Psingle;
  v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  If display_format = nil Then
    display_format := '%.3f';
  Result := igSliderFloat(_label, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.SliderFloat2(_label: PAnsiChar; v: PSingle;
  v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igSliderFloat2(_label, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.SliderFloat3(_label: PAnsiChar; v: PSingle;
  v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igSliderFloat3(_label, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.SliderFloat4(_label: PAnsiChar; v: PSingle;
  v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igSliderFloat4(_label, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.SliderAngle(_label: PAnsiChar; v_rad: Psingle;
  v_degrees_min: Single; v_degrees_max: Single; format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  If format = nil Then
    format := '%.0f deg';
  Result := igSliderAngle(_label, v_rad, v_degrees_min, v_degrees_max, format, flags);
End;

Class Function ImGui.SliderInt(_label: PAnsiChar; v: PInteger;
  v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igSliderInt(_label, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.SliderInt2(_label: PAnsiChar; v: PInteger;
  v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igSliderInt2(_label, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.SliderInt3(_label: PAnsiChar; v: PInteger;
  v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igSliderInt3(_label, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.SliderInt4(_label: PAnsiChar; v: PInteger;
  v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igSliderInt4(_label, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.VSliderFloat(_label: PAnsiChar; size: ImVec2;
  v: Psingle; v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igVSliderFloat(_label, size, v, v_min, v_max, display_format, flags);
End;

Class Function ImGui.VSliderInt(_label: PAnsiChar; size: ImVec2;
  v: PInteger; v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igVSliderInt(_label, size, v, v_min, v_max, display_format, flags);
End;

{ Widgets: Drags (tip: ctrl+click on a drag box to input text) }
// For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every functions, remember than a 'float v[3]' function argument is the same as 'float* v'. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
{ If v_max >= v_max we have no bound }
Class Function ImGui.DragFloat(_label: PAnsiChar; v: Psingle;
  v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragFloat(_label, v, v_speed, v_min, v_max, display_format, flags);
End;

Class Function ImGui.DragFloat2(_label: PAnsiChar; v: PSingle;
  v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragFloat2(_label, v, v_speed, v_min, v_max, display_format, flags);
End;

Class Function ImGui.DragFloat3(_label: PAnsiChar; v: PSingle;
  v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragFloat3(_label, v, v_speed, v_min, v_max, display_format, flags);
End;

Class Function ImGui.DragFloat4(_label: PAnsiChar; v: PSingle;
  v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragFloat4(_label, v, v_speed, v_min, v_max, display_format, flags);
End;

Class Function ImGui.DragFloatRange2(_label: PAnsiChar; v_current_min: Psingle;
  v_current_max: Psingle; v_speed: Single; v_min: Single; v_max: Single;
  display_format: PAnsiChar; display_format_max: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragFloatRange2(_label, v_current_min, v_current_max,
    v_speed, v_min, v_max, display_format, display_format_max, flags);
End;
{ If v_max >= v_max we have no bound }
Class Function ImGui.DragInt(_label: PAnsiChar; v: PInteger; v_speed: Single;
  v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragInt(_label, v, v_speed, v_min, v_max, display_format, flags);
End;

Class Function ImGui.DragInt2(_label: PAnsiChar; v: PInteger;
  v_speed: Single; v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragInt2(_label, v, v_speed, v_min, v_max, display_format, flags);
End;

Class Function ImGui.DragInt3(_label: PAnsiChar; v: PInteger;
  v_speed: Single; v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragInt3(_label, v, v_speed, v_min, v_max, display_format, flags);
End;

Class Function ImGui.DragInt4(_label: PAnsiChar; v: PInteger;
  v_speed: Single; v_min: Longint; v_max: Longint; display_format: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragInt4(_label, v, v_speed, v_min, v_max, display_format, flags);
End;

Class Function ImGui.DragIntRange2(_label: PAnsiChar; v_current_min: PInteger;
  v_current_max: PInteger; v_speed: Single; v_min: Longint; v_max: Longint;
  display_format: PAnsiChar; display_format_max: PAnsiChar;
  flags: ImGuiSliderFlags): Boolean;
Begin
  Result := igDragIntRange2(_label, v_current_min, v_current_max,
    v_speed, v_min, v_max, display_format, display_format_max, flags);
End;

{ Widgets: Input }
Class Function ImGui.InputText(_label: PAnsiChar; buf: PAnsiChar;
  buf_size: size_t; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback;
  user_data: pointer): Boolean;
Begin
  Result := igInputText(_label, buf, buf_size, flags, callback, user_data);
End;

Class Function ImGui.InputTextMultiline(_label: PAnsiChar; buf: PAnsiChar;
  buf_size: size_t; size: ImVec2; flags: ImGuiInputTextFlags;
  callback: ImGuiInputTextCallback; user_data: pointer): Boolean;
Begin
  Result := igInputTextMultiline(_label, buf, buf_size, size, flags,
    callback, user_data);
End;

Class Function ImGui.InputFloat(_label: PAnsiChar; v: Psingle;
  step: Single; step_fast: Single; format: PAnsiChar;
  extra_flags: ImGuiInputTextFlags): Boolean;
Begin
  Result := igInputFloat(_label, v, step, step_fast, format, extra_flags);
End;

Class Function ImGui.InputFloat2(_label: PAnsiChar; v: PSingle;
  format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
Begin
  Result := igInputFloat2(_label, v, format, extra_flags);
End;

Class Function ImGui.InputFloat3(_label: PAnsiChar; v: PSingle;
  format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
Begin
  Result := igInputFloat3(_label, v, format, extra_flags);
End;

Class Function ImGui.InputFloat4(_label: PAnsiChar; v: PSingle;
  format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
Begin
  Result := igInputFloat4(_label, v, format, extra_flags);
End;

Class Function ImGui.InputInt(_label: PAnsiChar; v: PInteger;
  step: Longint; step_fast: Longint; extra_flags: ImGuiInputTextFlags): Boolean;
Begin
  Result := igInputInt(_label, v, step, step_fast, extra_flags);
End;

Class Function ImGui.InputInt2(_label: PAnsiChar; v: PInteger;
  extra_flags: ImGuiInputTextFlags): Boolean;
Begin
  Result := igInputInt2(_label, v, extra_flags);
End;

Class Function ImGui.InputInt3(_label: PAnsiChar; v: PInteger;
  extra_flags: ImGuiInputTextFlags): Boolean;
Begin
  Result := igInputInt3(_label, v, extra_flags);
End;

Class Function ImGui.InputInt4(_label: PAnsiChar; v: PInteger;
  extra_flags: ImGuiInputTextFlags): Boolean;
Begin
  Result := igInputInt4(_label, v, extra_flags);
End;

{ Widgets: Trees }
Class Function ImGui.TreeNode(_label: AnsiString): Boolean;
Begin
  Result := igTreeNode_Str(PAnsiChar(_label));
End;

Class Function ImGui.TreeNode(str_id: AnsiString; fmt: AnsiString;
  args: Array Of Const): Boolean;
Begin
  Result := TreeNode(str_id, Format(fmt, args));
End;

Class Function ImGui.TreeNode(str_id: AnsiString; fmt: AnsiString): Boolean;
Begin
  Result := igTreeNode_StrStr(PAnsiChar(str_id), PAnsiChar(fmt), []);
End;

Class Function ImGui.TreeNode(ptr_id: pointer; fmt: AnsiString;
  args: Array Of Const): Boolean;
Begin
  Result := TreeNode(ptr_id, Format(fmt, args));
End;

Class Function ImGui.TreeNode(ptr_id: pointer; fmt: AnsiString): Boolean;
Begin
  Result := igTreeNode_Ptr(ptr_id, PAnsiChar(fmt), []);
End;

Class Function ImGui.TreeNodeEx(_label: PAnsiChar; flags: ImGuiTreeNodeFlags): Boolean;
Begin
  Result := igTreeNodeEx_Str(_label, flags);
End;

Class Function ImGui.TreeNodeEx(str_id: PAnsiChar; flags: ImGuiTreeNodeFlags;
  fmt: AnsiString; args: Array Of Const): Boolean;
Begin
  Result := TreeNodeEx(str_id, flags, Format(fmt, args));
End;

Class Function ImGui.TreeNodeEx(str_id: PAnsiChar; flags: ImGuiTreeNodeFlags;
  fmt: AnsiString): Boolean;
Begin
  Result := igTreeNodeEx_StrStr(str_id, flags, PAnsiChar(fmt), []);
End;

Class Function ImGui.TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags;
  fmt: AnsiString; args: Array Of Const): Boolean;
Begin
  Result := TreeNodeEx(ptr_id, flags, Format(fmt, args));
End;

Class Function ImGui.TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags;
  fmt: AnsiString): Boolean;
Begin
  Result := igTreeNodeEx_Ptr(ptr_id, flags, PAnsiChar(fmt), []);
End;

Class Procedure ImGui.TreePushStr(str_id: PAnsiChar);
Begin
  igTreePush_Str(str_id);
End;

Class Procedure ImGui.TreePushPtr(ptr_id: pointer);
Begin
  igTreePush_Ptr(ptr_id);
End;

Class Procedure ImGui.TreePop;
Begin
  igTreePop;
End;

// ImGui.TreeAdvanceToLabelPos -> use ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetTreeNodeToLabelSpacing());

Class Function ImGui.GetTreeNodeToLabelSpacing: Single;
Begin
  Result := igGetTreeNodeToLabelSpacing;
End;

Class Procedure ImGui.SetNextTreeNodeOpen(opened: Boolean; cond: ImGuiCond);
Begin
  igSetNextItemOpen(opened, cond);
End;

Class Function ImGui.CollapsingHeader(_label: PAnsiChar;
  flags: ImGuiTreeNodeFlags): Boolean;
Begin
  Result := igCollapsingHeader_TreeNodeFlags(_label, flags);
End;

Class Function ImGui.CollapsingHeader(_label: PAnsiChar; p_open: PBoolean;
  flags: ImGuiTreeNodeFlags): Boolean;
Begin
  Result := igCollapsingHeader_BoolPtr(_label, p_open, flags);
End;

{ Widgets: Selectable / Lists }
Class Function ImGui.Selectable(_label: AnsiString; selected: Boolean;
  flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
Begin
  Result := igSelectable_Bool(PAnsiChar(_label), selected, flags, size);
End;

Class Function ImGui.Selectable(_label: AnsiString; selected: Boolean;
  flags: ImGuiSelectableFlags): Boolean;
Begin
  Result := Selectable(_label, selected, flags, ImVec2.New(0, 0));
End;

Class Function ImGui.SelectableEx(_label: PAnsiChar; p_selected: PBoolean;
  flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
Begin
  Result := igSelectable_BoolPtr(_label, p_selected, flags, size);
End;

Class Function ImGui.ListBox(_label: PAnsiChar; current_item: PInteger;
  items: PPAnsiChar; items_count: Longint; height_in_items: Longint): Boolean;
Begin
  Result := igListBox_Str_arr(_label, current_item, items, items_count, height_in_items);
End;

Class Function ImGui.BeginListBox(_label: PAnsiChar; size: ImVec2): Boolean;
Begin
  Result := igBeginListBox(_label, size);
End;

Class Procedure ImGui.EndListBox;
Begin
  igEndListBox;
End;

{ Widgets: Value() Helpers. Output single value in "name: value" format (tip: freely declare your own within the ImGui namespace!) }
Class Procedure ImGui.ValueBool(prefix: PAnsiChar; b: Boolean);
Begin
  igValue_Bool(prefix, b);
End;

Class Procedure ImGui.ValueInt(prefix: PAnsiChar; v: Longint);
Begin
  igValue_Int(prefix, v);
End;

Class Procedure ImGui.ValueUInt(prefix: PAnsiChar; v: ImU32);
Begin
  igValue_Uint(prefix, v);
End;

Class Procedure ImGui.ValueFloat(prefix: PAnsiChar; v: Single; float_format: PAnsiChar);
Begin
  igValue_Float(prefix, v, float_format);
End;

{ Tooltip }
Class Procedure ImGui.SetTooltip(fmt: AnsiString; args: Array Of Const);
Begin
  SetTooltip(Format(fmt, args));
End;

Class Procedure ImGui.SetTooltip(fmt: AnsiString);
Begin
  igSetTooltip(PAnsiChar(fmt), []);
End;

Class Procedure ImGui.BeginTooltip;
Begin
  igBeginTooltip;
End;

Class Procedure ImGui.EndTooltip;
Begin
  igEndTooltip;
End;

{ Widgets: Menus }
Class Function ImGui.BeginMainMenuBar: Boolean;
Begin
  Result := igBeginMainMenuBar;
End;

Class Procedure ImGui.EndMainMenuBar;
Begin
  igEndMainMenuBar;
End;

Class Function ImGui.BeginMenuBar: Boolean;
Begin
  Result := igBeginMenuBar;
End;

Class Procedure ImGui.EndMenuBar;
Begin
  igEndMenuBar;
End;

Class Function ImGui.BeginMenu(_label: PAnsiChar; Enabled: Boolean): Boolean;
Begin
  Result := igBeginMenu(_label, Enabled);
End;

Class Procedure ImGui.EndMenu;
Begin
  igEndMenu;
End;

Class Function ImGui.MenuItem(_label: PAnsiChar; shortcut: PAnsiChar;
  selected: Boolean; Enabled: Boolean): Boolean;
Begin
  Result := igMenuItem_Bool(_label, shortcut, selected, Enabled);
End;

Class Function ImGui.MenuItem(_label: PAnsiChar; shortcut: PAnsiChar;
  p_selected: PBoolean; Enabled: Boolean): Boolean;
Begin
  Result := igMenuItem_BoolPtr(_label, shortcut, p_selected, Enabled);
End;

{ Popup }
Class Procedure ImGui.OpenPopup(str_id: PAnsiChar; flags: ImGuiPopupFlags);
Begin
  igOpenPopup_Str(str_id, flags);
End;

Class Function ImGui.BeginPopup(str_id: PAnsiChar; flags: ImGuiWindowFlags): Boolean;
Begin
  Result := igBeginPopup(str_id, flags);
End;

Class Function ImGui.BeginPopupModal(Name: PAnsiChar; p_open: PBoolean;
  extra_flags: ImGuiWindowFlags): Boolean;
Begin
  Result := igBeginPopupModal(Name, p_open, extra_flags);
End;

Class Function ImGui.BeginPopupContextItem(str_id: PAnsiChar;
  mouse_button: ImGuiPopupFlags): Boolean;
Begin
  Result := igBeginPopupContextItem(str_id, mouse_button);
End;

Class Function ImGui.BeginPopupContextWindow(str_id: PAnsiChar;
  mouse_button: ImGuiPopupFlags): Boolean;
Begin
  Result := igBeginPopupContextWindow(str_id, mouse_button);
End;

Class Function ImGui.BeginPopupContextVoid(str_id: PAnsiChar;
  mouse_button: ImGuiPopupFlags): Boolean;
Begin
  Result := igBeginPopupContextVoid(str_id, mouse_button);
End;

Class Procedure ImGui.EndPopup;
Begin
  igEndPopup;
End;

Class Function ImGui.IsPopupOpen(str_id: PAnsiChar; flags: ImGuiPopupFlags): Boolean;
Begin
  Result := igIsPopupOpen_Str(str_id, flags);
End;

Class Procedure ImGui.CloseCurrentPopup;
Begin
  igCloseCurrentPopup;
End;

{ Logging: all text output from interface is redirected to tty/file/clipboard. Tree nodes are automatically opened. }
Class Procedure ImGui.LogToTTY(max_depth: Longint);
Begin
  igLogToTTY(max_depth);
End;

Class Procedure ImGui.LogToFile(max_depth: Longint; filename: PAnsiChar);
Begin
  igLogToFile(max_depth, filename);
End;

Class Procedure ImGui.LogToClipboard(max_depth: Longint);
Begin
  igLogToClipboard(max_depth);
End;

Class Procedure ImGui.LogFinish;
Begin
  igLogFinish;
End;

Class Procedure ImGui.LogButtons;
Begin
  igLogButtons;
End;

Class Procedure ImGui.LogText(Const fmt: AnsiString; args: Array Of Const);
Begin
  LogText(Format(fmt, args));
End;

Class Procedure ImGui.LogText(Const fmt: AnsiString);
Begin
  igLogText(PAnsiChar(fmt), []);
End;

{ Clipping }
Class Procedure ImGui.PushClipRect(clip_rect_min: ImVec2; clip_rect_max: ImVec2;
  intersect_with_current_clip_rect: Boolean);
Begin
  igPushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);
End;

Class Procedure ImGui.PopClipRect;
Begin
  igPopClipRect;
End;

Class Procedure ImGui.StyleColorsClassic(dst: PImGuiStyle);
Begin
  igStyleColorsClassic(dst);
End;

Class Procedure ImGui.StyleColorsDark(dst: PImGuiStyle);
Begin
  igStyleColorsDark(dst);
End;

Class Procedure ImGui.StyleColorsLight(dst: PImGuiStyle);
Begin
  igStyleColorsLight(dst);
End;

Class Procedure ImGui.SetItemDefaultFocus;
Begin
  igSetItemDefaultFocus;
End;

Class Procedure ImGui.SetKeyboardFocusHere(offset: Integer);
Begin
  igSetKeyboardFocusHere(offset);
End;

{ Utilities }
Class Function ImGui.IsItemHovered(flags: ImGuiHoveredFlags): Boolean;
Begin
  Result := igIsItemHovered(flags);
End;

Class Function ImGui.IsItemActive: Boolean;
Begin
  Result := igIsItemActive;
End;

Class Function ImGui.IsItemClicked(mouse_button: ImGuiMouseButton): Boolean;
Begin
  Result := igIsItemClicked(mouse_button);
End;

Class Function ImGui.IsItemVisible: Boolean;
Begin
  Result := igIsItemVisible;
End;

Class Function ImGui.IsAnyItemHovered: Boolean;
Begin
  Result := igIsAnyItemHovered;
End;

Class Function ImGui.IsAnyItemActive: Boolean;
Begin
  Result := igIsAnyItemActive;
End;

Class Function ImGui.GetItemRectMin(): ImVec2;
Begin
  igGetItemRectMin(@Result);
End;

Class Function ImGui.GetItemRectMax(): ImVec2;
Begin
  igGetItemRectMax(@Result);
End;

Class Function ImGui.GetItemRectSize(): ImVec2;
Begin
  igGetItemRectSize(@Result);
End;

Class Procedure ImGui.SetNextItemAllowOverlap;
Begin
  igSetNextItemAllowOverlap();
End;

Class Function ImGui.IsWindowFocused(flags: ImGuiFocusedFlags): Boolean;
Begin
  Result := igIsWindowFocused(flags);
End;

Class Function ImGui.IsWindowHovered(flags: ImGuiHoveredFlags): Boolean;
Begin
  Result := igIsWindowHovered(flags);
End;

Class Function ImGui.IsRectVisible(Const item_size: ImVec2): Boolean;
Begin
  Result := igIsRectVisible_Nil(item_size);
End;

Class Function ImGui.IsRectVisible(Const rect_min, rect_max: ImVec2): Boolean;
Begin
  Result := igIsRectVisible_Vec2(rect_min, rect_max);
End;

Class Function ImGui.GetTime: Single;
Begin
  Result := igGetTime;
End;

Class Function ImGui.GetFrameCount: Longint;
Begin
  Result := igGetFrameCount;
End;

Class Function ImGui.GetStyleColorName(idx: ImGuiCol): PAnsiChar;
Begin
  Result := igGetStyleColorName(idx);
End;

Class Function ImGui.CalcTextSize(_text: PAnsiChar; text_end: PAnsiChar;
  hide_text_after_double_hash: Boolean; wrap_width: Single): ImVec2;
Begin
  igCalcTextSize(@Result, _text, text_end, hide_text_after_double_hash, wrap_width);
End;

{ TODO: Add ImGuiListClipper - Time : 11/4/2023 12:42:03 AM }

Class Procedure ImGui.ColorConvertU32ToFloat4(pOut: PImVec4; in_: ImU32);
Begin
  igColorConvertU32ToFloat4(pOut, in_);
End;

Class Function ImGui.ColorConvertFloat4ToU32(in_: ImVec4): ImU32;
Begin
  Result := igColorConvertFloat4ToU32(in_);
End;

Class Procedure ImGui.ColorConvertRGBtoHSV(r: Single; g: Single;
  b: Single; out_h: Psingle; out_s: Psingle; out_v: Psingle);
Begin
  igColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v);
End;

Class Procedure ImGui.ColorConvertHSVtoRGB(h: Single; s: Single;
  v: Single; out_r: Psingle; out_g: Psingle; out_b: Psingle);
Begin
  igColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b);
End;

Class Function ImGui.GetKeyIndex(key: ImGuiKey): ImGuiKey;
Begin
  Result := igGetKeyIndex(key);
End;

Class Function ImGui.IsKeyDown(user_key_index: ImGuiKey): Boolean;
Begin
  Result := igIsKeyDown_Nil(user_key_index);
End;

Class Function ImGui.IsKeyPressed(user_key_index: ImGuiKey; _repeat: Boolean): Boolean;
Begin
  Result := igIsKeyPressed_Bool(user_key_index, _repeat);
End;

Class Function ImGui.IsKeyReleased(user_key_index: ImGuiKey): Boolean;
Begin
  Result := igIsKeyReleased_Nil(user_key_index);
End;

Class Function ImGui.IsMouseDown(_button: ImGuiMouseButton): Boolean;
Begin
  Result := igIsMouseDown_Nil(_button);
End;

Class Function ImGui.IsMouseClicked(_button: ImGuiMouseButton;
  _repeat: Boolean): Boolean;
Begin
  Result := igIsMouseClicked_Bool(_button, _repeat);
End;

Class Function ImGui.IsMouseDoubleClicked(_button: ImGuiMouseButton): Boolean;
Begin
  Result := igIsMouseDoubleClicked_Nil(_button);
End;

Class Function ImGui.IsMouseDoubleClicked(_button: ImGuiMouseButton;
  owner_id: ImGuiID): Boolean;
Begin
  Result := igIsMouseDoubleClicked_ID(_button, owner_id);
End;

Class Function ImGui.IsMouseReleased(_button: ImGuiMouseButton): Boolean;
Begin
  Result := igIsMouseReleased_Nil(_button);
End;

Class Function ImGui.IsMouseHoveringRect(r_min: ImVec2; r_max: ImVec2;
  clip: Boolean): Boolean;
Begin
  Result := igIsMouseHoveringRect(r_min, r_max, clip);
End;

Class Function ImGui.IsMouseDragging(_button: ImGuiMouseButton;
  lock_threshold: Single): Boolean;
Begin
  Result := igIsMouseDragging(_button, lock_threshold);
End;

Class Function ImGui.GetMousePos: ImVec2;
Begin
  igGetMousePos(@Result);
End;

Class Function ImGui.GetMousePosOnOpeningCurrentPopup: ImVec2;
Begin
  igGetMousePosOnOpeningCurrentPopup(@Result);
End;

Class Function ImGui.GetMouseDragDelta(_button: ImGuiMouseButton;
  lock_threshold: Single): ImVec2;
Begin
  igGetMouseDragDelta(@Result, _button, lock_threshold);
End;

Class Procedure ImGui.ResetMouseDragDelta(_button: ImGuiMouseButton);
Begin
  igResetMouseDragDelta(_button);
End;

Class Function ImGui.GetMouseCursor: ImGuiMouseCursor;
Begin
  Result := igGetMouseCursor;
End;

Class Procedure ImGui.SetMouseCursor(_type: ImGuiMouseCursor);
Begin
  igSetMouseCursor(_type);
End;

Class Procedure ImGui.SetNextFrameWantCaptureKeyboard(capture: Boolean);
Begin
  igSetNextFrameWantCaptureKeyboard(capture);
End;

Class Procedure ImGui.SetNextFrameWantCaptureMouse(capture: Boolean);
Begin
  igSetNextFrameWantCaptureMouse(capture);
End;

{ Helpers functions to access functions pointers in ImGui::GetIO() }
Class Function ImGui.MemAlloc(sz: size_t): pointer;
Begin
  Result := igMemAlloc(sz);
End;

Class Procedure ImGui.MemFree(ptr: pointer);
Begin
  igMemFree(ptr);
End;

Class Function ImGui.GetClipboardText: PAnsiChar;
Begin
  Result := igGetClipboardText;
End;

Class Procedure ImGui.SetClipboardText(_text: PAnsiChar);
Begin
  igSetClipboardText(_text);
End;

{ Internal state access - if you want to share ImGui state between modules (e.g. DLL) or allocate it yourself }
Class Function ImGui.GetVersion: PAnsiChar;
Begin
  Result := igGetVersion;
End;

{ TImFontAtlasHelper }

Function TImFontAtlasHelper.AddFontDefault: PImFont;
Begin
  Result := ImFontAtlas_AddFontDefault(@Self, nil);
End;

Function TImFontAtlasHelper.AddFontFromFileTTF(filename: PAnsiChar;
  size_pixels: Single; font_cfg: PImFontConfig; glyph_ranges: PImWchar): PImFont;
Begin
  Result := ImFontAtlas_AddFontFromFileTTF(@Self, filename, size_pixels,
    font_cfg, glyph_ranges);
End;

Procedure TImFontAtlasHelper.GetTexDataAsRGBA32(out_pixels: PPImU8;
  out_width: PInteger; out_height: PInteger; out_bytes_per_pixel: PInteger);
Begin
  ImFontAtlas_GetTexDataAsRGBA32(@Self, out_pixels, out_width,
    out_height, out_bytes_per_pixel);
End;

Procedure TImFontAtlasHelper.GetTexDataAsAlpha8(out_pixels: PPImU8;
  out_width: PInteger; out_height: PInteger; out_bytes_per_pixel: PInteger);
Begin
  ImFontAtlas_GetTexDataAsAlpha8(@Self, out_pixels, out_width,
    out_height, out_bytes_per_pixel);
End;

Procedure TImFontAtlasHelper.SetTexID(id: ImTextureID);
Begin
  ImFontAtlas_SetTexID(@Self, id);
End;

{ TPImDrawListHelper }
//procedure TPImDrawListHelper.AddRectFilled(p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags);
//begin
//  ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, flags);
//end;


{ TImDrawListHelper }

Procedure TImDrawListHelper.PushClipRect(clip_rect_min: ImVec2;
  clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean);
Begin
  ImDrawList_PushClipRect(@self, clip_rect_min, clip_rect_max,
    intersect_with_current_clip_rect);
End;

Procedure TImDrawListHelper.PushClipRectFullScreen;
Begin
  ImDrawList_PushClipRectFullScreen(@self);
End;

Procedure TImDrawListHelper.PopClipRect;
Begin
  ImDrawList_PopClipRect(@self);
End;

Procedure TImDrawListHelper.PushTextureID(texture_id: ImTextureID);
Begin
  ImDrawList_PushTextureID(@self, texture_id);
End;

Procedure TImDrawListHelper.PopTextureID;
Begin
  ImDrawList_PopTextureID(@self);
End;

Procedure TImDrawListHelper.AddLine(p1: ImVec2; p2: ImVec2; col: ImU32;
  thickness: Single);
Begin
  ImDrawList_AddLine(@self, p1, p2, col, thickness);
End;

Procedure TImDrawListHelper.AddRect(a: ImVec2; b: ImVec2; col: ImU32;
  rounding: Single; rounding_corners_flags: ImDrawFlags; thickness: Single);
Begin
  ImDrawList_AddRect(@self, a, b, col, rounding, rounding_corners_flags, thickness);
End;

Procedure TImDrawListHelper.AddRectFilled(p_min: ImVec2; p_max: ImVec2;
  col: ImU32; rounding: Single; flags: ImDrawFlags);
Begin
  ImDrawList_AddRectFilled(@self, p_min, p_max, col, rounding, flags);
End;

Procedure TImDrawListHelper.AddRectFilledMultiColor(a: ImVec2; b: ImVec2;
  col_upr_left: ImU32; col_upr_right: ImU32; col_bot_right: ImU32; col_bot_left: ImU32);
Begin
  ImDrawList_AddRectFilledMultiColor(@self, a, b, col_upr_left,
    col_upr_right, col_bot_right, col_bot_left);
End;

Procedure TImDrawListHelper.AddQuad(a: ImVec2; b: ImVec2; c: ImVec2;
  d: ImVec2; col: ImU32; thickness: Single);
Begin
  ImDrawList_AddQuad(@self, a, b, c, d, col, thickness);
End;

Procedure TImDrawListHelper.AddQuadFilled(a: ImVec2; b: ImVec2;
  c: ImVec2; d: ImVec2; col: ImU32);
Begin
  ImDrawList_AddQuadFilled(@self, a, b, c, d, col);
End;

Procedure TImDrawListHelper.AddTriangle(a: ImVec2; b: ImVec2; c: ImVec2;
  col: ImU32; thickness: Single);
Begin
  ImDrawList_AddTriangle(@self, a, b, c, col, thickness);
End;

Procedure TImDrawListHelper.AddTriangleFilled(a: ImVec2; b: ImVec2;
  c: ImVec2; col: ImU32);
Begin
  ImDrawList_AddTriangleFilled(@self, a, b, c, col);
End;

Procedure TImDrawListHelper.AddCircle(centre: ImVec2; radius: Single;
  col: ImU32; num_segments: Longint; thickness: Single);
Begin
  ImDrawList_AddCircle(@self, centre, radius, col, num_segments, thickness);
End;

Procedure TImDrawListHelper.AddCircleFilled(centre: ImVec2; radius: Single;
  col: ImU32; num_segments: Longint);
Begin
  ImDrawList_AddCircleFilled(@self, centre, radius, col, num_segments);
End;

Procedure TImDrawListHelper.AddText(pos: ImVec2; col: ImU32;
  text_begin: PAnsiChar; text_end: PAnsiChar);
Begin
  ImDrawList_AddText_Vec2(@self, pos, col, text_begin, text_end);
End;

Procedure TImDrawListHelper.AddTextExt(font: ImFont; font_size: Single;
  pos: ImVec2; col: ImU32; text_begin: PAnsiChar; text_end: PAnsiChar;
  wrap_width: Single; cpu_fine_clip_rect: ImVec4);
Begin
  ImDrawList_AddText_FontPtr(@self, @font, font_size, pos, col, text_begin,
    text_end, wrap_width, @cpu_fine_clip_rect);
End;

Procedure TImDrawListHelper.AddImage(user_texture_id: ImTextureID;
  a: ImVec2; b: ImVec2; uva: ImVec2; uvb: ImVec2; col: ImU32);
Begin
  ImDrawList_AddImage(@self, user_texture_id, a, b, uva, uvb, col);
End;

Procedure TImDrawListHelper.AddImageQuad(user_texture_id: ImTextureID;
  Const a, b, c, d: ImVec2; Const uva, uvb, uvc, uvd: ImVec2; col: ImU32);
Begin
  ImDrawList_AddImageQuad(@self, user_texture_id, a, b, c, d, uva, uvb, uvc, uvd, col);
End;

Procedure TImDrawListHelper.AddPolyline(points: PImVec2; num_points: Integer;
  col: ImU32; flags: ImDrawFlags; thickness: Single);
Begin
  ImDrawList_AddPolyline(@self, points, num_points, col, flags, thickness);
End;

Procedure TImDrawListHelper.AddConvexPolyFilled(points: PImVec2;
  num_points: Integer; col: ImU32);
Begin
  ImDrawList_AddConvexPolyFilled(@self, points, num_points, col);
End;

Procedure TImDrawListHelper.AddBezierCubic(p1: ImVec2; p2: ImVec2;
  p3: ImVec2; p4: ImVec2; col: ImU32; thickness: Single; num_segments: Integer);
Begin
  ImDrawList_AddBezierCubic(@self, p1, p2, p3, p4, col, thickness, num_segments);
End;

{ Stateful path API, add points then finish with PathFill() or PathStroke() }
Procedure TImDrawListHelper.PathClear;
Begin
  ImDrawList_PathClear(@self);
End;

Procedure TImDrawListHelper.PathLineTo(pos: ImVec2);
Begin
  ImDrawList_PathLineTo(@self, pos);
End;

Procedure TImDrawListHelper.PathLineToMergeDuplicate(pos: ImVec2);
Begin
  ImDrawList_PathLineToMergeDuplicate(@self, pos);
End;

Procedure TImDrawListHelper.PathFillConvex(col: ImU32);
Begin
  ImDrawList_PathFillConvex(@self, col);
End;

Procedure TImDrawListHelper.PathStroke(col: ImU32; flags: ImDrawFlags;
  thickness: Single);
Begin
  ImDrawList_PathStroke(@self, col, flags, thickness);
End;

Procedure TImDrawListHelper.PathArcTo(centre: ImVec2; radius: Single;
  a_min: Single; a_max: Single; num_segments: Longint);
Begin
  ImDrawList_PathArcTo(@self, centre, radius, a_min, a_max, num_segments);
End;
{ Use precomputed angles for a 12 steps circle }
Procedure TImDrawListHelper.PathArcToFast(centre: ImVec2; radius: Single;
  a_min_of_12: Longint; a_max_of_12: Longint);
Begin
  ImDrawList_PathArcToFast(@self, centre, radius, a_min_of_12, a_max_of_12);
End;
//procedure TImDrawListHelper.PathBezierCurveTo(p1: ImVec2; p2: ImVec2; p3: ImVec2; num_segments: longint);
//    begin ImDrawList_PathBezierCurveTo(@self, p1, p2, p3, num_segments) end;
Procedure TImDrawListHelper.PathRect(rect_min: ImVec2; rect_max: ImVec2;
  rounding: Single; rounding_corners_flags: ImDrawFlags);
Begin
  ImDrawList_PathRect(@self, rect_min, rect_max, rounding, rounding_corners_flags);
End;

{ Channels }
Procedure TImDrawListHelper.ChannelsSplit(channels_count: Longint);
Begin
  ImDrawList_ChannelsSplit(@self, channels_count);
End;

Procedure TImDrawListHelper.ChannelsMerge;
Begin
  ImDrawList_ChannelsMerge(@self);
End;

Procedure TImDrawListHelper.ChannelsSetCurrent(channel_index: Longint);
Begin
  ImDrawList_ChannelsSetCurrent(@self, channel_index);
End;

{ Advanced }
{ Your rendering function must check for 'UserCallback' label_ ImDrawCmd and call the function instead of rendering triangles. }
Procedure TImDrawListHelper.AddCallback(callback: ImDrawCallback;
  callback_data: pointer);
Begin
  ImDrawList_AddCallback(@self, callback, callback_data);
End;
{ This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible }
Procedure TImDrawListHelper.AddDrawCmd;
Begin
  ImDrawList_AddDrawCmd(@self);
End;

{ Internal helpers }
Procedure TImDrawListHelper.PrimReserve(idx_count: Longint; vtx_count: Longint);
Begin
  ImDrawList_PrimReserve(@self, idx_count, vtx_count);
End;

Procedure TImDrawListHelper.PrimRect(a: ImVec2; b: ImVec2; col: ImU32);
Begin
  ImDrawList_PrimRect(@self, a, b, col);
End;

Procedure TImDrawListHelper.PrimRectUV(a: ImVec2; b: ImVec2; uv_a: ImVec2;
  uv_b: ImVec2; col: ImU32);
Begin
  ImDrawList_PrimRectUV(@self, a, b, uv_a, uv_b, col);
End;

Procedure TImDrawListHelper.PrimQuadUV(a: ImVec2; b: ImVec2; c: ImVec2;
  d: ImVec2; uv_a: ImVec2; uv_b: ImVec2; uv_c: ImVec2; uv_d: ImVec2; col: ImU32);
Begin
  ImDrawList_PrimQuadUV(@self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col);
End;

Procedure TImDrawListHelper.PrimWriteVtx(pos: ImVec2; uv: ImVec2; col: ImU32);
Begin
  ImDrawList_PrimWriteVtx(@self, pos, uv, col);
End;

Procedure TImDrawListHelper.PrimWriteIdx(idx: ImDrawIdx);
Begin
  ImDrawList_PrimWriteIdx(@self, idx);
End;

Procedure TImDrawListHelper.PrimVtx(pos: ImVec2; uv: ImVec2; col: ImU32);
Begin
  ImDrawList_PrimVtx(@self, pos, uv, col);
End;



End.
