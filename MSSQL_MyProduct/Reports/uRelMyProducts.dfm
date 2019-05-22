object frmRelMyProdutcs: TfrmRelMyProdutcs
  Left = 0
  Top = 0
  Caption = 'frmRelMyProdutcs'
  ClientHeight = 839
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
  object dtsProdutos: TDataSource
    DataSet = qrProduct
    Left = 56
    Top = 113
  end
  object qrProduct: TFDQuery
    Connection = DMMain.ConnectionMain
    SQL.Strings = (
      
        '  SELECT  Products.ProductID,Products.PName,Products.PDescriptio' +
        'n,Products.PValue,Products.PQuantity FROM  Products')
    Left = 160
    Top = 168
  end
end
