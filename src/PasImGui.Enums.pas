{
  FreePascal bindings for ImGui

  Copyright (C) 2023 Coldzer0 <Coldzer0 [at] protonmail.ch>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU LESSER GENERAL PUBLIC LICENSE as published by
  the Free Software Foundation, version 3 of the License.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU LESSER GENERAL PUBLIC LICENSE for more details.
}

unit PasImGui.Enums;

{$IfDef FPC}
  {$mode objfpc}{$H+}
  {$PACKRECORDS C}
  {$PackEnum 4}
  {$WARN 3031 off : Values in enumeration types have to be ascending}
{$EndIf}

interface

Type
  ImGuiWindowFlags = (
    ImGuiWindowFlags_None = 0,
    ImGuiWindowFlags_NoTitleBar = 1 shl 0,
    ImGuiWindowFlags_NoResize = 1 shl 1,
    ImGuiWindowFlags_NoMove = 1 shl 2,
    ImGuiWindowFlags_NoScrollbar = 1 shl 3,
    ImGuiWindowFlags_NoScrollWithMouse = 1 shl 4,
    ImGuiWindowFlags_NoCollapse = 1 shl 5,
    ImGuiWindowFlags_AlwaysAutoResize = 1 shl 6,
    ImGuiWindowFlags_NoBackground = 1 shl 7,
    ImGuiWindowFlags_NoSavedSettings = 1 shl 8,
    ImGuiWindowFlags_NoMouseInputs = 1 shl 9,
    ImGuiWindowFlags_MenuBar = 1 shl 10,
    ImGuiWindowFlags_HorizontalScrollbar = 1 shl 11,
    ImGuiWindowFlags_NoFocusOnAppearing = 1 shl 12,
    ImGuiWindowFlags_NoBringToFrontOnFocus = 1 shl 13,
    ImGuiWindowFlags_AlwaysVerticalScrollbar = 1 shl 14,
    ImGuiWindowFlags_AlwaysHorizontalScrollbar = 1shl 15,
    ImGuiWindowFlags_NoNavInputs = 1 shl 16,
    ImGuiWindowFlags_NoNavFocus = 1 shl 17,
    ImGuiWindowFlags_UnsavedDocument = 1 shl 18,
    ImGuiWindowFlags_NoDocking = 1 shl 19,
    ImGuiWindowFlags_NoNav = Ord(ImGuiWindowFlags_NoNavInputs) or Ord(ImGuiWindowFlags_NoNavFocus),
    ImGuiWindowFlags_NoDecoration = Ord(ImGuiWindowFlags_NoTitleBar) or Ord(ImGuiWindowFlags_NoResize) or Ord(ImGuiWindowFlags_NoScrollbar) or Ord(ImGuiWindowFlags_NoCollapse),
    ImGuiWindowFlags_NoInputs = Ord(ImGuiWindowFlags_NoMouseInputs) or Ord(ImGuiWindowFlags_NoNavInputs) or Ord(ImGuiWindowFlags_NoNavFocus),
    ImGuiWindowFlags_NavFlattened = 1 shl 23,
    ImGuiWindowFlags_ChildWindow = 1 shl 24,
    ImGuiWindowFlags_Tooltip = 1 shl 25,
    ImGuiWindowFlags_Popup = 1 shl 26,
    ImGuiWindowFlags_Modal = 1 shl 27,
    ImGuiWindowFlags_ChildMenu = 1 shl 28,
    ImGuiWindowFlags_DockNodeHost = 1 shl 29
  );

  ImGuiWindowDockStyleCol = (
    ImGuiWindowDockStyleCol_Text = 0,
    ImGuiWindowDockStyleCol_Tab = 1,
    ImGuiWindowDockStyleCol_TabHovered = 2,
    ImGuiWindowDockStyleCol_TabActive = 3,
    ImGuiWindowDockStyleCol_TabUnfocused = 4,
    ImGuiWindowDockStyleCol_TabUnfocusedActive = 5,
    ImGuiWindowDockStyleCol_COUNT = 6
  );

  ImGuiViewportFlags = (
    ImGuiViewportFlags_None = 0,
    ImGuiViewportFlags_IsPlatformWindow = 1 shl 0,
    ImGuiViewportFlags_IsPlatformMonitor = 1 shl 1,
    ImGuiViewportFlags_OwnedByApp = 1 shl 2,
    ImGuiViewportFlags_NoDecoration = 1 shl 3,
    ImGuiViewportFlags_NoTaskBarIcon = 1 shl 4,
    ImGuiViewportFlags_NoFocusOnAppearing = 1 shl 5,
    ImGuiViewportFlags_NoFocusOnClick = 1 shl 6,
    ImGuiViewportFlags_NoInputs = 1 shl 7,
    ImGuiViewportFlags_NoRendererClear = 1 shl 8,
    ImGuiViewportFlags_NoAutoMerge = 1 shl 9,
    ImGuiViewportFlags_TopMost = 1 shl 10,
    ImGuiViewportFlags_CanHostOtherWindows = 1 shl 11,
    ImGuiViewportFlags_IsMinimized = 1 shl 12,
    ImGuiViewportFlags_IsFocused = 1 shl 13
  );

  ImGuiTypingSelectFlags = (
    ImGuiTypingSelectFlags_None = 0,
    ImGuiTypingSelectFlags_AllowBackspace = 1 shl 0,
    ImGuiTypingSelectFlags_AllowSingleCharMode = 1 shl 1
  );

  ImGuiTreeNodeFlags = (
    ImGuiTreeNodeFlags_None = 0,
    ImGuiTreeNodeFlags_Selected = 1 shl 0,
    ImGuiTreeNodeFlags_Framed = 1 shl 1,
    ImGuiTreeNodeFlags_AllowOverlap = 1 shl 2,
    ImGuiTreeNodeFlags_NoTreePushOnOpen = 1 shl 3,
    ImGuiTreeNodeFlags_NoAutoOpenOnLog = 1 shl 4,
    ImGuiTreeNodeFlags_DefaultOpen = 1 shl 5,
    ImGuiTreeNodeFlags_OpenOnDoubleClick = 1 shl 6,
    ImGuiTreeNodeFlags_OpenOnArrow = 1 shl 7,
    ImGuiTreeNodeFlags_Leaf = 1 shl 8,
    ImGuiTreeNodeFlags_Bullet = 1 shl 9,
    ImGuiTreeNodeFlags_FramePadding = 1 shl 10,
    ImGuiTreeNodeFlags_SpanAvailWidth = 1 shl 11,
    ImGuiTreeNodeFlags_SpanFullWidth = 1 shl 12,
    ImGuiTreeNodeFlags_SpanAllColumns = 1 shl 13,
    ImGuiTreeNodeFlags_NavLeftJumpsBackHere = 1 shl 14,
    ImGuiTreeNodeFlags_CollapsingHeader = Ord(ImGuiTreeNodeFlags_Framed) or Ord(ImGuiTreeNodeFlags_NoTreePushOnOpen) or Ord(ImGuiTreeNodeFlags_NoAutoOpenOnLog)
  );

  ImGuiTreeNodeFlagsPrivate = (
    ImGuiTreeNodeFlags_ClipLabelForTrailingButton = 1 shl 20,
    ImGuiTreeNodeFlags_UpsideDownArrow = 1 shl 21
  );

  ImGuiTooltipFlags = (
    ImGuiTooltipFlags_None = 0,
    ImGuiTooltipFlags_OverridePrevious = 1 shl 1
  );

  ImGuiTextFlags = (
    ImGuiTextFlags_None = 0,
    ImGuiTextFlags_NoWidthForLargeClippedText = 1 shl 0
  );

  ImGuiTableRowFlags = (
    ImGuiTableRowFlags_None = 0,
    ImGuiTableRowFlags_Headers = 1 shl 0
  );

  ImGuiTableFlags = (
    ImGuiTableFlags_None = 0,
    ImGuiTableFlags_Resizable = 1 shl 0,
    ImGuiTableFlags_Reorderable = 1 shl 1,
    ImGuiTableFlags_Hideable = 1 shl 2,
    ImGuiTableFlags_Sortable = 1 shl 3,
    ImGuiTableFlags_NoSavedSettings = 1 shl 4,
    ImGuiTableFlags_ContextMenuInBody = 1 shl 5,
    ImGuiTableFlags_RowBg = 1 shl 6,
    ImGuiTableFlags_BordersInnerH = 1 shl 7,
    ImGuiTableFlags_BordersOuterH = 1 shl 8,
    ImGuiTableFlags_BordersInnerV = 1 shl 9,
    ImGuiTableFlags_BordersOuterV = 1 shl 10,
    ImGuiTableFlags_BordersH = Ord(ImGuiTableFlags_BordersInnerH) or Ord(ImGuiTableFlags_BordersOuterH),
    ImGuiTableFlags_BordersV = Ord(ImGuiTableFlags_BordersInnerV) or Ord(ImGuiTableFlags_BordersOuterV),
    ImGuiTableFlags_BordersInner = Ord(ImGuiTableFlags_BordersInnerV) or Ord(ImGuiTableFlags_BordersInnerH),
    ImGuiTableFlags_BordersOuter = Ord(ImGuiTableFlags_BordersOuterV) or Ord(ImGuiTableFlags_BordersOuterH),
    ImGuiTableFlags_Borders = Ord(ImGuiTableFlags_BordersInner) or Ord(ImGuiTableFlags_BordersOuter),
    ImGuiTableFlags_NoBordersInBody = 1 shl 11,
    ImGuiTableFlags_NoBordersInBodyUntilResize = 1 shl 12,
    ImGuiTableFlags_SizingFixedFit = 1 shl 13,
    ImGuiTableFlags_SizingFixedSame = 2 shl 13,
    ImGuiTableFlags_SizingStretchProp = 3 shl 13,
    ImGuiTableFlags_SizingStretchSame = 4 shl 13,
    ImGuiTableFlags_NoHostExtendX = 1 shl 16,
    ImGuiTableFlags_NoHostExtendY = 1 shl 17,
    ImGuiTableFlags_NoKeepColumnsVisible = 1 shl 18,
    ImGuiTableFlags_PreciseWidths = 1 shl 19,
    ImGuiTableFlags_NoClip = 1 shl 20,
    ImGuiTableFlags_PadOuterX = 1 shl 21,
    ImGuiTableFlags_NoPadOuterX = 1 shl 22,
    ImGuiTableFlags_NoPadInnerX = 1 shl 23,
    ImGuiTableFlags_ScrollX = 1 shl 24,
    ImGuiTableFlags_ScrollY = 1 shl 25,
    ImGuiTableFlags_SortMulti = 1 shl 26,
    ImGuiTableFlags_SortTristate = 1 shl 27,
    ImGuiTableFlags_HighlightHoveredColumn = 1 shl 28,
    ImGuiTableFlags_SizingMask_ = Ord(ImGuiTableFlags_SizingFixedFit) or Ord(ImGuiTableFlags_SizingFixedSame) or Ord(ImGuiTableFlags_SizingStretchProp) or Ord(ImGuiTableFlags_SizingStretchSame)
  );

  ImGuiTableColumnFlags = (
    ImGuiTableColumnFlags_None = 0,
    ImGuiTableColumnFlags_Disabled = 1 shl 0,
    ImGuiTableColumnFlags_DefaultHide = 1 shl 1,
    ImGuiTableColumnFlags_DefaultSort = 1 shl 2,
    ImGuiTableColumnFlags_WidthStretch = 1 shl 3,
    ImGuiTableColumnFlags_WidthFixed = 1 shl 4,
    ImGuiTableColumnFlags_NoResize = 1 shl 5,
    ImGuiTableColumnFlags_NoReorder = 1 shl 6,
    ImGuiTableColumnFlags_NoHide = 1 shl 7,
    ImGuiTableColumnFlags_NoClip = 1 shl 8,
    ImGuiTableColumnFlags_NoSort = 1 shl 9,
    ImGuiTableColumnFlags_NoSortAscending = 1 shl 10,
    ImGuiTableColumnFlags_NoSortDescending = 1 shl 11,
    ImGuiTableColumnFlags_NoHeaderLabel = 1 shl 12,
    ImGuiTableColumnFlags_NoHeaderWidth = 1 shl 13,
    ImGuiTableColumnFlags_PreferSortAscending = 1 shl 14,
    ImGuiTableColumnFlags_PreferSortDescending = 1 shl 15,
    ImGuiTableColumnFlags_IndentEnable = 1 shl 16,
    ImGuiTableColumnFlags_IndentDisable = 1 shl 17,
    ImGuiTableColumnFlags_AngledHeader = 1 shl 18,
    ImGuiTableColumnFlags_IsEnabled = 1 shl 24,
    ImGuiTableColumnFlags_IsVisible = 1 shl 25,
    ImGuiTableColumnFlags_IsSorted = 1 shl 26,
    ImGuiTableColumnFlags_IsHovered = 1 shl 27,
    ImGuiTableColumnFlags_WidthMask_ = Ord(ImGuiTableColumnFlags_WidthStretch) or Ord(ImGuiTableColumnFlags_WidthFixed),
    ImGuiTableColumnFlags_IndentMask_ = Ord(ImGuiTableColumnFlags_IndentEnable) or Ord(ImGuiTableColumnFlags_IndentDisable),
    ImGuiTableColumnFlags_StatusMask_ = Ord(ImGuiTableColumnFlags_IsEnabled) or Ord(ImGuiTableColumnFlags_IsVisible) or Ord(ImGuiTableColumnFlags_IsSorted) or Ord(ImGuiTableColumnFlags_IsHovered),
    ImGuiTableColumnFlags_NoDirectResize_ = 1 shl 30
  );

  ImGuiTableBgTarget = (
    ImGuiTableBgTarget_None = 0,
    ImGuiTableBgTarget_RowBg0 = 1,
    ImGuiTableBgTarget_RowBg1 = 2,
    ImGuiTableBgTarget_CellBg = 3
  );

  ImGuiTabItemFlags = (
    ImGuiTabItemFlags_None = 0,
    ImGuiTabItemFlags_UnsavedDocument = 1 shl 0,
    ImGuiTabItemFlags_SetSelected = 1 shl 1,
    ImGuiTabItemFlags_NoCloseWithMiddleMouseButton = 1 shl 2,
    ImGuiTabItemFlags_NoPushId = 1 shl 3,
    ImGuiTabItemFlags_NoTooltip = 1 shl 4,
    ImGuiTabItemFlags_NoReorder = 1 shl 5,
    ImGuiTabItemFlags_Leading = 1 shl 6,
    ImGuiTabItemFlags_Trailing = 1 shl 7
  );

  ImGuiTabItemFlagsPrivate = (
    ImGuiTabItemFlags_SectionMask_ = Ord(ImGuiTabItemFlags_Leading) or Ord(ImGuiTabItemFlags_Trailing),
    ImGuiTabItemFlags_NoCloseButton = 1 shl 20,
    ImGuiTabItemFlags_Button = 1 shl 21,
    ImGuiTabItemFlags_Unsorted = 1 shl 22
  );

  ImGuiTabBarFlags = (
    ImGuiTabBarFlags_None = 0,
    ImGuiTabBarFlags_Reorderable = 1 shl 0,
    ImGuiTabBarFlags_AutoSelectNewTabs = 1 shl 1,
    ImGuiTabBarFlags_TabListPopupButton = 1 shl 2,
    ImGuiTabBarFlags_NoCloseWithMiddleMouseButton = 1 shl 3,
    ImGuiTabBarFlags_NoTabListScrollingButtons = 1 shl 4,
    ImGuiTabBarFlags_NoTooltip = 1 shl 5,
    ImGuiTabBarFlags_FittingPolicyResizeDown = 1 shl 6,
    ImGuiTabBarFlags_FittingPolicyScroll = 1 shl 7,
    ImGuiTabBarFlags_FittingPolicyMask_ = Ord(ImGuiTabBarFlags_FittingPolicyResizeDown) or Ord(ImGuiTabBarFlags_FittingPolicyScroll),
    ImGuiTabBarFlags_FittingPolicyDefault_ = ImGuiTabBarFlags_FittingPolicyResizeDown
  );

  ImGuiTabBarFlagsPrivate = (
    ImGuiTabBarFlags_DockNode = 1 shl 20,
    ImGuiTabBarFlags_IsFocused = 1 shl 21,
    ImGuiTabBarFlags_SaveSettings = 1 shl 22
  );

  ImGuiStyleVar = (
    ImGuiStyleVar_Alpha = 0,
    ImGuiStyleVar_DisabledAlpha = 1,
    ImGuiStyleVar_WindowPadding = 2,
    ImGuiStyleVar_WindowRounding = 3,
    ImGuiStyleVar_WindowBorderSize = 4,
    ImGuiStyleVar_WindowMinSize = 5,
    ImGuiStyleVar_WindowTitleAlign = 6,
    ImGuiStyleVar_ChildRounding = 7,
    ImGuiStyleVar_ChildBorderSize = 8,
    ImGuiStyleVar_PopupRounding = 9,
    ImGuiStyleVar_PopupBorderSize = 10,
    ImGuiStyleVar_FramePadding = 11,
    ImGuiStyleVar_FrameRounding = 12,
    ImGuiStyleVar_FrameBorderSize = 13,
    ImGuiStyleVar_ItemSpacing = 14,
    ImGuiStyleVar_ItemInnerSpacing = 15,
    ImGuiStyleVar_IndentSpacing = 16,
    ImGuiStyleVar_CellPadding = 17,
    ImGuiStyleVar_ScrollbarSize = 18,
    ImGuiStyleVar_ScrollbarRounding = 19,
    ImGuiStyleVar_GrabMinSize = 20,
    ImGuiStyleVar_GrabRounding = 21,
    ImGuiStyleVar_TabRounding = 22,
    ImGuiStyleVar_TabBarBorderSize = 23,
    ImGuiStyleVar_ButtonTextAlign = 24,
    ImGuiStyleVar_SelectableTextAlign = 25,
    ImGuiStyleVar_SeparatorTextBorderSize = 26,
    ImGuiStyleVar_SeparatorTextAlign = 27,
    ImGuiStyleVar_SeparatorTextPadding = 28,
    ImGuiStyleVar_DockingSeparatorSize = 29,
    ImGuiStyleVar_COUNT = 30
  );

  ImGuiSortDirection = (
    ImGuiSortDirection_None = 0,
    ImGuiSortDirection_Ascending = 1,
    ImGuiSortDirection_Descending = 2
  );

  ImGuiSliderFlags = (
    ImGuiSliderFlags_None = 0,
    ImGuiSliderFlags_AlwaysClamp = 1 shl 4,
    ImGuiSliderFlags_Logarithmic = 1 shl 5,
    ImGuiSliderFlags_NoRoundToFormat = 1 shl 6,
    ImGuiSliderFlags_NoInput = 1 shl 7,
    ImGuiSliderFlags_InvalidMask_ = $7000000F
  );

  ImGuiSliderFlagsPrivate = (
    ImGuiSliderFlags_Vertical = 1 shl 20,
    ImGuiSliderFlags_ReadOnly = 1 shl 21
  );

  ImGuiSeparatorFlags = (
    ImGuiSeparatorFlags_None = 0,
    ImGuiSeparatorFlags_Horizontal = 1 shl 0,
    ImGuiSeparatorFlags_Vertical = 1 shl 1,
    ImGuiSeparatorFlags_SpanAllColumns = 1 shl 2
  );

  ImGuiSelectableFlags = (
    ImGuiSelectableFlags_None = 0,
    ImGuiSelectableFlags_DontClosePopups = 1 shl 0,
    ImGuiSelectableFlags_SpanAllColumns = 1 shl 1,
    ImGuiSelectableFlags_AllowDoubleClick = 1 shl 2,
    ImGuiSelectableFlags_Disabled = 1 shl 3,
    ImGuiSelectableFlags_AllowOverlap = 1 shl 4
  );

  ImGuiSelectableFlagsPrivate = (
    ImGuiSelectableFlags_NoHoldingActiveID = 1 shl 20,
    ImGuiSelectableFlags_SelectOnNav = 1 shl 21,
    ImGuiSelectableFlags_SelectOnClick = 1 shl 22,
    ImGuiSelectableFlags_SelectOnRelease = 1 shl 23,
    ImGuiSelectableFlags_SpanAvailWidth = 1 shl 24,
    ImGuiSelectableFlags_SetNavIdOnHover = 1 shl 25,
    ImGuiSelectableFlags_NoPadWithHalfSpacing = 1 shl 26,
    ImGuiSelectableFlags_NoSetKeyOwner = 1 shl 27
  );

  ImGuiScrollFlags = (
    ImGuiScrollFlags_None = 0,
    ImGuiScrollFlags_KeepVisibleEdgeX = 1 shl 0,
    ImGuiScrollFlags_KeepVisibleEdgeY = 1 shl 1,
    ImGuiScrollFlags_KeepVisibleCenterX = 1 shl 2,
    ImGuiScrollFlags_KeepVisibleCenterY = 1 shl 3,
    ImGuiScrollFlags_AlwaysCenterX = 1 shl 4,
    ImGuiScrollFlags_AlwaysCenterY = 1 shl 5,
    ImGuiScrollFlags_NoScrollParent = 1 shl 6,
    ImGuiScrollFlags_MaskX_ = Ord(ImGuiScrollFlags_KeepVisibleEdgeX) or Ord(ImGuiScrollFlags_KeepVisibleCenterX) or Ord(ImGuiScrollFlags_AlwaysCenterX),
    ImGuiScrollFlags_MaskY_ = Ord(ImGuiScrollFlags_KeepVisibleEdgeY) or Ord(ImGuiScrollFlags_KeepVisibleCenterY) or Ord(ImGuiScrollFlags_AlwaysCenterY)
  );

  ImGuiPopupPositionPolicy = (
    ImGuiPopupPositionPolicy_Default = 0,
    ImGuiPopupPositionPolicy_ComboBox = 1,
    ImGuiPopupPositionPolicy_Tooltip = 2
  );

  ImGuiPopupFlags = (
    ImGuiPopupFlags_None = 0,
    ImGuiPopupFlags_MouseButtonLeft = 0,
    ImGuiPopupFlags_MouseButtonRight = 1,
    ImGuiPopupFlags_MouseButtonMiddle = 2,
    ImGuiPopupFlags_MouseButtonMask_ = $1F,
    ImGuiPopupFlags_MouseButtonDefault_ = 1,
    ImGuiPopupFlags_NoOpenOverExistingPopup = 1 shl 5,
    ImGuiPopupFlags_NoOpenOverItems = 1 shl 6,
    ImGuiPopupFlags_AnyPopupId = 1 shl 7,
    ImGuiPopupFlags_AnyPopupLevel = 1 shl 8,
    ImGuiPopupFlags_AnyPopup = Ord(ImGuiPopupFlags_AnyPopupId) or Ord(ImGuiPopupFlags_AnyPopupLevel)
  );

  ImGuiPlotType = (
    ImGuiPlotType_Lines = 0,
    ImGuiPlotType_Histogram = 1
  );

  ImGuiOldColumnFlags = (
    ImGuiOldColumnFlags_None = 0,
    ImGuiOldColumnFlags_NoBorder = 1 shl 0,
    ImGuiOldColumnFlags_NoResize = 1 shl 1,
    ImGuiOldColumnFlags_NoPreserveWidths = 1 shl 2,
    ImGuiOldColumnFlags_NoForceWithinWindow = 1 shl 3,
    ImGuiOldColumnFlags_GrowParentContentsSize = 1 shl 4
  );

  ImGuiNextWindowDataFlags = (
    ImGuiNextWindowDataFlags_None = 0,
    ImGuiNextWindowDataFlags_HasPos = 1 shl 0,
    ImGuiNextWindowDataFlags_HasSize = 1 shl 1,
    ImGuiNextWindowDataFlags_HasContentSize = 1 shl 2,
    ImGuiNextWindowDataFlags_HasCollapsed = 1 shl 3,
    ImGuiNextWindowDataFlags_HasSizeConstraint = 1 shl 4,
    ImGuiNextWindowDataFlags_HasFocus = 1 shl 5,
    ImGuiNextWindowDataFlags_HasBgAlpha = 1 shl 6,
    ImGuiNextWindowDataFlags_HasScroll = 1 shl 7,
    ImGuiNextWindowDataFlags_HasChildFlags = 1 shl 8,
    ImGuiNextWindowDataFlags_HasViewport = 1 shl 9,
    ImGuiNextWindowDataFlags_HasDock = 1 shl 10,
    ImGuiNextWindowDataFlags_HasWindowClass = 1 shl 11
  );

  ImGuiNextItemDataFlags = (
    ImGuiNextItemDataFlags_None = 0,
    ImGuiNextItemDataFlags_HasWidth = 1 shl 0,
    ImGuiNextItemDataFlags_HasOpen = 1 shl 1
  );

  ImGuiNavMoveFlags = (
    ImGuiNavMoveFlags_None = 0,
    ImGuiNavMoveFlags_LoopX = 1 shl 0,
    ImGuiNavMoveFlags_LoopY = 1 shl 1,
    ImGuiNavMoveFlags_WrapX = 1 shl 2,
    ImGuiNavMoveFlags_WrapY = 1 shl 3,
    ImGuiNavMoveFlags_WrapMask_ = Ord(ImGuiNavMoveFlags_LoopX) or Ord(ImGuiNavMoveFlags_LoopY) or Ord(ImGuiNavMoveFlags_WrapX) or Ord(ImGuiNavMoveFlags_WrapY),
    ImGuiNavMoveFlags_AllowCurrentNavId = 1 shl 4,
    ImGuiNavMoveFlags_AlsoScoreVisibleSet = 1 shl 5,
    ImGuiNavMoveFlags_ScrollToEdgeY = 1 shl 6,
    ImGuiNavMoveFlags_Forwarded = 1 shl 7,
    ImGuiNavMoveFlags_DebugNoResult = 1 shl 8,
    ImGuiNavMoveFlags_FocusApi = 1 shl 9,
    ImGuiNavMoveFlags_IsTabbing = 1 shl 10,
    ImGuiNavMoveFlags_IsPageMove = 1 shl 11,
    ImGuiNavMoveFlags_Activate = 1 shl 12,
    ImGuiNavMoveFlags_NoSelect = 1 shl 13,
    ImGuiNavMoveFlags_NoSetNavHighlight = 1 shl 14
  );

  ImGuiNavLayer = (
    ImGuiNavLayer_Main = 0,
    ImGuiNavLayer_Menu = 1,
    ImGuiNavLayer_COUNT = 2
  );

  ImGuiNavInput = (
    ImGuiNavInput_Activate = 0,
    ImGuiNavInput_Cancel = 1,
    ImGuiNavInput_Input = 2,
    ImGuiNavInput_Menu = 3,
    ImGuiNavInput_DpadLeft = 4,
    ImGuiNavInput_DpadRight = 5,
    ImGuiNavInput_DpadUp = 6,
    ImGuiNavInput_DpadDown = 7,
    ImGuiNavInput_LStickLeft = 8,
    ImGuiNavInput_LStickRight = 9,
    ImGuiNavInput_LStickUp = 10,
    ImGuiNavInput_LStickDown = 11,
    ImGuiNavInput_FocusPrev = 12,
    ImGuiNavInput_FocusNext = 13,
    ImGuiNavInput_TweakSlow = 14,
    ImGuiNavInput_TweakFast = 15,
    ImGuiNavInput_COUNT = 16
  );

  ImGuiNavHighlightFlags = (
    ImGuiNavHighlightFlags_None = 0,
    ImGuiNavHighlightFlags_TypeDefault = 1 shl 0,
    ImGuiNavHighlightFlags_TypeThin = 1 shl 1,
    ImGuiNavHighlightFlags_AlwaysDraw = 1 shl 2,
    ImGuiNavHighlightFlags_NoRounding = 1 shl 3
  );

  ImGuiMouseSource = (
    ImGuiMouseSource_Mouse = 0,
    ImGuiMouseSource_TouchScreen = 1,
    ImGuiMouseSource_Pen = 2,
    ImGuiMouseSource_COUNT = 3
  );

  ImGuiMouseCursor = (
    ImGuiMouseCursor_None = -1,
    ImGuiMouseCursor_Arrow = 0,
    ImGuiMouseCursor_TextInput = 1,
    ImGuiMouseCursor_ResizeAll = 2,
    ImGuiMouseCursor_ResizeNS = 3,
    ImGuiMouseCursor_ResizeEW = 4,
    ImGuiMouseCursor_ResizeNESW = 5,
    ImGuiMouseCursor_ResizeNWSE = 6,
    ImGuiMouseCursor_Hand = 7,
    ImGuiMouseCursor_NotAllowed = 8,
    ImGuiMouseCursor_COUNT = 9
  );

  ImGuiMouseButton = (
    ImGuiMouseButton_Left = 0,
    ImGuiMouseButton_Right = 1,
    ImGuiMouseButton_Middle = 2,
    ImGuiMouseButton_COUNT = 5
  );

  ImGuiLogType = (
    ImGuiLogType_None = 0,
    ImGuiLogType_TTY = 1,
    ImGuiLogType_File = 2,
    ImGuiLogType_Buffer = 3,
    ImGuiLogType_Clipboard = 4
  );

  ImGuiLocKey = (
    ImGuiLocKey_VersionStr = 0,
    ImGuiLocKey_TableSizeOne = 1,
    ImGuiLocKey_TableSizeAllFit = 2,
    ImGuiLocKey_TableSizeAllDefault = 3,
    ImGuiLocKey_TableResetOrder = 4,
    ImGuiLocKey_WindowingMainMenuBar = 5,
    ImGuiLocKey_WindowingPopup = 6,
    ImGuiLocKey_WindowingUntitled = 7,
    ImGuiLocKey_DockingHideTabBar = 8,
    ImGuiLocKey_DockingHoldShiftToDock = 9,
    ImGuiLocKey_DockingDragToUndockOrMoveNode = 10,
    ImGuiLocKey_COUNT = 11
  );

  ImGuiLayoutType = (
    ImGuiLayoutType_Horizontal = 0,
    ImGuiLayoutType_Vertical = 1
  );

  ImGuiKey = (
    ImGuiKey_None = 0,
    ImGuiKey_Tab = 512,
    ImGuiKey_LeftArrow = 513,
    ImGuiKey_RightArrow = 514,
    ImGuiKey_UpArrow = 515,
    ImGuiKey_DownArrow = 516,
    ImGuiKey_PageUp = 517,
    ImGuiKey_PageDown = 518,
    ImGuiKey_Home = 519,
    ImGuiKey_End = 520,
    ImGuiKey_Insert = 521,
    ImGuiKey_Delete = 522,
    ImGuiKey_Backspace = 523,
    ImGuiKey_Space = 524,
    ImGuiKey_Enter = 525,
    ImGuiKey_Escape = 526,
    ImGuiKey_LeftCtrl = 527,
    ImGuiKey_LeftShift = 528,
    ImGuiKey_LeftAlt = 529,
    ImGuiKey_LeftSuper = 530,
    ImGuiKey_RightCtrl = 531,
    ImGuiKey_RightShift = 532,
    ImGuiKey_RightAlt = 533,
    ImGuiKey_RightSuper = 534,
    ImGuiKey_Menu = 535,
    ImGuiKey_0 = 536,
    ImGuiKey_1 = 537,
    ImGuiKey_2 = 538,
    ImGuiKey_3 = 539,
    ImGuiKey_4 = 540,
    ImGuiKey_5 = 541,
    ImGuiKey_6 = 542,
    ImGuiKey_7 = 543,
    ImGuiKey_8 = 544,
    ImGuiKey_9 = 545,
    ImGuiKey_A = 546,
    ImGuiKey_B = 547,
    ImGuiKey_C = 548,
    ImGuiKey_D = 549,
    ImGuiKey_E = 550,
    ImGuiKey_F = 551,
    ImGuiKey_G = 552,
    ImGuiKey_H = 553,
    ImGuiKey_I = 554,
    ImGuiKey_J = 555,
    ImGuiKey_K = 556,
    ImGuiKey_L = 557,
    ImGuiKey_M = 558,
    ImGuiKey_N = 559,
    ImGuiKey_O = 560,
    ImGuiKey_P = 561,
    ImGuiKey_Q = 562,
    ImGuiKey_R = 563,
    ImGuiKey_S = 564,
    ImGuiKey_T = 565,
    ImGuiKey_U = 566,
    ImGuiKey_V = 567,
    ImGuiKey_W = 568,
    ImGuiKey_X = 569,
    ImGuiKey_Y = 570,
    ImGuiKey_Z = 571,
    ImGuiKey_F1 = 572,
    ImGuiKey_F2 = 573,
    ImGuiKey_F3 = 574,
    ImGuiKey_F4 = 575,
    ImGuiKey_F5 = 576,
    ImGuiKey_F6 = 577,
    ImGuiKey_F7 = 578,
    ImGuiKey_F8 = 579,
    ImGuiKey_F9 = 580,
    ImGuiKey_F10 = 581,
    ImGuiKey_F11 = 582,
    ImGuiKey_F12 = 583,
    ImGuiKey_F13 = 584,
    ImGuiKey_F14 = 585,
    ImGuiKey_F15 = 586,
    ImGuiKey_F16 = 587,
    ImGuiKey_F17 = 588,
    ImGuiKey_F18 = 589,
    ImGuiKey_F19 = 590,
    ImGuiKey_F20 = 591,
    ImGuiKey_F21 = 592,
    ImGuiKey_F22 = 593,
    ImGuiKey_F23 = 594,
    ImGuiKey_F24 = 595,
    ImGuiKey_Apostrophe = 596,
    ImGuiKey_Comma = 597,
    ImGuiKey_Minus = 598,
    ImGuiKey_Period = 599,
    ImGuiKey_Slash = 600,
    ImGuiKey_Semicolon = 601,
    ImGuiKey_Equal = 602,
    ImGuiKey_LeftBracket = 603,
    ImGuiKey_Backslash = 604,
    ImGuiKey_RightBracket = 605,
    ImGuiKey_GraveAccent = 606,
    ImGuiKey_CapsLock = 607,
    ImGuiKey_ScrollLock = 608,
    ImGuiKey_NumLock = 609,
    ImGuiKey_PrintScreen = 610,
    ImGuiKey_Pause = 611,
    ImGuiKey_Keypad0 = 612,
    ImGuiKey_Keypad1 = 613,
    ImGuiKey_Keypad2 = 614,
    ImGuiKey_Keypad3 = 615,
    ImGuiKey_Keypad4 = 616,
    ImGuiKey_Keypad5 = 617,
    ImGuiKey_Keypad6 = 618,
    ImGuiKey_Keypad7 = 619,
    ImGuiKey_Keypad8 = 620,
    ImGuiKey_Keypad9 = 621,
    ImGuiKey_KeypadDecimal = 622,
    ImGuiKey_KeypadDivide = 623,
    ImGuiKey_KeypadMultiply = 624,
    ImGuiKey_KeypadSubtract = 625,
    ImGuiKey_KeypadAdd = 626,
    ImGuiKey_KeypadEnter = 627,
    ImGuiKey_KeypadEqual = 628,
    ImGuiKey_AppBack = 629,
    ImGuiKey_AppForward = 630,
    ImGuiKey_GamepadStart = 631,
    ImGuiKey_GamepadBack = 632,
    ImGuiKey_GamepadFaceLeft = 633,
    ImGuiKey_GamepadFaceRight = 634,
    ImGuiKey_GamepadFaceUp = 635,
    ImGuiKey_GamepadFaceDown = 636,
    ImGuiKey_GamepadDpadLeft = 637,
    ImGuiKey_GamepadDpadRight = 638,
    ImGuiKey_GamepadDpadUp = 639,
    ImGuiKey_GamepadDpadDown = 640,
    ImGuiKey_GamepadL1 = 641,
    ImGuiKey_GamepadR1 = 642,
    ImGuiKey_GamepadL2 = 643,
    ImGuiKey_GamepadR2 = 644,
    ImGuiKey_GamepadL3 = 645,
    ImGuiKey_GamepadR3 = 646,
    ImGuiKey_GamepadLStickLeft = 647,
    ImGuiKey_GamepadLStickRight = 648,
    ImGuiKey_GamepadLStickUp = 649,
    ImGuiKey_GamepadLStickDown = 650,
    ImGuiKey_GamepadRStickLeft = 651,
    ImGuiKey_GamepadRStickRight = 652,
    ImGuiKey_GamepadRStickUp = 653,
    ImGuiKey_GamepadRStickDown = 654,
    ImGuiKey_MouseLeft = 655,
    ImGuiKey_MouseRight = 656,
    ImGuiKey_MouseMiddle = 657,
    ImGuiKey_MouseX1 = 658,
    ImGuiKey_MouseX2 = 659,
    ImGuiKey_MouseWheelX = 660,
    ImGuiKey_MouseWheelY = 661,
    ImGuiKey_ReservedForModCtrl = 662,
    ImGuiKey_ReservedForModShift = 663,
    ImGuiKey_ReservedForModAlt = 664,
    ImGuiKey_ReservedForModSuper = 665,
    ImGuiKey_COUNT = 666,
    ImGuiMod_None = 0,
    ImGuiMod_Ctrl = 1 shl 12,
    ImGuiMod_Shift = 1 shl 13,
    ImGuiMod_Alt = 1 shl 14,
    ImGuiMod_Super = 1 shl 15,
    ImGuiMod_Shortcut = 1 shl 11,
    ImGuiMod_Mask_ = $F800,
    ImGuiKey_NamedKey_BEGIN = 512,
    ImGuiKey_NamedKey_END = ImGuiKey_COUNT,
    ImGuiKey_NamedKey_COUNT = ImGuiKey_NamedKey_END - ImGuiKey_NamedKey_BEGIN,
    ImGuiKey_KeysData_SIZE = ImGuiKey_COUNT,
    ImGuiKey_KeysData_OFFSET = 0
  );

  ImGuiItemStatusFlags = (
    ImGuiItemStatusFlags_None = 0,
    ImGuiItemStatusFlags_HoveredRect = 1 shl 0,
    ImGuiItemStatusFlags_HasDisplayRect = 1 shl 1,
    ImGuiItemStatusFlags_Edited = 1 shl 2,
    ImGuiItemStatusFlags_ToggledSelection = 1 shl 3,
    ImGuiItemStatusFlags_ToggledOpen = 1 shl 4,
    ImGuiItemStatusFlags_HasDeactivated = 1 shl 5,
    ImGuiItemStatusFlags_Deactivated = 1 shl 6,
    ImGuiItemStatusFlags_HoveredWindow = 1 shl 7,
    ImGuiItemStatusFlags_FocusedByTabbing = 1 shl 8,
    ImGuiItemStatusFlags_Visible = 1 shl 9
  );

  ImGuiItemFlags = (
    ImGuiItemFlags_None = 0,
    ImGuiItemFlags_NoTabStop = 1 shl 0,
    ImGuiItemFlags_ButtonRepeat = 1 shl 1,
    ImGuiItemFlags_Disabled = 1 shl 2,
    ImGuiItemFlags_NoNav = 1 shl 3,
    ImGuiItemFlags_NoNavDefaultFocus = 1 shl 4,
    ImGuiItemFlags_SelectableDontClosePopup = 1 shl 5,
    ImGuiItemFlags_MixedValue = 1 shl 6,
    ImGuiItemFlags_ReadOnly = 1 shl 7,
    ImGuiItemFlags_NoWindowHoverableCheck = 1 shl 8,
    ImGuiItemFlags_AllowOverlap = 1 shl 9,
    ImGuiItemFlags_Inputable = 1 shl 10,
    ImGuiItemFlags_HasSelectionUserData = 1 shl 11
  );

  ImGuiInputTextFlags = (
    ImGuiInputTextFlags_None = 0,
    ImGuiInputTextFlags_CharsDecimal = 1 shl 0,
    ImGuiInputTextFlags_CharsHexadecimal = 1 shl 1,
    ImGuiInputTextFlags_CharsUppercase = 1 shl 2,
    ImGuiInputTextFlags_CharsNoBlank = 1 shl 3,
    ImGuiInputTextFlags_AutoSelectAll = 1 shl 4,
    ImGuiInputTextFlags_EnterReturnsTrue = 1 shl 5,
    ImGuiInputTextFlags_CallbackCompletion = 1 shl 6,
    ImGuiInputTextFlags_CallbackHistory = 1 shl 7,
    ImGuiInputTextFlags_CallbackAlways = 1 shl 8,
    ImGuiInputTextFlags_CallbackCharFilter = 1 shl 9,
    ImGuiInputTextFlags_AllowTabInput = 1 shl 10,
    ImGuiInputTextFlags_CtrlEnterForNewLine = 1 shl 11,
    ImGuiInputTextFlags_NoHorizontalScroll = 1 shl 12,
    ImGuiInputTextFlags_AlwaysOverwrite = 1 shl 13,
    ImGuiInputTextFlags_ReadOnly = 1 shl 14,
    ImGuiInputTextFlags_Password = 1 shl 15,
    ImGuiInputTextFlags_NoUndoRedo = 1 shl 16,
    ImGuiInputTextFlags_CharsScientific = 1 shl 17,
    ImGuiInputTextFlags_CallbackResize = 1 shl 18,
    ImGuiInputTextFlags_CallbackEdit = 1 shl 19,
    ImGuiInputTextFlags_EscapeClearsAll = 1 shl 20
  );

  ImGuiInputTextFlagsPrivate = (
    ImGuiInputTextFlags_Multiline = 1 shl 26,
    ImGuiInputTextFlags_NoMarkEdited = 1 shl 27,
    ImGuiInputTextFlags_MergedItem = 1 shl 28
  );

  ImGuiInputSource = (
    ImGuiInputSource_None = 0,
    ImGuiInputSource_Mouse = 1,
    ImGuiInputSource_Keyboard = 2,
    ImGuiInputSource_Gamepad = 3,
    ImGuiInputSource_Clipboard = 4,
    ImGuiInputSource_COUNT = 5
  );

  ImGuiInputFlags = (
    ImGuiInputFlags_None = 0,
    ImGuiInputFlags_Repeat = 1 shl 0,
    ImGuiInputFlags_RepeatRateDefault = 1 shl 1,
    ImGuiInputFlags_RepeatRateNavMove = 1 shl 2,
    ImGuiInputFlags_RepeatRateNavTweak = 1 shl 3,
    ImGuiInputFlags_RepeatRateMask_ = Ord(ImGuiInputFlags_RepeatRateDefault) or Ord(ImGuiInputFlags_RepeatRateNavMove) or Ord(ImGuiInputFlags_RepeatRateNavTweak),
    ImGuiInputFlags_CondHovered = 1 shl 4,
    ImGuiInputFlags_CondActive = 1 shl 5,
    ImGuiInputFlags_CondDefault_ = Ord(ImGuiInputFlags_CondHovered) or Ord(ImGuiInputFlags_CondActive),
    ImGuiInputFlags_CondMask_ = Ord(ImGuiInputFlags_CondHovered) or Ord(ImGuiInputFlags_CondActive),
    ImGuiInputFlags_LockThisFrame = 1 shl 6,
    ImGuiInputFlags_LockUntilRelease = 1 shl 7,
    ImGuiInputFlags_RouteFocused = 1 shl 8,
    ImGuiInputFlags_RouteGlobalLow = 1 shl 9,
    ImGuiInputFlags_RouteGlobal = 1 shl 10,
    ImGuiInputFlags_RouteGlobalHigh = 1 shl 11,
    ImGuiInputFlags_RouteMask_ = Ord(ImGuiInputFlags_RouteFocused) or Ord(ImGuiInputFlags_RouteGlobal) or Ord(ImGuiInputFlags_RouteGlobalLow) or Ord(ImGuiInputFlags_RouteGlobalHigh),
    ImGuiInputFlags_RouteAlways = 1 shl 12,
    ImGuiInputFlags_RouteUnlessBgFocused = 1 shl 13,
    ImGuiInputFlags_RouteExtraMask_ = Ord(ImGuiInputFlags_RouteAlways) or Ord(ImGuiInputFlags_RouteUnlessBgFocused),
    ImGuiInputFlags_SupportedByIsKeyPressed = Ord(ImGuiInputFlags_Repeat) or Ord(ImGuiInputFlags_RepeatRateMask_),
    ImGuiInputFlags_SupportedByShortcut = Ord(ImGuiInputFlags_Repeat) or Ord(ImGuiInputFlags_RepeatRateMask_) or Ord(ImGuiInputFlags_RouteMask_) or Ord(ImGuiInputFlags_RouteExtraMask_),
    ImGuiInputFlags_SupportedBySetKeyOwner = Ord(ImGuiInputFlags_LockThisFrame) or Ord(ImGuiInputFlags_LockUntilRelease),
    ImGuiInputFlags_SupportedBySetItemKeyOwner = Ord(ImGuiInputFlags_SupportedBySetKeyOwner) or Ord(ImGuiInputFlags_CondMask_)
  );

  ImGuiInputEventType = (
    ImGuiInputEventType_None = 0,
    ImGuiInputEventType_MousePos = 1,
    ImGuiInputEventType_MouseWheel = 2,
    ImGuiInputEventType_MouseButton = 3,
    ImGuiInputEventType_MouseViewport = 4,
    ImGuiInputEventType_Key = 5,
    ImGuiInputEventType_Text = 6,
    ImGuiInputEventType_Focus = 7,
    ImGuiInputEventType_COUNT = 8
  );

  ImGuiHoveredFlags = (
    ImGuiHoveredFlags_None = 0,
    ImGuiHoveredFlags_ChildWindows = 1 shl 0,
    ImGuiHoveredFlags_RootWindow = 1 shl 1,
    ImGuiHoveredFlags_AnyWindow = 1 shl 2,
    ImGuiHoveredFlags_NoPopupHierarchy = 1 shl 3,
    ImGuiHoveredFlags_DockHierarchy = 1 shl 4,
    ImGuiHoveredFlags_AllowWhenBlockedByPopup = 1 shl 5,
    ImGuiHoveredFlags_AllowWhenBlockedByActiveItem = 1 shl 7,
    ImGuiHoveredFlags_AllowWhenOverlappedByItem = 1 shl 8,
    ImGuiHoveredFlags_AllowWhenOverlappedByWindow = 1 shl 9,
    ImGuiHoveredFlags_AllowWhenDisabled = 1 shl 10,
    ImGuiHoveredFlags_NoNavOverride = 1 shl 11,
    ImGuiHoveredFlags_AllowWhenOverlapped = Ord(ImGuiHoveredFlags_AllowWhenOverlappedByItem) or Ord(ImGuiHoveredFlags_AllowWhenOverlappedByWindow),
    ImGuiHoveredFlags_RectOnly = Ord(ImGuiHoveredFlags_AllowWhenBlockedByPopup) or Ord(ImGuiHoveredFlags_AllowWhenBlockedByActiveItem) or Ord(ImGuiHoveredFlags_AllowWhenOverlapped),
    ImGuiHoveredFlags_RootAndChildWindows = Ord(ImGuiHoveredFlags_RootWindow) or Ord(ImGuiHoveredFlags_ChildWindows),
    ImGuiHoveredFlags_ForTooltip = 1 shl 12,
    ImGuiHoveredFlags_Stationary = 1 shl 13,
    ImGuiHoveredFlags_DelayNone = 1 shl 14,
    ImGuiHoveredFlags_DelayShort = 1 shl 15,
    ImGuiHoveredFlags_DelayNormal = 1 shl 16,
    ImGuiHoveredFlags_NoSharedDelay = 1 shl 17
  );

  ImGuiHoveredFlagsPrivate = (
    ImGuiHoveredFlags_DelayMask_ = Ord(ImGuiHoveredFlags_DelayNone) or Ord(ImGuiHoveredFlags_DelayShort) or Ord(ImGuiHoveredFlags_DelayNormal) or Ord(ImGuiHoveredFlags_NoSharedDelay),
    ImGuiHoveredFlags_AllowedMaskForIsWindowHovered = Ord(ImGuiHoveredFlags_ChildWindows) or Ord(ImGuiHoveredFlags_RootWindow) or Ord(ImGuiHoveredFlags_AnyWindow) or Ord(ImGuiHoveredFlags_NoPopupHierarchy) or Ord(ImGuiHoveredFlags_DockHierarchy) or Ord(ImGuiHoveredFlags_AllowWhenBlockedByPopup) or Ord(ImGuiHoveredFlags_AllowWhenBlockedByActiveItem) or Ord(ImGuiHoveredFlags_ForTooltip) or Ord(ImGuiHoveredFlags_Stationary),
    ImGuiHoveredFlags_AllowedMaskForIsItemHovered = Ord(ImGuiHoveredFlags_AllowWhenBlockedByPopup) or Ord(ImGuiHoveredFlags_AllowWhenBlockedByActiveItem) or Ord(ImGuiHoveredFlags_AllowWhenOverlapped) or Ord(ImGuiHoveredFlags_AllowWhenDisabled) or Ord(ImGuiHoveredFlags_NoNavOverride) or Ord(ImGuiHoveredFlags_ForTooltip) or Ord(ImGuiHoveredFlags_Stationary) or Ord(ImGuiHoveredFlags_DelayMask_)
  );

  ImGuiFocusedFlags = (
    ImGuiFocusedFlags_None = 0,
    ImGuiFocusedFlags_ChildWindows = 1 shl 0,
    ImGuiFocusedFlags_RootWindow = 1 shl 1,
    ImGuiFocusedFlags_AnyWindow = 1 shl 2,
    ImGuiFocusedFlags_NoPopupHierarchy = 1 shl 3,
    ImGuiFocusedFlags_DockHierarchy = 1 shl 4,
    ImGuiFocusedFlags_RootAndChildWindows = Ord(ImGuiFocusedFlags_RootWindow) or Ord(ImGuiFocusedFlags_ChildWindows)
  );

  ImGuiFocusRequestFlags = (
    ImGuiFocusRequestFlags_None = 0,
    ImGuiFocusRequestFlags_RestoreFocusedChild = 1 shl 0,
    ImGuiFocusRequestFlags_UnlessBelowModal = 1 shl 1
  );

  ImGuiDragDropFlags = (
    ImGuiDragDropFlags_None = 0,
    ImGuiDragDropFlags_SourceNoPreviewTooltip = 1 shl 0,
    ImGuiDragDropFlags_SourceNoDisableHover = 1 shl 1,
    ImGuiDragDropFlags_SourceNoHoldToOpenOthers = 1 shl 2,
    ImGuiDragDropFlags_SourceAllowNullID = 1 shl 3,
    ImGuiDragDropFlags_SourceExtern = 1 shl 4,
    ImGuiDragDropFlags_SourceAutoExpirePayload = 1 shl 5,
    ImGuiDragDropFlags_AcceptBeforeDelivery = 1 shl 10,
    ImGuiDragDropFlags_AcceptNoDrawDefaultRect = 1 shl 11,
    ImGuiDragDropFlags_AcceptNoPreviewTooltip = 1 shl 12,
    ImGuiDragDropFlags_AcceptPeekOnly = Ord(ImGuiDragDropFlags_AcceptBeforeDelivery) or Ord(ImGuiDragDropFlags_AcceptNoDrawDefaultRect)
  );

  ImGuiDockNodeState = (
    ImGuiDockNodeState_Unknown = 0,
    ImGuiDockNodeState_HostWindowHiddenBecauseSingleWindow = 1,
    ImGuiDockNodeState_HostWindowHiddenBecauseWindowsAreResizing = 2,
    ImGuiDockNodeState_HostWindowVisible = 3
  );

  ImGuiDockNodeFlags = (
    ImGuiDockNodeFlags_None = 0,
    ImGuiDockNodeFlags_KeepAliveOnly = 1 shl 0,
    ImGuiDockNodeFlags_NoDockingOverCentralNode = 1 shl 2,
    ImGuiDockNodeFlags_PassthruCentralNode = 1 shl 3,
    ImGuiDockNodeFlags_NoDockingSplit = 1 shl 4,
    ImGuiDockNodeFlags_NoResize = 1 shl 5,
    ImGuiDockNodeFlags_AutoHideTabBar = 1 shl 6,
    ImGuiDockNodeFlags_NoUndocking = 1 shl 7
  );

  ImGuiDockNodeFlagsPrivate = (
    ImGuiDockNodeFlags_DockSpace = 1 shl 10,
    ImGuiDockNodeFlags_CentralNode = 1 shl 11,
    ImGuiDockNodeFlags_NoTabBar = 1 shl 12,
    ImGuiDockNodeFlags_HiddenTabBar = 1 shl 13,
    ImGuiDockNodeFlags_NoWindowMenuButton = 1 shl 14,
    ImGuiDockNodeFlags_NoCloseButton = 1 shl 15,
    ImGuiDockNodeFlags_NoResizeX = 1 shl 16,
    ImGuiDockNodeFlags_NoResizeY = 1 shl 17,
    ImGuiDockNodeFlags_NoDockingSplitOther = 1 shl 19,
    ImGuiDockNodeFlags_NoDockingOverMe = 1 shl 20,
    ImGuiDockNodeFlags_NoDockingOverOther = 1 shl 21,
    ImGuiDockNodeFlags_NoDockingOverEmpty = 1 shl 22,
    ImGuiDockNodeFlags_NoDocking = Ord(ImGuiDockNodeFlags_NoDockingOverMe) or Ord(ImGuiDockNodeFlags_NoDockingOverOther) or Ord(ImGuiDockNodeFlags_NoDockingOverEmpty) or Ord(ImGuiDockNodeFlags_NoDockingSplit) or Ord(ImGuiDockNodeFlags_NoDockingSplitOther),
    ImGuiDockNodeFlags_SharedFlagsInheritMask_ = not 0,
    ImGuiDockNodeFlags_NoResizeFlagsMask_ = Ord(ImGuiDockNodeFlags_NoResize) or Ord(ImGuiDockNodeFlags_NoResizeX) or Ord(ImGuiDockNodeFlags_NoResizeY),
    ImGuiDockNodeFlags_LocalFlagsTransferMask_ = Ord(ImGuiDockNodeFlags_NoDockingSplit) or Ord(ImGuiDockNodeFlags_NoResizeFlagsMask_) or Ord(ImGuiDockNodeFlags_AutoHideTabBar) or Ord(ImGuiDockNodeFlags_CentralNode) or Ord(ImGuiDockNodeFlags_NoTabBar) or Ord(ImGuiDockNodeFlags_HiddenTabBar) or Ord(ImGuiDockNodeFlags_NoWindowMenuButton) or Ord(ImGuiDockNodeFlags_NoCloseButton),
    ImGuiDockNodeFlags_SavedFlagsMask_ = Ord(ImGuiDockNodeFlags_NoResizeFlagsMask_) or Ord(ImGuiDockNodeFlags_DockSpace) or Ord(ImGuiDockNodeFlags_CentralNode) or Ord(ImGuiDockNodeFlags_NoTabBar) or Ord(ImGuiDockNodeFlags_HiddenTabBar) or Ord(ImGuiDockNodeFlags_NoWindowMenuButton) or Ord(ImGuiDockNodeFlags_NoCloseButton)
  );

  ImGuiDir = (
    ImGuiDir_None = -1,
    ImGuiDir_Left = 0,
    ImGuiDir_Right = 1,
    ImGuiDir_Up = 2,
    ImGuiDir_Down = 3,
    ImGuiDir_COUNT = 4
  );

  ImGuiDebugLogFlags = (
    ImGuiDebugLogFlags_None = 0,
    ImGuiDebugLogFlags_EventActiveId = 1 shl 0,
    ImGuiDebugLogFlags_EventFocus = 1 shl 1,
    ImGuiDebugLogFlags_EventPopup = 1 shl 2,
    ImGuiDebugLogFlags_EventNav = 1 shl 3,
    ImGuiDebugLogFlags_EventClipper = 1 shl 4,
    ImGuiDebugLogFlags_EventSelection = 1 shl 5,
    ImGuiDebugLogFlags_EventIO = 1 shl 6,
    ImGuiDebugLogFlags_EventDocking = 1 shl 7,
    ImGuiDebugLogFlags_EventViewport = 1 shl 8,
    ImGuiDebugLogFlags_EventMask_ = Ord(ImGuiDebugLogFlags_EventActiveId) or Ord(ImGuiDebugLogFlags_EventFocus) or Ord(ImGuiDebugLogFlags_EventPopup) or Ord(ImGuiDebugLogFlags_EventNav) or Ord(ImGuiDebugLogFlags_EventClipper) or Ord(ImGuiDebugLogFlags_EventSelection) or Ord(ImGuiDebugLogFlags_EventIO) or Ord(ImGuiDebugLogFlags_EventDocking) or Ord(ImGuiDebugLogFlags_EventViewport),
    ImGuiDebugLogFlags_OutputToTTY = 1 shl 10,
    ImGuiDebugLogFlags_OutputToTestEngine = 1 shl 11
  );

  ImGuiDataType = (
    ImGuiDataType_S8 = 0,
    ImGuiDataType_U8 = 1,
    ImGuiDataType_S16 = 2,
    ImGuiDataType_U16 = 3,
    ImGuiDataType_S32 = 4,
    ImGuiDataType_U32 = 5,
    ImGuiDataType_S64 = 6,
    ImGuiDataType_U64 = 7,
    ImGuiDataType_Float = 8,
    ImGuiDataType_Double = 9,
    ImGuiDataType_COUNT = 10
  );

  ImGuiDataTypePrivate = (
    ImGuiDataType_String = Ord(ImGuiDataType_COUNT) + (1),
    ImGuiDataType_Pointer = Ord(ImGuiDataType_COUNT) + (1) + (1),
    ImGuiDataType_ID = Ord(ImGuiDataType_COUNT) + (1) + (1) + (1)
  );

  ImGuiDataAuthority = (
    ImGuiDataAuthority_Auto = 0,
    ImGuiDataAuthority_DockNode = 1,
    ImGuiDataAuthority_Window = 2
  );

  ImGuiContextHookType = (
    ImGuiContextHookType_NewFramePre = 0,
    ImGuiContextHookType_NewFramePost = 1,
    ImGuiContextHookType_EndFramePre = 2,
    ImGuiContextHookType_EndFramePost = 3,
    ImGuiContextHookType_RenderPre = 4,
    ImGuiContextHookType_RenderPost = 5,
    ImGuiContextHookType_Shutdown = 6,
    ImGuiContextHookType_PendingRemoval_ = 7
  );

  ImGuiConfigFlags = (
    ImGuiConfigFlags_None = 0,
    ImGuiConfigFlags_NavEnableKeyboard = 1 shl 0,
    ImGuiConfigFlags_NavEnableGamepad = 1 shl 1,
    ImGuiConfigFlags_NavEnableSetMousePos = 1 shl 2,
    ImGuiConfigFlags_NavNoCaptureKeyboard = 1 shl 3,
    ImGuiConfigFlags_NoMouse = 1 shl 4,
    ImGuiConfigFlags_NoMouseCursorChange = 1 shl 5,
    ImGuiConfigFlags_DockingEnable = 1 shl 6,
    ImGuiConfigFlags_ViewportsEnable = 1 shl 10,
    ImGuiConfigFlags_DpiEnableScaleViewports = 1 shl 14,
    ImGuiConfigFlags_DpiEnableScaleFonts = 1 shl 15,
    ImGuiConfigFlags_IsSRGB = 1 shl 20,
    ImGuiConfigFlags_IsTouchScreen = 1 shl 21
  );

  ImGuiCond = (
    ImGuiCond_None = 0,
    ImGuiCond_Always = 1 shl 0,
    ImGuiCond_Once = 1 shl 1,
    ImGuiCond_FirstUseEver = 1 shl 2,
    ImGuiCond_Appearing = 1 shl 3
  );

  ImGuiComboFlags = (
    ImGuiComboFlags_None = 0,
    ImGuiComboFlags_PopupAlignLeft = 1 shl 0,
    ImGuiComboFlags_HeightSmall = 1 shl 1,
    ImGuiComboFlags_HeightRegular = 1 shl 2,
    ImGuiComboFlags_HeightLarge = 1 shl 3,
    ImGuiComboFlags_HeightLargest = 1 shl 4,
    ImGuiComboFlags_NoArrowButton = 1 shl 5,
    ImGuiComboFlags_NoPreview = 1 shl 6,
    ImGuiComboFlags_WidthFitPreview = 1 shl 7,
    ImGuiComboFlags_HeightMask_ = Ord(ImGuiComboFlags_HeightSmall) or Ord(ImGuiComboFlags_HeightRegular) or Ord(ImGuiComboFlags_HeightLarge) or Ord(ImGuiComboFlags_HeightLargest)
  );

  ImGuiComboFlagsPrivate = (
    ImGuiComboFlags_CustomPreview = 1 shl 20
  );

  ImGuiColorEditFlags = (
    ImGuiColorEditFlags_None = 0,
    ImGuiColorEditFlags_NoAlpha = 1 shl 1,
    ImGuiColorEditFlags_NoPicker = 1 shl 2,
    ImGuiColorEditFlags_NoOptions = 1 shl 3,
    ImGuiColorEditFlags_NoSmallPreview = 1 shl 4,
    ImGuiColorEditFlags_NoInputs = 1 shl 5,
    ImGuiColorEditFlags_NoTooltip = 1 shl 6,
    ImGuiColorEditFlags_NoLabel = 1 shl 7,
    ImGuiColorEditFlags_NoSidePreview = 1 shl 8,
    ImGuiColorEditFlags_NoDragDrop = 1 shl 9,
    ImGuiColorEditFlags_NoBorder = 1 shl 10,
    ImGuiColorEditFlags_AlphaBar = 1 shl 16,
    ImGuiColorEditFlags_AlphaPreview = 1 shl 17,
    ImGuiColorEditFlags_AlphaPreviewHalf = 1 shl 18,
    ImGuiColorEditFlags_HDR = 1 shl 19,
    ImGuiColorEditFlags_DisplayRGB = 1 shl 20,
    ImGuiColorEditFlags_DisplayHSV = 1 shl 21,
    ImGuiColorEditFlags_DisplayHex = 1 shl 22,
    ImGuiColorEditFlags_Uint8 = 1 shl 23,
    ImGuiColorEditFlags_Float = 1 shl 24,
    ImGuiColorEditFlags_PickerHueBar = 1 shl 25,
    ImGuiColorEditFlags_PickerHueWheel = 1 shl 26,
    ImGuiColorEditFlags_InputRGB = 1 shl 27,
    ImGuiColorEditFlags_InputHSV = 1 shl 28,
    ImGuiColorEditFlags_DefaultOptions_ = Ord(ImGuiColorEditFlags_Uint8) or Ord(ImGuiColorEditFlags_DisplayRGB) or Ord(ImGuiColorEditFlags_InputRGB) or Ord(ImGuiColorEditFlags_PickerHueBar),
    ImGuiColorEditFlags_DisplayMask_ = Ord(ImGuiColorEditFlags_DisplayRGB) or Ord(ImGuiColorEditFlags_DisplayHSV) or Ord(ImGuiColorEditFlags_DisplayHex),
    ImGuiColorEditFlags_DataTypeMask_ = Ord(ImGuiColorEditFlags_Uint8) or Ord(ImGuiColorEditFlags_Float),
    ImGuiColorEditFlags_PickerMask_ = Ord(ImGuiColorEditFlags_PickerHueWheel) or Ord(ImGuiColorEditFlags_PickerHueBar),
    ImGuiColorEditFlags_InputMask_ = Ord(ImGuiColorEditFlags_InputRGB) or Ord(ImGuiColorEditFlags_InputHSV)
  );

  ImGuiCol = (
    ImGuiCol_Text = 0,
    ImGuiCol_TextDisabled = 1,
    ImGuiCol_WindowBg = 2,
    ImGuiCol_ChildBg = 3,
    ImGuiCol_PopupBg = 4,
    ImGuiCol_Border = 5,
    ImGuiCol_BorderShadow = 6,
    ImGuiCol_FrameBg = 7,
    ImGuiCol_FrameBgHovered = 8,
    ImGuiCol_FrameBgActive = 9,
    ImGuiCol_TitleBg = 10,
    ImGuiCol_TitleBgActive = 11,
    ImGuiCol_TitleBgCollapsed = 12,
    ImGuiCol_MenuBarBg = 13,
    ImGuiCol_ScrollbarBg = 14,
    ImGuiCol_ScrollbarGrab = 15,
    ImGuiCol_ScrollbarGrabHovered = 16,
    ImGuiCol_ScrollbarGrabActive = 17,
    ImGuiCol_CheckMark = 18,
    ImGuiCol_SliderGrab = 19,
    ImGuiCol_SliderGrabActive = 20,
    ImGuiCol_Button = 21,
    ImGuiCol_ButtonHovered = 22,
    ImGuiCol_ButtonActive = 23,
    ImGuiCol_Header = 24,
    ImGuiCol_HeaderHovered = 25,
    ImGuiCol_HeaderActive = 26,
    ImGuiCol_Separator = 27,
    ImGuiCol_SeparatorHovered = 28,
    ImGuiCol_SeparatorActive = 29,
    ImGuiCol_ResizeGrip = 30,
    ImGuiCol_ResizeGripHovered = 31,
    ImGuiCol_ResizeGripActive = 32,
    ImGuiCol_Tab = 33,
    ImGuiCol_TabHovered = 34,
    ImGuiCol_TabActive = 35,
    ImGuiCol_TabUnfocused = 36,
    ImGuiCol_TabUnfocusedActive = 37,
    ImGuiCol_DockingPreview = 38,
    ImGuiCol_DockingEmptyBg = 39,
    ImGuiCol_PlotLines = 40,
    ImGuiCol_PlotLinesHovered = 41,
    ImGuiCol_PlotHistogram = 42,
    ImGuiCol_PlotHistogramHovered = 43,
    ImGuiCol_TableHeaderBg = 44,
    ImGuiCol_TableBorderStrong = 45,
    ImGuiCol_TableBorderLight = 46,
    ImGuiCol_TableRowBg = 47,
    ImGuiCol_TableRowBgAlt = 48,
    ImGuiCol_TextSelectedBg = 49,
    ImGuiCol_DragDropTarget = 50,
    ImGuiCol_NavHighlight = 51,
    ImGuiCol_NavWindowingHighlight = 52,
    ImGuiCol_NavWindowingDimBg = 53,
    ImGuiCol_ModalWindowDimBg = 54,
    ImGuiCol_COUNT = 55
  );

  ImGuiChildFlags = (
    ImGuiChildFlags_None = 0,
    ImGuiChildFlags_Border = 1 shl 0,
    ImGuiChildFlags_AlwaysUseWindowPadding = 1 shl 1,
    ImGuiChildFlags_ResizeX = 1 shl 2,
    ImGuiChildFlags_ResizeY = 1 shl 3
  );

  ImGuiButtonFlags = (
    ImGuiButtonFlags_None = 0,
    ImGuiButtonFlags_MouseButtonLeft = 1 shl 0,
    ImGuiButtonFlags_MouseButtonRight = 1 shl 1,
    ImGuiButtonFlags_MouseButtonMiddle = 1 shl 2,
    ImGuiButtonFlags_MouseButtonMask_ = Ord(ImGuiButtonFlags_MouseButtonLeft) or Ord(ImGuiButtonFlags_MouseButtonRight) or Ord(ImGuiButtonFlags_MouseButtonMiddle),
    ImGuiButtonFlags_MouseButtonDefault_ = ImGuiButtonFlags_MouseButtonLeft
  );

  ImGuiButtonFlagsPrivate = (
    ImGuiButtonFlags_PressedOnClick = 1 shl 4,
    ImGuiButtonFlags_PressedOnClickRelease = 1 shl 5,
    ImGuiButtonFlags_PressedOnClickReleaseAnywhere = 1 shl 6,
    ImGuiButtonFlags_PressedOnRelease = 1 shl 7,
    ImGuiButtonFlags_PressedOnDoubleClick = 1 shl 8,
    ImGuiButtonFlags_PressedOnDragDropHold = 1 shl 9,
    ImGuiButtonFlags_Repeat = 1 shl 10,
    ImGuiButtonFlags_FlattenChildren = 1 shl 11,
    ImGuiButtonFlags_AllowOverlap = 1 shl 12,
    ImGuiButtonFlags_DontClosePopups = 1 shl 13,
    ImGuiButtonFlags_AlignTextBaseLine = 1 shl 15,
    ImGuiButtonFlags_NoKeyModifiers = 1 shl 16,
    ImGuiButtonFlags_NoHoldingActiveId = 1 shl 17,
    ImGuiButtonFlags_NoNavFocus = 1 shl 18,
    ImGuiButtonFlags_NoHoveredOnFocus = 1 shl 19,
    ImGuiButtonFlags_NoSetKeyOwner = 1 shl 20,
    ImGuiButtonFlags_NoTestKeyOwner = 1 shl 21,
    ImGuiButtonFlags_PressedOnMask_ = Ord(ImGuiButtonFlags_PressedOnClick) or Ord(ImGuiButtonFlags_PressedOnClickRelease) or Ord(ImGuiButtonFlags_PressedOnClickReleaseAnywhere) or Ord(ImGuiButtonFlags_PressedOnRelease) or Ord(ImGuiButtonFlags_PressedOnDoubleClick) or Ord(ImGuiButtonFlags_PressedOnDragDropHold),
    ImGuiButtonFlags_PressedOnDefault_ = ImGuiButtonFlags_PressedOnClickRelease
  );

  ImGuiBackendFlags = (
    ImGuiBackendFlags_None = 0,
    ImGuiBackendFlags_HasGamepad = 1 shl 0,
    ImGuiBackendFlags_HasMouseCursors = 1 shl 1,
    ImGuiBackendFlags_HasSetMousePos = 1 shl 2,
    ImGuiBackendFlags_RendererHasVtxOffset = 1 shl 3,
    ImGuiBackendFlags_PlatformHasViewports = 1 shl 10,
    ImGuiBackendFlags_HasMouseHoveredViewport = 1 shl 11,
    ImGuiBackendFlags_RendererHasViewports = 1 shl 12
  );

  ImGuiAxis = (
    ImGuiAxis_None = -1,
    ImGuiAxis_X = 0,
    ImGuiAxis_Y = 1
  );

  ImGuiActivateFlags = (
    ImGuiActivateFlags_None = 0,
    ImGuiActivateFlags_PreferInput = 1 shl 0,
    ImGuiActivateFlags_PreferTweak = 1 shl 1,
    ImGuiActivateFlags_TryToPreserveState = 1 shl 2
  );

  ImFontAtlasFlags = (
    ImFontAtlasFlags_None = 0,
    ImFontAtlasFlags_NoPowerOfTwoHeight = 1 shl 0,
    ImFontAtlasFlags_NoMouseCursors = 1 shl 1,
    ImFontAtlasFlags_NoBakedLines = 1 shl 2
  );

  ImDrawListFlags = (
    ImDrawListFlags_None = 0,
    ImDrawListFlags_AntiAliasedLines = 1 shl 0,
    ImDrawListFlags_AntiAliasedLinesUseTex = 1 shl 1,
    ImDrawListFlags_AntiAliasedFill = 1 shl 2,
    ImDrawListFlags_AllowVtxOffset = 1 shl 3
  );

  ImDrawFlags = (
    ImDrawFlags_None = 0,
    ImDrawFlags_Closed = 1 shl 0,
    ImDrawFlags_RoundCornersTopLeft = 1 shl 4,
    ImDrawFlags_RoundCornersTopRight = 1 shl 5,
    ImDrawFlags_RoundCornersBottomLeft = 1 shl 6,
    ImDrawFlags_RoundCornersBottomRight = 1 shl 7,
    ImDrawFlags_RoundCornersNone = 1 shl 8,
    ImDrawFlags_RoundCornersTop = Ord(ImDrawFlags_RoundCornersTopLeft) or Ord(ImDrawFlags_RoundCornersTopRight),
    ImDrawFlags_RoundCornersBottom = Ord(ImDrawFlags_RoundCornersBottomLeft) or Ord(ImDrawFlags_RoundCornersBottomRight),
    ImDrawFlags_RoundCornersLeft = Ord(ImDrawFlags_RoundCornersBottomLeft) or Ord(ImDrawFlags_RoundCornersTopLeft),
    ImDrawFlags_RoundCornersRight = Ord(ImDrawFlags_RoundCornersBottomRight) or Ord(ImDrawFlags_RoundCornersTopRight),
    ImDrawFlags_RoundCornersAll = Ord(ImDrawFlags_RoundCornersTopLeft) or Ord(ImDrawFlags_RoundCornersTopRight) or Ord(ImDrawFlags_RoundCornersBottomLeft) or Ord(ImDrawFlags_RoundCornersBottomRight),
    ImDrawFlags_RoundCornersDefault_ = ImDrawFlags_RoundCornersAll,
    ImDrawFlags_RoundCornersMask_ = Ord(ImDrawFlags_RoundCornersAll) or Ord(ImDrawFlags_RoundCornersNone)
  );


  // ImDrawFlags
  operator and (const a,b:ImDrawFlags):ImDrawFlags;
  operator or (const a,b:ImDrawFlags):ImDrawFlags;
  operator not(const a: ImDrawFlags): ImDrawFlags;

  // ImDrawListFlags
  operator and (const a,b:ImDrawListFlags):ImDrawListFlags;
  operator or (const a,b:ImDrawListFlags):ImDrawListFlags;
  operator not(const a: ImDrawListFlags): ImDrawListFlags;

  // ImFontAtlasFlags
  operator and (const a,b:ImFontAtlasFlags):ImFontAtlasFlags;
  operator or (const a,b:ImFontAtlasFlags):ImFontAtlasFlags;
  operator not(const a: ImFontAtlasFlags): ImFontAtlasFlags;

  // ImGuiActivateFlags
  operator and (const a,b:ImGuiActivateFlags):ImGuiActivateFlags;
  operator or (const a,b:ImGuiActivateFlags):ImGuiActivateFlags;
  operator not(const a: ImGuiActivateFlags): ImGuiActivateFlags;

  // ImGuiAxis
  operator and (const a,b:ImGuiAxis):ImGuiAxis;
  operator or (const a,b:ImGuiAxis):ImGuiAxis;
  operator not(const a: ImGuiAxis): ImGuiAxis;

  // ImGuiBackendFlags
  operator and (const a,b:ImGuiBackendFlags):ImGuiBackendFlags;
  operator or (const a,b:ImGuiBackendFlags):ImGuiBackendFlags;
  operator not(const a: ImGuiBackendFlags): ImGuiBackendFlags;

  // ImGuiButtonFlagsPrivate
  operator and (const a,b:ImGuiButtonFlagsPrivate):ImGuiButtonFlagsPrivate;
  operator or (const a,b:ImGuiButtonFlagsPrivate):ImGuiButtonFlagsPrivate;
  operator not(const a: ImGuiButtonFlagsPrivate): ImGuiButtonFlagsPrivate;

  // ImGuiButtonFlags
  operator and (const a,b:ImGuiButtonFlags):ImGuiButtonFlags;
  operator or (const a,b:ImGuiButtonFlags):ImGuiButtonFlags;
  operator not(const a: ImGuiButtonFlags): ImGuiButtonFlags;

  // ImGuiChildFlags
  operator and (const a,b:ImGuiChildFlags):ImGuiChildFlags;
  operator or (const a,b:ImGuiChildFlags):ImGuiChildFlags;
  operator not(const a: ImGuiChildFlags): ImGuiChildFlags;

  // ImGuiCol
  operator and (const a,b:ImGuiCol):ImGuiCol;
  operator or (const a,b:ImGuiCol):ImGuiCol;
  operator not(const a: ImGuiCol): ImGuiCol;

  // ImGuiColorEditFlags
  operator and (const a,b:ImGuiColorEditFlags):ImGuiColorEditFlags;
  operator or (const a,b:ImGuiColorEditFlags):ImGuiColorEditFlags;
  operator not(const a: ImGuiColorEditFlags): ImGuiColorEditFlags;

  // ImGuiComboFlagsPrivate
  operator and (const a,b:ImGuiComboFlagsPrivate):ImGuiComboFlagsPrivate;
  operator or (const a,b:ImGuiComboFlagsPrivate):ImGuiComboFlagsPrivate;
  operator not(const a: ImGuiComboFlagsPrivate): ImGuiComboFlagsPrivate;

  // ImGuiComboFlags
  operator and (const a,b:ImGuiComboFlags):ImGuiComboFlags;
  operator or (const a,b:ImGuiComboFlags):ImGuiComboFlags;
  operator not(const a: ImGuiComboFlags): ImGuiComboFlags;

  // ImGuiCond
  operator and (const a,b:ImGuiCond):ImGuiCond;
  operator or (const a,b:ImGuiCond):ImGuiCond;
  operator not(const a: ImGuiCond): ImGuiCond;

  // ImGuiConfigFlags
  operator and (const a,b:ImGuiConfigFlags):ImGuiConfigFlags;
  operator or (const a,b:ImGuiConfigFlags):ImGuiConfigFlags;
  operator not(const a: ImGuiConfigFlags): ImGuiConfigFlags;

  // ImGuiContextHookType
  operator and (const a,b:ImGuiContextHookType):ImGuiContextHookType;
  operator or (const a,b:ImGuiContextHookType):ImGuiContextHookType;
  operator not(const a: ImGuiContextHookType): ImGuiContextHookType;

  // ImGuiDataAuthority
  operator and (const a,b:ImGuiDataAuthority):ImGuiDataAuthority;
  operator or (const a,b:ImGuiDataAuthority):ImGuiDataAuthority;
  operator not(const a: ImGuiDataAuthority): ImGuiDataAuthority;

  // ImGuiDataTypePrivate
  operator and (const a,b:ImGuiDataTypePrivate):ImGuiDataTypePrivate;
  operator or (const a,b:ImGuiDataTypePrivate):ImGuiDataTypePrivate;
  operator not(const a: ImGuiDataTypePrivate): ImGuiDataTypePrivate;

  // ImGuiDataType
  operator and (const a,b:ImGuiDataType):ImGuiDataType;
  operator or (const a,b:ImGuiDataType):ImGuiDataType;
  operator not(const a: ImGuiDataType): ImGuiDataType;

  // ImGuiDebugLogFlags
  operator and (const a,b:ImGuiDebugLogFlags):ImGuiDebugLogFlags;
  operator or (const a,b:ImGuiDebugLogFlags):ImGuiDebugLogFlags;
  operator not(const a: ImGuiDebugLogFlags): ImGuiDebugLogFlags;

  // ImGuiDir
  operator and (const a,b:ImGuiDir):ImGuiDir;
  operator or (const a,b:ImGuiDir):ImGuiDir;
  operator not(const a: ImGuiDir): ImGuiDir;

  // ImGuiDockNodeFlagsPrivate
  operator and (const a,b:ImGuiDockNodeFlagsPrivate):ImGuiDockNodeFlagsPrivate;
  operator or (const a,b:ImGuiDockNodeFlagsPrivate):ImGuiDockNodeFlagsPrivate;
  operator not(const a: ImGuiDockNodeFlagsPrivate): ImGuiDockNodeFlagsPrivate;

  // ImGuiDockNodeFlags
  operator and (const a,b:ImGuiDockNodeFlags):ImGuiDockNodeFlags;
  operator or (const a,b:ImGuiDockNodeFlags):ImGuiDockNodeFlags;
  operator not(const a: ImGuiDockNodeFlags): ImGuiDockNodeFlags;

  // ImGuiDockNodeState
  operator and (const a,b:ImGuiDockNodeState):ImGuiDockNodeState;
  operator or (const a,b:ImGuiDockNodeState):ImGuiDockNodeState;
  operator not(const a: ImGuiDockNodeState): ImGuiDockNodeState;

  // ImGuiDragDropFlags
  operator and (const a,b:ImGuiDragDropFlags):ImGuiDragDropFlags;
  operator or (const a,b:ImGuiDragDropFlags):ImGuiDragDropFlags;
  operator not(const a: ImGuiDragDropFlags): ImGuiDragDropFlags;

  // ImGuiFocusRequestFlags
  operator and (const a,b:ImGuiFocusRequestFlags):ImGuiFocusRequestFlags;
  operator or (const a,b:ImGuiFocusRequestFlags):ImGuiFocusRequestFlags;
  operator not(const a: ImGuiFocusRequestFlags): ImGuiFocusRequestFlags;

  // ImGuiFocusedFlags
  operator and (const a,b:ImGuiFocusedFlags):ImGuiFocusedFlags;
  operator or (const a,b:ImGuiFocusedFlags):ImGuiFocusedFlags;
  operator not(const a: ImGuiFocusedFlags): ImGuiFocusedFlags;

  // ImGuiHoveredFlagsPrivate
  operator and (const a,b:ImGuiHoveredFlagsPrivate):ImGuiHoveredFlagsPrivate;
  operator or (const a,b:ImGuiHoveredFlagsPrivate):ImGuiHoveredFlagsPrivate;
  operator not(const a: ImGuiHoveredFlagsPrivate): ImGuiHoveredFlagsPrivate;

  // ImGuiHoveredFlags
  operator and (const a,b:ImGuiHoveredFlags):ImGuiHoveredFlags;
  operator or (const a,b:ImGuiHoveredFlags):ImGuiHoveredFlags;
  operator not(const a: ImGuiHoveredFlags): ImGuiHoveredFlags;

  // ImGuiInputEventType
  operator and (const a,b:ImGuiInputEventType):ImGuiInputEventType;
  operator or (const a,b:ImGuiInputEventType):ImGuiInputEventType;
  operator not(const a: ImGuiInputEventType): ImGuiInputEventType;

  // ImGuiInputFlags
  operator and (const a,b:ImGuiInputFlags):ImGuiInputFlags;
  operator or (const a,b:ImGuiInputFlags):ImGuiInputFlags;
  operator not(const a: ImGuiInputFlags): ImGuiInputFlags;

  // ImGuiInputSource
  operator and (const a,b:ImGuiInputSource):ImGuiInputSource;
  operator or (const a,b:ImGuiInputSource):ImGuiInputSource;
  operator not(const a: ImGuiInputSource): ImGuiInputSource;

  // ImGuiInputTextFlagsPrivate
  operator and (const a,b:ImGuiInputTextFlagsPrivate):ImGuiInputTextFlagsPrivate;
  operator or (const a,b:ImGuiInputTextFlagsPrivate):ImGuiInputTextFlagsPrivate;
  operator not(const a: ImGuiInputTextFlagsPrivate): ImGuiInputTextFlagsPrivate;

  // ImGuiInputTextFlags
  operator and (const a,b:ImGuiInputTextFlags):ImGuiInputTextFlags;
  operator or (const a,b:ImGuiInputTextFlags):ImGuiInputTextFlags;
  operator not(const a: ImGuiInputTextFlags): ImGuiInputTextFlags;

  // ImGuiItemFlags
  operator and (const a,b:ImGuiItemFlags):ImGuiItemFlags;
  operator or (const a,b:ImGuiItemFlags):ImGuiItemFlags;
  operator not(const a: ImGuiItemFlags): ImGuiItemFlags;

  // ImGuiItemStatusFlags
  operator and (const a,b:ImGuiItemStatusFlags):ImGuiItemStatusFlags;
  operator or (const a,b:ImGuiItemStatusFlags):ImGuiItemStatusFlags;
  operator not(const a: ImGuiItemStatusFlags): ImGuiItemStatusFlags;

  // ImGuiKey
  operator and (const a,b:ImGuiKey):ImGuiKey;
  operator or (const a,b:ImGuiKey):ImGuiKey;
  operator not(const a: ImGuiKey): ImGuiKey;

  // ImGuiLayoutType
  operator and (const a,b:ImGuiLayoutType):ImGuiLayoutType;
  operator or (const a,b:ImGuiLayoutType):ImGuiLayoutType;
  operator not(const a: ImGuiLayoutType): ImGuiLayoutType;

  // ImGuiLocKey
  operator and (const a,b:ImGuiLocKey):ImGuiLocKey;
  operator or (const a,b:ImGuiLocKey):ImGuiLocKey;
  operator not(const a: ImGuiLocKey): ImGuiLocKey;

  // ImGuiLogType
  operator and (const a,b:ImGuiLogType):ImGuiLogType;
  operator or (const a,b:ImGuiLogType):ImGuiLogType;
  operator not(const a: ImGuiLogType): ImGuiLogType;

  // ImGuiMouseButton
  operator and (const a,b:ImGuiMouseButton):ImGuiMouseButton;
  operator or (const a,b:ImGuiMouseButton):ImGuiMouseButton;
  operator not(const a: ImGuiMouseButton): ImGuiMouseButton;

  // ImGuiMouseCursor
  operator and (const a,b:ImGuiMouseCursor):ImGuiMouseCursor;
  operator or (const a,b:ImGuiMouseCursor):ImGuiMouseCursor;
  operator not(const a: ImGuiMouseCursor): ImGuiMouseCursor;

  // ImGuiMouseSource
  operator and (const a,b:ImGuiMouseSource):ImGuiMouseSource;
  operator or (const a,b:ImGuiMouseSource):ImGuiMouseSource;
  operator not(const a: ImGuiMouseSource): ImGuiMouseSource;

  // ImGuiNavHighlightFlags
  operator and (const a,b:ImGuiNavHighlightFlags):ImGuiNavHighlightFlags;
  operator or (const a,b:ImGuiNavHighlightFlags):ImGuiNavHighlightFlags;
  operator not(const a: ImGuiNavHighlightFlags): ImGuiNavHighlightFlags;

  // ImGuiNavInput
  operator and (const a,b:ImGuiNavInput):ImGuiNavInput;
  operator or (const a,b:ImGuiNavInput):ImGuiNavInput;
  operator not(const a: ImGuiNavInput): ImGuiNavInput;

  // ImGuiNavLayer
  operator and (const a,b:ImGuiNavLayer):ImGuiNavLayer;
  operator or (const a,b:ImGuiNavLayer):ImGuiNavLayer;
  operator not(const a: ImGuiNavLayer): ImGuiNavLayer;

  // ImGuiNavMoveFlags
  operator and (const a,b:ImGuiNavMoveFlags):ImGuiNavMoveFlags;
  operator or (const a,b:ImGuiNavMoveFlags):ImGuiNavMoveFlags;
  operator not(const a: ImGuiNavMoveFlags): ImGuiNavMoveFlags;

  // ImGuiNextItemDataFlags
  operator and (const a,b:ImGuiNextItemDataFlags):ImGuiNextItemDataFlags;
  operator or (const a,b:ImGuiNextItemDataFlags):ImGuiNextItemDataFlags;
  operator not(const a: ImGuiNextItemDataFlags): ImGuiNextItemDataFlags;

  // ImGuiNextWindowDataFlags
  operator and (const a,b:ImGuiNextWindowDataFlags):ImGuiNextWindowDataFlags;
  operator or (const a,b:ImGuiNextWindowDataFlags):ImGuiNextWindowDataFlags;
  operator not(const a: ImGuiNextWindowDataFlags): ImGuiNextWindowDataFlags;

  // ImGuiOldColumnFlags
  operator and (const a,b:ImGuiOldColumnFlags):ImGuiOldColumnFlags;
  operator or (const a,b:ImGuiOldColumnFlags):ImGuiOldColumnFlags;
  operator not(const a: ImGuiOldColumnFlags): ImGuiOldColumnFlags;

  // ImGuiPlotType
  operator and (const a,b:ImGuiPlotType):ImGuiPlotType;
  operator or (const a,b:ImGuiPlotType):ImGuiPlotType;
  operator not(const a: ImGuiPlotType): ImGuiPlotType;

  // ImGuiPopupFlags
  operator and (const a,b:ImGuiPopupFlags):ImGuiPopupFlags;
  operator or (const a,b:ImGuiPopupFlags):ImGuiPopupFlags;
  operator not(const a: ImGuiPopupFlags): ImGuiPopupFlags;

  // ImGuiPopupPositionPolicy
  operator and (const a,b:ImGuiPopupPositionPolicy):ImGuiPopupPositionPolicy;
  operator or (const a,b:ImGuiPopupPositionPolicy):ImGuiPopupPositionPolicy;
  operator not(const a: ImGuiPopupPositionPolicy): ImGuiPopupPositionPolicy;

  // ImGuiScrollFlags
  operator and (const a,b:ImGuiScrollFlags):ImGuiScrollFlags;
  operator or (const a,b:ImGuiScrollFlags):ImGuiScrollFlags;
  operator not(const a: ImGuiScrollFlags): ImGuiScrollFlags;

  // ImGuiSelectableFlagsPrivate
  operator and (const a,b:ImGuiSelectableFlagsPrivate):ImGuiSelectableFlagsPrivate;
  operator or (const a,b:ImGuiSelectableFlagsPrivate):ImGuiSelectableFlagsPrivate;
  operator not(const a: ImGuiSelectableFlagsPrivate): ImGuiSelectableFlagsPrivate;

  // ImGuiSelectableFlags
  operator and (const a,b:ImGuiSelectableFlags):ImGuiSelectableFlags;
  operator or (const a,b:ImGuiSelectableFlags):ImGuiSelectableFlags;
  operator not(const a: ImGuiSelectableFlags): ImGuiSelectableFlags;

  // ImGuiSeparatorFlags
  operator and (const a,b:ImGuiSeparatorFlags):ImGuiSeparatorFlags;
  operator or (const a,b:ImGuiSeparatorFlags):ImGuiSeparatorFlags;
  operator not(const a: ImGuiSeparatorFlags): ImGuiSeparatorFlags;

  // ImGuiSliderFlagsPrivate
  operator and (const a,b:ImGuiSliderFlagsPrivate):ImGuiSliderFlagsPrivate;
  operator or (const a,b:ImGuiSliderFlagsPrivate):ImGuiSliderFlagsPrivate;
  operator not(const a: ImGuiSliderFlagsPrivate): ImGuiSliderFlagsPrivate;

  // ImGuiSliderFlags
  operator and (const a,b:ImGuiSliderFlags):ImGuiSliderFlags;
  operator or (const a,b:ImGuiSliderFlags):ImGuiSliderFlags;
  operator not(const a: ImGuiSliderFlags): ImGuiSliderFlags;

  // ImGuiSortDirection
  operator and (const a,b:ImGuiSortDirection):ImGuiSortDirection;
  operator or (const a,b:ImGuiSortDirection):ImGuiSortDirection;
  operator not(const a: ImGuiSortDirection): ImGuiSortDirection;

  // ImGuiStyleVar
  operator and (const a,b:ImGuiStyleVar):ImGuiStyleVar;
  operator or (const a,b:ImGuiStyleVar):ImGuiStyleVar;
  operator not(const a: ImGuiStyleVar): ImGuiStyleVar;

  // ImGuiTabBarFlagsPrivate
  operator and (const a,b:ImGuiTabBarFlagsPrivate):ImGuiTabBarFlagsPrivate;
  operator or (const a,b:ImGuiTabBarFlagsPrivate):ImGuiTabBarFlagsPrivate;
  operator not(const a: ImGuiTabBarFlagsPrivate): ImGuiTabBarFlagsPrivate;

  // ImGuiTabBarFlags
  operator and (const a,b:ImGuiTabBarFlags):ImGuiTabBarFlags;
  operator or (const a,b:ImGuiTabBarFlags):ImGuiTabBarFlags;
  operator not(const a: ImGuiTabBarFlags): ImGuiTabBarFlags;

  // ImGuiTabItemFlagsPrivate
  operator and (const a,b:ImGuiTabItemFlagsPrivate):ImGuiTabItemFlagsPrivate;
  operator or (const a,b:ImGuiTabItemFlagsPrivate):ImGuiTabItemFlagsPrivate;
  operator not(const a: ImGuiTabItemFlagsPrivate): ImGuiTabItemFlagsPrivate;

  // ImGuiTabItemFlags
  operator and (const a,b:ImGuiTabItemFlags):ImGuiTabItemFlags;
  operator or (const a,b:ImGuiTabItemFlags):ImGuiTabItemFlags;
  operator not(const a: ImGuiTabItemFlags): ImGuiTabItemFlags;

  // ImGuiTableBgTarget
  operator and (const a,b:ImGuiTableBgTarget):ImGuiTableBgTarget;
  operator or (const a,b:ImGuiTableBgTarget):ImGuiTableBgTarget;
  operator not(const a: ImGuiTableBgTarget): ImGuiTableBgTarget;

  // ImGuiTableColumnFlags
  operator and (const a,b:ImGuiTableColumnFlags):ImGuiTableColumnFlags;
  operator or (const a,b:ImGuiTableColumnFlags):ImGuiTableColumnFlags;
  operator not(const a: ImGuiTableColumnFlags): ImGuiTableColumnFlags;

  // ImGuiTableFlags
  operator and (const a,b:ImGuiTableFlags):ImGuiTableFlags;
  operator or (const a,b:ImGuiTableFlags):ImGuiTableFlags;
  operator not(const a: ImGuiTableFlags): ImGuiTableFlags;

  // ImGuiTableRowFlags
  operator and (const a,b:ImGuiTableRowFlags):ImGuiTableRowFlags;
  operator or (const a,b:ImGuiTableRowFlags):ImGuiTableRowFlags;
  operator not(const a: ImGuiTableRowFlags): ImGuiTableRowFlags;

  // ImGuiTextFlags
  operator and (const a,b:ImGuiTextFlags):ImGuiTextFlags;
  operator or (const a,b:ImGuiTextFlags):ImGuiTextFlags;
  operator not(const a: ImGuiTextFlags): ImGuiTextFlags;

  // ImGuiTooltipFlags
  operator and (const a,b:ImGuiTooltipFlags):ImGuiTooltipFlags;
  operator or (const a,b:ImGuiTooltipFlags):ImGuiTooltipFlags;
  operator not(const a: ImGuiTooltipFlags): ImGuiTooltipFlags;

  // ImGuiTreeNodeFlagsPrivate
  operator and (const a,b:ImGuiTreeNodeFlagsPrivate):ImGuiTreeNodeFlagsPrivate;
  operator or (const a,b:ImGuiTreeNodeFlagsPrivate):ImGuiTreeNodeFlagsPrivate;
  operator not(const a: ImGuiTreeNodeFlagsPrivate): ImGuiTreeNodeFlagsPrivate;

  // ImGuiTreeNodeFlags
  operator and (const a,b:ImGuiTreeNodeFlags):ImGuiTreeNodeFlags;
  operator or (const a,b:ImGuiTreeNodeFlags):ImGuiTreeNodeFlags;
  operator not(const a: ImGuiTreeNodeFlags): ImGuiTreeNodeFlags;

  // ImGuiTypingSelectFlags
  operator and (const a,b:ImGuiTypingSelectFlags):ImGuiTypingSelectFlags;
  operator or (const a,b:ImGuiTypingSelectFlags):ImGuiTypingSelectFlags;
  operator not(const a: ImGuiTypingSelectFlags): ImGuiTypingSelectFlags;

  // ImGuiViewportFlags
  operator and (const a,b:ImGuiViewportFlags):ImGuiViewportFlags;
  operator or (const a,b:ImGuiViewportFlags):ImGuiViewportFlags;
  operator not(const a: ImGuiViewportFlags): ImGuiViewportFlags;

  // ImGuiWindowDockStyleCol
  operator and (const a,b:ImGuiWindowDockStyleCol):ImGuiWindowDockStyleCol;
  operator or (const a,b:ImGuiWindowDockStyleCol):ImGuiWindowDockStyleCol;
  operator not(const a: ImGuiWindowDockStyleCol): ImGuiWindowDockStyleCol;

  // ImGuiWindowFlags
  operator and (const a,b:ImGuiWindowFlags):ImGuiWindowFlags;
  operator or (const a,b:ImGuiWindowFlags):ImGuiWindowFlags;
  operator not(const a: ImGuiWindowFlags): ImGuiWindowFlags;
implementation

// ImDrawFlags
operator and (const a,b:ImDrawFlags):ImDrawFlags;inline;
begin
  Result:= ImDrawFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImDrawFlags):ImDrawFlags;inline;
begin
  Result:= ImDrawFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImDrawFlags): ImDrawFlags;
begin
  Result:= ImDrawFlags(not Ord(a));
end;

// ImDrawListFlags
operator and (const a,b:ImDrawListFlags):ImDrawListFlags;inline;
begin
  Result:= ImDrawListFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImDrawListFlags):ImDrawListFlags;inline;
begin
  Result:= ImDrawListFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImDrawListFlags): ImDrawListFlags;
begin
  Result:= ImDrawListFlags(not Ord(a));
end;

// ImFontAtlasFlags
operator and (const a,b:ImFontAtlasFlags):ImFontAtlasFlags;inline;
begin
  Result:= ImFontAtlasFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImFontAtlasFlags):ImFontAtlasFlags;inline;
begin
  Result:= ImFontAtlasFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImFontAtlasFlags): ImFontAtlasFlags;
begin
  Result:= ImFontAtlasFlags(not Ord(a));
end;

// ImGuiActivateFlags
operator and (const a,b:ImGuiActivateFlags):ImGuiActivateFlags;inline;
begin
  Result:= ImGuiActivateFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiActivateFlags):ImGuiActivateFlags;inline;
begin
  Result:= ImGuiActivateFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiActivateFlags): ImGuiActivateFlags;
begin
  Result:= ImGuiActivateFlags(not Ord(a));
end;

// ImGuiAxis
operator and (const a,b:ImGuiAxis):ImGuiAxis;inline;
begin
  Result:= ImGuiAxis(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiAxis):ImGuiAxis;inline;
begin
  Result:= ImGuiAxis(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiAxis): ImGuiAxis;
begin
  Result:= ImGuiAxis(not Ord(a));
end;

// ImGuiBackendFlags
operator and (const a,b:ImGuiBackendFlags):ImGuiBackendFlags;inline;
begin
  Result:= ImGuiBackendFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiBackendFlags):ImGuiBackendFlags;inline;
begin
  Result:= ImGuiBackendFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiBackendFlags): ImGuiBackendFlags;
begin
  Result:= ImGuiBackendFlags(not Ord(a));
end;

// ImGuiButtonFlagsPrivate
operator and (const a,b:ImGuiButtonFlagsPrivate):ImGuiButtonFlagsPrivate;inline;
begin
  Result:= ImGuiButtonFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiButtonFlagsPrivate):ImGuiButtonFlagsPrivate;inline;
begin
  Result:= ImGuiButtonFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiButtonFlagsPrivate): ImGuiButtonFlagsPrivate;
begin
  Result:= ImGuiButtonFlagsPrivate(not Ord(a));
end;

// ImGuiButtonFlags
operator and (const a,b:ImGuiButtonFlags):ImGuiButtonFlags;inline;
begin
  Result:= ImGuiButtonFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiButtonFlags):ImGuiButtonFlags;inline;
begin
  Result:= ImGuiButtonFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiButtonFlags): ImGuiButtonFlags;
begin
  Result:= ImGuiButtonFlags(not Ord(a));
end;

// ImGuiChildFlags
operator and (const a,b:ImGuiChildFlags):ImGuiChildFlags;inline;
begin
  Result:= ImGuiChildFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiChildFlags):ImGuiChildFlags;inline;
begin
  Result:= ImGuiChildFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiChildFlags): ImGuiChildFlags;
begin
  Result:= ImGuiChildFlags(not Ord(a));
end;

// ImGuiCol
operator and (const a,b:ImGuiCol):ImGuiCol;inline;
begin
  Result:= ImGuiCol(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiCol):ImGuiCol;inline;
begin
  Result:= ImGuiCol(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiCol): ImGuiCol;
begin
  Result:= ImGuiCol(not Ord(a));
end;

// ImGuiColorEditFlags
operator and (const a,b:ImGuiColorEditFlags):ImGuiColorEditFlags;inline;
begin
  Result:= ImGuiColorEditFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiColorEditFlags):ImGuiColorEditFlags;inline;
begin
  Result:= ImGuiColorEditFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiColorEditFlags): ImGuiColorEditFlags;
begin
  Result:= ImGuiColorEditFlags(not Ord(a));
end;

// ImGuiComboFlagsPrivate
operator and (const a,b:ImGuiComboFlagsPrivate):ImGuiComboFlagsPrivate;inline;
begin
  Result:= ImGuiComboFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiComboFlagsPrivate):ImGuiComboFlagsPrivate;inline;
begin
  Result:= ImGuiComboFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiComboFlagsPrivate): ImGuiComboFlagsPrivate;
begin
  Result:= ImGuiComboFlagsPrivate(not Ord(a));
end;

// ImGuiComboFlags
operator and (const a,b:ImGuiComboFlags):ImGuiComboFlags;inline;
begin
  Result:= ImGuiComboFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiComboFlags):ImGuiComboFlags;inline;
begin
  Result:= ImGuiComboFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiComboFlags): ImGuiComboFlags;
begin
  Result:= ImGuiComboFlags(not Ord(a));
end;

// ImGuiCond
operator and (const a,b:ImGuiCond):ImGuiCond;inline;
begin
  Result:= ImGuiCond(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiCond):ImGuiCond;inline;
begin
  Result:= ImGuiCond(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiCond): ImGuiCond;
begin
  Result:= ImGuiCond(not Ord(a));
end;

// ImGuiConfigFlags
operator and (const a,b:ImGuiConfigFlags):ImGuiConfigFlags;inline;
begin
  Result:= ImGuiConfigFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiConfigFlags):ImGuiConfigFlags;inline;
begin
  Result:= ImGuiConfigFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiConfigFlags): ImGuiConfigFlags;
begin
  Result:= ImGuiConfigFlags(not Ord(a));
end;

// ImGuiContextHookType
operator and (const a,b:ImGuiContextHookType):ImGuiContextHookType;inline;
begin
  Result:= ImGuiContextHookType(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiContextHookType):ImGuiContextHookType;inline;
begin
  Result:= ImGuiContextHookType(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiContextHookType): ImGuiContextHookType;
begin
  Result:= ImGuiContextHookType(not Ord(a));
end;

// ImGuiDataAuthority
operator and (const a,b:ImGuiDataAuthority):ImGuiDataAuthority;inline;
begin
  Result:= ImGuiDataAuthority(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDataAuthority):ImGuiDataAuthority;inline;
begin
  Result:= ImGuiDataAuthority(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDataAuthority): ImGuiDataAuthority;
begin
  Result:= ImGuiDataAuthority(not Ord(a));
end;

// ImGuiDataTypePrivate
operator and (const a,b:ImGuiDataTypePrivate):ImGuiDataTypePrivate;inline;
begin
  Result:= ImGuiDataTypePrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDataTypePrivate):ImGuiDataTypePrivate;inline;
begin
  Result:= ImGuiDataTypePrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDataTypePrivate): ImGuiDataTypePrivate;
begin
  Result:= ImGuiDataTypePrivate(not Ord(a));
end;

// ImGuiDataType
operator and (const a,b:ImGuiDataType):ImGuiDataType;inline;
begin
  Result:= ImGuiDataType(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDataType):ImGuiDataType;inline;
begin
  Result:= ImGuiDataType(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDataType): ImGuiDataType;
begin
  Result:= ImGuiDataType(not Ord(a));
end;

// ImGuiDebugLogFlags
operator and (const a,b:ImGuiDebugLogFlags):ImGuiDebugLogFlags;inline;
begin
  Result:= ImGuiDebugLogFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDebugLogFlags):ImGuiDebugLogFlags;inline;
begin
  Result:= ImGuiDebugLogFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDebugLogFlags): ImGuiDebugLogFlags;
begin
  Result:= ImGuiDebugLogFlags(not Ord(a));
end;

// ImGuiDir
operator and (const a,b:ImGuiDir):ImGuiDir;inline;
begin
  Result:= ImGuiDir(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDir):ImGuiDir;inline;
begin
  Result:= ImGuiDir(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDir): ImGuiDir;
begin
  Result:= ImGuiDir(not Ord(a));
end;

// ImGuiDockNodeFlagsPrivate
operator and (const a,b:ImGuiDockNodeFlagsPrivate):ImGuiDockNodeFlagsPrivate;inline;
begin
  Result:= ImGuiDockNodeFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDockNodeFlagsPrivate):ImGuiDockNodeFlagsPrivate;inline;
begin
  Result:= ImGuiDockNodeFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDockNodeFlagsPrivate): ImGuiDockNodeFlagsPrivate;
begin
  Result:= ImGuiDockNodeFlagsPrivate(not Ord(a));
end;

// ImGuiDockNodeFlags
operator and (const a,b:ImGuiDockNodeFlags):ImGuiDockNodeFlags;inline;
begin
  Result:= ImGuiDockNodeFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDockNodeFlags):ImGuiDockNodeFlags;inline;
begin
  Result:= ImGuiDockNodeFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDockNodeFlags): ImGuiDockNodeFlags;
begin
  Result:= ImGuiDockNodeFlags(not Ord(a));
end;

// ImGuiDockNodeState
operator and (const a,b:ImGuiDockNodeState):ImGuiDockNodeState;inline;
begin
  Result:= ImGuiDockNodeState(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDockNodeState):ImGuiDockNodeState;inline;
begin
  Result:= ImGuiDockNodeState(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDockNodeState): ImGuiDockNodeState;
begin
  Result:= ImGuiDockNodeState(not Ord(a));
end;

// ImGuiDragDropFlags
operator and (const a,b:ImGuiDragDropFlags):ImGuiDragDropFlags;inline;
begin
  Result:= ImGuiDragDropFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiDragDropFlags):ImGuiDragDropFlags;inline;
begin
  Result:= ImGuiDragDropFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiDragDropFlags): ImGuiDragDropFlags;
begin
  Result:= ImGuiDragDropFlags(not Ord(a));
end;

// ImGuiFocusRequestFlags
operator and (const a,b:ImGuiFocusRequestFlags):ImGuiFocusRequestFlags;inline;
begin
  Result:= ImGuiFocusRequestFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiFocusRequestFlags):ImGuiFocusRequestFlags;inline;
begin
  Result:= ImGuiFocusRequestFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiFocusRequestFlags): ImGuiFocusRequestFlags;
begin
  Result:= ImGuiFocusRequestFlags(not Ord(a));
end;

// ImGuiFocusedFlags
operator and (const a,b:ImGuiFocusedFlags):ImGuiFocusedFlags;inline;
begin
  Result:= ImGuiFocusedFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiFocusedFlags):ImGuiFocusedFlags;inline;
begin
  Result:= ImGuiFocusedFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiFocusedFlags): ImGuiFocusedFlags;
begin
  Result:= ImGuiFocusedFlags(not Ord(a));
end;

// ImGuiHoveredFlagsPrivate
operator and (const a,b:ImGuiHoveredFlagsPrivate):ImGuiHoveredFlagsPrivate;inline;
begin
  Result:= ImGuiHoveredFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiHoveredFlagsPrivate):ImGuiHoveredFlagsPrivate;inline;
begin
  Result:= ImGuiHoveredFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiHoveredFlagsPrivate): ImGuiHoveredFlagsPrivate;
begin
  Result:= ImGuiHoveredFlagsPrivate(not Ord(a));
end;

// ImGuiHoveredFlags
operator and (const a,b:ImGuiHoveredFlags):ImGuiHoveredFlags;inline;
begin
  Result:= ImGuiHoveredFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiHoveredFlags):ImGuiHoveredFlags;inline;
begin
  Result:= ImGuiHoveredFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiHoveredFlags): ImGuiHoveredFlags;
begin
  Result:= ImGuiHoveredFlags(not Ord(a));
end;

// ImGuiInputEventType
operator and (const a,b:ImGuiInputEventType):ImGuiInputEventType;inline;
begin
  Result:= ImGuiInputEventType(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiInputEventType):ImGuiInputEventType;inline;
begin
  Result:= ImGuiInputEventType(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiInputEventType): ImGuiInputEventType;
begin
  Result:= ImGuiInputEventType(not Ord(a));
end;

// ImGuiInputFlags
operator and (const a,b:ImGuiInputFlags):ImGuiInputFlags;inline;
begin
  Result:= ImGuiInputFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiInputFlags):ImGuiInputFlags;inline;
begin
  Result:= ImGuiInputFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiInputFlags): ImGuiInputFlags;
begin
  Result:= ImGuiInputFlags(not Ord(a));
end;

// ImGuiInputSource
operator and (const a,b:ImGuiInputSource):ImGuiInputSource;inline;
begin
  Result:= ImGuiInputSource(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiInputSource):ImGuiInputSource;inline;
begin
  Result:= ImGuiInputSource(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiInputSource): ImGuiInputSource;
begin
  Result:= ImGuiInputSource(not Ord(a));
end;

// ImGuiInputTextFlagsPrivate
operator and (const a,b:ImGuiInputTextFlagsPrivate):ImGuiInputTextFlagsPrivate;inline;
begin
  Result:= ImGuiInputTextFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiInputTextFlagsPrivate):ImGuiInputTextFlagsPrivate;inline;
begin
  Result:= ImGuiInputTextFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiInputTextFlagsPrivate): ImGuiInputTextFlagsPrivate;
begin
  Result:= ImGuiInputTextFlagsPrivate(not Ord(a));
end;

// ImGuiInputTextFlags
operator and (const a,b:ImGuiInputTextFlags):ImGuiInputTextFlags;inline;
begin
  Result:= ImGuiInputTextFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiInputTextFlags):ImGuiInputTextFlags;inline;
begin
  Result:= ImGuiInputTextFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiInputTextFlags): ImGuiInputTextFlags;
begin
  Result:= ImGuiInputTextFlags(not Ord(a));
end;

// ImGuiItemFlags
operator and (const a,b:ImGuiItemFlags):ImGuiItemFlags;inline;
begin
  Result:= ImGuiItemFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiItemFlags):ImGuiItemFlags;inline;
begin
  Result:= ImGuiItemFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiItemFlags): ImGuiItemFlags;
begin
  Result:= ImGuiItemFlags(not Ord(a));
end;

// ImGuiItemStatusFlags
operator and (const a,b:ImGuiItemStatusFlags):ImGuiItemStatusFlags;inline;
begin
  Result:= ImGuiItemStatusFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiItemStatusFlags):ImGuiItemStatusFlags;inline;
begin
  Result:= ImGuiItemStatusFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiItemStatusFlags): ImGuiItemStatusFlags;
begin
  Result:= ImGuiItemStatusFlags(not Ord(a));
end;

// ImGuiKey
operator and (const a,b:ImGuiKey):ImGuiKey;inline;
begin
  Result:= ImGuiKey(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiKey):ImGuiKey;inline;
begin
  Result:= ImGuiKey(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiKey): ImGuiKey;
begin
  Result:= ImGuiKey(not Ord(a));
end;

// ImGuiLayoutType
operator and (const a,b:ImGuiLayoutType):ImGuiLayoutType;inline;
begin
  Result:= ImGuiLayoutType(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiLayoutType):ImGuiLayoutType;inline;
begin
  Result:= ImGuiLayoutType(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiLayoutType): ImGuiLayoutType;
begin
  Result:= ImGuiLayoutType(not Ord(a));
end;

// ImGuiLocKey
operator and (const a,b:ImGuiLocKey):ImGuiLocKey;inline;
begin
  Result:= ImGuiLocKey(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiLocKey):ImGuiLocKey;inline;
begin
  Result:= ImGuiLocKey(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiLocKey): ImGuiLocKey;
begin
  Result:= ImGuiLocKey(not Ord(a));
end;

// ImGuiLogType
operator and (const a,b:ImGuiLogType):ImGuiLogType;inline;
begin
  Result:= ImGuiLogType(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiLogType):ImGuiLogType;inline;
begin
  Result:= ImGuiLogType(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiLogType): ImGuiLogType;
begin
  Result:= ImGuiLogType(not Ord(a));
end;

// ImGuiMouseButton
operator and (const a,b:ImGuiMouseButton):ImGuiMouseButton;inline;
begin
  Result:= ImGuiMouseButton(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiMouseButton):ImGuiMouseButton;inline;
begin
  Result:= ImGuiMouseButton(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiMouseButton): ImGuiMouseButton;
begin
  Result:= ImGuiMouseButton(not Ord(a));
end;

// ImGuiMouseCursor
operator and (const a,b:ImGuiMouseCursor):ImGuiMouseCursor;inline;
begin
  Result:= ImGuiMouseCursor(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiMouseCursor):ImGuiMouseCursor;inline;
begin
  Result:= ImGuiMouseCursor(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiMouseCursor): ImGuiMouseCursor;
begin
  Result:= ImGuiMouseCursor(not Ord(a));
end;

// ImGuiMouseSource
operator and (const a,b:ImGuiMouseSource):ImGuiMouseSource;inline;
begin
  Result:= ImGuiMouseSource(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiMouseSource):ImGuiMouseSource;inline;
begin
  Result:= ImGuiMouseSource(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiMouseSource): ImGuiMouseSource;
begin
  Result:= ImGuiMouseSource(not Ord(a));
end;

// ImGuiNavHighlightFlags
operator and (const a,b:ImGuiNavHighlightFlags):ImGuiNavHighlightFlags;inline;
begin
  Result:= ImGuiNavHighlightFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiNavHighlightFlags):ImGuiNavHighlightFlags;inline;
begin
  Result:= ImGuiNavHighlightFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiNavHighlightFlags): ImGuiNavHighlightFlags;
begin
  Result:= ImGuiNavHighlightFlags(not Ord(a));
end;

// ImGuiNavInput
operator and (const a,b:ImGuiNavInput):ImGuiNavInput;inline;
begin
  Result:= ImGuiNavInput(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiNavInput):ImGuiNavInput;inline;
begin
  Result:= ImGuiNavInput(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiNavInput): ImGuiNavInput;
begin
  Result:= ImGuiNavInput(not Ord(a));
end;

// ImGuiNavLayer
operator and (const a,b:ImGuiNavLayer):ImGuiNavLayer;inline;
begin
  Result:= ImGuiNavLayer(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiNavLayer):ImGuiNavLayer;inline;
begin
  Result:= ImGuiNavLayer(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiNavLayer): ImGuiNavLayer;
begin
  Result:= ImGuiNavLayer(not Ord(a));
end;

// ImGuiNavMoveFlags
operator and (const a,b:ImGuiNavMoveFlags):ImGuiNavMoveFlags;inline;
begin
  Result:= ImGuiNavMoveFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiNavMoveFlags):ImGuiNavMoveFlags;inline;
begin
  Result:= ImGuiNavMoveFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiNavMoveFlags): ImGuiNavMoveFlags;
begin
  Result:= ImGuiNavMoveFlags(not Ord(a));
end;

// ImGuiNextItemDataFlags
operator and (const a,b:ImGuiNextItemDataFlags):ImGuiNextItemDataFlags;inline;
begin
  Result:= ImGuiNextItemDataFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiNextItemDataFlags):ImGuiNextItemDataFlags;inline;
begin
  Result:= ImGuiNextItemDataFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiNextItemDataFlags): ImGuiNextItemDataFlags;
begin
  Result:= ImGuiNextItemDataFlags(not Ord(a));
end;

// ImGuiNextWindowDataFlags
operator and (const a,b:ImGuiNextWindowDataFlags):ImGuiNextWindowDataFlags;inline;
begin
  Result:= ImGuiNextWindowDataFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiNextWindowDataFlags):ImGuiNextWindowDataFlags;inline;
begin
  Result:= ImGuiNextWindowDataFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiNextWindowDataFlags): ImGuiNextWindowDataFlags;
begin
  Result:= ImGuiNextWindowDataFlags(not Ord(a));
end;

// ImGuiOldColumnFlags
operator and (const a,b:ImGuiOldColumnFlags):ImGuiOldColumnFlags;inline;
begin
  Result:= ImGuiOldColumnFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiOldColumnFlags):ImGuiOldColumnFlags;inline;
begin
  Result:= ImGuiOldColumnFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiOldColumnFlags): ImGuiOldColumnFlags;
begin
  Result:= ImGuiOldColumnFlags(not Ord(a));
end;

// ImGuiPlotType
operator and (const a,b:ImGuiPlotType):ImGuiPlotType;inline;
begin
  Result:= ImGuiPlotType(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiPlotType):ImGuiPlotType;inline;
begin
  Result:= ImGuiPlotType(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiPlotType): ImGuiPlotType;
begin
  Result:= ImGuiPlotType(not Ord(a));
end;

// ImGuiPopupFlags
operator and (const a,b:ImGuiPopupFlags):ImGuiPopupFlags;inline;
begin
  Result:= ImGuiPopupFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiPopupFlags):ImGuiPopupFlags;inline;
begin
  Result:= ImGuiPopupFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiPopupFlags): ImGuiPopupFlags;
begin
  Result:= ImGuiPopupFlags(not Ord(a));
end;

// ImGuiPopupPositionPolicy
operator and (const a,b:ImGuiPopupPositionPolicy):ImGuiPopupPositionPolicy;inline;
begin
  Result:= ImGuiPopupPositionPolicy(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiPopupPositionPolicy):ImGuiPopupPositionPolicy;inline;
begin
  Result:= ImGuiPopupPositionPolicy(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiPopupPositionPolicy): ImGuiPopupPositionPolicy;
begin
  Result:= ImGuiPopupPositionPolicy(not Ord(a));
end;

// ImGuiScrollFlags
operator and (const a,b:ImGuiScrollFlags):ImGuiScrollFlags;inline;
begin
  Result:= ImGuiScrollFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiScrollFlags):ImGuiScrollFlags;inline;
begin
  Result:= ImGuiScrollFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiScrollFlags): ImGuiScrollFlags;
begin
  Result:= ImGuiScrollFlags(not Ord(a));
end;

// ImGuiSelectableFlagsPrivate
operator and (const a,b:ImGuiSelectableFlagsPrivate):ImGuiSelectableFlagsPrivate;inline;
begin
  Result:= ImGuiSelectableFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiSelectableFlagsPrivate):ImGuiSelectableFlagsPrivate;inline;
begin
  Result:= ImGuiSelectableFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiSelectableFlagsPrivate): ImGuiSelectableFlagsPrivate;
begin
  Result:= ImGuiSelectableFlagsPrivate(not Ord(a));
end;

// ImGuiSelectableFlags
operator and (const a,b:ImGuiSelectableFlags):ImGuiSelectableFlags;inline;
begin
  Result:= ImGuiSelectableFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiSelectableFlags):ImGuiSelectableFlags;inline;
begin
  Result:= ImGuiSelectableFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiSelectableFlags): ImGuiSelectableFlags;
begin
  Result:= ImGuiSelectableFlags(not Ord(a));
end;

// ImGuiSeparatorFlags
operator and (const a,b:ImGuiSeparatorFlags):ImGuiSeparatorFlags;inline;
begin
  Result:= ImGuiSeparatorFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiSeparatorFlags):ImGuiSeparatorFlags;inline;
begin
  Result:= ImGuiSeparatorFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiSeparatorFlags): ImGuiSeparatorFlags;
begin
  Result:= ImGuiSeparatorFlags(not Ord(a));
end;

// ImGuiSliderFlagsPrivate
operator and (const a,b:ImGuiSliderFlagsPrivate):ImGuiSliderFlagsPrivate;inline;
begin
  Result:= ImGuiSliderFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiSliderFlagsPrivate):ImGuiSliderFlagsPrivate;inline;
begin
  Result:= ImGuiSliderFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiSliderFlagsPrivate): ImGuiSliderFlagsPrivate;
begin
  Result:= ImGuiSliderFlagsPrivate(not Ord(a));
end;

// ImGuiSliderFlags
operator and (const a,b:ImGuiSliderFlags):ImGuiSliderFlags;inline;
begin
  Result:= ImGuiSliderFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiSliderFlags):ImGuiSliderFlags;inline;
begin
  Result:= ImGuiSliderFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiSliderFlags): ImGuiSliderFlags;
begin
  Result:= ImGuiSliderFlags(not Ord(a));
end;

// ImGuiSortDirection
operator and (const a,b:ImGuiSortDirection):ImGuiSortDirection;inline;
begin
  Result:= ImGuiSortDirection(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiSortDirection):ImGuiSortDirection;inline;
begin
  Result:= ImGuiSortDirection(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiSortDirection): ImGuiSortDirection;
begin
  Result:= ImGuiSortDirection(not Ord(a));
end;

// ImGuiStyleVar
operator and (const a,b:ImGuiStyleVar):ImGuiStyleVar;inline;
begin
  Result:= ImGuiStyleVar(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiStyleVar):ImGuiStyleVar;inline;
begin
  Result:= ImGuiStyleVar(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiStyleVar): ImGuiStyleVar;
begin
  Result:= ImGuiStyleVar(not Ord(a));
end;

// ImGuiTabBarFlagsPrivate
operator and (const a,b:ImGuiTabBarFlagsPrivate):ImGuiTabBarFlagsPrivate;inline;
begin
  Result:= ImGuiTabBarFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTabBarFlagsPrivate):ImGuiTabBarFlagsPrivate;inline;
begin
  Result:= ImGuiTabBarFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTabBarFlagsPrivate): ImGuiTabBarFlagsPrivate;
begin
  Result:= ImGuiTabBarFlagsPrivate(not Ord(a));
end;

// ImGuiTabBarFlags
operator and (const a,b:ImGuiTabBarFlags):ImGuiTabBarFlags;inline;
begin
  Result:= ImGuiTabBarFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTabBarFlags):ImGuiTabBarFlags;inline;
begin
  Result:= ImGuiTabBarFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTabBarFlags): ImGuiTabBarFlags;
begin
  Result:= ImGuiTabBarFlags(not Ord(a));
end;

// ImGuiTabItemFlagsPrivate
operator and (const a,b:ImGuiTabItemFlagsPrivate):ImGuiTabItemFlagsPrivate;inline;
begin
  Result:= ImGuiTabItemFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTabItemFlagsPrivate):ImGuiTabItemFlagsPrivate;inline;
begin
  Result:= ImGuiTabItemFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTabItemFlagsPrivate): ImGuiTabItemFlagsPrivate;
begin
  Result:= ImGuiTabItemFlagsPrivate(not Ord(a));
end;

// ImGuiTabItemFlags
operator and (const a,b:ImGuiTabItemFlags):ImGuiTabItemFlags;inline;
begin
  Result:= ImGuiTabItemFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTabItemFlags):ImGuiTabItemFlags;inline;
begin
  Result:= ImGuiTabItemFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTabItemFlags): ImGuiTabItemFlags;
begin
  Result:= ImGuiTabItemFlags(not Ord(a));
end;

// ImGuiTableBgTarget
operator and (const a,b:ImGuiTableBgTarget):ImGuiTableBgTarget;inline;
begin
  Result:= ImGuiTableBgTarget(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTableBgTarget):ImGuiTableBgTarget;inline;
begin
  Result:= ImGuiTableBgTarget(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTableBgTarget): ImGuiTableBgTarget;
begin
  Result:= ImGuiTableBgTarget(not Ord(a));
end;

// ImGuiTableColumnFlags
operator and (const a,b:ImGuiTableColumnFlags):ImGuiTableColumnFlags;inline;
begin
  Result:= ImGuiTableColumnFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTableColumnFlags):ImGuiTableColumnFlags;inline;
begin
  Result:= ImGuiTableColumnFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTableColumnFlags): ImGuiTableColumnFlags;
begin
  Result:= ImGuiTableColumnFlags(not Ord(a));
end;

// ImGuiTableFlags
operator and (const a,b:ImGuiTableFlags):ImGuiTableFlags;inline;
begin
  Result:= ImGuiTableFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTableFlags):ImGuiTableFlags;inline;
begin
  Result:= ImGuiTableFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTableFlags): ImGuiTableFlags;
begin
  Result:= ImGuiTableFlags(not Ord(a));
end;

// ImGuiTableRowFlags
operator and (const a,b:ImGuiTableRowFlags):ImGuiTableRowFlags;inline;
begin
  Result:= ImGuiTableRowFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTableRowFlags):ImGuiTableRowFlags;inline;
begin
  Result:= ImGuiTableRowFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTableRowFlags): ImGuiTableRowFlags;
begin
  Result:= ImGuiTableRowFlags(not Ord(a));
end;

// ImGuiTextFlags
operator and (const a,b:ImGuiTextFlags):ImGuiTextFlags;inline;
begin
  Result:= ImGuiTextFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTextFlags):ImGuiTextFlags;inline;
begin
  Result:= ImGuiTextFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTextFlags): ImGuiTextFlags;
begin
  Result:= ImGuiTextFlags(not Ord(a));
end;

// ImGuiTooltipFlags
operator and (const a,b:ImGuiTooltipFlags):ImGuiTooltipFlags;inline;
begin
  Result:= ImGuiTooltipFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTooltipFlags):ImGuiTooltipFlags;inline;
begin
  Result:= ImGuiTooltipFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTooltipFlags): ImGuiTooltipFlags;
begin
  Result:= ImGuiTooltipFlags(not Ord(a));
end;

// ImGuiTreeNodeFlagsPrivate
operator and (const a,b:ImGuiTreeNodeFlagsPrivate):ImGuiTreeNodeFlagsPrivate;inline;
begin
  Result:= ImGuiTreeNodeFlagsPrivate(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTreeNodeFlagsPrivate):ImGuiTreeNodeFlagsPrivate;inline;
begin
  Result:= ImGuiTreeNodeFlagsPrivate(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTreeNodeFlagsPrivate): ImGuiTreeNodeFlagsPrivate;
begin
  Result:= ImGuiTreeNodeFlagsPrivate(not Ord(a));
end;

// ImGuiTreeNodeFlags
operator and (const a,b:ImGuiTreeNodeFlags):ImGuiTreeNodeFlags;inline;
begin
  Result:= ImGuiTreeNodeFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTreeNodeFlags):ImGuiTreeNodeFlags;inline;
begin
  Result:= ImGuiTreeNodeFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTreeNodeFlags): ImGuiTreeNodeFlags;
begin
  Result:= ImGuiTreeNodeFlags(not Ord(a));
end;

// ImGuiTypingSelectFlags
operator and (const a,b:ImGuiTypingSelectFlags):ImGuiTypingSelectFlags;inline;
begin
  Result:= ImGuiTypingSelectFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiTypingSelectFlags):ImGuiTypingSelectFlags;inline;
begin
  Result:= ImGuiTypingSelectFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiTypingSelectFlags): ImGuiTypingSelectFlags;
begin
  Result:= ImGuiTypingSelectFlags(not Ord(a));
end;

// ImGuiViewportFlags
operator and (const a,b:ImGuiViewportFlags):ImGuiViewportFlags;inline;
begin
  Result:= ImGuiViewportFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiViewportFlags):ImGuiViewportFlags;inline;
begin
  Result:= ImGuiViewportFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiViewportFlags): ImGuiViewportFlags;
begin
  Result:= ImGuiViewportFlags(not Ord(a));
end;

// ImGuiWindowDockStyleCol
operator and (const a,b:ImGuiWindowDockStyleCol):ImGuiWindowDockStyleCol;inline;
begin
  Result:= ImGuiWindowDockStyleCol(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiWindowDockStyleCol):ImGuiWindowDockStyleCol;inline;
begin
  Result:= ImGuiWindowDockStyleCol(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiWindowDockStyleCol): ImGuiWindowDockStyleCol;
begin
  Result:= ImGuiWindowDockStyleCol(not Ord(a));
end;

// ImGuiWindowFlags
operator and (const a,b:ImGuiWindowFlags):ImGuiWindowFlags;inline;
begin
  Result:= ImGuiWindowFlags(Ord(a) and Ord(b));
end;
operator or (const a,b:ImGuiWindowFlags):ImGuiWindowFlags;inline;
begin
  Result:= ImGuiWindowFlags(Ord(a) or Ord(b));
end;
operator not(const a: ImGuiWindowFlags): ImGuiWindowFlags;
begin
  Result:= ImGuiWindowFlags(not Ord(a));
end;

End.

