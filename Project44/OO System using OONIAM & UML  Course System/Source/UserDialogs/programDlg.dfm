inherited ProgramDialog: TProgramDialog
  Left = 264
  Top = 0
  ActiveControl = edThaiFullName
  Caption = 'ProgramDialog'
  ClientHeight = 492
  ClientWidth = 412
  PixelsPerInch = 96
  TextHeight = 16
  inherited ControlPanel: TPanel
    Width = 412
    Height = 457
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 41
      Height = 16
      Caption = #3626#3619#3657#3634#3591#3592#3634#3585
    end
    object Label2: TLabel
      Left = 16
      Top = 48
      Width = 26
      Height = 16
      Caption = #3626#3633#3591#3585#3633#3604
    end
    object Label3: TLabel
      Left = 64
      Top = 48
      Width = 305
      Height = 16
      AutoSize = False
      Caption = '..'
    end
    object PageControl: TPageControl
      Left = 16
      Top = 72
      Width = 377
      Height = 369
      ActivePage = shtDescription
      TabHeight = 25
      TabIndex = 0
      TabOrder = 0
      object shtDescription: TTabSheet
        Caption = #3619#3634#3618#3621#3632#3648#3629#3637#3618#3604
        object grbThai: TGroupBox
          Left = 8
          Top = 8
          Width = 337
          Height = 161
          Caption = #3652#3607#3618
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object edThaiFullName: TLabeledEdit
            Left = 8
            Top = 40
            Width = 321
            Height = 24
            EditLabel.Width = 62
            EditLabel.Height = 16
            EditLabel.Caption = #3594#3639#3656#3629#3627#3621#3633#3585#3626#3641#3605#3619
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'MS Sans Serif'
            EditLabel.Font.Style = [fsBold]
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            LabelPosition = lpAbove
            LabelSpacing = 3
            ParentFont = False
            TabOrder = 0
          end
          object edThaiName: TLabeledEdit
            Left = 8
            Top = 85
            Width = 321
            Height = 24
            EditLabel.Width = 91
            EditLabel.Height = 16
            EditLabel.Caption = #3594#3639#3656#3629#3611#3619#3636#3597#3597#3634' ('#3648#3605#3655#3617')'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'MS Sans Serif'
            EditLabel.Font.Style = [fsBold]
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            LabelPosition = lpAbove
            LabelSpacing = 3
            ParentFont = False
            TabOrder = 1
          end
          object edThaiShortName: TLabeledEdit
            Left = 8
            Top = 129
            Width = 321
            Height = 24
            EditLabel.Width = 85
            EditLabel.Height = 16
            EditLabel.Caption = #3594#3639#3656#3629#3611#3619#3636#3597#3597#3634' ('#3618#3656#3629')'
            EditLabel.Font.Charset = DEFAULT_CHARSET
            EditLabel.Font.Color = clWindowText
            EditLabel.Font.Height = -13
            EditLabel.Font.Name = 'MS Sans Serif'
            EditLabel.Font.Style = [fsBold]
            EditLabel.ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            LabelPosition = lpAbove
            LabelSpacing = 3
            ParentFont = False
            TabOrder = 2
          end
        end
        object grpEnglish: TGroupBox
          Left = 8
          Top = 170
          Width = 337
          Height = 161
          Caption = 'English'
          TabOrder = 1
          object edEngFullName: TLabeledEdit
            Left = 8
            Top = 40
            Width = 321
            Height = 24
            EditLabel.Width = 86
            EditLabel.Height = 16
            EditLabel.Caption = 'Course Name:'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 0
          end
          object edEngName: TLabeledEdit
            Left = 8
            Top = 85
            Width = 321
            Height = 24
            EditLabel.Width = 116
            EditLabel.Height = 16
            EditLabel.Caption = 'Degree Name (full):'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 1
          end
          object edEngShortName: TLabeledEdit
            Left = 8
            Top = 129
            Width = 137
            Height = 24
            EditLabel.Width = 129
            EditLabel.Height = 16
            EditLabel.Caption = 'Degree Name (short):'
            LabelPosition = lpAbove
            LabelSpacing = 3
            TabOrder = 2
          end
        end
      end
      object shtSpec: TTabSheet
        Caption = #3586#3657#3629#3585#3635#3627#3609#3604
        ImageIndex = 1
        object Label4: TLabel
          Left = 8
          Top = 72
          Width = 59
          Height = 16
          Caption = #3627#3621#3633#3585#3626#3641#3605#3619#3619#3656#3623#3617
        end
        object Label5: TLabel
          Left = 8
          Top = 96
          Width = 111
          Height = 16
          Caption = #3592#3640#3604#3611#3619#3632#3626#3591#3588#3660#3586#3629#3591#3627#3621#3633#3585#3626#3641#3605#3619
        end
        object ReferenceComboBox1: TReferenceComboBox
          Left = 88
          Top = 69
          Width = 257
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 0
        end
        object memObjective: TMemo
          Left = 8
          Top = 120
          Width = 337
          Height = 105
          TabOrder = 1
        end
        object edPreGraduate: TLabeledEdit
          Left = 8
          Top = 248
          Width = 337
          Height = 24
          EditLabel.Width = 73
          EditLabel.Height = 16
          EditLabel.Caption = #3588#3640#3603#3626#3617#3610#3633#3605#3636#3612#3641#3657#3648#3619#3637#3618#3609
          LabelPosition = lpAbove
          LabelSpacing = 3
          TabOrder = 2
        end
        object edExtCourseID: TLabeledEdit
          Left = 88
          Top = 8
          Width = 89
          Height = 24
          EditLabel.Width = 61
          EditLabel.Height = 16
          EditLabel.Caption = #3619#3627#3633#3626#3627#3621#3633#3585#3626#3641#3605#3619
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 3
        end
        object edPeriod: TLabeledEdit
          Left = 272
          Top = 8
          Width = 43
          Height = 24
          EditLabel.Width = 82
          EditLabel.Height = 16
          EditLabel.Caption = #3619#3632#3618#3632#3648#3623#3621#3634#3624#3638#3585#3625#3634
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 4
        end
        object edRequire: TLabeledEdit
          Left = 88
          Top = 38
          Width = 91
          Height = 24
          EditLabel.Width = 76
          EditLabel.Height = 16
          EditLabel.Caption = #3627#3609#3656#3623#3618#3585#3636#3605#3624#3638#3585#3625#3634
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 5
        end
        object edAllMinAvg: TLabeledEdit
          Left = 272
          Top = 38
          Width = 43
          Height = 24
          EditLabel.Width = 62
          EditLabel.Height = 16
          EditLabel.Caption = #3612#3621#3585#3634#3619#3648#3619#3637#3618#3609
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -13
          EditLabel.Font.Name = 'MS Sans Serif'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 6
        end
      end
      object shtSubject: TTabSheet
        Caption = #3619#3634#3618#3621#3632#3648#3629#3637#3618#3604#3623#3636#3594#3634
        ImageIndex = 2
        object btnCatAdd: TSpeedButton
          Left = 312
          Top = 8
          Width = 23
          Height = 22
          Caption = '+'
        end
        object btnCatDelete: TSpeedButton
          Left = 336
          Top = 8
          Width = 23
          Height = 22
          Caption = '-'
        end
        object btnGrpAdd: TSpeedButton
          Left = 312
          Top = 40
          Width = 23
          Height = 22
          Caption = '+'
        end
        object btnGrpDelete: TSpeedButton
          Left = 336
          Top = 40
          Width = 23
          Height = 22
          Caption = '-'
        end
        object btnSubjectAdd: TSpeedButton
          Left = 320
          Top = 128
          Width = 41
          Height = 25
          Caption = #3648#3614#3636#3656#3617
          OnClick = btnSubjectAddClick
        end
        object btnSubjectDelete: TSpeedButton
          Left = 320
          Top = 160
          Width = 41
          Height = 25
          Caption = #3621#3610
        end
        object Label6: TLabel
          Left = 15
          Top = 11
          Width = 28
          Height = 16
          Caption = #3627#3617#3623#3604
        end
        object Label7: TLabel
          Left = 16
          Top = 43
          Width = 19
          Height = 16
          Caption = #3585#3621#3640#3656#3617
        end
        object lstSubject: TListView
          Left = 8
          Top = 104
          Width = 305
          Height = 225
          Columns = <
            item
              Caption = #3619#3627#3633#3626#3623#3636#3594#3634
              Width = 60
            end
            item
              Caption = #3594#3639#3656#3629#3623#3636#3594#3634
              Width = 160
            end
            item
              Caption = #3627#3609#3656#3623#3618
            end>
          TabOrder = 0
          ViewStyle = vsReport
        end
        object cmbCatRef: TReferenceComboBox
          Left = 48
          Top = 8
          Width = 249
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 1
          OnClick = cmbCatRefClick
        end
        object cmbGrpRef: TReferenceComboBox
          Left = 48
          Top = 40
          Width = 249
          Height = 24
          Style = csDropDownList
          ItemHeight = 16
          TabOrder = 2
          OnClick = cmbGrpRefClick
        end
        object edSubRequire: TLabeledEdit
          Left = 96
          Top = 72
          Width = 57
          Height = 24
          EditLabel.Width = 76
          EditLabel.Height = 16
          EditLabel.Caption = #3627#3609#3656#3623#3618#3610#3633#3591#3588#3633#3610#3648#3619#3637#3618#3609
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 3
        end
        object edMinAvg: TLabeledEdit
          Left = 248
          Top = 72
          Width = 57
          Height = 24
          EditLabel.Width = 82
          EditLabel.Height = 16
          EditLabel.Caption = #3588#3632#3649#3609#3609#3648#3593#3621#3637#3656#3618#3586#3633#3657#3609#3605#3656#3635
          LabelPosition = lpLeft
          LabelSpacing = 3
          TabOrder = 4
        end
      end
    end
    object cmbClassRef: TReferenceComboBox
      Left = 64
      Top = 18
      Width = 321
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 1
    end
  end
  inherited ButtonPanel: TPanel
    Top = 457
    Width = 412
    inherited GrBtn: TPanel
      Left = 249
    end
  end
end
