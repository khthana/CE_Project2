object Loginfrm: TLoginfrm
  Left = 357
  Top = 178
  Width = 324
  Height = 204
  Caption = 'Loginfrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 14
  object pwd: TLabel
    Left = 24
    Top = 80
    Width = 49
    Height = 20
    Caption = #3619#3627#3633#3626#3612#3656#3634#3609
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 42
    Height = 20
    Caption = #3594#3639#3656#3629#3612#3641#3657#3651#3594#3657
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object password: TEdit
    Left = 112
    Top = 80
    Width = 121
    Height = 22
    PasswordChar = '*'
    TabOrder = 1
  end
  object okbtn: TButton
    Left = 152
    Top = 128
    Width = 57
    Height = 25
    Caption = #3605#3585#3621#3591
    TabOrder = 2
    OnClick = okbtnClick
  end
  object cancelbtn: TButton
    Left = 224
    Top = 128
    Width = 57
    Height = 25
    Caption = #3618#3585#3648#3621#3636#3585
    TabOrder = 3
    OnClick = cancelbtnClick
  end
  object Username: TEdit
    Left = 112
    Top = 40
    Width = 121
    Height = 22
    TabOrder = 0
  end
end
