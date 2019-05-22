
{ ============================================
  Software Name : 	MMSQL_MyProduct
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit uMainDispaly;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls, ZAbstractRODataset, ZAbstractDataset, ZDataset, Main,
  uEnum, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmMainDisplay = class(TForm)
    pnlFeed: TPanel;
    pnlCentro: TPanel;
    pgcPrincipal: TPageControl;
    tabListagem: TTabSheet;
    tabManutencao: TTabSheet;
    btnNew: TBitBtn;
    btnAlter: TBitBtn;
    btnSave: TBitBtn;
    btnDelete: TBitBtn;
    btnExit: TBitBtn;
    pnlListagemTopo: TPanel;
    pnlListagemCentro: TPanel;
    grdListagem: TDBGrid;
    mskPesquisa: TMaskEdit;
    btnPesquisa: TBitBtn;
    btnNavigate: TDBNavigator;
    DtsList: TDataSource;
    btnCancel: TBitBtn;
    lblIndice: TLabel;
    qrList: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnAlterClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
    procedure mskPesquisaChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
    procedure grdListagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure ControlarBotoes(btnNew, btnAlter, btnCancel, btnSave,
                          btnDelete:TBitBtn; btnNavigate:TDBNavigator;
                          pgcPrincipal:TPageControl; Flag:Boolean);
    procedure ControlaIndiceTab(pgcPrincipal: TPageControl; i: Integer);
    function RetornarCampoTraduzido(Campo: string): string;
    procedure ExibirLabelIndice(Campo: string; aLabel: TLabel);
    function ExisteCampoObrigatorio: Boolean;
    procedure DesabilitarEditPK;
    procedure LimparEdits;
    { Private declarations }
  public
    { Public declarations }
    DMLAction:TDMLAction;
    IndiceAtual:string;
    function Save(DMLAction:TDMLAction):boolean; virtual;
    function Delete:Boolean; virtual;


    procedure BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
  end;

var
  frmMainDisplay: TfrmMainDisplay;

implementation

{$R *.dfm}



{$region 'OBSERVAÇÕES'}
//TAG: 1 - Chave Primaria
//TAG: 2 - Campos Obrigatórios
{$endregion}

{$region 'Function/Procedure DE CONTROLE'}
procedure TfrmMainDisplay.ControlarBotoes(btnNew, btnAlter, btnCancel, btnSave,
                          btnDelete:TBitBtn; btnNavigate:TDBNavigator;
                          pgcPrincipal:TPageControl; Flag:Boolean);
begin
  btnNew.Enabled      :=Flag;
  btnDelete.Enabled    :=Flag;
  btnAlter.Enabled   :=Flag;
  btnNavigate.Enabled :=Flag;
  pgcPrincipal.Pages[0].TabVisible:=Flag;

  btnCancel.Enabled  :=not(Flag);
  btnSave.Enabled    :=not(Flag);
end;

procedure TfrmMainDisplay.ControlaIndiceTab(pgcPrincipal:TPageControl; i: Integer);
begin
  if (pgcPrincipal.Pages[i].TabVisible) then
      pgcPrincipal.TabIndex:=0;
end;

function TfrmMainDisplay.RetornarCampoTraduzido(Campo: string):string;
var i:Integer;
begin
  for I := 0 to qrList.FieldCount-1 do begin
    if LowerCase(qrList.Fields[i].FieldName) = LowerCase(Campo) then begin
       Result:=qrList.Fields[i].DisplayLabel;
       Break;
    end;
  end;
end;

function TfrmMainDisplay.ExisteCampoObrigatorio:Boolean;
var i:Integer;
begin
  Result:=False;
  for I := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
       if (TLabeledEdit(Components[i]).Tag = 2) and (TLabeledEdit(Components[i]).Text = EmptyStr) then begin
          MessageDlg(TLabeledEdit(Components[i]).EditLabel.Caption + ' is a required field' ,mtInformation,[mbOK],0);
          TLabeledEdit(Components[i]).SetFocus;
          Result:=True;
          Break;
       end;
    end;
  end;
end;

Procedure TfrmMainDisplay.DesabilitarEditPK;
var i:Integer;
begin
  for I := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then begin
       if (TLabeledEdit(Components[i]).Tag = 1) then begin
          TLabeledEdit(Components[i]).Enabled:=false;
          Break;
       end;
    end;
  end;
end;

procedure TfrmMainDisplay.LimparEdits;
Var i:Integer;
begin
  for i := 0 to ComponentCount -1 do begin
    if (Components[i] is TLabeledEdit) then
      TLabeledEdit(Components[i]).Text:=EmptyStr
    else if (Components[i] is TEdit) then
      TEdit(Components[i]).Text:=''
    else if (Components[i] is TDBLookupComboBox) then
      TDBLookupComboBox(Components[i]).KeyValue:=Null
    else if (Components[i] is TMemo) then
      TMemo(Components[i]).Text:=''
    else if (Components[i] is TMaskEdit) then
      TMaskEdit(Components[i]).Text:='';

  end;
end;

{$endregion}

{$region 'Métodos Virtual'}
function TfrmMainDisplay.Save(DMLAction: TDMLAction): boolean;
begin
   if (DMLAction=acInsert) then
       showmessage('Insert')
   else if (DMLAction=acAlter) then
       showmessage('Alter')
   else
      showmessage('No Change');
end;

function TfrmMainDisplay.Delete: Boolean;
begin
  showmessage('Delete');
end;
{$endregion}

procedure TfrmMainDisplay.ExibirLabelIndice(Campo: string; aLabel:TLabel);
begin
  aLabel.Caption:=RetornarCampoTraduzido(Campo);
end;

procedure TfrmMainDisplay.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainDisplay.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qrList.Close;
end;

procedure TfrmMainDisplay.FormCreate(Sender: TObject);
begin
//  qrList.Connection:=frmMain.MainConnection;

  ControlarBotoes(btnNew, btnAlter, btnCancel, btnSave, btnDelete, btnNavigate, pgcPrincipal, true);
  grdListagem.Options:=[dgTitles,
                        dgIndicator,
                        dgColumnResize,
                        dgColLines,
                        dgRowLines,
                        dgTabs,
                        dgRowSelect,
                        dgAlwaysShowSelection,
                        dgCancelOnExit,
                        dgTitleClick,
                        dgTitleHotTrack];
end;

procedure TfrmMainDisplay.FormShow(Sender: TObject);
begin
  ControlaIndiceTab(pgcPrincipal, 0);
  lblIndice.Caption:=IndiceAtual;
  DesabilitarEditPK;
  if qrList.SQL.Text<>EmptyStr then begin
     qrList.IndexFieldNames:=IndiceAtual;
     ExibirLabelIndice(IndiceAtual, lblIndice);
     qrList.Open;
  end;
end;


procedure TfrmMainDisplay.mskPesquisaChange(Sender: TObject);
begin
  qrList.Locate(IndiceAtual, TMaskEdit(Sender).Text,[loPartialKey])
end;

procedure TfrmMainDisplay.btnAlterClick(Sender: TObject);
begin
  ControlarBotoes(btnNew, btnAlter, btnCancel, btnSave, btnDelete, btnNavigate, pgcPrincipal, false);
  DMLAction:=acAlter;
end;

procedure TfrmMainDisplay.btnCancelClick(Sender: TObject);
begin
  ControlarBotoes(btnNew, btnAlter, btnCancel, btnSave, btnDelete, btnNavigate, pgcPrincipal, true);
  ControlaIndiceTab(pgcPrincipal, 0);
  DMLAction:=acNone;
  LimparEdits;
end;

procedure TfrmMainDisplay.btnNewClick(Sender: TObject);
begin
  ControlarBotoes(btnNew, btnAlter, btnCancel, btnSave, btnDelete, btnNavigate, pgcPrincipal, False);
  DMLAction:=acInsert;
  LimparEdits;
end;

procedure TfrmMainDisplay.grdListagemTitleClick(Column: TColumn);
begin
  IndiceAtual                :=Column.FieldName;
  qrList.IndexFieldNames:=IndiceAtual;
  ExibirLabelIndice(IndiceAtual, lblIndice);
end;

procedure TfrmMainDisplay.grdListagemDblClick(Sender: TObject);
begin
  btnAlter.Click;
end;

procedure TfrmMainDisplay.grdListagemKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   BloqueiaCTRL_DEL_DBGrid(Key, Shift);
end;

procedure TfrmMainDisplay.btnSaveClick(Sender: TObject);
begin
  if (ExisteCampoObrigatorio) then
     Abort;

  Try
    if Save(DMLAction) then begin
       ControlarBotoes(btnNew, btnAlter, btnCancel, btnSave, btnDelete, btnNavigate, pgcPrincipal, true);
       ControlaIndiceTab(pgcPrincipal, 0);
       DMLAction:=acNone;
       LimparEdits;
       qrList.Refresh;
    end
    else begin
      MessageDlg('Error Save', mtWarning,[mbOK],0);
    end;
  Finally
  End;

end;

procedure TfrmMainDisplay.btnDeleteClick(Sender: TObject);
begin
  try
    if (Delete) then begin
       ControlarBotoes(btnNew, btnAlter, btnCancel, btnSave, btnDelete, btnNavigate, pgcPrincipal, true);
       ControlaIndiceTab(pgcPrincipal, 0);
       LimparEdits;
       qrList.Refresh;
    end
    else begin
      MessageDlg('Error Save', mtWarning,[mbOK],0);
    end;
  finally
    DMLAction:=acNone;
  end;
end;

procedure TfrmMainDisplay.BloqueiaCTRL_DEL_DBGrid(var Key: Word; Shift: TShiftState);
begin
   //Bloqueia o CTRL + DEL
   if (Shift = [ssCtrl]) and (Key = 46) then
      Key := 0;
end;

end.
