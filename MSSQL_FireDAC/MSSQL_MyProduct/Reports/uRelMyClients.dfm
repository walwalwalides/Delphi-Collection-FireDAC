object frmRelMyClients: TfrmRelMyClients
  Left = 0
  Top = 0
  Caption = 'frmRelMyClients'
  ClientHeight = 546
  ClientWidth = 825
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object dtsClientes: TDataSource
    DataSet = qrClients
    Left = 104
    Top = 64
  end
  object qrClients: TFDQuery
    Connection = DMMain.ConnectionMain
    SQL.Strings = (
      
        ' SELECT clients.ClientsID,Clients.Cname,Clients.Cemail,Clients.C' +
        'telefon FROM Clients')
    Left = 48
    Top = 64
  end
end
