object Form5: TForm5
  Left = 158
  Top = 152
  Width = 418
  Height = 218
  Caption = 'Open'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 168
    Top = 152
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = Button1Click
  end
  object ListBox1: TListBox
    Left = 24
    Top = 16
    Width = 361
    Height = 129
    ItemHeight = 13
    TabOrder = 1
  end
  object DataSource1: TDataSource
    DataSet = report
    Left = 32
    Top = 16
  end
  object report: TTable
    Active = True
    DatabaseName = 'local database'
    TableName = 'REPORT'
    Top = 16
  end
end
