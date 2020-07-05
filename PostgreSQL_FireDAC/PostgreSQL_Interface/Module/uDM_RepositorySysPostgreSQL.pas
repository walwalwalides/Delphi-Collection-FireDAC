{ ============================================
  Software Name : 	PostgreSQL_Interface
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2020 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uDM_RepositorySysPostgreSQL;

interface

uses
  Dialogs, uDM_RepositoryPostgreSQL, uiRepoSystem, uLevelClr, uUserInfo,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM_RepositorySysPostgreSQL = class(TDataModule, iRepoSystem)
    QryGenreColorPostgreSQL: TFDQuery;
    QryUserInfoPostgreSQL: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    // GenreColor
    function ReturnLevel(id: Integer): TLevelColor;
    procedure SetLevelColor(id: Integer; gcolor: Integer);
    // UserInfo
    function ReturnUserInfo(id: Integer): TUserInfo;
    procedure SetUserInfo(id: Integer; ALastName, AFirstName, AEmail,
      ATelefon: string);

  end;

var
  DM_RepositorySysPostgreSQL: TDM_RepositorySysPostgreSQL;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}
{ TDM_RepositorySystemPostgreSQL }

function TDM_RepositorySysPostgreSQL.ReturnLevel(id: Integer): TLevelColor;
begin
  Try
    QryGenreColorPostgreSQL.SQL.Clear;
    QryGenreColorPostgreSQL.SQL.Text :=
      'Select lvlid,lvlname,lvlcolor from levelcolor where lvlid = :lvlid';
    QryGenreColorPostgreSQL.Close;
    QryGenreColorPostgreSQL.ParamByName('lvlid').Value := id;
    QryGenreColorPostgreSQL.Open;

    if not QryGenreColorPostgreSQL.IsEmpty then
    begin
      Result := TLevelColor.Create;
      Result.LevelID := QryGenreColorPostgreSQL.FieldByName('lvlid')
        .AsInteger;
      Result.LevelName := QryGenreColorPostgreSQL.FieldByName
        ('lvlname').AsString;
      Result.LevelColor := QryGenreColorPostgreSQL.FieldByName('lvlcolor')
        .AsInteger;
    end
    else
      Result := nil;
  Except
    On E: Exception do
      ShowMessage(E.Message);
  End;

end;

procedure TDM_RepositorySysPostgreSQL.SetLevelColor(id, gcolor: Integer);
begin
  Try
    QryGenreColorPostgreSQL.SQL.Clear;
    QryGenreColorPostgreSQL.SQL.Text :=
      'UPDATE levelcolor  SET lvlcolor =:lvlcolor WHERE lvlid =:lvlid';
    QryGenreColorPostgreSQL.Close;
    QryGenreColorPostgreSQL.ParamByName('lvlid').Value := id;
    QryGenreColorPostgreSQL.ParamByName('lvlcolor').Value := gcolor;
    QryGenreColorPostgreSQL.ExecSQL;

  Except
    On E: Exception do
      ShowMessage(E.Message);
  End;
end;

function TDM_RepositorySysPostgreSQL.ReturnUserInfo(id: Integer): TUserInfo;
begin
  Try
    QryUserInfoPostgreSQL.SQL.Clear;
    QryUserInfoPostgreSQL.SQL.Text :=
      'Select userid,userLastName,userfirstname,useremail,usertelefonnr from userinfo where userid = :userid';
    QryUserInfoPostgreSQL.Close;
    QryUserInfoPostgreSQL.ParamByName('userid').Value := id;
    QryUserInfoPostgreSQL.Open;

    if not QryUserInfoPostgreSQL.IsEmpty then
    begin
      Result := TUserInfo.Create;
      Result.UserID := QryUserInfoPostgreSQL.FieldByName('UserID').AsInteger;
      Result.UserLastName := QryUserInfoPostgreSQL.FieldByName
        ('userlastname').AsString;
      Result.UserFirstName := QryUserInfoPostgreSQL.FieldByName
        ('userfirstname').AsString;
      Result.UserEmail := QryUserInfoPostgreSQL.FieldByName
        ('useremail').AsString;
      Result.UserTelefonNr := QryUserInfoPostgreSQL.FieldByName
        ('usertelefonnr').AsString;
    end
    else
      Result := nil;
  Except
    On E: Exception do
      ShowMessage(E.Message);
  End;
end;

procedure TDM_RepositorySysPostgreSQL.SetUserInfo(id: Integer;
  ALastName, AFirstName, AEmail, ATelefon: string);
begin

  Try
    QryUserInfoPostgreSQL.SQL.Clear;
    QryUserInfoPostgreSQL.SQL.Text :=
      'UPDATE userinfo SET userlastname=:userlastname,userfirstname=:userfirstname,useremail =:useremail,usertelefonnr=:usertelefonnr WHERE UserID =:UserID';
    QryUserInfoPostgreSQL.Close;
    QryUserInfoPostgreSQL.ParamByName('userid').Value := id;
    QryUserInfoPostgreSQL.ParamByName('userlastname').Value := ALastName;
    QryUserInfoPostgreSQL.ParamByName('userfirstname').Value := AFirstName;
    QryUserInfoPostgreSQL.ParamByName('useremail').Value := AEmail;
    QryUserInfoPostgreSQL.ParamByName('usertelefonnr').Value := ATelefon;
    QryUserInfoPostgreSQL.ExecSQL;

  Except
    On E: Exception do
      ShowMessage(E.Message);
  End;
end;



end.
