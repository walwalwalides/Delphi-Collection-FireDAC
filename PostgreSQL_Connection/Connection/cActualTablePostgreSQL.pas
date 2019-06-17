{ ============================================
  Software Name : 	PostgreSQL_Connection
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit cActualTablePostgreSQL;

interface

uses System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.SysUtils, cActualConecPostgreSQL;

type
  TActualTablePostgreSQL = class(TActualPostgreSQL)

  private
    function TabelaExiste(aTableName: String): Boolean;

  protected

  public
    constructor Create(AConecMain: TFDConnection);
    destructor Destroy; override;

    procedure Clients;

  end;

implementation

{ TActualTablePostgreSQL }

constructor TActualTablePostgreSQL.Create(AConecMain: TFDConnection);
begin
  ConecMain := AConecMain;
  Clients;
end;

destructor TActualTablePostgreSQL.Destroy;
begin
  inherited;
end;

{$REGION 'Check Table exists'}

// Methode1
{
  SELECT EXISTS (
  SELECT 1
  FROM   pg_catalog.pg_class c
  JOIN   pg_catalog.pg_namespace n ON n.oid = c.relnamespace
  WHERE  n.nspname = 'public'
  AND    c.relname = 'clients'
  );
}

// Methode2
{
  SELECT 'public.clients'::regclass
}

{$ENDREGION}

  //I use hier  the second methods
function TActualTablePostgreSQL.TabelaExiste(aTableName: String): Boolean;
Var
  Qry: TFDQuery;
  strSQl: string;
Begin
  Try
    Result := False;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    strSQl := 'SELECT ' + QuotedStr('public.' + aTableName) + '::regclass';
    Qry.SQL.Add(strSQl);
    // Qry.ParamByName('tablename').AsString := aTableName;
    // Qry.ParamByName('schema').AsString := 'public';
    try
      Qry.Open;
    except
      Result := False;
    end;

    if Qry.RecordCount > 0 then
    begin
      Result := True
    end
    else
    begin
      Result := False;
    end;

  Finally
    Qry.Close;
    if Assigned(Qry) then
      FreeAndNil(Qry);
  End;
end;


// Create Table Clients
// (
// ClientID serial Not Null,
// CName character(45) Not Null,
// CAdress Character(100),
// CCity Character(50),
// CTelefon character(14),
// CEmail Character(60),
// CSex Character(1) Not Null,
// CBirthdate Date,
// CInsertts timestamp without time zone ,
// constraint Client_pkey Primary Key (ClientID)
// )

procedure TActualTablePostgreSQL.Clients;
begin
  if not TabelaExiste('clients') then
  begin
    ExecuteMSSQLDataBase('CREATE TABLE clients (' + 'ClientID SERIAL,' + 'CName character(45) Not Null,' +
      'CAdress Character(100), ' + 'CCity varchar(50) null,' + 'CTelefon character(14), ' +
      'CEmail Character(60),' + 'CSex Character(1) Not Null,' + 'CBirthdate Date,' + 'CInsertts Date,'+

      'Constraint Clients_pkey Primary Key (ClientID) ' + ') ');
  end;
end;

end.
