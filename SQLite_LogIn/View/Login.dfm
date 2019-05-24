object FrmLogin: TFrmLogin
  Tag = 99
  Left = 392
  Top = 252
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  Caption = 'FrmLogin'
  ClientHeight = 305
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
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
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object ImageLogo: TImage
      Left = 16
      Top = 16
      Width = 128
      Height = 128
      AutoSize = True
      Transparent = True
      OnClick = CloseClick
    end
    object LabelPassword: TLabel
      Left = 169
      Top = 226
      Width = 46
      Height = 13
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LabelDatabase: TLabel
      Left = 169
      Top = 68
      Width = 46
      Height = 13
      Caption = 'Database'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButtonDatabase: TSpeedButton
      Left = 386
      Top = 59
      Width = 32
      Height = 32
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C0060000C40E0000C40E00000000000000000000C9AEFFC9AEFF
        C9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFE0D7D4D9CECAD6CAC5D1C5BED3C5
        BEDECFC7DFD2CAC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9
        AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFAEBAB990AFB58EC3D387D3ED7CDEFF
        69D2FF56C9FF43BEFF2AA6F52099E71381CE345A765D57547B7A7BC9AEFFC9AE
        FFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF8DAFC56BBDDFBCF9FCB2F2FB9C
        E0F296E6FF85DBFF74D2FF63C9FF52C0FF41B7FF27A4F62C7BB2807269DAD5D3
        353E473D647FC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF9CC6E42FB6FF8BE0
        FFB7ECEEB1ECF5A0E3F58AD3EE85DBFF74D2FF63C9FF52C0FF41B7FF20ADFFB0
        9684A09E9DC5C3C17D6E66137FC6A1D0EDC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF
        88D0FF3BB6FF8BDFFFC5FDFFAAE4EE9FE3F58EDAF57BCCEE76D3FF66CBFF56C2
        FF46BAFF26B1FF907D72949190C2BEBD7E736B1572AF9FDEFFC9AEFFC9AEFFC9
        AEFFC9AEFFC9AEFF8AD0FF36B3FF85DBFFC8FFFFCAFFFFB2E9EEA1E3F586D6F5
        63BFEE4ABCFF28AAFF0E9CFF0096FEB19D91989795B7B4B27F71691876B59ED8
        FBC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF7BC9FF6CD0FFDCFFFFB7F6FF89DDFF55
        C2FF2EA3EE1A9CF51398F5098FEE0A92F20D8AE1007DD9A79588949190BEBBBA
        786A610875BEA2DAFCC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFBCFAFE63CA
        FF41B7FF37B1FF45B9FF4EBEFF44AEEE45B3F539ADF52D9FE8209DEF048AE6B2
        9F918E8B88CAC7C68171640076DA8AC5ECC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF
        C9AEFF50B7ED68CCFFA5ECFFBFFAFFB2F3FF9EE8FF8BDFFF70C6EE64C3F553BA
        F641AEF230B1FF678BA38A827EC7C5C389796D005CBC77ACD2C9AEFFC9AEFFC9
        AEFFC9AEFFC9AEFFC9AEFF3DB1F682D0EEC9FFFFBAF7FFA7EDFF96E4FF85DBFF
        73D2FF5CBAEE4FB9F63BB0FA2488CAB4A195827F7DCCC9C88B8078005792C9AE
        FFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF83C8F736AEF585D6F5B7EBEEB9F7FFA6
        EDFF95E3FF84DAFF74D2FF65CAFF4AB4F13C9AD49D948F8E8B88878482CECCCA
        968F8C4056678FB6CEC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF8ACFFF36A9EE81D4
        F5BCF3F5ABE5EEB0F3FFA0EAFF8CDFFF74D2FF5CC6FF39ADF3AFA097ACA7A4A8
        A4A29A9795ADAAA9EAE8E8C2BDBA5C5653C9AEFFC9AEFFC9AEFFC9AEFFC9AEFF
        87CFFF30B0FF9EDEEECBFBF5CCFCF595D9EE74D2FF50C0FF3DB5FF1DA6FF7DAC
        CCC6BCB6BCBAB8B5B3B2ABA7A5A8A5A3D0CFCEFAF9F8B8B5B5AAA9A9C9AEFFC9
        AEFFC9AEFFC9AEFF8DD3FFC8FFFFB1F3FF61BDEE37AAF52BA5F5209CEE1CA4FF
        129FFF0092FFCBC0B7DFDDDCBCB9B9A5A2A0AAA7A5A4A19F9A9795C8C6C5D5D3
        D2676564C9AEFFC9AEFFC9AEFFC9AEFFC9AEFF77D7FF51BFFF6ACDFF7CCDEE8B
        D8F58CD9F588D2EE7FD8FF62CBFFD9CAC1E5E4E3EAEAE9ECEBEBDBD4CFDCD7D3
        D8D7D6B9B7B5CDCCCB706E6DC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF4DC0FF87DD
        FFCFFFFFBFFAFF9EDEEE91DCF57FD2F56CC4EE54C5FFD8C9C1F3F2F1E1DFDEE3
        DCD65592BD5D839DAAA29DA9A5A3A19E9C7E7B7BC9AEFFC9AEFFC9AEFFC9AEFF
        AFDBF934B3FF8ADEFFC5FEFFB9F7FFA7EDFF8AD3EE7FD2F56FC9F550B9F1B2C7
        D2F2EDEAF3F1EECAD1D60058A7148EE1B5A79CB6B3B2B5B2B1878686C9AEFFC9
        AEFFC9AEFFC9AEFF84C7F63BB6FF88DDFFC4FDFFB7F5FFA9EFFF9FE9FF84CFEE
        76CEF55EC1F74DAFE8DECDC4FAF8F6FFFFFF9DB5C7B0BDC6D9D5D3BDB8B37C75
        72C9AEFFC9AEFFC9AEFFC9AEFFC9AEFF88CDFD28A1ED9CE8FFCEFFFFD3FFFFC8
        FFFFA3ECFF87DDFF6AC2EE5EC0F53EB3F841A4E3C5C0BDE3D6CEEEE1D9E1D6CE
        C8B6A86E86949CCDEDC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF86C9F7ADEDF5C8F6
        EE9FE9FF7CD6FF66CAFF62CAFF61C9FF60C8FF56B8EE56BDF54FBCF83EAFF262
        B2E370A9CA5B9BC40B75BF0079D9A1DFFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF
        E6FDF899E2F451BAF550B5EE56C2FF53C1FF4FBEFF4ABDFF47BAFF43B9FF3AA8
        EE38ACF533ABF62AA3F128AEFF26AEFF29B0FF007FDC79B5E0C9AEFFC9AEFFC9
        AEFFC9AEFFC9AEFFF2FEF824A2F041B2F641B1F53BA9EE3CB5FF38B2FF34AFFF
        2EAEFF2AABFF26A9FF1E9AEE1B9DF5179BF51394EE139FFF119EFF008AF895C5
        E6C9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFB8DAF0209BEB139CF6169CF518
        99EF1BA4FF1AA2FF17A0FF149FFF129EFF129EFF0E91EE0C95F60693F6008AEE
        0195FBC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AE
        FFC8E0F09DD4FA4BA9EC2B9CEA109DFF139EFF139EFF139EFF119EFF2DA8FC47
        A6E77EC2F1C9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFFC9AEFF}
      OnClick = OnUserCommand
    end
    object PanelBande: TPanel
      Left = 16
      Top = 254
      Width = 402
      Height = 27
      ParentBackground = False
      TabOrder = 4
      object ButtonOk: TButton
        Left = 261
        Top = 1
        Width = 65
        Height = 24
        Cursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = OkClick
      end
      object ButtonQuit: TButton
        Left = 332
        Top = 1
        Width = 65
        Height = 24
        Cursor = crHandPoint
        TabOrder = 1
        OnClick = CloseClick
      end
    end
    object GroupBoxUser: TGroupBox
      Left = 162
      Top = 147
      Width = 256
      Height = 66
      TabOrder = 2
      object LabelUserFirstName: TLabel
        Left = 30
        Top = 11
        Width = 43
        Height = 13
        Caption = 'ForName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LabelUserLastName: TLabel
        Left = 30
        Top = 40
        Width = 48
        Height = 13
        Caption = 'LastName'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditUserFirstName: TEdit
        Left = 88
        Top = 8
        Width = 156
        Height = 21
        MaxLength = 24
        TabOrder = 1
        OnChange = EditUserFirstNameChange
        OnExit = OnUserCommand
      end
      object EditUserLastName: TEdit
        Left = 88
        Top = 37
        Width = 156
        Height = 21
        MaxLength = 24
        TabOrder = 2
        OnChange = EditUserLastNameChange
        OnExit = OnUserCommand
      end
      object CheckBoxUser: TCheckBox
        Left = 9
        Top = 25
        Width = 22
        Height = 17
        Caption = '.'
        TabOrder = 0
        OnClick = OnUserCommand
      end
    end
    object GroupBoxMatricule: TGroupBox
      Left = 162
      Top = 100
      Width = 256
      Height = 35
      TabOrder = 1
      object LabelMatricule: TLabel
        Left = 30
        Top = 11
        Width = 43
        Height = 13
        Caption = 'Matricule'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditMatricule: TEdit
        Left = 88
        Top = 7
        Width = 80
        Height = 21
        MaxLength = 12
        TabOrder = 1
        OnChange = EditMatriculeChange
        OnExit = OnUserCommand
      end
      object CheckBoxMatricule: TCheckBox
        Left = 9
        Top = 9
        Width = 22
        Height = 17
        Caption = '.'
        TabOrder = 0
        OnClick = OnUserCommand
      end
    end
    object PanelIdentification: TPanel
      Left = 162
      Top = 18
      Width = 256
      Height = 33
      Caption = 'Login'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object EditPassword: TEdit
      Left = 250
      Top = 227
      Width = 156
      Height = 21
      MaxLength = 24
      PasswordChar = '*'
      TabOrder = 3
      OnChange = EditPasswordChange
      OnExit = OnUserCommand
    end
    object EditDatabase: TEdit
      Left = 258
      Top = 65
      Width = 128
      Height = 21
      Alignment = taCenter
      AutoSize = False
      BevelKind = bkTile
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnExit = OnUserCommand
    end
  end
end
