object Form2: TForm2
  Left = 138
  Top = 100
  Width = 665
  Height = 455
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 14
  object ScrollBox1: TScrollBox
    Left = 16
    Top = 16
    Width = 625
    Height = 361
    TabOrder = 0
    object Image1: TImage
      Left = 24
      Top = 16
      Width = 577
      Height = 321
    end
  end
  object Button1: TButton
    Left = 288
    Top = 392
    Width = 75
    Height = 25
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
end
