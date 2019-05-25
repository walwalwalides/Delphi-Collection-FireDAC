{ ============================================
  Software Name : 	MSSQL_DefineAccess
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit AddTyps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB;

type
  TfrmAddTyps = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnCancel: TBitBtn;
    btnAccept: TBitBtn;
    Label2: TLabel;
    DBEdit_Type: TDBEdit;
    procedure btnAcceptClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddTyps: TfrmAddTyps;

implementation
       Uses Module;
{$R *.dfm}

procedure TfrmAddTyps.btnAcceptClick(Sender: TObject);
begin
if DBEdit_Type.Text='' then
  begin
    showmessage('The Type Field must not be empty');
  end
    else
  begin
    try
      DBEdit_Type.Text:=Trim(DBEdit_Type.Text);
      DMModule.tblTyps.Post;
      frmAddTyps.Close;
    except on E:Exception do
      Showmessage(E.Message);
    end;
  end;
end;

procedure TfrmAddTyps.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if (DMModule.tblTyps.State=dsinsert) or (DMModule.tblTyps.State=dsEdit) then
  begin
    if MessageDlg('Are you sure you want to cancel the operation and close this window?',mtwarning,[mbyes,mbno],0)=mryes then
      begin
        DMModule.tblTyps.Cancel;
        CanClose:=true;
      end
        else
      begin
        CanClose:=false;
      end;
  end;
end;

procedure TfrmAddTyps.btnCancelClick(Sender: TObject);
begin
frmAddTyps.Close;
end;

procedure TfrmAddTyps.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmAddTyps.FormDestroy(Sender: TObject);
begin
frmAddTyps:=nil;
end;

end.
