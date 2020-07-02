{ ============================================
  Software Name : 	SaveMyLogIn
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uDeclare;

interface

uses
  Windows, Graphics, SysUtils, DateUtils, Classes, Controls, Types,
  uColors;

const
  sAUTHOR_NAME = 'walwalwalides';
  sAUTHOR_EMAIL = 'walwalwalides@gmail.com';
  sPROG_VERS = ' 1.00';
  sPROG_DATES = '(2019 - 2020)';

  // Divers
  nHRS_PERDAY = 8.4;
  sDATABASE_DIR = 'Database\';
  sDATABASE_NAME = 'TasksDB.db';

  nLOG_NONE = 0;
  nLOG_ADMIN = 1;
  nLOG_USER = 2;

  nCOL_ID = 0;
  nCOL_MATRICULE = 1;
  nCOL_LASTNAME = 2;
  nCOL_FORNAME = 3;
  nCOL_TYPE = 4;



  nLEGEND_LEFT = 1;
  nLEGEND_TOP = 2;
  nLEGEND_RIGHT = 3;
  nLEGEND_BOTTOM = 4;

  nOFFSET_COMPOSANT = 5;
  nOFFSET_PREVNEXT = 560;
  nOFFSET_INTERVAL = 50;


  nOPT_BOOL = 1;
  nOPT_INTEGER = 2;
  nOPT_DOUBLE = 3;
  nOPT_DATE = 4;
  nOPT_STRING = 5;

  { Name of Tables }
  sTBL_USERS = 'Users';
  sTBL_OPTIONS = 'Options';

  { Field Name Tables }
  sFLD_ID = 'ID';
  sFLD_USER_ID = 'User_ID';

  sFLD_FORNAME = 'ForName';
  sFLD_LASTNAME = 'LastName';
  sFLD_MATRICULE = 'Matricule';
  sFLD_PASSWORD = 'PassW';
  sFLD_TYPE = 'Type';
  sFLD_WORKINGRATE = 'AccessRate';
  sFLD_OPTSECTION = 'OptSection';
  sFLD_OPTKEY = 'OptKey';
  sFLD_OPTVALUE = 'OptValue';

type

  TREC_User = record
    nID: LongInt;
    sForName: string;
    sLastName: string;
    sMatricule: string;
    sPassword: string;
    nType: word;
    nAccessRate: double;
  end;

  TAppliData = class(TObject)

    sCurrDir: string;
    sDatabase: string;
    sDatabasePath: string;

    nFrmUsersTop: integer;
    nFrmUsersLeft: integer;
    nFrmUsersHeight: integer;

    nFrmTasksTop: integer;
    nFrmTasksLeft: integer;
    nFrmTasksHeight: integer;

    nCurrRow: integer;
    nCurrCol: integer;

    { User }
    nUserID: LongInt;
    sMatricule: string;
    sFirstName: string;
    sLastName: string;

    RecUser: TREC_User;

    function CheckType: Boolean;
    procedure SetDefaultColors;
  end;

var
  AppliData: TAppliData;

implementation

{ TAppliData }

function TAppliData.CheckType: Boolean;
begin
  //
  Result := True;
end;

procedure TAppliData.SetDefaultColors;
begin
  //
end;

initialization

AppliData := TAppliData.Create;
with AppliData do
begin
  sCurrDir := GetCurrentDir; // Get the Current dir
  sDatabase := sDATABASE_NAME; // Set Database name

  sDatabasePath := IncludeTrailingPathDelimiter(sCurrDir) + sDATABASE_DIR; // Get Database Path

  SetDefaultColors;

end;

finalization

with AppliData do
begin

end;
AppliData.Free;

end.
