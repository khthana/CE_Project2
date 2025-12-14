inherited SelectSchDialog: TSelectSchDialog
  Left = 301
  Top = 165
  Caption = #3626#3619#3657#3634#3591#3648#3623#3621#3634#3610#3619#3619#3618#3634#3618
  ClientHeight = 198
  ClientWidth = 294
  PixelsPerInch = 96
  TextHeight = 16
  inherited ControlPanel: TPanel
    Width = 294
    Height = 163
    object Label1: TLabel
      Left = 24
      Top = 52
      Width = 27
      Height = 16
      Caption = #3612#3641#3657#3626#3629#3609
    end
    object Label2: TLabel
      Left = 25
      Top = 102
      Width = 49
      Height = 16
      Caption = #3623#3633#3609#3610#3619#3619#3618#3634#3618
    end
    object Label3: TLabel
      Left = 152
      Top = 102
      Width = 56
      Height = 16
      Caption = #3648#3623#3621#3634#3610#3619#3619#3618#3634#3618
    end
    object cmbRefTeacher: TReferenceComboBox
      Left = 24
      Top = 72
      Width = 249
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
    end
    object cmbRefDay: TReferenceComboBox
      Left = 24
      Top = 120
      Width = 121
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 1
    end
    object cmbRefPeriod: TReferenceComboBox
      Left = 152
      Top = 120
      Width = 121
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 2
    end
    object edSection: TLabeledEdit
      Left = 23
      Top = 27
      Width = 58
      Height = 24
      EditLabel.Width = 45
      EditLabel.Height = 16
      EditLabel.Caption = 'Section'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 3
    end
    object edStudentNum: TLabeledEdit
      Left = 120
      Top = 27
      Width = 121
      Height = 24
      EditLabel.Width = 44
      EditLabel.Height = 16
      EditLabel.Caption = #3592#3635#3609#3623#3609#3619#3633#3610
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 4
    end
  end
  inherited ButtonPanel: TPanel
    Top = 163
    Width = 294
    inherited GrBtn: TPanel
      Left = 131
    end
  end
end
