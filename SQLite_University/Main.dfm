object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'University'
  ClientHeight = 508
  ClientWidth = 627
  Color = clBtnFace
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
  object ActListMain: TActionList
    Left = 25
    Top = 328
    object actClass: TAction
      Category = 'View'
      Caption = 'Class'
      ShortCut = 16451
      OnExecute = actClassExecute
    end
    object actClear: TAction
      Category = 'Action'
      Caption = 'Clear'
      ShortCut = 16451
    end
    object actSolution: TAction
      Category = 'Action'
      Caption = 'Solution'
      ShortCut = 16452
    end
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
    object actStudent: TAction
      Category = 'View'
      Caption = 'Student'
      ShortCut = 16467
      OnExecute = actStudentExecute
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
  end
  object MMMain: TMainMenu
    Left = 32
    Top = 392
    object File1: TMenuItem
      Caption = 'File'
      object OpenFiles1: TMenuItem
        Action = actOpenFile
      end
      object OpenFolders1: TMenuItem
        Action = actOpenFolder
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Action = actExit
      end
    end
    object View1: TMenuItem
      Caption = 'View'
      object Class1: TMenuItem
        Action = actClass
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Refresh1: TMenuItem
        Action = actStudent
      end
    end
    object Option1: TMenuItem
      Caption = 'Option'
      object actOption1: TMenuItem
        Action = actOption
      end
    end
    object A2: TMenuItem
      Caption = 'About'
      object actAbout1: TMenuItem
        Action = actAbout
      end
    end
  end
end
