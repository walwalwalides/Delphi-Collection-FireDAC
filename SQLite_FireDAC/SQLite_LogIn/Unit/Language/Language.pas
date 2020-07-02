{ ============================================
  Software Name : 	LogInMyTasks
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit Language;

interface

uses
  SysUtils, IniFiles;

const

  sEnglish = 'English';

type

  TLanguage = class
    sLanguage: string;

    sTitle_Application: string;
    sTitle_MainApplic: string;

    sMenuDatabase: string;
    sMenuLogin: string;
    sMenuUsers: string;
    sMenuQuit: string;


    sButNew: string;
    sButAdd: string;
    sButUpd: string;
    sButDel: string;

    sButDatabase: string;
    sButLogin: string;
    sButUsers: string;
    sButAbout: string;
    sButQuit: string;

    sButTasks: string;
    sButSummary: string;
    sButGraphic: string;
    sButClipBoard: string;
    sButPrintPortrait: string;
    sButPrintLandscape: string;

    sLabelDatabase: string;
    sLabelHoursPerDay: string;
    sLabelWorkingRate: string;
    sLabelTotMonth: string;
    sLabelTask: string;
    sLabelMonth: string;
    sLabelNbrHrs: string;
    sLabelTaskDescr: string;
    sLabelDayDescr: string;
    sLabelSelYearMonth: string;
    sLabelTotPlanned: string;
    sLabelDiffMonth: string;
    sLabelInitialReport: string;
    sLabelBeginReport: string;
    sLabelTotalReport: string;

    sHint_Database: string;
    sHint_About: string;
    sHint_LogIn: string;
    sHint_Users: string;
     sHint_Quit:string;
    sMsgTaskUsed: string;
    sMsgTaskMax: string;
    sMsgNotFile: string;
    sMsgQuestQuit: string;
    sMsgFieldEmpty: string;
    sMsgMatriculeExist: string;
    sMsgUserExist: string;
    sMsgUserNotExist: string;

    sColTaskName: string;
    sColTotal: string;
    sRowDayTotal: string;

    sUserDlgTitle: string;
    sUserAccess: string;
    sUserFirstName: string;
    sUserLastName: string;
    sUserMatricule: string;
    sUserUserType: string;
    sUserConfirmation: string;
    sUserAccessRate: string;
    sUserRightsAdmin: string;
    sUserRightsUser: string;



  //
    procedure ReadLanguage(sLanguage: string);
  end;

var

  Lang: TLanguage;

implementation

procedure TLanguage.ReadLanguage(sLanguage: string);
var
  i: word;
  sSection: string;
  IniFile: TIniFile;
begin
  IniFile := TIniFile.Create(GetCurrentDir + '\' + sLanguage + '.lng');

  sSection := '--- Texts for titles ---';
  sTitle_Application := IniFile.ReadString(sSection, 'sTitle_Application', '');
  sTitle_MainApplic := IniFile.ReadString(sSection, 'sTitle_MainApplic', '');

  sSection := '--- Texts for menus ---';
  sMenuDatabase := IniFile.ReadString(sSection, 'sMenuDatabase', '');
  sMenuLogin := IniFile.ReadString(sSection, 'sMenuLogin', '');
  sMenuUsers := IniFile.ReadString(sSection, 'sMenuUsers', '');
  sMenuQuit := IniFile.ReadString(sSection, 'sMenuQuit', '');

  sSection := '--- Texts for buttons ---';
  sButNew := IniFile.ReadString(sSection, 'sButNew', '');
  sButAdd := IniFile.ReadString(sSection, 'sButAdd', '');
  sButUpd := IniFile.ReadString(sSection, 'sButUpd', '');
  sButDel := IniFile.ReadString(sSection, 'sButDel', '');
  sButDatabase := IniFile.ReadString(sSection, 'sButDatabase', '');

  sButLogin := IniFile.ReadString(sSection, 'sButLogin', '');
  sButUsers := IniFile.ReadString(sSection, 'sButUsers', '');
  sButAbout := IniFile.ReadString(sSection, 'sButAbout', '');
  sButQuit := IniFile.ReadString(sSection, 'sButQuit', '');

  sSection := '--- Texts for labels ---';
  sLabelDatabase := IniFile.ReadString(sSection, 'sLabelDatabase', '');

  sSection := '--- Texts for hints ---';
  sHint_Database := IniFile.ReadString(sSection, 'sHint_Database', '');
  sHint_Users := IniFile.ReadString(sSection, 'sHint_Users', '');
  sHint_Quit:=  IniFile.ReadString(sSection, 'sHint_Quit', '');
  sHint_About := IniFile.ReadString(sSection, 'sHint_About', '');
  sHint_LogIn := IniFile.ReadString(sSection, 'sHint_LogIn', '');

  sSection := '--- Texts for messages ---';
  sMsgTaskUsed := IniFile.ReadString(sSection, 'sMsgTaskUsed', '');
  sMsgTaskMax := IniFile.ReadString(sSection, 'sMsgTaskMax', '');
  sMsgNotFile := IniFile.ReadString(sSection, 'sMsgNotFile', '');
  sMsgQuestQuit := IniFile.ReadString(sSection, 'sMsgQuestQuit', '');
  sMsgFieldEmpty := IniFile.ReadString(sSection, 'sMsgFieldEmpty', '');
  sMsgMatriculeExist := IniFile.ReadString(sSection, 'sMsgMatriculeExist', '');
  sMsgUserExist := IniFile.ReadString(sSection, 'sMsgUserExist', '');
  sMsgUserNotExist := IniFile.ReadString(sSection, 'sMsgUserNotExist', '');

  sSection := '--- Texts for users dialogs ---';
  sUserDlgTitle := IniFile.ReadString(sSection, 'sUserDlgTitle', '');
  sUserAccess := IniFile.ReadString(sSection, 'sUserAccess', '');
  sUserFirstName := IniFile.ReadString(sSection, 'sUserFirstName', '');
  sUserLastName := IniFile.ReadString(sSection, 'sUserLastName', '');
  sUserMatricule := IniFile.ReadString(sSection, 'sUserMatricule', '');
  sUserUserType := IniFile.ReadString(sSection, 'sUserUserType', '');
  sUserConfirmation := IniFile.ReadString(sSection, 'sUserConfirmation', '');
  sUserAccessRate := IniFile.ReadString(sSection, 'sUserAccessRate', '');
  sUserRightsAdmin := IniFile.ReadString(sSection, 'sUserRightsAdmin', '');
  sUserRightsUser := IniFile.ReadString(sSection, 'sUserRightsUser', '');

  //
  IniFile.Free;
end;

initialization

Lang := TLanguage.Create;

finalization

Lang.Free;

end.
