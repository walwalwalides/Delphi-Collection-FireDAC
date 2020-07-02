{ ============================================
  Software Name : 	SQLite_University
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uStudent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ShellApi,
  uDeclare, ComCtrls, acPNG, DMUniversity, uOptions, Vcl.Mask;

type

  TFrmStudent = class(TForm)
    PanelList: TPanel;
    ListViewUsers: TListView;
    //
    PanelFields: TPanel;
    LabelMatricule: TLabel;
    EditMatricule: TEdit;
    LabelUserForName: TLabel;
    EditUserForName: TEdit;
    LabelUserLastName: TLabel;
    EditUserLastName: TEdit;
    LabelAccessRate: TLabel;
    //
    LabelUserType: TLabel;
    ComboBoxClassName: TComboBox;
    LabelPassword: TLabel;
    LabelConfirmation: TLabel;
    EditClassNumber: TEdit;
    SpeedButtonNew: TSpeedButton;
    SpeedButtonUpd: TSpeedButton;
    SpeedButtonAdd: TSpeedButton;
    SpeedButtonDel: TSpeedButton;
    SpeedButtonQuit: TSpeedButton;
    ImageLogo: TImage;
    dtPickerBirthday: TDateTimePicker;
    EditSex: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(const Sender: TObject);
    procedure SetPosCompos;
    procedure FormResize(Sender: TObject);
    procedure WMSizing(var Msg: TMessage); message WM_SIZING;
    procedure CtrlButtonsState(const bAdd, bUpd, bDel: boolean);
    procedure ClearFields;
    function GetListIndexFromMatricule(sMatricule: string): integer;
    function TestBeforeAddUpd(bMsg: boolean): boolean;
    procedure RecToFields;
    procedure FieldsToRec;
    procedure UsersListRecAdd;
    procedure UsersListRecUpd;
    procedure UsersListRecDel;
    procedure OnUserCommand(Sender: TObject);
    procedure EditFieldExit(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBoxClassNameChange(Sender: TObject);
    procedure EditSexKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmStudent: TFrmStudent;

implementation

{$R *.dfm}

uses
  Main;

const
  nMARGE = 8;
  nFRMWIDTH = 505;
  nFRMHEIGHT = 323;

procedure TFrmStudent.FormCreate(Sender: TObject);
var
  nID: LongInt;
begin
  Self.Position := poMainFormCenter;
  OptionsData.ReadFrmUsersCfg;
  // Initilise les textes
  ListViewUsers.Column[nCOL_ClassName].Caption := 'ClassName';
  ListViewUsers.Column[nCOL_LASTNAME].Caption := 'LastName';
  ListViewUsers.Column[nCOL_FirstNAME].Caption := 'FirstName';
  //
  LabelMatricule.Caption := 'Matricule';
  LabelUserForName.Caption := 'FirstName';
  LabelUserLastName.Caption := 'LastName';
  LabelAccessRate.Caption := 'Sex';
  //
  LabelUserType.Caption := 'ClassName';
  // Get ClassName
  ComboBoxClassName.Clear;
  ComboBoxClassName.Style := csDropDownList;

  // ComboBoxClassName.Items.Add('');
  nID := DataModuleUniversity.GetAllClass(ComboBoxClassName);
  //
  LabelPassword.Caption := 'Birthday';
  // LabelConfirmation.Caption := Lang.sUserConfirmation;
  //
  SpeedButtonNew.Caption := ' ' + 'New' + ' ';
  SpeedButtonAdd.Caption := ' ' + 'Add' + '  ';
  SpeedButtonUpd.Caption := ' ' + 'Update' + '  ';
  SpeedButtonDel.Caption := 'Delete';
  SpeedButtonQuit.Caption := 'Quit';
  //
  // Initialisation
  if nID = -1 then
    ComboBoxClassName.ItemIndex := ComboBoxClassName.Items.IndexOf('')
    // else
    // ComboBoxClassName.ItemIndex := ComboBoxClassName.Items.IndexOf(Lang.sUserRightsUser)
end;

procedure TFrmStudent.FormShow(const Sender: TObject);
begin
  FrmStudent.Caption := 'Student';
  with AppliData do
  begin
    Top := nFrmUsersTop;
    Left := nFrmUsersLeft;
    Height := nFrmUsersHeight;
  end;
  SetPosCompos;
  //
  CtrlButtonsState(FALSE, FALSE, FALSE);
  DataModuleUniversity.GetAllStudent(ListViewUsers);

end;

procedure TFrmStudent.SetPosCompos;
begin
  PanelFields.Top := ClientHeight - PanelFields.Height - nMARGE;
  PanelList.Height := PanelFields.Top - (2 * nMARGE);
  //
  ListViewUsers.Height := PanelList.Height - (2 * nMARGE);
  ListViewUsers.Width := SpeedButtonQuit.Left - (2 * nMARGE);
  ListViewUsers.Columns[nCOL_ClassName].Width := 76;
  ListViewUsers.Columns[nCOL_FirstNAME].Width := (ListViewUsers.Width - ListViewUsers.Columns[nCOL_MATRICULE].Width - 80) Div 2;
  ListViewUsers.Columns[nCOL_LASTNAME].Width := ListViewUsers.Columns[nCOL_FirstNAME].Width ;
end;

procedure TFrmStudent.FormResize(Sender: TObject);
begin
  Width := nFRMWIDTH;
  if Height < nFRMHEIGHT then
    Height := nFRMHEIGHT;
  SetPosCompos;
  ListViewUsers.Refresh;
end;

procedure TFrmStudent.WMSizing(var Msg: TMessage);
var
  pForm: PRect;
begin
  pForm := PRect(Msg.LParam);
  pForm^.Right := pForm^.Left + nFRMWIDTH;
  if (pForm^.Bottom - pForm^.Top) < nFRMHEIGHT then
    pForm^.Bottom := pForm^.Top + nFRMHEIGHT;

  SetPosCompos;
end;

procedure TFrmStudent.CtrlButtonsState(const bAdd, bUpd, bDel: boolean);
begin
  SpeedButtonAdd.Enabled := bAdd;
  SpeedButtonUpd.Enabled := bUpd;
  SpeedButtonDel.Enabled := bDel;
end;

procedure TFrmStudent.ClearFields;
begin
  EditMatricule.Clear;
  EditUserForName.Clear;
  EditUserLastName.Clear;
  ComboBoxClassName.ItemIndex := nLOG_NONE;
  dtPickerBirthday.Refresh;
  EditClassNumber.Clear;
  EditSex.Clear;
end;

function TFrmStudent.GetListIndexFromMatricule(sMatricule: string): integer;
var
  nIndex: integer;
begin
  Result := -1;
  for nIndex := 0 to ListViewUsers.Items.Count - 1 do
  begin
    if ListViewUsers.Items[nIndex].SubItems[nCOL_MATRICULE - 1] = sMatricule then
    begin
      Result := nIndex;
      Break;
    end;
  end;
end;

function TFrmStudent.TestBeforeAddUpd(bMsg: boolean): boolean;
begin
  Result := True;
  with FrmMain do
  begin

    // if ((EditMatricule.Text <> '') and (EditUserForName.Text <> '') and
    // (EditUserLastName.Text <> '') and (EditWorkingRate.Text <> '') and
    // (ComboBoxClassName.ItemIndex > 0) // Index 0 = '', 1er type  : Admin = 1
    // and (EditPassword.Text <> '') and (EditConfirmation.Text <> '')) then
    // Result := TRUE
    // else if bMsg then
    // MessageDlg(Lang.sMsgFieldEmpty, mtError, [mbOk], 0);

    if Result then
    begin
      { if (EditPassword.Text <> EditConfirmation.Text) then
        begin
        if bMsg then
        MessageDlg(LangLib.sPass_Incorrect, mtError, [mbOk], 0);
        Result := FALSE
        end; }
    end;
  end;
end;

procedure TFrmStudent.RecToFields;
var
  sMatr: string;
begin
  with ListViewUsers, AppliData do
  begin
    if Selected <> nil then
    begin
      sMatr := Selected.SubItems[nCOL_MATRICULE - 1]; // -1 à cause de la colonne ID cachée
      ClearFields;
      if DataModuleUniversity.GetStudent(sMatr, '', '') <> -1 then
      begin
        EditMatricule.Text := RecStudent.sMatricule;
        EditUserForName.Text := RecStudent.sFirstName;
        EditUserLastName.Text := RecStudent.sLastName;
        ComboBoxClassName.ItemIndex := ComboBoxClassName.Items.IndexOf(RecStudent.sClassName);
        dtPickerBirthday.Date := RecStudent.sBirthday;
        EditSex.Text := RecStudent.sSex;

      end;
      if DataModuleUniversity.GetClassNumber(ComboBoxClassName.Text) <> -1 then
      begin
        EditClassNumber.Text := RecClass.iClassNumber.ToString;
      end
      else
      begin
        EditClassNumber.Clear;
      end;
    end;
  end;
end;

procedure TFrmStudent.FieldsToRec;
begin
  with AppliData do
  begin
    RecStudent.sMatricule := EditMatricule.Text;
    RecStudent.sFirstName := EditUserForName.Text;
    RecStudent.sLastName := EditUserLastName.Text;
    RecStudent.sClassName := ComboBoxClassName.Text;
    RecStudent.sBirthday := dtPickerBirthday.Date;
    RecStudent.sSex := EditSex.Text;
  end;
end;

procedure TFrmStudent.UsersListRecAdd;
var
  nIndex: LongInt;
begin
  with DataModuleUniversity do
  begin
    if TestBeforeAddUpd(True) then
    begin
      if DataModuleUniversity.GetStudent(EditMatricule.Text, '', '') <> -1 then
        MessageDlg('Error', mtError, [mbOk], 0)
      else
      begin
        FieldsToRec;
        DataModuleUniversity.AddStudentList;
        ListViewUsers.Clear;
        DataModuleUniversity.GetAllStudent(ListViewUsers);
        nIndex := GetListIndexFromMatricule(EditMatricule.Text);
        if nIndex > -1 then
        begin
          ListViewUsers.Items[nIndex].MakeVisible(FALSE);
          ListViewUsers.Items[nIndex].Selected := True;
        end;
        ClearFields;
      end;
    end;
  end;
end;

procedure TFrmStudent.UsersListRecUpd;
var
  nIndex: LongInt;
begin
  if ListViewUsers.Selected = nil then
    exit;
  with DataModuleUniversity do
  begin
    if TestBeforeAddUpd(True) then
    begin
      if DataModuleUniversity.GetStudent(EditMatricule.Text, '', '') = -1 then
        MessageDlg('Error', mtError, [mbOk], 0)
      else
      begin
        FieldsToRec;
        DataModuleUniversity.UpdStudentList;
        ListViewUsers.Clear;
        DataModuleUniversity.GetAllStudent(ListViewUsers);
        nIndex := GetListIndexFromMatricule(EditMatricule.Text);
        ListViewUsers.Items[nIndex].MakeVisible(FALSE);
        ListViewUsers.Items[nIndex].Selected := True;
        ClearFields;
      end;
    end;
  end;
end;

procedure TFrmStudent.UsersListRecDel;
var
  nID: integer;
  nIndex: LongInt;
begin
  if ListViewUsers.Selected = nil then
    exit;
  with DataModuleUniversity do
  begin
    nID := DataModuleUniversity.GetStudent(EditMatricule.Text, '', '');
    if nID <> -1 then
    begin
      nIndex := ListViewUsers.ItemIndex;
      DataModuleUniversity.DelStudentList(nID);
      ListViewUsers.Clear;
      DataModuleUniversity.GetAllStudent(ListViewUsers);
      nIndex := nIndex - 1;
      if (nIndex < 0) and (ListViewUsers.Items.Count > 0) then
        nIndex := 0;
      if nIndex > -1 then
      begin
        ListViewUsers.Items[nIndex].MakeVisible(FALSE);
        ListViewUsers.Items[nIndex].Selected := True;
      end;
      ClearFields;
    end;
  end;
end;

procedure TFrmStudent.OnUserCommand(Sender: TObject);
begin
  if (AnsiCompareText(TListView(Sender).Name, 'ListViewUsers') = 0) then
  begin
    RecToFields;
    CtrlButtonsState(FALSE, True, True);
  end
  else if (CompareText(TSpeedButton(Sender).Name, 'SpeedButtonNew') = 0) then
  begin
    ClearFields;
    CtrlButtonsState(FALSE, FALSE, FALSE);
  end
  else if (CompareText(TSpeedButton(Sender).Name, 'SpeedButtonAdd') = 0) then
  begin
    UsersListRecAdd;
    CtrlButtonsState(FALSE, FALSE, FALSE);
  end
  else if (CompareText(TSpeedButton(Sender).Name, 'SpeedButtonUpd') = 0) then
  begin
    UsersListRecUpd;
    CtrlButtonsState(FALSE, FALSE, FALSE);
  end
  else if (CompareText(TSpeedButton(Sender).Name, 'SpeedButtonDel') = 0) then
  begin
    UsersListRecDel;
    CtrlButtonsState(FALSE, FALSE, FALSE);
  end
end;

procedure TFrmStudent.EditFieldExit(Sender: TObject);
begin
  if (AnsiCompareText(TCheckBox(Sender).Name, 'EditMatricule') = 0) or (AnsiCompareText(TCheckBox(Sender).Name, 'EditUserForName') = 0) or
    (AnsiCompareText(TCheckBox(Sender).Name, 'EditUserLastName') = 0) then
  begin
    if SpeedButtonUpd.Enabled = True then
      CtrlButtonsState(True, True, FALSE)
    else
      CtrlButtonsState(True, FALSE, FALSE)
  end;
end;

procedure TFrmStudent.EditSexKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['m', 'M', 'f', 'F', #8]) then
    Key := #0;
end;

procedure TFrmStudent.CloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmStudent.ComboBoxClassNameChange(Sender: TObject);
begin
  with AppliData do
  begin
    if DataModuleUniversity.GetClassNumber(ComboBoxClassName.Text) <> -1 then
    begin
      EditClassNumber.Text := RecClass.iClassNumber.ToString;
    end
    else
    begin
      EditClassNumber.Clear;
    end;
  end;

end;

procedure TFrmStudent.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with AppliData do
  begin
    nFrmUsersTop := Top;
    nFrmUsersLeft := Left;
    nFrmUsersHeight := Height;
  end;
  OptionsData.WriteFrmUsersCfg;
end;

end.
