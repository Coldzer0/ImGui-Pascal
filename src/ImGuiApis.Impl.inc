{ImGuiTableColumnSortSpecs}

function ImGuiTableColumnSortSpecs.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumnSortSpecs.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImFontGlyph}

function ImFontGlyph.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImFontGlyph.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiDockNode}

function ImGuiDockNode.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiDockNode.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiStackLevelInfo}

function ImGuiStackLevelInfo.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiStackLevelInfo.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiWindow}

function ImGuiWindow.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiWindow.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiWindow}

function ImGuiWindow.GetData1Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data1 shr Offset) and Mask;
end;

procedure ImGuiWindow.SetData1Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data1 := (Data1 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTableColumn}

function ImGuiTableColumn.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumn.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTable}

function ImGuiTable.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTable.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;

{ImGuiTableColumnSettings}

function ImGuiTableColumnSettings.GetData0Value(const AIndex: Integer): Cardinal;
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Result := (Data0 shr Offset) and Mask;
end;

procedure ImGuiTableColumnSettings.SetData0Value(const AIndex: Integer; const AValue: Cardinal);
var
  BitCount, Offset, Mask: Cardinal;
begin
  BitCount := AIndex and $FF;
  Offset := AIndex shr 8;
  Mask := ((1 shl BitCount) - 1);
  Data0 := (Data0 and (not (Mask shl Offset))) or (AValue shl Offset);
end;
