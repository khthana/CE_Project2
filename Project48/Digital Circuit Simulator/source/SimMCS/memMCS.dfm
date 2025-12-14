object Memory: TMemory
  Left = 1290
  Top = 6
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Memory Viewing'
  ClientHeight = 581
  ClientWidth = 359
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 16
    Top = 176
    Width = 329
    Height = 393
    ColCount = 10
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 8
    Width = 329
    Height = 153
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 320
    Top = 8
  end
  object Query1: TQuery
    Left = 288
    Top = 8
  end
  object Query2: TQuery
    Left = 320
    Top = 40
  end
end
