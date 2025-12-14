object RouteTable: TRouteTable
  Left = 673
  Top = 365
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Routing Table'
  ClientHeight = 565
  ClientWidth = 542
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 505
    Height = 497
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 392
    Top = 528
    Width = 131
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Query1: TQuery
    Left = 16
    Top = 16
  end
  object Query2: TQuery
    RequestLive = True
    Left = 80
    Top = 16
  end
  object Query3: TQuery
    RequestLive = True
    Left = 112
    Top = 16
  end
  object Query4: TQuery
    RequestLive = True
    Left = 48
    Top = 16
  end
  object Query5: TQuery
    Left = 144
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 280
    Top = 16
  end
  object Timer2: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer2Timer
    Left = 312
    Top = 16
  end
  object Timer0: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer0Timer
    Left = 344
    Top = 16
  end
  object Timer3: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer3Timer
    Left = 376
    Top = 16
  end
  object Query6: TQuery
    RequestLive = True
    Left = 176
    Top = 16
  end
  object Query7: TQuery
    RequestLive = True
    Left = 208
    Top = 16
  end
  object Timer4: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer4Timer
    Left = 408
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = Query7
    Left = 240
    Top = 16
  end
  object Query8: TQuery
    RequestLive = True
    Left = 16
    Top = 520
  end
end
