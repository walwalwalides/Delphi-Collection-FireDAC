{ ============================================
  Software Name : 	SaveMyLogIn
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids, Buttons, ExtCtrls, ImgList, StdCtrls,
  ComCtrls, Mask, XPMan,
  uDeclare, uUserControl, uIniFile, uOptions,
  Utils, Language, Language_Lib, Colors, DMTasks,
  Splash, System.ImageList;

type
  TFrmMain = class(TForm)
    MainMenu: TMainMenu;
    MenuFile: TMenuItem;
    MenuItemDatabase: TMenuItem;
    MenuItemLogin: TMenuItem;
    MenuItemUsers: TMenuItem;
    SepFile1: TMenuItem;
    MenuItemQuit: TMenuItem;
    //
    MenuHelp: TMenuItem;
    MenuItemAbout: TMenuItem;
    //
    panelToolBar: TPanel;
    SpeedButtonDatabase: TSpeedButton;
    SpeedButtonLogin: TSpeedButton;
    SpeedButtonUsers: TSpeedButton;
    SpeedButtonQuit: TSpeedButton;
    ImageList24: TImageList;
    OpenDialog: TOpenDialog;
    ImageList128: TImageList;
    SpeedButtonAbout: TSpeedButton;
    MenuItemInfo: TMenuItem;
    N1: TMenuItem;
    //
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InitTexts;
    procedure InitOptions;
    procedure OnUserCommandAction(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    bLoginOk: Boolean;
  public
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
var
  nID: LongInt;
begin
  InitTexts;
  IniFileData.ReadIniFile;
  DataModuleTasks := TDataModuleTasks.Create(FrmMain);
  DataModuleTasks.BeforeConnect(FrmMain); // Initial DataBase
  //
  //
  nID := DataModuleTasks.GetUser('', '', '', IntToStr(nLOG_ADMIN));
  if nID = -1 then
    UserCtrl.CreateUserBox;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
  //
  UserCtrl.CreateAboutBox(nDISPMODE_SPLASH, 1000); // Splash
  //
  bLoginOk := FALSE;
  if UserCtrl.CreateLoginBox = mrOk then
  begin
    bLoginOk := TRUE;
    InitOptions;
    UserCtrl.CtrlToolButtons;
    Show;
  end
  else
  begin
    Application.Minimize;
    Application.Terminate;
  end;
end;

{
  Get All Text
}
procedure TFrmMain.InitTexts;
begin

  if Lang.sLanguage = '' then
    Lang.sLanguage := sEnglish;
  Lang.ReadLanguage(Lang.sLanguage);
  LangLib.ReadLanguage(Lang.sLanguage);

  Application.Title := Lang.sTitle_Application;
  Caption := Lang.sTitle_MainApplic;

  MenuFile.Caption := LangLib.sMenu_File;
  MenuItemDatabase.Caption := Lang.sMenuDatabase;
  MenuItemLogin.Caption := Lang.sMenuLogin;
  MenuItemUsers.Caption := Lang.sMenuUsers;
  MenuItemQuit.Caption := Lang.sMenuQuit;

  MenuHelp.Caption := LangLib.sMenu_Help;
  MenuItemAbout.Caption := LangLib.sMenu_About;
  MenuItemInfo.Caption := LangLib.sMenu_Info;

  SpeedButtonDatabase.Caption := Lang.sButDatabase;
  SpeedButtonLogin.Caption := Lang.sButLogin;
  SpeedButtonUsers.Caption := Lang.sButUsers;
  SpeedButtonAbout.Caption := Lang.sButAbout;
  SpeedButtonQuit.Hint := Lang.sButQuit;
  //

  // Hole the Hint

  SpeedButtonDatabase.Hint := Lang.sHint_Database;
  SpeedButtonUsers.Hint := Lang.sHint_Users;
  SpeedButtonAbout.Hint := Lang.sHint_About;
  SpeedButtonLogin.Hint := Lang.sHint_LogIn;
  SpeedButtonQuit.Hint := Lang.sHint_Quit;
  //

end;

procedure TFrmMain.InitOptions;
var
  i: Integer;
begin
  OptionsData.ReadSelFolderCfg;
  OptionsData.ReadSelFolderCfgOpt;

  //

end;

procedure TFrmMain.OnUserCommandAction(Sender: TObject);
begin
  UserCtrl.UserCommandActions(Sender);
end;

procedure TFrmMain.FormDestroy(Sender: TObject);
begin

  IniFileData.WriteIniFile;
  OptionsData.WriteSelFolderCfg;
  OptionsData.WriteSelFolderCfgOpt;
  if DataModuleTasks <> nil then
  begin
    DataModuleTasks.CloseDatabase;
    DataModuleTasks.Free;
  end;
end;

end.
