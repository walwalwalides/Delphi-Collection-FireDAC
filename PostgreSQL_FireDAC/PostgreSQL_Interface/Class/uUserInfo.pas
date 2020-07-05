unit uUserInfo;

interface

Type
  TUserInfo = class
  private
    FUserID: integer;
    FUserLastName: string;
    FUserFirstName: string;
    FUserEmail: string;
    FUserTelefonnr: string;

    procedure SetUserID(const Value: integer);
    procedure SetUserLastName(const Value: string);
    procedure SetUserFirstName(const Value: string);
    procedure SetUserEmail(const Value: string);
    procedure SetUserTelefonnr(const Value: string);

  published
    property UserID: integer read FUserID write SetUserID;
    property UserLastName: string read FUserLastName write SetUserLastName;
    property UserFirstName: string read FUserFirstName write SetUserFirstName;
    property UserEmail: string read FUserEmail write SetUserEmail;
    property UserTelefonnr: string read FUserTelefonnr write SetUserTelefonnr;
  end;

implementation

{ TUserInfo }

procedure TUserInfo.SetUserEmail(const Value: string);
begin
  FUserEmail := Value;
end;

procedure TUserInfo.SetUserFirstName(const Value: string);
begin
  FUserFirstName := Value;
end;

procedure TUserInfo.SetUserID(const Value: integer);
begin
  FUserID := Value;
end;

procedure TUserInfo.SetUserLastName(const Value: string);
begin
  FUserLastName := Value;
end;

procedure TUserInfo.SetUserTelefonnr(const Value: string);
begin
  FUserTelefonnr := Value;
end;

end.
