{ ============================================
  Software Name : 	MongoDB_Connection
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit AddUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmAddUser = class(TForm)
    edtPassword: TEdit;
    edtUsername: TEdit;
    lblUsername: TLabel;
    lblPassword: TLabel;
    GrBoxAddUser: TGroupBox;
    BitBtnInsert: TBitBtn;
    BitBtnCancel: TBitBtn;
    GrBoxBtn: TGroupBox;
    procedure BitBtnInsertClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  frmAddUser: TfrmAddUser;

implementation

uses
  Module;

{$R *.dfm}

procedure TfrmAddUser.BitBtnInsertClick(Sender: TObject);
begin

  if ((edtUsername.Text <> '') and (edtPassword.Text <> '')) then
  begin
    DMModule.AddUser(edtUsername.Text, edtPassword.Text);

  end
  else
    ShowMessage('u have to enter username and password');

end;

end.
