object PinsComp: TPinsComp
  Left = 203
  Top = 264
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'PinsComp'
  ClientHeight = 689
  ClientWidth = 608
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
    Left = 336
    Top = 384
    Width = 28
    Height = 13
    Caption = 'Name'
  end
  object Label2: TLabel
    Left = 336
    Top = 416
    Width = 24
    Height = 13
    Caption = 'Type'
  end
  object Label3: TLabel
    Left = 336
    Top = 448
    Width = 37
    Height = 13
    Caption = 'Block X'
  end
  object Label4: TLabel
    Left = 336
    Top = 480
    Width = 37
    Height = 13
    Caption = 'Block Y'
  end
  object Label5: TLabel
    Left = 336
    Top = 512
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Button1: TButton
    Left = 328
    Top = 648
    Width = 121
    Height = 25
    Caption = 'Save Pin Table'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 472
    Top = 648
    Width = 123
    Height = 25
    Caption = 'Cancel'
    TabOrder = 1
    OnClick = Button2Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 593
    Height = 345
    ColCount = 7
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 2
    OnClick = StringGrid1Click
    OnKeyDown = StringGrid1KeyDown
  end
  object Edit1: TEdit
    Left = 408
    Top = 376
    Width = 73
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object Edit2: TEdit
    Left = 408
    Top = 440
    Width = 73
    Height = 21
    Enabled = False
    TabOrder = 4
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 408
    Top = 472
    Width = 73
    Height = 21
    Enabled = False
    TabOrder = 5
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 408
    Top = 504
    Width = 185
    Height = 21
    TabOrder = 6
    Text = 'Edit4'
  end
  object ComboBox1: TComboBox
    Left = 408
    Top = 408
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
    Items.Strings = (
      #13'NC'
      'IN'
      'OUT'
      'BIDIRECTION')
  end
  object Button3: TButton
    Left = 328
    Top = 544
    Width = 265
    Height = 25
    Caption = 'Update'
    TabOrder = 8
    OnClick = Button3Click
  end
  object ScrollBox1: TScrollBox
    Left = 16
    Top = 376
    Width = 297
    Height = 297
    TabOrder = 9
    OnMouseMove = ScrollBox1MouseMove
    object Image1: TImage
      Left = 16
      Top = 16
      Width = 105
      Height = 105
      Cursor = crCross
      OnClick = Image1Click
      OnMouseMove = Image1MouseMove
    end
  end
  object Query1: TQuery
    RequestLive = True
    Left = 488
    Top = 376
  end
  object Query2: TQuery
    RequestLive = True
    Left = 520
    Top = 376
  end
end
