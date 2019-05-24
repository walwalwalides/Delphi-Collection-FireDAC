program SQLite_SaveMyLogin;

uses
  Forms,
  Main in 'View\Main.pas' {FrmMain},
  Language in 'Unit\Language\Language.pas',
  uDeclare in 'Unit\uDeclare.pas',
  uColors in 'Unit\uColors.pas',
  uUserControl in 'Unit\uUserControl.pas',
  uOptions in 'Unit\uOptions.pas',
  DMTasks in 'Module\DMTasks.pas' {DataModuleTasks: TDataModule},
  Users in 'View\Users.pas' {FrmUsers},
  SelectFolderData in 'Unit\SelectFolderData.pas',
  Splash in 'View\Splash.pas' {FrmAboutSplash},
  Language_Lib in 'Unit\Language\Language_Lib.pas',
  uIniFile in 'Unit\uIniFile.pas',
  Login in 'View\Login.pas' {FrmLogin},
  CreateTableDB in 'Module\CreateTableDB.pas',
  About in 'View\About.pas' {frmAbout};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
