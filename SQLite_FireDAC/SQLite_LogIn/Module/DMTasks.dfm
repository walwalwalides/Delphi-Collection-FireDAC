object DataModuleTasks: TDataModuleTasks
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 265
  Width = 461
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    Left = 64
    Top = 152
  end
  object qrTask: TFDQuery
    Connection = ConnectionMain
    Left = 136
    Top = 72
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 64
    Top = 72
  end
  object ManagerMain: TFDManager
    SilentMode = True
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 136
    Top = 152
  end
end
