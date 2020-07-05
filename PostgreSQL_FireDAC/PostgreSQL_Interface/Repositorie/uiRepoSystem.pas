{ ============================================
  Software Name : 	PostgreSQL_Interface
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2020 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uiRepoSystem;

interface

uses
  uLevelClr, uUserInfo;

Type
  IRepoSystem = interface
    function ReturnLevel(id: integer): TLevelColor;
    procedure SetLevelColor(id: integer; gcolor: integer);

    function ReturnUserInfo(id: integer): TUserInfo;
    procedure SetUserInfo(id: integer; ALastName: string; AFirstName: string;
      AEmail: string; ATelefon: string);
  end;

implementation

end.
