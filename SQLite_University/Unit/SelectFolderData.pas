{ ============================================
  Software Name : 	SQLite_University
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit SelectFolderData;

interface
 {u can set more option parametre if you wannt}
const
  sSELECT_FOLDER     = 'SELECT FOLDER';
  sKEY_WIDTH         = 'FormWidth';
  sKEY_HEIGHT        = 'FormHeight';
  sKEY_ROOT          = 'Root';
  sSELFOLDER_OPTIONS = 'SELECT FOLDER OPTIONS';
  sKEY_DISPIMG       = 'DispImg';
  sKEY_DISPLINES     = 'DispLines';
  sKEY_DISPROOT      = 'DispRoot';
  sKEY_DISPEXPBUT    = 'DispExpBut';
  sKEY_HIDEFOLDER    = 'HideFolder';
  sKEY_CREATEFOLDER  = 'CreateFolder';
  sKEY_CONTEXTMENU   = 'ContextMenu';
  sKEY_RENAME        = 'Rename';
  sKEY_DESKTOP       = 'Desktop';
  sKEY_PERSONAL      = 'Personal';
  sKEY_MYCOMPUTER    = 'MyComputer';
  sKEY_NETWORK       = 'Network';
  sKEY_RECENTS       = 'Recents';


type


  TSelFolderData = Record
    nFormWidth          : integer;
    nFormHeight         : integer;
    sRoot               : string;
    sTitle              : string;
    sButOkCaption       : string;
    sButNewCaption      : string;
    sButCancelCaption   : string;
    sSpecialFolder      : string;
    sPathName           : string;
  end;


  TSelFolderCfgData = Record

    bDispImg      : boolean;
    bDispLines    : boolean;
    bDispRoot     : boolean;
    bDispExpBut   : boolean;

    bHideFolder   : boolean;
    bCreateFolder : boolean;
    bContextMenu  : boolean;
    bRename       : boolean;

    bDesktop      : boolean;
    bPersonal     : boolean;
    bMyComputer   : boolean;
    bNetwork      : boolean;
    bRecents      : boolean;
  end;

var
  SelFolderData     : TSelFolderData;
  SelFolderCfgData  : TSelFolderCfgData;


implementation


end.
