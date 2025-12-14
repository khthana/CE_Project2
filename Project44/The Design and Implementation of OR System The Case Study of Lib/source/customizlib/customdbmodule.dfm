object DataModule1: TDataModule1
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 363
  Top = 255
  Height = 257
  Width = 403
  object Database1: TDatabase
    AliasName = 'libary'
    DatabaseName = 'librarysystem'
    LoginPrompt = False
    SessionName = 'Default'
    Left = 48
    Top = 24
  end
  object Query1: TQuery
    DatabaseName = 'librarysystem'
    Left = 112
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 176
    Top = 24
  end
end
