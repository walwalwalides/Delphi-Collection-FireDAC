{ ============================================
  Software Name : 	SQLite_University
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
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList, Vcl.StdCtrls;

type
  TfrmMain = class(TForm)
    ActListMain: TActionList;
    actClear: TAction;
    actSolution: TAction;
    actOpenFile: TAction;
    actShowInExplorer: TAction;
    actOpenFolder: TAction;
    actExit: TAction;
    actStudent: TAction;
    actOption: TAction;
    actAbout: TAction;
    MMMain: TMainMenu;
    File1: TMenuItem;
    OpenFiles1: TMenuItem;
    OpenFolders1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    View1: TMenuItem;
    Refresh1: TMenuItem;
    Option1: TMenuItem;
    actOption1: TMenuItem;
    A2: TMenuItem;
    actAbout1: TMenuItem;
    actClass: TAction;
    N2: TMenuItem;
    Class1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actStudentExecute(Sender: TObject);
    procedure actClassExecute(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses uAbout, uStudent, uClass, DMUniversity, uDeclare;

procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  f: TfrmAbout;
begin

  if not Assigned(f) then
    Application.CreateForm(TfrmAbout, f);
  f.Position := poMainFormCenter;
  try
    f.ShowModal;
  finally
    FreeAndNil(f);
  end;
end;

procedure TfrmMain.actClassExecute(Sender: TObject);
var
  f: TfrmClass;
begin
  if not Assigned(f) then
    Application.CreateForm(TfrmClass, f);
  f.Position := poMainFormCenter;
  try
    f.ShowModal;
  finally
    FreeAndNil(f);
  end;
end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.actStudentExecute(Sender: TObject);
var
  f: TfrmStudent;
begin
  if f = nil then
    f := TfrmStudent.Create(frmMain);
  f.ShowModal;
  if f <> nil then
  begin
    f.Free;
    f := nil;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  nID: LongInt;
begin
  Position := poMainFormCenter;
  WindowState := wsMaximized;
  Color := clWhite;
  DataModuleUniversity := TDataModuleUniversity.Create(frmMain);
  DataModuleUniversity.BeforeConnect(frmMain); // Initial DataBase
  //
  //
//  nID := DataModuleUniversity.GetStudent('', '', '', IntToStr(nLOG_ADMIN));
//  if nID = -1 then
//    actStudentExecute(nil);
end;

end.
