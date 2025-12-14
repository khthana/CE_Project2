object DataModule1: TDataModule1
  OldCreateOrder = False
  Left = 97
  Top = 95
  Height = 468
  Width = 662
  object Database1: TDatabase
    AliasName = 'Stock'
    Connected = True
    DatabaseName = 'Stock'
    LoginPrompt = False
    Params.Strings = (
      'USERNAME=informix'
      'PASSWORD=informix')
    SessionName = 'Default'
    Left = 8
    Top = 8
  end
  object company_DS: TDataSource
    DataSet = company_que
    Left = 128
    Top = 8
  end
  object officer_DS: TDataSource
    DataSet = officer_que
    Left = 136
    Top = 64
  end
  object pay_detail_DS: TDataSource
    DataSet = pay_detail_que
    Left = 136
    Top = 120
  end
  object receive_detail_DS: TDataSource
    DataSet = receive_detail_que
    Left = 136
    Top = 176
  end
  object request_detail_DS: TDataSource
    DataSet = request_detail_que
    Left = 136
    Top = 232
  end
  object request_limit_DS: TDataSource
    DataSet = request_limit_que
    Left = 152
    Top = 288
  end
  object section_DS: TDataSource
    DataSet = section_que
    Left = 320
    Top = 24
  end
  object section_with_budget_DS: TDataSource
    DataSet = section_with_budget_que
    Left = 336
    Top = 88
  end
  object section_with_limit_DS: TDataSource
    DataSet = section_with_limit_que
    Left = 336
    Top = 152
  end
  object stock_DS: TDataSource
    DataSet = stock_que
    Left = 344
    Top = 224
  end
  object stock_count_DS: TDataSource
    DataSet = stock_count_que
    Left = 352
    Top = 296
  end
  object stock_pay_DS: TDataSource
    DataSet = stock_pay_que
    Left = 456
    Top = 24
  end
  object stock_receive_DS: TDataSource
    DataSet = stock_receive_que
    Left = 512
    Top = 112
  end
  object stock_request_DS: TDataSource
    DataSet = stock_request_que
    Left = 536
    Top = 184
  end
  object stock_type_DS: TDataSource
    DataSet = stock_type_que
    Left = 568
    Top = 256
  end
  object company_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from company')
    Left = 80
    Top = 24
  end
  object officer_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from officer')
    Left = 88
    Top = 88
  end
  object pay_detail_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from pay_detail')
    Left = 72
    Top = 136
  end
  object receive_detail_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from receive_detail')
    Left = 72
    Top = 200
  end
  object request_detail_que: TQuery
    DatabaseName = 'Stock'
    RequestLive = True
    SQL.Strings = (
      'select * from request_detail')
    Left = 80
    Top = 256
  end
  object request_limit_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from request_limit')
    Left = 80
    Top = 312
  end
  object section_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from section')
    Left = 272
    Top = 40
  end
  object section_with_budget_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from section_with_budget')
    Left = 272
    Top = 112
  end
  object section_with_limit_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from section_with_limit')
    Left = 272
    Top = 168
  end
  object stock_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from stock')
    Left = 288
    Top = 232
  end
  object stock_count_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from stock_count')
    Left = 280
    Top = 304
  end
  object stock_pay_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from stock_pay')
    Left = 416
    Top = 32
  end
  object stock_receive_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from stock_receive')
    Left = 472
    Top = 112
  end
  object stock_request_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from stock_request')
    Left = 472
    Top = 192
  end
  object stock_type_que: TQuery
    DatabaseName = 'Stock'
    SQL.Strings = (
      'select * from stock_type')
    Left = 496
    Top = 264
  end
  object regissrc: TDataSource
    DataSet = regisquery
    Left = 376
    Top = 368
  end
  object regisquery: TQuery
    DatabaseName = 'Stock'
    DataSource = receive_detail_DS
    SQL.Strings = (
      'Select * from request_detail ')
    Left = 312
    Top = 368
  end
  object UpdateSQL1: TUpdateSQL
    Left = 88
    Top = 384
  end
  object orderquery: TQuery
    DatabaseName = 'Stock'
    DataSource = company_DS
    Left = 480
    Top = 360
  end
  object oredersrc: TDataSource
    DataSet = orderquery
    Left = 552
    Top = 376
  end
end
