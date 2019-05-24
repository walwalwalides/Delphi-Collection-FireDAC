object FrmAboutSplash: TFrmAboutSplash
  Tag = 99
  Left = 392
  Top = 252
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'FrmAboutSplash'
  ClientHeight = 302
  ClientWidth = 445
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel: TPanel
    Tag = 99
    Left = 4
    Top = 4
    Width = 433
    Height = 289
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    OnClick = CloseClick
    DesignSize = (
      433
      289)
    object LabelProgName: TLabel
      Left = 162
      Top = 24
      Width = 256
      Height = 48
      Alignment = taCenter
      AutoSize = False
      Caption = 'Program name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -29
      Font.Name = 'Franklin Gothic Medium Cond'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      OnClick = CloseClick
    end
    object LabelDevName: TLabel
      Left = 162
      Top = 136
      Width = 256
      Height = 23
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelDevName'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Franklin Gothic Medium Cond'
      Font.Style = []
      ParentFont = False
      OnClick = CloseClick
    end
    object LabelVersion: TLabel
      Left = 162
      Top = 75
      Width = 256
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = 'LabelVersion'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Franklin Gothic Medium Cond'
      Font.Style = []
      ParentFont = False
      OnClick = CloseClick
    end
    object labelAuthorName: TLabel
      Left = 162
      Top = 153
      Width = 256
      Height = 27
      Alignment = taCenter
      AutoSize = False
      Caption = 'Author Name'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Franklin Gothic Medium Cond'
      Font.Style = []
      ParentFont = False
      OnClick = CloseClick
    end
    object SpeedButtonQuit: TSpeedButton
      Left = 386
      Top = 3
      Width = 44
      Height = 26
      Cursor = crHandPoint
      Anchors = [akTop, akRight]
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000545A000055FA0000595B000000010000000000000000000000000000
        00000000000100006449000064F90000645A0000000000000000000000000000
        575E010167FF0606A1FF010170FF0000615F0000000100000000000000000000
        00010000714C02027FFF0C0CB8FF01017AFF00006A5E0000000000004F5A0000
        63FF05059EFF0A0AAFFF0C0CB2FF020278FF0000695F00000001000000010000
        764C030387FF1414C9FF1414C2FF0D0DB8FF01017AFF0000635A00004EF90303
        96FF0606A7FF0C0CB3FF1313BFFF1212C1FF020280FF00006A5F0000724C0101
        8CFF1919D9FF1E1ED4FF1818C9FF1212BEFF0A0AB4FF000064FB000050560000
        64FE0707A3FF0F0FB7FF1414C3FF1C1CD1FF1515D0FF020285FF01018AFF1E1E
        E6FF2727E8FF2121DAFF1B1BCFFF0F0FC1FF010181FF0000665B000000000000
        595901016AFF0A0AAEFF1515C5FF1C1CD2FF2323E1FF1919D8FF2020E7FF3131
        F9FF2828EAFF2222DDFF1111CEFF010186FF0000715F00000001000000000000
        000000005F5901016FFF0D0DB7FF1C1CD0FF2222DDFF2727E9FF2D2DF2FF2C2C
        F1FF2727E7FF1414D6FF01018CFF0000765F0000000100000000000000000000
        00000000000000005D59000072FF0D0DBCFF1D1DD5FF2222DFFF2626E5FF2525
        E3FF1414D2FF01018BFF0000735F000000010000000000000000000000000000
        00000000000000005B59040470FF3838C6FF2121CEFF1B1BD3FF1E1ED7FF1F1F
        D7FF1414CDFF02028AFF00006A66000000020000000000000000000000000000
        00000000585905056DFF4B4BC4FF4D4DCDFF4A4AD0FF3030CDFF1818CAFF1818
        CAFF1616C8FF1010C2FF020284FF000069660000000200000000000000000000
        5359060666FF5959C0FF5A5AC6FF5454C7FF5151CBFF4444C4FF3E3EC5FF3131
        C7FF1D1DBEFF1010B6FF0909B0FF00007CFF0000626600000002000047560808
        5EFE6969C1FF6969C4FF6161C2FF5F5FC6FF5656C5FF050575FF060674FF4444
        C4FF4242C1FF3737BAFF2D2DB2FF2323AFFF030375FF00005961000043F06B6B
        B9FF8181CFFF7474C8FF6F6FC6FF6666C2FF080871FF0000595F00005F590606
        73FF4747BCFF4040B5FF3535AFFF3030ABFF2424A6FF000055FB000045520A0A
        58FE8080C3FF8888CFFF7878C4FF0A0A69FF0000585F00000001000000000000
        5F5907076DFF4A4AB6FF4444B3FF3B3BABFF050568FF00005559000000000000
        4757080859FE7676BCFF0C0C63FF0000525F0000000100000000000000000000
        000000005B59060667FE4242ACFF070767FF0000575E00000000000000000000
        000000004552000043F10000485B000000010000000000000000000000000000
        0000000000000000515500004CF6000050580000000000000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = CloseClick
    end
    object LabelProgDescription: TLabel
      Left = 16
      Top = 185
      Width = 402
      Height = 54
      Alignment = taCenter
      AutoSize = False
      Caption = 'Program description '
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Franklin Gothic Medium Cond'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
      OnClick = CloseClick
    end
    object LabelDates: TLabel
      Left = 162
      Top = 99
      Width = 256
      Height = 19
      Alignment = taCenter
      AutoSize = False
      Caption = '20xx - 20xx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Franklin Gothic Medium Cond'
      Font.Style = []
      ParentFont = False
      OnClick = CloseClick
    end
    object ImageLogo: TImage
      Left = 28
      Top = 31
      Width = 128
      Height = 128
      AutoSize = True
      Transparent = True
      OnClick = CloseClick
    end
    object PanelBande: TPanel
      Left = 16
      Top = 252
      Width = 401
      Height = 24
      ParentBackground = False
      TabOrder = 0
    end
  end
  object TimerEffect: TTimer
    Enabled = False
    OnTimer = TimerEffectTimer
    Left = 21
    Top = 7
  end
end
