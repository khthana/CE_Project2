object HexCode: THexCode
  Left = 1843
  Top = 365
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Hex Code Viewing'
  ClientHeight = 581
  ClientWidth = 520
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
    Width = 489
    Height = 393
    ColCount = 17
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 8
    Width = 489
    Height = 153
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 488
    Top = 152
  end
  object Query1: TQuery
    Left = 456
    Top = 152
  end
end
