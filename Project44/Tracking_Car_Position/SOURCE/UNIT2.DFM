object Form2: TForm2
  Left = 159
  Top = 86
  Width = 436
  Height = 400
  Caption = 'Setting'
  Color = clBtnFace
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
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 8
    Width = 201
    Height = 73
    Caption = 'Set Serial Port'
    TabOrder = 0
  end
  object com2: TRadioButton
    Left = 61
    Top = 52
    Width = 76
    Height = 16
    Caption = 'Port Com 2'
    TabOrder = 1
  end
  object com1: TRadioButton
    Left = 61
    Top = 30
    Width = 76
    Height = 16
    Caption = 'Port Com 1'
    Checked = True
    TabOrder = 2
    TabStop = True
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 88
    Width = 409
    Height = 225
    Caption = 'Set Analysis Rate'
    TabOrder = 3
    object Label1: TLabel
      Left = 40
      Top = 56
      Width = 205
      Height = 13
      Caption = #3629#3633#3605#3619#3634#3588#3623#3634#3617#3648#3619#3655#3623#3607#3637#3656#3648#3611#3621#3637#3656#3618#3609#3649#3611#3621#3591#3594#3603#3632#3629#3629#3585#3605#3633#3623#3648#3585#3636#3609
    end
    object Label2: TLabel
      Left = 320
      Top = 56
      Width = 37
      Height = 13
      Caption = 'Km./Hr.'
    end
    object Label5: TLabel
      Left = 40
      Top = 120
      Width = 210
      Height = 13
      Caption = #3629#3633#3605#3619#3634#3588#3623#3634#3617#3648#3619#3655#3623#3607#3637#3656#3648#3611#3621#3637#3656#3618#3609#3649#3611#3621#3591#3594#3603#3632#3648#3604#3636#3609#3607#3634#3591#3648#3585#3636#3609
    end
    object Label6: TLabel
      Left = 320
      Top = 120
      Width = 37
      Height = 13
      Caption = 'Km./Hr.'
    end
    object Label7: TLabel
      Left = 40
      Top = 72
      Width = 93
      Height = 13
      Caption = #3616#3634#3618#3651#3609#3648#3623#3621#3634' 3 '#3623#3636#3609#3634#3607#3637
    end
    object Label8: TLabel
      Left = 40
      Top = 136
      Width = 93
      Height = 13
      Caption = #3616#3634#3618#3651#3609#3648#3623#3621#3634' 3 '#3623#3636#3609#3634#3607#3637
    end
    object Label3: TLabel
      Left = 40
      Top = 184
      Width = 60
      Height = 13
      Caption = #3592#3629#3604#3609#3634#3609#3648#3585#3636#3609
    end
    object Label4: TLabel
      Left = 320
      Top = 184
      Width = 20
      Height = 13
      Caption = #3609#3634#3607#3637
    end
    object CheckBox1: TCheckBox
      Left = 24
      Top = 32
      Width = 97
      Height = 17
      Caption = #3629#3629#3585#3605#3633#3623#3585#3619#3632#3594#3634#3585
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 24
      Top = 96
      Width = 97
      Height = 17
      Caption = #3648#3610#3619#3588#3585#3619#3632#3607#3633#3609#3627#3633#3609
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 24
      Top = 160
      Width = 105
      Height = 17
      Caption = #3592#3629#3604#3609#3634#3609#3612#3636#3604#3611#3585#3605#3636
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object UpDown1: TUpDown
      Left = 284
      Top = 56
      Width = 16
      Height = 21
      Associate = Edit1
      Min = 50
      Max = 150
      Position = 125
      TabOrder = 3
      Wrap = False
    end
    object UpDown2: TUpDown
      Left = 286
      Top = 120
      Width = 16
      Height = 21
      Associate = Edit2
      Min = 50
      Max = 150
      Position = 50
      TabOrder = 4
      Wrap = False
    end
    object UpDown3: TUpDown
      Left = 285
      Top = 184
      Width = 16
      Height = 21
      Associate = Edit3
      Min = 20
      Max = 180
      Position = 20
      TabOrder = 5
      Wrap = False
    end
    object Edit1: TMaskEdit
      Left = 256
      Top = 56
      Width = 28
      Height = 21
      EditMask = '999;0;_'
      MaxLength = 3
      TabOrder = 6
      Text = '125'
    end
    object Edit2: TMaskEdit
      Left = 256
      Top = 120
      Width = 30
      Height = 21
      EditMask = '999;0;_'
      MaxLength = 3
      TabOrder = 7
      Text = '50'
    end
    object Edit3: TMaskEdit
      Left = 256
      Top = 184
      Width = 29
      Height = 21
      EditMask = '999;0;_'
      MaxLength = 3
      TabOrder = 8
      Text = '20'
    end
  end
  object Button1: TButton
    Left = 128
    Top = 328
    Width = 75
    Height = 25
    Caption = ' OK '
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Cancel'
    TabOrder = 5
    OnClick = Button2Click
  end
  object GroupBox2: TGroupBox
    Left = 216
    Top = 8
    Width = 201
    Height = 73
    Caption = 'Simulate Option'
    TabOrder = 6
    object CheckBox4: TCheckBox
      Left = 24
      Top = 32
      Width = 121
      Height = 17
      Caption = #3651#3594#3657#3627#3621#3633#3585#3585#3634#3619#3619#3641#3657#3592#3635#3648#3626#3657#3609#3607#3634#3591
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
  end
end
