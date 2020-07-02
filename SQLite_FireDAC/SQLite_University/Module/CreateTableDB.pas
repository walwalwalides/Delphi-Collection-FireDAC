{ ============================================
  Software Name : 	SQLite_University
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }

unit CreateTableDB;

interface

uses SysUtils, Vcl.Forms, FireDAC.Comp.Client, FireDAC.Comp.Script;

type
  TCreateTable = class

  strict private
    FConecSQlite: TFDConnection;
    constructor CreatePrivate;
  private


  public

    constructor Create;

    // ---------------------Main Tables ---------------------    //

    procedure SetTableStudent(AConecSQlite: TFDConnection);
    procedure SetTableOptions(AConecSQlite: TFDConnection);
    procedure SetTriggerStudentIns(AConecSQlite: TFDConnection);
    procedure SetTriggerStudentDel(AConecSQlite: TFDConnection);
    procedure SetTriggerStudentUp(AConecSQlite: TFDConnection);
    procedure SetTableClass(AConecSQlite: TFDConnection);
    destructor Destroy; override;
  end;

implementation

procedure TCreateTable.SetTableStudent(AConecSQlite: TFDConnection);
var
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := AConecSQlite;
  tmpQuery.close;
  tmpQuery.SQL.Clear;
  tmpQuery.SQL.Add('Create Table Student(');
  tmpQuery.SQL.Add('ID integer NOT NULL,');
  tmpQuery.SQL.Add('Matricule  varchar(12),');
  tmpQuery.SQL.Add('Sex        char(1),');
  tmpQuery.SQL.Add('FirstName  varchar(50) NOT NULL,');
  tmpQuery.SQL.Add('BIRTHDAY   date NOT NULL,');
  tmpQuery.SQL.Add('ClassName  varchar(50),');
  tmpQuery.SQL.Add('LastName   varchar(50) NOT NULL,');
  tmpQuery.SQL.Add('CONSTRAINT RelationshipClassName');
  tmpQuery.SQL.Add('FOREIGN KEY (ClassName)');
  tmpQuery.SQL.Add('REFERENCES Class(ClassName))');
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

procedure TCreateTable.SetTableClass(AConecSQlite: TFDConnection);
var
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := AConecSQlite;
  tmpQuery.close;
  tmpQuery.SQL.Clear;
  tmpQuery.SQL.Add('Create Table Class(');
  tmpQuery.SQL.Add('ID integer NOT NULL,');
  tmpQuery.SQL.Add('ClassNumber  integer NOT NULL DEFAULT 0,');
  tmpQuery.SQL.Add('ClassName    varchar(50) NOT NULL,');
  tmpQuery.SQL.Add('CONSTRAINT PK_Class');
  tmpQuery.SQL.Add('PRIMARY KEY (ClassName))');
  tmpQuery.Execute;
  tmpQuery.close;
  tmpQuery.Free;

end;





procedure TCreateTable.SetTriggerStudentUp(AConecSQlite: TFDConnection);

var
  tmpScript: TFDScript;
begin
  tmpScript := TFDScript.Create(nil);
  tmpScript.Connection := AConecSQlite;
  with tmpScript.SQLScripts do
  begin
    Clear;
    with Add do
    begin
      Name := 'UpAddStudentNr';
      SQL.Add('CREATE TRIGGER IF NOT EXISTS UpAddStudentNr AFTER UPDATE OF ClassName');
      SQL.Add('ON Student');
      SQL.Add('FOR EACH ROW');
      SQL.Add('BEGIN');
      SQL.Add('UPDATE class SET ClassNumber = ClassNumber +1 WHERE ClassName = new.ClassName;');
      SQL.Add('END;');
    end;
    try
      tmpScript.ValidateAll;
      tmpScript.ExecuteAll;
    finally
      tmpScript.Free;
    end;
  end;

  tmpScript := TFDScript.Create(nil);
  tmpScript.Connection := AConecSQlite;
  with tmpScript.SQLScripts do
  begin
    Clear;
    with Add do
    begin
      Name := 'UpDecStudentNr';
      SQL.Add('CREATE TRIGGER IF NOT EXISTS UpDecStudentNr AFTER UPDATE OF ClassName');
      SQL.Add('ON Student');
      SQL.Add('FOR EACH ROW');
      SQL.Add('BEGIN');
      SQL.Add('UPDATE class SET ClassNumber = ClassNumber -1 WHERE ClassName = old.ClassName;');
      SQL.Add('END;');
    end;
    try
      tmpScript.ValidateAll;
      tmpScript.ExecuteAll;
    finally
      tmpScript.Free;
    end;
  end;

end;

procedure TCreateTable.SetTriggerStudentIns(AConecSQlite: TFDConnection);
var
  tmpScript: TFDScript;
Begin
  tmpScript := TFDScript.Create(nil);
  tmpScript.Connection := AConecSQlite;
  with tmpScript.SQLScripts do
  begin
    Clear;
    with Add do
    begin
      Name := 'InAddStudentNr';
      SQL.Add('CREATE TRIGGER IF NOT EXISTS InAddStudentNr AFTER INSERT');
      SQL.Add('ON Student');
      SQL.Add('FOR EACH ROW');
      SQL.Add('BEGIN');
      SQL.Add('UPDATE class SET ClassNumber = ClassNumber +1 WHERE ClassName = new.ClassName;');
      SQL.Add('END;');
    end;
    try
      tmpScript.ValidateAll;
      tmpScript.ExecuteAll;
    finally
      tmpScript.Free;
    end;
  end;
End;

procedure TCreateTable.SetTriggerStudentDel(AConecSQlite: TFDConnection);
var
  tmpScript: TFDScript;

Begin
  tmpScript := TFDScript.Create(nil);
  tmpScript.Connection := AConecSQlite;
  with tmpScript.SQLScripts do
  begin
    Clear;
    with Add do
    begin
      Name := 'DelDecStudentNr';
      SQL.Add('CREATE TRIGGER IF NOT EXISTS DelDecStudentNr AFTER DELETE');
      SQL.Add('ON Student');
      SQL.Add('FOR EACH ROW');
      SQL.Add('BEGIN');
      SQL.Add('UPDATE class SET ClassNumber = ClassNumber -1 WHERE ClassName = old.ClassName;');
      SQL.Add('END;');
    end;
    try
      tmpScript.ValidateAll;
      tmpScript.ExecuteAll;
    finally
      tmpScript.Free;
    end;
  end;
End;

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
