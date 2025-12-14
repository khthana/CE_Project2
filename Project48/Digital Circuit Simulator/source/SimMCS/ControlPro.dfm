object ControllerProp: TControllerProp
  Left = 660
  Top = 177
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'ControllerProp'
  ClientHeight = 331
  ClientWidth = 583
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
  object Label1: TLabel
    Left = 24
    Top = 220
    Width = 38
    Height = 13
    Caption = 'Hex File'
  end
  object Label2: TLabel
    Left = 24
    Top = 260
    Width = 43
    Height = 13
    Caption = 'Oscillator'
  end
  object Label3: TLabel
    Left = 216
    Top = 260
    Width = 22
    Height = 13
    Caption = 'MHz'
  end
  object Label4: TLabel
    Left = 216
    Top = 180
    Width = 44
    Height = 13
    Caption = 'Controller'
  end
  object Label5: TLabel
    Left = 408
    Top = 180
    Width = 7
    Height = 13
    Caption = 'X'
  end
  object Label6: TLabel
    Left = 496
    Top = 180
    Width = 7
    Height = 13
    Caption = 'Y'
  end
  object Label7: TLabel
    Left = 24
    Top = 180
    Width = 26
    Height = 13
    Caption = 'Serial'
  end
  object Edit1: TEdit
    Left = 80
    Top = 216
    Width = 161
    Height = 21
    Enabled = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 256
    Top = 216
    Width = 121
    Height = 25
    Caption = 'Browse'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 16
    Width = 553
    Height = 145
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 256
    Width = 121
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    Items.Strings = (
      #13'11.0592')
  end
  object Button3: TButton
    Left = 80
    Top = 296
    Width = 121
    Height = 25
    Caption = 'Update'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Edit2: TEdit
    Left = 272
    Top = 176
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 432
    Top = 176
    Width = 49
    Height = 21
    Enabled = False
    TabOrder = 6
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 520
    Top = 176
    Width = 49
    Height = 21
    Enabled = False
    TabOrder = 7
    Text = 'Edit4'
  end
  object Edit5: TEdit
    Left = 80
    Top = 176
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 8
    Text = 'Edit5'
  end
  object Button2: TButton
    Left = 440
    Top = 296
    Width = 121
    Height = 25
    Caption = 'Close'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 392
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 10
    OnClick = Button4Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Hex File (*.Hex)|*.Hex'
    Left = 360
    Top = 256
  end
  object Query1: TQuery
    RequestLive = True
    Left = 416
    Top = 256
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 448
    Top = 256
  end
  object Query2: TQuery
    Left = 480
    Top = 256
  end
  object Query3: TQuery
    Left = 512
    Top = 256
  end
end
