{ ============================================
  Software Name : 	SaveMyLogIn
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uUserControl;

interface

uses
  Windows, Forms, SysUtils, Menus, Buttons, Graphics, Printers, Controls,
   StdCtrls, Utils, Math,
  Language, Language_Lib, uDeclare, uIniFile,
  Login,Splash, Users, About, DMTasks;

type

  TUserCtrl = class

    procedure CtrlToolButtons;

    procedure UserCommandActions(Sender: TObject);
    // Difine All the Boxs
    function OpenDialogBox: boolean;
    function CreateLoginBox: Integer;
    function CreateUserBox: Integer;
    procedure CreateFrmAboutBox;
    procedure CreateAboutBox(const nDispMode, nDelay: Integer);
  end;

var
  UserCtrl: TUserCtrl;

implementation

uses
  Main;

procedure TUserCtrl.CtrlToolButtons;
begin
  with FrmMain do
  begin

    if Applidata.CheckType then
    begin
      SpeedButtonUsers.Enabled := TRUE;
    end
    else
    begin
      SpeedButtonUsers.Enabled := FALSE;
    end;
  end;
end;

procedure TUserCtrl.UserCommandActions(Sender: TObject);
begin
  with FrmMain do
  begin

    if (AnsiCompareStr(TMenuItem(Sender).Name, 'MenuItemDatabase') = 0) or (AnsiCompareText(TSpeedButton(Sender).Name, 'SpeedButtonDatabase') = 0) then
    begin
      OpenDialogBox;
      if UserCtrl.CreateLoginBox = mrOk then
      begin
        UserCtrl.CtrlToolButtons;
      end
    end
    else if (AnsiCompareText(TMenuItem(Sender).Name, 'MenuItemLogin') = 0) or (AnsiCompareText(TSpeedButton(Sender).Name, 'SpeedButtonLogin') = 0) then
    begin
      if UserCtrl.CreateLoginBox = mrOk then
      begin
        UserCtrl.CtrlToolButtons;
      end;
    end
    else if (AnsiCompareText(TSpeedButton(Sender).Name, 'MenuItemUsers') = 0) or (AnsiCompareText(TSpeedButton(Sender).Name, 'SpeedButtonUsers') = 0) then
      UserCtrl.CreateUserBox
       else if (AnsiCompareText(TMenuItem(Sender).Name, 'MenuItemQuit') = 0) or (AnsiCompareText(TSpeedButton(Sender).Name, 'SpeedButtonQuit') = 0) then
      FrmMain.close

    else if (AnsiCompareText(TMenuItem(Sender).Name, 'MenuItemAbout') = 0) or (AnsiCompareText(TSpeedButton(Sender).Name, 'SpeedButtonAbout') = 0) then
      UserCtrl.CreateFrmAboutBox
        else if (AnsiCompareText(TMenuItem(Sender).Name, 'MenuItemInfo') = 0) then
      CreateAboutBox(nDISPMODE_NORMAL, 0)

  end;
  UserCtrl.CtrlToolButtons;
end;

function TUserCtrl.OpenDialogBox: boolean;
begin
  Result := FALSE;
  with FrmMain.OpenDialog do
  begin
    InitialDir := Applidata.sDatabasePath;
    DefaultExt := 'db'; // For Sqlite Database
    if Execute then
    begin
      Applidata.sDatabase := ExtractFileName(FileName);
      Applidata.sDatabasePath := ExtractFilePath(FileName);
      DataModuleTasks.CloseDatabase;
      DataModuleTasks.BeforeConnect(FrmMain);
      Result := TRUE;
    end;
  end;
end;

function TUserCtrl.CreateLoginBox: Integer;
begin
  if FrmLogin = nil then
    FrmLogin := TFrmLogin.Create(FrmMain);
  Result := FrmLogin.ShowModal;
  if FrmLogin <> nil then
  begin
    FrmLogin.Free;
    FrmLogin := nil;
  end;
end;

function TUserCtrl.CreateUserBox: Integer;
begin

  if FrmUsers = nil then
    FrmUsers := TFrmUsers.Create(FrmMain);
  Result := FrmUsers.ShowModal;
  if FrmUsers <> nil then
  begin
    FrmUsers.Free;
    FrmUsers := nil;
  end;
end;

procedure TUserCtrl.CreateAboutBox(const nDispMode, nDelay: Integer);
var
  bmpImg: TBitMap;
begin
  bmpImg := TBitMap.Create;
  FrmMain.ImageList128.GetBitmap(0, bmpImg);
  AboutSplashBox(Lang.sTitle_Application, Lang.sTitle_MainApplic, LangLib.sAbout_DevName, sAUTHOR_NAME, LangLib.sAbout_Version + sPROG_VERS, sPROG_DATES,
    sAUTHOR_EMAIL, LangLib.sAbout_EmailObj + '  ' + Lang.sTitle_MainApplic, bmpImg, nDispMode, nDelay);
  bmpImg.Free;
end;

procedure TUserCtrl.CreateFrmAboutBox;
begin
  if (frmAbout = nil) then
    frmAbout := TfrmAbout.Create(FrmMain);
  frmAbout.Position := poMainFormCenter;
  try
    frmAbout.ShowModal;
  finally
    FreeAndNil(frmAbout);
  end;

end;

initialization

UserCtrl := TUserCtrl.Create;

finalization

UserCtrl.Free;

end.
