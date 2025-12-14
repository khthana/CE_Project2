object ChangeRatefrm: TChangeRatefrm
  Left = 207
  Top = 88
  Width = 387
  Height = 202
  Caption = 'ChangeRatefrm'
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
    Left = 16
    Top = 32
    Width = 129
    Height = 20
    AutoSize = False
    Caption = #3629#3633#3605#3619#3634#3588#3656#3634#3610#3619#3636#3585#3634#3619#3611#3633#3592#3592#3640#3610#3633#3609
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RateLabel: TLabel
    Left = 192
    Top = 32
    Width = 9
    Height = 20
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 80
    Width = 112
    Height = 20
    Caption = #3629#3633#3605#3619#3634#3588#3656#3634#3610#3619#3636#3585#3634#3619#3651#3627#3617#3656
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 288
    Top = 32
    Width = 40
    Height = 20
    AutoSize = False
    Caption = #3626#3605#3634#3591#3588#3660
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object RateEdit: TEdit
    Left = 144
    Top = 80
    Width = 121
    Height = 22
    TabOrder = 0
  end
  object Confirmbtn: TButton
    Left = 208
    Top = 128
    Width = 75
    Height = 25
    Caption = #3648#3611#3621#3637#3656#3618#3609
    TabOrder = 1
    OnClick = ConfirmbtnClick
  end
  object Button2: TButton
    Left = 304
    Top = 128
    Width = 75
    Height = 25
    Caption = #3618#3585#3648#3621#3636#3585
    TabOrder = 2
    OnClick = Button2Click
  end
end
