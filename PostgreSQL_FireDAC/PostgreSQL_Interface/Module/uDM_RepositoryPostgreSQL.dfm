object DM_RepositoryPostgreSQL: TDM_RepositoryPostgreSQL
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 258
  object FDConnPostgreSQL: TFDConnection
    Params.Strings = (
      'ConnectionDef=Postgres_MyTest')
    Connected = True
    LoginPrompt = False
    Left = 48
    Top = 96
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 56
    Top = 48
  end
  object FDManagerPostgreSQL: TFDManager
    SilentMode = True
    FormatOptions.AssignedValues = [fvMapRules]
    FormatOptions.OwnMapRules = True
    FormatOptions.MapRules = <>
    Active = True
    Left = 49
    Top = 168
  end
end
