unit uToolLib;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  ImageHlp, ShellAPI, Registry, ComObj, ActiveX, dateUtils, ShlObj, mmsystem,
  SyncObjs, WinInet, Tlhelp32, nb30, uViewConfig;

procedure PlayResSound(RESName: string; uFlags: integer);
procedure DialogBoxAutoClose(const ACaption, APrompt: string;
  DuracaoEmSegundos: integer; ATop: integer; ALeft: integer);
procedure Delay(msecs: integer);

implementation


procedure Delay(msecs: integer);
var
  targettime: Longint;
  Msg: TMsg;
begin
  targettime := GetTickCount + msecs;
  while targettime > GetTickCount do
    if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
    begin
      if Msg.message = WM_QUIT then
      begin
        PostQuitMessage(Msg.wParam);
        break;
      end;
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
end;

procedure PlayResSound(RESName: string; uFlags: integer);
var
  // Handle Deklaration
  hResInfo, hRes: Thandle;
  // Char Deklaration
  lpGlob: PChar;
begin
  hResInfo := FindResource(HInstance, PChar(RESName), MAKEINTRESOURCE('WAVES'));
  if hResInfo = 0 then
  begin
    messagebox(0, 'Could not find this Resource', PChar(RESName), 16);
    Exit;
  end;

  hRes := LoadResource(HInstance, hResInfo);
  if hRes = 0 then
  begin
    messagebox(0, 'Could not load this Resource', PChar(RESName), 16);
    Exit;
  end;
  lpGlob := LockResource(hRes);
  if lpGlob = nil then
  begin
    messagebox(0, 'Resource bad.', PChar(RESName), 16);
    Exit;
  end;
  uFlags := snd_Memory or uFlags;
  SndPlaySound(lpGlob, uFlags);
  UnlockResource(hRes);
  FreeResource(hRes);
end;

procedure DialogBoxAutoClose(const ACaption, APrompt: string;
  DuracaoEmSegundos: integer; ATop: integer; ALeft: integer);
var
  // Form Deklaration
  Form: TForm;
  // Label Deklaration
  Prompt: TLabel;
  // Point Deklaration
  DialogUnits: TPoint;
  // Integer Deklaration
  ButtonTop, ButtonWidth, ButtonHeight: integer;
  nX, Lines: integer;
  function GetAveCharSize(Canvas: TCanvas): TPoint;
  var
    // integer Deklaration
    i: integer;
    // Array of Char Deklaration
    Buffer: array [0 .. 51] of char;
  begin
    for i := 0 to 25 do
      Buffer[i] := Chr(i + ord('A'));
    for i := 0 to 25 do
      Buffer[i + 26] := Chr(i + ord('a'));
    GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
    Result.X := Result.X div 52;
  end;

begin
  Form := TForm.create(Application);
  Lines := 0;
  for nX := 1 to length(APrompt) do
    if APrompt[nX] = #13 then
      inc(Lines);
  with Form do
    try
      // Font Einstellung
      color := clwhite;
      Font.Name := 'Arial'; // mcg
      Font.Size := 10; // mcg
      Font.Style := [fsBold];
      Canvas.Font := Font;
      // CharSize Einstellung
      DialogUnits := GetAveCharSize(Canvas);
      // BorderStyle    := bsDialog;
      BorderStyle := bsToolWindow;
      FormStyle := fsStayOnTop;
      BorderIcons := [];
      Caption := ACaption;
      ClientWidth := MulDiv(Screen.Width div 4, DialogUnits.X, 4) - 3;
      ClientHeight := MulDiv(23 + (Lines * 10), DialogUnits.Y, 8) - 3;
      // Position := poScreenCenter;

      // if (FrmViewConfig.Visible = true) then
      Top := (ATop) - Height + 3;

      // Top := FrmViewConfig.Top - MulDiv(23 + (Lines * 10), DialogUnits.Y, 8);

      left := (ALeft) - 78;
      Prompt := TLabel.create(Form);
      with Prompt do
      begin
        Parent := Form;
        AutoSize := true;
        left := MulDiv(8, DialogUnits.X, 4);
        Top := MulDiv(8, DialogUnits.Y, 8);
        Caption := APrompt;
      end;
      Form.Width := Prompt.Width + Prompt.left + 50; // mcg fix
      Show;
      Application.ProcessMessages;

    finally
      sleep(DuracaoEmSegundos * 100);
      Form.Free;
    end;
end;

end.
