object FnTable: TFnTable
  Left = 418
  Top = 196
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Function Table'
  ClientHeight = 648
  ClientWidth = 700
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 552
    Width = 33
    Height = 13
    Caption = 'Events'
  end
  object Label2: TLabel
    Left = 16
    Top = 584
    Width = 33
    Height = 13
    Caption = 'Picture'
  end
  object Label3: TLabel
    Left = 16
    Top = 620
    Width = 20
    Height = 13
    Caption = 'Flag'
  end
  object Button1: TButton
    Left = 544
    Top = 544
    Width = 145
    Height = 25
    Caption = 'Add Function'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 544
    Top = 584
    Width = 145
    Height = 25
    Caption = 'Save Function Table'
    TabOrder = 1
    OnClick = Button2Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 681
    Height = 425
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 448
    Width = 681
    Height = 73
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 64
    Top = 544
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    Items.Strings = (
      '- NOT USE -'
      'MOUSE ON'
      'MOUSE CLICK')
  end
  object Edit1: TEdit
    Left = 64
    Top = 576
    Width = 113
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 5
    Text = 'Edit1'
  end
  object Button3: TButton
    Left = 184
    Top = 576
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 224
    Top = 576
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 7
    OnClick = Button4Click
  end
  object RadioGroup1: TRadioGroup
    Left = 408
    Top = 536
    Width = 121
    Height = 105
    Caption = 'Mode'
    ItemIndex = 0
    Items.Strings = (
      'Insert Function'
      'Edit Function')
    TabOrder = 8
    OnClick = RadioGroup1Click
  end
  object ComboBox2: TComboBox
    Left = 64
    Top = 616
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
    Items.Strings = (
      'State Picture'
      'State Function')
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 288
    Top = 536
  end
  object Query1: TQuery
    RequestLive = True
    Left = 256
    Top = 536
  end
  object OpenDialog1: TOpenDialog
    Left = 224
    Top = 536
  end
  object PopupMenu1: TPopupMenu
    Left = 328
    Top = 576
    object RemoveItem1: TMenuItem
      Caption = 'Remove Item'
      OnClick = RemoveItem1Click
    end
    object ClearAll1: TMenuItem
      Caption = 'Clear All'
      OnClick = ClearAll1Click
    end
  end
end
