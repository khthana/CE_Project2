object ECComp: TECComp
  Left = 843
  Top = 656
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'ECComp'
  ClientHeight = 291
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 24
    Height = 13
    Caption = 'Type'
  end
  object Label3: TLabel
    Left = 16
    Top = 216
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label6: TLabel
    Left = 16
    Top = 120
    Width = 49
    Height = 13
    Caption = 'BmpName'
  end
  object Label7: TLabel
    Left = 16
    Top = 88
    Width = 20
    Height = 13
    Caption = 'Pins'
  end
  object Image1: TImage
    Left = 272
    Top = 24
    Width = 130
    Height = 130
    Stretch = True
  end
  object Label8: TLabel
    Left = 16
    Top = 184
    Width = 41
    Height = 13
    Caption = 'Function'
  end
  object Label9: TLabel
    Left = 16
    Top = 152
    Width = 48
    Height = 13
    Caption = 'Pin  Table'
  end
  object Edit1: TEdit
    Left = 80
    Top = 16
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    OnChange = Edit1Change
  end
  object ComboBox1: TComboBox
    Left = 80
    Top = 48
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'ComboBox1'
    OnChange = Edit1Change
  end
  object Edit2: TEdit
    Left = 80
    Top = 208
    Width = 321
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
    OnChange = Edit1Change
  end
  object Edit3: TEdit
    Left = 80
    Top = 112
    Width = 113
    Height = 21
    Enabled = False
    TabOrder = 4
    Text = 'Edit3'
    OnChange = Edit1Change
  end
  object Edit6: TEdit
    Left = 80
    Top = 80
    Width = 145
    Height = 21
    MaxLength = 3
    TabOrder = 2
    Text = '0'
    OnChange = Edit1Change
    OnKeyPress = Edit4KeyPress
  end
  object Button1: TButton
    Left = 208
    Top = 112
    Width = 49
    Height = 25
    Cursor = crHandPoint
    Caption = 'Edit ...'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit7: TEdit
    Left = 80
    Top = 176
    Width = 113
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 10
    Text = 'Edit7'
    OnChange = Edit1Change
  end
  object Edit8: TEdit
    Left = 80
    Top = 144
    Width = 113
    Height = 21
    Enabled = False
    ReadOnly = True
    TabOrder = 9
    Text = 'Edit8'
    OnChange = Edit1Change
  end
  object Button2: TButton
    Left = 40
    Top = 248
    Width = 153
    Height = 25
    Caption = 'Create  Component'
    TabOrder = 8
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 240
    Top = 248
    Width = 153
    Height = 25
    Caption = 'Cancel  Component'
    TabOrder = 11
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 208
    Top = 176
    Width = 49
    Height = 25
    Cursor = crHandPoint
    Caption = 'Edit ...'
    TabOrder = 6
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 208
    Top = 144
    Width = 49
    Height = 25
    Cursor = crHandPoint
    Caption = 'Edit ...'
    TabOrder = 7
    OnClick = Button5Click
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Bitmaps (*.BMP)|*.bmp'
    Left = 272
    Top = 168
  end
  object Query1: TQuery
    RequestLive = True
    Left = 304
    Top = 168
  end
end
