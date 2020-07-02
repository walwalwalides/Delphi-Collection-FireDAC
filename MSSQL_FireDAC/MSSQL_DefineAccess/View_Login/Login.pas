{ ============================================
  Software Name : 	MSSQL_DefineAccess
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }

unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, IniFiles;

type
  TfrmLogin = class(TForm)
    lblUser: TLabel;
    lblPassword: TLabel;
    edtUser: TEdit;
    edtPassword: TEdit;
    ChBoxViewPass: TCheckBox;
    lblAppTitel: TLabel;
    edtServerName: TEdit;
    lblServerName: TLabel;
    GrBoxLogIn: TGroupBox;
    btnConnection: TBitBtn;
    btnClose: TBitBtn;
    procedure btnCloseClick(Sender: TObject);
    procedure btnConnectionClick(Sender: TObject);
    procedure ChBoxViewPassClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtUserKeyPress(Sender: TObject; var Key: Char);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

Uses Module;
{$R *.dfm}

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.btnConnectionClick(Sender: TObject);
var
  inifile: TInifile;
begin
  if (edtServerName.Text = '') then
  begin
    Showmessage('Please enter the Database Server Name');
  end
  else if (edtUser.Text = '') or (edtPassword.Text = '') then
  begin
    Showmessage('Please enter a username and password');
  end
  else
  begin
    DMModule.ConnectionMain.Close;
    DMModule.ConnectionMain.LoginPrompt := false;
    DMModule.ConnectionMain.ConnectionString :='Name=MSSQL_MyProduct;'+ 'DriverID=MSSQL;' + 'OSAuthent=No;' + 'Database=DB_Product;' + 'MetaDefSchema=dbo;' +
      'MetaDefCatalog=Northwind;' + 'ExtendedMetadata=True;'+ 'User_Name=' + edtUser.Text + ';'+'Password=' + edtPassword.Text + ';' + 'Server=' +
      edtServerName.Text;
//   DMModule.ConnectionMain.ConnectionDefName := 'MSSQL_MyProduct';

    Screen.Cursor := crHourGlass;
    btnConnection.Enabled := false;

    try
      DMModule.ConnectionMain.Open;
      Application.ProcessMessages;

      DMModule.tblTyps.Active := true;
      DMModule.tblMarks.Active := true;
      DMModule.tblProducts.Active := true;
      ModalResult := mrok;
    except
      on E: exception do
      begin
        Screen.Cursor := crDefault;
        btnConnection.Enabled := true;      {U have to change E.Message string cause (E.Meesage depend of your Pc Native language )}

        if E.Message = '[FireDAC][Phys][ODBC][Microsoft][SQL Server Native Client 11.0][SQL Server]Fehler bei der Anmeldung für den Benutzer "'+edtUser.Text+'".' then
        begin
          Showmessage('SQL server does not exist or access is denied');
        end
        else
        begin
          Showmessage(E.Message);
        end;
      end;
    end;

    if (DMModule.ConnectionMain.Connected = true) then
    begin
      inifile := TInifile.Create(Extractfilepath(Application.ExeName) + 'Config.ini');
      try
        inifile.WriteString('ServerName', 'Value', edtServerName.Text);
      finally
        inifile.Free;
      end;
    end;
  end;
end;

procedure TfrmLogin.ChBoxViewPassClick(Sender: TObject);
begin
  if (ChBoxViewPass.Checked) then
    edtPassword.PasswordChar := #0
  else
    edtPassword.PasswordChar := '*';
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin

  lblAppTitel.Caption := Application.Title;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
var
  inifile: TInifile;
begin
  if FileExists(Extractfilepath(Application.ExeName) + 'Config.ini') then // Voir fichier config.ini dans le même emplacement que le projet
  begin
    inifile := TInifile.Create(Extractfilepath(Application.ExeName) + 'Config.ini');
    try
      edtServerName.Text := inifile.ReadString('ServerName', 'Value', '');
    finally
      inifile.Free;
    end;
  end;
end;

procedure TfrmLogin.edtUserKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    edtPassword.SetFocus;
end;

procedure TfrmLogin.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
    btnConnection.Click;
end;

end.
