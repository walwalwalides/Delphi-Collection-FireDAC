object DM_RepositorySysPostgreSQL: TDM_RepositorySysPostgreSQL
  OldCreateOrder = False
  Height = 190
  Width = 215
  object QryGenreColorPostgreSQL: TFDQuery
    Connection = DM_RepositoryPostgreSQL.FDConnPostgreSQL
    Left = 112
    Top = 15
  end
  object QryUserInfoPostgreSQL: TFDQuery
    Connection = DM_RepositoryPostgreSQL.FDConnPostgreSQL
    SQL.Strings = (
      '')
    Left = 56
    Top = 111
  end
end
