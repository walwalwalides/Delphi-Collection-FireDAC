{ ============================================
  Software Name : 	PostgreSQL_Interface
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2020 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uLevelClr;

interface

Type
  TLevelColor = class
  private
    FLevelID: integer;
    FLevelName: string;
    FLevelColor: integer;
    procedure SetLevelID(const Value: integer);
    procedure SetLevelName(const Value: string);
    procedure SetLevelColor(const Value: integer);
  published
    property LevelID: integer read FLevelID write SetLevelID;
    property LevelName: string read FLevelName write SetLevelName;
    property LevelColor: integer read FLevelColor write SetLevelColor;
  end;

implementation

{ TPackageGenreColor }

{ TUser }

procedure TLevelColor.SetLevelColor(const Value: integer);
begin
  FLevelColor := Value;
end;

procedure TLevelColor.SetLevelID(const Value: integer);
begin
  FLevelID := Value;
end;

procedure TLevelColor.SetLevelName(const Value: string);
begin
  FLevelName := Value;
end;

end.
