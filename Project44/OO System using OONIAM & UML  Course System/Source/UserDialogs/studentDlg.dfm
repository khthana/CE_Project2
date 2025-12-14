inherited StudentDialog: TStudentDialog
  Left = 187
  Top = 145
  Caption = #3609#3633#3585#3624#3638#3585#3625#3634
  ClientHeight = 317
  ClientWidth = 335
  PixelsPerInch = 96
  TextHeight = 16
  inherited ControlPanel: TPanel
    Width = 335
    Height = 282
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 26
      Height = 16
      Caption = #3626#3633#3591#3585#3633#3604
    end
    object Label2: TLabel
      Left = 48
      Top = 24
      Width = 179
      Height = 16
      Caption = #3623#3636#3624#3623#3585#3619#3619#3617#3588#3629#3617#3614#3636#3623#3648#3605#3629#3619#3660'.'#3623#3636#3624#3623#3585#3619#3619#3617#3624#3634#3626#3605#3619#3660
    end
    object edThaiName: TLabeledEdit
      Left = 16
      Top = 112
      Width = 121
      Height = 24
      EditLabel.Width = 52
      EditLabel.Height = 16
      EditLabel.Caption = #3594#3639#3656#3629' ('#3652#3607#3618')'
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 1
    end
    object edExtID: TLabeledEdit
      Left = 16
      Top = 64
      Width = 121
      Height = 24
      EditLabel.Width = 59
      EditLabel.Height = 16
      EditLabel.Caption = #3619#3627#3633#3626#3609#3633#3585#3624#3638#3585#3625#3634
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
    end
    object edThaiLastName: TLabeledEdit
      Left = 144
      Top = 112
      Width = 161
      Height = 24
      EditLabel.Width = 45
      EditLabel.Height = 16
      EditLabel.Caption = #3609#3634#3617#3626#3585#3640#3621
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 2
    end
    object edEngName: TLabeledEdit
      Left = 16
      Top = 160
      Width = 121
      Height = 24
      EditLabel.Width = 59
      EditLabel.Height = 16
      EditLabel.Caption = 'Firstname'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 3
    end
    object edEngLastName: TLabeledEdit
      Left = 144
      Top = 160
      Width = 161
      Height = 24
      EditLabel.Width = 59
      EditLabel.Height = 16
      EditLabel.Caption = 'Lastname'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 4
    end
    object btnTest: TButton
      Left = 184
      Top = 240
      Width = 123
      Height = 25
      Caption = 'Test Examination'
      TabOrder = 5
      OnClick = btnTestClick
    end
    object cmbRefCourse: TReferenceComboBox
      Left = 16
      Top = 208
      Width = 289
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 6
    end
    object btnAvg: TButton
      Left = 88
      Top = 240
      Width = 75
      Height = 25
      Caption = 'GPA'
      TabOrder = 7
      OnClick = btnAvgClick
    end
  end
  inherited ButtonPanel: TPanel
    Top = 282
    Width = 335
    inherited GrBtn: TPanel
      Left = 172
    end
  end
end
