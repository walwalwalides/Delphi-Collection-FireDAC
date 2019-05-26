{ ============================================
  Software Name : 	PostgreSQL_Connection
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit uViewClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  uEnum, cMyClients, Module, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uMainDispaly;

type
  TfrmViewClients = class(TfrmMainDisplay)
    edtClienteId: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtCity: TLabeledEdit;
    edtAdress: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtSex: TMaskEdit;
    Label1: TLabel;
    edtTelefone: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    DTPBirthdate: TDateTimePicker;
    qrListclientid: TIntegerField;
    qrListcname: TWideStringField;
    qrListcadress: TWideStringField;
    qrListccity: TWideStringField;
    qrListctelefon: TWideStringField;
    qrListcemail: TWideStringField;
    qrListcsex: TWideStringField;
    qrListcbirthdate: TDateField;
    qrListcinsertts: TSQLTimeStampField;
    DTPInsertDate: TDateTimePicker;
    lblInsertDate: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnAlterClick(Sender: TObject);

  private
    { Private declarations }
    oClient:TClient;
    function Delete:Boolean; override;
    function Save(ADMLAction:TDMLAction):Boolean; override;
  public
    { Public declarations }
  end;

var
  frmViewClients: TfrmViewClients;

implementation

{$R *.dfm}

{ TfrmCadCliente }

{$region 'Override'}
function TfrmViewClients.Delete: Boolean;
begin
  if oClient.Select(qrList.FieldByName('ClientID').AsInteger) then begin
     Result:=oClient.Delete;
  end;
end;

function TfrmViewClients.Save(ADMLAction: TDMLAction): Boolean;
begin
  if edtClienteId.Text<>EmptyStr then
     oClient.clientID:=StrToInt(edtClienteId.Text)
  else
     oClient.clientID:=0;

  oClient.name           :=edtNome.Text;
  oClient.city            :=edtCity.Text;
   oClient.sex       :=edtSex.Text;
  oClient.adress         :=edtAdress.Text;
//  oClient.insertts         :=edtCity.Text;
  oClient.telefon       :=edtTelefone.Text;
  oClient.email          :=edtEmail.Text;


  if (ADMLAction=acInsert) then
     Result:=oClient.Insert
  else if (ADMLAction=acAlter) then
     Result:=oClient.Update;
end;
{$endregion}



procedure TfrmViewClients.btnAlterClick(Sender: TObject);
begin
  if oClient.Select(qrList.FieldByName('ClientID').AsInteger) then
  begin
     edtClienteId.Text:=IntToStr(oClient.clientID);
     edtNome.Text     :=oClient.name;
     edtSex.Text      :=oClient.sex;
     edtAdress.Text   :=oClient.adress;
     edtCity.Text   :=oClient.city;
     edtTelefone.Text :=oClient.telefon;
     edtEmail.Text    :=oClient.email;
     DTPBirthdate.Date:=oClient.birthdate;
     DTPBirthdate.DateTime:=oClient.insertts;
  end
  else begin
    btnCancel.Click;
    Abort;
  end;

  inherited;
end;

procedure TfrmViewClients.btnNewClick(Sender: TObject);
begin
  inherited;
   DTPBirthdate.Date:=Date;
  edtNome.SetFocus;
end;



procedure TfrmViewClients.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oClient) then
     FreeAndNil(oClient);
end;

procedure TfrmViewClients.FormCreate(Sender: TObject);
begin
  inherited;
  oClient:=TClient.Create(DMMain.ConnectionMain);
  IndiceAtual:='ClientID';

end;









end.
