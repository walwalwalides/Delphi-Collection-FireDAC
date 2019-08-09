{ ============================================
  Software Name : 	SQLite_University
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
  Windows, Graphics, SysUtils, DateUtils, Classes, Controls, Types;

const
  sAUTHOR_NAME = 'walwalwalides';
  sAUTHOR_EMAIL = 'walwalwalides@gmail.com';
  sPROG_VERS = ' 1.00';
  sPROG_DATES = '(2019 - 2020)';

  // Divers
  nHRS_PERDAY = 8.4;
  sDATABASE_DIR = 'Database\';
  sDATABASE_NAME = 'University.db';

  nLOG_NONE = 0;
  nLOG_ADMIN = 1;
  nLOG_USER = 2;

  nCOL_ClassName = 0;
  nCOL_FIRSTNAME = 1;
  nCOL_LASTNAME = 2;
  nCOL_MATRICULE = 3;
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

  nNBR_CLASSMAX = 20;

  { Name of Tables }
  sTBL_STUDENT = 'Student';
  sTBL_CLASS = 'Class';
  sTBL_OPTIONS = 'Options';

  { Field Name Tables }
  sFLD_ID = 'ID';
  sFLD_USER_ID = 'User_ID';

  sFLD_FIRSTNAME = 'FirstName';
  sFLD_LASTNAME = 'LastName';
  sFLD_MATRICULE = 'Matricule';
  sFLD_BIRTHDAY = 'Birthday';
  sFLD_SEX = 'Sex';


  sFLD_OPTSECTION = 'OptSection';
  sFLD_OPTKEY = 'OptKey';
  sFLD_OPTVALUE = 'OptValue';
 {Field Class Table}
  sFLD_CLASSNAME = 'ClassName';
  sFLD_CLASSNUMBER = 'ClassNumber';

type

  TREC_STUDENT = record
    nID: LongInt;
    sFirstName: string;
    sLastName: string;
    sClassName: string;
    sMatricule: string;
    sBirthday: TDate;
    nType: word;
    sSex: string;
  end;

  TREC_Class = record
    nID: LongInt;
    sClassName: string;
    iClassNumber: integer;
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

    RecStudent: TREC_STUDENT;
    RecClass: TREC_Class;

     asTasks: array of string;
    anTasksID: array of LongInt;
    anTaskHrs: array of double;

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
