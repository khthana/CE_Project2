object ModifyPlaceForm: TModifyPlaceForm
  Left = 157
  Top = 90
  Width = 716
  Height = 542
  Caption = 'Modify Place'
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
  object Label2: TLabel
    Left = 296
    Top = 48
    Width = 55
    Height = 13
    Caption = 'PlaceName'
  end
  object Label3: TLabel
    Left = 296
    Top = 72
    Width = 36
    Height = 13
    Caption = 'Country'
  end
  object Label4: TLabel
    Left = 296
    Top = 96
    Width = 25
    Height = 13
    Caption = 'State'
  end
  object Label5: TLabel
    Left = 296
    Top = 120
    Width = 42
    Height = 13
    Caption = 'Province'
  end
  object Label6: TLabel
    Left = 296
    Top = 144
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object Label7: TLabel
    Left = 296
    Top = 168
    Width = 67
    Height = 13
    Caption = 'ImageFilePath'
  end
  object TLabel
    Left = 448
    Top = 184
    Width = 3
    Height = 13
  end
  object Label1: TLabel
    Left = 444
    Top = 200
    Width = 94
    Height = 13
    Caption = 'Place Property List :'
  end
  object Label8: TLabel
    Left = 296
    Top = 24
    Width = 38
    Height = 13
    Caption = 'PlaceID'
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 16
    Width = 113
    Height = 105
    Caption = 'PlaceProperty'
    TabOrder = 0
    object RdoActivity: TRadioButton
      Left = 16
      Top = 32
      Width = 73
      Height = 12
      Caption = 'Activity'
      TabOrder = 0
      OnClick = RdoActivityClick
    end
    object RdoCategory: TRadioButton
      Left = 16
      Top = 50
      Width = 73
      Height = 17
      Caption = 'Category'
      TabOrder = 1
      OnClick = RdoCategoryClick
    end
    object RdoFestival: TRadioButton
      Left = 16
      Top = 74
      Width = 73
      Height = 17
      Caption = 'Festival'
      TabOrder = 2
    end
  end
  object btnModify: TButton
    Left = 488
    Top = 457
    Width = 99
    Height = 25
    Caption = 'Modify'
    TabOrder = 1
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 208
    Width = 425
    Height = 273
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goRowSelect]
    TabOrder = 2
    OnMouseUp = StringGrid1MouseUp
    ColWidths = (
      110
      128
      131
      118
      169)
  end
  object btnViewPlaceProperty: TButton
    Left = 152
    Top = 24
    Width = 121
    Height = 25
    Caption = 'View'
    TabOrder = 3
    OnClick = btnViewPlacePropertyClick
  end
  object btnAddToPlace: TButton
    Left = 152
    Top = 56
    Width = 121
    Height = 25
    Caption = 'Add to Place'
    TabOrder = 4
    OnClick = btnAddToPlaceClick
  end
  object btnRemoveFromPlace: TButton
    Left = 152
    Top = 88
    Width = 121
    Height = 25
    Caption = 'Remove Form Place'
    TabOrder = 5
  end
  object EdtPlaceName: TEdit
    Left = 376
    Top = 48
    Width = 312
    Height = 21
    TabOrder = 6
  end
  object EdtCountry: TEdit
    Left = 376
    Top = 72
    Width = 312
    Height = 21
    TabOrder = 7
  end
  object EdtState: TEdit
    Left = 376
    Top = 96
    Width = 312
    Height = 21
    TabOrder = 8
  end
  object EdtProvince: TEdit
    Left = 376
    Top = 120
    Width = 312
    Height = 21
    TabOrder = 9
  end
  object EdtDescription: TEdit
    Left = 376
    Top = 144
    Width = 312
    Height = 21
    TabOrder = 10
  end
  object EdtImageFilePath: TEdit
    Left = 376
    Top = 168
    Width = 281
    Height = 21
    TabOrder = 11
  end
  object btnOpenFile: TButton
    Left = 663
    Top = 168
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 12
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 494
    Width = 708
    Height = 21
    Panels = <>
    SimplePanel = False
  end
  object ListBox1: TListBox
    Left = 448
    Top = 224
    Width = 249
    Height = 217
    ItemHeight = 13
    TabOrder = 14
    OnMouseUp = ListBox1MouseUp
  end
  object btnClose: TButton
    Left = 592
    Top = 456
    Width = 97
    Height = 25
    Caption = 'Close'
    TabOrder = 15
    OnClick = btnCloseClick
  end
  object EdtPlaceID: TEdit
    Left = 376
    Top = 24
    Width = 313
    Height = 21
    Enabled = False
    TabOrder = 16
  end
end
