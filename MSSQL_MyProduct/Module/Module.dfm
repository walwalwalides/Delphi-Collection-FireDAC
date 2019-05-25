object DMMain: TDMMain
  OldCreateOrder = False
  Height = 225
  Width = 329
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_MyProduct')
    Left = 136
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 64
    Top = 48
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 176
    Top = 32
  end
end
