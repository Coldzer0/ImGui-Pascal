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
    {$LinkLib C}
    SharedSuffix = 'so';
  {$elseif defined(MSWINDOWS)}
    SharedSuffix = 'dll';
  {$endif}
  CIMGUI_LIB = 'cimgui.' + SharedSuffix;

CONST
  IMGUI_VERSION      = '1.90 WIP';
  IMGUI_VERSION_NUM  = 18998;

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
    class function Begin_(Name: AnsiString; p_open: PBoolean= nil; flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure End_; {$IfDef INLINE} inline;{$EndIf}
    Class Function BeginChild(str_id: AnsiString; size: ImVec2;
      child_flags: ImGuiChildFlags = ImGuiChildFlags_None; extra_flags: ImGuiWindowFlags = ImGuiWindowFlags_None): Boolean;
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
    class function GetWindowPos: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    class function GetWindowSize: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowWidth(): Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function GetWindowHeight(): Single; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowCollapsed(): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetWindowFontScale(scale: Single); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowPos(pos: ImVec2; cond: ImGuiCond; pivot: ImVec2); overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextWindowPos(pos: ImVec2; cond: ImGuiCond = ImGuiCond_None); overload;
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
    Class Procedure PushStyleColor(idx: ImGuiCol; col: ImU32); overload; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleColor(idx: ImGuiCol; col: ImVec4); overload; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PopStyleColor(Count: Longint = 1); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleVar(idx: ImGuiStyleVar; val: Single); overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Procedure PushStyleVar(idx: ImGuiStyleVar; val: ImVec2); overload;
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
    Class Procedure Text(Const text_: AnsiString); overload;{$IfDef INLINE} inline;{$EndIf}
    Class Procedure Text(Const Fmt: AnsiString; Const Args: Array Of Const);overload;{$IfDef INLINE} inline;{$EndIf}
    //procedure igTextV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextColored(col: ImVec4; fmt: PAnsiChar; args: Array Of Const);overload;
    Class Procedure TextColored(col: ImVec4; Const fmt: AnsiString);overload;
    //procedure igTextColoredV(col:ImVec4; fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextDisabled(Const fmt: AnsiString; args: Array Of Const);overload; {inline;}
    Class Procedure TextDisabled(Const fmt: AnsiString);overload; {$IfDef INLINE} inline;{$EndIf}
    //procedure igTextDisabledV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextWrapped(Const fmt: AnsiString; args: Array Of Const);overload; {inline;}
    Class Procedure TextWrapped(Const fmt: AnsiString);overload; {$IfDef INLINE} inline;{$EndIf}
    //procedure igTextWrappedV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure TextUnformatted(Const _text: AnsiString);overload;
    Class Procedure TextUnformatted(Const _text: PAnsiChar; Const text_end: PAnsiChar = nil);overload;
    Class Procedure LabelText(_label: AnsiString; fmt: AnsiString);overload;
    Class Procedure LabelText(_label: AnsiString; fmt: PAnsiChar; args: Array Of Const);overload;
    //procedure igLabelTextV(_label:PAnsiChar; fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;
    Class Procedure Bullet; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure BulletText(Const fmt: AnsiString; args: Array Of Const);overload; {inline;}
    Class Procedure BulletText(Const fmt: AnsiString);overload; {$IfDef INLINE} inline;{$EndIf}
    //procedure igBulletTextV(fmt:PAnsiChar; args:va_list);cdecl;external ImguiLibName;

    { Widgets: Main }
    //Class Function Button(_label: AnsiString; size: ImVec2; flags: ImGuiButtonFlags): Boolean;
    Class Function Button(_label: AnsiString; size: ImVec2): Boolean; overload;
    Class Function Button(_label: AnsiString): Boolean; overload; //overload for default size (0,0)
    Class Function SmallButton(_label: PAnsiChar): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InvisibleButton(str_id: PAnsiChar; size: ImVec2;
      flags: ImGuiButtonFlags = ImGuiButtonFlags_None): Boolean; {$IfDef INLINE} inline;{$EndIf}
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
    Class Function SliderFloat(_label: PAnsiChar; v: Psingle; v_min: Single;
      v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat2(_label: PAnsiChar; v: PSingle; v_min: Single;
      v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat3(_label: PAnsiChar; v: PSingle; v_min: Single;
      v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function SliderFloat4(_label: PAnsiChar; v: PSingle; v_min: Single;
      v_max: Single; display_format: PAnsiChar = nil;
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

    class function SliderInt2(_label: PAnsiChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function SliderInt3(_label: PAnsiChar; v: PInteger; v_min: Longint;
      v_max: Longint; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function SliderInt4(_label: PAnsiChar; v: PInteger; v_min: Longint;
      v_max: Longint; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function VSliderFloat(_label: PAnsiChar; size: ImVec2; v: Psingle;
      v_min: Single; v_max: Single; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function VSliderInt(_label: PAnsiChar; size: ImVec2; v: PInteger;
      v_min: Longint; v_max: Longint; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Drags (tip: ctrl+click on a drag box to input text) }
    // For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every functions, remember than a 'float v[3]' function argument is the same as 'float* v'. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
    { If v_min >= v_max we have no bound }
    Class Function DragFloat(_label: PAnsiChar; v: Psingle; v_speed: Single = 1.0;
      v_min: Single = 0.0; v_max: Single = 0.0; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat2(_label: PAnsiChar; v: PSingle; v_speed: Single = 1.0;
      v_min: Single = 0.0; v_max: Single = 0.0; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat3(_label: PAnsiChar; v: PSingle; v_speed: Single = 1.0;
      v_min: Single = 0.0; v_max: Single = 0.0; display_format: PAnsiChar = nil;
      flags: ImGuiSliderFlags = ImGuiSliderFlags_None): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function DragFloat4(_label: PAnsiChar; v: PSingle; v_speed: Single = 1.0;
      v_min: Single = 0.0; v_max: Single = 0.0; display_format: PAnsiChar = nil;
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
    Class Function InputText(_label: PAnsiChar; buf: PAnsiChar; buf_size: size_t;
      flags: ImGuiInputTextFlags = ImGuiInputTextFlags_None;
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
    Class Function InputFloat2(_label: PAnsiChar; v: PSingle; format: PAnsiChar;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat3(_label: PAnsiChar; v: PSingle; format: PAnsiChar;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
    Class Function InputFloat4(_label: PAnsiChar; v: PSingle; format: PAnsiChar;
      extra_flags: ImGuiInputTextFlags): Boolean; {$IfDef INLINE} inline;{$EndIf}
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
    Class Function TreeNode(_label: AnsiString): Boolean; overload; {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNode(str_id: AnsiString; fmt: AnsiString; 
      args: Array Of Const): Boolean; overload; {inline;}
    Class Function TreeNode(str_id: AnsiString; fmt: AnsiString): Boolean; overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNode(ptr_id: pointer; fmt: AnsiString;
      args: Array Of Const): Boolean; overload;{inline;}
    Class Function TreeNode(ptr_id: pointer; fmt: AnsiString): Boolean; overload;
    {$IfDef INLINE} inline;{$EndIf}

    Class Function TreeNodeEx(_label: PAnsiChar; flags: ImGuiTreeNodeFlags): Boolean;overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNodeEx(str_id: PAnsiChar; flags: ImGuiTreeNodeFlags;
      fmt: AnsiString; args: Array Of Const): Boolean; overload; {inline;}
    Class Function TreeNodeEx(str_id: PAnsiChar; flags: ImGuiTreeNodeFlags;
      fmt: AnsiString): Boolean; overload; {$IfDef INLINE} inline;{$EndIf}
    Class Function TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags;
      fmt: AnsiString; args: Array Of Const): Boolean; overload; {inline;}
    Class Function TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags;
      fmt: AnsiString): Boolean; overload; {$IfDef INLINE} inline;{$EndIf}
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
      flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): Boolean; overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function CollapsingHeader(_label: PAnsiChar; p_open: PBoolean;
      flags: ImGuiTreeNodeFlags = ImGuiTreeNodeFlags_None): Boolean; overload;
    {$IfDef INLINE} inline;{$EndIf}

    { Widgets: Selectable / Lists }
    Class Function Selectable(_label: AnsiString; selected: Boolean;
      flags: ImGuiSelectableFlags; size: ImVec2): Boolean; overload;
    Class Function Selectable(_label: AnsiString; selected: Boolean;
      flags: ImGuiSelectableFlags = ImGuiSelectableFlags_None): Boolean; overload;
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
    Class Procedure ValueBool(prefix: PAnsiChar; b: Boolean); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueInt(prefix: PAnsiChar; v: Longint); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueUInt(prefix: PAnsiChar; v: ImU32); {$IfDef INLINE} inline;{$EndIf}
    Class Procedure ValueFloat(prefix: PAnsiChar; v: Single; float_format: PAnsiChar);
    {$IfDef INLINE} inline;{$EndIf}

    { Tooltip }
    Class Procedure SetTooltip(fmt: AnsiString; args: Array Of Const); overload;{inline}
    Class Procedure SetTooltip(fmt: AnsiString); overload;{$IfDef INLINE} inline;{$EndIf}
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
      selected: Boolean = False; Enabled: Boolean = True): Boolean;overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function MenuItem(_label: PAnsiChar; shortcut: PAnsiChar;
      p_selected: PBoolean; Enabled: Boolean = True): Boolean;overload;
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
    Class Procedure LogText(Const fmt: AnsiString; args: Array Of Const);overload;
    Class Procedure LogText(Const fmt: AnsiString);overload;

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
    class function GetItemRectMin: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    class function GetItemRectMax: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    class function GetItemRectSize: ImVec2; {$IfDef INLINE} inline;{$EndIf}
    Class Procedure SetNextItemAllowOverlap; {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowFocused(flags: ImGuiFocusedFlags): Boolean;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsWindowHovered(flags: ImGuiHoveredFlags =
      ImGuiHoveredFlags_None): Boolean; {$IfDef INLINE} inline;{$EndIf}

    Class Function IsRectVisible(Const item_size: ImVec2): Boolean; overload;
    {$IfDef INLINE} inline;{$EndIf}
    Class Function IsRectVisible(Const rect_min, rect_max: ImVec2): Boolean; overload;
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
    class function IsMouseDoubleClicked(_button: ImGuiMouseButton): Boolean;overload;
    class function IsMouseDoubleClicked(_button: ImGuiMouseButton; owner_id: ImGuiID): Boolean; overload;
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
    function AddFontDefault() : PImFont;
    function AddFontFromFileTTF(filename: PAnsiChar; size_pixels: Single; font_cfg: PImFontConfig = nil; glyph_ranges: PImWchar = nil): PImFont;

    Procedure GetTexDataAsAlpha8(out_pixels: PPImU8; out_width: PInteger;
      out_height: PInteger; out_bytes_per_pixel: PInteger);
    Procedure SetTexID(id: ImTextureID);
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
    procedure AddLine(p1: ImVec2; p2: ImVec2; col: ImU32; thickness: Single = 1.0);
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
    Procedure AddText(pos: ImVec2; col: ImU32; text_begin: PAnsiChar; text_end: PAnsiChar);
    {$IfDef INLINE} inline;{$EndIf}
    Procedure AddTextExt(font: ImFont; font_size: Single; pos: ImVec2;
      col: ImU32; text_begin: PAnsiChar; text_end: PAnsiChar; wrap_width: Single;
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

function IM_COL32(R,G,B,A : ImU32): ImU32;

Implementation

function IM_COL32(R,G,B,A : ImU32): ImU32;
begin
  Result := (A shl IM_COL32_A_SHIFT) or (B shl IM_COL32_B_SHIFT) or (G shl IM_COL32_G_SHIFT) or (R shl IM_COL32_R_SHIFT);
end;

Function ImGuiPlatformMonitor_Create(): PImGuiPlatformMonitor;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := ImGuiPlatformMonitor_ImGuiPlatformMonitor();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;


//Replacement for (void*)(intptr_t) int cast, used for IDs. Generates warnings
Function ImIDPtr(Const i: Integer): pointer;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := pointer(IntPtr(i));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Function ImColorCreate(Const color: ImVec4): ImU32;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := ImGui.ColorConvertFloat4ToU32(color);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;


{ ImGui
  Keep functions short, they're mostly just wrappers. Inlining begin/end with trivial function body is ok
}

class function ImGui.CreateContext(shared_font_atlas: PImFontAtlas): PImGuiContext;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igCreateContext(shared_font_atlas);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.DestroyContext(ctx: PImGuiContext);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igDestroyContext(ctx);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetIO: PImGuiIO;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetIO;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetPlatformIO: PImGuiPlatformIO;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetPlatformIO();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetStyle: PImGuiStyle;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetStyle;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetDrawData: PImDrawData;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetDrawData;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.NewFrame;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igNewFrame;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.Render;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igRender;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ShowUserGuide;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igShowUserGuide;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ShowStyleEditor(ref: PImGuiStyle);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igShowStyleEditor(ref);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ShowDemoWindow(p_open: PBoolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igShowDemoWindow(p_open);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ShowMetricsWindow(p_open: PBoolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igShowMetricsWindow(p_open);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetMainViewport: PImGuiViewport;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetMainViewport();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetCurrentContext: PImGuiContext;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetCurrentContext();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetDragDropPayload: PImGuiPayload;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetDragDropPayload();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetCenterViewPort(ViewPort: PImGuiViewport): ImVec2;
begin
  ImGuiViewport_GetCenter(@Result, ViewPort);
end;

class function ImGui.FindViewportByPlatformHandle(platform_handle: Pointer): PImGuiViewport;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igFindViewportByPlatformHandle(platform_handle);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.DestroyPlatformWindows;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igDestroyPlatformWindows();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.AddMouseViewportEvent(id: ImGuiID);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_AddMouseViewportEvent(GetIO(), id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.AddFocusEvent(focused: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_AddFocusEvent(GetIO(), focused);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.AddMouseSourceEvent(Source: ImGuiMouseSource);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_AddMouseSourceEvent(GetIO(), Source);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.AddMousePosEvent(x: Single; y: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_AddMousePosEvent(GetIO(), x, y);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.AddMouseWheelEvent(wheel_x: Single; wheel_y: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_AddMouseWheelEvent(GetIO(), wheel_x, wheel_y);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.AddMouseButtonEvent(button: Int32; down: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_AddMouseButtonEvent(GetIO(), button, down);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.AddInputCharactersUTF8(const str: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_AddInputCharactersUTF8(GetIO(), PAnsiChar(str));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.AddKeyEvent(key: ImGuiKey; down: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_AddKeyEvent(GetIO(), key, down);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetKeyEventNativeData(key: ImGuiKey; native_keycode: Int32; native_scancode: Int32; native_legacy_index: Int32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImGuiIO_SetKeyEventNativeData(GetIO(), key, native_keycode,
    native_scancode, native_legacy_index);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.UpdatePlatformWindows;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igUpdatePlatformWindows();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.RenderPlatformWindowsDefault(platform_render_arg: Pointer; renderer_render_arg: Pointer);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igRenderPlatformWindowsDefault(platform_render_arg, renderer_render_arg);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.Begin_(Name: AnsiString; p_open: PBoolean; flags: ImGuiWindowFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBegin(PAnsiChar(Name), p_open, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.End_;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEnd;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginChild(str_id: AnsiString; size: ImVec2; child_flags: ImGuiChildFlags; extra_flags: ImGuiWindowFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginChild_Str(PAnsiChar(str_id), size, child_flags, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginChildEx(id: ImGuiID; size: ImVec2; child_flags: ImGuiChildFlags; extra_flags: ImGuiWindowFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginChild_ID(id, size, child_flags, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndChild;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndChild;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.GetContentRegionMax(out_: PImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetContentRegionMax(out_);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetContentRegionAvail: ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetContentRegionAvail(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetContentRegionAvailWidth: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := GetContentRegionAvail().x;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.GetWindowContentRegionMin(out_: PImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetWindowContentRegionMin(out_);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetWindowContentRegionMax: ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetWindowContentRegionMax(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetWindowContentRegionWidth: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := GetWindowContentRegionMax().x;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetWindowDrawList: PImDrawList;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetWindowDrawList;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetWindowPos(): ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetWindowPos(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetWindowSize() : ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetWindowSize(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetWindowWidth: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetWindowWidth;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetWindowHeight: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetWindowHeight;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsWindowCollapsed: Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsWindowCollapsed;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowFontScale(scale: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowFontScale(scale);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextWindowPos(pos: ImVec2; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextWindowPos(pos, cond, ImVec2.New(0, 0));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextWindowPos(pos: ImVec2; cond: ImGuiCond; pivot: ImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextWindowPos(pos, cond, pivot);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
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
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextWindowSize(size, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextWindowSizeConstraints(size_min: ImVec2; size_max: ImVec2; custom_callback: ImGuiSizeCallback; custom_callback_data: pointer);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextWindowSizeConstraints(size_min, size_max, custom_callback,
    custom_callback_data);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextWindowContentSize(size: ImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextWindowContentSize(size);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextWindowCollapsed(collapsed: Boolean; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextWindowCollapsed(collapsed, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextWindowFocus;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextWindowFocus;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowPos(pos: ImVec2; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowPos_Vec2(pos, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowSize(size: ImVec2; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowSize_Vec2(size, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowCollapsed(collapsed: Boolean; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowCollapsed_Bool(collapsed, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowFocus;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowFocus_Nil();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowPosByName(Name: PAnsiChar; pos: ImVec2; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowPos_Str(Name, pos, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowSize2(Name: PAnsiChar; size: ImVec2; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowSize_Str(Name, size, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowCollapsed2(Name: PAnsiChar; collapsed: Boolean; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowCollapsed_Str(Name, collapsed, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetWindowFocus2(Name: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetWindowFocus_Str(Name);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetScrollX: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetScrollX;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetScrollY: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetScrollY;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetScrollMaxX: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetScrollMaxX;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetScrollMaxY: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetScrollMaxY;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetScrollX(scroll_x: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetScrollX_Float(scroll_x);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetScrollY(scroll_y: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetScrollY_Float(scroll_y);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetScrollHere(center_y_ratio: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetScrollHereY(center_y_ratio);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetScrollFromPosY(pos_y: Single; center_y_ratio: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetScrollFromPosY_Float(pos_y, center_y_ratio);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetStateStorage(tree: PImGuiStorage);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetStateStorage(tree);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetStateStorage: PImGuiStorage;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetStateStorage;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;



{ Parameters stacks (shared) }
class procedure ImGui.PushFont(font: PImFont);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushFont(font);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopFont;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopFont;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushStyleColor(idx: ImGuiCol; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushStyleColor_U32(idx, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushStyleColor(idx: ImGuiCol; col: ImVec4);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushStyleColor_Vec4(idx, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopStyleColor(Count: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopStyleColor(Count);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushStyleVar(idx: ImGuiStyleVar; val: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushStyleVar_Float(idx, val);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushStyleVar(idx: ImGuiStyleVar; val: ImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushStyleVar_Vec2(idx, val);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopStyleVar(Count: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopStyleVar(Count);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetFont: PImFont;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetFont;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetFontSize: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetFontSize;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetFontTexUvWhitePixel: ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetFontTexUvWhitePixel(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetColorU32(idx: ImGuiCol; alpha_mul: Single): ImU32;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetColorU32_Col(idx, alpha_mul);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetColorU32Vec(col: ImVec4): ImU32;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetColorU32_Vec4(col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Parameters stacks (current window) }
class procedure ImGui.PushItemWidth(item_width: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushItemWidth(item_width);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopItemWidth;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopItemWidth;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.CalcItemWidth: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igCalcItemWidth;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushTextWrapPos(wrap_pos_x: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushTextWrapPos(wrap_pos_x);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopTextWrapPos;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopTextWrapPos;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushTabStop(v: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushTabStop(v);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopTabStop;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopTabStop;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushButtonRepeat(_repeat: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushButtonRepeat(_repeat);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopButtonRepeat;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopButtonRepeat;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SeparatorText(label_: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSeparatorText(PAnsiChar(label_));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Layout }
class procedure ImGui.Separator;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSeparator;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SameLine(pos_x: Single; spacing_w: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSameLine(pos_x, spacing_w);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.NewLine;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igNewLine;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.Spacing;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSpacing;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.Dummy(size: ImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igDummy(size);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.Indent(indent_w: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igIndent(indent_w);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.Unindent(indent_w: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igUnindent(indent_w);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.BeginGroup;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igBeginGroup;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndGroup;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndGroup;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetCursorPos: ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetCursorPos(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetCursorPosX: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetCursorPosX;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetCursorPosY: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetCursorPosY;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetCursorPos(local_pos: ImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetCursorPos(local_pos);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetCursorPosX(x: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetCursorPosX(x);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetCursorPosY(y: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetCursorPosY(y);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetCursorStartPos: ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetCursorStartPos(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetCursorScreenPos: ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetCursorScreenPos(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetCursorScreenPos(pos: ImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetCursorScreenPos(pos);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.igAlignTextToFramePadding;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igAlignTextToFramePadding;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetTextLineHeight: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetTextLineHeight;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetTextLineHeightWithSpacing: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetTextLineHeightWithSpacing;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetFrameHeight: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetFrameHeight;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetFrameHeightWithSpacing: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetFrameHeightWithSpacing;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Columns }
class procedure ImGui.Columns(Count: Longint; id: PAnsiChar; border: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igColumns(Count, id, border);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.NextColumn;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igNextColumn;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetColumnIndex: Longint;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetColumnIndex;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetColumnOffset(column_index: Longint): Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetColumnOffset(column_index);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetColumnOffset(column_index: Longint; offset_x: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetColumnOffset(column_index, offset_x);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetColumnWidth(column_index: Longint): Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetColumnWidth(column_index);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetColumnWidth(column_index: Longint; Width: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetColumnWidth(column_index, Width);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetColumnsCount: Longint;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetColumnsCount;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ ID scopes }
{ If you are creating widgets in a loop you most likely want to push a unique identifier so ImGui can differentiate them }
{ You can also use "##extra" within your widget name to distinguish them from each others (see 'Programmer Guide') }
class procedure ImGui.PushIdStr(str_id: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushID_Str(str_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushIdStrRange(str_begin: PAnsiChar; str_end: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushID_StrStr(str_begin, str_end);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushIdPtr(ptr_id: pointer);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushID_Ptr(ptr_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PushIdInt(int_id: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushID_Int(int_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopId;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopId;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetIdStr(str_id: PAnsiChar): ImGuiID;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetID_Str(str_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetIdStrRange(str_begin: PAnsiChar; str_end: PAnsiChar): ImGuiID;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetID_StrStr(str_begin, str_end);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetIdPtr(ptr_id: pointer): ImGuiID;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetID_Ptr(ptr_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Text }
class procedure ImGui.Text(const text_: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igText(PAnsiChar(text_), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.Text(const Fmt: AnsiString; const Args: array of const);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Text(Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TextColored(col: ImVec4; fmt: PAnsiChar; args: array of const);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  TextColored(col, Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TextColored(col: ImVec4; const fmt: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igTextColored(col, PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TextDisabled(const fmt: AnsiString; args: array of const);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  TextDisabled(Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TextDisabled(const fmt: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igTextDisabled(PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TextWrapped(const fmt: AnsiString; args: array of const);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  TextWrapped(Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TextWrapped(const fmt: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igTextWrapped(PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TextUnformatted(const _text: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igTextUnformatted(PAnsiChar(_text), nil);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TextUnformatted(const _text: PAnsiChar;
  const text_end: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igTextUnformatted(_text, text_end);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.LabelText(_label: AnsiString; fmt: PAnsiChar; args: array of const);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  LabelText(_label, Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.LabelText(_label: AnsiString; fmt: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igLabelText(PAnsiChar(_label), PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.Bullet;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igBullet;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.BulletText(const fmt: AnsiString; args: array of const);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  BulletText(Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.BulletText(const fmt: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igBulletText(PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Main }
class function ImGui.Button(_label: AnsiString; size: ImVec2): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igButton(PAnsiChar(_label), size);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.Button(_label: AnsiString): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := Button(_label, ImVec2.New(0, 0));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SmallButton(_label: PAnsiChar): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSmallButton(_label);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InvisibleButton(str_id: PAnsiChar; size: ImVec2; flags: ImGuiButtonFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInvisibleButton(str_id, size, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.Image(user_texture_id: ImTextureID; size: ImVec2; uv0: ImVec2; uv1: ImVec2; tint_col: ImVec4; border_col: ImVec4);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igImage(user_texture_id, size, uv0, uv1, tint_col, border_col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.ImageButton(str_id: PAnsiChar; user_texture_id: ImTextureID; size: ImVec2; uv0: ImVec2; uv1: ImVec2; bg_col: ImVec4; tint_col: ImVec4): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igImageButton(str_id, user_texture_id, size, uv0, uv1, bg_col, tint_col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.Checkbox(_label: PAnsiChar; v: PBoolean): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igCheckbox(_label, v);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.CheckboxFlags(_label: PAnsiChar; flags: PImU32; flags_value: Int32): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  { TODO: Do we need to implement other igCheckboxFlags funcs - Time : 11/3/2023 11:46:25 PM }
  Result := igCheckboxFlags_UintPtr(_label, flags, flags_value);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.RadioButtonBool(_label: PAnsiChar; active: Boolean): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igRadioButton_Bool(_label, active);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.RadioButton(_label: PAnsiChar; v: PInteger; v_button: Longint): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igRadioButton_IntPtr(_label, v, v_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PlotLines(_label: PAnsiChar; values: Psingle; values_count: Longint; values_offset: Longint; overlay_text: PAnsiChar; scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPlotLines_FloatPtr(_label, values, values_count, values_offset, overlay_text,
    scale_min, scale_max, graph_size, stride);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PlotHistogram(_label: PAnsiChar; values: Psingle; values_count: Longint; values_offset: Longint; overlay_text: PAnsiChar; scale_min: Single; scale_max: Single; graph_size: ImVec2; stride: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPlotHistogram_FloatPtr(_label, values, values_count, values_offset, overlay_text,
    scale_min, scale_max, graph_size, stride);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ProgressBar(fraction: Single; size_arg: ImVec2; overlay: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igProgressBar(fraction, size_arg, overlay);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginCombo(
  const _label, preview_value: AnsiString; flags: ImGuiComboFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginCombo(PAnsiChar(_label), PAnsiChar(preview_value), flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndCombo;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndCombo;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.Combo(_label: AnsiString; current_item: PInteger; items: PPAnsiChar; items_count: Longint; height_in_items: Longint): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igCombo_Str_arr(PAnsiChar(_label), current_item, items,
    items_count, height_in_items);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.Combo2(_label: AnsiString; current_item: PInteger; items_separated_by_zeros: PAnsiChar; height_in_items: Longint): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igCombo_Str(PAnsiChar(_label), current_item, items_separated_by_zeros,
    height_in_items);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.ColorButton(desc_id: PAnsiChar; col: ImVec4; flags: ImGuiColorEditFlags; size: ImVec2): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igColorButton(desc_id, col, flags, size);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.ColorEdit3(_label: PAnsiChar; col: PSingle; flags: ImGuiColorEditFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igColorEdit3(_label, col, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.ColorEdit4(_label: PAnsiChar; col: PSingle; flags: ImGuiColorEditFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igColorEdit4(_label, col, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.ColorPicker3(_label: PAnsiChar; col: PSingle; flags: ImGuiColorEditFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igColorPicker3(_label, col, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.ColorPicker4(_label: PAnsiChar; col: PSingle; flags: ImGuiColorEditFlags; ref_col: PSingle): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igColorPicker4(_label, col, flags, ref_col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetColorEditOptions(flags: ImGuiColorEditFlags);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetColorEditOptions(flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Sliders (tip: ctrl+click on a slider to input text) }
class function ImGui.SliderFloat(_label: PAnsiChar; v: Psingle; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  if display_format = nil then
    display_format := '%.3f';
  Result := igSliderFloat(_label, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SliderFloat2(_label: PAnsiChar; v: PSingle; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSliderFloat2(_label, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SliderFloat3(_label: PAnsiChar; v: PSingle; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSliderFloat3(_label, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SliderFloat4(_label: PAnsiChar; v: PSingle; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSliderFloat4(_label, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SliderAngle(_label: PAnsiChar; v_rad: Psingle; v_degrees_min: Single; v_degrees_max: Single; format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  if format = nil then
    format := '%.0f deg';
  Result := igSliderAngle(_label, v_rad, v_degrees_min, v_degrees_max, format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SliderInt(_label: PAnsiChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSliderInt(_label, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SliderInt2(_label: PAnsiChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSliderInt2(_label, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SliderInt3(_label: PAnsiChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSliderInt3(_label, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SliderInt4(_label: PAnsiChar; v: PInteger; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSliderInt4(_label, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.VSliderFloat(_label: PAnsiChar; size: ImVec2; v: Psingle; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igVSliderFloat(_label, size, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.VSliderInt(_label: PAnsiChar; size: ImVec2; v: PInteger; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igVSliderInt(_label, size, v, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Drags (tip: ctrl+click on a drag box to input text) }
// For all the Float2/Float3/Float4/Int2/Int3/Int4 versions of every functions, remember than a 'float v[3]' function argument is the same as 'float* v'. You can pass address of your first element out of a contiguous set, e.g. &myvector.x
{ If v_max >= v_max we have no bound }
class function ImGui.DragFloat(_label: PAnsiChar; v: Psingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragFloat(_label, v, v_speed, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.DragFloat2(_label: PAnsiChar; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragFloat2(_label, v, v_speed, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.DragFloat3(_label: PAnsiChar; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragFloat3(_label, v, v_speed, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.DragFloat4(_label: PAnsiChar; v: PSingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragFloat4(_label, v, v_speed, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.DragFloatRange2(_label: PAnsiChar; v_current_min: Psingle; v_current_max: Psingle; v_speed: Single; v_min: Single; v_max: Single; display_format: PAnsiChar; display_format_max: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragFloatRange2(_label, v_current_min, v_current_max,
    v_speed, v_min, v_max, display_format, display_format_max, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;
{ If v_max >= v_max we have no bound }
class function ImGui.DragInt(_label: PAnsiChar; v: PInteger; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragInt(_label, v, v_speed, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.DragInt2(_label: PAnsiChar; v: PInteger; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragInt2(_label, v, v_speed, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.DragInt3(_label: PAnsiChar; v: PInteger; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragInt3(_label, v, v_speed, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.DragInt4(_label: PAnsiChar; v: PInteger; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragInt4(_label, v, v_speed, v_min, v_max, display_format, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.DragIntRange2(_label: PAnsiChar; v_current_min: PInteger; v_current_max: PInteger; v_speed: Single; v_min: Longint; v_max: Longint; display_format: PAnsiChar; display_format_max: PAnsiChar; flags: ImGuiSliderFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igDragIntRange2(_label, v_current_min, v_current_max,
    v_speed, v_min, v_max, display_format, display_format_max, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Input }
class function ImGui.InputText(_label: PAnsiChar; buf: PAnsiChar; buf_size: size_t; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: pointer): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputText(_label, buf, buf_size, flags, callback, user_data);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputTextMultiline(_label: PAnsiChar; buf: PAnsiChar; buf_size: size_t; size: ImVec2; flags: ImGuiInputTextFlags; callback: ImGuiInputTextCallback; user_data: pointer): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputTextMultiline(_label, buf, buf_size, size, flags,
    callback, user_data);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputFloat(_label: PAnsiChar; v: Psingle; step: Single; step_fast: Single; format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputFloat(_label, v, step, step_fast, format, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputFloat2(_label: PAnsiChar; v: PSingle; format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputFloat2(_label, v, format, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputFloat3(_label: PAnsiChar; v: PSingle; format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputFloat3(_label, v, format, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputFloat4(_label: PAnsiChar; v: PSingle; format: PAnsiChar; extra_flags: ImGuiInputTextFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputFloat4(_label, v, format, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputInt(_label: PAnsiChar; v: PInteger; step: Longint; step_fast: Longint; extra_flags: ImGuiInputTextFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputInt(_label, v, step, step_fast, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputInt2(_label: PAnsiChar; v: PInteger; extra_flags: ImGuiInputTextFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputInt2(_label, v, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputInt3(_label: PAnsiChar; v: PInteger; extra_flags: ImGuiInputTextFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputInt3(_label, v, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.InputInt4(_label: PAnsiChar; v: PInteger; extra_flags: ImGuiInputTextFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igInputInt4(_label, v, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Trees }
class function ImGui.TreeNode(_label: AnsiString): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igTreeNode_Str(PAnsiChar(_label));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNode(str_id: AnsiString; fmt: AnsiString; args: array of const): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := TreeNode(str_id, Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNode(str_id: AnsiString; fmt: AnsiString): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igTreeNode_StrStr(PAnsiChar(str_id), PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNode(ptr_id: pointer; fmt: AnsiString; args: array of const): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := TreeNode(ptr_id, Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNode(ptr_id: pointer; fmt: AnsiString): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igTreeNode_Ptr(ptr_id, PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNodeEx(_label: PAnsiChar; flags: ImGuiTreeNodeFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igTreeNodeEx_Str(_label, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNodeEx(str_id: PAnsiChar; flags: ImGuiTreeNodeFlags; fmt: AnsiString; args: array of const): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := TreeNodeEx(str_id, flags, Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNodeEx(str_id: PAnsiChar; flags: ImGuiTreeNodeFlags; fmt: AnsiString): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igTreeNodeEx_StrStr(str_id, flags, PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags; fmt: AnsiString; args: array of const): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := TreeNodeEx(ptr_id, flags, Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.TreeNodeEx(ptr_id: pointer; flags: ImGuiTreeNodeFlags; fmt: AnsiString): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igTreeNodeEx_Ptr(ptr_id, flags, PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TreePushStr(str_id: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igTreePush_Str(str_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TreePushPtr(ptr_id: pointer);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igTreePush_Ptr(ptr_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.TreePop;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igTreePop;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

// ImGui.TreeAdvanceToLabelPos -> use ImGui::SetCursorPosX(ImGui::GetCursorPosX() + ImGui::GetTreeNodeToLabelSpacing());

class function ImGui.GetTreeNodeToLabelSpacing: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetTreeNodeToLabelSpacing;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextTreeNodeOpen(opened: Boolean; cond: ImGuiCond);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextItemOpen(opened, cond);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.CollapsingHeader(_label: PAnsiChar; flags: ImGuiTreeNodeFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igCollapsingHeader_TreeNodeFlags(_label, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.CollapsingHeader(_label: PAnsiChar; p_open: PBoolean; flags: ImGuiTreeNodeFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igCollapsingHeader_BoolPtr(_label, p_open, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Selectable / Lists }
class function ImGui.Selectable(_label: AnsiString; selected: Boolean; flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSelectable_Bool(PAnsiChar(_label), selected, flags, size);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.Selectable(_label: AnsiString; selected: Boolean; flags: ImGuiSelectableFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := Selectable(_label, selected, flags, ImVec2.New(0, 0));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.SelectableEx(_label: PAnsiChar; p_selected: PBoolean; flags: ImGuiSelectableFlags; size: ImVec2): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igSelectable_BoolPtr(_label, p_selected, flags, size);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.ListBox(_label: PAnsiChar; current_item: PInteger; items: PPAnsiChar; items_count: Longint; height_in_items: Longint): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igListBox_Str_arr(_label, current_item, items, items_count, height_in_items);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginListBox(_label: PAnsiChar; size: ImVec2): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginListBox(_label, size);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndListBox;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndListBox;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Value() Helpers. Output single value in "name: value" format (tip: freely declare your own within the ImGui namespace!) }
class procedure ImGui.ValueBool(prefix: PAnsiChar; b: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igValue_Bool(prefix, b);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ValueInt(prefix: PAnsiChar; v: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igValue_Int(prefix, v);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ValueUInt(prefix: PAnsiChar; v: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igValue_Uint(prefix, v);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ValueFloat(prefix: PAnsiChar; v: Single; float_format: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igValue_Float(prefix, v, float_format);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Tooltip }
class procedure ImGui.SetTooltip(fmt: AnsiString; args: array of const);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  SetTooltip(Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetTooltip(fmt: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetTooltip(PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.BeginTooltip;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igBeginTooltip;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndTooltip;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndTooltip;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Widgets: Menus }
class function ImGui.BeginMainMenuBar: Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginMainMenuBar;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndMainMenuBar;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndMainMenuBar;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginMenuBar: Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginMenuBar;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndMenuBar;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndMenuBar;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginMenu(_label: PAnsiChar; Enabled: Boolean): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginMenu(_label, Enabled);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndMenu;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndMenu;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.MenuItem(_label: PAnsiChar; shortcut: PAnsiChar; selected: Boolean; Enabled: Boolean): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igMenuItem_Bool(_label, shortcut, selected, Enabled);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.MenuItem(_label: PAnsiChar; shortcut: PAnsiChar; p_selected: PBoolean; Enabled: Boolean): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igMenuItem_BoolPtr(_label, shortcut, p_selected, Enabled);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Popup }
class procedure ImGui.OpenPopup(str_id: PAnsiChar; flags: ImGuiPopupFlags);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igOpenPopup_Str(str_id, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginPopup(str_id: PAnsiChar; flags: ImGuiWindowFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginPopup(str_id, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginPopupModal(Name: PAnsiChar; p_open: PBoolean; extra_flags: ImGuiWindowFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginPopupModal(Name, p_open, extra_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginPopupContextItem(str_id: PAnsiChar; mouse_button: ImGuiPopupFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginPopupContextItem(str_id, mouse_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginPopupContextWindow(str_id: PAnsiChar; mouse_button: ImGuiPopupFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginPopupContextWindow(str_id, mouse_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.BeginPopupContextVoid(str_id: PAnsiChar; mouse_button: ImGuiPopupFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igBeginPopupContextVoid(str_id, mouse_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.EndPopup;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igEndPopup;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsPopupOpen(str_id: PAnsiChar; flags: ImGuiPopupFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsPopupOpen_Str(str_id, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.CloseCurrentPopup;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igCloseCurrentPopup;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Logging: all text output from interface is redirected to tty/file/clipboard. Tree nodes are automatically opened. }
class procedure ImGui.LogToTTY(max_depth: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igLogToTTY(max_depth);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.LogToFile(max_depth: Longint; filename: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igLogToFile(max_depth, filename);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.LogToClipboard(max_depth: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igLogToClipboard(max_depth);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.LogFinish;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igLogFinish;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.LogButtons;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igLogButtons;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.LogText(const fmt: AnsiString; args: array of const);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  LogText(Format(fmt, args));
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.LogText(const fmt: AnsiString);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igLogText(PAnsiChar(fmt), []);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Clipping }
class procedure ImGui.PushClipRect(clip_rect_min: ImVec2; clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPushClipRect(clip_rect_min, clip_rect_max, intersect_with_current_clip_rect);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.PopClipRect;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igPopClipRect;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.StyleColorsClassic(dst: PImGuiStyle);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igStyleColorsClassic(dst);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.StyleColorsDark(dst: PImGuiStyle);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igStyleColorsDark(dst);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.StyleColorsLight(dst: PImGuiStyle);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igStyleColorsLight(dst);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetItemDefaultFocus;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetItemDefaultFocus;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetKeyboardFocusHere(offset: Integer);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetKeyboardFocusHere(offset);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Utilities }
class function ImGui.IsItemHovered(flags: ImGuiHoveredFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsItemHovered(flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsItemActive: Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsItemActive;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsItemClicked(mouse_button: ImGuiMouseButton): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsItemClicked(mouse_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsItemVisible: Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsItemVisible;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsAnyItemHovered: Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsAnyItemHovered;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsAnyItemActive: Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsAnyItemActive;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetItemRectMin() : ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetItemRectMin(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetItemRectMax() : ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetItemRectMax(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetItemRectSize() : ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetItemRectSize(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextItemAllowOverlap;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextItemAllowOverlap();
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsWindowFocused(flags: ImGuiFocusedFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsWindowFocused(flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsWindowHovered(flags: ImGuiHoveredFlags): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsWindowHovered(flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsRectVisible(const item_size: ImVec2): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsRectVisible_Nil(item_size);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsRectVisible(const rect_min, rect_max: ImVec2): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsRectVisible_Vec2(rect_min, rect_max);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetTime: Single;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetTime;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetFrameCount: Longint;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetFrameCount;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetStyleColorName(idx: ImGuiCol): PAnsiChar;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetStyleColorName(idx);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.CalcTextSize(_text: PAnsiChar; text_end: PAnsiChar; hide_text_after_double_hash: Boolean; wrap_width: Single): ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igCalcTextSize(@Result, _text, text_end, hide_text_after_double_hash, wrap_width);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ TODO: Add ImGuiListClipper - Time : 11/4/2023 12:42:03 AM }

class procedure ImGui.ColorConvertU32ToFloat4(pOut: PImVec4; in_: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igColorConvertU32ToFloat4(pOut, in_);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.ColorConvertFloat4ToU32(in_: ImVec4): ImU32;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igColorConvertFloat4ToU32(in_);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ColorConvertRGBtoHSV(r: Single; g: Single; b: Single; out_h: Psingle; out_s: Psingle; out_v: Psingle);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igColorConvertRGBtoHSV(r, g, b, out_h, out_s, out_v);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ColorConvertHSVtoRGB(h: Single; s: Single; v: Single; out_r: Psingle; out_g: Psingle; out_b: Psingle);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igColorConvertHSVtoRGB(h, s, v, out_r, out_g, out_b);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetKeyIndex(key: ImGuiKey): ImGuiKey;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetKeyIndex(key);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsKeyDown(user_key_index: ImGuiKey): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsKeyDown_Nil(user_key_index);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsKeyPressed(user_key_index: ImGuiKey; _repeat: Boolean): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsKeyPressed_Bool(user_key_index, _repeat);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsKeyReleased(user_key_index: ImGuiKey): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsKeyReleased_Nil(user_key_index);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsMouseDown(_button: ImGuiMouseButton): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsMouseDown_Nil(_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsMouseClicked(_button: ImGuiMouseButton; _repeat: Boolean): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsMouseClicked_Bool(_button, _repeat);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsMouseDoubleClicked(_button: ImGuiMouseButton): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsMouseDoubleClicked_Nil(_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsMouseDoubleClicked(_button : ImGuiMouseButton; owner_id : ImGuiID): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsMouseDoubleClicked_ID(_button, owner_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsMouseReleased(_button: ImGuiMouseButton): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsMouseReleased_Nil(_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsMouseHoveringRect(r_min: ImVec2; r_max: ImVec2; clip: Boolean): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsMouseHoveringRect(r_min, r_max, clip);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.IsMouseDragging(_button: ImGuiMouseButton; lock_threshold: Single): Boolean;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igIsMouseDragging(_button, lock_threshold);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetMousePos: ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetMousePos(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetMousePosOnOpeningCurrentPopup: ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetMousePosOnOpeningCurrentPopup(@Result);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetMouseDragDelta(_button: ImGuiMouseButton; lock_threshold: Single): ImVec2;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igGetMouseDragDelta(@Result, _button, lock_threshold);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.ResetMouseDragDelta(_button: ImGuiMouseButton);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igResetMouseDragDelta(_button);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetMouseCursor: ImGuiMouseCursor;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetMouseCursor;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetMouseCursor(_type: ImGuiMouseCursor);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetMouseCursor(_type);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextFrameWantCaptureKeyboard(capture: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextFrameWantCaptureKeyboard(capture);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetNextFrameWantCaptureMouse(capture: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetNextFrameWantCaptureMouse(capture);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Helpers functions to access functions pointers in ImGui::GetIO() }
class function ImGui.MemAlloc(sz: size_t): pointer;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igMemAlloc(sz);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.MemFree(ptr: pointer);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igMemFree(ptr);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class function ImGui.GetClipboardText: PAnsiChar;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetClipboardText;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

class procedure ImGui.SetClipboardText(_text: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  igSetClipboardText(_text);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Internal state access - if you want to share ImGui state between modules (e.g. DLL) or allocate it yourself }
class function ImGui.GetVersion: PAnsiChar;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := igGetVersion;
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ TImFontAtlasHelper }

function TImFontAtlasHelper.AddFontDefault: PImFont;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := ImFontAtlas_AddFontDefault(@Self,nil);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
end;

function TImFontAtlasHelper.AddFontFromFileTTF(filename : PAnsiChar; size_pixels : Single; font_cfg : PImFontConfig; glyph_ranges : PImWchar): PImFont;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  Result := ImFontAtlas_AddFontFromFileTTF(@Self,filename, size_pixels, font_cfg, glyph_ranges);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
end;

procedure TImFontAtlasHelper.GetTexDataAsAlpha8(out_pixels: PPImU8; out_width: PInteger; out_height: PInteger; out_bytes_per_pixel: PInteger);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImFontAtlas_GetTexDataAsAlpha8(@Self, out_pixels, out_width,
    out_height, out_bytes_per_pixel);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

procedure TImFontAtlasHelper.SetTexID(id: ImTextureID);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImFontAtlas_SetTexID(@Self, id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ TPImDrawListHelper }
//procedure TPImDrawListHelper.AddRectFilled(p_min: ImVec2; p_max: ImVec2; col: ImU32; rounding: Single; flags: ImDrawFlags);
//begin
//  ImDrawList_AddRectFilled(self, p_min, p_max, col, rounding, flags);
//end;


{ TImDrawListHelper }

Procedure TImDrawListHelper.PushClipRect(clip_rect_min: ImVec2;
  clip_rect_max: ImVec2; intersect_with_current_clip_rect: Boolean);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PushClipRect(@self, clip_rect_min, clip_rect_max,
    intersect_with_current_clip_rect);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PushClipRectFullScreen;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PushClipRectFullScreen(@self);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PopClipRect;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PopClipRect(@self);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PushTextureID(texture_id: ImTextureID);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PushTextureID(@self, texture_id);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PopTextureID;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PopTextureID(@self);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddLine(p1 : ImVec2; p2 : ImVec2; col : ImU32; thickness : Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddLine(@self, p1, p2, col, thickness);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddRect(a: ImVec2; b: ImVec2; col: ImU32;
  rounding: Single; rounding_corners_flags: ImDrawFlags; thickness: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddRect(@self, a, b, col, rounding, rounding_corners_flags, thickness);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddRectFilled(p_min: ImVec2; p_max: ImVec2;
  col: ImU32; rounding: Single; flags: ImDrawFlags);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddRectFilled(@self, p_min, p_max, col, rounding, flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddRectFilledMultiColor(a: ImVec2; b: ImVec2;
  col_upr_left: ImU32; col_upr_right: ImU32; col_bot_right: ImU32; col_bot_left: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddRectFilledMultiColor(@self, a, b, col_upr_left,
    col_upr_right, col_bot_right, col_bot_left);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddQuad(a: ImVec2; b: ImVec2; c: ImVec2;
  d: ImVec2; col: ImU32; thickness: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddQuad(@self, a, b, c, d, col, thickness);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddQuadFilled(a: ImVec2; b: ImVec2;
  c: ImVec2; d: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddQuadFilled(@self, a, b, c, d, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddTriangle(a: ImVec2; b: ImVec2; c: ImVec2;
  col: ImU32; thickness: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddTriangle(@self, a, b, c, col, thickness);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddTriangleFilled(a: ImVec2; b: ImVec2;
  c: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddTriangleFilled(@self, a, b, c, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddCircle(centre: ImVec2; radius: Single;
  col: ImU32; num_segments: Longint; thickness: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddCircle(@self, centre, radius, col, num_segments, thickness);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddCircleFilled(centre: ImVec2; radius: Single;
  col: ImU32; num_segments: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddCircleFilled(@self, centre, radius, col, num_segments);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddText(pos: ImVec2; col: ImU32;
  text_begin: PAnsiChar; text_end: PAnsiChar);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddText_Vec2(@self, pos, col, text_begin, text_end);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddTextExt(font: ImFont; font_size: Single;
  pos: ImVec2; col: ImU32; text_begin: PAnsiChar; text_end: PAnsiChar;
  wrap_width: Single; cpu_fine_clip_rect: ImVec4);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddText_FontPtr(@self, @font, font_size, pos, col, text_begin,
    text_end, wrap_width, @cpu_fine_clip_rect);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddImage(user_texture_id: ImTextureID;
  a: ImVec2; b: ImVec2; uva: ImVec2; uvb: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddImage(@self, user_texture_id, a, b, uva, uvb, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddImageQuad(user_texture_id: ImTextureID;
  Const a, b, c, d: ImVec2; Const uva, uvb, uvc, uvd: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddImageQuad(@self, user_texture_id, a, b, c, d, uva, uvb, uvc, uvd, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddPolyline(points: PImVec2; num_points: Integer;
  col: ImU32; flags: ImDrawFlags; thickness: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddPolyline(@self, points, num_points, col, flags, thickness);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddConvexPolyFilled(points: PImVec2;
  num_points: Integer; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddConvexPolyFilled(@self, points, num_points, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.AddBezierCubic(p1: ImVec2; p2: ImVec2;
  p3: ImVec2; p4: ImVec2; col: ImU32; thickness: Single; num_segments: Integer);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddBezierCubic(@self, p1, p2, p3, p4, col, thickness, num_segments);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Stateful path API, add points then finish with PathFill() or PathStroke() }
Procedure TImDrawListHelper.PathClear;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PathClear(@self);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PathLineTo(pos: ImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PathLineTo(@self, pos);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PathLineToMergeDuplicate(pos: ImVec2);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PathLineToMergeDuplicate(@self, pos);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PathFillConvex(col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PathFillConvex(@self, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PathStroke(col: ImU32; flags: ImDrawFlags;
  thickness: Single);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PathStroke(@self, col, flags, thickness);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PathArcTo(centre: ImVec2; radius: Single;
  a_min: Single; a_max: Single; num_segments: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PathArcTo(@self, centre, radius, a_min, a_max, num_segments);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;
{ Use precomputed angles for a 12 steps circle }
Procedure TImDrawListHelper.PathArcToFast(centre: ImVec2; radius: Single;
  a_min_of_12: Longint; a_max_of_12: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PathArcToFast(@self, centre, radius, a_min_of_12, a_max_of_12);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;
//procedure TImDrawListHelper.PathBezierCurveTo(p1: ImVec2; p2: ImVec2; p3: ImVec2; num_segments: longint);
//    begin ImDrawList_PathBezierCurveTo(@self, p1, p2, p3, num_segments) end;
Procedure TImDrawListHelper.PathRect(rect_min: ImVec2; rect_max: ImVec2;
  rounding: Single; rounding_corners_flags: ImDrawFlags);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PathRect(@self, rect_min, rect_max, rounding, rounding_corners_flags);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Channels }
Procedure TImDrawListHelper.ChannelsSplit(channels_count: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_ChannelsSplit(@self, channels_count);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.ChannelsMerge;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_ChannelsMerge(@self);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.ChannelsSetCurrent(channel_index: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_ChannelsSetCurrent(@self, channel_index);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Advanced }
{ Your rendering function must check for 'UserCallback' label_ ImDrawCmd and call the function instead of rendering triangles. }
Procedure TImDrawListHelper.AddCallback(callback: ImDrawCallback;
  callback_data: pointer);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddCallback(@self, callback, callback_data);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;
{ This is useful if you need to forcefully create a new draw call (to allow for dependent rendering / blending). Otherwise primitives are merged into the same draw-call as much as possible }
Procedure TImDrawListHelper.AddDrawCmd;
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_AddDrawCmd(@self);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

{ Internal helpers }
Procedure TImDrawListHelper.PrimReserve(idx_count: Longint; vtx_count: Longint);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PrimReserve(@self, idx_count, vtx_count);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PrimRect(a: ImVec2; b: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PrimRect(@self, a, b, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PrimRectUV(a: ImVec2; b: ImVec2; uv_a: ImVec2;
  uv_b: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PrimRectUV(@self, a, b, uv_a, uv_b, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PrimQuadUV(a: ImVec2; b: ImVec2; c: ImVec2;
  d: ImVec2; uv_a: ImVec2; uv_b: ImVec2; uv_c: ImVec2; uv_d: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PrimQuadUV(@self, a, b, c, d, uv_a, uv_b, uv_c, uv_d, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PrimWriteVtx(pos: ImVec2; uv: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PrimWriteVtx(@self, pos, uv, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PrimWriteIdx(idx: ImDrawIdx);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PrimWriteIdx(@self, idx);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;

Procedure TImDrawListHelper.PrimVtx(pos: ImVec2; uv: ImVec2; col: ImU32);
{$IFDEF FPC}
Var
  saved: Cardinal;
{$ENDIF}
Begin
  {$IFDEF FPC}saved := SetFpuFlags();{$ENDIF}
  ImDrawList_PrimVtx(@self, pos, uv, col);
  {$IFDEF FPC}ResetFpuFlags(saved);{$ENDIF}
End;



End.
