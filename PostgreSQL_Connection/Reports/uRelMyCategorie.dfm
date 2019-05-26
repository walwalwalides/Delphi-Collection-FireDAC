object frmRelMyCategorie: TfrmRelMyCategorie
  Left = 0
  Top = 0
  Caption = 'frmRelMyCategorie'
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
  object dtsCategorias: TDataSource
    DataSet = qrCategorie
    Left = 192
    Top = 64
  end
  object qrCategorie: TFDQuery
    Connection = DMMain.ConnectionMain
    SQL.Strings = (
      'Select CategorieID, CATDescription from Categorie')
    Left = 120
    Top = 64
  end
end
