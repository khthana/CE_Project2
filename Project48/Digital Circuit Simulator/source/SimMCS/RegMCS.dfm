object MCSReg: TMCSReg
  Left = 2188
  Top = 6
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Register Viewing'
  ClientHeight = 581
  ClientWidth = 360
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
  object DBGrid1: TDBGrid
    Left = 16
    Top = 8
    Width = 329
    Height = 153
    DataSource = DataSource1
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 176
    Width = 329
    Height = 393
    ColCount = 4
    RowCount = 27
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 1
  end
  object Query1: TQuery
    Left = 288
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 320
  end
end
