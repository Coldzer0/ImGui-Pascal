Unit PasImGui.ImPlot;

{$IFDEF FPC}
  {$mode Delphi}{$H+}{$J-}
{$ENDIF}


Interface

Uses
  SysUtils,
  PasImGui;


const
  IMPLOT_AUTO = -1;
  IMPLOT_AUTO_COL : ImVec4 = (x:0; y:0; z:0; w:-1);

Type

  { ImPlot }

  ImPlot = Class

    Class Procedure Initialize(ImGuiCtx : PImGuiContext = nil);

    Class Function BeginPlot(Const title_id: PAnsiChar;
      flags: ImPlotFlags = ImPlotFlags_None): Boolean; Overload;
    Class Function BeginPlot(Const title_id: PAnsiChar; size: ImVec2;
      flags: ImPlotFlags = ImPlotFlags_None): Boolean; Overload;
    Class Procedure SetupAxes(Const x_label: PAnsiChar; Const y_label: PAnsiChar;
      x_flags: ImPlotAxisFlags = 0; y_flags: ImPlotAxisFlags = 0);

    // Float
    Class Procedure PlotLine(Const label_id: PAnsiChar; Const xs: PSingle;
      Const ys: PSingle; Count: Integer; flags: ImPlotLineFlags = 0); Overload;
    Class Procedure PlotLine(Const label_id: PAnsiChar; Const xs: PSingle;
      Const ys: PSingle; Count: Integer; flags: ImPlotLineFlags;
      offset: Integer; stride: Integer); Overload;

    // Double
    Class Procedure PlotLine(const label_id: PAnsiChar; const xs: PDouble;
      const ys: PDouble; count: Integer; flags: ImPlotLineFlags = 0); Overload;
    class procedure PlotLine(const label_id: PAnsiChar; const xs: PDouble;
      const ys: PDouble; count: Integer; flags: ImPlotLineFlags; offset: Integer; stride: Integer); Overload;


    class procedure SetNextMarkerStyle(marker: ImPlotMarker = IMPLOT_AUTO; size: Single = IMPLOT_AUTO); overload;
    class procedure SetNextMarkerStyle(marker: ImPlotMarker; size: Single; fill: ImVec4; weight: Single; outline: ImVec4); overload;

    Class Procedure EndPlot();
  End;

Implementation

Uses
  PasImGui.Utils;

  { ImPlot }

class procedure ImPlot.Initialize(ImGuiCtx: PImGuiContext);
begin
  ImPlot_Initialize(ImPlot_CreateContext());
  if ImGuiCtx = nil then
    ImGuiCtx := ImGui.GetCurrentContext();
  ImPlot_SetImGuiContext(ImGuiCtx);
end;

class function ImPlot.BeginPlot(
  const title_id: PAnsiChar; flags: ImPlotFlags): Boolean;
Begin
  Result := BeginPlot(title_id, ImVec2.New(-1, 0), flags);
End;

class function ImPlot.BeginPlot(
  const title_id: PAnsiChar; size: ImVec2; flags: ImPlotFlags): Boolean;
Begin
  Result := ImPlot_BeginPlot(title_id, size, flags);
End;

class procedure ImPlot.SetupAxes(const x_label: PAnsiChar;
  const y_label: PAnsiChar; x_flags: ImPlotAxisFlags; y_flags: ImPlotAxisFlags);
Begin
  ImPlot_SetupAxes(x_label, y_label, x_flags, y_flags);
End;

class procedure ImPlot.PlotLine(const label_id: PAnsiChar; const xs: PSingle;
  const ys: PSingle; Count: Integer; flags: ImPlotLineFlags);
begin
  PlotLine(label_id, xs, ys, Count, flags, 0, SizeOf(Single));
end;

// PlotLine(const char* label_id, const T* xs, const T* ys, int count, ImPlotLineFlags flags, int offset, int stride)
class procedure ImPlot.PlotLine(const label_id: PAnsiChar; const xs: PSingle;
  const ys: PSingle; Count: Integer; flags: ImPlotLineFlags; offset: Integer; stride: Integer);
Begin
  ImPlot_PlotLine_FloatPtrFloatPtr(label_id, xs, ys, Count, flags, offset, stride);
End;

class procedure ImPlot.PlotLine(const label_id: PAnsiChar; const xs: PDouble;
  const ys: PDouble; count: Integer; flags: ImPlotLineFlags);
begin
  PlotLine(label_id, xs, ys, Count, flags, 0, SizeOf(Double));
end;

class procedure ImPlot.PlotLine(const label_id: PAnsiChar; const xs: PDouble; const ys: PDouble; count: Integer; flags: ImPlotLineFlags; offset: Integer; stride: Integer);
Begin
  ImPlot_PlotLine_doublePtrdoublePtr(label_id, xs, ys, Count, flags, offset, stride);
End;



class procedure ImPlot.SetNextMarkerStyle(marker: ImPlotMarker; size: Single);
begin
  SetNextMarkerStyle(marker, size, IMPLOT_AUTO_COL, IMPLOT_AUTO, IMPLOT_AUTO_COL);
end;

class procedure ImPlot.SetNextMarkerStyle(marker: ImPlotMarker; size: Single; fill: ImVec4; weight: Single; outline: ImVec4);
begin
  ImPlot_SetNextMarkerStyle(marker, size, fill, weight, outline);
end;

class procedure ImPlot.EndPlot();
begin
  ImPlot_EndPlot();
end;

End.
