object Frmrequest: TFrmrequest
  Left = 208
  Top = 102
  Width = 694
  Height = 598
  Caption = #3585#3634#3619#3648#3610#3636#3585#3623#3633#3626#3604#3640
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 16
    Width = 649
    Height = 297
    BevelInner = bvLowered
    Color = clMoneyGreen
    TabOrder = 1
    object Label2: TLabel
      Left = 15
      Top = 110
      Width = 38
      Height = 13
      Caption = #3612#3641#3657#3586#3629#3648#3610#3636#3585
    end
    object Label3: TLabel
      Left = 14
      Top = 149
      Width = 38
      Height = 13
      Caption = #3619#3627#3633#3626#3623#3633#3626#3604#3640
    end
    object Label4: TLabel
      Left = 12
      Top = 189
      Width = 56
      Height = 13
      Caption = #3611#3619#3632#3648#3616#3607#3623#3633#3626#3604#3640
    end
    object Label5: TLabel
      Left = 387
      Top = 69
      Width = 21
      Height = 13
      Caption = #3623#3633#3609#3607#3637#3656
    end
    object Label6: TLabel
      Left = 382
      Top = 107
      Width = 46
      Height = 13
      Caption = #3627#3609#3656#3623#3618#3591#3634#3609
    end
    object Label7: TLabel
      Left = 382
      Top = 187
      Width = 32
      Height = 13
      Caption = #3594#3639#3656#3629#3623#3633#3626#3604#3640
    end
    object Label8: TLabel
      Left = 382
      Top = 225
      Width = 33
      Height = 13
      Caption = #3592#3635#3609#3623#3609
    end
    object Label9: TLabel
      Left = 14
      Top = 226
      Width = 43
      Height = 13
      Caption = #3627#3609#3656#3623#3618#3609#3633#3610
    end
    object Label10: TLabel
      Left = 376
      Top = 264
      Width = 85
      Height = 13
      Caption = #3585#3635#3627#3609#3604#3592#3656#3634#3618#3616#3634#3618#3651#3609
    end
    object Label11: TLabel
      Left = 379
      Top = 147
      Width = 56
      Height = 13
      Caption = #3648#3621#3586#3607#3637#3656#3651#3610#3648#3610#3636#3585
    end
    object Label1: TLabel
      Left = 14
      Top = 71
      Width = 57
      Height = 13
      Caption = #3619#3627#3633#3626#3612#3641#3657#3586#3629#3648#3610#3636#3585
    end
    object Label12: TLabel
      Left = 12
      Top = 264
      Width = 87
      Height = 13
      Caption = #3591#3610#3611#3619#3632#3617#3634#3603#3588#3591#3648#3627#3621#3639#3629
    end
    object StaticText1: TStaticText
      Left = 242
      Top = 24
      Width = 123
      Height = 33
      Caption = #3585#3634#3619#3648#3610#3636#3585#3623#3633#3626#3604#3640
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edtstockid: TMaskEdit
      Left = 119
      Top = 145
      Width = 121
      Height = 21
      TabOrder = 1
      OnKeyUp = edtstockidKeyUp
    end
    object edtamureq: TMaskEdit
      Left = 470
      Top = 222
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtstkreq: TMaskEdit
      Left = 470
      Top = 143
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtdate: TEdit
      Left = 470
      Top = 61
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtexpdate: TEdit
      Left = 470
      Top = 261
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object edtstkunt: TMaskEdit
      Left = 120
      Top = 223
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object edtstockname: TMaskEdit
      Left = 470
      Top = 185
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object edtsection: TEdit
      Left = 469
      Top = 104
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object edtofficername: TEdit
      Left = 118
      Top = 105
      Width = 121
      Height = 21
      TabOrder = 9
    end
    object edtstocktype: TEdit
      Left = 119
      Top = 183
      Width = 121
      Height = 21
      TabOrder = 10
    end
    object edtofficerid: TEdit
      Left = 119
      Top = 66
      Width = 121
      Height = 21
      TabOrder = 11
      OnKeyUp = edtofficeridKeyUp
    end
    object edtbud: TEdit
      Left = 120
      Top = 260
      Width = 121
      Height = 21
      TabOrder = 12
    end
  end
  object Panel2: TPanel
    Left = 16
    Top = 334
    Width = 649
    Height = 219
    BevelInner = bvLowered
    Color = clMoneyGreen
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 356
      Top = 177
      Width = 75
      Height = 25
      Caption = #3610#3633#3609#3607#3638#3585
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 79
      Top = 178
      Width = 75
      Height = 25
      Caption = #3648#3614#3636#3656#3617
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 216
      Top = 177
      Width = 75
      Height = 25
      Caption = #3621#3610
      TabOrder = 2
      OnClick = BitBtn4Click
    end
    object StringGrid1: TStringGrid
      Left = 21
      Top = 32
      Width = 609
      Height = 120
      ColCount = 6
      RowCount = 2
      ScrollBars = ssVertical
      TabOrder = 3
      ColWidths = (
        64
        65
        271
        56
        62
        64)
    end
  end
  object Button1: TButton
    Left = 511
    Top = 511
    Width = 107
    Height = 25
    Caption = #3585#3621#3633#3610#3648#3617#3609#3641#3627#3621#3633#3585
    TabOrder = 0
    OnClick = Button1Click
  end
  object initquery: TQuery
    DatabaseName = 'initdb'
    Left = 296
  end
  object DataSource1: TDataSource
    DataSet = initquery
    Left = 368
  end
  object Database1: TDatabase
    AliasName = 'Stock'
    DatabaseName = 'initdb'
    LoginPrompt = False
    Params.Strings = (
      'USERNAME=informix'
      'PASSWORD=informix')
    SessionName = 'Default'
    Left = 232
    Top = 8
  end
end
