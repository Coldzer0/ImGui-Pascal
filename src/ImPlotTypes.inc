Type
  tm = Record
    tm_sec: Integer;     // seconds after the minute - [0,59]
    tm_min: Integer;     // minutes after the hour - [0,59]
    tm_hour: Integer;    // hours since midnight - [0,23]
    tm_mday: Integer;    // day of the month - [1,31]
    tm_mon: Integer;     // months since January - [0,11]
    tm_year: Integer;    // years since 1900
    tm_wday: Integer;    // days since Sunday - [0,6]
    tm_yday: Integer;    // days since January 1 - [0,365]
    tm_isdst: Integer;   // daylight savings time flag
  End;
  Ptm = ^tm;
