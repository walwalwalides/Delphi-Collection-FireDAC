{ ============================================
  Software Name : 	MMSQL_MyProduct
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit cActualConecMMSQL;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,System.SysUtils;

type
  TActualMMSQL = class

  private

  public
    ConecMain:TFDConnection;
    constructor Create(AConecMain:TFDConnection);
    procedure ExecuteMSSQLDataBase(aScript: String);
end;

Type
  TActualMMSQL2 = Class
    private
      ConecMain: TFDConnection;
    public
      function UpdateMSSQLDatabase: Boolean;
      constructor Create(AConecMain: TFDConnection);
  End;

implementation

{ TActualMMSQL }

uses cActualTableMSSQL,cActualDatenMSSQL;

constructor TActualMMSQL.Create(AConecMain: TFDConnection);
begin
  ConecMain:=AConecMain;
end;

procedure TActualMMSQL.ExecuteMSSQLDataBase(aScript: String);
Var Qry:TFDQuery;
Begin
  Try
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add(aScript);
    Try
      ConecMain.StartTransaction;
      Qry.ExecSQL;
      ConecMain.Commit;
    Except
      ConecMain.Rollback;
    End;
  Finally
    Qry.Close;
    if Assigned(Qry) then
       FreeAndNil(Qry);
  End;
end;


{ TActualMMSQLMSSQL }
constructor TActualMMSQL2.Create(AConecMain: TFDConnection);
begin
  ConecMain:=AConecMain;
end;

function TActualMMSQL2.UpdateMSSQLDatabase: Boolean;
var oActualDB:TActualMMSQL;
    oTable: TActualTableMSSQL;
    oDaten: TActualDatenMSSQL;
begin
  Try

    oActualDB := TActualMMSQL.Create(ConecMain);


    oTable := TActualTableMSSQL.Create(ConecMain);
    oDaten  := TActualDatenMSSQL.Create(ConecMain);

  Finally
    FreeAndNil(oDaten);
    FreeAndNil(oTable);
    FreeAndNil(oActualDB);
  End;
end;



end.
