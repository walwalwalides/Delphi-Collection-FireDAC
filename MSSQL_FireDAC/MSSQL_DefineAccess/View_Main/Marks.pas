{ ============================================
  Software Name : 	MSSQL_DefineAccess
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit Marks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Data.DB;

type
  TfrmMarks = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGridMarks: TDBGrid;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnActualize: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnActualizeClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarks: TfrmMarks;

implementation
        Uses Module, AddMarks;
{$R *.dfm}


procedure TfrmMarks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TfrmMarks.FormDestroy(Sender: TObject);
begin
  frmMarks:=nil;
end;

procedure TfrmMarks.FormShow(Sender: TObject);
begin
//
end;

procedure TfrmMarks.FormCreate(Sender: TObject);
begin
 position:=poMainFormCenter;

 if AnsiLowerCase(DMModule.ConnectionMain.Params.UserName)='user01' then
  begin
       btnDelete.Free;
  end;

  if AnsiLowerCase(DMModule.ConnectionMain.Params.UserName)='costumer01' then
  begin
       with btnActualize do
          begin
            Left:=btnAdd.Left;
            Top:=btnAdd.Top;
          end;
       btnAdd.Free;
       btnEdit.Free;
       btnDelete.Free;
  end;
  end;

procedure TfrmMarks.btnActualizeClick(Sender: TObject);
begin
  DMModule.tblMarks.Refresh;
end;

procedure TfrmMarks.btnAddClick(Sender: TObject);
begin
   DMModule.tblMarks.Insert;

 frmAddMarks:=TfrmAddMarks.Create(Nil);
 frmAddMarks.ShowModal;
end;

procedure TfrmMarks.btnCloseClick(Sender: TObject);
begin
    frmMarks.Close;
end;

procedure TfrmMarks.btnDeleteClick(Sender: TObject);
var str:string;
begin
if DBGridMarks.DataSource.DataSet.RecordCount>0 then
  begin
    str:=DBGridMarks.DataSource.DataSet.FieldByName('MarkDescription').AsString;

    if MessageDlg('Do you really want to permanently delete the selected Mark:'+#13#10+
              'Mark : '+str,mtwarning,[mbyes,mbno],0)=mryes then
      begin
        try
          DMModule.tblMarks.Delete;
        except on E:exception do
          Showmessage(E.message);
        end;
      end;
   end;
end;

procedure TfrmMarks.btnEditClick(Sender: TObject);
begin
  if DBGridMarks.DataSource.DataSet.RecordCount>0 then
  begin
    DMModule.tblMarks.Edit;
    frmAddMarks:=TfrmAddMarks.Create(Nil);
    frmAddMarks.Position:=poMainFormCenter;
    frmAddMarks.ShowModal;

  end;
end;



end.
