object Form5: TForm5
  Left = 382
  Top = 300
  Width = 290
  Height = 172
  Caption = 'New Folder'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 25
    Top = 37
    Width = 82
    Height = 14
    Caption = 'Directory Name : '
  end
  object Edit1: TEdit
    Left = 112
    Top = 32
    Width = 121
    Height = 22
    TabOrder = 0
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 1
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 152
    Top = 88
    Width = 75
    Height = 25
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
