object DevComp: TDevComp
  Left = 446
  Top = 177
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'DevComp'
  ClientHeight = 394
  ClientWidth = 790
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
  object Label1: TLabel
    Left = 632
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Filter'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 648
    Top = 152
    Width = 121
    Height = 121
    Stretch = True
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 609
    Height = 377
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnKeyUp = DBGrid1KeyUp
  end
  object Button1: TButton
    Left = 632
    Top = 288
    Width = 145
    Height = 25
    Caption = '<< Create New Object'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 632
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    OnKeyPress = Edit1KeyPress
  end
  object Button2: TButton
    Left = 632
    Top = 72
    Width = 145
    Height = 25
    Caption = 'Edit Object'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 632
    Top = 112
    Width = 145
    Height = 25
    Caption = 'Remove Object >>'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 632
    Top = 360
    Width = 145
    Height = 25
    Caption = 'Exit Program'
    TabOrder = 5
    OnClick = Button4Click
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 664
    Top = 320
  end
  object Query1: TQuery
    RequestLive = True
    Left = 632
    Top = 320
  end
end
