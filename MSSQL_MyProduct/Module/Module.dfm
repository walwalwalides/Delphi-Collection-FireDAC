object DMMain: TDMMain
  OldCreateOrder = False
  Height = 225
  Width = 329
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_MyProduct')
    Connected = True
    Left = 96
    Top = 80
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 32
    Top = 24
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 96
    Top = 16
  end
end
