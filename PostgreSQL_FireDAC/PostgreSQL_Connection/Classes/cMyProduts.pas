{ ============================================
  Software Name : 	MMSQL_MyProduct
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit cMyProduts;

interface

uses System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.SysUtils;

type
  TProduct = class
  private
    ConecMain: TFDConnection;
    F_ProductID: Integer; // Int
    F_name: String; // VarChar
    F_description: string;
    F_value: Double;
    F_quantity: Double;
    F_CategorieID: Integer;

  public
    constructor Create(AConecMain: TFDConnection);
    destructor Destroy; override;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete: Boolean;
    function Select(id: Integer): Boolean;
  published
    property ProductID: Integer read F_ProductID write F_ProductID;
    property name: string read F_name write F_name;
    property description: string read F_description write F_description;
    property value: Double read F_value write F_value;
    property quantity: Double read F_quantity write F_quantity;
    property CategorieID: Integer read F_CategorieID write F_CategorieID;
  end;

implementation

{ TCategoria }

{$REGION 'Constructor and Destructor'}

constructor TProduct.Create(AConecMain: TFDConnection);
begin
  ConecMain := AConecMain;
end;

destructor TProduct.Destroy;
begin

  inherited;
end;
{$ENDREGION}
{$REGION 'CRUD'}

function TProduct.Delete: Boolean;
var
  Qry: TFDQuery;
begin
  if MessageDlg('Delete the Registry: ' + #13 + #13 + 'ID: ' + IntToStr(F_ProductID) + #13 + 'Description: ' + F_name, mtConfirmation, [mbYes, mbNo], 0) = mrNo
  then
  begin
    Result := false;
    abort;
  end;

  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('DELETE FROM Products ' + ' WHERE ProductID=:ProductID ');
    Qry.ParamByName('ProductID').AsInteger := F_ProductID;
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

function TProduct.Update: Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE Products ' + '   SET Pname           =:Pname ' + '       ,Pdescription     =:Pdescription ' + '       ,Pvalue         =:Pvalue ' +
      '       ,Pquantity    =:Pquantity ' + '       ,CategorieID   =:CategorieID ' + ' WHERE ProductID=:ProductID ');
    Qry.ParamByName('ProductID').AsInteger := Self.F_ProductID;
    Qry.ParamByName('Pname').AsString := Self.F_name;
    Qry.ParamByName('Pdescription').AsString := Self.F_description;
    Qry.ParamByName('Pvalue').AsFloat := Self.F_value;
    Qry.ParamByName('Pquantity').AsFloat := Self.F_quantity;
    Qry.ParamByName('CategorieID').AsInteger := Self.F_CategorieID;

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

function TProduct.Insert: Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO Products (Pname, ' + '                      Pdescription, ' + '                      Pvalue,  ' + '                      Pquantity,  '
      + '                      CategorieID) ' + ' VALUES              (:Pname, ' + '                      :Pdescription, ' + '                      :Pvalue,  ' +
      '                      :Pquantity,  ' + '                      :CategorieID )');

    Qry.ParamByName('Pname').AsString := Self.F_name;
    Qry.ParamByName('Pdescription').AsString := Self.F_description;
    Qry.ParamByName('Pvalue').AsFloat := Self.F_value;
    Qry.ParamByName('Pquantity').AsFloat := Self.F_quantity;
    Qry.ParamByName('CategorieID').AsInteger := Self.F_CategorieID;

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

function TProduct.Select(id: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT ProductID,' + '       Pname, ' + '       Pdescription, ' + '       Pvalue, ' + '       Pquantity, ' + '       CategorieID ' +
      '  FROM Products ' + ' WHERE ProductID=:ProductID');
    Qry.ParamByName('ProductID').AsInteger := id;
    Try
      Qry.Open;

      Self.F_ProductID := Qry.FieldByName('ProductID').AsInteger;
      Self.F_name := Qry.FieldByName('Pname').AsString;
      Self.F_description := Qry.FieldByName('Pdescription').AsString;
      Self.F_value := Qry.FieldByName('Pvalue').AsFloat;
      Self.F_quantity := Qry.FieldByName('Pquantity').AsFloat;
      Self.F_CategorieID := Qry.FieldByName('CategorieID').AsInteger;
    Except
      Result := false;
    End;

  finally
    if Assigned(Qry) then
      FreeAndNil(Qry);
  end;
end;
{$ENDREGION}

end.
