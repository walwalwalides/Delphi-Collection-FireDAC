program MongoDB_Connection;

uses
  Vcl.Forms,
  Main in 'View\Main.pas' {frmMain},
  Module in 'Module\Module.pas' {DMModule: TDataModule},
  About in 'About\About.pas' {frmAbout},
  AddUser in 'View\AddUser.pas' {frmAddUser};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMModule, DMModule);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmAddUser, frmAddUser);
  Application.Run;
end.
