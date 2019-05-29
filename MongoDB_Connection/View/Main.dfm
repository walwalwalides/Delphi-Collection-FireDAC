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
    object ButtonOpenMongo: TButton
      Left = 440
      Top = 77
      Width = 75
      Height = 30
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Caption = 'Open'
      Default = True
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
