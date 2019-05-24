{ ============================================
  Software Name : 	SaveMyLogIn
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, ShellApi,
  uDeclare, uColors, Language, Language_Lib,
  DMTasks,Splash;

type
  TFrmLogin = class(TForm)
    Panel: TPanel;
    ImageLogo: TImage;
    PanelBande: TPanel;
    PanelIdentification: TPanel;
    LabelDatabase: TLabel;
    EditDatabase: TEdit;
    //
    GroupBoxMatricule: TGroupBox;
    CheckBoxMatricule: TCheckBox;
    LabelMatricule: TLabel;
    EditMatricule: TEdit;
    //
    GroupBoxUser: TGroupBox;
    CheckBoxUser: TCheckBox;
    LabelUserFirstName: TLabel;
    EditUserFirstName: TEdit;
    LabelUserLastName: TLabel;
    EditUserLastName: TEdit;
    LabelPassword: TLabel;
    EditPassword: TEdit;
    ButtonOk: TButton;
    ButtonQuit: TButton;
    SpeedButtonDatabase: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(const Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkClick(Sender: TObject);
    procedure CloseClick(Sender: TObject);
    procedure OnUserCommand(Sender: TObject);
    procedure EditPasswordChange(Sender: TObject);
    procedure EditUserLastNameChange(Sender: TObject);
    procedure EditUserFirstNameChange(Sender: TObject);
    procedure EditMatriculeChange(Sender: TObject);
  private
    procedure AciveOKButton;

  public

  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses
  Main, uUserControl;


procedure TFrmLogin.FormCreate(Sender: TObject);
var
  bmpLogo : TBitmap;
begin
  with ImageLogo.Picture.Bitmap do begin
    TransparentMode := tmAuto;
    Transparent := TRUE;
  end;

  Color := ColorsList.clblack;
  Panel.Color := uColors.ColorsList.clWhite;
  PanelBande.Color := ColorsList.clBlack;
  PanelIdentification.Color := ColorsList.clBlack;
  LabelDatabase.Caption := Lang.sLabelDatabase;
  EditDatabase.Text := ChangeFileExt(ExtractFilename (AppliData.sDatabase), '');
  bmpLogo := TBitmap.Create;
  FrmMain.ImageList128.GetBitmap(0, bmpLogo);
  ImageLogo.Picture.Bitmap := bmpLogo;
  bmpLogo.Free;

  PanelIdentification.Caption := Lang.sUserAccess;

  LabelMatricule.Caption := Lang.sUserMatricule;
  LabelUserFirstName.Caption := Lang.sUserFirstName;
  LabelUserLastName.Caption := Lang.sUserLastName;
  LabelPassword.Caption := LangLib.sPass_Title;
  //
  ButtonOk.Caption := LangLib.sBut_Accept;
  ButtonQuit.Caption := LangLib.sBut_Quit;
  // Initilaise les options
  EditMatricule.Text := AppliData.sMatricule;
  EditUserFirstName.Text := AppliData.sFirstName;
  EditUserLastName.Text := AppliData.sLastName;
end;


procedure TFrmLogin.FormShow(const Sender: TObject);
var
  Style : LongInt;
begin
  ButtonOk.Enabled := FALSE;

  Style := GetWindowLong(Handle, GWL_STYLE);
  Style := Style and not WS_CAPTION;
  SetWindowLong(Handle, GWL_STYLE, Style);
  SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);

  ClientHeight := Panel.Height + (2 * Panel.Top) - 1;
  ClientWidth := Panel.Width + (2 * Panel.Left) - 1;

  if EditMatricule.Text <> '' then
    CheckBoxMatricule.Checked := TRUE
  else
    CheckBoxUser.Checked := TRUE;

  if (EditMatricule.Text <> '')
  or ((EditUserFirstName.Text <> '') and (EditUserLastName.Text <> '')) then
    EditPassword.SetFocus;

  if FrmAboutSplash <> nil then
    FrmAboutSplash.Close;
end;


procedure TFrmLogin.OnUserCommand(Sender: TObject);
begin
  if (AnsiCompareText (TSpeedButton(Sender).Name, 'SpeedButtonDatabase') = 0) then begin
    if UserCtrl.OpenDialogBox then
      EditDatabase.Text := AppliData.sDatabase
  end
  else if (AnsiCompareText (TCheckBox(Sender).Name, 'CheckBoxMatricule') = 0) then begin
    if CheckBoxMatricule.Checked then begin
      CheckBoxUser.Checked := FALSE;
      EditUserFirstName.Clear;
      EditUserLastName.Clear;
      EditMatricule.SetFocus;
    end;
  end
  else if (AnsiCompareText (TCheckBox(Sender).Name, 'CheckBoxUser') = 0) then begin
    if CheckBoxUser.Checked then begin
      CheckBoxMatricule.Checked := FALSE;
      EditMatricule.Clear;
      EditUserFirstName.SetFocus;
    end;
  end
  else if (AnsiCompareText (TCheckBox(Sender).Name, 'EditMatricule') = 0) then begin
    CheckBoxMatricule.Checked := TRUE;
    EditPassword.SetFocus;
  end
  else if (AnsiCompareText (TCheckBox(Sender).Name, 'EditUserFirstName') = 0) then begin
    CheckBoxUser.Checked := TRUE;
    EditUserLastName.SetFocus;
  end
  else if (AnsiCompareText (TCheckBox(Sender).Name, 'EditUserLastName') = 0) then begin
    CheckBoxUser.Checked := TRUE;
    EditPassword.SetFocus;
  end;

  if (EditMatricule.Text <> '')
  or ((EditUserFirstName.Text <> '') and (EditUserLastName.Text <> '')) then
    if EditPassword.Text <> '' then begin
      ButtonOk.Enabled := TRUE;
      ButtonOk.SetFocus;
    end
  else
    ButtonOk.Enabled := FALSE;
end;


procedure TFrmLogin.OkClick(Sender: TObject);
var
  nID : LongInt;
begin
  nID := DataModuleTasks.GetUser (EditMatricule.Text, EditUserFirstName.Text, EditUserLastName.Text, '');
  if nID > -1 then begin
    with Applidata, RecUser do begin
      if (EditMatricule.Text = sMatricule) and (EditPassword.Text = sPassword) then
        ModalResult := mrOk
      else begin
        ButtonOk.Enabled := FALSE;
        MessageDlg(LangLib.sPass_Incorrect, mtError, [mbOk], 0);
        EditPassword.SetFocus;
        EditPassword.SelectAll;
      end;
    end;
  end
  else begin
    ButtonOk.Enabled := FALSE;
    MessageDlg(Lang.sMsgUserNotExist, mtError, [mbOk], 0);
  end;
  //
  AppliData.nUserID := nID;
  AppliData.sMatricule := EditMatricule.Text;
  AppliData.sFirstName := EditUserFirstName.Text;
  AppliData.sLastName := EditUserLastName.Text;
end;


procedure TFrmLogin.CloseClick(Sender: TObject);
begin
  TButton(Sender).SetFocus;
  ModalResult := mrCancel;
end;


procedure TFrmLogin.EditMatriculeChange(Sender: TObject);
begin
    AciveOKButton;
end;

procedure TFrmLogin.EditPasswordChange(Sender: TObject);
begin
  AciveOKButton;
end;


procedure TFrmLogin.EditUserFirstNameChange(Sender: TObject);
begin
AciveOKButton;
end;

procedure TFrmLogin.EditUserLastNameChange(Sender: TObject);
begin
AciveOKButton;
end;

procedure TFrmLogin.AciveOKButton;
begin
  if (EditMatricule.Text <> '')
  or ((EditUserFirstName.Text <> '') and (EditUserLastName.Text <> '')) then
    if EditPassword.Text <> '' then begin
      ButtonOk.Enabled := TRUE;
    end
  else
    ButtonOk.Enabled := FALSE;
end;

procedure TFrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//
end;


end.
