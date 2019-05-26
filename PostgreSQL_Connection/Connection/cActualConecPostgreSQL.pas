{ ============================================
  Software Name : 	PostgreSQL_Connection
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit cActualConecPostgreSQL;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,System.SysUtils;

type
  TActualPostgreSQL = class

  private

  public
    ConecMain:TFDConnection;
    constructor Create(AConecMain:TFDConnection);
    procedure ExecuteMSSQLDataBase(aScript: String);
end;

Type
  TActualPostgreSQL2 = Class
    private
      ConecMain: TFDConnection;
    public
      function UpdateMSSQLDatabase: Boolean;
      constructor Create(AConecMain: TFDConnection);
  End;

implementation

{ TActualPostgreSQL }

uses cActualTablePostgreSQL,cActualDatenPostgreSQL;

constructor TActualPostgreSQL.Create(AConecMain: TFDConnection);
begin
  ConecMain:=AConecMain;
end;

procedure TActualPostgreSQL.ExecuteMSSQLDataBase(aScript: String);
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
constructor TActualPostgreSQL2.Create(AConecMain: TFDConnection);
begin
  ConecMain:=AConecMain;
end;

function TActualPostgreSQL2.UpdateMSSQLDatabase: Boolean;
var oActualDB:TActualPostgreSQL;
    oTable: TActualTablePostgreSQL;
    oDaten: TActualDatenPostgreSQL;
begin
  Try

    oActualDB := TActualPostgreSQL.Create(ConecMain);
    oTable := TActualTablePostgreSQL.Create(ConecMain);
    oDaten  := TActualDatenPostgreSQL.Create(ConecMain);

  Finally
    FreeAndNil(oDaten);
    FreeAndNil(oTable);
    FreeAndNil(oActualDB);
  End;
end;



end.
