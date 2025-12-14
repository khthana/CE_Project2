object CardInfoFrm: TCardInfoFrm
  Left = 188
  Top = 16
  Width = 544
  Height = 491
  Caption = #3586#3657#3629#3617#3641#3621#3626#3656#3623#3609#3605#3633#3623
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 24
    Top = 24
    Width = 361
    Height = 217
    Caption = #3586#3657#3629#3617#3641#3621#3626#3656#3623#3609#3605#3633#3623
    TabOrder = 1
    object Label1: TLabel
      Left = 56
      Top = 24
      Width = 17
      Height = 20
      Caption = #3594#3639#3656#3629
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 24
      Top = 184
      Width = 83
      Height = 20
      Caption = #3648#3610#3629#3619#3660#3650#3607#3619#3624#3633#3614#3607#3660
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 40
      Top = 56
      Width = 51
      Height = 20
      Caption = #3609#3634#3617#3626#3585#3640#3621
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 48
      Top = 88
      Width = 26
      Height = 20
      Caption = #3607#3637#3656#3629#3618#3641#3656
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object NameEdit: TEdit
      Left = 128
      Top = 24
      Width = 129
      Height = 22
      MaxLength = 20
      ReadOnly = True
      TabOrder = 0
    end
    object TelEdit: TEdit
      Left = 128
      Top = 184
      Width = 121
      Height = 22
      MaxLength = 9
      ReadOnly = True
      TabOrder = 1
    end
    object SurnameEdit: TEdit
      Left = 128
      Top = 56
      Width = 129
      Height = 22
      ReadOnly = True
      TabOrder = 2
    end
    object AddressMemo: TMemo
      Left = 128
      Top = 88
      Width = 153
      Height = 89
      ReadOnly = True
      TabOrder = 3
    end
    object ExtEdit: TEdit
      Left = 264
      Top = 184
      Width = 73
      Height = 22
      MaxLength = 4
      ReadOnly = True
      TabOrder = 4
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 256
    Width = 361
    Height = 137
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 16
      Width = 100
      Height = 20
      Caption = #3627#3617#3634#3618#3648#3621#3586#3626#3617#3634#3594#3636#3585
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label5: TLabel
      Left = 8
      Top = 56
      Width = 92
      Height = 20
      Caption = #3623#3633#3609#3610#3633#3605#3619#3627#3617#3604#3629#3634#3618#3640
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object SerialEdit: TEdit
      Left = 128
      Top = 16
      Width = 121
      Height = 22
      MaxLength = 8
      ReadOnly = True
      TabOrder = 0
    end
    object DateExpireEdit: TMaskEdit
      Left = 128
      Top = 56
      Width = 57
      Height = 22
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      ReadOnly = True
      TabOrder = 1
      Text = '  /  /  '
    end
  end
  object OKbtn: TButton
    Left = 368
    Top = 424
    Width = 75
    Height = 25
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 0
    OnClick = OKbtnClick
  end
end
