{ ============================================
  Software Name : 	University
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit DMUniversity;

interface

uses
  SysUtils, Classes, ComCtrls, Variants,
  uDeclare, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.IOUtils, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, Data.DB, FireDAC.Comp.UI, Vcl.StdCtrls, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script;

type
  TDataModuleUniversity = class(TDataModule)
    ConnectionMain: TFDConnection;
    qrTask: TFDQuery;
    SQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    ManagerMain: TFDManager;
    WaitCursorSQLite: TFDGUIxWaitCursor;
    ScriptMain: TFDScript;

    procedure CloseDatabase;
    function GetFieldBool(sField: string): boolean;
    function GetFieldWord(sField: string): word;
    function GetFieldLong(sField: string): LongInt;
    function GetFieldDouble(sField: string): double;
    function GetFieldStr(sField: string): string;
    function GetFieldDate(sField: string): TDate;

    function GetStudent(sMatricule, sFirstname, sLastName: string): LongInt;
    function GetClassNumber(AClassName: string): LongInt;
    function GetAllStudent(var ListView: TListView): integer;
    function GetAllClass(var ComboBox: TComboBox): integer;

    function AddStudentList: boolean;
    function UpdStudentList: boolean;
    function DelStudentList(const nID: LongInt): boolean;

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
    function GetAllClassLst: integer;
    { ADD DELETE UPDATE CLASS }
    function AddClass(nUser_ID: integer; sTask: string): boolean;
    function DelAllClass: boolean;
    function DelClass(nTask_ID: integer): boolean;
    function UpdClass(ClassName_ID: LongInt; AClassName: string): boolean;

  end;

var
  DataModuleUniversity: TDataModuleUniversity;

implementation

uses CreateTableDB;

{$R *.dfm}

function TDataModuleUniversity.GetAllClassLst: integer;
var
  bAdd: boolean;
  nCount: integer;
  nID: LongInt;
  sTask: string;
  sSqlCmd: string;
begin
  nCount := 0;
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_CLASS;
  // sSqlCmd := sSqlCmd + ' WHERE ' + sFLD_ID + '=' + IntToStr(nUser_ID);
  sSqlCmd := sSqlCmd + ' ORDER BY ' + sFLD_CLASSNAME;
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  qrTask.Open;
  // Parcours du TDataSet pour lire les tâches
  with qrTask, AppliData do
  begin
    DisableControls;
    SetLength(asTasks, 0);
    SetLength(anTasksID, 0);
    while not Eof do
    begin
      // Récupération des valeurs des champs
      bAdd := TRUE;
      nID := 0;
      try
        nID := GetFieldLong(sFLD_ID);
        sTask := GetFieldStr(sFLD_CLASSNAME);
        Next; // Passe à l'enregistrement suivant
      except
        bAdd := FALSE;
      end;
      if bAdd = TRUE then
      begin
        Inc(nCount);
        SetLength(asTasks, nCount);
        SetLength(anTasksID, nCount);
        anTasksID[nCount - 1] := nID;
        asTasks[nCount - 1] := sTask;
      end;
    end;
    EnableControls;
  end;
  Result := nCount;
end;

procedure TDataModuleUniversity.CloseDatabase;
begin
  ConnectionMain.Close;
  // ADOTableOptions.Close;
end;

procedure TDataModuleUniversity.BeforeConnect(Sender: TObject);
begin
  //
  DBINI;
end;

function TDataModuleUniversity.GetFieldBool(sField: string): boolean;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := FALSE;
end;

function TDataModuleUniversity.GetFieldWord(sField: string): word;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := 0;
end;

function TDataModuleUniversity.GetFieldLong(sField: string): LongInt;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := -1;
end;

function TDataModuleUniversity.GetFieldDouble(sField: string): double;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := -1;
end;

function TDataModuleUniversity.GetFieldStr(sField: string): string;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := '';
end;

function TDataModuleUniversity.GetFieldDate(sField: string): TDate;
begin
  if qrTask.FieldValues[sField] <> Null then
    Result := qrTask.FieldValues[sField]
  else
    Result := 0;
end;

function TDataModuleUniversity.GetStudent(sMatricule, sFirstname, sLastName: string): LongInt;
var
  sWhere: string;
  sSqlCmd: string;
begin

  if sMatricule <> '' then
    sWhere := sFLD_MATRICULE + '="' + sMatricule + '"'
  else
  begin
    if sFirstname <> '' then
      sWhere := sFLD_FIRSTNAME + '="' + sFirstname + '"';
    if sLastName <> '' then
    begin
      if sWhere <> '' then
        sWhere := sWhere + ' AND ';
      sWhere := sWhere + sFLD_LASTNAME + '="' + sLastName + '"';
    end;
  end;
  // Sélection dans la table
  sSqlCmd := 'SELECT * FROM ' + sTBL_STUDENT + ' WHERE ' + sWhere;
  // try
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  qrTask.Open;
  // except
  // Result := -2;
  // Exit;
  // end;
  // Récupération des données
  with AppliData.RecStudent do
  begin
    nID := -1;
    nID := GetFieldLong(sFLD_ID);
    sFirstname := GetFieldStr(sFLD_FIRSTNAME);
    sLastName := GetFieldStr(sFLD_LASTNAME);
    sMatricule := GetFieldStr(sFLD_MATRICULE);
    sBirthday := GetFieldDate(sFLD_BIRTHDAY);
    sClassName := GetFieldStr(sFLD_CLASSNAME);
    sSex := GetFieldStr(sFLD_SEX);
    Result := nID;
  end;
end;

function TDataModuleUniversity.GetAllStudent(var ListView: TListView): integer;
var
  bAdd: boolean;
  sSqlCmd: string;
  ListItem: TListItem;
begin
  Result := 0;
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_STUDENT;
  sSqlCmd := sSqlCmd + ' ORDER BY ' + sFLD_LASTNAME + ',' + sFLD_FIRSTNAME;
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
        RecStudent.nID := GetFieldLong(sFLD_ID);
        RecStudent.sClassName := GetFieldStr(sFLD_CLASSNAME);
        RecStudent.sFirstname := GetFieldStr(sFLD_FIRSTNAME);
        RecStudent.sLastName := GetFieldStr(sFLD_LASTNAME);
        RecStudent.sMatricule := GetFieldStr(sFLD_MATRICULE);
        RecStudent.sSex := GetFieldStr(sFLD_SEX);

        Next;
      except
        bAdd := FALSE;
      end;
      if bAdd = TRUE then
      begin
        ListItem := ListView.Items.Add;
        ListItem.Caption := RecStudent.sClassName;
        ListItem.SubItems.Add(RecStudent.sFirstname);
        ListItem.SubItems.Add(RecStudent.sLastName);
        ListItem.SubItems.Add(RecStudent.sMatricule);
        Inc(Result);
      end;
    end;
    EnableControls;
  end;
end;

function TDataModuleUniversity.GetAllClass(var ComboBox: TComboBox): integer;
var
  bAdd: boolean;
  sSqlCmd: string;
begin
  Result := 0;
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_CLASS;
  sSqlCmd := sSqlCmd + ' ORDER BY ' + sFLD_CLASSNAME + ',' + sFLD_CLASSNUMBER;
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
        RecClass.nID := GetFieldLong(sFLD_ID);
        RecClass.sClassName := GetFieldStr(sFLD_CLASSNAME);
        RecClass.iClassNumber := GetFieldLong(sFLD_CLASSNUMBER);

        Next;
      except
        bAdd := FALSE;
      end;
      if bAdd = TRUE then
      begin
        ComboBox.Items.Add(RecClass.sClassName);
        Inc(Result);
      end;
    end;
    EnableControls;
  end;
end;

function TDataModuleUniversity.AddStudentList: boolean;
begin
  qrTask.SQL.Clear;
  qrTask.SQL.Text := 'INSERT INTO ' + sTBL_STUDENT + ' (' + sFLD_FIRSTNAME + ',' + sFLD_LASTNAME + ',' + sFLD_MATRICULE + ',' + sFLD_BIRTHDAY + ',' +
    sFLD_CLASSNAME + ',' + sFLD_SEX + ')' + ' VALUES(:Fir,:Lst,:Mat,:Bir,:Cls,:Sex)';
  with AppliData.RecStudent do
  begin
    qrTask.ParamByName('Fir').Value := sFirstname;
    qrTask.ParamByName('Lst').Value := sLastName;
    qrTask.ParamByName('Mat').Value := sMatricule;
    qrTask.ParamByName('Bir').AsDate := sBirthday;
    qrTask.ParamByName('Cls').Value := sClassName;
    qrTask.ParamByName('Sex').Value := UpperCase(sSex);
  end;

  try
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;

function TDataModuleUniversity.UpdStudentList: boolean;
begin
  qrTask.SQL.Clear;
  qrTask.SQL.Text := 'UPDATE ' + sTBL_STUDENT + ' Set ' + sFLD_FIRSTNAME + '=:Fir, ' + sFLD_LASTNAME + '=:Lst, ' + sFLD_MATRICULE + '=:Mat, ' + sFLD_BIRTHDAY +
    '=:Bir, ' + sFLD_CLASSNAME + '=:Cls, ' + sFLD_SEX + '=:Sex ' + ' WHERE ' + sFLD_ID + '=:ID ';

  with AppliData.RecStudent do
  begin
    qrTask.ParamByName('Fir').Value := sFirstname;
    qrTask.ParamByName('Lst').Value := sLastName;
    qrTask.ParamByName('Mat').Value := sMatricule;
    qrTask.ParamByName('Bir').AsDate := sBirthday;
    qrTask.ParamByName('Cls').Value := sClassName;
    qrTask.ParamByName('Sex').Value := UpperCase(sSex);
    qrTask.ParamByName('ID').Value := nID;
  end;

  try
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;

function TDataModuleUniversity.DelStudentList(const nID: LongInt): boolean;
var
  sSqlCmd: string;
begin
  sSqlCmd := 'DELETE FROM ' + sTBL_STUDENT + ' WHERE ' + sFLD_ID + ' = ' + IntToStr(nID);
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  try
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;

procedure TDataModuleUniversity.DataModuleCreate(Sender: TObject);
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

procedure TDataModuleUniversity.DBINI;
var
  CrTabReg: TCreateTable;
begin
  if not directoryexists(AppliData.sDatabasePath) then
    CreateDir(AppliData.sDatabasePath);
  strAppPath := AppliData.sDatabasePath + AppliData.sDataBase;
  ConnectionMain.Params.Database := strAppPath;

  // ConnectionMain.Params.Database := TPath.Combine(TPath.GetLibraryPath, AppliData.sDataBase);

  // ConnectionMain.ExecSQL

  ConnectionMain.ExecSQL
    ('CREATE TABLE IF NOT EXISTS Options (ID integer NOT NULL PRIMARY KEY AUTOINCREMENT,User_ID integer,OptSection varchar(32),OptKey varchar(64),OptValue varchar(255))');

  ConnectionMain.ExecSQL
    ('CREATE TABLE IF NOT EXISTS Class(ID integer NOT Null, ClassNumber integer NOT Null DEFAULT 0, ClassName varchar(50)NOT Null, CONSTRAINT PK_Class PRIMARY KEY(ClassName))');

  ConnectionMain.ExecSQL

    ('CREATE TABLE IF NOT EXISTS Student (ID integer NOT NULL,Matricule varchar(12),Sex char(1), FirstName varchar(50)NOT Null, BIRTHDAY date NOT Null, ClassName varchar(50), LastName varchar(50)NOT Null,'
    + 'CONSTRAINT PK_Student PRIMARY KEY(ID), CONSTRAINT RelationshipClassName FOREIGN KEY(ClassName)REFERENCES Class(ClassName))');
  { Update }
  CrTabReg.SetTriggerStudentUp(ConnectionMain);
  { Insert }
  CrTabReg.SetTriggerStudentIns(ConnectionMain);
  { Delete }
  CrTabReg.SetTriggerStudentDel(ConnectionMain);
  boolConnection := TRUE;

  // end;
  ConnectionMain.Open;
  if ConnectionMain.Connected = FALSE then
    ConnectionMain.Connected := TRUE;
end;

function TDataModuleUniversity.GetStrOption(sSection, sKey, sDefault: string): string;
var
  sOption: string;
  sSqlCmd: string;
begin
  sSqlCmd := 'SELECT * ' + ' FROM ' + sTBL_CLASS;
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

function TDataModuleUniversity.GetBoolOption(sSection, sKey: string; bDefault: boolean): boolean;
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

function TDataModuleUniversity.GetClassNumber(AClassName: string): LongInt;
var
  sWhere: string;
  sSqlCmd: string;
begin

  if (AClassName <> '') then
    sWhere := sFLD_CLASSNAME + '="' + AClassName + '"'
  else
    exit;
  // Sélection dans la table
  sSqlCmd := 'SELECT * FROM ' + sTBL_CLASS + ' WHERE ' + sWhere;
  // try
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  qrTask.Open;
  // except
  // Result := -2;
  // Exit;
  // end;
  // Récupération des données
  with AppliData.RecClass do
  begin
    nID := -1;
    nID := GetFieldLong(sFLD_ID);
    sClassName := GetFieldStr(sFLD_CLASSNAME);
    iClassNumber := GetFieldLong(sFLD_CLASSNUMBER);
    Result := iClassNumber;
  end;
end;

function TDataModuleUniversity.GetIntOption(sSection, sKey: string; nDefault: integer): integer;
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

function TDataModuleUniversity.GetDoubleOption(sSection, sKey: string; nDefault: double): double;
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

function TDataModuleUniversity.GetDateOption(sSection, sKey: string; dtDefault: TDate): TDate;
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

function TDataModuleUniversity.AddOption(sSection, sKey, sOption: string): boolean;
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

function TDataModuleUniversity.DelOptions(sSection: string): boolean;
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

function TDataModuleUniversity.AddClass(nUser_ID: LongInt; sTask: string): boolean;
var
  sSqlCmd: string;
begin
  sSqlCmd := 'INSERT INTO ' + sTBL_CLASS;
  sSqlCmd := sSqlCmd + ' (' + sFLD_ID + ',' + sFLD_CLASSNAME + ')';
  sSqlCmd := sSqlCmd + ' VALUES (' + IntToStr(nUser_ID) + ',"' + sTask + '")';
  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;

function TDataModuleUniversity.UpdClass(ClassName_ID: LongInt; AClassName: string): boolean;
var
  sSqlCmd: string;
begin
  sSqlCmd := 'UPDATE ' + sTBL_CLASS + ' SET ' + sFLD_CLASSNAME + '="' + AClassName + '"';
  sSqlCmd := sSqlCmd + ' WHERE ' + sFLD_ID + ' = ' + IntToStr(ClassName_ID);

//  qrTask.SQL.Clear;
//  qrTask.SQL.Text := 'UPDATE ' + sTBL_CLASS + ' Set ' + sFLD_CLASSNAME + '=:Cls ' + ' WHERE ' + sFLD_ID + '=:ID ';
//
//  qrTask.ParamByName('Cls').Value := AClassName;
//  qrTask.ParamByName('ID').Value := ClassName_ID;


  try
    qrTask.SQL.Clear;
    qrTask.SQL.Add(sSqlCmd);
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;
  end;
end;

function TDataModuleUniversity.DelClass(nTask_ID: LongInt): boolean;
var
  sSqlCmd: string;
begin
  sSqlCmd := 'DELETE FROM ' + sTBL_CLASS + ' WHERE ' + sFLD_ID + '=' + IntToStr(nTask_ID);
  qrTask.SQL.Clear;
  qrTask.SQL.Add(sSqlCmd);
  try
    qrTask.ExecSQL;
    Result := TRUE;
  except
    Result := FALSE;

  end;
end;

function TDataModuleUniversity.DelAllClass: boolean;
var
  sSqlCmd: string;
  i: integer;
begin
  sSqlCmd := 'DELETE FROM ' + sTBL_CLASS + ' WHERE ' + sFLD_CLASSNAME + '<>' + '';
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
