unit uViewConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls,System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.ComCtrls,
  JvFormPlacement, JvComponentBase, JvAppStorage, JvAppIniStorage,
  dxGDIPlusClasses;

type
  TfrmViewConfig = class(TForm)
    lstBaudRate: TListBox;
    img2: TImage;
    IniUpdate: TJvAppIniFileStorage;
    JvFormStorage1: TJvFormStorage;
    cBoxExLvl1: TComboBoxEx;
    cBoxExLvl2: TComboBoxEx;
    cBoxExLvl3: TComboBoxEx;
    img1: TImage;
    ColourCodes: TImageList;
    img3: TImage;
    ckBoxPostgreSQL: TCheckBox;
    ckBoxSQLite: TCheckBox;
    ckBoxMSSQL: TCheckBox;
    ckBoxMySQL: TCheckBox;
    ckBoxMangoDB: TCheckBox;
    btnResetlvl1: TButton;
    btnResetlvl2: TButton;
    btnResetlvl3: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    btnDefault: TButton;
    grpBoxlvlColor: TGroupBox;
    lblTitellevel1: TLabel;
    lblTitellevel3: TLabel;
    lblTitellevel2: TLabel;
    grpBoxBottom: TGroupBox;
    pgCtrlConfiguration: TPageControl;
    tabInformation: TTabSheet;
    TabLevel: TTabSheet;
    tabDataBase: TTabSheet;
    edtEmail: TEdit;
    edtFirstName: TEdit;
    edtLastname: TEdit;
    edtTelefonnr: TEdit;
    edtID: TEdit;
    lblFirstName: TLabel;
    lblID: TLabel;
    lblLastName: TLabel;
    lblTelefonnr: TLabel;
    lblEmail: TLabel;
    grpBoxUserInfo: TGroupBox;
    grpBoxDBConfig: TGroupBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure cBoxExLvl1Select(Sender: TObject);
    procedure cBoxExLvl2Select(Sender: TObject);
    procedure cBoxExLvl3Select(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnResetlvl1Click(Sender: TObject);
    procedure btnResetlvl2Click(Sender: TObject);
    procedure btnResetlvl3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ckBoxPostgreSQLClick(Sender: TObject);
    procedure ckBoxMSSQLClick(Sender: TObject);
    procedure ckBoxMySQLClick(Sender: TObject);
    procedure ckBoxMangoDBClick(Sender: TObject);
    procedure ckBoxSQLiteClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
  private
    function CheckDifferenceColor: Boolean;
    procedure ResetLastColorGenre(ID: integer);
    procedure LoadConfigFromDB;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmViewConfig: TfrmViewConfig;
  boolerrorDBConnec: Boolean = false;

implementation

uses
  uToolLib, mmsystem, uLevelClr, uiRepositories,
  uUserInfo, uConfiguration;

{$R *.dfm}

function TfrmViewConfig.CheckDifferenceColor: Boolean;
Begin
  result := false;

  result := (cBoxExLvl2.ItemIndex <> cBoxExLvl3.ItemIndex) and
    (cBoxExLvl1.ItemIndex <> cBoxExLvl3.ItemIndex) and
    (cBoxExLvl1.ItemIndex <> cBoxExLvl2.ItemIndex)

End;

procedure TfrmViewConfig.ckBoxMangoDBClick(Sender: TObject);
begin
  if (ckBoxMangoDB.Checked = true) then
  Begin
    ckBoxSQLite.Checked := false;
    ckBoxPostgreSQL.Checked := false;
    ckBoxMSSQL.Checked := false;
    ckBoxMySQL.Checked := false;

  End;
end;

procedure TfrmViewConfig.ckBoxMSSQLClick(Sender: TObject);
begin
  if (ckBoxMSSQL.Checked = true) then
  Begin
    ckBoxSQLite.Checked := false;
    ckBoxMangoDB.Checked := false;
    ckBoxPostgreSQL.Checked := false;
    ckBoxMySQL.Checked := false;

  End;
end;

procedure TfrmViewConfig.ckBoxMySQLClick(Sender: TObject);
begin
  if (ckBoxMySQL.Checked = true) then
  Begin
    ckBoxSQLite.Checked := false;
    ckBoxMangoDB.Checked := false;
    ckBoxMSSQL.Checked := false;
    ckBoxPostgreSQL.Checked := false;

  End;
end;

procedure TfrmViewConfig.ckBoxPostgreSQLClick(Sender: TObject);
begin
  if (ckBoxPostgreSQL.Checked = true) then
  Begin
    ckBoxSQLite.Checked := false;
    ckBoxMangoDB.Checked := false;
    ckBoxMSSQL.Checked := false;
    ckBoxMySQL.Checked := false;

  End;

end;

procedure TfrmViewConfig.ckBoxSQLiteClick(Sender: TObject);
begin
  if (ckBoxSQLite.Checked = true) then
  Begin
    ckBoxPostgreSQL.Checked := false;
    ckBoxMangoDB.Checked := false;
    ckBoxMSSQL.Checked := false;
    ckBoxMySQL.Checked := false;

  End;
end;

procedure TfrmViewConfig.ResetLastColorGenre(ID: integer);
var
  pPackGClr: TLevelColor;
begin
  pPackGClr := Repositories.Repository.ReturnLevel(ID);
  case ID of

    1:
      cBoxExLvl1.ItemIndex := pPackGClr.LevelColor;
    2:
      cBoxExLvl2.ItemIndex := pPackGClr.LevelColor;
    3:
      cBoxExLvl3.ItemIndex := pPackGClr.LevelColor;

  end;

end;

procedure TfrmViewConfig.LoadConfigFromDB;
var
  pLVLClr: TLevelColor;
  pUserInfo: TUserInfo;
begin
  try
    pLVLClr := Repositories.Repository.ReturnLevel(1);
    cBoxExLvl1.ItemIndex := pLVLClr.LevelColor;
    pLVLClr := Repositories.Repository.ReturnLevel(2);
    cBoxExLvl2.ItemIndex := pLVLClr.LevelColor;
    pLVLClr := Repositories.Repository.ReturnLevel(3);
    cBoxExLvl3.ItemIndex := pLVLClr.LevelColor;
    pUserInfo := Repositories.Repository.ReturnUserInfo(1);
    edtLastname.Text := pUserInfo.UserLastName;
    edtFirstName.Text := pUserInfo.UserFirstName;
    edtEmail.Text := pUserInfo.UserEmail;
    edtTelefonnr.Text := pUserInfo.UserTelefonnr;
  except
    on E: Exception do
    begin
      boolerrorDBConnec := true;
      MessageDlg('This type of database : "' + E.Message +
        '" is not available !', mtWarning, [mbOK], 0);

    end;
  end;
end;

procedure TfrmViewConfig.btnDefaultClick(Sender: TObject);
begin
  LoadConfigFromDB;
end;

procedure TfrmViewConfig.btnResetlvl1Click(Sender: TObject);
begin
  ResetLastColorGenre(1);
end;

procedure TfrmViewConfig.btnResetlvl3Click(Sender: TObject);
begin
  ResetLastColorGenre(3);
end;

procedure TfrmViewConfig.btnResetlvl2Click(Sender: TObject);
begin
  ResetLastColorGenre(2);
end;

procedure TfrmViewConfig.btnSaveClick(Sender: TObject);
var
  boolSave: Boolean;
  LTaskDialog: TTaskDialog;
  iChooseDB: integer;
begin
  // Save Choosed DataBase
  if (ckBoxPostgreSQL.Checked = true) then
    iChooseDB := 0;
  if (ckBoxMSSQL.Checked = true) then
    iChooseDB := 1;
  if (ckBoxMySQL.Checked = true) then
    iChooseDB := 2;
  if (ckBoxMangoDB.Checked = true) then
    iChooseDB := 3;
  if (ckBoxSQLite.Checked = true) then
    iChooseDB := 4;

  configuration.setTypeDataBase(iChooseDB);

  boolSave := CheckDifferenceColor;

  if boolSave = false then
  Begin
    btnSave.Enabled := false;
    btnSave.Cursor := crHourGlass;
    PlayResSound('SOUND2', SND_SYNC);
    btnSave.Cursor := crHandPoint;
    LTaskDialog := TTaskDialog.Create(Self);
    try
      LTaskDialog.Caption := 'Color Duplicate !';
      LTaskDialog.Text :=
        'The chosen color must be different from the other levels.';
      LTaskDialog.CommonButtons := [tcbOk];
      LTaskDialog.MainIcon := tdiWarning;
      if LTaskDialog.Execute then
        if LTaskDialog.ModalResult = mrOk then
        begin
          // MessageDlg('the chosen color must be different with the other genre',
          // mtWarning, [mbOK], 0);
        end;
    finally
      LTaskDialog.Free;
    End;
    btnSave.Enabled := true;
    exit;
  End;

  // Save Genre Color
  Repositories.Repository.SetLevelColor(1, cBoxExLvl1.ItemIndex);
  Repositories.Repository.SetLevelColor(2, cBoxExLvl2.ItemIndex);
  Repositories.Repository.SetLevelColor(3, cBoxExLvl3.ItemIndex);
  // save User Info
  Repositories.Repository.SetUserInfo(1, edtLastname.Text, edtFirstName.Text,
    edtEmail.Text, edtTelefonnr.Text);

  DialogBoxAutoClose('Save Change', 'Please Wait... ', 3,
    Self.Top + (Self.Height div 2), Self.left + (Self.Width div 2));
  PlayResSound('SOUND1', SND_ASYNC);
  DialogBoxAutoClose('Save Change', 'Save Successful. ', 5,
    Self.Top + (Self.Height div 2), Self.left + (Self.Width div 2));
  close;
end;

procedure TfrmViewConfig.cBoxExLvl1Select(Sender: TObject);
begin
  btnResetlvl1.SetFocus;
end;

procedure TfrmViewConfig.cBoxExLvl3Select(Sender: TObject);
begin
  btnResetlvl3.SetFocus;
end;

procedure TfrmViewConfig.cBoxExLvl2Select(Sender: TObject);
begin
  btnResetlvl2.SetFocus;
end;

procedure TfrmViewConfig.FormActivate(Sender: TObject);
begin
  JvFormStorage1.Active := false;
end;

procedure TfrmViewConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  JvFormStorage1.Active := true;   //save all last change parameters using Storge component from JEDI
end;

procedure TfrmViewConfig.FormCreate(Sender: TObject);
begin
  Self.Caption := 'Configuration';
  Self.BorderIcons := [biSystemMenu, biMinimize];
  Self.BorderStyle := bsToolWindow;
  Self.Color := clwhite;
  Self.position := poMainFormCenter;
  // assign combobox to imagelist
  cBoxExLvl1.Images := ColourCodes;
  cBoxExLvl2.Images := ColourCodes;
  cBoxExLvl3.Images := ColourCodes;

  edtLastname.Alignment:=taCenter;
  edtFirstName.Alignment:=taCenter;
  edtEmail.Alignment:=taCenter;
  edtTelefonnr.Alignment:=taCenter;


  img1.left := 464;
  img2.left := 464;
  img3.left := 464;

  img1.Top := 10;
  img2.Top := 10;
  img3.Top := 10;
end;

procedure TfrmViewConfig.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //
end;

procedure TfrmViewConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and (btnSave.Enabled = true) then
  begin
    btnSave.Click;
  end;
end;

procedure TfrmViewConfig.FormShow(Sender: TObject);
begin
  try
    LoadConfigFromDB;
  finally
    //
  end;

end;

end.
