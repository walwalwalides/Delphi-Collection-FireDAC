{ ============================================
  Software Name : 	PostgreSQL_Interface
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2020                            }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit uiConfig;

interface

  Type
  IConfig = interface
    procedure setTypeDataBase(const Value : Integer);
    function getTypeDataBase : Integer;
    property TypeDataBase : Integer read getTypeDataBase write setTypeDataBase;
  end;


implementation



end.
