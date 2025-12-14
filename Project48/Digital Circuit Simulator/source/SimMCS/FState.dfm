object FindState: TFindState
  Left = 2083
  Top = 98
  Width = 269
  Height = 193
  Caption = 'FindState'
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
  object Button1: TButton
    Left = 16
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Query1: TQuery
    RequestLive = True
    Left = 16
    Top = 16
  end
  object Query2: TQuery
    RequestLive = True
    Left = 48
    Top = 16
  end
  object Query3: TQuery
    RequestLive = True
    Left = 80
    Top = 16
  end
  object Query4: TQuery
    RequestLive = True
    Left = 112
    Top = 16
  end
  object Query5: TQuery
    RequestLive = True
    Left = 144
    Top = 16
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 1
    OnTimer = Timer1Timer
    Left = 176
    Top = 16
  end
end
