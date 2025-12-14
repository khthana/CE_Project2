inherited SelectSubjectDialog: TSelectSubjectDialog
  Left = 152
  Top = 127
  Caption = 'SelectSubjectDialog'
  ClientHeight = 292
  ClientWidth = 440
  PixelsPerInch = 96
  TextHeight = 16
  inherited ControlPanel: TPanel
    Width = 440
    Height = 257
    object lstSubject: TListView
      Left = 16
      Top = 48
      Width = 409
      Height = 193
      Columns = <
        item
          Caption = #3619#3627#3633#3626#3623#3636#3594#3634
          Width = 80
        end
        item
          Caption = #3594#3639#3656#3629#3623#3636#3594#3634
          Width = 250
        end
        item
          Caption = #3627#3609#3656#3623#3618
        end>
      LargeImages = XDMU.BigImage
      ReadOnly = True
      RowSelect = True
      SmallImages = XDMU.Image16
      TabOrder = 0
      OnDblClick = lstSubjectDblClick
      OnSelectItem = lstSubjectSelectItem
    end
    object cmb: TComboBoxEx
      Left = 96
      Top = 16
      Width = 305
      Height = 25
      ItemsEx.CaseSensitive = False
      ItemsEx.SortType = stNone
      ItemsEx = <>
      Style = csExDropDownList
      StyleEx = []
      ItemHeight = 16
      TabOrder = 1
      OnClick = cmbClick
      Images = XDMU.Image16
      DropDownCount = 8
    end
  end
  inherited ButtonPanel: TPanel
    Top = 257
    Width = 440
    inherited GrBtn: TPanel
      Left = 277
    end
  end
end
