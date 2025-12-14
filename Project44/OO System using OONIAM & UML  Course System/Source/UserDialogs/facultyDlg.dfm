inherited FacultyDialog: TFacultyDialog
  Caption = #3588#3603#3632
  PixelsPerInch = 96
  TextHeight = 16
  inherited ControlPanel: TPanel
    object Label1: TLabel
      Left = 96
      Top = 112
      Width = 31
      Height = 37
      Caption = '...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object edThaiName: TLabeledEdit
      Left = 16
      Top = 32
      Width = 185
      Height = 24
      EditLabel.Width = 35
      EditLabel.Height = 16
      EditLabel.Caption = #3594#3639#3656#3629#3588#3603#3632
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
    end
    object edEnglishName: TLabeledEdit
      Left = 16
      Top = 80
      Width = 185
      Height = 24
      EditLabel.Width = 89
      EditLabel.Height = 16
      EditLabel.Caption = 'Faculty Name :'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 1
    end
  end
end
