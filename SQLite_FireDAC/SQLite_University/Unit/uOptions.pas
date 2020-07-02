{ ============================================
  Software Name : 	SQLite_University
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uOptions;

interface

uses
  Forms, IniFiles, SysUtils, StdCtrls, Classes, Dialogs, Controls, Graphics,
  uDeclare,  SelectFolderData,
  DMUniversity;

const
  { Options of Programme }
  sSECTION_INTERFACE = 'INTERFACE';

  sSECTION_FRMUSERS = 'FRM USERS';
  sKEY_FORMTOP = 'FormTop';
  sKEY_FORMLEFT = 'FormLeft';
  sKEY_FORMHEIGHT = 'FormHeight';
  sSECTION_FRMTASKS   = 'FRM TASKS';

type

  { create OptionData class to gestion of the data }
  TOptionsData = class
    sFileName: string;
    sSection: string;
    sOptKey: string;

    procedure WriteFrmUsersCfg;
    procedure ReadFrmUsersCfg;

    procedure WriteSelFolderCfg;
    procedure ReadSelFolderCfg;

    procedure WriteSelFolderCfgOpt;
    procedure ReadSelFolderCfgOpt;

    procedure ReadFrmTasksCfg;
    procedure WriteFrmTasksCfg;
  end;

var
  OptionsData: TOptionsData;

implementation

uses
  Main;

procedure TOptionsData.WriteFrmUsersCfg;
begin
  with DataModuleUniversity, AppliData do
  begin
    DelOptions(sSECTION_FRMUSERS);
    AddOption(sSECTION_FRMUSERS, sKEY_FORMTOP, IntToStr(nFrmUsersTop));
    AddOption(sSECTION_FRMUSERS, sKEY_FORMLEFT, IntToStr(nFrmUsersLeft));
    AddOption(sSECTION_FRMUSERS, sKEY_FORMHEIGHT, IntToStr(nFrmUsersHeight));
  end;
end;

procedure TOptionsData.ReadFrmUsersCfg;
begin
  with DataModuleUniversity, AppliData do
  begin
    nFrmUsersTop := GetIntOption(sSECTION_FRMUSERS, sKEY_FORMTOP, 50);
    nFrmUsersLeft := GetIntOption(sSECTION_FRMUSERS, sKEY_FORMLEFT, 50);
    nFrmUsersHeight := GetIntOption(sSECTION_FRMUSERS, sKEY_FORMHEIGHT, 323);
  end;
end;

procedure TOptionsData.WriteSelFolderCfg;
begin
  with DataModuleUniversity, SelFolderData do
  begin
    DelOptions(sSELECT_FOLDER);
    AddOption(sSELECT_FOLDER, sKEY_WIDTH, IntToStr(nFormWidth));
    AddOption(sSELECT_FOLDER, sKEY_HEIGHT, IntToStr(nFormHeight));
    AddOption(sSELECT_FOLDER, sKEY_ROOT, sRoot);
  end;
end;

procedure TOptionsData.ReadSelFolderCfg;
begin
  with DataModuleUniversity, SelFolderData do
  begin
    nFormWidth := GetIntOption(sSELECT_FOLDER, sKEY_WIDTH, 306);
    nFormHeight := GetIntOption(sSELECT_FOLDER, sKEY_HEIGHT, 250);
    sRoot := GetStrOption(sSELECT_FOLDER, sKEY_ROOT, 'rfDesktop');
  end;
end;

procedure TOptionsData.WriteSelFolderCfgOpt;
begin
  with DataModuleUniversity, SelFolderCfgData do
  begin
    DelOptions(sSELFOLDER_OPTIONS);

    AddOption(sSELFOLDER_OPTIONS, sKEY_DISPIMG, BoolToStr(bDispImg));
    AddOption(sSELFOLDER_OPTIONS, sKEY_DISPLINES, BoolToStr(bDispLines));
    AddOption(sSELFOLDER_OPTIONS, sKEY_DISPROOT, BoolToStr(bDispRoot));
    AddOption(sSELFOLDER_OPTIONS, sKEY_DISPEXPBUT, BoolToStr(bDispExpBut));

    AddOption(sSELFOLDER_OPTIONS, sKEY_HIDEFOLDER, BoolToStr(bHideFolder));
    AddOption(sSELFOLDER_OPTIONS, sKEY_CREATEFOLDER, BoolToStr(bCreateFolder));
    AddOption(sSELFOLDER_OPTIONS, sKEY_CONTEXTMENU, BoolToStr(bContextMenu));
    AddOption(sSELFOLDER_OPTIONS, sKEY_RENAME, BoolToStr(bRename));

    AddOption(sSELFOLDER_OPTIONS, sKEY_DESKTOP, BoolToStr(bDesktop));
    AddOption(sSELFOLDER_OPTIONS, sKEY_PERSONAL, BoolToStr(bPersonal));
    AddOption(sSELFOLDER_OPTIONS, sKEY_MYCOMPUTER, BoolToStr(bMyComputer));
    AddOption(sSELFOLDER_OPTIONS, sKEY_NETWORK, BoolToStr(bNetwork));
    AddOption(sSELFOLDER_OPTIONS, sKEY_RECENTS, BoolToStr(bRecents));
  end;
end;

procedure TOptionsData.ReadSelFolderCfgOpt;
begin
  with DataModuleUniversity, SelFolderCfgData do
  begin

    bDispImg := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_DISPIMG, TRUE);
    bDispLines := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_DISPLINES, TRUE);
    bDispRoot := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_DISPROOT, FALSE);
    bDispExpBut := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_DISPEXPBUT, TRUE);

    bHideFolder := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_HIDEFOLDER, FALSE);
    bCreateFolder := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_CREATEFOLDER, FALSE);
    bContextMenu := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_CONTEXTMENU, FALSE);
    bRename := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_RENAME, FALSE);

    bDesktop := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_DESKTOP, TRUE);
    bPersonal := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_PERSONAL, TRUE);
    bMyComputer := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_MYCOMPUTER, TRUE);
    bNetwork := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_NETWORK, TRUE);
    bRecents := GetBoolOption(sSELFOLDER_OPTIONS, sKEY_RECENTS, TRUE);
  end;
end;

procedure TOptionsData.WriteFrmTasksCfg;
begin
  with DataModuleUniversity, AppliData do begin
    DelOptions (sSECTION_FRMTASKS);
    AddOption(sSECTION_FRMTASKS, sKEY_FORMTOP,     IntToStr(nFrmTasksTop));
    AddOption(sSECTION_FRMTASKS, sKEY_FORMLEFT,    IntToStr(nFrmTasksLeft));
    AddOption(sSECTION_FRMTASKS, sKEY_FORMHEIGHT,  IntToStr(nFrmTasksHeight));
  end;
end;


procedure TOptionsData.ReadFrmTasksCfg;
begin
  with DataModuleUniversity, AppliData do begin
    nFrmTasksTop    := GetIntOption(sSECTION_FRMTASKS, sKEY_FORMTOP, 50);
    nFrmTasksLeft   := GetIntOption(sSECTION_FRMTASKS, sKEY_FORMLEFT, 50);
    nFrmTasksHeight := GetIntOption(sSECTION_FRMTASKS, sKEY_FORMHEIGHT, 323);
  end;
end;

initialization

OptionsData := TOptionsData.Create;

finalization

OptionsData.Free;

end.
