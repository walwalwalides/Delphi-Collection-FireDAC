{ ============================================
  Software Name : 	MongoDB_Connection
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit Module;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MongoDB, FireDAC.Phys.MongoDBDef, System.Rtti, System.JSON.Types, System.JSON.Readers, System.JSON.BSON, System.JSON.Builders,
  FireDAC.Phys.MongoDBWrapper,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MongoDBDataSet, FireDAC.Comp.UI;

type
  TDMModule = class(TDataModule)
    ConnectionMain: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMongoDriverLink1: TFDPhysMongoDriverLink;
    qrLogIn: TFDMongoQuery;
    procedure DataModuleDestroy(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private-Deklarationen }
    FEnv: TMongoEnv;
    FCon: TMongoConnection;
  public
    { Public-Deklarationen }
    procedure OpenLogIn(ADataBase: string; ACollectionName: string; AMatch: string; ASort: String; AProject: String);
    procedure AddUser(AUsername: string; APassword: string);
  end;

var
  DMModule: TDMModule;

implementation

uses vcl.Dialogs;
{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

//
//[Mongo_Walid]
//DriverID=Mongo
//Server=127.0.0.1
//Port=27017
//Database=walid

procedure TDMModule.DataModuleCreate(Sender: TObject);
begin



  ConnectionMain.Connected := True;
  FCon := TMongoConnection(ConnectionMain.CliObj);
  FEnv := FCon.Env;
end;

procedure TDMModule.DataModuleDestroy(Sender: TObject);
begin

  qrLogIn.Close;
  ConnectionMain.Close;
end;

procedure TDMModule.OpenLogIn(ADataBase: string; ACollectionName: string; AMatch: string; ASort: String; AProject: String);
var
  I: Integer;
begin

  qrLogIn.Close;
  qrLogIn.FieldDefs.Clear;

  // Setup new connection
  qrLogIn.DatabaseName := ADataBase;
  qrLogIn.CollectionName := ACollectionName;
  qrLogIn.QMatch := AMatch;
  qrLogIn.QSort := ASort;
  qrLogIn.QProject := AProject;
  qrLogIn.Open;

  // Check for data types not allowed by SQLite
  for I := 0 to qrLogIn.FieldDefs.Count - 1 do
    if (qrLogIn.FieldDefs[I].DataType = ftADT) or (qrLogIn.FieldDefs[I].DataType = ftDataSet) then
    begin
      ShowMessage('No nested objects or arrays allowed. [Field: ' + qrLogIn.FieldDefs[I].Name + ']');
      Abort;
    end;

end;
//Non Flutent
procedure TDMModule.AddUser(AUsername: string; APassword: string);
var
  oDoc: TMongoDocument;
begin
  oDoc := FEnv.NewDoc;
  try
    oDoc.Add('Username', AUsername).Add('Password', APassword);
    FCon['walid']['Login'].Insert(oDoc);
  finally
    oDoc.free;
    ShowMessage('Username : '+AUsername+' was added successfully');
  end;

end;

end.
