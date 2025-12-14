object IncBalfrm: TIncBalfrm
  Left = 328
  Top = 225
  Width = 357
  Height = 187
  Caption = 'IncBalfrm'
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
  TextHeight = 14
  object Label1: TLabel
    Left = 40
    Top = 40
    Width = 94
    Height = 20
    Caption = #3618#3629#3604#3648#3591#3636#3609#3588#3591#3648#3627#3621#3639#3629
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object bal: TLabel
    Left = 168
    Top = 40
    Width = 31
    Height = 20
    Caption = '0.00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 232
    Top = 40
    Width = 40
    Height = 20
    Caption = #3626#3605#3634#3591#3588#3660
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 88
    Width = 144
    Height = 20
    Caption = #3592#3635#3609#3623#3609#3648#3591#3636#3609#3607#3637#3656#3605#3657#3629#3591#3585#3634#3619#3648#3605#3636#3617
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object bal2: TEdit
    Left = 184
    Top = 88
    Width = 121
    Height = 22
    MaxLength = 6
    TabOrder = 0
  end
  object confirmbtn: TButton
    Left = 192
    Top = 128
    Width = 49
    Height = 25
    Caption = #3648#3605#3636#3617
    TabOrder = 1
    OnClick = confirmbtnClick
  end
  object cancelbtn: TButton
    Left = 256
    Top = 128
    Width = 49
    Height = 25
    Caption = #3611#3636#3604
    TabOrder = 2
    OnClick = cancelbtnClick
  end
end
