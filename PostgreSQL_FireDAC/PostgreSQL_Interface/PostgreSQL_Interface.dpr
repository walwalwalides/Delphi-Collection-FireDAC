program PostgreSQL_Interface;

{$R 'Sound.res' 'SoundLib\Sound.rc'}

uses
  Vcl.Forms,
  sysutils,
  uMain in 'uMain.pas' {frmMain},
  uiRepositories in 'Repositorie\uiRepositories.pas',
  uiRepoSystem in 'Repositorie\uiRepoSystem.pas',
  uLevelClr in 'Class\uLevelClr.pas',
  uDM_RepositoryPostgreSQL in 'Module\uDM_RepositoryPostgreSQL.pas' {DM_RepositoryPostgreSQL: TDataModule},
  uDM_RepositorySysPostgreSQL in 'Module\uDM_RepositorySysPostgreSQL.pas' {DM_RepositorySysPostgreSQL: TDataModule},
  uiConfig in 'Configuration\uiConfig.pas',
  uConfiguration in 'Configuration\uConfiguration.pas',
  uAbout in 'About\uAbout.pas' {frmAbout},
  uViewConfig in 'uViewConfig.pas' {frmViewConfig},
  uToolLib in 'Unit\uToolLib.pas',
  Vcl.Themes,
  Vcl.Styles,
  uUserInfo in 'Class\uUserInfo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;

end.
