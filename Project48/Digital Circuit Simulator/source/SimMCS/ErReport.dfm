object ErrReport: TErrReport
  Left = 759
  Top = 365
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'ErrReport'
  ClientHeight = 413
  ClientWidth = 482
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
    Width = 449
    Height = 345
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
    Left = 336
    Top = 376
    Width = 129
    Height = 25
    Caption = 'Close'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Query1: TQuery
    Left = 8
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 40
    Top = 8
  end
end
