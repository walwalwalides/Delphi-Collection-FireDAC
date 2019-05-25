{ ============================================
  Software Name : 	MSSQL_DefineAccess
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit Products;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Mask, DBCtrls, ExtCtrls, Buttons,
  Menus, DB, ADODB, ShellAPI, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmProducts = class(TForm)
    GroupBox2: TGroupBox;
    DBGridProducts: TDBGrid;
    MainMenu1: TMainMenu;
    Fichier1: TMenuItem;
    GroupBox1: TGroupBox;
    btnActualize: TBitBtn;
    btnClose: TBitBtn;
    btnDelete: TBitBtn;
    btnEdit: TBitBtn;
    btnAdd: TBitBtn;
    DS_Products: TDataSource;
    GroupBox3: TGroupBox;
    Edit_rechercher: TEdit;
    btnSearch: TBitBtn;
    RadBtnProductID: TRadioButton;
    RadbtnSerialNumber: TRadioButton;
    GroupBox4: TGroupBox;
    SpeedButton1: TSpeedButton;
    Quitter1: TMenuItem;
    Consulter1: TMenuItem;
    ypesdemateriels1: TMenuItem;
    Marquesdematriels1: TMenuItem;
    edtSearchallField: TEdit;
    Dconnexionredmarragedelapplication1: TMenuItem;
    N1: TMenuItem;
    PopupMenu_DBGrid: TPopupMenu;
    popupEdit: TMenuItem;
    popupDelete: TMenuItem;
    N2: TMenuItem;
    A1: TMenuItem;
    qrProducts: TFDQuery;
    procedure btnCloseClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnActualizeClick(Sender: TObject);
    procedure RadBtnProductIDClick(Sender: TObject);
    procedure RadbtnSerialNumberClick(Sender: TObject);
    procedure Edit_rechercherChange(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure Edit_rechercherKeyPress(Sender: TObject; var Key: Char);
    procedure edtSearchallFieldChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ypesdemateriels1Click(Sender: TObject);
    procedure Marquesdematriels1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    Procedure AutoSizeColDBGrid(DBGrid: TDBGrid);
    procedure Quitter1Click(Sender: TObject);
    procedure Dconnexionredmarragedelapplication1Click(Sender: TObject);
    procedure popupEditClick(Sender: TObject);
    procedure popupDeleteClick(Sender: TObject);
    procedure DBGridProductsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBGridProductsTitleClick(Column: TColumn);
    procedure A1Click(Sender: TObject);
    procedure qrProductsAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmProducts: TfrmProducts;

implementation

Uses Module, AddProducts, Typs, Marks, About;
{$R *.dfm}

procedure TfrmProducts.A1Click(Sender: TObject);

begin
  if (frmAbout = nil) then
    Application.CreateForm(TfrmAbout, frmAbout);
  frmAbout.Position := poMainFormCenter;
  try
    frmAbout.ShowModal;
  finally
    FreeAndNil(frmAbout);
  end;

end;

Procedure TfrmProducts.AutoSizeColDBGrid(DBGrid: TDBGrid);
var
  i, ColWidth, ColTextWidth: Integer;
begin
  if DBGrid.DataSource.DataSet.Active then
  begin
    DBGrid.DataSource.DataSet.DisableControls;
    for i := 0 to DBGrid.Columns.Count - 1 do
    begin
      ColWidth := DBGrid.Canvas.TextWidth(DBGrid.Columns[i].Field.DisplayLabel);
      DBGrid.DataSource.DataSet.First;
      while not DBGrid.DataSource.DataSet.EOF do
      begin
        ColTextWidth := DBGrid.Canvas.TextWidth(DBGrid.Columns[i].Field.DisplayText);
        if (ColTextWidth > ColWidth) then
        begin
          ColWidth := ColTextWidth;
        end;
        DBGrid.DataSource.DataSet.Next;
      end;
      DBGrid.Columns[i].Width := ColWidth + 30;
    end;
    DBGrid.DataSource.DataSet.EnableControls;
    DBGrid.DataSource.DataSet.First;
  end;
end;

procedure TfrmProducts.btnCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmProducts.btnDeleteClick(Sender: TObject);
var
  strProdutID: string;
  StringList: TStringList;
  i: Integer;
begin

  if (DBGridProducts.DataSource.DataSet.RecordCount > 0) then
  begin
    StringList := TStringList.Create;
    for i := 0 to DBGridProducts.FieldCount - 1 do
    begin
      StringList.Add(DBGridProducts.Fields[i].DisplayName + ': ' + DBGridProducts.Fields[i].AsString);
    end;

    strProdutID := DBGridProducts.Columns[0].Field.AsString;

    if DMModule.tblProducts.Locate('ProductID', strProdutID, []) then
    begin
      if MessageDlg('Are you sure you want to permanently delete the following selected Product:' + #13#10 + StringList.text, mtwarning, [mbyes, mbno], 0) = mryes
      then
      begin
        try
          DMModule.tblProducts.Delete;
          qrProducts.Refresh();
          AutoSizeColDBGrid(DBGridProducts);
        except
          on E: exception do
            Showmessage(E.message);
        end;
      end;
    end;
  end;
end;

procedure TfrmProducts.btnAddClick(Sender: TObject);
begin
  DMModule.tblProducts.Insert;     
  frmAddProducts := TfrmAddProducts.Create(Nil);
  frmAddProducts.ShowModal;
end;

procedure TfrmProducts.btnEditClick(Sender: TObject);
var
  strProdutID: string;
begin
  if DBGridProducts.DataSource.DataSet.RecordCount > 0 then
  begin
    strProdutID := DBGridProducts.Columns[0].Field.AsString;
    if DMModule.tblProducts.Locate('ProductID', strProdutID, []) then
    begin
      DMModule.tblProducts.Edit;
      frmAddProducts := TfrmAddProducts.Create(Nil);
      frmAddProducts.Position:=poMainFormCenter;
      frmAddProducts.ShowModal;
    end
    else
    begin
      Showmessage('The Product you have selected does not exist !');
      frmProducts.qrProducts.Refresh();
    end;
  end;
end;

procedure TfrmProducts.FormCreate(Sender: TObject);
begin
  qrProducts.Active := true;

  if AnsiLowerCase(DMModule.ConnectionMain.Params.UserName) = 'user01' then
  begin
    btnDelete.Free;
    PopupMenu_DBGrid.Items.Remove(popupDelete);
  end;

  if AnsiLowerCase(DMModule.ConnectionMain.Params.UserName) = 'customer01' then
  begin
    with btnActualize do
    begin
      Left := btnAdd.Left;
      Top := btnAdd.Top;
    end;
    btnAdd.Free;
    btnEdit.Free;
    btnDelete.Free;
    PopupMenu_DBGrid.Free;
  end;
end;

procedure TfrmProducts.btnActualizeClick(Sender: TObject);
begin
  try
    qrProducts.Refresh();
  except
    on E: exception do
      Showmessage(E.message);
  end;
end;

procedure TfrmProducts.RadBtnProductIDClick(Sender: TObject);
begin
  if RadBtnProductID.Checked then
  begin
    RadbtnSerialNumber.Checked := false;
    Edit_rechercher.Clear;
    Edit_rechercher.MaxLength := 10;
  end;
end;

procedure TfrmProducts.RadbtnSerialNumberClick(Sender: TObject);
begin
  if RadbtnSerialNumber.Checked then
  begin
    RadBtnProductID.Checked := false;
    Edit_rechercher.Clear;
    Edit_rechercher.MaxLength := 0;
  end;
end;

procedure TfrmProducts.Edit_rechercherChange(Sender: TObject);
begin
  if Edit_rechercher.text = '' then
    btnSearch.Enabled := false
  else
    btnSearch.Enabled := true;
end;

procedure TfrmProducts.btnSearchClick(Sender: TObject);
begin
  if RadBtnProductID.Checked then
  begin
    if length(Edit_rechercher.text) <> 10 then
    begin
      Showmessage('ProductID must contain a ten-digit number');
    end
    else

      if not qrProducts.Locate('ProductID', Edit_rechercher.text, [lopartialkey]) then
    begin
      Showmessage('No results for the ProductID N° "' + Edit_rechercher.text + '"');
    end;
  end;

  if RadbtnSerialNumber.Checked then
  begin

    if not qrProducts.Locate('SerialNumber', Edit_rechercher.text, [lopartialkey, locaseinsensitive]) then
    begin
      Showmessage('No results for the Serial Number N° "' + Edit_rechercher.text + '"');
    end;
  end;
end;

procedure TfrmProducts.Edit_rechercherKeyPress(Sender: TObject; var Key: Char);
begin
  if RadBtnProductID.Checked then
  begin
    if not(Key in ['0' .. '9', #13, #8]) then
      Key := #0;
  end;

  if Edit_rechercher.text <> '' then
  begin
    if Key = #13 then
    begin
      btnSearch.Click;
    end;
  end;
end;

procedure TfrmProducts.edtSearchallFieldChange(Sender: TObject);
var
  SQLStr: string;
begin
  SQLStr := 'SELECT ProductID, Typs.TypDescription,Marks.MarkDescription,Model,SerialNumber,Price' + #13 + 'FROM Products, Typs, Marks' + #13 +
    'WHERE (Products.TypID=Typs.TypID) and (Products.MarkID=Marks.MarkID)';

  try
    with qrProducts do
    begin
      Close;
      SQL.Clear;
      SQL.Add(SQLStr);
      if edtSearchallField.text <> '' then
      begin
        SQL.Add(' and ((Marks.MarkDescription like ' + Quotedstr(edtSearchallField.text + '%') + ') or (Model like ' + Quotedstr(edtSearchallField.text + '%') +
          ') or (ProductID like ' + Quotedstr(edtSearchallField.text + '%') + ') or (Typs.TypDescription like ' + Quotedstr(edtSearchallField.text + '%') +
          ') or (Price like ' + Quotedstr(edtSearchallField.text + '%') + '))');
      end;
      Prepared := true;
      Open;
      AutoSizeColDBGrid(DBGridProducts); // Voir la procedure [procedure AutiSizeColDBGrid(DBGrid1); ]
    end;
  except
    on E: exception do
    begin
      Showmessage(E.message);
    end;
  end;

end;

procedure TfrmProducts.SpeedButton1Click(Sender: TObject);
begin
  if not(edtSearchallField.text = '') then
    edtSearchallField.Clear;
end;

procedure TfrmProducts.ypesdemateriels1Click(Sender: TObject);
begin
  frmTyps := TFrmTyps.Create(self);
  frmTyps.Position:=poMainFormCenter;
  frmTyps.ShowModal;

end;

procedure TfrmProducts.Marquesdematriels1Click(Sender: TObject);
begin
  frmMarks := TFrmMarks.Create(self);
  frmMarks.Position:=poMainFormCenter;
  frmMarks.ShowModal;

end;

procedure TfrmProducts.FormShow(Sender: TObject);
begin
  AutoSizeColDBGrid(DBGridProducts);
end;

procedure TfrmProducts.Quitter1Click(Sender: TObject);
begin
  btnClose.Click;
end;

procedure TfrmProducts.Dconnexionredmarragedelapplication1Click(Sender: TObject);
begin
  DMModule.ConnectionMain.Close;
  ShellExecute(Handle, 'open', PChar(Application.ExeName), nil, nil, SW_SHOWNORMAL);
  Application.Terminate;
end;

procedure TfrmProducts.popupEditClick(Sender: TObject);
begin
  btnEdit.Click;
end;

procedure TfrmProducts.qrProductsAfterOpen(DataSet: TDataSet);
begin
  qrProducts.IndexFieldNames := 'TypDescription';
end;

procedure TfrmProducts.popupDeleteClick(Sender: TObject);
begin
  btnDelete.Click;
end;

procedure TfrmProducts.DBGridProductsMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ClickPosition: TGridCoord;
  PopupPt: TPoint;
begin
  if Assigned(PopupMenu_DBGrid) then
  begin
    if Button = mbRight then
    begin
      DBGridProducts := TDBGrid(Sender);
      ClickPosition := DBGridProducts.MouseCoord(X, Y);
      if (ClickPosition.X > -1) then
      begin
        PopupPt := DBGridProducts.ClientToScreen(Point(X, Y));
        PopupMenu_DBGrid.Popup(PopupPt.X, PopupPt.Y);
      end;
    end;
  end;

end;

procedure TfrmProducts.DBGridProductsTitleClick(Column: TColumn);
begin
  with TCustomADODataSet(DBGridProducts.DataSource.DataSet) do
  begin
    if not((Column.Field.FieldName = 'ProductID')) then
    begin
      Sort := Column.Field.FieldName; //  ' ASC' or ' DESC'
    end;
  end;
end;

end.
