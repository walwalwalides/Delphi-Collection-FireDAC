{ ============================================
  Software Name : 	MSSQL_DefineAccess
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit AddMarks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, DB;

type
  TfrmAddMarks = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnCancel: TBitBtn;
    btnAccept: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit_Marks: TDBEdit;
    DBEdit_SiteWeb: TDBEdit;
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
  frmAddMarks: TfrmAddMarks;

implementation
     Uses Module;
{$R *.dfm}

procedure TfrmAddMarks.btnAcceptClick(Sender: TObject);
begin
if DBEdit_Marks.Text='' then
  begin
    showmessage('The Mark field must not be empty');
  end
    else
  begin
    try
      DBEdit_Marks.Text:=Trim(DBEdit_Marks.Text);
      DMModule.tblMarks.Post;
      frmAddMarks.Close;
    except on E:Exception do
      Showmessage(E.Message);
    end;
  end;
end;

procedure TfrmAddMarks.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if (DMModule.tblMarks.State=dsinsert) or (DMModule.tblMarks.State=dsEdit) then
  begin
    if MessageDlg('Are you sure you want to cancel the operation and close this window?',mtwarning,[mbyes,mbno],0)=mryes then
      begin
        DMModule.tblMarks.Cancel;
        CanClose:=true;
      end
        else
      begin
        CanClose:=false;
      end;
  end;
end;

procedure TfrmAddMarks.btnCancelClick(Sender: TObject);
begin
frmAddMarks.Close;
end;

procedure TfrmAddMarks.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmAddMarks.FormDestroy(Sender: TObject);
begin
frmAddMarks:=nil;
end;

end.
