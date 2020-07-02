{ ============================================
  Software Name : 	MMSQL_MyProduct
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight � 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit cActualDatenMSSQL;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
    FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,System.SysUtils,cActualconecMMSQL;

type
  TActualDatenMSSQL = class(TActualMMSQL)

  private
    function TableExist(ATableName, aField: String): Boolean;
    procedure Test;

  protected

  public
    constructor Create(AConecMain:TFDConnection);
    destructor Destroy; override;

end;

implementation

{ TAtualizacaoTableMSSQL }

constructor TActualDatenMSSQL.Create(AConecMain: TFDConnection);
begin
  ConecMain := AConecMain;
  Test;
end;

destructor TActualDatenMSSQL.Destroy;
begin
  inherited;
end;

function TActualDatenMSSQL.TableExist(ATableName: String; aField:String): Boolean;
Var Qry:TFDQuery;
Begin
  Try
    Result:=False;
    Qry:=TFDQuery.Create(nil);
    Qry.Connection:=ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add(' SELECT COUNT(COLUMN_NAME) AS Qtde ');
    Qry.SQL.Add('   FROM INFORMATION_SCHEMA.COLUMNS ');
    Qry.SQL.Add('  WHERE TABLE_NAME =:TableName ');
    Qry.SQL.Add('    AND COLUMN_NAME=:Field ');
    Qry.ParamByName('TableName').AsString:=ATableName;
    Qry.ParamByName('Field').AsString :=aField;
    Qry.Open;

    if Qry.FieldByName('Qtde').AsInteger>0 then
       Result:=True;

  Finally
    Qry.Close;
    if Assigned(Qry) then
       FreeAndNil(Qry);
  End;
end;

procedure TActualDatenMSSQL.Test;
begin
  if not TableExist('categorie','teste') then
  begin
    ExecuteMSSQLDataBase('ALTER TABLE Categorie ADD teste varchar(30) NULL ');
  end;

  if TableExist('categorie','teste') then
  begin
    ExecuteMSSQLDataBase('ALTER TABLE Categorie DROP COLUMN teste ');
  end;

end;

end.

