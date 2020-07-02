{ ============================================
  Software Name : 	LogInMyTasks
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit Language_Lib;

interface

uses
  SysUtils, IniFiles;
  const
  sDirLanguage = 'Language\';
type

  TLanguageLib = class

    sMenu_Password: string;
    sMenu_File: string;
    sMenu_New: string;
    sMenu_NewFolder: string;
    sMenu_Open: string;
    sMenu_Close: string;
    sMenu_Import: string;
    sMenu_Export: string;
    sMenu_Save: string;
    sMenu_SaveTo: string;
    sMenu_Delete: string;
    sMenu_View: string;
    sMenu_CfgView: string;
    sMenu_Quit: string;
    sMenu_Help: string;
    sMenu_HelpTo: string;
    sMenu_About: string;
    sMenu_Info :string;
    sMenu_About2: string;

    sBut_Password: string;
    sBut_New: string;
    sBut_NewFolder: string;
    sBut_Open: string;
    sBut_Close: string;
    sBut_Import: string;
    sBut_Export: string;
    sBut_Save: string;
    sBut_SaveTo: string;
    sBut_Delete: string;
    sBut_View: string;
    sBut_Config: string;
    sBut_Options: string;

    sBut_Accept: string;
    sBut_Quit: string;
    sBut_Cancel: string;

    sHint_Open: string;
    sHint_Import: string;
    sHint_Save: string;
    sHint_SaveTo: string;
    sHint_Print: string;
    sHint_Options: string;
    sHint_About: string;
    sHint_Quit: string;

    sMsg_Wait: string;
    sMsg_Open: string;
    sMsg_Save: string;
    sMsg_FileExist: string;
    sMsg_Replace: string;

    sPass_Title: string;
    sPass_Text: string;
    sPass_Confirm: string;
    sPass_Rights1: string;
    sPass_Rights2: string;
    sPass_Incorrect: string;
    sPass_Different: string;

    sAbout_Title: string;
    sAbout_Version: string;
    sAbout_DevName: string;
    sAbout_EmailObj: string;

    sAlert_Title: string;

    sSelDir_Title: string;
    sSelDir_Select: string;

    sSelFolder_Title: string;
    sSelFolder_NewFolder: string;
    sSelFolder_HintDesktop: string;
    sSelFolder_HintComputer: string;
    sSelFolder_HintPersonal: string;
    sSelFolder_HintNetwork: string;
    sSelFolder_HintRecents: string;

    sCfgFolder_Title: string;
    sCfgFolder_GrpTree: string;
    sCfgFolder_DispImg: string;
    sCfgFolder_DispLines: string;
    sCfgFolder_DispRoot: string;
    sCfgFolder_DispExpBut: string;
    sCfgFolder_GrpOptions: string;
    sCfgFolder_HideFolder: string;
    sCfgFolder_CreateFolder: string;
    sCfgFolder_ContextMenu: string;
    sCfgFolder_Rename: string;
    sCfgFolder_GrpShortcuts: string;
    sCfgFolder_Desktop: string;
    sCfgFolder_Personal: string;
    sCfgFolder_MyComputer: string;
    sCfgFolder_Network: string;
    sCfgFolder_Recents: string;

    sSkins_Skin: string;
    sSkins_Choice: string;
    sSkins_Standard: string;
    sSkins_Folder: string;
    //
    procedure ReadLanguage(const sLanguage: string);
  end;

var

  LangLib: TLanguageLib;

implementation

uses
  Vcl.Dialogs;

{ Load Library Language }
procedure TLanguageLib.ReadLanguage(const sLanguage: string);
var
  i: integer;
  sSection: string;
  sPath: string;
  IniFile: TIniFile;
begin
  sPath := GetCurrentDir + '\' +sLanguage + '_Lib.lng';
  // if fileexists(sPath) then showmessage('OK');

  IniFile := TIniFile.Create(sPath);

  sSection := '--- Texts standard for menus ---';
  sMenu_Password := IniFile.ReadString(sSection, 'sMenu_Password', '');
  sMenu_File := IniFile.ReadString(sSection, 'sMenu_File', '');
  sMenu_New := IniFile.ReadString(sSection, 'sMenu_New', '');
  sMenu_NewFolder := IniFile.ReadString(sSection, 'sMenu_NewFolder', '');
  sMenu_Open := IniFile.ReadString(sSection, 'sMenu_Open', '');
  sMenu_Close := IniFile.ReadString(sSection, 'sMenu_Close', '');
  sMenu_Import := IniFile.ReadString(sSection, 'sMenu_Import', '');
  sMenu_Export := IniFile.ReadString(sSection, 'sMenu_Export', '');
  sMenu_Save := IniFile.ReadString(sSection, 'sMenu_Save', '');
  sMenu_SaveTo := IniFile.ReadString(sSection, 'sMenu_SaveTo', '');
  sMenu_Delete := IniFile.ReadString(sSection, 'sMenu_Delete', '');
  sMenu_View := IniFile.ReadString(sSection, 'sMenu_View', '');
  sMenu_CfgView := IniFile.ReadString(sSection, 'sMenu_CfgView', '');
  sMenu_Quit := IniFile.ReadString(sSection, 'sMenu_Quit', '');
  sMenu_Help := IniFile.ReadString(sSection, 'sMenu_Help', '');
  sMenu_HelpTo := IniFile.ReadString(sSection, 'sMenu_HelpTo', '');
  sMenu_About := IniFile.ReadString(sSection, 'sMenu_About', '');
  sMenu_Info := IniFile.ReadString(sSection, 'sMenu_Info', '');
  sMenu_About2 := IniFile.ReadString(sSection, 'sMenu_About2', '');

  sSection := '--- Texts standard for buttons ---';
  sBut_Password := IniFile.ReadString(sSection, 'sBut_Password', '');
  sBut_New := IniFile.ReadString(sSection, 'sBut_New', '');
  sBut_NewFolder := IniFile.ReadString(sSection, 'sBut_NewFolder', '');
  sBut_Open := IniFile.ReadString(sSection, 'sBut_Open', '');
  sBut_Close := IniFile.ReadString(sSection, 'sBut_Close', '');
  sBut_Import := IniFile.ReadString(sSection, 'sBut_Import', '');
  sBut_Export := IniFile.ReadString(sSection, 'sBut_Export', '');
  sBut_Save := IniFile.ReadString(sSection, 'sBut_Save', '');
  sBut_SaveTo := IniFile.ReadString(sSection, 'sBut_SaveTo', '');
  sBut_Delete := IniFile.ReadString(sSection, 'sBut_Delete', '');
  sBut_View := IniFile.ReadString(sSection, 'sBut_View', '');

  sBut_Accept := IniFile.ReadString(sSection, 'sBut_Accept', '');
  sBut_Quit := IniFile.ReadString(sSection, 'sBut_Quit', '');
  sBut_Cancel := IniFile.ReadString(sSection, 'sBut_Cancel', '');

  sSection := '--- Texts standards for hints ---';
  sHint_Open := IniFile.ReadString(sSection, 'sHint_Open', '');
  sHint_Import := IniFile.ReadString(sSection, 'sHint_Import', '');
  sHint_Save := IniFile.ReadString(sSection, 'sHint_Save', '');
  sHint_SaveTo := IniFile.ReadString(sSection, 'sHint_SaveTo', '');
  sHint_Options := IniFile.ReadString(sSection, 'sHint_Options', '');
  sHint_About := IniFile.ReadString(sSection, 'sHint_About', '');
  sHint_Quit := IniFile.ReadString(sSection, 'sHint_Quit', '');

  sSection := '--- Texts for messages ---';
  sMsg_Wait := IniFile.ReadString(sSection, 'sMsg_Wait', '');
  sMsg_Open := IniFile.ReadString(sSection, 'sMsg_Open', '');
  sMsg_Save := IniFile.ReadString(sSection, 'sMsg_Save', '');
  sMsg_FileExist := IniFile.ReadString(sSection, 'sMsg_FileExist', '');
  sMsg_Replace := IniFile.ReadString(sSection, 'sMsg_Replace', '');

  sSection := '--- Texts for FormPassword ---';
  sPass_Title := IniFile.ReadString(sSection, 'sPass_Title', '');
  sPass_Text := IniFile.ReadString(sSection, 'sPass_Text', '');
  sPass_Confirm := IniFile.ReadString(sSection, 'sPass_Confirm', '');
  sPass_Rights1 := IniFile.ReadString(sSection, 'sPass_Rights1', '');
  sPass_Rights2 := IniFile.ReadString(sSection, 'sPass_Rights2', '');
  sPass_Incorrect := IniFile.ReadString(sSection, 'sPass_Incorrect', '');
  sPass_Different := IniFile.ReadString(sSection, 'sPass_Different', '');

  sSection := '--- Texts for FormAbout ---';
  sAbout_Title := IniFile.ReadString(sSection, 'sAbout_Title', '');
  sAbout_Version := IniFile.ReadString(sSection, 'sAbout_Version', '');
  sAbout_DevName := IniFile.ReadString(sSection, 'sAbout_DevName', '');
  sAbout_EmailObj := IniFile.ReadString(sSection, 'sAbout_EmailObj', '');

  sSection := '--- Texts for FormAlertMsg ---';
  sAlert_Title := IniFile.ReadString(sSection, 'sAlert_Title', '');

  sSection := '--- Texts for FormSelectDir ---';
  sSelDir_Title := IniFile.ReadString(sSection, 'sSelDir_Title', '');
  sSelDir_Select := IniFile.ReadString(sSection, 'sSelDir_Select', '');

  sSection := '--- Texts for FormSelectFolder ---';
  sSelFolder_Title := IniFile.ReadString(sSection, 'sSelFolder_Title', '');
  sSelFolder_NewFolder := IniFile.ReadString(sSection, 'sSelFolder_NewFolder', '');
  sSelFolder_HintDesktop := IniFile.ReadString(sSection, 'sSelFolder_HintDesktop', '');
  sSelFolder_HintComputer := IniFile.ReadString(sSection, 'sSelFolder_HintComputer', '');
  sSelFolder_HintPersonal := IniFile.ReadString(sSection, 'sSelFolder_HintPersonal', '');
  sSelFolder_HintNetwork := IniFile.ReadString(sSection, 'sSelFolder_HintNetwork', '');
  sSelFolder_HintRecents := IniFile.ReadString(sSection, 'sSelFolder_HintRecents', '');

  sSection := '--- Texts for FormSelectFolderCfg ---';
  sCfgFolder_Title := IniFile.ReadString(sSection, 'sCfgFolder_Title', '');
  sCfgFolder_GrpTree := IniFile.ReadString(sSection, 'sCfgFolder_GrpTree', '');
  sCfgFolder_DispImg := IniFile.ReadString(sSection, 'sCfgFolder_DispImg', '');
  sCfgFolder_DispLines := IniFile.ReadString(sSection, 'sCfgFolder_DispLines', '');
  sCfgFolder_DispRoot := IniFile.ReadString(sSection, 'sCfgFolder_DispRoot', '');
  sCfgFolder_DispExpBut := IniFile.ReadString(sSection, 'sCfgFolder_DispExpBut', '');
  sCfgFolder_GrpOptions := IniFile.ReadString(sSection, 'sCfgFolder_GrpOptions', '');
  sCfgFolder_HideFolder := IniFile.ReadString(sSection, 'sCfgFolder_HideFolder', '');
  sCfgFolder_CreateFolder := IniFile.ReadString(sSection, 'sCfgFolder_CreateFolder', '');
  sCfgFolder_ContextMenu := IniFile.ReadString(sSection, 'sCfgFolder_ContextMenu', '');
  sCfgFolder_Rename := IniFile.ReadString(sSection, 'sCfgFolder_Rename', '');
  sCfgFolder_GrpShortcuts := IniFile.ReadString(sSection, 'sCfgFolder_GrpShortcuts', '');
  sCfgFolder_Desktop := IniFile.ReadString(sSection, 'sCfgFolder_Desktop', '');
  sCfgFolder_Personal := IniFile.ReadString(sSection, 'sCfgFolder_Personnal', '');
  sCfgFolder_MyComputer := IniFile.ReadString(sSection, 'sCfgFolder_MyComputer', '');
  sCfgFolder_Network := IniFile.ReadString(sSection, 'sCfgFolder_Network', '');
  sCfgFolder_Recents := IniFile.ReadString(sSection, 'sCfgFolder_Recents', '');

   sSection := '--- Texts for Skins ---';
  sSkins_Skin := IniFile.ReadString(sSection, 'sSkins_Skin', '');
  sSkins_Choice := IniFile.ReadString(sSection, 'sSkins_Choice', '');
  sSkins_Standard := IniFile.ReadString(sSection, 'sSkins_Standard', '');
  sSkins_Folder := IniFile.ReadString(sSection, 'sSkins_Folder', '');
  //
  IniFile.Free;
end;

initialization

LangLib := TLanguageLib.Create;

finalization

LangLib.Free;

end.
