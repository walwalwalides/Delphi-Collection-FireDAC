{ ============================================
  Software Name : 	PostgreSQL_Interface
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2020 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uiRepositories;

interface

uses
  uiRepoSystem;

Type
  TpTypeDB = (tDBPostgreSQL, tDBMSSQL, tDBMySQL, tDBMongoDB, tDBSQLite);

  IRepositories = interface
    function Repository: IRepoSystem;
  end;

function Repositories: IRepositories;

implementation

uses
  Dialogs, sysutils,
  uConfiguration,
  uDM_RepositoryPostgreSQL;

var
  mRepositories: IRepositories = nil;

function Repositories: IRepositories;
begin
  If assigned(result) then
    exit;

  case TpTypeDB(configuration.TypeDataBase) of

    tDBPostgreSQL:
      begin
        if not assigned(mRepositories) then
        begin
          uDM_RepositoryPostgreSQL.initialize;
          mRepositories := DM_RepositoryPostgreSQL;
        end;
        result := mRepositories;
      end;

    tDBMSSQL:
      begin
        //
        raise Exception.Create('MSSQL');
      end;

    tDBMySQL:
      Begin
        raise Exception.Create('MySQL');

        //
      End;

    tDBMongoDB:
      Begin
        //
        raise Exception.Create('MongoDB');
      End;

    tDBSQLite:
      Begin
        //
        raise Exception.Create('SQLite');
      End;

  end;

end;

end.
