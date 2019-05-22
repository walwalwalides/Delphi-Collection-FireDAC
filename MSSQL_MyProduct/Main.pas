{ ============================================
  Software Name : 	MMSQL_MyProduct
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
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, uSplashDB, Vcl.Menus;

type
  TfrmMain = class(TForm)
    MMMain: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
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
    acDisClients: TAction;
    acDisProduct: TAction;
    acDisCategorie: TAction;
    Categorie1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure acDisClientsExecute(Sender: TObject);
    procedure acDisProductExecute(Sender: TObject);
    procedure acDisCategorieExecute(Sender: TObject);
    procedure actAboutExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
  private
    procedure InitializationMMSQL(aForm: TfrmSplashDB);
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Module, About, uviewCategorie, uviewClients, uviewProducts, cActualConecMMSQL;

procedure TfrmMain.acDisCategorieExecute(Sender: TObject);
begin
  //
  frmviewCategorie := TfrmviewCategorie.Create(Self);
  frmviewCategorie.ShowModal;
  frmviewCategorie.Release;
end;

procedure TfrmMain.acDisClientsExecute(Sender: TObject);
begin
  //
  frmviewClients := TfrmviewClients.Create(Self);
  frmviewClients.ShowModal;
  frmviewClients.Release;

end;

procedure TfrmMain.acDisProductExecute(Sender: TObject);
begin
  //
  frmviewProducts := TfrmviewProducts.Create(Self);
  frmviewProducts.ShowModal;
  frmviewProducts.Release;
end;

procedure TfrmMain.actAboutExecute(Sender: TObject);
var
  F: TfrmAbout;
begin

  inherited;
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
  Application.terminate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Position := poMainFormCenter;
  Caption := Application.Title;
  WindowState := wsMaximized;
  frmSplashDB := TfrmSplashDB.Create(Self);
  frmSplashDB.Show;
  frmSplashDB.Refresh;

  DMMAIN := TDMMAIN.Create(Self);
  with DMMAIN.ConnectionMain do
  begin

    Connected := True;
  end;
  InitializationMMSQL(frmSplashDB);

  frmSplashDB.Free;

end;

procedure TfrmMain.InitializationMMSQL(aForm: TfrmSplashDB);
var
  oActualMSSQL: TActualMMSQL2;
begin
  try
    oActualMSSQL := TActualMMSQL2.Create(DMMAIN.ConnectionMain);
    oActualMSSQL.UpdateMSSQLDatabase;
  finally
    if Assigned(oActualMSSQL) then
      FreeAndNil(oActualMSSQL);
  end;
end;

end.
