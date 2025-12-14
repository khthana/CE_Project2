inherited TeacherDialog: TTeacherDialog
  Caption = #3588#3603#3634#3592#3634#3619#3618#3660
  ClientHeight = 243
  ClientWidth = 329
  PixelsPerInch = 96
  TextHeight = 16
  inherited ControlPanel: TPanel
    Width = 329
    Height = 208
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 26
      Height = 16
      Caption = #3626#3633#3591#3585#3633#3604
    end
    object Label2: TLabel
      Left = 44
      Top = 24
      Width = 3
      Height = 16
    end
    object Label3: TLabel
      Left = 16
      Top = 145
      Width = 93
      Height = 16
      Caption = #3605#3635#3649#3627#3609#3656#3591#3607#3634#3591#3623#3636#3594#3634#3585#3634#3619
    end
    object edThaiName: TLabeledEdit
      Left = 16
      Top = 65
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
      TabOrder = 0
    end
    object edEngName: TLabeledEdit
      Left = 16
      Top = 113
      Width = 121
      Height = 24
      EditLabel.Width = 59
      EditLabel.Height = 16
      EditLabel.Caption = 'Firstname'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 1
    end
    object edEngLastName: TLabeledEdit
      Left = 142
      Top = 113
      Width = 161
      Height = 24
      EditLabel.Width = 59
      EditLabel.Height = 16
      EditLabel.Caption = 'Lastname'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 2
    end
    object edThaiLastName: TLabeledEdit
      Left = 142
      Top = 65
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
      TabOrder = 3
    end
    object cmbPosEDU: TReferenceComboBox
      Left = 16
      Top = 166
      Width = 289
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 4
    end
  end
  inherited ButtonPanel: TPanel
    Top = 208
    Width = 329
    inherited GrBtn: TPanel
      Left = 166
    end
  end
end
