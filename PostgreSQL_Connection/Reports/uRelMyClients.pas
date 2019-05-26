{ ============================================
  Software Name : 	PostgreSQL_Connection
  ============================================ }
{ ******************************************** }
{ Written By WalWalWalides                     }
{ CopyRight © 2019                             }
{ Email : WalWalWalides@gmail.com              }
{ GitHub :https://github.com/walwalwalides     }
{ ******************************************** }
unit uRelMyClients;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Data.DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmRelMyClients = class(TForm)
    dtsClientes: TDataSource;
    qrClients: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelMyClients: TfrmRelMyClients;

implementation

{$R *.dfm}

uses Module;

procedure TfrmRelMyClients.FormCreate(Sender: TObject);
begin
  QrClients.Open;
end;

procedure TfrmRelMyClients.FormDestroy(Sender: TObject);
begin
  QrClients.Close;
end;

end.
