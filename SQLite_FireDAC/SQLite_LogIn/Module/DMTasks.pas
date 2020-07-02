{ ============================================
  Software Name : 	SaveMyLogIn
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit DMTasks;

interface

uses
  SysUtils, Classes, ComCtrls, Variants,
  uDeclare, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.IOUtils, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, Data.DB;

type
  TDataModuleTasks = class(TDataModule)
    ConnectionMain: TFDConnection;
    qrTask: TFDQuery;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ManagerMain: TFDManager;


    procedure CloseDatabase;
    function GetFieldBool(sField: string): boolean;
    function GetFieldWord(sField: string): word;
    function GetFieldLong(sField: string): LongInt;
    function GetFieldDouble(sField: string): double;
    function GetFieldStr(sField: string): string;
    function GetFieldDate(sField: string): TDate;

    function GetUser(sMatricule, sForname, sLastName, sType: string): LongInt;
    function GetAllUsers(var ListView: TListView): integer;
    function AddUsersList: boolean;
    function UpdUsersList: boolean;
    function DelUsersList(const nID: LongInt): boolean;




    procedure DataModuleCreate(Sender: TObject);
    procedure BeforeConnect(Sender: TObject);
  private
    boolConnection: boolean;
    strAppPath: string;
    procedure DBINI;

    { Déclarations privées }
  public
    { Déclarations publiques }
        function AddOption(sSection, sKey, sOption: string): boolean;
    function DelOptions(sSection: string): boolean;
    function GetBoolOption(sSection, sKey: string; bDefault: boolean): boolean;
    function GetDateOption(sSection, sKey: string; dtDefault: TDate): TDate;
    function GetDoubleOption(sSection, sKey: string; nDefault: double): double;
    function GetIntOption(sSection, sKey: string; nDefault: integer): integer;
    function GetStrOption(sSection, sKey, sDefault: string): string;
  end;

var
  DataModuleTasks: TDataModuleTasks;

implementation

uses Utils, CreateTableDB;

{$R *.dfm}



procedure TDataModuleTasks.CloseDatabase;
begin
  ConnectionMain.Close;
  // ADOTableOptions.Close;
end;

procedure TDataModuleTasks.BeforeConnect(Sender: TObject);
begin
  //
  DBINI;
end;

function TDataModuleTasks.GetFieldBool(sField: string): boolean;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := FALSE;
end;

function TDataModuleTasks.GetFieldWord(sField: string): word;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := 0;
end;

function TDataModuleTasks.GetFieldLong(sField: string): LongInt;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := -1;
end;

function TDataModuleTasks.GetFieldDouble(sField: string): double;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := -1;
end;

function TDataModuleTasks.GetFieldStr(sField: string): string;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := '';
end;

function TDataModuleTasks.GetFieldDate(sField: string): TDate;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := 0;
end;

function TDataModuleTasks.GetUser(sMatricule, sForname, sLastName, sType: string): LongInt;
var
  sWhere: string;
  sSqlCmd: string;
begin
  // Préparation du Where
  if sType <> '' then
    sWhere := sFLD_TYPE + '="' + sType + '"'
  else if sMatricule <> '' then
    sWhere := sFLD_MATRICULE + '="' + sMatricule + '"'
  else
  begin
    if sForname <> '' then
      sWhere := sFLD_FORNAME + '="' + sForname + '"';
    if sLastName <> '' then
    begin
      if sWhere <> '' then
        sWhere := sWhere + ' AND ';
      sWhere := sWhere + sFLD_LASTNAME + '="' + sLastName + '"';
    end;
  end;
  // Sélection dans la table
  sSqlCmd := 'SELECT * FROM ' + sTBL_USERS + ' WHERE ' + sWhere;
  // try
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  qrTask.Open;
  // except
  // Result := -2;
  // Exit;
  // end;
  // Récupération des données
  with AppliData.RecUser do
  begin
    nID := -1;
    nID := GetFieldLong(sFLD_ID);
    sForname := GetFieldStr(sFLD_FORNAME);
    sLastName := GetFieldStr(sFLD_LASTNAME);
    sMatricule := GetFieldStr(sFLD_MATRICULE);
    sPassword := GetFieldStr(sFLD_PASSWORD);
    nType := GetFieldWord(sFLD_TYPE);
    nAccessRate := GetFieldDouble(sFLD_WORKINGRATE);
    Result := nID;
  end;
end;

function TDataModuleTasks.GetAllUsers(var ListView: TListView): integer;
var
  bAdd: boolean;
  sSqlCmd: string;
  ListItem: TListItem;
begin
  Result := 0;
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_USERS;
  sSqlCmd := sSqlCmd + ' ORDER BY ' + sFLD_LASTNAME + ',' + sFLD_FORNAME;
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  qrTask.Open;
  with qrTask, AppliData do
  begin
    DisableControls;
    while not Eof do
    begin
      bAdd := TRUE;
      try
        RecUser.nID := GetFieldLong(sFLD_ID);
        RecUser.sMatricule := GetFieldStr(sFLD_MATRICULE);
        RecUser.sForname := GetFieldStr(sFLD_FORNAME);
        RecUser.sLastName := GetFieldStr(sFLD_LASTNAME);
        Next;
      except
        bAdd := FALSE;
      end;
      if bAdd = TRUE then
      begin
        ListItem := ListView.Items.Add;
        ListItem.Caption := IntToStr(RecUser.nID);
        ListItem.SubItems.Add(RecUser.sMatricule);
        ListItem.SubItems.Add(RecUser.sLastName);
        ListItem.SubItems.Add(RecUser.sForname);
        Inc(Result);
      end;
    end;
    EnableControls;
  end;
end;

function TDataModuleTasks.AddUsersList: boolean;
var
  sSqlCmd: string;
begin
  sSqlCmd := 'INSERT INTO ' + sTBL_USERS + ' (';
  sSqlCmd := sSqlCmd + sFLD_FORNAME + ',' + sFLD_LASTNAME + ',' + sFLD_MATRICULE;
  sSqlCmd := sSqlCmd + ',' + sFLD_PASSWORD + ',' + sFLD_TYPE + ',' + sFLD_WORKINGRATE;
  sSqlCmd := sSqlCmd + ') VALUES (';
  with AppliData.RecUser do
  begin
    sSqlCmd := sSqlCmd + '"' + sForname + '"';
    sSqlCmd := sSqlCmd + ',"' + sLastName + '"';
    sSqlCmd := sSqlCmd + ',"' + sPassword + '"';
    sSqlCmd := sSqlCmd + ',"' + sMatricule + '"';
    sSqlCmd := sSqlCmd + ',"' + IntToStr(nType) + '"';
    sSqlCmd := sSqlCmd + ',' + FloatToStr(nAccessRate) + ')';
  end;
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;

function TDataModuleTasks.UpdUsersList: boolean;
var
  sSqlCmd: string;
begin
  with AppliData.RecUser do
  begin
    sSqlCmd := 'UPDATE ' + sTBL_USERS + ' SET ';
    sSqlCmd := sSqlCmd + sFLD_MATRICULE + '="' + sMatricule + '",';
    sSqlCmd := sSqlCmd + sFLD_FORNAME + '="' + sForname + '",';
    sSqlCmd := sSqlCmd + sFLD_LASTNAME + '="' + sLastName + '",';
    sSqlCmd := sSqlCmd + sFLD_TYPE + '=' + IntToStr(nType) + ',';
    sSqlCmd := sSqlCmd + sFLD_PASSWORD + '="' + sPassword + '",';
    sSqlCmd := sSqlCmd + sFLD_WORKINGRATE + '=' + FloatToStr(nAccessRate);
    sSqlCmd := sSqlCmd + ' WHERE ' + sFLD_ID + '=' + IntToStr(nID);
  end;
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;

function TDataModuleTasks.DelUsersList(const nID: LongInt): boolean;
var
  sSqlCmd: string;
begin
  sSqlCmd := 'DELETE FROM ' + sTBL_USERS + ' WHERE ' + sFLD_ID + ' = ' + IntToStr(nID);
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  try
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;





procedure TDataModuleTasks.DataModuleCreate(Sender: TObject);
begin
  ManagerMain.SilentMode := TRUE;
  boolConnection := FALSE;
  ConnectionMain.Connected := FALSE;
  ConnectionMain.LoginPrompt := FALSE;
  ConnectionMain.SharedCliHandle := nil;
  ConnectionMain.Params.Pooled := FALSE;
  ConnectionMain.DriverName := 'SQLite';
  ConnectionMain.Params.Add('SharedCache=False');
  ConnectionMain.Params.Add('LockingMode=Normal');
  ConnectionMain.ResourceOptions.SilentMode := FALSE;

end;

procedure TDataModuleTasks.DBINI;
var
  CrTabReg: TCreateTable;
begin
  if not directoryexists(AppliData.sDatabasePath) then
    CreateDir(AppliData.sDatabasePath);
  strAppPath := AppliData.sDatabasePath + AppliData.sDataBase;
  ConnectionMain.Params.Database := strAppPath;
//  if FileExists(strAppPath) = FALSE then
//  begin
//    try
//      CrTabReg.SetTableUsers(ConnectionMain);
//      CrTabReg.SetTableTasks(ConnectionMain);
//      CrTabReg.SetTableOptions(ConnectionMain);
//      CrTabReg.SetTableHrsPlanned(ConnectionMain);
//      CrTabReg.SetTableHours(ConnectionMain);
//    except
//      DeleteFile(strAppPath);
//    end;
//  end
//  else
//  begin
    if (boolConnection = FALSE) then
      ConnectionMain.Params.Database := TPath.Combine(TPath.GetLibraryPath, AppliData.sDataBase);
    ConnectionMain.ExecSQL
      ('CREATE TABLE IF NOT EXISTS Users (ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,ForName varchar(24),LastName varchar(24),Matricule varchar(12),PassW varchar(16),Type varchar(2),AccessRate smallInt)');
        ConnectionMain.ExecSQL
      ('CREATE TABLE IF NOT EXISTS Options (ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,User_ID integer,OptSection varchar(32),OptKey varchar(64),OptValue varchar(255))');

    boolConnection := TRUE;

//  end;
  ConnectionMain.Open;
  if ConnectionMain.Connected = FALSE then
    ConnectionMain.Connected := TRUE;
end;

function TDataModuleTasks.GetStrOption(sSection, sKey, sDefault: string): string;
var
  sOption: string;
  sSqlCmd: string;
begin
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_OPTIONS;
  sSqlCmd := sSqlCmd + ' WHERE ' + sFLD_USER_ID + '=' + IntToStr(AppliData.nUserID);
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTSECTION + '="' + sSection + '"';
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTKEY + '="' + sKey + '"';
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.Open;
    sOption := GetFieldStr(sFLD_OPTVALUE);
    if sOption <> '' then
      Result := sOption
    else
      Result := sDefault;
  except
    Result := '';
  end;
end;

function TDataModuleTasks.GetBoolOption(sSection, sKey: string; bDefault: boolean): boolean;
var
  sOption: string;
  sSqlCmd: string;
begin
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_OPTIONS;
  sSqlCmd := sSqlCmd + ' WHERE ' + sFLD_USER_ID + '=' + IntToStr(AppliData.nUserID);
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTSECTION + '="' + sSection + '"';
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTKEY + '="' + sKey + '"';
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.Open;
    sOption := GetFieldStr(sFLD_OPTVALUE);
    if sOption <> '' then
      Result := StrToBool(sOption)
    else
      Result := bDefault;
  except
    Result := FALSE;
  end;
end;

function TDataModuleTasks.GetIntOption(sSection, sKey: string; nDefault: integer): integer;
var
  sOption: string;
  sSqlCmd: string;
begin
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_OPTIONS;
  sSqlCmd := sSqlCmd + ' WHERE ' + sFLD_USER_ID + '=' + IntToStr(AppliData.nUserID);
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTSECTION + '="' + sSection + '"';
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTKEY + '="' + sKey + '"';
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.Open;
    sOption := GetFieldStr(sFLD_OPTVALUE);
    if sOption <> '' then
      Result := StrToInt(sOption)
    else
      Result := nDefault;
  except
    Result := 0;
  end;
end;

function TDataModuleTasks.GetDoubleOption(sSection, sKey: string; nDefault: double): double;
var
  sOption: string;
  sSqlCmd: string;
begin
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_OPTIONS;
  sSqlCmd := sSqlCmd + ' WHERE ' + sFLD_USER_ID + '=' + IntToStr(AppliData.nUserID);
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTSECTION + '="' + sSection + '"';
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTKEY + '="' + sKey + '"';
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.Open;
    sOption := GetFieldStr(sFLD_OPTVALUE);
    if sOption <> '' then
      Result := StrToFloat(sOption)
    else
      Result := nDefault;
  except
    Result := 0;
  end;
end;

function TDataModuleTasks.GetDateOption(sSection, sKey: string; dtDefault: TDate): TDate;
var
  sOption: string;
  sSqlCmd: string;
begin
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_OPTIONS;
  sSqlCmd := sSqlCmd + ' WHERE ' + sFLD_USER_ID + '=' + IntToStr(AppliData.nUserID);
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTSECTION + '="' + sSection + '"';
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTKEY + '="' + sKey + '"';
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.Open;
    sOption := GetFieldStr(sFLD_OPTVALUE);
    if sOption <> '' then
      Result := StrToDate(sOption)
    else
      Result := dtDefault;
  except
    Result := 0;
  end;
end;

function TDataModuleTasks.AddOption(sSection, sKey, sOption: string): boolean;
var
  sSqlCmd: string;
begin
  sSqlCmd := 'INSERT INTO ' + sTBL_OPTIONS + ' (';
  sSqlCmd := sSqlCmd + sFLD_USER_ID + ',' + sFLD_OPTSECTION + ',' + sFLD_OPTKEY + ',' + sFLD_OPTVALUE;
  sSqlCmd := sSqlCmd + ') VALUES (';
  sSqlCmd := sSqlCmd + '' + IntToStr(AppliData.nUserID) + ',"' + sSection + '","' + sKey + '","' + sOption + '")';
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;

function TDataModuleTasks.DelOptions(sSection: string): boolean;
var
  sSqlCmd: string;
begin
  sSqlCmd := 'DELETE FROM ' + sTBL_OPTIONS + ' WHERE ' + sFLD_USER_ID + '=' + IntToStr(AppliData.nUserID);
  sSqlCmd := sSqlCmd + ' AND ' + sFLD_OPTSECTION + '="' + sSection + '"';;
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  try
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;

  end;

end;







end.
