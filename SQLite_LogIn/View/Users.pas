{ ============================================
  Software Name : 	SaveMyLogIn
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit Users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ShellApi,
  uDeclare, Colors, Language, Language_Lib, UOptions,
  DMTasks, Splash, ComCtrls, acPNG;

type

  TFrmUsers = class(TForm)
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
    EditWorkingRate: TEdit;
    LabelPC: TLabel;
    //
    LabelUserType: TLabel;
    ComboBoxUserType: TComboBox;
    LabelPassword: TLabel;
    EditPassword: TEdit;
    LabelConfirmation: TLabel;
    EditConfirmation: TEdit;
    SpeedButtonNew: TSpeedButton;
    SpeedButtonUpd: TSpeedButton;
    SpeedButtonAdd: TSpeedButton;
    SpeedButtonDel: TSpeedButton;
    SpeedButtonQuit: TSpeedButton;
    ImageLogo: TImage;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmUsers: TFrmUsers;

implementation

{$R *.dfm}

uses
  Main;

const
  nMARGE = 8;
  nFRMWIDTH = 505;
  nFRMHEIGHT = 323;

procedure TFrmUsers.FormCreate(Sender: TObject);
var
  nID: LongInt;
begin
  Self.Position := poMainFormCenter;
  OptionsData.ReadFrmUsersCfg;
  // Initilise les textes
  ListViewUsers.Column[nCOL_MATRICULE].Caption := Lang.sUserMatricule;
  ListViewUsers.Column[nCOL_LASTNAME].Caption := Lang.sUserLastName;
  ListViewUsers.Column[nCOL_FORNAME].Caption := Lang.sUserFirstName;
  //
  LabelMatricule.Caption := Lang.sUserMatricule;
  LabelUserForName.Caption := Lang.sUserFirstName;
  LabelUserLastName.Caption := Lang.sUserLastName;
  LabelAccessRate.Caption := Lang.sUserAccessRate;
  //
  LabelUserType.Caption := Lang.sUserUserType;
  ComboBoxUserType.Clear;
  ComboBoxUserType.Items.Add('');
  ComboBoxUserType.Items.Add(Lang.sUserRightsAdmin);
  ComboBoxUserType.Items.Add(Lang.sUserRightsUser);
  //
  LabelPassword.Caption := LangLib.sPass_Title;
  LabelConfirmation.Caption := Lang.sUserConfirmation;
  //
  SpeedButtonNew.Caption := ' ' + Lang.sButNew + ' ';
  SpeedButtonAdd.Caption := ' ' + Lang.sButAdd + '  ';
  SpeedButtonUpd.Caption := ' ' + Lang.sButUpd + '  ';
  SpeedButtonDel.Caption := Lang.sButDel;
  SpeedButtonQuit.Caption := LangLib.sBut_Quit;
  //
  // Initialisation
  nID := DataModuleTasks.GetUser('', '', '', IntToStr(nLOG_ADMIN));
  if nID = -1 then
    ComboBoxUserType.ItemIndex := ComboBoxUserType.Items.IndexOf(Lang.sUserRightsAdmin)
  else
    ComboBoxUserType.ItemIndex := ComboBoxUserType.Items.IndexOf(Lang.sUserRightsUser)
end;

procedure TFrmUsers.FormShow(const Sender: TObject);
begin
  FrmUsers.Caption := Lang.sUserDlgTitle;
  with AppliData do
  begin
    Top := nFrmUsersTop;
    Left := nFrmUsersLeft;
    Height := nFrmUsersHeight;
  end;
  SetPosCompos;
  //
  CtrlButtonsState(FALSE, FALSE, FALSE);
  DataModuleTasks.GetAllUsers(ListViewUsers);
  if FrmAboutSplash <> nil then
    FrmAboutSplash.Close;
end;

procedure TFrmUsers.SetPosCompos;
begin
  PanelFields.Top := ClientHeight - PanelFields.Height - nMARGE;
  PanelList.Height := PanelFields.Top - (2 * nMARGE);
  //
  ListViewUsers.Height := PanelList.Height - (2 * nMARGE);
  ListViewUsers.Width := SpeedButtonQuit.Left - (2 * nMARGE);
  ListViewUsers.Columns[nCOL_MATRICULE].Width := 76;
  ListViewUsers.Columns[nCOL_FORNAME].Width := (ListViewUsers.Width - ListViewUsers.Columns[nCOL_MATRICULE].Width - 20) Div 2;
  ListViewUsers.Columns[nCOL_LASTNAME].Width := ListViewUsers.Columns[nCOL_FORNAME].Width+15;
end;

procedure TFrmUsers.FormResize(Sender: TObject);
begin
  Width := nFRMWIDTH;
  if Height < nFRMHEIGHT then
    Height := nFRMHEIGHT;
  SetPosCompos;
  ListViewUsers.Refresh;
end;

procedure TFrmUsers.WMSizing(var Msg: TMessage);
var
  pForm: PRect;
begin
  pForm := PRect(Msg.LParam);
  pForm^.Right := pForm^.Left + nFRMWIDTH;
  if (pForm^.Bottom - pForm^.Top) < nFRMHEIGHT then
    pForm^.Bottom := pForm^.Top + nFRMHEIGHT;

  SetPosCompos;
end;

procedure TFrmUsers.CtrlButtonsState(const bAdd, bUpd, bDel: boolean);
begin
  SpeedButtonAdd.Enabled := bAdd;
  SpeedButtonUpd.Enabled := bUpd;
  SpeedButtonDel.Enabled := bDel;
end;

procedure TFrmUsers.ClearFields;
begin
  EditMatricule.Clear;
  EditUserForName.Clear;
  EditUserLastName.Clear;
  ComboBoxUserType.ItemIndex := nLOG_NONE;
  EditPassword.Clear;
  EditConfirmation.Clear;
  EditWorkingRate.Clear;
end;

function TFrmUsers.GetListIndexFromMatricule(sMatricule: string): integer;
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

function TFrmUsers.TestBeforeAddUpd(bMsg: boolean): boolean;
begin
  Result := True;
  with FrmMain do
  begin

//    if ((EditMatricule.Text <> '') and (EditUserForName.Text <> '') and
//    (EditUserLastName.Text <> '') and (EditWorkingRate.Text <> '') and
//    (ComboBoxUserType.ItemIndex > 0) // Index 0 = '', 1er type  : Admin = 1
//      and (EditPassword.Text <> '') and (EditConfirmation.Text <> '')) then
//      Result := TRUE
//    else if bMsg then
//      MessageDlg(Lang.sMsgFieldEmpty, mtError, [mbOk], 0);

    if Result then
    begin
      if (EditPassword.Text <> EditConfirmation.Text) then
      begin
        if bMsg then
          MessageDlg(LangLib.sPass_Incorrect, mtError, [mbOk], 0);
        Result := FALSE
      end;
    end;
  end;
end;

procedure TFrmUsers.RecToFields;
var
  sMatr: string;
begin
  with ListViewUsers, AppliData do
  begin
    if Selected <> nil then
    begin
      sMatr := Selected.SubItems[nCOL_MATRICULE - 1]; // -1 à cause de la colonne ID cachée
      ClearFields;
      if DataModuleTasks.GetUser(sMatr, '', '', '') <> -1 then
      begin
        EditMatricule.Text := RecUser.sMatricule;
        EditUserForName.Text := RecUser.sForName;
        EditUserLastName.Text := RecUser.sLastName;
        ComboBoxUserType.ItemIndex := RecUser.nType;
        EditPassword.Text := RecUser.sPassword;
        EditWorkingRate.Text := FloatToStr(RecUser.nAccessRate);
      end;
    end;
  end;
end;

procedure TFrmUsers.FieldsToRec;
begin
  with AppliData do
  begin
    RecUser.sMatricule := EditMatricule.Text;
    RecUser.sForName := EditUserForName.Text;
    RecUser.sLastName := EditUserLastName.Text;
    RecUser.nType := ComboBoxUserType.ItemIndex;
    RecUser.sPassword := EditPassword.Text;
    RecUser.nAccessRate := StrToFloat(EditWorkingRate.Text);
  end;
end;

procedure TFrmUsers.UsersListRecAdd;
var
  nIndex: LongInt;
begin
  with DataModuleTasks do
  begin
    if TestBeforeAddUpd(TRUE) then
    begin
      if DataModuleTasks.GetUser(EditMatricule.Text, '', '', '') <> -1 then
        MessageDlg(Lang.sMsgUserExist, mtError, [mbOk], 0)
      else
      begin
        FieldsToRec;
        DataModuleTasks.AddUsersList;
        ListViewUsers.Clear;
        DataModuleTasks.GetAllUsers(ListViewUsers);
        nIndex := GetListIndexFromMatricule(EditMatricule.Text);
        if nIndex > -1 then
        begin
          ListViewUsers.Items[nIndex].MakeVisible(FALSE);
          ListViewUsers.Items[nIndex].Selected := TRUE;
        end;
        ClearFields;
      end;
    end;
  end;
end;

procedure TFrmUsers.UsersListRecUpd;
var
  nIndex: LongInt;
begin
  if ListViewUsers.Selected = nil then
    exit;
  with DataModuleTasks do
  begin
    if TestBeforeAddUpd(TRUE) then
    begin
      if DataModuleTasks.GetUser(EditMatricule.Text, '', '', '') = -1 then
        MessageDlg(Lang.sMsgMatriculeExist, mtError, [mbOk], 0)
      else
      begin
        FieldsToRec;
        DataModuleTasks.UpdUsersList;
        ListViewUsers.Clear;
        DataModuleTasks.GetAllUsers(ListViewUsers);
        nIndex := GetListIndexFromMatricule(EditMatricule.Text);
        ListViewUsers.Items[nIndex].MakeVisible(FALSE);
        ListViewUsers.Items[nIndex].Selected := TRUE;
        ClearFields;
      end;
    end;
  end;
end;

procedure TFrmUsers.UsersListRecDel;
var
  nID: integer;
  nIndex: LongInt;
begin
  if ListViewUsers.Selected = nil then
    exit;
  with DataModuleTasks do
  begin
    nID := DataModuleTasks.GetUser(EditMatricule.Text, '', '', '');
    if nID <> -1 then
    begin
      nIndex := ListViewUsers.ItemIndex;
      DataModuleTasks.DelUsersList(nID);
      ListViewUsers.Clear;
      DataModuleTasks.GetAllUsers(ListViewUsers);
      nIndex := nIndex - 1;
      if (nIndex < 0) and (ListViewUsers.Items.Count > 0) then
        nIndex := 0;
      if nIndex > -1 then
      begin
        ListViewUsers.Items[nIndex].MakeVisible(FALSE);
        ListViewUsers.Items[nIndex].Selected := TRUE;
      end;
      ClearFields;
    end;
  end;
end;

procedure TFrmUsers.OnUserCommand(Sender: TObject);
begin
  if (AnsiCompareText(TListView(Sender).Name, 'ListViewUsers') = 0) then
  begin
    RecToFields;
    CtrlButtonsState(FALSE, TRUE, TRUE);
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

procedure TFrmUsers.EditFieldExit(Sender: TObject);
begin
  if (AnsiCompareText(TCheckBox(Sender).Name, 'EditMatricule') = 0) or (AnsiCompareText(TCheckBox(Sender).Name, 'EditUserForName') = 0) or
    (AnsiCompareText(TCheckBox(Sender).Name, 'EditUserLastName') = 0) then
  begin
    if SpeedButtonUpd.Enabled = TRUE then
      CtrlButtonsState(TRUE, TRUE, FALSE)
    else
      CtrlButtonsState(TRUE, FALSE, FALSE)
  end;
end;

procedure TFrmUsers.CloseClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmUsers.FormClose(Sender: TObject; var Action: TCloseAction);
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
