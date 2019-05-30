object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'MongoDB_Connection'
  ClientHeight = 481
  ClientWidth = 526
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MMMain
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 136
    Width = 520
    Height = 342
    Align = alBottom
    DataSource = dsQuery
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object GrBoxMain: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 520
    Height = 127
    Align = alTop
    TabOrder = 1
    DesignSize = (
      520
      127)
    object Label1: TLabel
      Left = 16
      Top = 35
      Width = 29
      Height = 13
      Caption = 'Match'
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 20
      Height = 13
      Caption = 'Sort'
    end
    object Label3: TLabel
      Left = 16
      Top = 89
      Width = 48
      Height = 13
      Caption = 'Projection'
    end
    object Label4: TLabel
      Left = 16
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Database'
    end
    object Label5: TLabel
      Left = 241
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Collection'
    end
    object EditCollection: TEdit
      Left = 297
      Top = 5
      Width = 137
      Height = 21
      TabOrder = 0
      Text = 'LogIn'
    end
    object EditDatabase: TEdit
      Left = 80
      Top = 5
      Width = 137
      Height = 21
      TabOrder = 1
      Text = 'walid'
    end
    object EditMatch: TEdit
      Left = 80
      Top = 32
      Width = 354
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      Text = '{Username:"Ali"}'
    end
    object EditProjection: TEdit
      Left = 80
      Top = 86
      Width = 354
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
    end
    object EditSort: TEdit
      Left = 80
      Top = 60
      Width = 354
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 4
    end
    object ButtonOpenMongo: TBitBtn
      Left = 440
      Top = 84
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Open'
      Default = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000002828284D223B
        484D72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF223B484D0000000000000000848484FF2828
        284D223B484D72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF223B484D00000000848484FF8484
        84FF2828284D223B484D72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF223B484D848484FF8484
        84FF848484FF2828284D223B484D72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF848484FF8484
        84FF848484FF848484FF2828284D000000000000000000000000223B484D72C4
        EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF72C4EEFF223B484D848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF2828284D0000
        0000000000000000000000000000000000000000000000000000848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF0000000000000000848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF848484FF0000000000000000848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF848484FF848484FF8484
        84FF848484FF848484FF848484FF2828284D0000000000000000848484FF8484
        84FF848484FF848484FF848484FF848484FF848484FF2828284D000000000000
        00000000000000000000000000000000000000000000000000002828284D8484
        84FF848484FF848484FF848484FF848484FF2828284D00000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000}
      ParentDoubleBuffered = True
      TabOrder = 5
      OnClick = ButtonOpenMongoClick
    end
  end
  object dsQuery: TDataSource
    DataSet = DMModule.qrLogIn
    Left = 384
    Top = 239
  end
  object MMMain: TMainMenu
    Left = 232
    Top = 184
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
        Action = actExit
        ShortCut = 16453
      end
      object N1: TMenuItem
        Caption = '-'
      end
    end
    object N4: TMenuItem
      Caption = '&User'
      object N5: TMenuItem
        Action = acAddUser
      end
    end
    object N3: TMenuItem
      Caption = '&Option'
    end
    object A2: TMenuItem
      Caption = '&About'
      object actAbout1: TMenuItem
        Action = actAbout
      end
      object N2: TMenuItem
        Caption = '-'
      end
    end
  end
  object ActionList1: TActionList
    Left = 361
    Top = 200
    object actOpenFile: TAction
      Category = 'File'
      Caption = 'Open File(s)...'
    end
    object actShowInExplorer: TAction
      Caption = 'Show in Explorer'
    end
    object actOpenFolder: TAction
      Category = 'File'
      Caption = 'Open Folder(s)...'
    end
    object actExit: TAction
      Category = 'File'
      Caption = 'Exit'
      OnExecute = actExitExecute
    end
    object actOption: TAction
      Category = 'Option'
      Caption = 'Option'
      ShortCut = 16463
    end
    object actAbout: TAction
      Category = 'About'
      Caption = 'Info'
      ShortCut = 16457
      OnExecute = actAboutExecute
    end
    object acAddUser: TAction
      Category = 'User'
      Caption = '&Add'
      ShortCut = 16449
      OnExecute = acAddUserExecute
    end
  end
end
