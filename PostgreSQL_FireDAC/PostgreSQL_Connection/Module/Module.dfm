object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 225
  Width = 329
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'User_Name=walwalwalides'
      'ConnectionDef=Postgres_MyTest')
    LoginPrompt = False
    Left = 40
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 144
    Top = 32
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 48
    Top = 32
  end
end
