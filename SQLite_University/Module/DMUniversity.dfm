object DataModuleUniversity: TDataModuleUniversity
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 265
  Width = 461
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 104
    Top = 64
  end
  object qrTask: TFDQuery
    Connection = ConnectionMain
    Left = 88
    Top = 128
  end
  object SQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 32
    Top = 104
  end
  object ManagerMain: TFDManager
    SilentMode = True
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 40
    Top = 160
  end
  object WaitCursorSQLite: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 120
    Top = 40
  end
  object ScriptMain: TFDScript
    SQLScripts = <>
    Connection = ConnectionMain
    Params = <>
    Macros = <>
    Left = 56
    Top = 48
  end
end
