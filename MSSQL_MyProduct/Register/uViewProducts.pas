{ ============================================
  Software Name : 	MMSQL_MyProduct
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides }
{ CopyRight © 2019 }
{ Email : WalWalWalides@gmail.com }
{ GitHub :https://github.com/walwalwalides }
{ ******************************************** }
unit uViewProducts;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uMainDispaly, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  cMyProduts, uEnum,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, JvExStdCtrls, JvEdit, JvValidateEdit;

type
  TfrmViewProducts = class(TfrmMainDisplay)
    edtProductID: TLabeledEdit;
    edtName: TLabeledEdit;
    Bevel1: TBevel;
    edtDescription: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lkpCategorie: TDBLookupComboBox;
    Label4: TLabel;
    dtsCategorie: TDataSource;
    qrCategorie: TFDQuery;
    edtValue: TJvValidateEdit;
    edtQuantity: TJvValidateEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
    oProduct: TProduct;
    function Delete: Boolean; override;
    function Save(ADMLAction: TDMLAction): Boolean; override;
  public
    { Public declarations }
  end;

var
  frmViewProducts: TfrmViewProducts;

implementation

{$R *.dfm}

uses Module;

{$REGION 'Override'}

function TfrmViewProducts.Delete: Boolean;
begin
  if oProduct.Select(qrList.FieldByName('ProductID').AsInteger) then
  begin
    Result := oProduct.Delete;
  end;
end;

function TfrmViewProducts.Save(ADMLAction: TDMLAction): Boolean;
begin
  if (edtProductID.Text <> EmptyStr) then
    oProduct.ProductID := StrToInt(edtProductID.Text)
  else
    oProduct.ProductID := 0;

  oProduct.name := edtName.Text;
  oProduct.description := edtDescription.Text;
  oProduct.CategorieID := lkpCategorie.KeyValue;
  // oProduct.valor          :=edtValor.Value;
  // oProduct.quantidade     :=edtQuantidade.Value;

  if (ADMLAction = acInsert) then
    Result := oProduct.Insert
  else if (ADMLAction = acAlter) then
    Result := oProduct.Update;
end;
{$ENDREGION}

procedure TfrmViewProducts.btnAlterClick(Sender: TObject);
begin

  if oProduct.Select(qrList.FieldByName('ProductID').AsInteger) then
  begin
    edtProductID.Text := IntToStr(oProduct.ProductID);
    edtName.Text := oProduct.name;
    edtDescription.Text := oProduct.description;
    lkpCategorie.KeyValue := oProduct.CategorieID;
    EdtValue.Value := oProduct.value;
    EdtValue.Value := oProduct.value;
    edtQuantity.Value := oProduct.quantity;
  end
  else
  begin
    btnCancel.Click;
    Abort;
  end;
  inherited;

end;

procedure TfrmViewProducts.btnNewClick(Sender: TObject);
begin
  inherited;
  edtName.SetFocus;
end;

procedure TfrmViewProducts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  qrCategorie.Close;
  if Assigned(oProduct) then
    FreeAndNil(oProduct);
end;

procedure TfrmViewProducts.FormCreate(Sender: TObject);
begin
  inherited;
  oProduct := TProduct.Create(DMMain.ConnectionMain);

  IndiceAtual := 'Pname';
end;

procedure TfrmViewProducts.FormShow(Sender: TObject);
begin
  inherited;
  qrCategorie.Open;
end;

end.
