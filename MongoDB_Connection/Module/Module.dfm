object DMModule: TDMModule
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 336
  Width = 594
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'DriverID=Mongo')
    Connected = True
    LoginPrompt = False
    Left = 152
    Top = 88
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 80
    Top = 24
  end
  object FDPhysMongoDriverLink1: TFDPhysMongoDriverLink
    Left = 48
    Top = 104
  end
  object qrLogIn: TFDMongoQuery
    Active = True
    FormatOptions.AssignedValues = [fvStrsTrim2Len]
    FormatOptions.StrsTrim2Len = True
    UpdateOptions.KeyFields = '_id'
    Connection = ConnectionMain
    DatabaseName = 'walid'
    CollectionName = 'LogIn'
    Left = 104
    Top = 176
  end
end
