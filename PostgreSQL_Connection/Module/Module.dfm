object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 225
  Width = 329
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'ConnectionDef=Postgres_MyTest')
    Connected = True
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
    VendorHome = 'C:\Program Files (x86)\PostgreSQL\10\'
    VendorLib = 'libpq.dll'
    Left = 48
    Top = 32
  end
end
