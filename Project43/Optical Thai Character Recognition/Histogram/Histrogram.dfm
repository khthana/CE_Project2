object Form1: TForm1
  Left = 191
  Top = 110
  Width = 616
  Height = 467
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnClick = Open1Click
  PixelsPerInch = 96
  TextHeight = 14
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 521
    Height = 421
    TabOrder = 0
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 517
      Height = 417
      AutoSize = True
    end
  end
  object BitBtn1: TBitBtn
    Left = 536
    Top = 8
    Width = 59
    Height = 49
    Caption = 'Go!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = BitBtn1Click
  end
  object Edit1: TEdit
    Left = 536
    Top = 88
    Width = 57
    Height = 22
    TabOrder = 2
    Text = 'Black Pixel'
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object File1: TMenuItem
      Caption = '&File'
      object Open1: TMenuItem
        Caption = '&Open...'
        OnClick = Open1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
        OnClick = Exit1Click
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 48
    Top = 8
  end
end
