object frmGraph: TfrmGraph
  Left = 230
  Top = 133
  Width = 467
  Height = 302
  Caption = 'Electrocardiogram Portable Memory Graph'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnClose: TButton
    Left = 176
    Top = 240
    Width = 73
    Height = 33
    Caption = '&Close'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object Chart1: TChart
    Left = 16
    Top = -8
    Width = 400
    Height = 250
    BackWall.Brush.Color = clWhite
    BackWall.Brush.Style = bsClear
    Title.Text.Strings = (
      'TChart')
    Title.Visible = False
    BottomAxis.Visible = False
    LeftAxis.ExactDateTime = False
    Legend.Visible = False
    RightAxis.Visible = False
    TopAxis.Visible = False
    View3D = False
    TabOrder = 1
    object Series1: TLineSeries
      Marks.ArrowLength = 8
      Marks.Visible = False
      SeriesColor = clRed
      Pointer.InflateMargins = True
      Pointer.Style = psRectangle
      Pointer.Visible = False
      XValues.DateTime = False
      XValues.Name = 'X'
      XValues.Multiplier = 1
      XValues.Order = loAscending
      YValues.DateTime = False
      YValues.Name = 'Y'
      YValues.Multiplier = 1
      YValues.Order = loNone
    end
  end
end
