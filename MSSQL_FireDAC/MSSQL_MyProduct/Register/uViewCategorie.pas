{ ============================================
  Software Name : 	MMSQL_MyProduct
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit uViewCategorie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  cMyCategorie, uEnum, Module, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uMainDispaly;

type
  TfrmViewCategorie = class(TfrmMainDisplay)
    edtCategoriaId: TLabeledEdit;
    edtDescription: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnAlterClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
  private
    { Private declarations }
    oCategorie: TCategorie;
    function Save(ADMLAction: TDMLAction): boolean; override;
    function Delete: boolean; override;
  public
    { Public declarations }
  end;

var
  frmViewCategorie: TfrmViewCategorie;

implementation

{$R *.dfm}

function TfrmViewCategorie.Delete: boolean;
begin
  Result := oCategorie.Delete(qrList.FieldByName('CategorieID').AsInteger);
end;

function TfrmViewCategorie.Save(ADMLAction: TDMLAction): boolean;
begin
  if ADMLAction = acInsert then
    Result := oCategorie.Insert
  else if ADMLAction = acAlter then
    Result := oCategorie.Update;
end;

procedure TfrmViewCategorie.btnNewClick(Sender: TObject);
begin
  inherited;
    edtDescription.SetFocus;
end;

procedure TfrmViewCategorie.btnSaveClick(Sender: TObject);
begin
  if edtCategoriaId.Text <> EmptyStr then
    oCategorie.ID := StrToInt(edtCategoriaId.Text)
  else
    oCategorie.ID := 0;

  oCategorie.Description := edtDescription.Text;
  inherited;
end;

procedure TfrmViewCategorie.btnAlterClick(Sender: TObject);
begin
  if oCategorie.Select(qrList.FieldByName('CategorieID').AsInteger) then
  begin
    edtCategoriaId.Text := IntToStr(oCategorie.ID);
    edtDescription.Text := oCategorie.Description;
  end
  else
  begin
    btnCancel.Click;
    Abort;
  end;

  inherited;

end;



procedure TfrmViewCategorie.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCategorie) then
    FreeAndNil(oCategorie);
end;

procedure TfrmViewCategorie.FormCreate(Sender: TObject);
begin
  inherited;
  oCategorie := TCategorie.Create(DMMain.ConnectionMain);
  IndiceAtual := 'CATDescription';
end;



end.
