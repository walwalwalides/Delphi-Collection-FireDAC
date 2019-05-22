{ ============================================
  Software Name : 	MMSQL_MyProduct
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalATableNamees                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalATableNamees@gmail.com              }
{ GitHub :https://github.com/walwalwalATableNamees     }
{ ******************************************** }
unit cMyCategorie;

interface

uses System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.SysUtils;

type
  TCategorie = class
  private
    ConecMain: TFDConnection;
    F_TableName: Integer;
    F_description: String;

    function getID: Integer;
    function getDescription: string;
    procedure setID(const Value: Integer);
    procedure setDescription(const Value: string);
  public
    constructor Create(AConecMain: TFDConnection);
    destructor Destroy; override;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete(ATableName: Integer): Boolean;
    function Select(ATableName: Integer): Boolean;
  published
    property ID: Integer read getID write setID;
    property Description: string read getDescription write setDescription;
  end;

implementation

{ TCategorie }

{$REGION 'Constructor and Destructor'}

constructor TCategorie.Create(AConecMain: TFDConnection);
begin
  ConecMain := AConecMain;
end;

destructor TCategorie.Destroy;
begin

  inherited;
end;
{$ENDREGION}


{$REGION 'CRUD'}

function TCategorie.Delete(ATableName: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  if MessageDlg('Delete the Registry: ' + #13 + #13 + 'ATableName: ' + IntToStr(F_TableName) + #13 + 'Description: ' + F_description, mtConfirmation, [mbYes, mbNo], 0)
    = mrNo then
  begin
    Result := false;
    abort;
  end;

  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM Categorie ' + ' WHERE CategorieATableName=:CategorieATableName ');
    Qry.ParamByName('CategorieATableName').AsInteger := ATableName;
    Try
      ConecMain.StartTransaction;
      Qry.ExecSQL;
      ConecMain.Commit;
    Except
      ConecMain.Rollback;
      Result := false;
    End;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TCategorie.Update: Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE Categorie ' + '   SET CATDescription=:Description ' + ' WHERE CategorieATableName=:CategorieATableName ');
    Qry.ParamByName('CategorieATableName').AsInteger := Self.F_TableName;
    Qry.ParamByName('CATDescription').AsString := Self.F_description;

    Try
      ConecMain.StartTransaction;
      Qry.ExecSQL;
      ConecMain.Commit;
    Except
      ConecMain.Rollback;
      Result := false;
    End;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TCategorie.Insert: Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO Categorie (CATDescription) values (:CATDescription)');
    Qry.ParamByName('CATDescription').AsString := Self.F_description;
    Try
      ConecMain.StartTransaction;
      Qry.ExecSQL;
      ConecMain.Commit;
    Except
      ConecMain.Rollback;
      Result := false;
    End;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;

function TCategorie.Select(ATableName: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT CategorieATableName, ' + '       CATDescription ' + '  FROM Categorie ' + ' WHERE CategorieATableName=:CategorieATableName');
    Qry.ParamByName('CategorieATableName').AsInteger := ATableName;
    Try
      Qry.Open;

      Self.F_TableName := Qry.FieldByName('categoriaATableName').AsInteger;
      Self.F_description := Qry.FieldByName('CATDescription').AsString;
    Except
      Result := false;
    End;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;
{$ENDREGION}
{$REGION 'Gets'}

function TCategorie.getID: Integer;
begin
  Result := Self.F_TableName;
end;

function TCategorie.getDescription: string;
begin
  Result := Self.F_description;
end;
{$ENDREGION}
{$REGION 'Sets'}

procedure TCategorie.setID(const Value: Integer);
begin
  Self.F_TableName := Value;
end;

procedure TCategorie.setDescription(const Value: string);
begin
  Self.F_description := Value;
end;
{$ENDREGION}

end.
