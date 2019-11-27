{ ============================================
  Software Name : 	PostgreSQL_Connection
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
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Phys.ODBCBase, FireDAC.Comp.UI,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TDMMain = class(TDataModule)
    ConnectionMain: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  DMMain: TDMMain;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

{$R *.dfm}

// I my case the datebase name is MyTest
procedure TDMMain.DataModuleCreate(Sender: TObject);
begin
  ConnectionMain.Connected := False;
  ConnectionMain.LoginPrompt := False;
//  FDPhysPgDriverLink1.VendorHome := 'C:\Program Files (x86)\PostgreSQL\10\';
//  FDPhysPgDriverLink1.VendorLib := 'libpq.dll';
  ConnectionMain.ConnectionString := 'Name=PostgreSQL_Connection;' + 'DriverID=PG;' + 'Database=MyTest;' + 'MetaDefSchema=public;' + 'ExtendedMetadata=False;' +
    'User_Name=postgres;' + 'Password=123456;' + 'Server=Localhost';

end;

end.
