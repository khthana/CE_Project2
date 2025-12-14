object Form4: TForm4
  Left = 300
  Top = 125
  Width = 382
  Height = 398
  Caption = 'Setting'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -10
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 15
    Top = 101
    Width = 47
    Height = 14
    Caption = 'Location :'
  end
  object Label2: TLabel
    Left = 14
    Top = 25
    Width = 96
    Height = 14
    Caption = 'Image Storage rate :'
  end
  object Label3: TLabel
    Left = 195
    Top = 25
    Width = 71
    Height = 14
    Caption = 'Second/Frame'
  end
  object Label4: TLabel
    Left = 13
    Top = 64
    Width = 104
    Height = 14
    Caption = 'Compresstion Quality :'
  end
  object Label5: TLabel
    Left = 196
    Top = 64
    Width = 37
    Height = 14
    Caption = 'Percent'
  end
  object DirectoryListBox1: TDirectoryListBox
    Left = 21
    Top = 138
    Width = 162
    Height = 190
    ItemHeight = 16
    TabOrder = 0
    OnChange = DirectoryListBox1Change
  end
  object DriveComboBox1: TDriveComboBox
    Left = 21
    Top = 334
    Width = 162
    Height = 20
    TabOrder = 1
    OnChange = DriveComboBox1Change
  end
  object Edit1: TEdit
    Left = 65
    Top = 98
    Width = 296
    Height = 22
    Color = clWhite
    ReadOnly = True
    TabOrder = 2
  end
  object Bitn_Ok: TBitBtn
    Left = 232
    Top = 224
    Width = 75
    Height = 25
    TabOrder = 3
    OnClick = Bitn_OkClick
    Kind = bkOK
  end
  object Btn_NewFolder: TButton
    Left = 232
    Top = 184
    Width = 75
    Height = 25
    Caption = 'New Folder'
    TabOrder = 4
    OnClick = Btn_NewFolderClick
  end
  object SpinEdit1: TSpinEdit
    Left = 122
    Top = 21
    Width = 65
    Height = 23
    EditorEnabled = False
    MaxLength = 20
    MaxValue = 20
    MinValue = 4
    TabOrder = 5
    Value = 4
  end
  object SpinEdit2: TSpinEdit
    Left = 122
    Top = 61
    Width = 65
    Height = 23
    MaxValue = 100
    MinValue = 60
    TabOrder = 6
    Value = 85
  end
  object Bitn_Cancel: TBitBtn
    Left = 232
    Top = 264
    Width = 75
    Height = 25
    TabOrder = 7
    OnClick = Bitn_CancelClick
    Kind = bkCancel
  end
  object CheckBox1: TCheckBox
    Left = 216
    Top = 144
    Width = 97
    Height = 17
    Caption = 'Default Directory '
    TabOrder = 8
  end
  object pathName: TDirectoryListBox
    Left = 280
    Top = 16
    Width = 81
    Height = 57
    ItemHeight = 16
    TabOrder = 9
    Visible = False
  end
end
