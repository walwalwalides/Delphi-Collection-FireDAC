program MSSQL_MyProduct;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  uViewCategorie in 'Register\uViewCategorie.pas' {frmViewCategorie},
  uViewClients in 'Register\uViewClients.pas' {frmViewClients},
  uViewProducts in 'Register\uViewProducts.pas' {frmViewProducts},
  uMainDispaly in 'Heritage\uMainDispaly.pas' {frmMainDisplay},
  uEnum in 'Heritage\uEnum.pas',
  Module in 'Module\Module.pas' {DMMain: TDataModule},
  uSplashDB in 'Splash\uSplashDB.pas' {frmSplashDB},
  cMyCategorie in 'Classes\cMyCategorie.pas',
  cMyClients in 'Classes\cMyClients.pas',
  cMyProduts in 'Classes\cMyProduts.pas',
  About in 'About\About.pas' {frmAbout},
  uRelMyCategorie in 'Reports\uRelMyCategorie.pas' {frmRelMyCategorie},
  uRelMyClients in 'Reports\uRelMyClients.pas' {frmRelMyClients},
  uRelMyProducts in 'Reports\uRelMyProducts.pas' {frmRelMyProdutcs},
  cActualConecMMSQL in 'Connection\cActualConecMMSQL.pas',
  cActualDatenMSSQL in 'Connection\cActualDatenMSSQL.pas',
  cActualTableMSSQL in 'Connection\cActualTableMSSQL.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Title:='MMSQL _ MyProduct';
  Application.Run;
end.
