{ ============================================
  Software Name : 	MSSQL_DefineAccess
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
  SysUtils, Classes, DB, ADODB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase,
  FireDAC.Comp.UI;

type
  TDMModule = class(TDataModule)
    DS_Products: TDataSource;
    DS_Typs: TDataSource;
    DS_Marks: TDataSource;
    ConnectionMain: TFDConnection;
    tblProducts: TFDTable;
    tblTyps: TFDTable;
    tblMarks: TFDTable;
    tblProductsProductID: TStringField;
    tblProductsTypID: TIntegerField;
    tblProductsMarkID: TIntegerField;
    tblProductsModel: TStringField;
    tblProductsSerialNumber: TStringField;
    tblProductsPrice: TBCDField;
    tblMarksMarkID: TFDAutoIncField;
    tblMarksMarkDescription: TStringField;
    tblMarksMarkSiteWeb: TStringField;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    tblTypsTypID: TFDAutoIncField;
    tblTypsTypDescription: TStringField;
    procedure tblMarksAfterOpen(DataSet: TDataSet);
    procedure tblTypsAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMModule: TDMModule;

implementation

{$R *.dfm}

procedure TDMModule.tblMarksAfterOpen(DataSet: TDataSet);
begin
  tblMarks.IndexFieldNames := 'MarkDescription';
end;

procedure TDMModule.tblTypsAfterOpen(DataSet: TDataSet);
begin
  tblTyps.IndexFieldNames := 'TypDescription';
end;

end.
