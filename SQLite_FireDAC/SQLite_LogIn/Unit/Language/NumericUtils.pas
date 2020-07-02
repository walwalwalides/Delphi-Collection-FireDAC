{ ============================================
  Software Name : 	SaveMyTasks
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }

unit NumericUtils;


interface

uses
  SysUtils, Controls, DateUtils;

type

  TNumeric  = class
    function  HrsMinToHrs100 (const nVal: double): double;
    function  Hrs100ToHrsMin (const nVal: double): double;
    function  HrsMinToText (const nVal: double): string;
  end;


var
  Numeric : TNumeric;

implementation



function TNumeric.HrsMinToHrs100 (const nVal: double): double;
begin
  Result := Trunc (nVal) + (Frac (nVal) * 100 / 60);
end;


function TNumeric.Hrs100ToHrsMin (const nVal: double): double;
begin
  Result := Trunc (nVal) + (Frac (nVal) * 0.6);
end;


function TNumeric.HrsMinToText (const nVal: double): string;
begin
  //
end;


initialization
  Numeric := TNumeric.Create;

finalization
  Numeric.Free;


end.
