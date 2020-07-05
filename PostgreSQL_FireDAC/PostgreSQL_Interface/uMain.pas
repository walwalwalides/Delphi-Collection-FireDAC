{ ============================================
  Software Name : 	PostgreSQL_Interface
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2020 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.Grids;

type
  TfrmMain = class(TForm)
    MMMain: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    N3: TMenuItem;
    A2: TMenuItem;
    actAbout1: TMenuItem;
    N2: TMenuItem;
    ActionList1: TActionList;
    actOpenFile: TAction;
    actShowInExplorer: TAction;
    actOpenFolder: TAction;
    actExit: TAction;
    actConfig: TAction;
    actAbout: TAction;
    Configuration: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uiRepositories, uAbout, uViewConfig;

{$R *.dfm}

procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  F: TfrmAbout;
begin
  if not Assigned(F) then
    Application.CreateForm(TfrmAbout, F);
  F.Position := poMainFormCenter;
  try
    F.ShowModal;
  finally
    FreeAndNil(F);
  end;


end;

procedure TfrmMain.actConfigExecute(Sender: TObject);
var
  FVConfig: TfrmViewConfig;
begin
  if not Assigned(FVConfig) then
    Application.CreateForm(TfrmViewConfig,FVConfig);
//  FVConfig.Position := poMainFormCenter;
  try
    FVConfig.ShowModal;
  finally
    FreeAndNil(FVConfig);
  end;


end;

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Application.Terminate;
end;



procedure TfrmMain.FormCreate(Sender: TObject);
begin
  self.Position := poMainFormCenter;
  self.color := clwhite;
  self.WindowState:=wsMaximized;
  self.caption := 'PostgreSQL_Interface';

end;

end.
