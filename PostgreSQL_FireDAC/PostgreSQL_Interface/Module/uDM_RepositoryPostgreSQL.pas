{ ============================================
  Software Name : 	PostgreSQL_Interface
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2020 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }

unit uDM_RepositoryPostgreSQL;

interface

uses
  Forms, Dialogs, uiRepositories, uiRepoSystem,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client;

type
  TDM_RepositoryPostgreSQL = class(TDataModule, IRepositories)
    FDConnPostgreSQL: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    FDManagerPostgreSQL: TFDManager;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure IniLevelColor;
    procedure IniUserInfo;
    procedure vorInit;
    { Private declarations }
  public
    { Public declarations }
    function Repository: IRepoSystem;
  end;

const
  NUMBER_OF_TYPE = 3;
  LevelTableData: array [0 .. NUMBER_OF_TYPE - 1] of string = ('LVL1',
    'LVL2', 'LVL3');

var
  DM_RepositoryPostgreSQL: TDM_RepositoryPostgreSQL;

procedure initialize; // declaration

implementation

uses
  uDM_RepositorySysPostgreSQL;

{%CLASSGROUP 'Vcl.Controls.TControl'}

var
  mRepository: IRepoSystem;

procedure initialize;
begin
  If Assigned(DM_RepositoryPostgreSQL) then
    exit;
  Application.CreateForm(TDM_RepositoryPostgreSQL, DM_RepositoryPostgreSQL);
end;

{$R *.dfm}

procedure TDM_RepositoryPostgreSQL.DataModuleCreate(Sender: TObject);
begin
  Try
    FDConnPostgreSQL.Connected := False;
    {u can hole all DB connection parametres from Inifile}
//    FDConnPostgreSQL.LoginPrompt := False;
//    FDConnPostgreSQL.DriverName := 'PG';
//    FDConnPostgreSQL.Params.Values['Database'] := '';
//    FDConnPostgreSQL.Params.Values['User_Name'] := '';
//    FDConnPostgreSQL.Params.Values['Password'] := '';
//    FDConnPostgreSQL.Params.Values['Server'] := '';
//    FDConnPostgreSQL.Params.Values['Port'] := '5432';
//    FDConnPostgreSQL.Params.Values['MetaDefSchema'] := 'public';
//    FDPhysPgDriverLink1.DriverID := 'PG';
//    // FDPhysPgDriverLink1.VendorHome :=;
//    FDPhysPgDriverLink1.VendorLib := '';

    FDConnPostgreSQL.Connected := True;
    vorInit;

  Except
    On E: Exception do
      ShowMessage('Error Connect PostgreSQL : ' + E.Message)
  End;
end;

function TDM_RepositoryPostgreSQL.Repository: IRepoSystem;
begin
  if not Assigned(mRepository) then
    mRepository := TDM_RepositorySysPostgreSQL.Create(Self);
  Result := mRepository;
end;

procedure TDM_RepositoryPostgreSQL.vorInit;
const
  cgenreid =
    'lvlid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 10 CACHE 1 )';
  cuserid = 'userid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 10 CACHE 1 )';
begin
  begin
    try
      FDConnPostgreSQL.ExecSQL('CREATE TABLE IF NOT EXISTS levelcolor ('
        + cgenreid +
        ',lvlcolor integer NOT NULL DEFAULT 0,lvlname character(50) COLLATE pg_catalog."default" )');

      FDConnPostgreSQL.ExecSQL('CREATE TABLE IF NOT EXISTS userinfo (' +
        cuserid + ',userlastname character(50) COLLATE pg_catalog."default",userfirstname character(50) COLLATE pg_catalog."default",useremail character(100) COLLATE pg_catalog."default",usertelefonnr character(50) COLLATE pg_catalog."default")');

      IniLevelColor;
      IniUserInfo;
    except
      exit;
    end;
  end;

end;

procedure TDM_RepositoryPostgreSQL.IniLevelColor;
var
  i: Integer;
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := FDConnPostgreSQL;
  tmpQuery.close;
  tmpQuery.SQl.Clear;
  tmpQuery.SQl.Text := 'Select * From levelcolor';
  tmpQuery.Open;
  try
    if (tmpQuery.RecordCount <= 0) then
    begin

      tmpQuery.close;
      tmpQuery.SQl.Clear;
      tmpQuery.SQl.Text :=
        'INSERT INTO levelcolor (lvlname,lvlColor) values (:ln,:lc)';
      for i := 0 to NUMBER_OF_TYPE - 1 do
      begin
        tmpQuery.ParamByName('ln').AsString := LevelTableData[i];
        tmpQuery.ParamByName('lc').Asinteger := i;
        tmpQuery.ExecSQL;
      end;
      tmpQuery.close;
    end
    else
    begin
      tmpQuery.close;
    end;
  finally
    FreeAndNil(tmpQuery);
  end;

end;

procedure TDM_RepositoryPostgreSQL.IniUserInfo;
var
  i: Integer;
  tmpQuery: TFDQuery;
begin
  tmpQuery := TFDQuery.Create(nil);
  tmpQuery.Connection := FDConnPostgreSQL;
  tmpQuery.close;
  tmpQuery.SQl.Clear;
  tmpQuery.SQl.Text := 'Select * From userinfo';
  tmpQuery.Open;
  try
    if (tmpQuery.RecordCount <= 0) then
    begin

      tmpQuery.close;
      tmpQuery.SQl.Clear;
      tmpQuery.SQl.Text :=
        'INSERT INTO userinfo(userlastname,userFirstname,useremail,usertelefonnr) values (:ul,:uf,:ue,:ut)';

      tmpQuery.ParamByName('ul').AsString := '-';
      tmpQuery.ParamByName('uf').AsString := '-';
      tmpQuery.ParamByName('ue').AsString := '-';
      tmpQuery.ParamByName('ut').AsString := '-';

      try
        tmpQuery.ExecSQL;
      finally
        tmpQuery.close;
      end;

    end
    else
    begin
      tmpQuery.close;
    end;
  finally
    FreeAndNil(tmpQuery);
  end;

end;

end.
