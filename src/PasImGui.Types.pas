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

Unit PasImGui.Types;

{$IfDef FPC}
  {$mode Delphi}{$H+}
  {$PACKRECORDS C}
  {$PackEnum 4}
  {$modeswitch advancedrecords}
{$EndIf}

Interface

Uses
  PasImGui.Enums;

Const
  FLT_MAX : Single = 3.40282347e+038; // This is the same as in compiled cimgui

// Main Types
Type
  T30Bits = 0..1073741823;
  T4Bits = 0..15;
  T3Bits = 0..7;
  T2Bits = 0..3;
  T1Bit = 0..1;

  size_t = NativeUInt;
  ImS8 = Shortint;
  ImU8 = Byte;
  ImS16 = Smallint;
  ImU16 = Word;
  ImS32 = Longint;
  ImU32 = Cardinal;
  ImS64 = Int64;
  ImU64 = QWord;
  ImWchar16 = Word;
  ImWchar32 = Cardinal;
  ImWchar = ImWchar16;

  ImTextureID = Pointer;
  PImGuiKeyChord = ^ImGuiKeyChord;
  PImTextureID = ^ImTextureID;
  PImDrawIdx = ^ImDrawIdx;
  PImGuiID = ^ImGuiID;
  PImS8 = ^ImS8;
  PImU8 = ^ImU8;
  PImS16 = ^ImS16;
  PImU16 = ^ImU16;
  PImS32 = ^ImS32;
  PImU32 = ^ImU32;
  PImS64 = ^ImS64;
  PImU64 = ^ImU64;

  PPImS8  = ^PImS8;
  PPImU8  = ^PImU8;
  PPImS16 = ^PImS16;
  PPImU16 = ^PImU16;
  PPImS32 = ^PImS32;
  PPImU32 = ^PImU32;
  PPImS64 = ^PImS64;
  PPImU64 = ^PImU64;

  PSize_t = ^SIZE_T;
  PImWchar16 = ^ImWchar16;
  PImWchar32 = ^ImWchar32;
  PImWchar = ^ImWchar;


  PImGuiTableColumnIdx = ^ImGuiTableColumnIdx;
  PImGuiTableDrawChannelIdx = ^ImGuiTableDrawChannelIdx;

  PImGuiItemFlags = ^ImGuiItemFlags;

  PImRect = ^ImRect;
  ImPoolIdx = Integer;
  PImGuiWindowTempData = ^ImGuiWindowTempData;
  PImGuiWindowStackData = ^ImGuiWindowStackData;
  PImGuiWindowSettings = ^ImGuiWindowSettings;
  PImGuiWindowDockStyle = ^ImGuiWindowDockStyle;
  PImGuiWindowClass = ^ImGuiWindowClass;
  PImGuiWindow = ^ImGuiWindow;
  PPImGuiWindow = ^PImGuiWindow;
  PImGuiViewportP = ^ImGuiViewportP;
  PImGuiViewport = ^ImGuiViewport;
  PPImGuiViewport = ^PImGuiViewport;

  PImGuiTypingSelectState = ^ImGuiTypingSelectState;
  PImGuiTypingSelectRequest = ^ImGuiTypingSelectRequest;
  PImGuiTextRange = ^ImGuiTextRange;
  PImGuiTextIndex = ^ImGuiTextIndex;
  PImGuiTextFilter = ^ImGuiTextFilter;
  PImGuiTextBuffer = ^ImGuiTextBuffer;
  PImGuiTableTempData = ^ImGuiTableTempData;
  PImGuiTableSortSpecs = ^ImGuiTableSortSpecs;
  PImGuiTableSettings = ^ImGuiTableSettings;
  PImGuiTableInstanceData = ^ImGuiTableInstanceData;
  ImGuiTableDrawChannelIdx = ImU16;
  PImGuiTableColumnSortSpecs = ^ImGuiTableColumnSortSpecs;
  PImGuiTableColumnSettings = ^ImGuiTableColumnSettings;
  ImGuiTableColumnIdx = ImS16;
  PImGuiTableColumn = ^ImGuiTableColumn;
  PImGuiTableCellData = ^ImGuiTableCellData;
  PImGuiTable = ^ImGuiTable;
  PImGuiTabItem = ^ImGuiTabItem;
  PImGuiTabBar = ^ImGuiTabBar;
  PImGuiStyleMod = ^ImGuiStyleMod;
  PImGuiStyle = ^ImGuiStyle;
  PImGuiStoragePair = ^ImGuiStoragePair;
  PImGuiStorage = ^ImGuiStorage;
  PImGuiStackSizes = ^ImGuiStackSizes;
  PImGuiStackLevelInfo = ^ImGuiStackLevelInfo;
  PImGuiSizeCallbackData = ^ImGuiSizeCallbackData;
  ImGuiSizeCallback = procedure(data : PImGuiSizeCallbackData); Cdecl;
  PImGuiShrinkWidthItem = ^ImGuiShrinkWidthItem;
  PImGuiSettingsHandler = ^ImGuiSettingsHandler;
  ImGuiSelectionUserData = ImS64;
  PImGuiPtrOrIndex = ^ImGuiPtrOrIndex;
  PImGuiPopupData = ^ImGuiPopupData;
  PImGuiPlatformMonitor = ^ImGuiPlatformMonitor;
  PPImGuiPlatformMonitor = ^PImGuiPlatformMonitor;
  PImGuiPlatformImeData = ^ImGuiPlatformImeData;
  PImGuiPlatformIO = ^ImGuiPlatformIO;
  PImGuiPayload = ^ImGuiPayload;
  PImGuiOnceUponAFrame = ^ImGuiOnceUponAFrame;
  PImGuiOldColumns = ^ImGuiOldColumns;
  PImGuiOldColumnData = ^ImGuiOldColumnData;
  PImGuiNextWindowData = ^ImGuiNextWindowData;
  PImGuiNextItemData = ^ImGuiNextItemData;
  PImGuiNavTreeNodeData = ^ImGuiNavTreeNodeData;
  PImGuiNavItemData = ^ImGuiNavItemData;
  PImGuiMetricsConfig = ^ImGuiMetricsConfig;
  PImGuiMenuColumns = ^ImGuiMenuColumns;
  PImGuiMemFreeFunc = ^ImGuiMemFreeFunc;
  ImGuiMemFreeFunc = procedure(ptr : Pointer; user_data : Pointer); Cdecl;
  PImGuiMemAllocFunc = ^ImGuiMemAllocFunc;
  ImGuiMemAllocFunc = function(sz : size_t; user_data : Pointer) : Pointer; Cdecl;
  PImGuiLocEntry = ^ImGuiLocEntry;
  PImGuiListClipperRange = ^ImGuiListClipperRange;
  PImGuiListClipperData = ^ImGuiListClipperData;
  PImGuiListClipper = ^ImGuiListClipper;
  ImGuiLayoutType = Integer;
  PImGuiLastItemData = ^ImGuiLastItemData;
  PImGuiKeyRoutingTable = ^ImGuiKeyRoutingTable;
  ImGuiKeyRoutingIndex = ImS16;
  PImGuiKeyRoutingData = ^ImGuiKeyRoutingData;
  PImGuiKeyOwnerData = ^ImGuiKeyOwnerData;
  PImGuiKeyData = ^ImGuiKeyData;
  ImGuiKeyChord = Integer;
  PImGuiInputTextState = ^ImGuiInputTextState;
  PImGuiInputTextDeactivatedState = ^ImGuiInputTextDeactivatedState;
  PImGuiInputTextCallbackData = ^ImGuiInputTextCallbackData;
  ImGuiInputTextCallback = function(data : PImGuiInputTextCallbackData) : Integer; Cdecl;
  PImGuiInputEventText = ^ImGuiInputEventText;
  PImGuiInputEventMouseWheel = ^ImGuiInputEventMouseWheel;
  PImGuiInputEventMouseViewport = ^ImGuiInputEventMouseViewport;
  PImGuiInputEventMousePos = ^ImGuiInputEventMousePos;
  PImGuiInputEventMouseButton = ^ImGuiInputEventMouseButton;
  PImGuiInputEventKey = ^ImGuiInputEventKey;
  PImGuiInputEventAppFocused = ^ImGuiInputEventAppFocused;
  PImGuiInputEvent = ^ImGuiInputEvent;
  PImGuiIO = ^ImGuiIO;
  PImGuiIDStackTool = ^ImGuiIDStackTool;
  ImGuiID = ImU32;
  PImGuiGroupData = ^ImGuiGroupData;
  ImGuiErrorLogCallback = procedure(user_data : Pointer; fmt : PChar; args : array of const); Cdecl;
  PImGuiDockRequest = ^ImGuiDockRequest;
  PImGuiDockNodeSettings = ^ImGuiDockNodeSettings;
  PImGuiDockNode = ^ImGuiDockNode;
  PImGuiDockContext = ^ImGuiDockContext;
  ImGuiDir = Integer;
  PImGuiDebugAllocInfo = ^ImGuiDebugAllocInfo;
  PImGuiDebugAllocEntry = ^ImGuiDebugAllocEntry;
  PImGuiDataVarInfo = ^ImGuiDataVarInfo;
  PImGuiDataTypeInfo = ^ImGuiDataTypeInfo;
  ImGuiDataType = Byte;
  ImGuiDataAuthority = Integer;
  PImGuiContextHook = ^ImGuiContextHook;
  PImGuiContext = ^ImGuiContext;
  ImGuiContextHookCallback = procedure(ctx : PImGuiContext; hook : PImGuiContextHook); Cdecl;
  PImGuiComboPreviewData = ^ImGuiComboPreviewData;
  PImGuiColorMod = ^ImGuiColorMod;
  PImFontGlyphRangesBuilder = ^ImFontGlyphRangesBuilder;
  PImFontGlyph = ^ImFontGlyph;
  PImFontConfig = ^ImFontConfig;
  PImFontBuilderIO = ^ImFontBuilderIO;
  PImFontAtlasCustomRect = ^ImFontAtlasCustomRect;
  PImFontAtlas = ^ImFontAtlas;
  PImFont = ^ImFont;
  ImFileHandle = ^FILE;
  PImDrawVert = ^ImDrawVert;
  PImDrawListSplitter = ^ImDrawListSplitter;
  PImDrawListSharedData = ^ImDrawListSharedData;
  PImDrawList = ^ImDrawList;
  ImDrawIdx = ImU16;
  PImDrawDataBuilder = ^ImDrawDataBuilder;
  PImDrawData = ^ImDrawData;
  PImDrawCmdHeader = ^ImDrawCmdHeader;
  PImDrawCmd = ^ImDrawCmd;
  PImDrawChannel = ^ImDrawChannel;
  ImDrawCallback = procedure(parent_list : PImDrawList; cmd : PImDrawCmd); Cdecl;
  PImColor = ^ImColor;
  PImBitVector = ^ImBitVector;
  ImBitArrayPtr = PImU32;

  // Extras
  PImVector_ImWchar = ^ImVector_ImWchar;
  PImVector_ImGuiTextRange = ^ImVector_ImGuiTextRange;
  PImVector_ImGuiWindowPtr = ^ImVector_ImGuiWindowPtr;
  PImVector_const_charPtr = ^ImVector_const_charPtr;

  // Enum Ptrs
  PImGuiDir = ^ImGuiDir;

  ImGuiComboItemGetterCallback = Function(Data: Pointer; idx: Integer;
    out_text: PPAnsiChar): Boolean; Cdecl;

  TCompareFunc = function(const A, B: Pointer): Integer;

  // New CallBacks
  TImGuiComboItemsGetterFunc = function(user_data: Pointer; idx: Integer): PAnsiChar; cdecl;
  TImGuiPlotValuesGetterFunc = function(data: Pointer; idx: Integer): Single; cdecl;
  ImGuiTypingSelectFunc = function(data: Pointer; idx: Integer): PAnsiChar; cdecl;

  ImGuiLocEntry = record
    Key: ImGuiLocKey;
    Text: PAnsiChar;
  end;

  ImGuiDataTypeInfo = Record
    Size: size_t;
    Name: Pansichar;
    PrintFmt: Pansichar;
    ScanFmt: Pansichar;
  End;

  ImVector_ImU32 = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImU32;
  End;
  PImVector_ImU32 = ^ImVector_ImU32;

  ImFontGlyphRangesBuilder = Record
    UsedChars: ImVector_ImU32;
  End;

  ImBitVector = Record
    Storage: ImVector_ImU32;
  End;

  ImVector_char = Record
    Size: Integer;
    Capacity: Integer;
    Data: PAnsiChar;
  End;

  ImGuiTextBuffer = Record
    Buf: ImVector_char;
  End;

  ImVector_ImGuiPlatformMonitor = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPlatformMonitor;
  End;

  ImVector_ImGuiViewportPtr = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiViewport;
  End;

  ImVector_const_charPtr = Record
    Size: Integer;
    Capacity: Integer;
    Data: PAnsiChar;
  End;

  ImVec1 = Record
    x: Single;
  End;
  PImVec1 = ^ImVec1;

  ImVec2ih = Record
    x: Smallint;
    y: Smallint;
  End;
  PImVec2ih = ^ImVec2ih;

  { ImVec2 }
  ImVec2 = Record
    x, y: Single;
    constructor New(const _x, _y: Single);
  End;
  PImVec2 = ^ImVec2;

  { ImVec3 }
  ImVec3 = record
    x, y, z: single;
    constructor New(const _x, _y, _z : Single);
  end;
  PImVec3 = ^ImVec3;

  { ImVec4 }
  ImVec4 = Record
    x, y, z, w: Single;
    constructor New(const _x, _y, _z, _w: Single);
  End;
  PImVec4 = ^ImVec4;

  ImRect = Record
    Min: ImVec2;
    Max: ImVec2;
  End;

  ImGuiDebugAllocEntry = record
    FrameCount: Integer;
    AllocCount: ImS16;
    FreeCount: ImS16;
  end;

  ImGuiDebugAllocInfo = record
    TotalAllocCount: Integer;
    TotalFreeCount: Integer;
    LastEntriesIdx: ImS16;
    LastEntriesBuf: array [0..5] of ImGuiDebugAllocEntry;
  end;

  ImGuiNextItemData = Record
    Flags : ImGuiNextItemDataFlags;
    ItemFlags : ImGuiItemFlags;
    Width : Single;
    SelectionUserData : ImGuiSelectionUserData;
    OpenCond : ImGuiCond;
    OpenVal : Boolean;
  End;

  ImGuiTypingSelectRequest = record
    Flags: ImGuiTypingSelectFlags;
    SearchBufferLen: Integer;
    SearchBuffer: PAnsiChar;
    SelectRequest: Boolean;
    SingleCharMode: Boolean;
    SingleCharSize: ImS8;
  end;

  ImGuiTypingSelectState = record
    Request: ImGuiTypingSelectRequest;
    SearchBuffer: array [0..63] of AnsiChar;
    FocusScope: ImGuiID;
    LastRequestFrame: Integer;
    LastRequestTime: Single;
    SingleCharModeLock: Boolean;
  end;

  ImGuiInputTextCallbackData = Record
    Ctx: PImGuiContext;
    EventFlag: ImGuiInputTextFlags;
    Flags: ImGuiInputTextFlags;
    UserData: Pointer;
    EventChar: ImWchar;
    EventKey: ImGuiKey;
    Buf: Pansichar;
    BufTextLen: Integer;
    BufSize: Integer;
    BufDirty: Boolean;
    CursorPos: Integer;
    SelectionStart: Integer;
    SelectionEnd: Integer;
  End;

  ImGuiSizeCallbackData = Record
    UserData: Pointer;
    Pos: ImVec2;
    CurrentSize: ImVec2;
    DesiredSize: ImVec2;
  End;

  ImGuiWindowClass = Record
    ClassId: ImGuiID;
    ParentViewportId: ImGuiID;
    ViewportFlagsOverrideSet: ImGuiViewportFlags;
    ViewportFlagsOverrideClear: ImGuiViewportFlags;
    TabItemFlagsOverrideSet: ImGuiTabItemFlags;
    DockNodeFlagsOverrideSet: ImGuiDockNodeFlags;
    DockingAlwaysTabBar: Boolean;
    DockingAllowUnclassed: Boolean;
  End;

  ImGuiPayload = Record
    Data: Pointer;
    DataSize: Integer;
    SourceId: ImGuiID;
    SourceParentId: ImGuiID;
    DataFrameCount: Integer;
    DataType: Array [0..32] Of Char;
    Preview: Boolean;
    Delivery: Boolean;
  End;

  ImGuiOnceUponAFrame = Record
    RefFrame: Integer;
  End;

  ImGuiTextRange = Record
    b: Pansichar;
    e: Pansichar;
  End;

  ImVector_ImGuiTextRange = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTextRange;
  End;

  ImGuiTextFilter = Record
    InputBuf: Array [0..255] Of Ansichar;
    Filters: ImVector_ImGuiTextRange;
    CountGrep: Integer;
  End;

  ImGuiLastItemData = Record
    ID: ImGuiID;
    InFlags: ImGuiItemFlags;
    StatusFlags: ImGuiItemStatusFlags;
    Rect: ImRect;
    NavRect: ImRect;
    DisplayRect: ImRect;
  End;

  ImGuiNextWindowData = Record
    Flags: ImGuiNextWindowDataFlags;
    PosCond: ImGuiCond;
    SizeCond: ImGuiCond;
    CollapsedCond: ImGuiCond;
    DockCond: ImGuiCond;
    PosVal: ImVec2;
    PosPivotVal: ImVec2;
    SizeVal: ImVec2;
    ContentSizeVal: ImVec2;
    ScrollVal: ImVec2;
    ChildFlags: ImGuiChildFlags;
    PosUndock: Boolean;
    CollapsedVal: Boolean;
    SizeConstraintRect: ImRect;
    SizeCallback: ImGuiSizeCallback;
    SizeCallbackUserData: Pointer;
    BgAlphaVal: Single;
    ViewportId: ImGuiID;
    DockId: ImGuiID;
    WindowClass: ImGuiWindowClass;
    MenuBarOffsetMinVal: ImVec2;
  End;

  ImGuiStackSizes = Record
    SizeOfIDStack: Shortint;
    SizeOfColorStack: Shortint;
    SizeOfStyleVarStack: Shortint;
    SizeOfFontStack: Shortint;
    SizeOfFocusScopeStack: Shortint;
    SizeOfGroupStack: Shortint;
    SizeOfItemFlagsStack: Shortint;
    SizeOfBeginPopupStack: Shortint;
    SizeOfDisabledStack: Shortint;
  End;


  ImGuiWindowStackData = Record
    Window: PImGuiWindow;
    ParentLastItemDataBackup: ImGuiLastItemData;
    StackSizesOnBegin: ImGuiStackSizes;
  End;

  ImVector_ImGuiWindowStackData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiWindowStackData;
  End;

  ImVector_ImGuiInputEvent = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiInputEvent;
  End;
  PImVector = ^ImVector;

  ImVector = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiWindowStackData;
  End;

  ImGuiColorMod = Record
    Col: ImGuiCol;
    BackupValue: ImVec4;
  End;

  ImVector_ImGuiColorMod = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiColorMod;
  End;

  ImGuiStyleMod = Record
    VarIdx: ImGuiStyleVar;
    Case Integer Of
      0: (BackupInt: Array[0..1] Of Integer);
      1: (BackupFloat: Array[0..1] Of Single);
  End;

  ImGuiGroupData = Record
    WindowID: ImGuiID;
    BackupCursorPos: ImVec2;
    BackupCursorMaxPos: ImVec2;
    BackupIndent: ImVec1;
    BackupGroupOffset: ImVec1;
    BackupCurrLineSize: ImVec2;
    BackupCurrLineTextBaseOffset: Single;
    BackupActiveIdIsAlive: ImGuiID;
    BackupActiveIdPreviousFrameIsAlive: Boolean;
    BackupHoveredIdIsAlive: Boolean;
    EmitItem: Boolean;
  End;

  ImGuiPopupData = Record
    PopupId: ImGuiID;
    Window: PImGuiWindow;
    BackupNavWindow: PImGuiWindow;
    ParentNavLayer: Integer;
    OpenFrameCount: Integer;
    OpenParentId: ImGuiID;
    OpenPopupPos: ImVec2;
    OpenMousePos: ImVec2;
  End;


  ImGuiNavTreeNodeData = Record
    ID: ImGuiID;
    InFlags: ImGuiItemFlags;
    NavRect: ImRect;
  End;

  ImVector_ImGuiStyleMod = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStyleMod;
  End;
  PImVector_ImGuiStyleMod = ^ImVector_ImGuiStyleMod;

  ImVector_ImGuiID = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiID;
  End;
  PImVector_ImGuiID = ^ImVector_ImGuiID;

  ImVector_ImGuiItemFlags = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiItemFlags;
  End;
  PImVector_ImGuiItemFlags = ^ImVector_ImGuiItemFlags;

  ImVector_ImGuiGroupData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiGroupData;
  End;
  PImVector_ImGuiGroupData = ^ImVector_ImGuiGroupData;

  ImVector_ImGuiPopupData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPopupData;
  End;
  PImVector_ImGuiPopupData = ^ImVector_ImGuiPopupData;

  ImVector_ImGuiNavTreeNodeData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiNavTreeNodeData;
  End;
  PImVector_ImGuiNavTreeNodeData = ^ImVector_ImGuiNavTreeNodeData;

  ImVector_ImGuiViewportPPtr = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiViewportP;
  End;
  PImVector_ImGuiViewportPPtr = ^ImVector_ImGuiViewportPPtr;

  ImVector_unsigned_char = Record
    Size: Integer;
    Capacity: Integer;
    Data: Pbyte;
  End;
  PImVector_unsigned_char = ^ImVector_unsigned_char;

  ImGuiListClipperRange = Record
    Min: Integer;
    Max: Integer;
    PosToIndexConvert: Boolean;
    PosToIndexOffsetMin: ImS8;
    PosToIndexOffsetMax: ImS8;
  End;

  ImVector_ImGuiListClipperRange = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiListClipperRange;
  End;
  PImVector_ImGuiListClipperRange = ^ImVector_ImGuiListClipperRange;


  ImGuiStoragePair = Record
    key: ImGuiID;
    Case Integer Of
      0: (val_i: Integer);
      1: (val_f: Single);
      2: (val_p: Pointer);
  End;


  ImVector_ImGuiStoragePair = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStoragePair;
  End;

  ImGuiStorage = Record
    Data: ImVector_ImGuiStoragePair;
  End;

  ImGuiListClipper = Record
    Ctx: PImGuiContext;
    DisplayStart: Integer;
    DisplayEnd: Integer;
    ItemsCount: Integer;
    ItemsHeight: Single;
    StartPosY: Single;
    TempData: Pointer;
  End;


  ImColor = Record
    Value: ImVec4;
  End;

  ImGuiListClipperData = Record
    ListClipper: PImGuiListClipper;
    LossynessOffset: Single;
    StepNo: Integer;
    ItemsFrozen: Integer;
    Ranges: ImVector_ImGuiListClipperRange;
  End;

  ImVector_ImGuiListClipperData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiListClipperData;
  End;

  ImDrawCmd = Record
    ClipRect: ImVec4;
    TextureId: ImTextureID;
    VtxOffset: Cardinal;
    IdxOffset: Cardinal;
    ElemCount: Cardinal;
    UserCallback: ImDrawCallback;
    UserCallbackData: Pointer;
  End;


  ImDrawVert = Record
    pos: ImVec2;
    uv: ImVec2;
    col: ImU32;
  End;

  ImDrawCmdHeader = Record
    ClipRect: ImVec4;
    TextureId: ImTextureID;
    VtxOffset: Cardinal;
  End;

  ImVector_ImDrawCmd = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawCmd;
  End;

  ImVector_ImDrawIdx = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawIdx;
  End;

  ImDrawChannel = Record
    _CmdBuffer: ImVector_ImDrawCmd;
    _IdxBuffer: ImVector_ImDrawIdx;
  End;

  ImVector_ImDrawChannel = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawChannel;
  End;

  ImDrawListSplitter = Record
    _Current: Integer;
    _Count: Integer;
    _Channels: ImVector_ImDrawChannel;
  End;


  ImGuiDataVarInfo = Record
    Type_: ImGuiDataType;
    Count: ImU32;
    Offset: ImU32;
  End;

  ImGuiWindowDockStyle = Record
    Colors: Array[0..ImGuiWindowDockStyleCol_COUNT - 1] Of ImU32;
  End;

  ImVector_ImGuiDockRequest = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiDockRequest;
  End;
  PImVector_ImGuiDockRequest = ^ImVector_ImGuiDockRequest;

  ImVector_ImGuiDockNodeSettings = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiDockNodeSettings;
  End;
  PImVector_ImGuiDockNodeSettings = ^ImVector_ImGuiDockNodeSettings;

  ImGuiDockContext = Record
    Nodes: ImGuiStorage;
    Requests: ImVector_ImGuiDockRequest;
    NodesSettings: ImVector_ImGuiDockNodeSettings;
    WantFullRebuild: Boolean;
  End;

  ImGuiTableColumnSettings = Bitpacked Record
    WidthOrWeight: Single;
    UserID: ImGuiID;
    Index: ImGuiTableColumnIdx;
    DisplayOrder: ImGuiTableColumnIdx;
    SortOrder: ImGuiTableColumnIdx;
    SortDirection: T2Bits; // Use 2 bits for the SortDirection
    IsEnabled: T1Bit; // Use 1 bit for IsEnabled
    IsStretch: T1Bit; // Use 1 bit for IsStretch
  End;

  ImGuiTableTempData = Record
    TableIndex: Integer;
    LastTimeActive: Single;
    UserOuterSize: ImVec2;
    DrawSplitter: ImDrawListSplitter;
    HostBackupWorkRect: ImRect;
    HostBackupParentWorkRect: ImRect;
    HostBackupPrevLineSize: ImVec2;
    HostBackupCurrLineSize: ImVec2;
    HostBackupCursorMaxPos: ImVec2;
    HostBackupColumnsOffset: ImVec1;
    HostBackupItemWidth: Single;
    HostBackupItemWidthStackSize: Integer;
  End;


  ImGuiTabItem = Record
    ID: ImGuiID;
    Flags: ImGuiTabItemFlags;
    Window: PImGuiWindow;
    LastFrameVisible: Integer;
    LastFrameSelected: Integer;
    Offset: Single;
    Width: Single;
    ContentWidth: Single;
    RequestedWidth: Single;
    NameOffset: ImS32;
    BeginOrder: ImS16;
    IndexDuringLayout: ImS16;
    WantClose: Boolean;
  End;

  ImVector_ImGuiTabItem = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTabItem;
  End;

  ImGuiTabBar = Record
    Tabs: ImVector_ImGuiTabItem;
    Flags: ImGuiTabBarFlags;
    ID: ImGuiID;
    SelectedTabId: ImGuiID;
    NextSelectedTabId: ImGuiID;
    VisibleTabId: ImGuiID;
    CurrFrameVisible: Integer;
    PrevFrameVisible: Integer;
    BarRect: ImRect;
    CurrTabsContentsHeight: Single;
    PrevTabsContentsHeight: Single;
    WidthAllTabs: Single;
    WidthAllTabsIdeal: Single;
    ScrollingAnim: Single;
    ScrollingTarget: Single;
    ScrollingTargetDistToVisibility: Single;
    ScrollingSpeed: Single;
    ScrollingRectMinX: Single;
    ScrollingRectMaxX: Single;
    ReorderRequestTabId: ImGuiID;
    ReorderRequestOffset: ImS16;
    BeginCount: ImS8;
    WantLayout: Boolean;
    VisibleTabWasSubmitted: Boolean;
    TabsAddedNew: Boolean;
    TabsActiveCount: ImS16;
    LastTabItemIdx: ImS16;
    ItemSpacingY: Single;
    FramePadding: ImVec2;
    BackupCursorPos: ImVec2;
    TabsNames: ImGuiTextBuffer;
  End;

  ImGuiTableColumn = bitpacked Record
    Flags: ImGuiTableColumnFlags;
    WidthGiven: Single;
    MinX: Single;
    MaxX: Single;
    WidthRequest: Single;
    WidthAuto: Single;
    StretchWeight: Single;
    InitStretchWeightOrWidth: Single;
    ClipRect: ImRect;
    UserID: ImGuiID;
    WorkMinX: Single;
    WorkMaxX: Single;
    ItemWidth: Single;
    ContentMaxXFrozen: Single;
    ContentMaxXUnfrozen: Single;
    ContentMaxXHeadersUsed: Single;
    ContentMaxXHeadersIdeal: Single;
    NameOffset: ImS16;
    DisplayOrder: ImGuiTableColumnIdx;
    IndexWithinEnabledSet: ImGuiTableColumnIdx;
    PrevEnabledColumn: ImGuiTableColumnIdx;
    NextEnabledColumn: ImGuiTableColumnIdx;
    SortOrder: ImGuiTableColumnIdx;
    DrawChannelCurrent: ImGuiTableDrawChannelIdx;
    DrawChannelFrozen: ImGuiTableDrawChannelIdx;
    DrawChannelUnfrozen: ImGuiTableDrawChannelIdx;
    IsEnabled: Boolean;
    IsUserEnabled: Boolean;
    IsUserEnabledNextFrame: Boolean;
    IsVisibleX: Boolean;
    IsVisibleY: Boolean;
    IsRequestOutput: Boolean;
    IsSkipItems: Boolean;
    IsPreserveWidthAuto: Boolean;
    NavLayerCurrent: ImS8;
    AutoFitQueue: ImU8;
    CannotSkipItemsQueue: ImU8;
    SortDirection: T2Bits;
    SortDirectionsAvailCount: T2Bits;
    SortDirectionsAvailMask: T4Bits;
    SortDirectionsAvailList: ImU8;
  End;


  ImGuiTableCellData = Record
    BgColor: ImU32;
    Column: ImGuiTableColumnIdx;
  End;


  ImGuiTableInstanceData = Record
    TableInstanceID: ImGuiID;
    LastOuterHeight: Single;
    LastFirstRowHeight: Single;
    LastFrozenHeight: Single;
    HoveredRowLast: Integer;
    HoveredRowNext: Integer;
  End;


  ImSpan_ImGuiTableColumn = Record
    Data: PImGuiTableColumn;
    DataEnd: PImGuiTableColumn;
  End;


  ImSpan_ImGuiTableColumnIdx = Record
    Data: PImGuiTableColumnIdx;
    DataEnd: PImGuiTableColumnIdx;
  End;


  ImSpan_ImGuiTableCellData = Record
    Data: PImGuiTableCellData;
    DataEnd: PImGuiTableCellData;
  End;


  ImVector_ImGuiTableInstanceData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableInstanceData;
  End;


  ImVector_ImGuiTableColumnSortSpecs = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableColumnSortSpecs;
  End;


  ImGuiTableColumnSortSpecs = Record
    ColumnUserID: ImGuiID;
    ColumnIndex: ImS16;
    SortOrder: ImS16;
    SortDirection: ImGuiSortDirection;
  End;

  ImGuiTableSortSpecs = Record
    Specs: PImGuiTableColumnSortSpecs;
    SpecsCount: Integer;
    SpecsDirty: Boolean;
  End;

  ImGuiTable = Record
    ID: ImGuiID;
    Flags: ImGuiTableFlags;
    RawData: Pointer;
    TempData: PImGuiTableTempData;
    Columns: ImSpan_ImGuiTableColumn;
    DisplayOrderToIndex: ImSpan_ImGuiTableColumnIdx;
    RowCellData: ImSpan_ImGuiTableCellData;
    EnabledMaskByDisplayOrder: ImBitArrayPtr;
    EnabledMaskByIndex: ImBitArrayPtr;
    VisibleMaskByIndex: ImBitArrayPtr;
    SettingsLoadedFlags: ImGuiTableFlags;
    SettingsOffset: Integer;
    LastFrameActive: Integer;
    ColumnsCount: Integer;
    CurrentRow: Integer;
    CurrentColumn: Integer;
    InstanceCurrent: ImS16;
    InstanceInteracted: ImS16;
    RowPosY1: Single;
    RowPosY2: Single;
    RowMinHeight: Single;
    RowCellPaddingY: Single;
    RowTextBaseline: Single;
    RowIndentOffsetX: Single;
    RowFlags: ImGuiTableRowFlags;
    LastRowFlags: ImGuiTableRowFlags;
    RowBgColorCounter: Integer;
    RowBgColor: Array[0..1] Of ImU32;
    BorderColorStrong: ImU32;
    BorderColorLight: ImU32;
    BorderX1: Single;
    BorderX2: Single;
    HostIndentX: Single;
    MinColumnWidth: Single;
    OuterPaddingX: Single;
    CellPaddingX: Single;
    CellSpacingX1: Single;
    CellSpacingX2: Single;
    InnerWidth: Single;
    ColumnsGivenWidth: Single;
    ColumnsAutoFitWidth: Single;
    ColumnsStretchSumWeights: Single;
    ResizedColumnNextWidth: Single;
    ResizeLockMinContentsX2: Single;
    RefScale: Single;
    OuterRect: ImRect;
    InnerRect: ImRect;
    WorkRect: ImRect;
    InnerClipRect: ImRect;
    BgClipRect: ImRect;
    Bg0ClipRectForDrawCmd: ImRect;
    Bg2ClipRectForDrawCmd: ImRect;
    HostClipRect: ImRect;
    HostBackupInnerClipRect: ImRect;
    OuterWindow: PImGuiWindow;
    InnerWindow: PImGuiWindow;
    ColumnsNames: ImGuiTextBuffer;
    DrawSplitter: PImDrawListSplitter;
    InstanceDataFirst: ImGuiTableInstanceData;
    InstanceDataExtra: ImVector_ImGuiTableInstanceData;
    SortSpecsSingle: ImGuiTableColumnSortSpecs;
    SortSpecsMulti: ImVector_ImGuiTableColumnSortSpecs;
    SortSpecs: ImGuiTableSortSpecs;
    SortSpecsCount: ImGuiTableColumnIdx;
    ColumnsEnabledCount: ImGuiTableColumnIdx;
    ColumnsEnabledFixedCount: ImGuiTableColumnIdx;
    DeclColumnsCount: ImGuiTableColumnIdx;
    HoveredColumnBody: ImGuiTableColumnIdx;
    HoveredColumnBorder: ImGuiTableColumnIdx;
    AutoFitSingleColumn: ImGuiTableColumnIdx;
    ResizedColumn: ImGuiTableColumnIdx;
    LastResizedColumn: ImGuiTableColumnIdx;
    HeldHeaderColumn: ImGuiTableColumnIdx;
    ReorderColumn: ImGuiTableColumnIdx;
    ReorderColumnDir: ImGuiTableColumnIdx;
    LeftMostEnabledColumn: ImGuiTableColumnIdx;
    RightMostEnabledColumn: ImGuiTableColumnIdx;
    LeftMostStretchedColumn: ImGuiTableColumnIdx;
    RightMostStretchedColumn: ImGuiTableColumnIdx;
    ContextPopupColumn: ImGuiTableColumnIdx;
    FreezeRowsRequest: ImGuiTableColumnIdx;
    FreezeRowsCount: ImGuiTableColumnIdx;
    FreezeColumnsRequest: ImGuiTableColumnIdx;
    FreezeColumnsCount: ImGuiTableColumnIdx;
    RowCellDataCurrent: ImGuiTableColumnIdx;
    DummyDrawChannel: ImGuiTableDrawChannelIdx;
    Bg2DrawChannelCurrent: ImGuiTableDrawChannelIdx;
    Bg2DrawChannelUnfrozen: ImGuiTableDrawChannelIdx;
    IsLayoutLocked: Boolean;
    IsInsideRow: Boolean;
    IsInitializing: Boolean;
    IsSortSpecsDirty: Boolean;
    IsUsingHeaders: Boolean;
    IsContextPopupOpen: Boolean;
    IsSettingsRequestLoad: Boolean;
    IsSettingsDirty: Boolean;
    IsDefaultDisplayOrder: Boolean;
    IsResetAllRequest: Boolean;
    IsResetDisplayOrderRequest: Boolean;
    IsUnfrozenRows: Boolean;
    IsDefaultSizingPolicy: Boolean;
    HasScrollbarYCurr: Boolean;
    HasScrollbarYPrev: Boolean;
    MemoryCompacted: Boolean;
    HostSkipItems: Boolean;
  End;

  ImGuiWindowSettings = Record
    ID: ImGuiID;
    Pos: ImVec2ih;
    Size: ImVec2ih;
    ViewportPos: ImVec2ih;
    ViewportId: ImGuiID;
    DockId: ImGuiID;
    ClassId: ImGuiID;
    DockOrder: Shortint;
    Collapsed: Boolean;
    WantApply: Boolean;
    WantDelete: Boolean;
  End;


  ImGuiSettingsHandler = Record
    TypeName : PChar;
    TypeHash : ImGuiID;
    ClearAllFn : function(ctx : PImGuiContext; handler : PImGuiSettingsHandler) : Pointer;
    ReadInitFn : function(ctx : PImGuiContext; handler : PImGuiSettingsHandler) : Pointer;
    ReadOpenFn : function(ctx : PImGuiContext; handler : PImGuiSettingsHandler; name : PChar) : Pointer;
    ReadLineFn : function(ctx : PImGuiContext; handler : PImGuiSettingsHandler; entry : Pointer; line : PChar) : Pointer;
    ApplyAllFn : function(ctx : PImGuiContext; handler : PImGuiSettingsHandler) : Pointer;
    WriteAllFn : function(ctx : PImGuiContext; handler : PImGuiSettingsHandler; out_buf : PImGuiTextBuffer) : Pointer;
    UserData : Pointer;
  End;

  ImVector_ImGuiTableTempData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTableTempData;
  End;

  ImVector_ImGuiTable = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTable;
  End;

  ImPool_ImGuiTable = Record
    Buf: ImVector_ImGuiTable;
    Map: ImGuiStorage;
    FreeIdx: ImPoolIdx;
    AliveCount: ImPoolIdx;
  End;

  ImVector_ImGuiTabBar = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiTabBar;
  End;

  ImPool_ImGuiTabBar = Record
    Buf: ImVector_ImGuiTabBar;
    Map: ImGuiStorage;
    FreeIdx: ImPoolIdx;
    AliveCount: ImPoolIdx;
  End;

  ImVector_ImGuiPtrOrIndex = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiPtrOrIndex;
  End;

  ImVector_ImGuiShrinkWidthItem = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiShrinkWidthItem;
  End;

  ImVector_ImGuiSettingsHandler = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiSettingsHandler;
  End;

  ImGuiShrinkWidthItem = Record
    Index: Integer;
    Width: Single;
    InitialWidth: Single;
  End;

  ImChunkStream_ImGuiWindowSettings = Record
    Buf: ImVector_char;
  End;

  ImChunkStream_ImGuiTableSettings = Record
    Buf: ImVector_char;
  End;

  ImGuiTableSettings = Record
    ID: ImGuiID;
    SaveFlags: ImGuiTableFlags;
    RefScale: Single;
    ColumnsCount: ImGuiTableColumnIdx;
    ColumnsCountMax: ImGuiTableColumnIdx;
    WantApply: Boolean;
  End;

  ImGuiPtrOrIndex = Record
    Ptr: Pointer;
    Index: Integer;
  End;

  ImVector_ImGuiContextHook = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiContextHook;
  End;


  ImGuiStyle = Record
    Alpha : Single;
    DisabledAlpha : Single;
    WindowPadding : ImVec2;
    WindowRounding : Single;
    WindowBorderSize : Single;
    WindowMinSize : ImVec2;
    WindowTitleAlign : ImVec2;
    WindowMenuButtonPosition : ImGuiDir;
    ChildRounding : Single;
    ChildBorderSize : Single;
    PopupRounding : Single;
    PopupBorderSize : Single;
    FramePadding : ImVec2;
    FrameRounding : Single;
    FrameBorderSize : Single;
    ItemSpacing : ImVec2;
    ItemInnerSpacing : ImVec2;
    CellPadding : ImVec2;
    TouchExtraPadding : ImVec2;
    IndentSpacing : Single;
    ColumnsMinSpacing : Single;
    ScrollbarSize : Single;
    ScrollbarRounding : Single;
    GrabMinSize : Single;
    GrabRounding : Single;
    LogSliderDeadzone : Single;
    TabRounding : Single;
    TabBorderSize : Single;
    TabMinWidthForCloseButton : Single;
    TabBarBorderSize : Single;
    TableAngledHeadersAngle : Single;
    ColorButtonPosition : ImGuiDir;
    ButtonTextAlign : ImVec2;
    SelectableTextAlign : ImVec2;
    SeparatorTextBorderSize : Single;
    SeparatorTextAlign : ImVec2;
    SeparatorTextPadding : ImVec2;
    DisplayWindowPadding : ImVec2;
    DisplaySafeAreaPadding : ImVec2;
    DockingSeparatorSize : Single;
    MouseCursorScale : Single;
    AntiAliasedLines : Boolean;
    AntiAliasedLinesUseTex : Boolean;
    AntiAliasedFill : Boolean;
    CurveTessellationTol : Single;
    CircleTessellationMaxError : Single;
    Colors : Array[0..55 - 1] of ImVec4;
    HoverStationaryDelay : Single;
    HoverDelayShort : Single;
    HoverDelayNormal : Single;
    HoverFlagsForTooltipMouse : ImGuiHoveredFlags;
    HoverFlagsForTooltipNav : ImGuiHoveredFlags;
  End;

  ImGuiKeyData = Record
    Down: Boolean;
    DownDuration: Single;
    DownDurationPrev: Single;
    AnalogValue: Single;
  End;

  ImVector_ImWchar = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImWchar;
  End;

  ImVector_ImDrawVert = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawVert;
  End;

  ImVector_ImVec4 = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImVec4;
  End;

  ImVector_ImTextureID = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImTextureID;
  End;

  ImVector_ImVec2 = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImVec2;
  End;


  ImGuiIO = Record
    ConfigFlags : ImGuiConfigFlags;
    BackendFlags : ImGuiBackendFlags;
    DisplaySize : ImVec2;
    DeltaTime : Single;
    IniSavingRate : Single;
    IniFilename : PChar;
    LogFilename : PChar;
    UserData : Pointer;
    Fonts : PImFontAtlas;
    FontGlobalScale : Single;
    FontAllowUserScaling : Boolean;
    FontDefault : PImFont;
    DisplayFramebufferScale : ImVec2;
    ConfigDockingNoSplit : Boolean;
    ConfigDockingWithShift : Boolean;
    ConfigDockingAlwaysTabBar : Boolean;
    ConfigDockingTransparentPayload : Boolean;
    ConfigViewportsNoAutoMerge : Boolean;
    ConfigViewportsNoTaskBarIcon : Boolean;
    ConfigViewportsNoDecoration : Boolean;
    ConfigViewportsNoDefaultParent : Boolean;
    MouseDrawCursor : Boolean;
    ConfigMacOSXBehaviors : Boolean;
    ConfigInputTrickleEventQueue : Boolean;
    ConfigInputTextCursorBlink : Boolean;
    ConfigInputTextEnterKeepActive : Boolean;
    ConfigDragClickToInputText : Boolean;
    ConfigWindowsResizeFromEdges : Boolean;
    ConfigWindowsMoveFromTitleBarOnly : Boolean;
    ConfigMemoryCompactTimer : Single;
    MouseDoubleClickTime : Single;
    MouseDoubleClickMaxDist : Single;
    MouseDragThreshold : Single;
    KeyRepeatDelay : Single;
    KeyRepeatRate : Single;
    ConfigDebugBeginReturnValueOnce : Boolean;
    ConfigDebugBeginReturnValueLoop : Boolean;
    ConfigDebugIgnoreFocusLoss : Boolean;
    ConfigDebugIniSettings : Boolean;
    BackendPlatformName : PChar;
    BackendRendererName : PChar;
    BackendPlatformUserData : Pointer;
    BackendRendererUserData : Pointer;
    BackendLanguageUserData : Pointer;
    GetClipboardTextFn : function(user_data : Pointer) : PChar; Cdecl;
    SetClipboardTextFn : procedure(user_data : Pointer; text : PChar); Cdecl;
    ClipboardUserData : Pointer;
    SetPlatformImeDataFn : procedure(viewport : PImGuiViewport; data : PImGuiPlatformImeData); Cdecl;
    PlatformLocaleDecimalPoint : ImWchar;
    WantCaptureMouse : Boolean;
    WantCaptureKeyboard : Boolean;
    WantTextInput : Boolean;
    WantSetMousePos : Boolean;
    WantSaveIniSettings : Boolean;
    NavActive : Boolean;
    NavVisible : Boolean;
    Framerate : Single;
    MetricsRenderVertices : Integer;
    MetricsRenderIndices : Integer;
    MetricsRenderWindows : Integer;
    MetricsActiveWindows : Integer;
    MouseDelta : ImVec2;
    KeyMap : Array[0..666 - 1] of Integer;
    KeysDown : Array[0..666 - 1] of Boolean;
    NavInputs : Array[0..16 - 1] of Single;
    _UnusedPadding : Pointer;
    Ctx : PImGuiContext;
    MousePos : ImVec2;
    MouseDown : Array[0..5 - 1] of Boolean;
    MouseWheel : Single;
    MouseWheelH : Single;
    MouseSource : ImGuiMouseSource;
    MouseHoveredViewport : ImGuiID;
    KeyCtrl : Boolean;
    KeyShift : Boolean;
    KeyAlt : Boolean;
    KeySuper : Boolean;
    KeyMods : ImGuiKeyChord;
    KeysData : Array[0..666 - 1] of ImGuiKeyData;
    WantCaptureMouseUnlessPopupClose : Boolean;
    MousePosPrev : ImVec2;
    MouseClickedPos : Array[0..5 - 1] of ImVec2;
    MouseClickedTime : Array[0..5 - 1] of Double;
    MouseClicked : Array[0..5 - 1] of Boolean;
    MouseDoubleClicked : Array[0..5 - 1] of Boolean;
    MouseClickedCount : Array[0..5 - 1] of ImU16;
    MouseClickedLastCount : Array[0..5 - 1] of ImU16;
    MouseReleased : Array[0..5 - 1] of Boolean;
    MouseDownOwned : Array[0..5 - 1] of Boolean;
    MouseDownOwnedUnlessPopupClose : Array[0..5 - 1] of Boolean;
    MouseWheelRequestAxisSwap : Boolean;
    MouseDownDuration : Array[0..5 - 1] of Single;
    MouseDownDurationPrev : Array[0..5 - 1] of Single;
    MouseDragMaxDistanceAbs : Array[0..5 - 1] of ImVec2;
    MouseDragMaxDistanceSqr : Array[0..5 - 1] of Single;
    PenPressure : Single;
    AppFocusLost : Boolean;
    AppAcceptingEvents : Boolean;
    BackendUsingLegacyKeyArrays : ImS8;
    BackendUsingLegacyNavInputArray : Boolean;
    InputQueueSurrogate : ImWchar16;
    InputQueueCharacters : ImVector_ImWchar;
  End;


  ImVector_ImFontPtr = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImFont;
  End;

  ImVector_ImFontAtlasCustomRect = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontAtlasCustomRect;
  End;

  ImVector_ImFontConfig = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontConfig;
  End;

  ImFontAtlas = Record
    Flags: ImFontAtlasFlags;
    TexID: ImTextureID;
    TexDesiredWidth: Integer;
    TexGlyphPadding: Integer;
    Locked: Boolean;
    UserData: Pointer;
    TexReady: Boolean;
    TexPixelsUseColors: Boolean;
    TexPixelsAlpha8: Pbyte;
    TexPixelsRGBA32: PCardinal;
    TexWidth: Integer;
    TexHeight: Integer;
    TexUvScale: ImVec2;
    TexUvWhitePixel: ImVec2;
    Fonts: ImVector_ImFontPtr;
    CustomRects: ImVector_ImFontAtlasCustomRect;
    ConfigData: ImVector_ImFontConfig;
    TexUvLines: Array [0..63] Of ImVec4;
    FontBuilderIO: PImFontBuilderIO;
    FontBuilderFlags: Cardinal;
    PackIdMouseCursors: Integer;
    PackIdLines: Integer;
  End;

  ImFontBuilderIO = Record
    FontBuilder_Build: Function(atlas: PImFontAtlas): Boolean; Cdecl;
  End;


  ImVector_float = Record
    Size: Integer;
    Capacity: Integer;
    Data: PSingle;
  End;

  ImVector_ImFontGlyph = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImFontGlyph;
  End;

  ImFont = Record
    IndexAdvanceX: ImVector_float;
    FallbackAdvanceX: Single;
    FontSize: Single;
    IndexLookup: ImVector_ImWchar;
    Glyphs: ImVector_ImFontGlyph;
    FallbackGlyph: PImFontGlyph;
    ContainerAtlas: PImFontAtlas;
    ConfigData: PImFontConfig;
    ConfigDataCount: ImS16;
    FallbackChar: ImWchar;
    EllipsisChar: ImWchar;
    EllipsisCharCount: ImS16;
    EllipsisWidth: Single;
    EllipsisCharStep: Single;
    DirtyLookupTables: Boolean;
    Scale: Single;
    Ascent: Single;
    Descent: Single;
    MetricsTotalSurface: Integer;
    Used4kPagesMap: Array[0..2 - 1] of ImU8;
  End;

  ImGuiViewport = Record
    ID: ImGuiID;
    Flags: ImGuiViewportFlags;
    Pos: ImVec2;
    Size: ImVec2;
    WorkPos: ImVec2;
    WorkSize: ImVec2;
    DpiScale: Single;
    ParentViewportId: ImGuiID;
    DrawData: PImDrawData;
    RendererUserData: Pointer;
    PlatformUserData: Pointer;
    PlatformHandle: Pointer;
    PlatformHandleRaw: Pointer;
    PlatformWindowCreated: Boolean;
    PlatformRequestMove: Boolean;
    PlatformRequestResize: Boolean;
    PlatformRequestClose: Boolean;
  End;

  ImGuiPlatformMonitor = Record
    MainPos: ImVec2;
    MainSize: ImVec2;
    WorkPos: ImVec2;
    WorkSize: ImVec2;
    DpiScale: Single;
    PlatformHandle: Pointer;
  End;

  ImGuiPlatformImeData = Record
    WantVisible: Boolean;
    InputPos: ImVec2;
    InputLineHeight: Single;
  End;

  ImVector_ImDrawList = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImDrawList;
  End;
  ImVector_ImDrawListPtr = ^ImVector_ImDrawList;
  PImVector_ImDrawListPtr = ^ImVector_ImDrawListPtr;

  ImDrawData = Record
    Valid: Boolean;
    CmdListsCount: Integer;
    TotalIdxCount: Integer;
    TotalVtxCount: Integer;
    CmdLists: ImVector_ImDrawList;
    DisplayPos: ImVec2;
    DisplaySize: ImVec2;
    FramebufferScale: ImVec2;
    OwnerViewport: PImGuiViewport;
  End;

  ImGuiPlatformIO = Record
    Platform_CreateWindow : procedure(viewport : PImGuiViewport); Cdecl;
    Platform_DestroyWindow : procedure(viewport : PImGuiViewport); Cdecl;
    Platform_ShowWindow : procedure(viewport : PImGuiViewport); Cdecl;
    Platform_SetWindowPos : procedure(viewport : PImGuiViewport; pos : ImVec2); Cdecl;
    Platform_GetWindowPos : function(viewport : PImGuiViewport) : ImVec2; Cdecl;
    Platform_SetWindowSize : procedure(viewport : PImGuiViewport; size : ImVec2); Cdecl;
    Platform_GetWindowSize : function(viewport : PImGuiViewport) : ImVec2; Cdecl;
    Platform_SetWindowFocus : procedure(viewport : PImGuiViewport); Cdecl;
    Platform_GetWindowFocus : function(viewport : PImGuiViewport) : Boolean; Cdecl;
    Platform_GetWindowMinimized : function(viewport : PImGuiViewport) : Boolean; Cdecl;
    Platform_SetWindowTitle : procedure(viewport : PImGuiViewport; title : PChar); Cdecl;
    Platform_SetWindowAlpha : procedure(viewport : PImGuiViewport; alpha : Single); Cdecl;
    Platform_UpdateWindow : procedure(viewport : PImGuiViewport); Cdecl;
    Platform_RenderWindow : procedure(viewport : PImGuiViewport; render_arg : Pointer); Cdecl;
    Platform_SwapBuffers : procedure(viewport : PImGuiViewport; render_arg : Pointer); Cdecl;
    Platform_GetWindowDpiScale : function(viewport : PImGuiViewport) : Single; Cdecl;
    Platform_OnChangedViewport : procedure(viewport : PImGuiViewport); Cdecl;
    Platform_CreateVkSurface : function(viewport : PImGuiViewport; vk_inst : ImU64; vk_allocators : Pointer; out_vk_surface : PImU64) : Integer; Cdecl;
    Renderer_CreateWindow : procedure(viewport : PImGuiViewport); Cdecl;
    Renderer_DestroyWindow : procedure(viewport : PImGuiViewport); Cdecl;
    Renderer_SetWindowSize : procedure(viewport : PImGuiViewport; size : ImVec2); Cdecl;
    Renderer_RenderWindow : procedure(viewport : PImGuiViewport; render_arg : Pointer); Cdecl;
    Renderer_SwapBuffers : procedure(viewport : PImGuiViewport; render_arg : Pointer); Cdecl;
    Monitors : ImVector_ImGuiPlatformMonitor;
    Viewports : ImVector_ImGuiViewportPtr;
  End;

  ImDrawListSharedData = Record
    TexUvWhitePixel: ImVec2;
    Font: PImFont;
    FontSize: Single;
    CurveTessellationTol: Single;
    CircleSegmentMaxError: Single;
    ClipRectFullscreen: ImVec4;
    InitialFlags: ImDrawListFlags;
    TempBuffer: ImVector_ImVec2;
    ArcFastVtx: Array[0..48 - 1] of ImVec2;
    ArcFastRadiusCutoff: Single;
    CircleSegmentCounts: Array[0..64 - 1] of ImU8;
    TexUvLines: PImVec4;
  End;

  ImGuiContextHook = Record
    HookId: ImGuiID;
    Type_: ImGuiContextHookType;
    Owner: ImGuiID;
    Callback: ImGuiContextHookCallback;
    UserData: Pointer;
  End;

  ImGuiInputEventMousePos = Record
    PosX, PosY: Single;
    MouseSource: ImGuiMouseSource;
  End;

  ImGuiInputEventMouseWheel = Record
    WheelX, WheelY: Single;
    MouseSource: ImGuiMouseSource;
  End;

  ImGuiInputEventMouseButton = Record
    Button: Integer;
    Down: Boolean;
    MouseSource: ImGuiMouseSource;
  End;

  ImGuiInputEventMouseViewport = Record
    HoveredViewportID: ImGuiID;
  End;

  ImGuiInputEventKey = Record
    Key: ImGuiKey;
    Down: Boolean;
    AnalogValue: Single;
  End;

  ImGuiInputEventText = Record
    Char: Cardinal;
  End;

  ImGuiInputEventAppFocused = Record
    Focused: Boolean;
  End;

  ImGuiInputEvent = Record
    Type_: ImGuiInputEventType;
    Source: ImGuiInputSource;
    EventId: ImU32;
    union: Record
      Case Integer Of
        0: (MousePos: ImGuiInputEventMousePos);
        1: (MouseWheel: ImGuiInputEventMouseWheel);
        2: (MouseButton: ImGuiInputEventMouseButton);
        3: (MouseViewport: ImGuiInputEventMouseViewport);
        4: (Key: ImGuiInputEventKey);
        5: (Text: ImGuiInputEventText);
        6: (AppFocused: ImGuiInputEventAppFocused);
    End;
    AddedByTestEngine: Boolean;
  End;

  ImGuiMenuColumns = Record
    TotalWidth: Cardinal;
    NextTotalWidth: Cardinal;
    Spacing: Word;
    OffsetIcon: Word;
    OffsetLabel: Word;
    OffsetShortcut: Word;
    OffsetMark: Word;
    Widths: Array [0..3] Of Word;
  End;

  ImVector_ImGuiWindowPtr = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiWindow;
  End;

  ImGuiDockNode = Bitpacked Record
    ID: ImGuiID;
    SharedFlags: ImGuiDockNodeFlags;
    LocalFlags: ImGuiDockNodeFlags;
    LocalFlagsInWindows: ImGuiDockNodeFlags;
    MergedFlags: ImGuiDockNodeFlags;
    State: ImGuiDockNodeState;
    ParentNode: PImGuiDockNode;
    ChildNodes: Array [0..1] Of PImGuiDockNode;
    Windows: ImVector_ImGuiWindowPtr;
    TabBar: PImGuiTabBar;
    Pos: ImVec2;
    Size: ImVec2;
    SizeRef: ImVec2;
    SplitAxis: ImGuiAxis;
    WindowClass: ImGuiWindowClass;
    LastBgColor: ImU32;
    HostWindow: PImGuiWindow;
    VisibleWindow: PImGuiWindow;
    CentralNode: PImGuiDockNode;
    OnlyNodeWithWindows: PImGuiDockNode;
    CountNodeWithWindows: Integer;
    LastFrameAlive: Integer;
    LastFrameActive: Integer;
    LastFrameFocused: Integer;
    LastFocusedNodeId: ImGuiID;
    SelectedTabId: ImGuiID;
    WantCloseTabId: ImGuiID;
    RefViewportId: ImGuiID;
    AuthorityForPos: T3Bits;
    AuthorityForSize: T3Bits;
    AuthorityForViewport: T3Bits;
    IsVisible: T1Bit;
    IsFocused: T1Bit;
    IsBgDrawnThisFrame: T1Bit;
    HasCloseButton: T1Bit;
    HasWindowMenuButton: T1Bit;
    HasCentralNodeChild: T1Bit;
    WantCloseAll: T1Bit;
    WantLockSizeOnce: T1Bit;
    WantMouseMove: T1Bit;
    WantHiddenTabBarUpdate: T1Bit;
    WantHiddenTabBarToggle: T1Bit;
  End;

  ImGuiWindowTempData = Record
    CursorPos: ImVec2;
    CursorPosPrevLine: ImVec2;
    CursorStartPos: ImVec2;
    CursorMaxPos: ImVec2;
    IdealMaxPos: ImVec2;
    CurrLineSize: ImVec2;
    PrevLineSize: ImVec2;
    CurrLineTextBaseOffset: Single;
    PrevLineTextBaseOffset: Single;
    IsSameLine: Boolean;
    IsSetPos: Boolean;
    Indent: ImVec1;
    ColumnsOffset: ImVec1;
    GroupOffset: ImVec1;
    CursorStartPosLossyness: ImVec2;
    NavLayerCurrent: ImGuiNavLayer;
    NavLayersActiveMask: Smallint;
    NavLayersActiveMaskNext: Smallint;
    NavIsScrollPushableX: Boolean;
    NavHideHighlightOneFrame: Boolean;
    NavWindowHasScrollY: Boolean;
    MenuBarAppending: Boolean;
    MenuBarOffset: ImVec2;
    MenuColumns: ImGuiMenuColumns;
    TreeDepth: Integer;
    TreeJumpToParentOnPopMask: Cardinal;
    ChildWindows: ImVector_ImGuiWindowPtr;
    StateStorage: PImGuiStorage;
    CurrentColumns: PImGuiOldColumns;
    CurrentTableIdx: Integer;
    LayoutType: ImGuiLayoutType;
    ParentLayoutType: ImGuiLayoutType;
    ItemWidth: Single;
    TextWrapPos: Single;
    ItemWidthStack: ImVector_float;
    TextWrapPosStack: ImVector_float;
  End;

  ImVector_ImGuiOldColumns = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiOldColumns;
  End;

  ImDrawList = Record
    CmdBuffer: ImVector_ImDrawCmd;
    IdxBuffer: ImVector_ImDrawIdx;
    VtxBuffer: ImVector_ImDrawVert;
    Flags: ImDrawListFlags;
    _VtxCurrentIdx: Cardinal;
    _Data: PImDrawListSharedData;
    _OwnerName: PChar;
    _VtxWritePtr: PImDrawVert;
    _IdxWritePtr: PImDrawIdx;
    _ClipRectStack: ImVector_ImVec4;
    _TextureIdStack: ImVector_ImTextureID;
    _Path: ImVector_ImVec2;
    _CmdHeader: ImDrawCmdHeader;
    _Splitter: ImDrawListSplitter;
    _FringeScale: Single;
  End;

  ImGuiWindow = Record
    Ctx: PImGuiContext;
    Name: Pansichar;
    ID: ImGuiID;
    Flags, FlagsPreviousFrame: ImGuiWindowFlags;
    WindowClass: ImGuiWindowClass;
    Viewport: PImGuiViewportP;
    ViewportId: ImGuiID;
    ViewportPos: ImVec2;
    ViewportAllowPlatformMonitorExtend: Integer;
    Pos, Size, SizeFull: ImVec2;
    ContentSize, ContentSizeIdeal, ContentSizeExplicit: ImVec2;
    WindowPadding: ImVec2;
    WindowRounding, WindowBorderSize: Single;
    DecoOuterSizeX1, DecoOuterSizeY1, DecoOuterSizeX2, DecoOuterSizeY2: Single;
    DecoInnerSizeX1, DecoInnerSizeY1: Single;
    NameBufLen: Integer;
    MoveId, TabId, ChildId: ImGuiID;
    Scroll, ScrollMax, ScrollTarget, ScrollTargetCenterRatio,
    ScrollTargetEdgeSnapDist: ImVec2;
    ScrollbarSizes: ImVec2;
    ScrollbarX, ScrollbarY: Boolean;
    ViewportOwned, Active, WasActive, WriteAccessed: Boolean;
    Collapsed, WantCollapseToggle, SkipItems, Appearing, Hidden,
    IsFallbackWindow: Boolean;
    IsExplicitChild, HasCloseButton: Boolean;
    ResizeBorderHeld: Shortint;
    BeginCount, BeginCountPreviousFrame, BeginOrderWithinParent,
    BeginOrderWithinContext: Shortint;
    FocusOrder: Shortint;
    PopupId: ImGuiID;
    AutoFitFramesX, AutoFitFramesY, AutoFitChildAxises: Shortint;
    AutoFitOnlyGrows: Boolean;
    AutoPosLastDirection: ImGuiDir;
    HiddenFramesCanSkipItems, HiddenFramesCannotSkipItems,
    HiddenFramesForRenderOnly, DisableInputsFrames: Shortint;
    SetWindowPosAllowFlags, SetWindowSizeAllowFlags, SetWindowCollapsedAllowFlags,
    SetWindowDockAllowFlags: ImGuiCond;
    SetWindowPosVal, SetWindowPosPivot: ImVec2;
    IDStack: ImVector_ImGuiID;
    DC: ImGuiWindowTempData;
    OuterRectClipped, InnerRect, InnerClipRect, WorkRect, ParentWorkRect: ImRect;
    ClipRect, ContentRegionRect: ImRect;
    HitTestHoleSize, HitTestHoleOffset: ImVec2ih;
    LastFrameActive, LastFrameJustFocused: Integer;
    LastTimeActive, ItemWidthDefault: Single;
    StateStorage: ImGuiStorage;
    ColumnsStorage: ImVector_ImGuiOldColumns;
    FontWindowScale, FontDpiScale: Single;
    SettingsOffset: Integer;
    DrawList: PImDrawList;
    DrawListInst: ImDrawList;
    ParentWindow, ParentWindowInBeginStack: PImGuiWindow;
    RootWindow, RootWindowPopupTree, RootWindowDockTree: PImGuiWindow;
    RootWindowForTitleBarHighlight, RootWindowForNav: PImGuiWindow;
    NavLastChildNavWindow: PImGuiWindow;
    NavLastIds: Array[0..ImGuiNavLayer_COUNT - 1] Of ImGuiID;
    NavRectRel: Array[0..ImGuiNavLayer_COUNT - 1] Of ImRect;
    NavPreferredScoringPosRel: Array[0..ImGuiNavLayer_COUNT - 1] Of ImVec2;
    NavRootFocusScopeId: ImGuiID;
    MemoryDrawListIdxCapacity, MemoryDrawListVtxCapacity: Integer;
    MemoryCompacted: Boolean;
    DockIsActive, DockNodeIsVisible, DockTabIsVisible, DockTabWantClose: Boolean;
    DockOrder: Shortint;
    DockStyle: ImGuiWindowDockStyle;
    DockNode, DockNodeAsHost: PImGuiDockNode;
    DockId: ImGuiID;
    DockTabItemStatusFlags: ImGuiItemStatusFlags;
    DockTabItemRect: ImRect;
  End;


  ImDrawDataBuilder = Record
    Layers: Array[0..1] Of PImVector_ImDrawListPtr;
    LayerData1: ImVector_ImDrawListPtr;
  End;

  ImGuiViewportP = Record
    _ImGuiViewport: ImGuiViewport;
    Window: PImGuiWindow;
    Idx: Integer;
    LastFrameActive: Integer;
    LastFocusedStampCount: Integer;
    LastNameHash: ImGuiID;
    LastPos: ImVec2;
    Alpha: Single;
    LastAlpha: Single;
    LastFocusedHadNavWindow: Boolean;
    PlatformMonitor: Shortint;
    BgFgDrawListsLastFrame: Array[0..1] Of Integer;
    BgFgDrawLists: Array[0..1] Of PImDrawList;
    DrawDataP: ImDrawData;
    DrawDataBuilder: ImDrawDataBuilder;
    LastPlatformPos: ImVec2;
    LastPlatformSize: ImVec2;
    LastRendererSize: ImVec2;
    WorkOffsetMin: ImVec2;
    WorkOffsetMax: ImVec2;
    BuildWorkOffsetMin: ImVec2;
    BuildWorkOffsetMax: ImVec2;
  End;

  ImGuiKeyRoutingData = Record
    NextEntryIndex: ImGuiKeyRoutingIndex;
    Mods: ImU16;
    RoutingNextScore: ImU8;
    RoutingCurr: ImGuiID;
    RoutingNext: ImGuiID;
  End;

  ImVector_ImGuiKeyRoutingData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiKeyRoutingData;
  End;
  PImVector_ImGuiKeyRoutingData = ^ImVector_ImGuiKeyRoutingData;

  ImGuiKeyRoutingTable = Record
    Index: Array[0..ImGuiKey_NamedKey_COUNT - 1] Of ImGuiKeyRoutingIndex;
    Entries: ImVector_ImGuiKeyRoutingData;
    EntriesNext: ImVector_ImGuiKeyRoutingData;
  End;

  ImGuiKeyOwnerData = Record
    OwnerCurr: ImGuiID;
    OwnerNext: ImGuiID;
    LockThisFrame: Boolean;
    LockUntilRelease: Boolean;
  End;


  ImGuiNavItemData = Record
    Window: PImGuiWindow;
    ID: ImGuiID;
    FocusScopeId: ImGuiID;
    RectRel: ImRect;
    InFlags: ImGuiItemFlags;
    SelectionUserData: ImGuiSelectionUserData;
    DistBox: Single;
    DistCenter: Single;
    DistAxial: Single;
  End;

  StbUndoRecord = Record
    where: Integer;
    insert_length: Integer;
    delete_length: Integer;
    char_storage: Integer;
  End;
  PStbUndoRecord = ^StbUndoRecord;

  StbUndoState = Record
    undo_rec: Array[0..99 - 1] of StbUndoRecord;
    undo_char: Array[0..999 - 1] of ImWchar;
    undo_point: ImS16;
    redo_point: ImS16;
    undo_char_point: Integer;
    redo_char_point: Integer;
  End;
  PStbUndoState = ^StbUndoState;

  STB_TexteditState = Record
    cursor: Integer;
    select_start: Integer;
    select_end: Integer;
    insert_mode: ImU8;
    row_count_per_page: Integer;
    cursor_at_end_of_line: ImU8;
    initialized: ImU8;
    has_preferred_x: ImU8;
    single_line: ImU8;
    padding1: ImU8;
    padding2: ImU8;
    padding3: ImU8;
    preferred_x: Single;
    undostate: StbUndoState;
  End;
  PSTB_TexteditState = ^STB_TexteditState;

  ImGuiInputTextState = Record
    Ctx: PImGuiContext;
    ID: ImGuiID;
    CurLenW: Integer;
    CurLenA: Integer;
    TextW: ImVector_ImWchar;
    TextA: ImVector_char;
    InitialTextA: ImVector_char;
    TextAIsValid: Boolean;
    BufCapacityA: Integer;
    ScrollX: Single;
    Stb: STB_TexteditState;
    CursorAnim: Single;
    CursorFollow: Boolean;
    SelectedAllMouseLock: Boolean;
    Edited: Boolean;
    Flags: ImGuiInputTextFlags;
  End;

  ImGuiInputTextDeactivatedState = Record
    ID: ImGuiID;
    TextA: ImVector_char;
  End;

  ImGuiComboPreviewData = Record
    PreviewRect: ImRect;
    BackupCursorPos: ImVec2;
    BackupCursorMaxPos: ImVec2;
    BackupCursorPosPrevLine: ImVec2;
    BackupPrevLineTextBaseOffset: Single;
    BackupLayout: ImGuiLayoutType;
  End;

  { ImGuiDockRequest }

  ImGuiDockRequestType = (
    ImGuiDockRequestType_None = 0,
    ImGuiDockRequestType_Dock,
    ImGuiDockRequestType_Undock,
    ImGuiDockRequestType_Split  // Split is the same as Dock but without a DockPayload
  );

  ImGuiDockRequest = Record
    Type_: ImGuiDockRequestType;
    DockTargetWindow: PImGuiWindow;   // Destination/Target Window to dock into
    DockTargetNode: PImGuiDockNode;   // Destination/Target Node to dock into
    DockPayload: PImGuiWindow;        // Source/Payload window to dock
    DockSplitDir: ImGuiDir;
    DockSplitRatio: Single;
    DockSplitOuter: Boolean;
    UndockTargetWindow: PImGuiWindow;
    UndockTargetNode: PImGuiDockNode;
    constructor New(_DockSplitRatio: Single);
  End;


  ImVector_int = Record
    Size: Integer;
    Capacity: Integer;
    Data: PInteger;
  End;

  ImGuiTextIndex = Record
    LineOffsets: ImVector_int;
    EndOffset: Integer;
  End;

  ImGuiMetricsConfig = Record
    ShowDebugLog: Boolean;
    ShowIDStackTool: Boolean;
    ShowWindowsRects: Boolean;
    ShowWindowsBeginOrder: Boolean;
    ShowTablesRects: Boolean;
    ShowDrawCmdMesh: Boolean;
    ShowDrawCmdBoundingBoxes: Boolean;
    ShowAtlasTintedWithTextColor: Boolean;
    ShowDockingNodes: Boolean;
    ShowWindowsRectsType: Integer;
    ShowTablesRectsType: Integer;
  End;

  ImGuiStackLevelInfo = Record
    ID: ImGuiID;
    QueryFrameCount: ImS8;
    QuerySuccess: Boolean;
    DataType: ImGuiDataType;
    Desc: Array[0..57 - 1] of Char;
  End;

  ImVector_ImGuiStackLevelInfo = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiStackLevelInfo;
  End;
  PImVector_ImGuiStackLevelInfo = ^ImVector_ImGuiStackLevelInfo;

  ImGuiStackTool = Record
    LastActiveFrame: Integer;
    StackLevel: Integer;
    QueryId: ImGuiID;
    Results: ImVector_ImGuiStackLevelInfo;
    CopyToClipboardOnCtrlC: Boolean;
    CopyToClipboardLastTime: Single;
  End;
  PImGuiStackTool = ^ImGuiStackTool;

  ImGuiIDStackTool = record
    LastActiveFrame: Integer;
    StackLevel: Integer;
    QueryId: ImGuiID;
    Results: ImVector_ImGuiStackLevelInfo;
    CopyToClipboardOnCtrlC: Boolean;
    CopyToClipboardLastTime: Single;
  end;

  ImGuiContext = Record
    Initialized : Boolean;
    FontAtlasOwnedByContext : Boolean;
    IO : ImGuiIO;
    PlatformIO : ImGuiPlatformIO;
    Style : ImGuiStyle;
    ConfigFlagsCurrFrame : ImGuiConfigFlags;
    ConfigFlagsLastFrame : ImGuiConfigFlags;
    Font : PImFont;
    FontSize : Single;
    FontBaseSize : Single;
    DrawListSharedData : ImDrawListSharedData;

    Time : Double;
    FrameCount : Integer;
    FrameCountEnded : Integer;
    FrameCountPlatformEnded : Integer;
    FrameCountRendered : Integer;
    WithinFrameScope : Boolean;
    WithinFrameScopeWithImplicitWindow : Boolean;
    WithinEndChild : Boolean;
    GcCompactAll : Boolean;
    TestEngineHookItems : Boolean;
    TestEngine : Pointer;

    InputEventsQueue : ImVector_ImGuiInputEvent;
    InputEventsTrail : ImVector_ImGuiInputEvent;
    InputEventsNextMouseSource : ImGuiMouseSource;

    InputEventsNextEventId : ImU32;

    Windows : ImVector_ImGuiWindowPtr;
    WindowsFocusOrder : ImVector_ImGuiWindowPtr;
    WindowsTempSortBuffer : ImVector_ImGuiWindowPtr;
    CurrentWindowStack : ImVector_ImGuiWindowStackData;
    WindowsById : ImGuiStorage;
    WindowsActiveCount : Integer;
    WindowsHoverPadding : ImVec2;
    CurrentWindow : PImGuiWindow;
    HoveredWindow : PImGuiWindow;
    HoveredWindowUnderMovingWindow : PImGuiWindow;
    MovingWindow : PImGuiWindow;
    WheelingWindow : PImGuiWindow;
    WheelingWindowRefMousePos : ImVec2;
    WheelingWindowStartFrame : Integer;
    WheelingWindowScrolledFrame : Integer;
    WheelingWindowReleaseTimer : Single;
    WheelingWindowWheelRemainder : ImVec2;
    WheelingAxisAvg : ImVec2;
    DebugHookIdInfo : ImGuiID;
    HoveredId : ImGuiID;

    HoveredIdPreviousFrame : ImGuiID;
    HoveredIdAllowOverlap : Boolean;
    HoveredIdDisabled : Boolean;
    HoveredIdTimer : Single;
    HoveredIdNotActiveTimer : Single;
    ActiveId : ImGuiID;
    ActiveIdIsAlive : ImGuiID;
    ActiveIdTimer : Single;
    ActiveIdIsJustActivated : Boolean;
    ActiveIdAllowOverlap : Boolean;
    ActiveIdNoClearOnFocusLoss : Boolean;
    ActiveIdHasBeenPressedBefore : Boolean;
    ActiveIdHasBeenEditedBefore : Boolean;
    ActiveIdHasBeenEditedThisFrame : Boolean;
    ActiveIdClickOffset : ImVec2;
    ActiveIdWindow : PImGuiWindow;
    ActiveIdSource : ImGuiInputSource;
    ActiveIdMouseButton : Integer;
    ActiveIdPreviousFrame : ImGuiID;
    ActiveIdPreviousFrameIsAlive : Boolean;
    ActiveIdPreviousFrameHasBeenEditedBefore : Boolean;
    ActiveIdPreviousFrameWindow : PImGuiWindow;
    LastActiveId : ImGuiID;

    LastActiveIdTimer : Single;
    KeysOwnerData : Array[0..154 - 1] of ImGuiKeyOwnerData;
    KeysRoutingTable : ImGuiKeyRoutingTable;
    ActiveIdUsingNavDirMask : ImU32;
    ActiveIdUsingAllKeyboardKeys : Boolean;
    ActiveIdUsingNavInputMask : ImU32;
    CurrentFocusScopeId : ImGuiID;
    CurrentItemFlags : ImGuiItemFlags;
    DebugLocateId : ImGuiID;
    NextItemData : ImGuiNextItemData;
    LastItemData : ImGuiLastItemData;
    NextWindowData : ImGuiNextWindowData;
    DebugShowGroupRects : Boolean;
    ColorStack : ImVector_ImGuiColorMod;

    StyleVarStack : ImVector_ImGuiStyleMod;
    FontStack : ImVector_ImFontPtr;
    FocusScopeStack : ImVector_ImGuiID;
    ItemFlagsStack : ImVector_ImGuiItemFlags;
    GroupStack : ImVector_ImGuiGroupData;
    OpenPopupStack : ImVector_ImGuiPopupData;
    BeginPopupStack : ImVector_ImGuiPopupData;
    NavTreeNodeStack : ImVector_ImGuiNavTreeNodeData;
    BeginMenuCount : Integer;
    Viewports : ImVector_ImGuiViewportPPtr;
    CurrentDpiScale : Single;
    CurrentViewport : PImGuiViewportP;
    MouseViewport : PImGuiViewportP;
    MouseLastHoveredViewport : PImGuiViewportP;
    PlatformLastFocusedViewportId : ImGuiID;
    FallbackMonitor : ImGuiPlatformMonitor;
    ViewportCreatedCount : Integer;
    PlatformWindowsCreatedCount : Integer;
    ViewportFocusedStampCount : Integer;
    NavWindow : PImGuiWindow;
    NavId : ImGuiID;

    NavFocusScopeId : ImGuiID;
    NavActivateId : ImGuiID;
    NavActivateDownId : ImGuiID;
    NavActivatePressedId : ImGuiID;
    NavActivateFlags : ImGuiActivateFlags;
    NavJustMovedToId : ImGuiID;
    NavJustMovedToFocusScopeId : ImGuiID;
    NavJustMovedToKeyMods : ImGuiKeyChord;
    NavNextActivateId : ImGuiID;
    NavNextActivateFlags : ImGuiActivateFlags;
    NavInputSource : ImGuiInputSource;
    NavLayer : ImGuiNavLayer;
    NavLastValidSelectionUserData : ImGuiSelectionUserData;
    NavIdIsAlive : Boolean;
    NavMousePosDirty : Boolean;
    NavDisableHighlight : Boolean;
    NavDisableMouseHover : Boolean;
    NavAnyRequest : Boolean;
    NavInitRequest : Boolean;
    NavInitRequestFromMove : Boolean;
    NavInitResult : ImGuiNavItemData;

    NavMoveSubmitted : Boolean;
    NavMoveScoringItems : Boolean;
    NavMoveForwardToNextFrame : Boolean;
    NavMoveFlags : ImGuiNavMoveFlags;
    NavMoveScrollFlags : ImGuiScrollFlags;
    NavMoveKeyMods : ImGuiKeyChord;
    NavMoveDir : ImGuiDir;
    NavMoveDirForDebug : ImGuiDir;
    NavMoveClipDir : ImGuiDir;
    NavScoringRect : ImRect;
    NavScoringNoClipRect : ImRect;
    NavScoringDebugCount : Integer;
    NavTabbingDir : Integer;
    NavTabbingCounter : Integer;
    NavMoveResultLocal : ImGuiNavItemData;
    NavMoveResultLocalVisible : ImGuiNavItemData;
    NavMoveResultOther : ImGuiNavItemData;
    NavTabbingResultFirst : ImGuiNavItemData;
    ConfigNavWindowingKeyNext : ImGuiKeyChord;
    ConfigNavWindowingKeyPrev : ImGuiKeyChord;
    NavWindowingTarget : PImGuiWindow;
    NavWindowingTargetAnim : PImGuiWindow;
    NavWindowingListWindow : PImGuiWindow;
    NavWindowingTimer : Single;
    NavWindowingHighlightAlpha : Single;
    NavWindowingToggleLayer : Boolean;
    NavWindowingAccumDeltaPos : ImVec2;
    NavWindowingAccumDeltaSize : ImVec2;
    DimBgRatio : Single;

    DragDropActive : Boolean;
    DragDropWithinSource : Boolean;
    DragDropWithinTarget : Boolean;
    DragDropSourceFlags : ImGuiDragDropFlags;
    DragDropSourceFrameCount : Integer;
    DragDropMouseButton : Integer;
    DragDropPayload : ImGuiPayload;
    DragDropTargetRect : ImRect;
    DragDropTargetId : ImGuiID;
    DragDropAcceptFlags : ImGuiDragDropFlags;
    DragDropAcceptIdCurrRectSurface : Single;
    DragDropAcceptIdCurr : ImGuiID;
    DragDropAcceptIdPrev : ImGuiID;
    DragDropAcceptFrameCount : Integer;
    DragDropHoldJustPressedId : ImGuiID;
    DragDropPayloadBufHeap : ImVector_unsigned_char;
    DragDropPayloadBufLocal : Array[0..16 - 1] of ImU8;
    ClipperTempDataStacked : Integer;
    ClipperTempData : ImVector_ImGuiListClipperData;
    CurrentTable : PImGuiTable;
    TablesTempDataStacked : Integer;
    TablesTempData : ImVector_ImGuiTableTempData;

    Tables : ImPool_ImGuiTable;
    TablesLastTimeActive : ImVector_float;
    DrawChannelsTempMergeBuffer : ImVector_ImDrawChannel;
    CurrentTabBar : PImGuiTabBar;
    TabBars : ImPool_ImGuiTabBar;
    CurrentTabBarStack : ImVector_ImGuiPtrOrIndex;
    ShrinkWidthBuffer : ImVector_ImGuiShrinkWidthItem;
    HoverItemDelayId : ImGuiID;
    HoverItemDelayIdPreviousFrame : ImGuiID;
    HoverItemDelayTimer : Single;
    HoverItemDelayClearTimer : Single;
    HoverItemUnlockedStationaryId : ImGuiID;
    HoverWindowUnlockedStationaryId : ImGuiID;
    MouseCursor : ImGuiMouseCursor;
    MouseStationaryTimer : Single;
    MouseLastValidPos : ImVec2;
    InputTextState : ImGuiInputTextState;
    InputTextDeactivatedState : ImGuiInputTextDeactivatedState;

    InputTextPasswordFont : ImFont;
    TempInputId : ImGuiID;
    ColorEditOptions : ImGuiColorEditFlags;
    ColorEditCurrentID : ImGuiID;
    ColorEditSavedID : ImGuiID;
    ColorEditSavedHue : Single;
    ColorEditSavedSat : Single;
    ColorEditSavedColor : ImU32;
    ColorPickerRef : ImVec4;
    ComboPreviewData : ImGuiComboPreviewData;
    WindowResizeBorderExpectedRect : ImRect;
    WindowResizeRelativeMode : Boolean;
    SliderGrabClickOffset : Single;
    SliderCurrentAccum : Single;
    SliderCurrentAccumDirty : Boolean;
    DragCurrentAccumDirty : Boolean;
    DragCurrentAccum : Single;
    DragSpeedDefaultRatio : Single;
    ScrollbarClickDeltaToGrabCenter : Single;
    DisabledAlphaBackup : Single;
    DisabledStackSize : ImS16;
    LockMarkEdited : ImS16;
    TooltipOverrideCount : ImS16;

    ClipboardHandlerData : ImVector_char;
    MenusIdSubmittedThisFrame : ImVector_ImGuiID;
    TypingSelectState : ImGuiTypingSelectState;
    PlatformImeData : ImGuiPlatformImeData;
    PlatformImeDataPrev : ImGuiPlatformImeData;
    PlatformImeViewport : ImGuiID;
    DockContext : ImGuiDockContext;
    DockNodeWindowMenuHandler : procedure(ctx : PImGuiContext; node : PImGuiDockNode; tab_bar : PImGuiTabBar); Cdecl;
    SettingsLoaded : Boolean;
    SettingsDirtyTimer : Single;
    SettingsIniData : ImGuiTextBuffer;
    SettingsHandlers : ImVector_ImGuiSettingsHandler;
    SettingsWindows : ImChunkStream_ImGuiWindowSettings;
    SettingsTables : ImChunkStream_ImGuiTableSettings;
    Hooks : ImVector_ImGuiContextHook;
    HookIdNext : ImGuiID;
    LocalizationTable : Array[0..11 - 1] of PChar;

    LogEnabled : Boolean;
    LogType : ImGuiLogType;
    LogFile : ImFileHandle;
    LogBuffer : ImGuiTextBuffer;
    LogNextPrefix : PChar;
    LogNextSuffix : PChar;
    LogLinePosY : Single;
    LogLineFirstItem : Boolean;
    LogDepthRef : Integer;
    LogDepthToExpand : Integer;
    LogDepthToExpandDefault : Integer;
    DebugLogFlags : ImGuiDebugLogFlags;
    DebugLogBuf : ImGuiTextBuffer;
    DebugLogIndex : ImGuiTextIndex;
    DebugLogClipperAutoDisableFrames : ImU8;
    DebugLocateFrames : ImU8;
    DebugBeginReturnValueCullDepth : ImS8;
    DebugItemPickerActive : Boolean;
    DebugItemPickerMouseButton : ImU8;
    DebugItemPickerBreakId : ImGuiID;
    DebugMetricsConfig : ImGuiMetricsConfig;
    DebugIDStackTool : ImGuiIDStackTool;
    DebugAllocInfo : ImGuiDebugAllocInfo;

    DebugHoveredDockNode : PImGuiDockNode;
    FramerateSecPerFrame : Array[0..60 - 1] of Single;
    FramerateSecPerFrameIdx : Integer;
    FramerateSecPerFrameCount : Integer;
    FramerateSecPerFrameAccum : Single;
    WantCaptureMouseNextFrame : Integer;
    WantCaptureKeyboardNextFrame : Integer;
    WantTextInputNextFrame : Integer;
    TempBuffer : ImVector_char;
  End;


  ImFontAtlasCustomRect = Record
    Width: ImU16;
    Height: ImU16;
    X: ImU16;
    Y: ImU16;
    GlyphID: ImU32;
    GlyphAdvanceX: Single;
    GlyphOffset: ImVec2;
    Font: PImFont;
  End;


  ImFontConfig = Record
    FontData: Pointer;
    FontDataSize: Integer;
    FontDataOwnedByAtlas: Boolean;
    FontNo: Integer;
    SizePixels: Single;
    OversampleH: Integer;
    OversampleV: Integer;
    PixelSnapH: Boolean;
    GlyphExtraSpacing: ImVec2;
    GlyphOffset: ImVec2;
    GlyphRanges: PImWchar;
    GlyphMinAdvanceX: Single;
    GlyphMaxAdvanceX: Single;
    MergeMode: Boolean;
    FontBuilderFlags: ImU32;
    RasterizerMultiply: Single;
    EllipsisChar: ImWchar;
    Name: Array[0..40 - 1] of Char;
    DstFont: PImFont;
  End;


  ImGuiOldColumnData = Record
    OffsetNorm: Single;
    OffsetNormBeforeResize: Single;
    Flags: ImGuiOldColumnFlags;
    ClipRect: ImRect;
  End;


  ImVector_ImGuiOldColumnData = Record
    Size: Integer;
    Capacity: Integer;
    Data: PImGuiOldColumnData;
  End;

  ImGuiOldColumns = Record
    ID: ImGuiID;
    Flags: ImGuiOldColumnFlags;
    IsFirstFrame: Boolean;
    IsBeingResized: Boolean;
    Current: Integer;
    Count: Integer;
    OffMinX, OffMaxX: Single;
    LineMinY, LineMaxY: Single;
    HostCursorPosY: Single;
    HostCursorMaxPosX: Single;
    HostInitialClipRect: ImRect;
    HostBackupClipRect: ImRect;
    HostBackupParentWorkRect: ImRect;
    Columns: ImVector_ImGuiOldColumnData;
    Splitter: ImDrawListSplitter;
  End;

  { ImGuiDockNodeSettings }

  ImGuiDockNodeSettings = Record
    ID: ImGuiID;
    ParentNodeId: ImGuiID;
    ParentWindowId: ImGuiID;
    SelectedTabId: ImGuiID;
    SplitAxis: Shortint;
    Depth: Byte;
    Flags: ImGuiDockNodeFlags;
    Pos: ImVec2ih;
    Size: ImVec2ih;
    SizeRef: ImVec2ih;
    constructor New(SplitAxis_: ImGuiAxis);
  End;

  ImFontGlyph = bitpacked Record
    Colored: T1Bit;
    Visible: T1Bit;
    Codepoint: T30Bits;
    AdvanceX: Single;
    X0, Y0, X1, Y1: Single;
    U0, V0, U1, V1: Single;
  End;

Implementation

{ ImVec2 }

constructor ImVec2.New(const _x, _y: Single);
Begin
  Self.x := _x;
  Self.y := _y;
End;

{ ImVec3 }

constructor ImVec3.New(const _x, _y, _z: Single);
begin
  Self.x := _x;
  Self.y := _y;
  Self.z := _z;
end;

{ ImVec4 }

constructor ImVec4.New(const _x, _y, _z, _w: Single);
begin
  Self.x := _x;
  Self.y := _y;
  Self.z := _z;
  Self.w := _w;
end;

{ ImGuiDockRequest }

constructor ImGuiDockRequest.New(_DockSplitRatio : Single);
Begin
  FillChar(Self, SizeOf(ImGuiDockRequest), 0);
  Self.DockSplitRatio := _DockSplitRatio;
End;

{ ImGuiDockNodeSettings }

constructor ImGuiDockNodeSettings.New(SplitAxis_ : ImGuiAxis);
Begin
  FillChar(Self, SizeOf(ImGuiDockNodeSettings), 0);
  Self.SplitAxis := Shortint(SplitAxis_); // Initialize with your default value
End;

End.


