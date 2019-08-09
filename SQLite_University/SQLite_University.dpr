program SQLite_University;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  uAbout in 'ABOUT\uAbout.pas' {frmAbout},
  uClass in 'View\uClass.pas' {frmClass},
  CreateTableDB in 'Module\CreateTableDB.pas',
  DMUniversity in 'Module\DMUniversity.pas' {DataModuleUniversity: TDataModule},
  uDeclare in 'Unit\uDeclare.pas',
  uStudent in 'View\uStudent.pas' {FrmStudent},
  uOptions in 'Unit\uOptions.pas',
  SelectFolderData in 'Unit\SelectFolderData.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
