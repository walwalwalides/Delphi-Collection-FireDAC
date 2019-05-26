object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 279
  ClientWidth = 635
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
  object MMMain: TMainMenu
    Left = 136
    Top = 56
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
      Caption = '&Display'
      object N5: TMenuItem
        Action = acDisClients
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
    Left = 49
    Top = 96
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
    object acDisClients: TAction
      Category = 'Display'
      Caption = '&Clients'
      ShortCut = 16451
      OnExecute = acDisClientsExecute
    end
  end
end
