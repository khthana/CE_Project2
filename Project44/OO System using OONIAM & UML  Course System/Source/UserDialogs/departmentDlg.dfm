inherited DepartmentDialog: TDepartmentDialog
  Left = 288
  Top = 136
  Caption = 'DepartmentDialog'
  ClientHeight = 324
  ClientWidth = 373
  PixelsPerInch = 96
  TextHeight = 16
  inherited ControlPanel: TPanel
    Width = 373
    Height = 289
    object edThaiName: TLabeledEdit
      Left = 16
      Top = 40
      Width = 185
      Height = 24
      EditLabel.Width = 50
      EditLabel.Height = 16
      EditLabel.Caption = #3594#3639#3656#3629#3616#3634#3588#3623#3636#3594#3634
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 0
    end
    object edEnglishName: TLabeledEdit
      Left = 16
      Top = 88
      Width = 185
      Height = 24
      EditLabel.Width = 116
      EditLabel.Height = 16
      EditLabel.Caption = 'Department Name :'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 1
    end
    object ListView: TListView
      Left = 16
      Top = 120
      Width = 337
      Height = 150
      Columns = <
        item
          Caption = #3627#3621#3633#3585#3626#3641#3605#3619
          Width = 230
        end
        item
          Caption = #3619#3632#3604#3633#3610
          Width = 75
        end>
      ReadOnly = True
      RowSelect = True
      TabOrder = 2
      ViewStyle = vsReport
    end
  end
  inherited ButtonPanel: TPanel
    Top = 289
    Width = 373
    inherited GrBtn: TPanel
      Left = 210
    end
  end
end
