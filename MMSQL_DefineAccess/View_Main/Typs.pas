{ ============================================
  Software Name : 	MSSQL_DefineAccess
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit Typs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, Data.DB;

type
  TfrmTyps = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    btnAdd: TBitBtn;
    btnEdit: TBitBtn;
    btnActualize: TBitBtn;
    btnDelete: TBitBtn;
    btnClose: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
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
  frmTyps: TfrmTyps;

implementation
      Uses Module, ADDTyps;
{$R *.dfm}

procedure TfrmTyps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=caFree;
end;

procedure TfrmTyps.FormDestroy(Sender: TObject);
begin
frmTyps:=nil;
end;

procedure TfrmTyps.FormCreate(Sender: TObject);
begin
if AnsiLowerCase(DMModule.ConnectionMain.Params.UserName)='user01' then
  begin
       btnDelete.Free;
  end;



if AnsiLowerCase(DMModule.ConnectionMain.Params.UserName)='customer01' then
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

procedure TfrmTyps.btnActualizeClick(Sender: TObject);
begin
 DMModule.tblTyps.Refresh;
end;

procedure TfrmTyps.btnAddClick(Sender: TObject);
begin
  DMModule.tblTyps.Insert;

 frmAddTyps:=TfrmAddTyps.Create(Nil);
 frmAddTyps.ShowModal;
 // Propriété frmAddTyps Visible=false
end;

procedure TfrmTyps.btnCloseClick(Sender: TObject);
begin
  frmTyps.Close;
end;

procedure TfrmTyps.btnDeleteClick(Sender: TObject);
var str:string;
begin
  if DBGrid1.DataSource.DataSet.RecordCount>0 then
  begin
    str:=DBGrid1.DataSource.DataSet.FieldByName('TypDescription').AsString;

    if MessageDlg('Are you sure you want to permanently delete the selected Type:'+#13#10+
              'Type : '+str,mtwarning,[mbyes,mbno],0)=mryes then
      begin
        try
          DMModule.tblTyps.Delete;
        except on E:exception do
          Showmessage(E.message);
        end;
      end;
  end;
end;


procedure TfrmTyps.btnEditClick(Sender: TObject);
begin
 if DBGrid1.DataSource.DataSet.RecordCount>0 then
  begin
    DMModule.tblTyps.Edit;

    frmAddTyps:=TfrmAddTyps.Create(Nil);
    frmAddTyps.ShowModal;
    // Propriété frmAddTyps Visible=false
  end;
end;

end.
