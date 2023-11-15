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

unit PasImGui.Enums;

{$IfDef FPC}
  {$mode objfpc}{$H+}
  {$PACKRECORDS C}
  {$PackEnum 4}
  {$WARN 3031 off : Values in enumeration types have to be ascending}
{$EndIf}

interface


Const
  ImGuiWindowFlags_None = 0;
  ImGuiWindowFlags_NoTitleBar = 1 shl 0;
  ImGuiWindowFlags_NoResize = 1 shl 1;
  ImGuiWindowFlags_NoMove = 1 shl 2;
  ImGuiWindowFlags_NoScrollbar = 1 shl 3;
  ImGuiWindowFlags_NoScrollWithMouse = 1 shl 4;
  ImGuiWindowFlags_NoCollapse = 1 shl 5;
  ImGuiWindowFlags_AlwaysAutoResize = 1 shl 6;
  ImGuiWindowFlags_NoBackground = 1 shl 7;
  ImGuiWindowFlags_NoSavedSettings = 1 shl 8;
  ImGuiWindowFlags_NoMouseInputs = 1 shl 9;
  ImGuiWindowFlags_MenuBar = 1 shl 10;
  ImGuiWindowFlags_HorizontalScrollbar = 1 shl 11;
  ImGuiWindowFlags_NoFocusOnAppearing = 1 shl 12;
  ImGuiWindowFlags_NoBringToFrontOnFocus = 1 shl 13;
  ImGuiWindowFlags_AlwaysVerticalScrollbar = 1 shl 14;
  ImGuiWindowFlags_AlwaysHorizontalScrollbar = 1shl 15;
  ImGuiWindowFlags_NoNavInputs = 1 shl 16;
  ImGuiWindowFlags_NoNavFocus = 1 shl 17;
  ImGuiWindowFlags_UnsavedDocument = 1 shl 18;
  ImGuiWindowFlags_NoDocking = 1 shl 19;
  ImGuiWindowFlags_NoNav = ImGuiWindowFlags_NoNavInputs or ImGuiWindowFlags_NoNavFocus;
  ImGuiWindowFlags_NoDecoration = ImGuiWindowFlags_NoTitleBar or ImGuiWindowFlags_NoResize or ImGuiWindowFlags_NoScrollbar or ImGuiWindowFlags_NoCollapse;
  ImGuiWindowFlags_NoInputs = ImGuiWindowFlags_NoMouseInputs or ImGuiWindowFlags_NoNavInputs or ImGuiWindowFlags_NoNavFocus;
  ImGuiWindowFlags_NavFlattened = 1 shl 23;
  ImGuiWindowFlags_ChildWindow = 1 shl 24;
  ImGuiWindowFlags_Tooltip = 1 shl 25;
  ImGuiWindowFlags_Popup = 1 shl 26;
  ImGuiWindowFlags_Modal = 1 shl 27;
  ImGuiWindowFlags_ChildMenu = 1 shl 28;
  ImGuiWindowFlags_DockNodeHost = 1 shl 29;


Const
  ImGuiWindowDockStyleCol_Text = 0;
  ImGuiWindowDockStyleCol_Tab = 1;
  ImGuiWindowDockStyleCol_TabHovered = 2;
  ImGuiWindowDockStyleCol_TabActive = 3;
  ImGuiWindowDockStyleCol_TabUnfocused = 4;
  ImGuiWindowDockStyleCol_TabUnfocusedActive = 5;
  ImGuiWindowDockStyleCol_COUNT = 6;


Const
  ImGuiViewportFlags_None = 0;
  ImGuiViewportFlags_IsPlatformWindow = 1 shl 0;
  ImGuiViewportFlags_IsPlatformMonitor = 1 shl 1;
  ImGuiViewportFlags_OwnedByApp = 1 shl 2;
  ImGuiViewportFlags_NoDecoration = 1 shl 3;
  ImGuiViewportFlags_NoTaskBarIcon = 1 shl 4;
  ImGuiViewportFlags_NoFocusOnAppearing = 1 shl 5;
  ImGuiViewportFlags_NoFocusOnClick = 1 shl 6;
  ImGuiViewportFlags_NoInputs = 1 shl 7;
  ImGuiViewportFlags_NoRendererClear = 1 shl 8;
  ImGuiViewportFlags_NoAutoMerge = 1 shl 9;
  ImGuiViewportFlags_TopMost = 1 shl 10;
  ImGuiViewportFlags_CanHostOtherWindows = 1 shl 11;
  ImGuiViewportFlags_IsMinimized = 1 shl 12;
  ImGuiViewportFlags_IsFocused = 1 shl 13;


Const
  ImGuiTypingSelectFlags_None = 0;
  ImGuiTypingSelectFlags_AllowBackspace = 1 shl 0;
  ImGuiTypingSelectFlags_AllowSingleCharMode = 1 shl 1;


Const
  ImGuiTreeNodeFlags_None = 0;
  ImGuiTreeNodeFlags_Selected = 1 shl 0;
  ImGuiTreeNodeFlags_Framed = 1 shl 1;
  ImGuiTreeNodeFlags_AllowOverlap = 1 shl 2;
  ImGuiTreeNodeFlags_NoTreePushOnOpen = 1 shl 3;
  ImGuiTreeNodeFlags_NoAutoOpenOnLog = 1 shl 4;
  ImGuiTreeNodeFlags_DefaultOpen = 1 shl 5;
  ImGuiTreeNodeFlags_OpenOnDoubleClick = 1 shl 6;
  ImGuiTreeNodeFlags_OpenOnArrow = 1 shl 7;
  ImGuiTreeNodeFlags_Leaf = 1 shl 8;
  ImGuiTreeNodeFlags_Bullet = 1 shl 9;
  ImGuiTreeNodeFlags_FramePadding = 1 shl 10;
  ImGuiTreeNodeFlags_SpanAvailWidth = 1 shl 11;
  ImGuiTreeNodeFlags_SpanFullWidth = 1 shl 12;
  ImGuiTreeNodeFlags_SpanAllColumns = 1 shl 13;
  ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 1 shl 14;
  ImGuiTreeNodeFlags_CollapsingHeader = ImGuiTreeNodeFlags_Framed or ImGuiTreeNodeFlags_NoTreePushOnOpen or ImGuiTreeNodeFlags_NoAutoOpenOnLog;


Const
  ImGuiTreeNodeFlags_ClipLabelForTrailingButton = 1 shl 20;
  ImGuiTreeNodeFlags_UpsideDownArrow = 1 shl 21;


Const
  ImGuiTooltipFlags_None = 0;
  ImGuiTooltipFlags_OverridePrevious = 1 shl 1;


Const
  ImGuiTextFlags_None = 0;
  ImGuiTextFlags_NoWidthForLargeClippedText = 1 shl 0;


Const
  ImGuiTableRowFlags_None = 0;
  ImGuiTableRowFlags_Headers = 1 shl 0;


Const
  ImGuiTableFlags_None = 0;
  ImGuiTableFlags_Resizable = 1 shl 0;
  ImGuiTableFlags_Reorderable = 1 shl 1;
  ImGuiTableFlags_Hideable = 1 shl 2;
  ImGuiTableFlags_Sortable = 1 shl 3;
  ImGuiTableFlags_NoSavedSettings = 1 shl 4;
  ImGuiTableFlags_ContextMenuInBody = 1 shl 5;
  ImGuiTableFlags_RowBg = 1 shl 6;
  ImGuiTableFlags_BordersInnerH = 1 shl 7;
  ImGuiTableFlags_BordersOuterH = 1 shl 8;
  ImGuiTableFlags_BordersInnerV = 1 shl 9;
  ImGuiTableFlags_BordersOuterV = 1 shl 10;
  ImGuiTableFlags_BordersH = ImGuiTableFlags_BordersInnerH or ImGuiTableFlags_BordersOuterH;
  ImGuiTableFlags_BordersV = ImGuiTableFlags_BordersInnerV or ImGuiTableFlags_BordersOuterV;
  ImGuiTableFlags_BordersInner = ImGuiTableFlags_BordersInnerV or ImGuiTableFlags_BordersInnerH;
  ImGuiTableFlags_BordersOuter = ImGuiTableFlags_BordersOuterV or ImGuiTableFlags_BordersOuterH;
  ImGuiTableFlags_Borders = ImGuiTableFlags_BordersInner or ImGuiTableFlags_BordersOuter;
  ImGuiTableFlags_NoBordersInBody = 1 shl 11;
  ImGuiTableFlags_NoBordersInBodyUntilResize = 1 shl 12;
  ImGuiTableFlags_SizingFixedFit = 1 shl 13;
  ImGuiTableFlags_SizingFixedSame = 2 shl 13;
  ImGuiTableFlags_SizingStretchProp = 3 shl 13;
  ImGuiTableFlags_SizingStretchSame = 4 shl 13;
  ImGuiTableFlags_NoHostExtendX = 1 shl 16;
  ImGuiTableFlags_NoHostExtendY = 1 shl 17;
  ImGuiTableFlags_NoKeepColumnsVisible = 1 shl 18;
  ImGuiTableFlags_PreciseWidths = 1 shl 19;
  ImGuiTableFlags_NoClip = 1 shl 20;
  ImGuiTableFlags_PadOuterX = 1 shl 21;
  ImGuiTableFlags_NoPadOuterX = 1 shl 22;
  ImGuiTableFlags_NoPadInnerX = 1 shl 23;
  ImGuiTableFlags_ScrollX = 1 shl 24;
  ImGuiTableFlags_ScrollY = 1 shl 25;
  ImGuiTableFlags_SortMulti = 1 shl 26;
  ImGuiTableFlags_SortTristate = 1 shl 27;
  ImGuiTableFlags_HighlightHoveredColumn = 1 shl 28;
  ImGuiTableFlags_SizingMask_ = ImGuiTableFlags_SizingFixedFit or ImGuiTableFlags_SizingFixedSame or ImGuiTableFlags_SizingStretchProp or ImGuiTableFlags_SizingStretchSame;


Const
  ImGuiTableColumnFlags_None = 0;
  ImGuiTableColumnFlags_Disabled = 1 shl 0;
  ImGuiTableColumnFlags_DefaultHide = 1 shl 1;
  ImGuiTableColumnFlags_DefaultSort = 1 shl 2;
  ImGuiTableColumnFlags_WidthStretch = 1 shl 3;
  ImGuiTableColumnFlags_WidthFixed = 1 shl 4;
  ImGuiTableColumnFlags_NoResize = 1 shl 5;
  ImGuiTableColumnFlags_NoReorder = 1 shl 6;
  ImGuiTableColumnFlags_NoHide = 1 shl 7;
  ImGuiTableColumnFlags_NoClip = 1 shl 8;
  ImGuiTableColumnFlags_NoSort = 1 shl 9;
  ImGuiTableColumnFlags_NoSortAscending = 1 shl 10;
  ImGuiTableColumnFlags_NoSortDescending = 1 shl 11;
  ImGuiTableColumnFlags_NoHeaderLabel = 1 shl 12;
  ImGuiTableColumnFlags_NoHeaderWidth = 1 shl 13;
  ImGuiTableColumnFlags_PreferSortAscending = 1 shl 14;
  ImGuiTableColumnFlags_PreferSortDescending = 1 shl 15;
  ImGuiTableColumnFlags_IndentEnable = 1 shl 16;
  ImGuiTableColumnFlags_IndentDisable = 1 shl 17;
  ImGuiTableColumnFlags_AngledHeader = 1 shl 18;
  ImGuiTableColumnFlags_IsEnabled = 1 shl 24;
  ImGuiTableColumnFlags_IsVisible = 1 shl 25;
  ImGuiTableColumnFlags_IsSorted = 1 shl 26;
  ImGuiTableColumnFlags_IsHovered = 1 shl 27;
  ImGuiTableColumnFlags_WidthMask_ = ImGuiTableColumnFlags_WidthStretch or ImGuiTableColumnFlags_WidthFixed;
  ImGuiTableColumnFlags_IndentMask_ = ImGuiTableColumnFlags_IndentEnable or ImGuiTableColumnFlags_IndentDisable;
  ImGuiTableColumnFlags_StatusMask_ = ImGuiTableColumnFlags_IsEnabled or ImGuiTableColumnFlags_IsVisible or ImGuiTableColumnFlags_IsSorted or ImGuiTableColumnFlags_IsHovered;
  ImGuiTableColumnFlags_NoDirectResize_ = 1 shl 30;


Const
  ImGuiTableBgTarget_None = 0;
  ImGuiTableBgTarget_RowBg0 = 1;
  ImGuiTableBgTarget_RowBg1 = 2;
  ImGuiTableBgTarget_CellBg = 3;


Const
  ImGuiTabItemFlags_None = 0;
  ImGuiTabItemFlags_UnsavedDocument = 1 shl 0;
  ImGuiTabItemFlags_SetSelected = 1 shl 1;
  ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 1 shl 2;
  ImGuiTabItemFlags_NoPushId = 1 shl 3;
  ImGuiTabItemFlags_NoTooltip = 1 shl 4;
  ImGuiTabItemFlags_NoReorder = 1 shl 5;
  ImGuiTabItemFlags_Leading = 1 shl 6;
  ImGuiTabItemFlags_Trailing = 1 shl 7;


Const
  ImGuiTabItemFlags_SectionMask_ = ImGuiTabItemFlags_Leading or ImGuiTabItemFlags_Trailing;
  ImGuiTabItemFlags_NoCloseButton = 1 shl 20;
  ImGuiTabItemFlags_Button = 1 shl 21;
  ImGuiTabItemFlags_Unsorted = 1 shl 22;


Const
  ImGuiTabBarFlags_None = 0;
  ImGuiTabBarFlags_Reorderable = 1 shl 0;
  ImGuiTabBarFlags_AutoSelectNewTabs = 1 shl 1;
  ImGuiTabBarFlags_TabListPopupButton = 1 shl 2;
  ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 1 shl 3;
  ImGuiTabBarFlags_NoTabListScrollingButtons = 1 shl 4;
  ImGuiTabBarFlags_NoTooltip = 1 shl 5;
  ImGuiTabBarFlags_FittingPolicyResizeDown = 1 shl 6;
  ImGuiTabBarFlags_FittingPolicyScroll = 1 shl 7;
  ImGuiTabBarFlags_FittingPolicyMask_ = ImGuiTabBarFlags_FittingPolicyResizeDown or ImGuiTabBarFlags_FittingPolicyScroll;
  ImGuiTabBarFlags_FittingPolicyDefault_ = ImGuiTabBarFlags_FittingPolicyResizeDown;


Const
  ImGuiTabBarFlags_DockNode = 1 shl 20;
  ImGuiTabBarFlags_IsFocused = 1 shl 21;
  ImGuiTabBarFlags_SaveSettings = 1 shl 22;


Const
  ImGuiStyleVar_Alpha = 0;
  ImGuiStyleVar_DisabledAlpha = 1;
  ImGuiStyleVar_WindowPadding = 2;
  ImGuiStyleVar_WindowRounding = 3;
  ImGuiStyleVar_WindowBorderSize = 4;
  ImGuiStyleVar_WindowMinSize = 5;
  ImGuiStyleVar_WindowTitleAlign = 6;
  ImGuiStyleVar_ChildRounding = 7;
  ImGuiStyleVar_ChildBorderSize = 8;
  ImGuiStyleVar_PopupRounding = 9;
  ImGuiStyleVar_PopupBorderSize = 10;
  ImGuiStyleVar_FramePadding = 11;
  ImGuiStyleVar_FrameRounding = 12;
  ImGuiStyleVar_FrameBorderSize = 13;
  ImGuiStyleVar_ItemSpacing = 14;
  ImGuiStyleVar_ItemInnerSpacing = 15;
  ImGuiStyleVar_IndentSpacing = 16;
  ImGuiStyleVar_CellPadding = 17;
  ImGuiStyleVar_ScrollbarSize = 18;
  ImGuiStyleVar_ScrollbarRounding = 19;
  ImGuiStyleVar_GrabMinSize = 20;
  ImGuiStyleVar_GrabRounding = 21;
  ImGuiStyleVar_TabRounding = 22;
  ImGuiStyleVar_TabBarBorderSize = 23;
  ImGuiStyleVar_ButtonTextAlign = 24;
  ImGuiStyleVar_SelectableTextAlign = 25;
  ImGuiStyleVar_SeparatorTextBorderSize = 26;
  ImGuiStyleVar_SeparatorTextAlign = 27;
  ImGuiStyleVar_SeparatorTextPadding = 28;
  ImGuiStyleVar_DockingSeparatorSize = 29;
  ImGuiStyleVar_COUNT = 30;


Const
  ImGuiSortDirection_None = 0;
  ImGuiSortDirection_Ascending = 1;
  ImGuiSortDirection_Descending = 2;


Const
  ImGuiSliderFlags_None = 0;
  ImGuiSliderFlags_AlwaysClamp = 1 shl 4;
  ImGuiSliderFlags_Logarithmic = 1 shl 5;
  ImGuiSliderFlags_NoRoundToFormat = 1 shl 6;
  ImGuiSliderFlags_NoInput = 1 shl 7;
  ImGuiSliderFlags_InvalidMask_ = $7000000F;


Const
  ImGuiSliderFlags_Vertical = 1 shl 20;
  ImGuiSliderFlags_ReadOnly = 1 shl 21;


Const
  ImGuiSeparatorFlags_None = 0;
  ImGuiSeparatorFlags_Horizontal = 1 shl 0;
  ImGuiSeparatorFlags_Vertical = 1 shl 1;
  ImGuiSeparatorFlags_SpanAllColumns = 1 shl 2;


Const
  ImGuiSelectableFlags_None = 0;
  ImGuiSelectableFlags_DontClosePopups = 1 shl 0;
  ImGuiSelectableFlags_SpanAllColumns = 1 shl 1;
  ImGuiSelectableFlags_AllowDoubleClick = 1 shl 2;
  ImGuiSelectableFlags_Disabled = 1 shl 3;
  ImGuiSelectableFlags_AllowOverlap = 1 shl 4;


Const
  ImGuiSelectableFlags_NoHoldingActiveID = 1 shl 20;
  ImGuiSelectableFlags_SelectOnNav = 1 shl 21;
  ImGuiSelectableFlags_SelectOnClick = 1 shl 22;
  ImGuiSelectableFlags_SelectOnRelease = 1 shl 23;
  ImGuiSelectableFlags_SpanAvailWidth = 1 shl 24;
  ImGuiSelectableFlags_SetNavIdOnHover = 1 shl 25;
  ImGuiSelectableFlags_NoPadWithHalfSpacing = 1 shl 26;
  ImGuiSelectableFlags_NoSetKeyOwner = 1 shl 27;


Const
  ImGuiScrollFlags_None = 0;
  ImGuiScrollFlags_KeepVisibleEdgeX = 1 shl 0;
  ImGuiScrollFlags_KeepVisibleEdgeY = 1 shl 1;
  ImGuiScrollFlags_KeepVisibleCenterX = 1 shl 2;
  ImGuiScrollFlags_KeepVisibleCenterY = 1 shl 3;
  ImGuiScrollFlags_AlwaysCenterX = 1 shl 4;
  ImGuiScrollFlags_AlwaysCenterY = 1 shl 5;
  ImGuiScrollFlags_NoScrollParent = 1 shl 6;
  ImGuiScrollFlags_MaskX_ = ImGuiScrollFlags_KeepVisibleEdgeX or ImGuiScrollFlags_KeepVisibleCenterX or ImGuiScrollFlags_AlwaysCenterX;
  ImGuiScrollFlags_MaskY_ = ImGuiScrollFlags_KeepVisibleEdgeY or ImGuiScrollFlags_KeepVisibleCenterY or ImGuiScrollFlags_AlwaysCenterY;


Const
  ImGuiPopupPositionPolicy_Default = 0;
  ImGuiPopupPositionPolicy_ComboBox = 1;
  ImGuiPopupPositionPolicy_Tooltip = 2;


Const
  ImGuiPopupFlags_None = 0;
  ImGuiPopupFlags_MouseButtonLeft = 0;
  ImGuiPopupFlags_MouseButtonRight = 1;
  ImGuiPopupFlags_MouseButtonMiddle = 2;
  ImGuiPopupFlags_MouseButtonMask_ = $1F;
  ImGuiPopupFlags_MouseButtonDefault_ = 1;
  ImGuiPopupFlags_NoOpenOverExistingPopup = 1 shl 5;
  ImGuiPopupFlags_NoOpenOverItems = 1 shl 6;
  ImGuiPopupFlags_AnyPopupId = 1 shl 7;
  ImGuiPopupFlags_AnyPopupLevel = 1 shl 8;
  ImGuiPopupFlags_AnyPopup = ImGuiPopupFlags_AnyPopupId or ImGuiPopupFlags_AnyPopupLevel;


Const
  ImGuiPlotType_Lines = 0;
  ImGuiPlotType_Histogram = 1;


Const
  ImGuiOldColumnFlags_None = 0;
  ImGuiOldColumnFlags_NoBorder = 1 shl 0;
  ImGuiOldColumnFlags_NoResize = 1 shl 1;
  ImGuiOldColumnFlags_NoPreserveWidths = 1 shl 2;
  ImGuiOldColumnFlags_NoForceWithinWindow = 1 shl 3;
  ImGuiOldColumnFlags_GrowParentContentsSize = 1 shl 4;


Const
  ImGuiNextWindowDataFlags_None = 0;
  ImGuiNextWindowDataFlags_HasPos = 1 shl 0;
  ImGuiNextWindowDataFlags_HasSize = 1 shl 1;
  ImGuiNextWindowDataFlags_HasContentSize = 1 shl 2;
  ImGuiNextWindowDataFlags_HasCollapsed = 1 shl 3;
  ImGuiNextWindowDataFlags_HasSizeConstraint = 1 shl 4;
  ImGuiNextWindowDataFlags_HasFocus = 1 shl 5;
  ImGuiNextWindowDataFlags_HasBgAlpha = 1 shl 6;
  ImGuiNextWindowDataFlags_HasScroll = 1 shl 7;
  ImGuiNextWindowDataFlags_HasChildFlags = 1 shl 8;
  ImGuiNextWindowDataFlags_HasViewport = 1 shl 9;
  ImGuiNextWindowDataFlags_HasDock = 1 shl 10;
  ImGuiNextWindowDataFlags_HasWindowClass = 1 shl 11;


Const
  ImGuiNextItemDataFlags_None = 0;
  ImGuiNextItemDataFlags_HasWidth = 1 shl 0;
  ImGuiNextItemDataFlags_HasOpen = 1 shl 1;


Const
  ImGuiNavMoveFlags_None = 0;
  ImGuiNavMoveFlags_LoopX = 1 shl 0;
  ImGuiNavMoveFlags_LoopY = 1 shl 1;
  ImGuiNavMoveFlags_WrapX = 1 shl 2;
  ImGuiNavMoveFlags_WrapY = 1 shl 3;
  ImGuiNavMoveFlags_WrapMask_ = ImGuiNavMoveFlags_LoopX or ImGuiNavMoveFlags_LoopY or ImGuiNavMoveFlags_WrapX or ImGuiNavMoveFlags_WrapY;
  ImGuiNavMoveFlags_AllowCurrentNavId = 1 shl 4;
  ImGuiNavMoveFlags_AlsoScoreVisibleSet = 1 shl 5;
  ImGuiNavMoveFlags_ScrollToEdgeY = 1 shl 6;
  ImGuiNavMoveFlags_Forwarded = 1 shl 7;
  ImGuiNavMoveFlags_DebugNoResult = 1 shl 8;
  ImGuiNavMoveFlags_FocusApi = 1 shl 9;
  ImGuiNavMoveFlags_IsTabbing = 1 shl 10;
  ImGuiNavMoveFlags_IsPageMove = 1 shl 11;
  ImGuiNavMoveFlags_Activate = 1 shl 12;
  ImGuiNavMoveFlags_NoSelect = 1 shl 13;
  ImGuiNavMoveFlags_NoSetNavHighlight = 1 shl 14;


Const
  ImGuiNavLayer_Main = 0;
  ImGuiNavLayer_Menu = 1;
  ImGuiNavLayer_COUNT = 2;


Const
  ImGuiNavHighlightFlags_None = 0;
  ImGuiNavHighlightFlags_TypeDefault = 1 shl 0;
  ImGuiNavHighlightFlags_TypeThin = 1 shl 1;
  ImGuiNavHighlightFlags_AlwaysDraw = 1 shl 2;
  ImGuiNavHighlightFlags_NoRounding = 1 shl 3;


Const
  ImGuiMouseSource_Mouse = 0;
  ImGuiMouseSource_TouchScreen = 1;
  ImGuiMouseSource_Pen = 2;
  ImGuiMouseSource_COUNT = 3;


Const
  ImGuiMouseCursor_None = -1;
  ImGuiMouseCursor_Arrow = 0;
  ImGuiMouseCursor_TextInput = 1;
  ImGuiMouseCursor_ResizeAll = 2;
  ImGuiMouseCursor_ResizeNS = 3;
  ImGuiMouseCursor_ResizeEW = 4;
  ImGuiMouseCursor_ResizeNESW = 5;
  ImGuiMouseCursor_ResizeNWSE = 6;
  ImGuiMouseCursor_Hand = 7;
  ImGuiMouseCursor_NotAllowed = 8;
  ImGuiMouseCursor_COUNT = 9;


Const
  ImGuiMouseButton_Left = 0;
  ImGuiMouseButton_Right = 1;
  ImGuiMouseButton_Middle = 2;
  ImGuiMouseButton_COUNT = 5;


Const
  ImGuiLogType_None = 0;
  ImGuiLogType_TTY = 1;
  ImGuiLogType_File = 2;
  ImGuiLogType_Buffer = 3;
  ImGuiLogType_Clipboard = 4;


Const
  ImGuiLocKey_VersionStr = 0;
  ImGuiLocKey_TableSizeOne = 1;
  ImGuiLocKey_TableSizeAllFit = 2;
  ImGuiLocKey_TableSizeAllDefault = 3;
  ImGuiLocKey_TableResetOrder = 4;
  ImGuiLocKey_WindowingMainMenuBar = 5;
  ImGuiLocKey_WindowingPopup = 6;
  ImGuiLocKey_WindowingUntitled = 7;
  ImGuiLocKey_DockingHideTabBar = 8;
  ImGuiLocKey_DockingHoldShiftToDock = 9;
  ImGuiLocKey_DockingDragToUndockOrMoveNode = 10;
  ImGuiLocKey_COUNT = 11;


Const
  ImGuiLayoutType_Horizontal = 0;
  ImGuiLayoutType_Vertical = 1;


Const
  ImGuiKey_None = 0;
  ImGuiKey_Tab = 512;
  ImGuiKey_LeftArrow = 513;
  ImGuiKey_RightArrow = 514;
  ImGuiKey_UpArrow = 515;
  ImGuiKey_DownArrow = 516;
  ImGuiKey_PageUp = 517;
  ImGuiKey_PageDown = 518;
  ImGuiKey_Home = 519;
  ImGuiKey_End = 520;
  ImGuiKey_Insert = 521;
  ImGuiKey_Delete = 522;
  ImGuiKey_Backspace = 523;
  ImGuiKey_Space = 524;
  ImGuiKey_Enter = 525;
  ImGuiKey_Escape = 526;
  ImGuiKey_LeftCtrl = 527;
  ImGuiKey_LeftShift = 528;
  ImGuiKey_LeftAlt = 529;
  ImGuiKey_LeftSuper = 530;
  ImGuiKey_RightCtrl = 531;
  ImGuiKey_RightShift = 532;
  ImGuiKey_RightAlt = 533;
  ImGuiKey_RightSuper = 534;
  ImGuiKey_Menu = 535;
  ImGuiKey_0 = 536;
  ImGuiKey_1 = 537;
  ImGuiKey_2 = 538;
  ImGuiKey_3 = 539;
  ImGuiKey_4 = 540;
  ImGuiKey_5 = 541;
  ImGuiKey_6 = 542;
  ImGuiKey_7 = 543;
  ImGuiKey_8 = 544;
  ImGuiKey_9 = 545;
  ImGuiKey_A = 546;
  ImGuiKey_B = 547;
  ImGuiKey_C = 548;
  ImGuiKey_D = 549;
  ImGuiKey_E = 550;
  ImGuiKey_F = 551;
  ImGuiKey_G = 552;
  ImGuiKey_H = 553;
  ImGuiKey_I = 554;
  ImGuiKey_J = 555;
  ImGuiKey_K = 556;
  ImGuiKey_L = 557;
  ImGuiKey_M = 558;
  ImGuiKey_N = 559;
  ImGuiKey_O = 560;
  ImGuiKey_P = 561;
  ImGuiKey_Q = 562;
  ImGuiKey_R = 563;
  ImGuiKey_S = 564;
  ImGuiKey_T = 565;
  ImGuiKey_U = 566;
  ImGuiKey_V = 567;
  ImGuiKey_W = 568;
  ImGuiKey_X = 569;
  ImGuiKey_Y = 570;
  ImGuiKey_Z = 571;
  ImGuiKey_F1 = 572;
  ImGuiKey_F2 = 573;
  ImGuiKey_F3 = 574;
  ImGuiKey_F4 = 575;
  ImGuiKey_F5 = 576;
  ImGuiKey_F6 = 577;
  ImGuiKey_F7 = 578;
  ImGuiKey_F8 = 579;
  ImGuiKey_F9 = 580;
  ImGuiKey_F10 = 581;
  ImGuiKey_F11 = 582;
  ImGuiKey_F12 = 583;
  ImGuiKey_F13 = 584;
  ImGuiKey_F14 = 585;
  ImGuiKey_F15 = 586;
  ImGuiKey_F16 = 587;
  ImGuiKey_F17 = 588;
  ImGuiKey_F18 = 589;
  ImGuiKey_F19 = 590;
  ImGuiKey_F20 = 591;
  ImGuiKey_F21 = 592;
  ImGuiKey_F22 = 593;
  ImGuiKey_F23 = 594;
  ImGuiKey_F24 = 595;
  ImGuiKey_Apostrophe = 596;
  ImGuiKey_Comma = 597;
  ImGuiKey_Minus = 598;
  ImGuiKey_Period = 599;
  ImGuiKey_Slash = 600;
  ImGuiKey_Semicolon = 601;
  ImGuiKey_Equal = 602;
  ImGuiKey_LeftBracket = 603;
  ImGuiKey_Backslash = 604;
  ImGuiKey_RightBracket = 605;
  ImGuiKey_GraveAccent = 606;
  ImGuiKey_CapsLock = 607;
  ImGuiKey_ScrollLock = 608;
  ImGuiKey_NumLock = 609;
  ImGuiKey_PrintScreen = 610;
  ImGuiKey_Pause = 611;
  ImGuiKey_Keypad0 = 612;
  ImGuiKey_Keypad1 = 613;
  ImGuiKey_Keypad2 = 614;
  ImGuiKey_Keypad3 = 615;
  ImGuiKey_Keypad4 = 616;
  ImGuiKey_Keypad5 = 617;
  ImGuiKey_Keypad6 = 618;
  ImGuiKey_Keypad7 = 619;
  ImGuiKey_Keypad8 = 620;
  ImGuiKey_Keypad9 = 621;
  ImGuiKey_KeypadDecimal = 622;
  ImGuiKey_KeypadDivide = 623;
  ImGuiKey_KeypadMultiply = 624;
  ImGuiKey_KeypadSubtract = 625;
  ImGuiKey_KeypadAdd = 626;
  ImGuiKey_KeypadEnter = 627;
  ImGuiKey_KeypadEqual = 628;
  ImGuiKey_AppBack = 629;
  ImGuiKey_AppForward = 630;
  ImGuiKey_GamepadStart = 631;
  ImGuiKey_GamepadBack = 632;
  ImGuiKey_GamepadFaceLeft = 633;
  ImGuiKey_GamepadFaceRight = 634;
  ImGuiKey_GamepadFaceUp = 635;
  ImGuiKey_GamepadFaceDown = 636;
  ImGuiKey_GamepadDpadLeft = 637;
  ImGuiKey_GamepadDpadRight = 638;
  ImGuiKey_GamepadDpadUp = 639;
  ImGuiKey_GamepadDpadDown = 640;
  ImGuiKey_GamepadL1 = 641;
  ImGuiKey_GamepadR1 = 642;
  ImGuiKey_GamepadL2 = 643;
  ImGuiKey_GamepadR2 = 644;
  ImGuiKey_GamepadL3 = 645;
  ImGuiKey_GamepadR3 = 646;
  ImGuiKey_GamepadLStickLeft = 647;
  ImGuiKey_GamepadLStickRight = 648;
  ImGuiKey_GamepadLStickUp = 649;
  ImGuiKey_GamepadLStickDown = 650;
  ImGuiKey_GamepadRStickLeft = 651;
  ImGuiKey_GamepadRStickRight = 652;
  ImGuiKey_GamepadRStickUp = 653;
  ImGuiKey_GamepadRStickDown = 654;
  ImGuiKey_MouseLeft = 655;
  ImGuiKey_MouseRight = 656;
  ImGuiKey_MouseMiddle = 657;
  ImGuiKey_MouseX1 = 658;
  ImGuiKey_MouseX2 = 659;
  ImGuiKey_MouseWheelX = 660;
  ImGuiKey_MouseWheelY = 661;
  ImGuiKey_ReservedForModCtrl = 662;
  ImGuiKey_ReservedForModShift = 663;
  ImGuiKey_ReservedForModAlt = 664;
  ImGuiKey_ReservedForModSuper = 665;
  ImGuiKey_COUNT = 666;
  ImGuiMod_None = 0;
  ImGuiMod_Ctrl = 1 shl 12;
  ImGuiMod_Shift = 1 shl 13;
  ImGuiMod_Alt = 1 shl 14;
  ImGuiMod_Super = 1 shl 15;
  ImGuiMod_Shortcut = 1 shl 11;
  ImGuiMod_Mask_ = $F800;
  ImGuiKey_NamedKey_BEGIN = 512;
  ImGuiKey_NamedKey_END = ImGuiKey_COUNT;
  ImGuiKey_NamedKey_COUNT = ImGuiKey_NamedKey_END - ImGuiKey_NamedKey_BEGIN;
  ImGuiKey_KeysData_SIZE = ImGuiKey_NamedKey_COUNT;
  ImGuiKey_KeysData_OFFSET = ImGuiKey_NamedKey_BEGIN;


Const
  ImGuiItemStatusFlags_None = 0;
  ImGuiItemStatusFlags_HoveredRect = 1 shl 0;
  ImGuiItemStatusFlags_HasDisplayRect = 1 shl 1;
  ImGuiItemStatusFlags_Edited = 1 shl 2;
  ImGuiItemStatusFlags_ToggledSelection = 1 shl 3;
  ImGuiItemStatusFlags_ToggledOpen = 1 shl 4;
  ImGuiItemStatusFlags_HasDeactivated = 1 shl 5;
  ImGuiItemStatusFlags_Deactivated = 1 shl 6;
  ImGuiItemStatusFlags_HoveredWindow = 1 shl 7;
  ImGuiItemStatusFlags_FocusedByTabbing = 1 shl 8;
  ImGuiItemStatusFlags_Visible = 1 shl 9;


Const
  ImGuiItemFlags_None = 0;
  ImGuiItemFlags_NoTabStop = 1 shl 0;
  ImGuiItemFlags_ButtonRepeat = 1 shl 1;
  ImGuiItemFlags_Disabled = 1 shl 2;
  ImGuiItemFlags_NoNav = 1 shl 3;
  ImGuiItemFlags_NoNavDefaultFocus = 1 shl 4;
  ImGuiItemFlags_SelectableDontClosePopup = 1 shl 5;
  ImGuiItemFlags_MixedValue = 1 shl 6;
  ImGuiItemFlags_ReadOnly = 1 shl 7;
  ImGuiItemFlags_NoWindowHoverableCheck = 1 shl 8;
  ImGuiItemFlags_AllowOverlap = 1 shl 9;
  ImGuiItemFlags_Inputable = 1 shl 10;
  ImGuiItemFlags_HasSelectionUserData = 1 shl 11;


Const
  ImGuiInputTextFlags_None = 0;
  ImGuiInputTextFlags_CharsDecimal = 1 shl 0;
  ImGuiInputTextFlags_CharsHexadecimal = 1 shl 1;
  ImGuiInputTextFlags_CharsUppercase = 1 shl 2;
  ImGuiInputTextFlags_CharsNoBlank = 1 shl 3;
  ImGuiInputTextFlags_AutoSelectAll = 1 shl 4;
  ImGuiInputTextFlags_EnterReturnsTrue = 1 shl 5;
  ImGuiInputTextFlags_CallbackCompletion = 1 shl 6;
  ImGuiInputTextFlags_CallbackHistory = 1 shl 7;
  ImGuiInputTextFlags_CallbackAlways = 1 shl 8;
  ImGuiInputTextFlags_CallbackCharFilter = 1 shl 9;
  ImGuiInputTextFlags_AllowTabInput = 1 shl 10;
  ImGuiInputTextFlags_CtrlEnterForNewLine = 1 shl 11;
  ImGuiInputTextFlags_NoHorizontalScroll = 1 shl 12;
  ImGuiInputTextFlags_AlwaysOverwrite = 1 shl 13;
  ImGuiInputTextFlags_ReadOnly = 1 shl 14;
  ImGuiInputTextFlags_Password = 1 shl 15;
  ImGuiInputTextFlags_NoUndoRedo = 1 shl 16;
  ImGuiInputTextFlags_CharsScientific = 1 shl 17;
  ImGuiInputTextFlags_CallbackResize = 1 shl 18;
  ImGuiInputTextFlags_CallbackEdit = 1 shl 19;
  ImGuiInputTextFlags_EscapeClearsAll = 1 shl 20;


Const
  ImGuiInputTextFlags_Multiline = 1 shl 26;
  ImGuiInputTextFlags_NoMarkEdited = 1 shl 27;
  ImGuiInputTextFlags_MergedItem = 1 shl 28;


Const
  ImGuiInputSource_None = 0;
  ImGuiInputSource_Mouse = 1;
  ImGuiInputSource_Keyboard = 2;
  ImGuiInputSource_Gamepad = 3;
  ImGuiInputSource_Clipboard = 4;
  ImGuiInputSource_COUNT = 5;


Const
  ImGuiInputFlags_None = 0;
  ImGuiInputFlags_Repeat = 1 shl 0;
  ImGuiInputFlags_RepeatRateDefault = 1 shl 1;
  ImGuiInputFlags_RepeatRateNavMove = 1 shl 2;
  ImGuiInputFlags_RepeatRateNavTweak = 1 shl 3;
  ImGuiInputFlags_RepeatRateMask_ = ImGuiInputFlags_RepeatRateDefault or ImGuiInputFlags_RepeatRateNavMove or ImGuiInputFlags_RepeatRateNavTweak;
  ImGuiInputFlags_CondHovered = 1 shl 4;
  ImGuiInputFlags_CondActive = 1 shl 5;
  ImGuiInputFlags_CondDefault_ = ImGuiInputFlags_CondHovered or ImGuiInputFlags_CondActive;
  ImGuiInputFlags_CondMask_ = ImGuiInputFlags_CondHovered or ImGuiInputFlags_CondActive;
  ImGuiInputFlags_LockThisFrame = 1 shl 6;
  ImGuiInputFlags_LockUntilRelease = 1 shl 7;
  ImGuiInputFlags_RouteFocused = 1 shl 8;
  ImGuiInputFlags_RouteGlobalLow = 1 shl 9;
  ImGuiInputFlags_RouteGlobal = 1 shl 10;
  ImGuiInputFlags_RouteGlobalHigh = 1 shl 11;
  ImGuiInputFlags_RouteMask_ = ImGuiInputFlags_RouteFocused or ImGuiInputFlags_RouteGlobal or ImGuiInputFlags_RouteGlobalLow or ImGuiInputFlags_RouteGlobalHigh;
  ImGuiInputFlags_RouteAlways = 1 shl 12;
  ImGuiInputFlags_RouteUnlessBgFocused = 1 shl 13;
  ImGuiInputFlags_RouteExtraMask_ = ImGuiInputFlags_RouteAlways or ImGuiInputFlags_RouteUnlessBgFocused;
  ImGuiInputFlags_SupportedByIsKeyPressed = ImGuiInputFlags_Repeat or ImGuiInputFlags_RepeatRateMask_;
  ImGuiInputFlags_SupportedByShortcut = ImGuiInputFlags_Repeat or ImGuiInputFlags_RepeatRateMask_ or ImGuiInputFlags_RouteMask_ or ImGuiInputFlags_RouteExtraMask_;
  ImGuiInputFlags_SupportedBySetKeyOwner = ImGuiInputFlags_LockThisFrame or ImGuiInputFlags_LockUntilRelease;
  ImGuiInputFlags_SupportedBySetItemKeyOwner = ImGuiInputFlags_SupportedBySetKeyOwner or ImGuiInputFlags_CondMask_;


Const
  ImGuiInputEventType_None = 0;
  ImGuiInputEventType_MousePos = 1;
  ImGuiInputEventType_MouseWheel = 2;
  ImGuiInputEventType_MouseButton = 3;
  ImGuiInputEventType_MouseViewport = 4;
  ImGuiInputEventType_Key = 5;
  ImGuiInputEventType_Text = 6;
  ImGuiInputEventType_Focus = 7;
  ImGuiInputEventType_COUNT = 8;


Const
  ImGuiHoveredFlags_None = 0;
  ImGuiHoveredFlags_ChildWindows = 1 shl 0;
  ImGuiHoveredFlags_RootWindow = 1 shl 1;
  ImGuiHoveredFlags_AnyWindow = 1 shl 2;
  ImGuiHoveredFlags_NoPopupHierarchy = 1 shl 3;
  ImGuiHoveredFlags_DockHierarchy = 1 shl 4;
  ImGuiHoveredFlags_AllowWhenBlockedByPopup = 1 shl 5;
  ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 1 shl 7;
  ImGuiHoveredFlags_AllowWhenOverlappedByItem = 1 shl 8;
  ImGuiHoveredFlags_AllowWhenOverlappedByWindow = 1 shl 9;
  ImGuiHoveredFlags_AllowWhenDisabled = 1 shl 10;
  ImGuiHoveredFlags_NoNavOverride = 1 shl 11;
  ImGuiHoveredFlags_AllowWhenOverlapped = ImGuiHoveredFlags_AllowWhenOverlappedByItem or ImGuiHoveredFlags_AllowWhenOverlappedByWindow;
  ImGuiHoveredFlags_RectOnly = ImGuiHoveredFlags_AllowWhenBlockedByPopup or ImGuiHoveredFlags_AllowWhenBlockedByActiveItem or ImGuiHoveredFlags_AllowWhenOverlapped;
  ImGuiHoveredFlags_RootAndChildWindows = ImGuiHoveredFlags_RootWindow or ImGuiHoveredFlags_ChildWindows;
  ImGuiHoveredFlags_ForTooltip = 1 shl 12;
  ImGuiHoveredFlags_Stationary = 1 shl 13;
  ImGuiHoveredFlags_DelayNone = 1 shl 14;
  ImGuiHoveredFlags_DelayShort = 1 shl 15;
  ImGuiHoveredFlags_DelayNormal = 1 shl 16;
  ImGuiHoveredFlags_NoSharedDelay = 1 shl 17;


Const
  ImGuiHoveredFlags_DelayMask_ = ImGuiHoveredFlags_DelayNone or ImGuiHoveredFlags_DelayShort or ImGuiHoveredFlags_DelayNormal or ImGuiHoveredFlags_NoSharedDelay;
  ImGuiHoveredFlags_AllowedMaskForIsWindowHovered = ImGuiHoveredFlags_ChildWindows or ImGuiHoveredFlags_RootWindow or ImGuiHoveredFlags_AnyWindow or ImGuiHoveredFlags_NoPopupHierarchy or ImGuiHoveredFlags_DockHierarchy or ImGuiHoveredFlags_AllowWhenBlockedByPopup or ImGuiHoveredFlags_AllowWhenBlockedByActiveItem or ImGuiHoveredFlags_ForTooltip or ImGuiHoveredFlags_Stationary;
  ImGuiHoveredFlags_AllowedMaskForIsItemHovered = ImGuiHoveredFlags_AllowWhenBlockedByPopup or ImGuiHoveredFlags_AllowWhenBlockedByActiveItem or ImGuiHoveredFlags_AllowWhenOverlapped or ImGuiHoveredFlags_AllowWhenDisabled or ImGuiHoveredFlags_NoNavOverride or ImGuiHoveredFlags_ForTooltip or ImGuiHoveredFlags_Stationary or ImGuiHoveredFlags_DelayMask_;


Const
  ImGuiFocusedFlags_None = 0;
  ImGuiFocusedFlags_ChildWindows = 1 shl 0;
  ImGuiFocusedFlags_RootWindow = 1 shl 1;
  ImGuiFocusedFlags_AnyWindow = 1 shl 2;
  ImGuiFocusedFlags_NoPopupHierarchy = 1 shl 3;
  ImGuiFocusedFlags_DockHierarchy = 1 shl 4;
  ImGuiFocusedFlags_RootAndChildWindows = ImGuiFocusedFlags_RootWindow or ImGuiFocusedFlags_ChildWindows;


Const
  ImGuiFocusRequestFlags_None = 0;
  ImGuiFocusRequestFlags_RestoreFocusedChild = 1 shl 0;
  ImGuiFocusRequestFlags_UnlessBelowModal = 1 shl 1;


Const
  ImGuiDragDropFlags_None = 0;
  ImGuiDragDropFlags_SourceNoPreviewTooltip = 1 shl 0;
  ImGuiDragDropFlags_SourceNoDisableHover = 1 shl 1;
  ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 1 shl 2;
  ImGuiDragDropFlags_SourceAllowNullID = 1 shl 3;
  ImGuiDragDropFlags_SourceExtern = 1 shl 4;
  ImGuiDragDropFlags_SourceAutoExpirePayload = 1 shl 5;
  ImGuiDragDropFlags_AcceptBeforeDelivery = 1 shl 10;
  ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 1 shl 11;
  ImGuiDragDropFlags_AcceptNoPreviewTooltip = 1 shl 12;
  ImGuiDragDropFlags_AcceptPeekOnly = ImGuiDragDropFlags_AcceptBeforeDelivery or ImGuiDragDropFlags_AcceptNoDrawDefaultRect;


Const
  ImGuiDockNodeState_Unknown = 0;
  ImGuiDockNodeState_HostWindowHiddenBecauseSingleWindow = 1;
  ImGuiDockNodeState_HostWindowHiddenBecauseWindowsAreResizing = 2;
  ImGuiDockNodeState_HostWindowVisible = 3;


Const
  ImGuiDockNodeFlags_None = 0;
  ImGuiDockNodeFlags_KeepAliveOnly = 1 shl 0;
  ImGuiDockNodeFlags_NoDockingOverCentralNode = 1 shl 2;
  ImGuiDockNodeFlags_PassthruCentralNode = 1 shl 3;
  ImGuiDockNodeFlags_NoDockingSplit = 1 shl 4;
  ImGuiDockNodeFlags_NoResize = 1 shl 5;
  ImGuiDockNodeFlags_AutoHideTabBar = 1 shl 6;
  ImGuiDockNodeFlags_NoUndocking = 1 shl 7;


Const
  ImGuiDockNodeFlags_DockSpace = 1 shl 10;
  ImGuiDockNodeFlags_CentralNode = 1 shl 11;
  ImGuiDockNodeFlags_NoTabBar = 1 shl 12;
  ImGuiDockNodeFlags_HiddenTabBar = 1 shl 13;
  ImGuiDockNodeFlags_NoWindowMenuButton = 1 shl 14;
  ImGuiDockNodeFlags_NoCloseButton = 1 shl 15;
  ImGuiDockNodeFlags_NoResizeX = 1 shl 16;
  ImGuiDockNodeFlags_NoResizeY = 1 shl 17;
  ImGuiDockNodeFlags_NoDockingSplitOther = 1 shl 19;
  ImGuiDockNodeFlags_NoDockingOverMe = 1 shl 20;
  ImGuiDockNodeFlags_NoDockingOverOther = 1 shl 21;
  ImGuiDockNodeFlags_NoDockingOverEmpty = 1 shl 22;
  ImGuiDockNodeFlags_NoDocking = ImGuiDockNodeFlags_NoDockingOverMe or ImGuiDockNodeFlags_NoDockingOverOther or ImGuiDockNodeFlags_NoDockingOverEmpty or ImGuiDockNodeFlags_NoDockingSplit or ImGuiDockNodeFlags_NoDockingSplitOther;
  ImGuiDockNodeFlags_SharedFlagsInheritMask_ = not 0;
  ImGuiDockNodeFlags_NoResizeFlagsMask_ = ImGuiDockNodeFlags_NoResize or ImGuiDockNodeFlags_NoResizeX or ImGuiDockNodeFlags_NoResizeY;
  ImGuiDockNodeFlags_LocalFlagsTransferMask_ = ImGuiDockNodeFlags_NoDockingSplit or ImGuiDockNodeFlags_NoResizeFlagsMask_ or ImGuiDockNodeFlags_AutoHideTabBar or ImGuiDockNodeFlags_CentralNode or ImGuiDockNodeFlags_NoTabBar or ImGuiDockNodeFlags_HiddenTabBar or ImGuiDockNodeFlags_NoWindowMenuButton or ImGuiDockNodeFlags_NoCloseButton;
  ImGuiDockNodeFlags_SavedFlagsMask_ = ImGuiDockNodeFlags_NoResizeFlagsMask_ or ImGuiDockNodeFlags_DockSpace or ImGuiDockNodeFlags_CentralNode or ImGuiDockNodeFlags_NoTabBar or ImGuiDockNodeFlags_HiddenTabBar or ImGuiDockNodeFlags_NoWindowMenuButton or ImGuiDockNodeFlags_NoCloseButton;


Const
  ImGuiDir_None = -1;
  ImGuiDir_Left = 0;
  ImGuiDir_Right = 1;
  ImGuiDir_Up = 2;
  ImGuiDir_Down = 3;
  ImGuiDir_COUNT = 4;


Const
  ImGuiDebugLogFlags_None = 0;
  ImGuiDebugLogFlags_EventActiveId = 1 shl 0;
  ImGuiDebugLogFlags_EventFocus = 1 shl 1;
  ImGuiDebugLogFlags_EventPopup = 1 shl 2;
  ImGuiDebugLogFlags_EventNav = 1 shl 3;
  ImGuiDebugLogFlags_EventClipper = 1 shl 4;
  ImGuiDebugLogFlags_EventSelection = 1 shl 5;
  ImGuiDebugLogFlags_EventIO = 1 shl 6;
  ImGuiDebugLogFlags_EventDocking = 1 shl 7;
  ImGuiDebugLogFlags_EventViewport = 1 shl 8;
  ImGuiDebugLogFlags_EventMask_ = ImGuiDebugLogFlags_EventActiveId or ImGuiDebugLogFlags_EventFocus or ImGuiDebugLogFlags_EventPopup or ImGuiDebugLogFlags_EventNav or ImGuiDebugLogFlags_EventClipper or ImGuiDebugLogFlags_EventSelection or ImGuiDebugLogFlags_EventIO or ImGuiDebugLogFlags_EventDocking or ImGuiDebugLogFlags_EventViewport;
  ImGuiDebugLogFlags_OutputToTTY = 1 shl 10;
  ImGuiDebugLogFlags_OutputToTestEngine = 1 shl 11;


Const
  ImGuiDataType_S8 = 0;
  ImGuiDataType_U8 = 1;
  ImGuiDataType_S16 = 2;
  ImGuiDataType_U16 = 3;
  ImGuiDataType_S32 = 4;
  ImGuiDataType_U32 = 5;
  ImGuiDataType_S64 = 6;
  ImGuiDataType_U64 = 7;
  ImGuiDataType_Float = 8;
  ImGuiDataType_Double = 9;
  ImGuiDataType_COUNT = 10;


Const
  ImGuiDataType_String = Ord(ImGuiDataType_COUNT) + (1);
  ImGuiDataType_Pointer = Ord(ImGuiDataType_COUNT) + (1) + (1);
  ImGuiDataType_ID = Ord(ImGuiDataType_COUNT) + (1) + (1) + (1);


Const
  ImGuiDataAuthority_Auto = 0;
  ImGuiDataAuthority_DockNode = 1;
  ImGuiDataAuthority_Window = 2;


Const
  ImGuiContextHookType_NewFramePre = 0;
  ImGuiContextHookType_NewFramePost = 1;
  ImGuiContextHookType_EndFramePre = 2;
  ImGuiContextHookType_EndFramePost = 3;
  ImGuiContextHookType_RenderPre = 4;
  ImGuiContextHookType_RenderPost = 5;
  ImGuiContextHookType_Shutdown = 6;
  ImGuiContextHookType_PendingRemoval_ = 7;


Const
  ImGuiConfigFlags_None = 0;
  ImGuiConfigFlags_NavEnableKeyboard = 1 shl 0;
  ImGuiConfigFlags_NavEnableGamepad = 1 shl 1;
  ImGuiConfigFlags_NavEnableSetMousePos = 1 shl 2;
  ImGuiConfigFlags_NavNoCaptureKeyboard = 1 shl 3;
  ImGuiConfigFlags_NoMouse = 1 shl 4;
  ImGuiConfigFlags_NoMouseCursorChange = 1 shl 5;
  ImGuiConfigFlags_DockingEnable = 1 shl 6;
  ImGuiConfigFlags_ViewportsEnable = 1 shl 10;
  ImGuiConfigFlags_DpiEnableScaleViewports = 1 shl 14;
  ImGuiConfigFlags_DpiEnableScaleFonts = 1 shl 15;
  ImGuiConfigFlags_IsSRGB = 1 shl 20;
  ImGuiConfigFlags_IsTouchScreen = 1 shl 21;


Const
  ImGuiCond_None = 0;
  ImGuiCond_Always = 1 shl 0;
  ImGuiCond_Once = 1 shl 1;
  ImGuiCond_FirstUseEver = 1 shl 2;
  ImGuiCond_Appearing = 1 shl 3;


Const
  ImGuiComboFlags_None = 0;
  ImGuiComboFlags_PopupAlignLeft = 1 shl 0;
  ImGuiComboFlags_HeightSmall = 1 shl 1;
  ImGuiComboFlags_HeightRegular = 1 shl 2;
  ImGuiComboFlags_HeightLarge = 1 shl 3;
  ImGuiComboFlags_HeightLargest = 1 shl 4;
  ImGuiComboFlags_NoArrowButton = 1 shl 5;
  ImGuiComboFlags_NoPreview = 1 shl 6;
  ImGuiComboFlags_WidthFitPreview = 1 shl 7;
  ImGuiComboFlags_HeightMask_ = ImGuiComboFlags_HeightSmall or ImGuiComboFlags_HeightRegular or ImGuiComboFlags_HeightLarge or ImGuiComboFlags_HeightLargest;


Const
  ImGuiComboFlags_CustomPreview = 1 shl 20;


Const
  ImGuiColorEditFlags_None = 0;
  ImGuiColorEditFlags_NoAlpha = 1 shl 1;
  ImGuiColorEditFlags_NoPicker = 1 shl 2;
  ImGuiColorEditFlags_NoOptions = 1 shl 3;
  ImGuiColorEditFlags_NoSmallPreview = 1 shl 4;
  ImGuiColorEditFlags_NoInputs = 1 shl 5;
  ImGuiColorEditFlags_NoTooltip = 1 shl 6;
  ImGuiColorEditFlags_NoLabel = 1 shl 7;
  ImGuiColorEditFlags_NoSidePreview = 1 shl 8;
  ImGuiColorEditFlags_NoDragDrop = 1 shl 9;
  ImGuiColorEditFlags_NoBorder = 1 shl 10;
  ImGuiColorEditFlags_AlphaBar = 1 shl 16;
  ImGuiColorEditFlags_AlphaPreview = 1 shl 17;
  ImGuiColorEditFlags_AlphaPreviewHalf = 1 shl 18;
  ImGuiColorEditFlags_HDR = 1 shl 19;
  ImGuiColorEditFlags_DisplayRGB = 1 shl 20;
  ImGuiColorEditFlags_DisplayHSV = 1 shl 21;
  ImGuiColorEditFlags_DisplayHex = 1 shl 22;
  ImGuiColorEditFlags_Uint8 = 1 shl 23;
  ImGuiColorEditFlags_Float = 1 shl 24;
  ImGuiColorEditFlags_PickerHueBar = 1 shl 25;
  ImGuiColorEditFlags_PickerHueWheel = 1 shl 26;
  ImGuiColorEditFlags_InputRGB = 1 shl 27;
  ImGuiColorEditFlags_InputHSV = 1 shl 28;
  ImGuiColorEditFlags_DefaultOptions_ = ImGuiColorEditFlags_Uint8 or ImGuiColorEditFlags_DisplayRGB or ImGuiColorEditFlags_InputRGB or ImGuiColorEditFlags_PickerHueBar;
  ImGuiColorEditFlags_DisplayMask_ = ImGuiColorEditFlags_DisplayRGB or ImGuiColorEditFlags_DisplayHSV or ImGuiColorEditFlags_DisplayHex;
  ImGuiColorEditFlags_DataTypeMask_ = ImGuiColorEditFlags_Uint8 or ImGuiColorEditFlags_Float;
  ImGuiColorEditFlags_PickerMask_ = ImGuiColorEditFlags_PickerHueWheel or ImGuiColorEditFlags_PickerHueBar;
  ImGuiColorEditFlags_InputMask_ = ImGuiColorEditFlags_InputRGB or ImGuiColorEditFlags_InputHSV;


Const
  ImGuiCol_Text = 0;
  ImGuiCol_TextDisabled = 1;
  ImGuiCol_WindowBg = 2;
  ImGuiCol_ChildBg = 3;
  ImGuiCol_PopupBg = 4;
  ImGuiCol_Border = 5;
  ImGuiCol_BorderShadow = 6;
  ImGuiCol_FrameBg = 7;
  ImGuiCol_FrameBgHovered = 8;
  ImGuiCol_FrameBgActive = 9;
  ImGuiCol_TitleBg = 10;
  ImGuiCol_TitleBgActive = 11;
  ImGuiCol_TitleBgCollapsed = 12;
  ImGuiCol_MenuBarBg = 13;
  ImGuiCol_ScrollbarBg = 14;
  ImGuiCol_ScrollbarGrab = 15;
  ImGuiCol_ScrollbarGrabHovered = 16;
  ImGuiCol_ScrollbarGrabActive = 17;
  ImGuiCol_CheckMark = 18;
  ImGuiCol_SliderGrab = 19;
  ImGuiCol_SliderGrabActive = 20;
  ImGuiCol_Button = 21;
  ImGuiCol_ButtonHovered = 22;
  ImGuiCol_ButtonActive = 23;
  ImGuiCol_Header = 24;
  ImGuiCol_HeaderHovered = 25;
  ImGuiCol_HeaderActive = 26;
  ImGuiCol_Separator = 27;
  ImGuiCol_SeparatorHovered = 28;
  ImGuiCol_SeparatorActive = 29;
  ImGuiCol_ResizeGrip = 30;
  ImGuiCol_ResizeGripHovered = 31;
  ImGuiCol_ResizeGripActive = 32;
  ImGuiCol_Tab = 33;
  ImGuiCol_TabHovered = 34;
  ImGuiCol_TabActive = 35;
  ImGuiCol_TabUnfocused = 36;
  ImGuiCol_TabUnfocusedActive = 37;
  ImGuiCol_DockingPreview = 38;
  ImGuiCol_DockingEmptyBg = 39;
  ImGuiCol_PlotLines = 40;
  ImGuiCol_PlotLinesHovered = 41;
  ImGuiCol_PlotHistogram = 42;
  ImGuiCol_PlotHistogramHovered = 43;
  ImGuiCol_TableHeaderBg = 44;
  ImGuiCol_TableBorderStrong = 45;
  ImGuiCol_TableBorderLight = 46;
  ImGuiCol_TableRowBg = 47;
  ImGuiCol_TableRowBgAlt = 48;
  ImGuiCol_TextSelectedBg = 49;
  ImGuiCol_DragDropTarget = 50;
  ImGuiCol_NavHighlight = 51;
  ImGuiCol_NavWindowingHighlight = 52;
  ImGuiCol_NavWindowingDimBg = 53;
  ImGuiCol_ModalWindowDimBg = 54;
  ImGuiCol_COUNT = 55;


Const
  ImGuiChildFlags_None = 0;
  ImGuiChildFlags_Border = 1 shl 0;
  ImGuiChildFlags_AlwaysUseWindowPadding = 1 shl 1;
  ImGuiChildFlags_ResizeX = 1 shl 2;
  ImGuiChildFlags_ResizeY = 1 shl 3;
  ImGuiChildFlags_AutoResizeX = 1 shl 4;
  ImGuiChildFlags_AutoResizeY = 1 shl 5;
  ImGuiChildFlags_AlwaysAutoResize = 1 shl 6;
  ImGuiChildFlags_FrameStyle = 1 shl 7;


Const
  ImGuiButtonFlags_None = 0;
  ImGuiButtonFlags_MouseButtonLeft = 1 shl 0;
  ImGuiButtonFlags_MouseButtonRight = 1 shl 1;
  ImGuiButtonFlags_MouseButtonMiddle = 1 shl 2;
  ImGuiButtonFlags_MouseButtonMask_ = ImGuiButtonFlags_MouseButtonLeft or ImGuiButtonFlags_MouseButtonRight or ImGuiButtonFlags_MouseButtonMiddle;
  ImGuiButtonFlags_MouseButtonDefault_ = ImGuiButtonFlags_MouseButtonLeft;


Const
  ImGuiButtonFlags_PressedOnClick = 1 shl 4;
  ImGuiButtonFlags_PressedOnClickRelease = 1 shl 5;
  ImGuiButtonFlags_PressedOnClickReleaseAnywhere = 1 shl 6;
  ImGuiButtonFlags_PressedOnRelease = 1 shl 7;
  ImGuiButtonFlags_PressedOnDoubleClick = 1 shl 8;
  ImGuiButtonFlags_PressedOnDragDropHold = 1 shl 9;
  ImGuiButtonFlags_Repeat = 1 shl 10;
  ImGuiButtonFlags_FlattenChildren = 1 shl 11;
  ImGuiButtonFlags_AllowOverlap = 1 shl 12;
  ImGuiButtonFlags_DontClosePopups = 1 shl 13;
  ImGuiButtonFlags_AlignTextBaseLine = 1 shl 15;
  ImGuiButtonFlags_NoKeyModifiers = 1 shl 16;
  ImGuiButtonFlags_NoHoldingActiveId = 1 shl 17;
  ImGuiButtonFlags_NoNavFocus = 1 shl 18;
  ImGuiButtonFlags_NoHoveredOnFocus = 1 shl 19;
  ImGuiButtonFlags_NoSetKeyOwner = 1 shl 20;
  ImGuiButtonFlags_NoTestKeyOwner = 1 shl 21;
  ImGuiButtonFlags_PressedOnMask_ = ImGuiButtonFlags_PressedOnClick or ImGuiButtonFlags_PressedOnClickRelease or ImGuiButtonFlags_PressedOnClickReleaseAnywhere or ImGuiButtonFlags_PressedOnRelease or ImGuiButtonFlags_PressedOnDoubleClick or ImGuiButtonFlags_PressedOnDragDropHold;
  ImGuiButtonFlags_PressedOnDefault_ = ImGuiButtonFlags_PressedOnClickRelease;


Const
  ImGuiBackendFlags_None = 0;
  ImGuiBackendFlags_HasGamepad = 1 shl 0;
  ImGuiBackendFlags_HasMouseCursors = 1 shl 1;
  ImGuiBackendFlags_HasSetMousePos = 1 shl 2;
  ImGuiBackendFlags_RendererHasVtxOffset = 1 shl 3;
  ImGuiBackendFlags_PlatformHasViewports = 1 shl 10;
  ImGuiBackendFlags_HasMouseHoveredViewport = 1 shl 11;
  ImGuiBackendFlags_RendererHasViewports = 1 shl 12;


Const
  ImGuiAxis_None = -1;
  ImGuiAxis_X = 0;
  ImGuiAxis_Y = 1;


Const
  ImGuiActivateFlags_None = 0;
  ImGuiActivateFlags_PreferInput = 1 shl 0;
  ImGuiActivateFlags_PreferTweak = 1 shl 1;
  ImGuiActivateFlags_TryToPreserveState = 1 shl 2;


Const
  ImFontAtlasFlags_None = 0;
  ImFontAtlasFlags_NoPowerOfTwoHeight = 1 shl 0;
  ImFontAtlasFlags_NoMouseCursors = 1 shl 1;
  ImFontAtlasFlags_NoBakedLines = 1 shl 2;


Const
  ImDrawListFlags_None = 0;
  ImDrawListFlags_AntiAliasedLines = 1 shl 0;
  ImDrawListFlags_AntiAliasedLinesUseTex = 1 shl 1;
  ImDrawListFlags_AntiAliasedFill = 1 shl 2;
  ImDrawListFlags_AllowVtxOffset = 1 shl 3;


Const
  ImDrawFlags_None = 0;
  ImDrawFlags_Closed = 1 shl 0;
  ImDrawFlags_RoundCornersTopLeft = 1 shl 4;
  ImDrawFlags_RoundCornersTopRight = 1 shl 5;
  ImDrawFlags_RoundCornersBottomLeft = 1 shl 6;
  ImDrawFlags_RoundCornersBottomRight = 1 shl 7;
  ImDrawFlags_RoundCornersNone = 1 shl 8;
  ImDrawFlags_RoundCornersTop = ImDrawFlags_RoundCornersTopLeft or ImDrawFlags_RoundCornersTopRight;
  ImDrawFlags_RoundCornersBottom = ImDrawFlags_RoundCornersBottomLeft or ImDrawFlags_RoundCornersBottomRight;
  ImDrawFlags_RoundCornersLeft = ImDrawFlags_RoundCornersBottomLeft or ImDrawFlags_RoundCornersTopLeft;
  ImDrawFlags_RoundCornersRight = ImDrawFlags_RoundCornersBottomRight or ImDrawFlags_RoundCornersTopRight;
  ImDrawFlags_RoundCornersAll = ImDrawFlags_RoundCornersTopLeft or ImDrawFlags_RoundCornersTopRight or ImDrawFlags_RoundCornersBottomLeft or ImDrawFlags_RoundCornersBottomRight;
  ImDrawFlags_RoundCornersDefault_ = ImDrawFlags_RoundCornersAll;
  ImDrawFlags_RoundCornersMask_ = ImDrawFlags_RoundCornersAll or ImDrawFlags_RoundCornersNone;


implementation

End.


