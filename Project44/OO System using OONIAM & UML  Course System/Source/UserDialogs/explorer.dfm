inherited Explore: TExplore
  Left = 99
  Top = 124
  Caption = #3626#3635#3619#3623#3592#3607#3619#3633#3614#3618#3634#3585#3619
  OldCreateOrder = True
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object treeview: TTreeView [0]
    Left = 0
    Top = 46
    Width = 183
    Height = 311
    Align = alLeft
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HideSelection = False
    HotTrack = True
    Images = XDMU.Image16
    Indent = 23
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object listview: TListView [1]
    Left = 183
    Top = 46
    Width = 415
    Height = 311
    Align = alClient
    Columns = <>
    FlatScrollBars = True
    FullDrag = True
    HideSelection = False
    LargeImages = XDMU.BigImage
    MultiSelect = True
    ReadOnly = True
    RowSelect = True
    ParentShowHint = False
    PopupMenu = PopupMenu
    ShowHint = True
    SmallImages = XDMU.MainImages
    TabOrder = 1
  end
  inherited PCaption: TPanel
    TabOrder = 3
  end
  inherited MyHeader: THeaderControl
    Sections = <
      item
        Alignment = taCenter
        ImageIndex = -1
        Text = #3626#3635#3619#3623#3592#3607#3619#3633#3614#3618#3634#3585#3619
        Width = 184
      end
      item
        ImageIndex = -1
        Width = 413
      end>
  end
  object PopupMenu: TPopupMenu
    OnPopup = PopupMenuPopup
    Left = 16
    Top = 152
    object mnuAdd: TMenuItem
      Caption = #3648#3614#3636#3656#3617'...'
      OnClick = mnuAddClick
    end
    object mnuDelete: TMenuItem
      Caption = #3621#3610
      OnClick = mnuDeleteClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuEdit: TMenuItem
      Caption = #3649#3585#3657#3652#3586'...'
      OnClick = mnuEditClick
    end
  end
end
