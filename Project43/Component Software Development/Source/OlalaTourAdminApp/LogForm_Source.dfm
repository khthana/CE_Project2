object LogForm: TLogForm
  Left = 147
  Top = 131
  Width = 711
  Height = 459
  BorderIcons = []
  Caption = 'View Log'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LogType: TGroupBox
    Left = 160
    Top = 272
    Width = 385
    Height = 49
    Caption = 'LogType'
    TabOrder = 0
    object RdoSystemLog: TRadioButton
      Left = 48
      Top = 24
      Width = 113
      Height = 17
      Caption = 'SystemLog'
      TabOrder = 0
    end
    object RdoBussinessLog: TRadioButton
      Left = 216
      Top = 24
      Width = 113
      Height = 17
      Caption = 'BussinessLog'
      TabOrder = 1
    end
  end
  object BtnView: TButton
    Left = 232
    Top = 336
    Width = 113
    Height = 25
    Caption = '&View'
    TabOrder = 1
    OnClick = BtnViewClick
  end
  object BtnClear: TButton
    Left = 352
    Top = 336
    Width = 113
    Height = 25
    Caption = 'C&lear'
    TabOrder = 2
    OnClick = BtnClearClick
  end
  object BtnClose: TButton
    Left = 296
    Top = 368
    Width = 113
    Height = 25
    Caption = '&Close'
    TabOrder = 3
    OnClick = BtnCloseClick
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 8
    Width = 673
    Height = 256
    ColCount = 4
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goColMoving, goAlwaysShowEditor, goThumbTracking]
    TabOrder = 4
    ColWidths = (
      194
      189
      138
      142)
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 413
    Width = 703
    Height = 19
    Panels = <>
    SimplePanel = False
  end
end
