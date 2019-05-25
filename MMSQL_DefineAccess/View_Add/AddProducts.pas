{ ============================================
  Software Name : 	MSSQL_DefineAccess
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit AddProducts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DBCtrls, Vcl.Mask,Data.DB;

type
  TfrmAddProducts = class(TForm)
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    btnCancel: TBitBtn;
    btnAccept: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit_ProductID: TDBEdit;
    DBLookupComboBox_Type: TDBLookupComboBox;
    DBLookupComboBox_Marks: TDBLookupComboBox;
    DBEdit_Model: TDBEdit;
    DBEdit_SerialNumber: TDBEdit;
    DBEdit_Price: TDBEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure btnAcceptClick(Sender: TObject);
    procedure DBEdit_PriceKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_ProductIDKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure DBLookupComboBox_TypeKeyPress(Sender: TObject; var Key: Char);
    procedure DBLookupComboBox_MarksKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_ModelKeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit_SerialNumberKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddProducts: TfrmAddProducts;

implementation

Uses Typs, Marks, Products, Module;
{$R *.dfm}

procedure TfrmAddProducts.btnAcceptClick(Sender: TObject);
begin
  if (DBEdit_ProductID.Text = '') or (length(DBEdit_ProductID.Text) <> 10) then
  begin
    showmessage('The Number Field must not be empty and must be exactly 10 characters long.');
  end
  else if DBLookupComboBox_Type.Text = '' then
  begin
    showmessage('The Type Field must not be empty');
  end
  else if DBLookupComboBox_Marks.Text = '' then
  begin
    showmessage('The Mark Field must not be empty');
  end
  else if DBEdit_Model.Text = '' then
  begin
    showmessage('The Model Field must not be empty');
  end
  else if DBEdit_SerialNumber.Text = '' then
  begin
    showmessage('The SerialNumber Field must not be empty');
  end
  else if DBEdit_Price.Text = '' then
  begin
    showmessage('The Price Field must not be empty');
  end
  else
  begin
    try
      DBEdit_Model.Text := Trim(DBEdit_Model.Text);
      DBEdit_SerialNumber.Text := Trim(DBEdit_SerialNumber.Text);

      if frmProducts.qrProducts.Locate('ProductID', DBEdit_ProductID.Text, [loPartialKey]) then
      begin
        showmessage('ProductID N° : ' + DBEdit_ProductID.Text + ' exist already.' + #13#10 + 'The value of the ProductID number must be unique.');
      end
      else
      begin
        DMModule.tblProducts.Post;
        frmProducts.qrProducts.Refresh;
        frmProducts.AutoSizeColDBGrid(frmProducts.DBGridProducts);
        frmAddProducts.Close;
      end;
    except
      on E: exception do
        showmessage(E.Message);
    end;
  end;

end;

procedure TfrmAddProducts.DBEdit_PriceKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #13, #8]) then
    Key := #0;

  if Key = #13 then
    btnAccept.Click;
end;

procedure TfrmAddProducts.DBEdit_ProductIDKeyPress(Sender: TObject; var Key: Char);
begin
  if not(Key in ['0' .. '9', #13, #8]) then
    Key := #0;

  if Key = #13 then
    DBLookupComboBox_Type.SetFocus;
end;

procedure TfrmAddProducts.btnCancelClick(Sender: TObject);
begin
  frmAddProducts.Close;
end;

procedure TfrmAddProducts.SpeedButton1Click(Sender: TObject);
begin

  frmTyps := TfrmTyps.Create(Nil);
  frmTyps.ShowModal;

end;

procedure TfrmAddProducts.SpeedButton2Click(Sender: TObject);
begin
  frmMarks := TfrmMarks.Create(Nil);
  frmMarks.ShowModal;

end;

procedure TfrmAddProducts.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if (DMModule.tblProducts.State = dsinsert) or (DMModule.tblProducts.State = dsEdit) then
  begin
    if MessageDlg('Are you sure you want to Cancel the Operation and Close this window ?', mtwarning, [mbyes, mbno], 0) = mryes then
    begin
      DMModule.tblProducts.Cancel;
      CanClose := true;
    end
    else
    begin
      CanClose := false;
    end;
  end;
end;

procedure TfrmAddProducts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmAddProducts.FormDestroy(Sender: TObject);
begin
  frmAddProducts := nil;
end;

procedure TfrmAddProducts.DBLookupComboBox_TypeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBLookupComboBox_Marks.SetFocus;
end;

procedure TfrmAddProducts.DBLookupComboBox_MarksKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBEdit_Model.SetFocus;
end;

procedure TfrmAddProducts.DBEdit_ModelKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBEdit_SerialNumber.SetFocus;
end;

procedure TfrmAddProducts.DBEdit_SerialNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    DBEdit_Price.SetFocus;
end;

end.
