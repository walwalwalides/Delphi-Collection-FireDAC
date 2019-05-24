unit CreateTableDB;

interface

uses SysUtils, Vcl.Forms,  FireDAC.Comp.Client, FireDAC.Comp.Script;

type
  TCreateTable = class

  strict private
    FConecSQlite: TFDConnection;
    constructor CreatePrivate;
  private

  public

    constructor Create;

    // ----------------Main Tables -----------    //


    procedure SetTableUsers(AConecSQlite: TFDConnection);
    procedure SetTableTasks(AConecSQlite: TFDConnection);
    procedure SetTableOptions(AConecSQlite: TFDConnection);
    procedure SetTableHrsPlanned(AConecSQlite: TFDConnection);
    procedure SetTableHours(AConecSQlite: TFDConnection);


    destructor Destroy; override;
  end;

implementation

procedure TCreateTable.SetTableUsers(AConecSQlite: TFDConnection);
var
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := AConecSQlite;
  tmpQuery.close;
  tmpQuery.SQL.Clear;
  tmpQuery.SQL.Add('Create Table Users(');
  tmpQuery.SQL.Add('ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,');
  tmpQuery.SQL.Add('ForName varchar(24),');
  tmpQuery.SQL.Add('LastName varchar(24),');
  tmpQuery.SQL.Add('Matricule varchar(12),');
  tmpQuery.SQL.Add('PassW varchar(16),');
  tmpQuery.SQL.Add('Type varchar(2),');
  tmpQuery.SQL.Add('WorkingRate smallInt)');
  tmpQuery.Execute;
  tmpQuery.close;
  tmpQuery.Free;

end;


procedure TCreateTable.SetTableTasks(AConecSQlite: TFDConnection);
var
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := AConecSQlite;
  tmpQuery.close;
  tmpQuery.SQL.Clear;
  tmpQuery.SQL.Add('Create Table Tasks(');
  tmpQuery.SQL.Add('ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,');
  tmpQuery.SQL.Add('User_ID integer,');
  tmpQuery.SQL.Add('TaskName varchar(32))');
  tmpQuery.Execute;
  tmpQuery.close;
  tmpQuery.Free;

end;




procedure TCreateTable.SetTableOptions(AConecSQlite: TFDConnection);
var
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := AConecSQlite;
  tmpQuery.close;
  tmpQuery.SQL.Clear;
  tmpQuery.SQL.Add('Create Table Options(');
  tmpQuery.SQL.Add('ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,');
  tmpQuery.SQL.Add('User_ID integer,');
  tmpQuery.SQL.Add('OptSection varchar(32),');
  tmpQuery.SQL.Add('OptKey varchar(64),');
  tmpQuery.SQL.Add('OptValue varchar(255))');
  tmpQuery.Execute;
  tmpQuery.close;
  tmpQuery.Free;
end;

procedure TCreateTable.SetTableHrsPlanned(AConecSQlite: TFDConnection);
var
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := AConecSQlite;
  tmpQuery.close;
  tmpQuery.SQL.Clear;
  tmpQuery.SQL.Add('Create Table HrsPlanned(');
  tmpQuery.SQL.Add('ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,');
  tmpQuery.SQL.Add('User_ID integer,');
  tmpQuery.SQL.Add('nYear smallInt,');
  tmpQuery.SQL.Add('nMonth smallInt,');
  tmpQuery.SQL.Add('NbrHrsDay FLOAT ,');
  tmpQuery.SQL.Add('WorkingRate FLOAT ,');
  tmpQuery.SQL.Add('HrsMonthly FLOAT )');
  tmpQuery.Execute;
  tmpQuery.close;
  tmpQuery.Free;

end;


procedure TCreateTable.SetTableHours(AConecSQlite: TFDConnection);
var
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := AConecSQlite;
  tmpQuery.close;
  tmpQuery.SQL.Clear;
  tmpQuery.SQL.Add('Create Table Hours(');
  tmpQuery.SQL.Add('ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,');
  tmpQuery.SQL.Add('User_ID integer,');
  tmpQuery.SQL.Add('Task_ID integer,');
  tmpQuery.SQL.Add('nYear integer,');
  tmpQuery.SQL.Add('nMonth integer,');
  tmpQuery.SQL.Add('nDay integer,');
  tmpQuery.SQL.Add('NbrHrs FLOAT,');
  tmpQuery.SQL.Add('Description varchar(255))');
  tmpQuery.Execute;
  tmpQuery.close;
  tmpQuery.Free;

end;


// --------------------------------------------------------------------------------------------//
constructor TCreateTable.Create;
begin
  raise Exception.Create('Connection Problem!!!');
end;

constructor TCreateTable.CreatePrivate;
var
  Erro: string;
begin
  inherited Create;
  FConecSQlite := TFDConnection.Create(nil);
  // if not Open(Erro) then
  // raise Exception.Create(Erro);

end;

destructor TCreateTable.Destroy;
begin
  FConecSQlite.Free;
end;

end.
