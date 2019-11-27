object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 225
  Width = 329
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'ConnectionDef=Postgres_MyTest')
    LoginPrompt = False
    Left = 48
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 136
    Top = 48
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 48
    Top = 32
  end
end
