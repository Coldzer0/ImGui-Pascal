{$Define DYNAMIC_LINK}
{$IfDef FPC}
  {$UnDef DYNAMIC_LINK}
{$EndIf}
{$IfNDef FPC}
  {$If CompilerVersion>=22.0}
    {$if CompilerVersion=22.0}
      {$define DelphiXE}
    {$ifend}
    {$define DelphiXEAndUp}
  {$ifend}
{$EndIf}

