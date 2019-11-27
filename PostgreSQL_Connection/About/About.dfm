object frmAbout: TfrmAbout
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'About'
  ClientHeight = 278
  ClientWidth = 228
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Logo: TImage
    Left = 17
    Top = 10
    Width = 48
    Height = 48
    AutoSize = True
  end
  object Titre: TLabel
    Left = 69
    Top = 25
    Width = 132
    Height = 17
    Caption = 'PostgreSQL_Connection'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Impact'
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object Texte: TMemo
    Left = 16
    Top = 64
    Width = 185
    Height = 180
    Lines.Strings = (
      '      Software name'
      '      PostgreSQL_Connection'
      ''
      '      Software version'
      '       V1.0.0'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      'Copyright '#169' 2019 By '
      'Walwalwalides'
      '                             ')
    ReadOnly = True
    TabOrder = 0
  end
  object Url: TLinkLabel
    Left = 36
    Top = 250
    Width = 155
    Height = 20
    Hint = 'www.delphinautes.fr'
    Caption = 
      '<a href="https://github.com/walwalwalides">github.com/walwalwali' +
      'des</a>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnLinkClick = UrlLinkClick
  end
end
