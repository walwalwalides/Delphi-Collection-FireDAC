{ ============================================

  Software Name : 	PostgreSQL_Connection
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }

unit cMyClients;

interface

uses System.Classes,
  Vcl.Controls,
  Vcl.ExtCtrls,
  Vcl.Dialogs,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  System.SysUtils, System.DateUtils;

type
  TClient = class
  private
    ConecMain: TFDConnection;
    F_clienteId: Integer;
    F_name: String;
    F_adress: string;
    F_city: String;
    F_sex: String;

    F_telefon: string;
    F_email: string;
    F_birthdate: TDateTime;
    F_insertts: TDateTime;
  public
    constructor Create(AConecMain: TFDConnection);
    destructor Destroy; override;
    function Insert: Boolean;
    function Update: Boolean;
    function Delete: Boolean;
    function Select(id: Integer): Boolean;
  published
    property clientID: Integer read F_clienteId write F_clienteId;
    property name: string read F_name write F_name;
    property adress: string read F_adress write F_adress;
    property city: string read F_city write F_city;
    property sex: string read F_sex write F_sex;
    property telefon: string read F_telefon write F_telefon;
    property email: string read F_email write F_email;
    property birthdate: TDateTime read F_birthdate write F_birthdate;
    property insertts: TDateTime read F_insertts write F_insertts;
  end;

implementation

{ TCategoria }

{$REGION 'Constructor and Destructor'}

constructor TClient.Create(AConecMain: TFDConnection);
begin
  ConecMain := AConecMain;
end;

destructor TClient.Destroy;
begin

  inherited;
end;
{$ENDREGION}
{$REGION 'CRUD'}

function TClient.Delete: Boolean;
var
  Qry: TFDQuery;
begin
  if MessageDlg('Delete the Registry: ' + #13 + #13 + 'ID: ' + IntToStr(F_clienteId) + #13 + 'Description: ' + F_name, mtConfirmation, [mbYes, mbNo], 0) = mrNo
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
    Qry.SQL.Add('DELETE FROM Clients ' + ' WHERE ClientID=:ClientID ');
    Qry.ParamByName('ClientID').AsInteger := F_clienteId;
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

function TClient.Update: Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('UPDATE Clients ' + '   SET Cname            =:Cname ' + '       ,Cadress        =:Cadress ' + '       ,Ccity          =:Ccity ' +
      '       ,Csex       =:Csex ' + '       ,Ctelefon       =:Ctelefon ' + '       ,Cemail         =:Cemail ' + '       ,Cbirthdate =:Cbirthdate ' +
      ' WHERE ClientID=:ClientID ');
    Qry.ParamByName('ClientID').AsInteger := Self.F_clienteId;
    Qry.ParamByName('Cname').AsString := Self.F_name;
    Qry.ParamByName('Cadress').AsString := Self.F_adress;
    Qry.ParamByName('Ccity').AsString := Self.F_city;
    Qry.ParamByName('Csex').AsString := Self.F_sex;
    Qry.ParamByName('Ctelefon').AsString := Self.F_telefon;
    Qry.ParamByName('Cemail').AsString := Self.F_email;
  //  -------------------------------------------------------------------------  //
    Qry.ParamByName('Cbirthdate').AsDateTime := DateOf(Self.F_birthdate);
    Qry.ParamByName('Cinsertts').AsDate := DateOf(Self.F_insertts);

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

function TClient.Insert: Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('INSERT INTO Clients (Cname, ' + '                      Cadress, ' + '                      Ccity,  ' + '                      Cneighborhood,  '
      + '                      Cstate, ' + '                      Csex, ' + '                      Czipcode, ' + '                      Ctelefon, ' +
      '                      Cemail, ' + '                      Cbirthdate) ' + ' VALUES              (:Cname, ' + '                      :Cadress, ' +
      '                      :Ccity,  ' + '                      :Cneighborhood,  ' + '                      :Cstate, ' + '                      :Csex, ' +
      '                      :Czipcode, ' + '                      :Ctelefon, ' + '                      :Cemail, ' + '                      :Cbirthdate,' +
      '                      :Cinsertts)');

    Qry.ParamByName('Cname').AsString := Self.F_name;
    Qry.ParamByName('Cadress').AsString := Self.F_adress;
    Qry.ParamByName('Ccity').AsString := Self.F_city;
    Qry.ParamByName('Csex').AsString := Self.F_sex;
    Qry.ParamByName('Ctelefon').AsString := Self.F_telefon;
    Qry.ParamByName('Cemail').AsString := Self.F_email;
  //  -------------------------------------------------------------------------  //
//    Qry.ParamByName('Cbirthdate').AsDate := DateOf(Self.F_birthdate);
//    Qry.ParamByName('Cinsertts').AsDate := DateOf(Self.F_insertts);

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

function TClient.Select(id: Integer): Boolean;
var
  Qry: TFDQuery;
begin
  try
    Result := true;
    Qry := TFDQuery.Create(nil);
    Qry.Connection := ConecMain;
    Qry.SQL.Clear;
    Qry.SQL.Add('SELECT ClientID,' + '       Cname, ' + '       Cadress, ' + '       Ccity, ' + '       Csex, ' + '       Ctelefon, ' + '       Cemail, ' +
      '       Cbirthdate, ' + '   Cinsertts' + '  FROM Clients ' + ' WHERE ClientID=:ClientID');
    Qry.ParamByName('ClientID').AsInteger := id;
    Try
      Qry.Open;

      Self.F_clienteId := Qry.FieldByName('ClientID').AsInteger;
      Self.F_name := Qry.FieldByName('Cname').AsString;
      Self.F_adress := Qry.FieldByName('Cadress').AsString;
      Self.F_city := Qry.FieldByName('Ccity').AsString;
      Self.F_sex := Qry.FieldByName('Csex').AsString;
      Self.F_telefon := Qry.FieldByName('Ctelefon').AsString;
      Self.F_email := Qry.FieldByName('Cemail').AsString;
      Self.F_birthdate := Qry.FieldByName('Cbirthdate').AsDateTime;
      Self.F_insertts := Qry.ParamByName('Cinsertts').AsDateTime;

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
