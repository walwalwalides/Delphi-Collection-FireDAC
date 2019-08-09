{ ============================================
  Software Name : 	SaveMyLogIn
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit uIniFile;

interface

uses
  Forms, IniFiles, SysUtils, StdCtrls, Classes, Dialogs, Controls,
  uDeclare,  Language;

const

  sOPTIONS_FILE       = 'SaveMyLogIn.ini';

  sSECTION_LOGIN      = 'LOGIN';
  sKEY_DATABASE       = 'Database';
  sKEY_DATABASEPATH   = 'DatabasePath';
  sKEY_USERFORNAME    = 'UserForName';
  sKEY_USERLASTNAME   = 'UserLastName';
  sKEY_MATRICUlE      = 'Matricule';


type

  // Classe pour la gestion du fichier *.ini
  TIniFileData = class
    sFileName   : string;
    sSection    : string;
    sRubrique   : array of string;
    sComment    : array of string;
    function  CreateIniFile: TIniFile;
    procedure WriteIniFile;
    procedure ReadIniFile;
  end;

var
  IniFileData : TIniFileData;

implementation

uses
  Main;


function TIniFileData.CreateIniFile: TIniFile;
var
  sPathName : string;
begin
  sPathName := AppliData.sCurrDir + '\' + sOPTIONS_FILE;
  Result := TIniFile.Create(sPathName);
end;

procedure TIniFileData.WriteIniFile;
var
  IniFile : TIniFile;
begin
  IniFile := CreateIniFile;
  with AppliData do begin
    // login
    IniFile.EraseSection(sSECTION_LOGIN);
    IniFile.WriteString (sSECTION_LOGIN, sKEY_DATABASE,      sDatabase);
    IniFile.WriteString (sSECTION_LOGIN, sKEY_DATABASEPATH,  sDatabasePath);
    IniFile.WriteString (sSECTION_LOGIN, sKEY_USERFORNAME,   sFirstName);
    IniFile.WriteString (sSECTION_LOGIN, sKEY_USERLASTNAME,  sLastName);
    IniFile.WriteString (sSECTION_LOGIN, sKEY_MATRICUlE,     sMatricule);
  end;
  IniFile.Free;
end;


procedure TIniFileData.ReadIniFile;
var
  sTemp   : string;
  IniFile : TIniFile;
begin
  IniFile := CreateIniFile;
  with AppliData do begin
    //  login
    sTemp           := IniFile.ReadString (sSECTION_LOGIN, sKEY_DATABASE, '');
    if sTemp <> '' then
      sDatabase := sTemp;
    sTemp           := IniFile.ReadString (sSECTION_LOGIN, sKEY_DATABASEPATH, '');
    if sTemp <> '' then
      sDatabasePath := sTemp;
    sFirstName      := IniFile.ReadString (sSECTION_LOGIN, sKEY_USERFORNAME, '');
    sLastName       := IniFile.ReadString (sSECTION_LOGIN, sKEY_USERLASTNAME, '');
    sMatricule      := IniFile.ReadString (sSECTION_LOGIN, sKEY_MATRICULE, '');
  end;
  IniFile.Free;
end;


initialization
  IniFileData := TIniFileData.Create;

finalization
  IniFileData.Free;


end.
