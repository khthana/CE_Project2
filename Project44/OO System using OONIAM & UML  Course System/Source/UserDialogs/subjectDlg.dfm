inherited SubjectDialog: TSubjectDialog
  Left = 341
  Top = 7
  Caption = 'SubjectDialog'
  ClientHeight = 488
  ClientWidth = 388
  PixelsPerInch = 96
  TextHeight = 16
  inherited ControlPanel: TPanel
    Width = 388
    Height = 453
    object Label1: TLabel
      Left = 16
      Top = 52
      Width = 26
      Height = 16
      Caption = #3626#3633#3591#3585#3633#3604
    end
    object lblSubjectTo: TLabel
      Left = 60
      Top = 52
      Width = 309
      Height = 16
      AutoSize = False
      Caption = '...'
    end
    object Label3: TLabel
      Left = 16
      Top = 24
      Width = 49
      Height = 16
      Caption = #3626#3619#3657#3634#3591#3592#3634#3585
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edThaiCode: TLabeledEdit
      Left = 16
      Top = 123
      Width = 81
      Height = 24
      EditLabel.Width = 30
      EditLabel.Height = 16
      EditLabel.Caption = #3594#3639#3656#3629#3618#3656#3629
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
    object edThaiName: TLabeledEdit
      Left = 104
      Top = 123
      Width = 265
      Height = 24
      EditLabel.Width = 36
      EditLabel.Height = 16
      EditLabel.Caption = #3594#3639#3656#3629#3648#3605#3655#3617
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
    object edEnglishCode: TLabeledEdit
      Left = 16
      Top = 167
      Width = 81
      Height = 24
      EditLabel.Width = 71
      EditLabel.Height = 16
      EditLabel.Caption = 'Short name:'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 2
    end
    object edEnglishName: TLabeledEdit
      Left = 104
      Top = 167
      Width = 265
      Height = 24
      EditLabel.Width = 61
      EditLabel.Height = 16
      EditLabel.Caption = 'Full name:'
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 3
    end
    object edCredit: TLabeledEdit
      Left = 16
      Top = 211
      Width = 81
      Height = 24
      EditLabel.Width = 47
      EditLabel.Height = 16
      EditLabel.Caption = #3627#3609#3656#3623#3618#3585#3636#3605
      EditLabel.Font.Charset = DEFAULT_CHARSET
      EditLabel.Font.Color = clWindowText
      EditLabel.Font.Height = -13
      EditLabel.Font.Name = 'MS Sans Serif'
      EditLabel.Font.Style = [fsBold]
      EditLabel.ParentFont = False
      LabelPosition = lpAbove
      LabelSpacing = 3
      TabOrder = 4
    end
    object edExtID: TLabeledEdit
      Left = 65
      Top = 76
      Width = 96
      Height = 24
      EditLabel.Width = 45
      EditLabel.Height = 16
      EditLabel.Caption = #3619#3627#3633#3626#3623#3636#3594#3634' :'
      LabelPosition = lpLeft
      LabelSpacing = 3
      TabOrder = 5
    end
    object PageControl1: TPageControl
      Left = 16
      Top = 245
      Width = 353
      Height = 193
      ActivePage = shtSubCourse
      TabIndex = 2
      TabOrder = 6
      object shtPosGrd: TTabSheet
        Caption = #3612#3621#3585#3634#3619#3648#3619#3637#3618#3609
        ImageIndex = 2
        object btnAssignNew: TSpeedButton
          Left = 192
          Top = 32
          Width = 65
          Height = 25
          Caption = #3585#3635#3627#3609#3604
        end
        object lstPosGrd: TListView
          Left = 8
          Top = 9
          Width = 177
          Height = 144
          Checkboxes = True
          Columns = <
            item
              Caption = #3612#3621
              Width = 70
            end
            item
              Alignment = taCenter
              Caption = #3609#3657#3635#3627#3609#3633#3585
              Width = 70
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
        object Memo1: TMemo
          Left = 192
          Top = 96
          Width = 145
          Height = 57
          Color = clInfoBk
          Ctl3D = False
          Enabled = False
          Lines.Strings = (
            #3651#3609#3585#3619#3603#3637#3652#3617#3656#3617#3637#3612#3621#3585#3634#3619#3648#3619#3637#3618#3609#3607#3637#3656#3605#3657#3629#3591
            #3585#3634#3619' '#3588#3621#3636#3585' "'#3585#3635#3627#3609#3604'" '#3648#3614#3639#3656#3629#3648#3614#3636#3656#3617
            #3612#3621#3585#3634#3619#3648#3619#3637#3618#3609#3607#3637#3656#3605#3657#3629#3591#3585#3634#3619)
          ParentCtl3D = False
          TabOrder = 1
        end
      end
      object shtPrereq: TTabSheet
        Caption = #3610#3640#3614#3623#3636#3594#3634
        object btnAdd: TSpeedButton
          Left = 296
          Top = 32
          Width = 41
          Height = 25
          Caption = #3648#3614#3636#3656#3617
          OnClick = btnAddClick
        end
        object btnDelete: TSpeedButton
          Left = 296
          Top = 64
          Width = 41
          Height = 22
          Caption = #3621#3610
        end
        object lstPrereq: TListView
          Left = 8
          Top = 9
          Width = 280
          Height = 144
          Columns = <
            item
              Caption = #3619#3627#3633#3626#3623#3636#3594#3634
              Width = 70
            end
            item
              Caption = #3594#3639#3656#3629#3623#3636#3594#3634
              Width = 180
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
      object shtSubCourse: TTabSheet
        Caption = #3585#3621#3640#3656#3617#3607#3637#3656#3648#3611#3636#3604#3626#3629#3609
        ImageIndex = 1
        object btnAssignSubCourse: TSpeedButton
          Left = 293
          Top = 32
          Width = 49
          Height = 25
          Caption = #3585#3635#3627#3609#3604
          OnClick = btnAssignSubCourseClick
        end
        object btnDeleteSubCourse: TSpeedButton
          Left = 293
          Top = 64
          Width = 49
          Height = 25
          Caption = #3621#3610
        end
        object lstSubCourse: TListView
          Left = 8
          Top = 9
          Width = 280
          Height = 144
          Columns = <
            item
              Caption = #3585#3621#3640#3656#3617
            end
            item
              Caption = #3612#3641#3657#3626#3629#3609
              Width = 180
            end
            item
              Caption = #3623#3633#3609
            end
            item
              Caption = #3648#3623#3621#3634
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object cmbClassRef: TReferenceComboBox
      Left = 69
      Top = 18
      Width = 301
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 7
    end
  end
  inherited ButtonPanel: TPanel
    Top = 453
    Width = 388
    inherited GrBtn: TPanel
      Left = 225
    end
  end
end
