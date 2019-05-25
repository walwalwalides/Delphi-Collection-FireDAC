program MSSSQL_DefineAccess;

uses
  Forms,
  Controls,
  Login in 'View_Login\Login.pas' {frmLogin},
  Module in 'Module\Module.pas' {DMModule: TDataModule},
  Products in 'View_Main\Products.pas' {frmProducts},
  AddProducts in 'View_Add\AddProducts.pas' {frmAddProducts},
  Typs in 'View_Main\Typs.pas' {frmTyps},
  AddTyps in 'View_Add\AddTyps.pas' {frmAddTyps},
  Marks in 'View_Main\Marks.pas' {frmMarks},
  AddMarks in 'View_Add\AddMarks.pas' {frmAddMarks},
  About in 'View_Main\About.pas' {frmAbout};

{$R *.res}
var tmpLogin:TfrmLogin;
begin
  Application.Title:='MSSQL_DefineAccess';
  tmpLogin:=TfrmLogin.Create(Application);
  tmpLogin.position:=poMainFormCenter;
  Application.Initialize;
  Application.CreateForm(TDMModule, DMModule);
  if tmpLogin.ShowModal=mrok then
    begin
      try
        Application.CreateForm(TfrmProducts, frmProducts);
        frmProducts.position:=poMainFormCenter;
        Application.Run;
      finally
        tmpLogin.Free;
      end;
    end;
end.
