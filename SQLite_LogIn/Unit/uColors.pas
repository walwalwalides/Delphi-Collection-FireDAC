{ ============================================
  Software Name : 	LogInMyTasks
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit uColors;

interface

uses
  Windows, Graphics;

type

  // List Of Defined your Own Colors
  TColorsList = class
    clLightBlack        :TColor;
    clAliceBlue         : TColor;
    clAntiquewhite      : TColor;
    clAqua              : TColor;
    clAquaMarine        : TColor;
    clAzure             : TColor;
    clBeige             : TColor;
    clBlack             : TColor;
    clBisque            : TColor;
    clBlue              : TColor;
    clBrown             : TColor;
    clBurlyWood         : TColor;
    clCadetBlue         : TColor;
    clChartreuse        : TColor;
    clChocolate         : TColor;
    clCoral             : TColor;
    clCornFlowerBlue    : TColor;
    clCyan              : TColor;
    clDarkBlue          : TColor;
    clDarkCyan          : TColor;
    clDarkGoldenRod     : TColor;
    clDarkGray          : TColor;
    clDarkGreen         : TColor;
    clDarkKhaki         : TColor;
    clDarkOrange        : TColor;
    clDarkRed           : TColor;
    clDarkSalmon        : TColor;
    clDarkSeaGreen      : TColor;
    clDarkSlateGray     : TColor;
    clDarkTurquoise     : TColor;
    clDarkViolet        : TColor;
    clDeepPink          : TColor;
    clDeepSkyBlue       : TColor;
    clDimGray           : TColor;
    clFireBrick         : TColor;
    clFuchsia           : TColor;
    clGainsBoro         : TColor;
    clGold              : TColor;
    clGoldenRod         : TColor;
    clGray              : TColor;
    clGreen             : TColor;
    clGreenYellow       : TColor;
    clHoneydew          : TColor;
    clHotPink           : TColor;
    clIndiaRed          : TColor;
    clIndigo            : TColor;
    clKhaki             : TColor;
    clLavander          : TColor;
    clLawnGreen         : TColor;
    clLemonChiffon      : TColor;
    clLightBlue         : TColor;
    clLightCoral        : TColor;
    clLightCyan         : TColor;
    clLightGreen        : TColor;
    clLightGray         : TColor;
    clLightPink         : TColor;
    clLightSalmon       : TColor;
    clLightSeaGreen     : TColor;
    clLightSlateGray    : TColor;
    clLightSteelBlue    : TColor;
    clLightYellow       : TColor;
    clLime              : TColor;
    clLimeGreen         : TColor;
    clMagenta           : TColor;
    clMaroon            : TColor;
    clMediumAquaMarine  : TColor;
    clMediumBlue        : TColor;
    clMediumOrchid      : TColor;
    clMediumPurple      : TColor;
    clMediumSeaGreen    : TColor;
    clMediumSlateBlue   : TColor;
    clMediumSpringGreen : TColor;
    clMediumTurquoise   : TColor;
    clMediumVioletRed   : TColor;
    clMocassin          : TColor;
    clMoney             : TColor;
    clNavy              : TColor;
    clOldLace           : TColor;
    clOlive             : TColor;
    clOliveDrab         : TColor;
    clOrange            : TColor;
    clOrangeRed         : TColor;
    clOrchid            : TColor;
    clPaleGoldenRod     : TColor;
    clPaleGreen         : TColor;
    clPaleTurquoise     : TColor;
    clPaleVioletRed     : TColor;
    clPeachPuff         : TColor;
    clPeru              : TColor;
    clPink              : TColor;
    clPlume             : TColor;
    clPowderBlue        : TColor;
    clPurple            : TColor;
    clRed               : TColor;
    clRosyBrown         : TColor;
    clRoyalBlue         : TColor;
    clSaddleBrown       : TColor;
    clSalmon            : TColor;
    clSandyBrown        : TColor;
    clSeaGreen          : TColor;
    clSienna            : TColor;
    clSilver            : TColor;
    clSkyBlue           : TColor;
    clSlateBlue         : TColor;
    clSlateGray         : TColor;
    clSpringGreen       : TColor;
    clSteelBlue         : TColor;
    clTan               : TColor;
    clTeal              : TColor;
    clThistle           : TColor;
    clTomato            : TColor;
    clTurquoise         : TColor;
    clViolet            : TColor;
    clWheat             : TColor;
    clWhite             : TColor;
    clWhiteSmoke        : TColor;
    clYellow            : TColor;
    clYellowGreen       : TColor;
    procedure CalculateColors (const nNbrColors: word; var aColors: array of TColor);
  end;

var

  ColorsList  : TColorsList;


implementation



procedure TColorsList.CalculateColors (const nNbrColors: word; var aColors: array of TColor);
var
  i             : word;
  nR1, nG1, nB1 : word;
  nR2, nG2, nB2 : word;
  nDR, nDG, nDB : word;
begin
  nR1 := 0;
  nG1 := 0;
  nB1 := 0;

  nR2 := 255;
  nG2 := 255;
  nB2 := 255;

  nDR := (nR2 - nR1) div nNbrColors;
  nDG := (nG2 - nG1) div nNbrColors;
  nDB := (nB2 - nB1) div nNbrColors;

  for i := 0 to Length(aColors) - 1 do begin
    aColors[i] := RGB (nR2, nG2, nB2);
    nR2 := nR2 - nDR;
    nG2 := nG2 - nDG;
    nB2 := nB2 - nDB;
  end;
end;


initialization
  ColorsList := TColorsList.Create;
  with ColorsList do begin
    clLightBlack        := $00404040;
    clAliceBlue         := $00FFF8F0;
    clAntiquewhite      := $00D7EBFA;
    clAqua              := $00FFFF00;
    clAquaMarine        := $00D4FF7F;
    clAzure             := $00FFFFF0;
    clBeige             := $00DCF5F5;
    clBlack             := $00000000;
    clBisque            := $00C4E4FF;
    clBlue              := $00FF0000;
    clBrown             := $002A2AA5;
    clBurlyWood         := $0087B8DE;
    clCadetBlue         := $00A09E5F;
    clChartreuse        := $0000FF7F;
    clChocolate         := $001E69D2;
    clCoral             := $00507FFF;
    clCornFlowerBlue    := $00ED9564;
    clCyan              := $00FFFF00;
    clDarkBlue          := $008B0000;
    clDarkCyan          := $008B8B00;
    clDarkGoldenRod     := $000B86B8;
    clDarkGray          := $00A9A9A9;
    clDaRkGreen         := $00006400;
    clDarkKhaki         := $006DB7BD;
    clDarkOrange        := $00008CFF;
    clDarkRed           := $0000008B;
    clDarkSalmon        := $007A96E9;
    clDarkSeaGreen      := $008FBC8F;
    clDarkSlateGray     := $002F4F4F;
    clDarkTurquoise     := $00D1CE00;
    clDarkViolet        := $00D30094;
    clDeepPink          := $009314FF;
    clDeepSkyBlue       := $00FFBF00;
    clDimGray           := $00696969;
    clFireBrick         := $002222B2;
    clFuchsia           := $00FF00FF;
    clGainsBoro         := $00DCDCDC;
    clGold              := $0000D7FF;
    clGoldenRod         := $0020A5DA;
    clGray              := $00808080;
    clGreen             := $00008000;
    clGreenYellow       := $002FFFAD;
    clHoneydew          := $00F0FFF0;
    clHotPink           := $00B469FF;
    clIndiaRed          := $005C5CCD;
    clIndigo            := $0082004B;
    clKhaki             := $008CE6F0;
    clLavander          := $00FAE6E6;
    clLawnGreen         := $0000FC7C;
    clLemonChiffon      := $00CDFAFF;
    clLightBlue         := $00E6D8AD;
    clLightCoral        := $008080F0;
    clLightCyan         := $00FFFFE0;
    clLightGreen        := $0090EE90;
    clLightGray         := $00D3D3D3;
    clLightPink         := $00C1B6FF;
    clLightSalmon       := $007AA0FF;
    clLightSeaGreen     := $00AAB220;
    clLightSlateGray    := $00998877;
    clLightSteelBlue    := $00DEC4B0;
    clLightYellow       := $00E0FFFF;
    clLime              := $0000FF00;
    clLimeGreen         := $0032CD32;
    clMagenta           := $00FF00FF;
    clMaroon            := $00000080;
    clMediumAquaMarine  := $00AACD66;
    clMediumBlue        := $00CD0000;
    clMediumOrchid      := $00D355BA;
    clMediumPurple      := $00D87093;
    clMediumSeaGreen    := $0071B33C;
    clMediumSlateBlue   := $00EE687B;
    clMediumSpringGreen := $009AFA00;
    clMediumTurquoise   := $00CCD148;
    clMediumVioletRed   := $008515C7;
    clMocassin          := $00B5E4FF;
    clMoney             := $00C0DCC0;
    clNavy              := $00800000;
    clOldLace           := $00E6F5FD;
    clOlive             := $00008080;
    clOliveDrab         := $00238E68;
    clOrange            := $0000A5FF;
    clOrangeRed         := $000045FF;
    clOrchid            := $00D670DA;
    clPaleGoldenRod     := $00AAE8EE;
    clPaleGreen         := $0098FB98;
    clPaleTurquoise     := $00EEEEAF;
    clPaleVioletRed     := $00937093;
    clPeachPuff         := $00B9DAFF;
    clPeru              := $003f85CD;
    clPink              := $00CBC0FF;
    clPlume             := $00DDA0DD;
    clPowderBlue        := $00E6E0B0;
    clPurple            := $00800080;
    clRed               := $000000FF;
    clRosyBrown         := $008F8FBC;
    clRoyalBlue         := $00E16941;
    clSaddleBrown       := $0013458B;
    clSalmon            := $007280FA;
    clSandyBrown        := $0060A4F4;
    clSeaGreen          := $00578B2E;
    clSienna            := $002D52A0;
    clSilver            := $00C0C0C0;
    clSkyBlue           := $00EBCE87;
    clSlateBlue         := $00CD5A6A;
    clSlateGray         := $00908070;
    clSpringGreen       := $007FFF00;
    clSteelBlue         := $00B48246;
    clTan               := $008CB4D2;
    clTeal              := $00808000;
    clThistle           := $00D8BFD8;
    clTomato            := $004763FF;
    clTurquoise         := $00D0E040;
    clViolet            := $00EE82EE;
    clWheat             := $00B3DEF5;
    clWhite             := $00FFFFFF;
    clWhiteSmoke        := $00F5F5F5;
    clYellow            := $0000FFFF;
    clYellowGreen       := $0032CD9A;
  end;

finalization
  ColorsList.Free;


end.
