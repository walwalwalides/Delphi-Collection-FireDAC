object DMModule: TDMModule
  OldCreateOrder = False
  Height = 284
  Width = 461
  object DS_Products: TDataSource
    DataSet = tblProducts
    Left = 256
    Top = 120
  end
  object DS_Typs: TDataSource
    DataSet = tblTyps
    Left = 200
    Top = 112
  end
  object DS_Marks: TDataSource
    DataSet = tblMarks
    Left = 320
    Top = 128
  end
  object ConnectionMain: TFDConnection
    Params.Strings = (
      'ConnectionDef=MSSQL_MyProduct')
    Connected = True
    LoginPrompt = False
    Left = 96
    Top = 208
  end
  object tblProducts: TFDTable
    IndexFieldNames = 'ProductID'
    Connection = ConnectionMain
    UpdateOptions.UpdateTableName = 'DB_Product..Products'
    TableName = 'DB_Product..Products'
    Left = 192
    Top = 176
    object tblProductsProductID: TStringField
      FieldName = 'ProductID'
      Origin = 'ProductID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object tblProductsTypID: TIntegerField
      FieldName = 'TypID'
      Origin = 'TypID'
      Required = True
    end
    object tblProductsMarkID: TIntegerField
      FieldName = 'MarkID'
      Origin = 'MarkID'
      Required = True
    end
    object tblProductsModel: TStringField
      FieldName = 'Model'
      Origin = 'Model'
      Required = True
      Size = 40
    end
    object tblProductsSerialNumber: TStringField
      FieldName = 'SerialNumber'
      Origin = 'SerialNumber'
      Required = True
      Size = 40
    end
    object tblProductsPrice: TBCDField
      FieldName = 'Price'
      Origin = 'Price'
      Required = True
      Precision = 10
      Size = 2
    end
  end
  object tblTyps: TFDTable
    AfterOpen = tblTypsAfterOpen
    IndexFieldNames = 'TypID'
    Connection = ConnectionMain
    UpdateOptions.UpdateTableName = 'Typs'
    TableName = 'Typs'
    Left = 264
    Top = 184
    object tblTypsTypID: TFDAutoIncField
      FieldName = 'TypID'
      Origin = 'TypID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblTypsTypDescription: TStringField
      FieldName = 'TypDescription'
      Origin = 'TypDescription'
      Required = True
      Size = 40
    end
  end
  object tblMarks: TFDTable
    AfterOpen = tblMarksAfterOpen
    IndexFieldNames = 'MarkID'
    Connection = ConnectionMain
    UpdateOptions.UpdateTableName = 'Marks'
    TableName = 'Marks'
    Left = 328
    Top = 184
    object tblMarksMarkID: TFDAutoIncField
      FieldName = 'MarkID'
      Origin = 'MarkID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object tblMarksMarkDescription: TStringField
      FieldName = 'MarkDescription'
      Origin = 'MarkDescription'
      Required = True
      Size = 40
    end
    object tblMarksMarkSiteWeb: TStringField
      FieldName = 'MarkSiteWeb'
      Origin = 'MarkSiteWeb'
      Size = 40
    end
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 184
    Top = 56
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 112
    Top = 144
  end
end
