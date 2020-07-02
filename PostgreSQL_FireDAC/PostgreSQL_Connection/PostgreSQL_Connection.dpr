program PostgreSQL_Connection;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  uViewClients in 'Register\uViewClients.pas' {frmViewClients},
  uMainDispaly in 'Heritage\uMainDispaly.pas' {frmMainDisplay},
  uEnum in 'Heritage\uEnum.pas',
  Module in 'Module\Module.pas' {DMMain: TDataModule},
  uSplashDB in 'Splash\uSplashDB.pas' {frmSplashDB},
  cMyClients in 'Classes\cMyClients.pas',
  About in 'About\About.pas' {frmAbout},
  uRelMyClients in 'Reports\uRelMyClients.pas' {frmRelMyClients},
  cActualConecPostgreSQL in 'Connection\cActualConecPostgreSQL.pas',
  cActualDatenPostgreSQL in 'Connection\cActualDatenPostgreSQL.pas',
  cActualTablePostgreSQL in 'Connection\cActualTablePostgreSQL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Title:='MMSQL _ MyProduct';
  Application.Run;
end.
