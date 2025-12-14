object CardInfofrm: TCardInfofrm
  Left = 147
  Top = 74
  Width = 451
  Height = 420
  AutoSize = True
  Caption = 'CardInfofrm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 345
    Height = 377
    Caption = #3586#3657#3629#3617#3641#3621#3626#3656#3623#3609#3605#3633#3623
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 72
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
    object Label2: TLabel
      Left = 24
      Top = 104
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
    object Label3: TLabel
      Left = 40
      Top = 136
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
    object Label4: TLabel
      Left = 8
      Top = 240
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
    object Label5: TLabel
      Left = 8
      Top = 280
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
    object Label6: TLabel
      Left = 8
      Top = 40
      Width = 82
      Height = 20
      Caption = #3627#3617#3634#3618#3648#3621#3586#3610#3633#3605#3619
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 328
      Width = 67
      Height = 20
      Caption = #3623#3633#3609#3627#3617#3604#3629#3634#3618#3640
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Name: TEdit
      Left = 104
      Top = 72
      Width = 137
      Height = 22
      TabOrder = 0
    end
    object Surname: TEdit
      Left = 104
      Top = 104
      Width = 137
      Height = 22
      TabOrder = 1
    end
    object Address: TMemo
      Left = 104
      Top = 136
      Width = 145
      Height = 89
      Lines.Strings = (
        '')
      MaxLength = 92
      TabOrder = 2
    end
    object Ext: TEdit
      Left = 256
      Top = 240
      Width = 73
      Height = 22
      MaxLength = 4
      TabOrder = 3
    end
    object Bal: TEdit
      Left = 104
      Top = 280
      Width = 121
      Height = 22
      MaxLength = 6
      TabOrder = 4
    end
    object Serial: TEdit
      Left = 104
      Top = 40
      Width = 121
      Height = 22
      MaxLength = 8
      TabOrder = 5
    end
    object Tel: TMaskEdit
      Left = 104
      Top = 240
      Width = 129
      Height = 22
      MaxLength = 9
      TabOrder = 6
    end
    object DateExpire: TMaskEdit
      Left = 104
      Top = 328
      Width = 57
      Height = 22
      EditMask = '!99/99/00;1;_'
      MaxLength = 8
      TabOrder = 7
      Text = '  /  /  '
    end
  end
  object Applybtn: TButton
    Left = 368
    Top = 304
    Width = 73
    Height = 25
    Caption = #3605#3585#3621#3591
    TabOrder = 1
    OnClick = ApplybtnClick
  end
  object Cancelbtn: TButton
    Left = 368
    Top = 344
    Width = 75
    Height = 25
    Caption = #3618#3585#3648#3621#3636#3585
    TabOrder = 2
    OnClick = CancelbtnClick
  end
end
