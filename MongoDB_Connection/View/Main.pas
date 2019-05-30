{ ============================================
  Software Name : 	MongoDB_Connection
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
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MongoDB,
  FireDAC.Phys.MongoDBDef, System.Rtti, System.JSON.Types, System.JSON.Readers,
  System.JSON.BSON, System.JSON.Builders, FireDAC.Phys.MongoDBWrapper,
  FireDAC.FMXUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, FireDAC.Phys.MongoDBDataSet, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, FireDAC.Stan.Util, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.DApt, FireDAC.Phys.SQLiteVDataSet,
  FireDAC.VCLUI.Wait, System.Actions, Vcl.ActnList, Vcl.Menus, Vcl.Buttons;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EditMatch: TEdit;
    DBGrid1: TDBGrid;
    EditSort: TEdit;
    EditProjection: TEdit;
    dsQuery: TDataSource;
    Label4: TLabel;
    EditDatabase: TEdit;
    Label5: TLabel;
    EditCollection: TEdit;
    MMMain: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N3: TMenuItem;
    A2: TMenuItem;
    actAbout1: TMenuItem;
    N2: TMenuItem;
    ActionList1: TActionList;
    actOpenFile: TAction;
    actShowInExplorer: TAction;
    actOpenFolder: TAction;
    actExit: TAction;
    actOption: TAction;
    actAbout: TAction;
    acAddUser: TAction;
    GrBoxMain: TGroupBox;
    ButtonOpenMongo: TBitBtn;
    procedure ButtonOpenMongoClick(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acAddUserExecute(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Module, About, AddUser;

{$R *.dfm}

procedure TfrmMain.acAddUserExecute(Sender: TObject);
var
  F: TfrmAddUser;
begin
  if not Assigned(F) then
    Application.CreateForm(TfrmAddUser, F);
  F.Position := poMainFormCenter;
  try
    if (F.ShowModal = mrCancel) then
    begin
      F.Close;
    end;

  finally
    FreeAndNil(F);
  end;

end;

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

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Application.terminate
end;

procedure TfrmMain.ButtonOpenMongoClick(Sender: TObject);
begin
  DMModule.OpenLogIn(EditDatabase.Text, EditCollection.Text, EditMatch.Text, EditSort.Text, EditProjection.Text);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Position := poMainFormCenter;
  WindowState := wsNormal;
end;

end.
