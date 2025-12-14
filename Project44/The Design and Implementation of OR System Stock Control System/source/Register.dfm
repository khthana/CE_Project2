object Frmregis: TFrmregis
  Left = 180
  Top = 177
  Width = 688
  Height = 524
  Caption = #3610#3633#3609#3607#3638#3585#3586#3657#3629#3617#3641#3621#3607#3632#3648#3610#3637#3618#3609#3623#3633#3626#3604#3640
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 16
    Top = 15
    Width = 649
    Height = 233
    BevelInner = bvLowered
    Color = clMoneyGreen
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 74
      Width = 65
      Height = 13
      Caption = #3648#3621#3586#3607#3637#3656#3651#3610#3626#3656#3591#3586#3629#3591
    end
    object Label2: TLabel
      Left = 26
      Top = 150
      Width = 56
      Height = 13
      Caption = #3611#3619#3632#3648#3616#3607#3623#3633#3626#3604#3640
    end
    object Label3: TLabel
      Left = 27
      Top = 113
      Width = 38
      Height = 13
      Caption = #3619#3627#3633#3626#3623#3633#3626#3604#3640
    end
    object Label4: TLabel
      Left = 29
      Top = 194
      Width = 33
      Height = 13
      Caption = #3592#3635#3609#3623#3609
    end
    object Label5: TLabel
      Left = 440
      Top = 34
      Width = 21
      Height = 13
      Caption = #3623#3633#3609#3607#3637#3656
    end
    object Label6: TLabel
      Left = 371
      Top = 110
      Width = 32
      Height = 13
      Caption = #3594#3639#3656#3629#3623#3633#3626#3604#3640
    end
    object Label7: TLabel
      Left = 371
      Top = 150
      Width = 43
      Height = 13
      Caption = #3627#3609#3656#3623#3618#3609#3633#3610
    end
    object Label8: TLabel
      Left = 371
      Top = 198
      Width = 64
      Height = 13
      Caption = #3619#3634#3588#3634#3605#3656#3629#3627#3609#3656#3623#3618
    end
    object Label9: TLabel
      Left = 371
      Top = 73
      Width = 41
      Height = 13
      Caption = #3594#3639#3656#3629#3610#3619#3636#3625#3633#3607
    end
    object StaticText1: TStaticText
      Left = 216
      Top = 24
      Width = 189
      Height = 33
      Caption = #3585#3634#3619#3621#3591#3607#3632#3648#3610#3637#3618#3609#3623#3633#3626#3604#3640
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object cmbstocktypeid: TComboBox
      Left = 96
      Top = 148
      Width = 124
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Items.Strings = (
        #3623#3633#3626#3604#3640#3626#3635#3609#3633#3585#3591#3634#3609
        #3623#3633#3626#3604#3640#3588#3619#3633#3623#3648#3619#3639#3629#3609
        #3623#3633#3626#3604#3640#3588#3629#3617#3614#3636#3623#3648#3605#3629#3619#3660)
    end
    object edtppu: TMaskEdit
      Left = 448
      Top = 195
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtstockid: TMaskEdit
      Left = 96
      Top = 111
      Width = 121
      Height = 21
      TabOrder = 3
      OnKeyUp = edtstockidKeyUp
    end
    object edtamurcv: TMaskEdit
      Left = 96
      Top = 192
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtinvid: TMaskEdit
      Left = 96
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object cmbcompany: TComboBox
      Left = 448
      Top = 72
      Width = 145
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Items.Strings = (
        #3626#3640#3594#3634#3586#3609#3626#3656#3591' '
        'InfoPress'
        'Empyrian Instella Transport'
        '')
    end
    object edtstkunt: TEdit
      Left = 448
      Top = 152
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object edtstockname: TEdit
      Left = 448
      Top = 112
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object edtdate: TEdit
      Left = 472
      Top = 32
      Width = 121
      Height = 21
      TabOrder = 9
    end
  end
  object Panel2: TPanel
    Left = 16
    Top = 257
    Width = 649
    Height = 225
    BevelInner = bvLowered
    Color = clMoneyGreen
    TabOrder = 1
    object BitBtn1: TBitBtn
      Left = 378
      Top = 184
      Width = 75
      Height = 25
      Caption = #3610#3633#3609#3607#3638#3585
      TabOrder = 0
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 66
      Top = 184
      Width = 75
      Height = 25
      Caption = #3648#3614#3636#3656#3617
      TabOrder = 1
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 215
      Top = 184
      Width = 75
      Height = 25
      Caption = #3621#3610
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object clobtn: TBitBtn
      Left = 521
      Top = 184
      Width = 81
      Height = 25
      Cancel = True
      Caption = #3611#3636#3604
      TabOrder = 3
      OnClick = clobtnClick
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
        F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
        000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
        338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
        45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
        3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
        F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
        000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
        338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
        4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
        8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
        333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
        0000}
      NumGlyphs = 2
    end
    object StringGrid1: TStringGrid
      Left = 32
      Top = 16
      Width = 593
      Height = 145
      RowCount = 2
      ScrollBars = ssVertical
      TabOrder = 4
      ColWidths = (
        64
        76
        287
        58
        81)
      RowHeights = (
        24
        24)
    end
  end
end
