object Form2: TForm2
  Left = 218
  Top = 116
  Width = 544
  Height = 436
  HorzScrollBar.Position = 10
  Caption = 'Form2'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 13
  object QuickRep1: TQuickRep
    Left = -10
    Top = 0
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = Form1.ADOQuery2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'AngsanaUPC'
    Font.Style = []
    Functions.Strings = (
      'PAGENUMBER'
      'COLUMNNUMBER'
      'REPORTTITLE')
    Functions.DATA = (
      '0'
      '0'
      #39#39)
    Options = [FirstPageHeader, LastPageFooter]
    Page.Columns = 1
    Page.Orientation = poPortrait
    Page.PaperSize = A4
    Page.Values = (
      100
      2970
      100
      2100
      100
      100
      0)
    PrinterSettings.Copies = 1
    PrinterSettings.Duplex = False
    PrinterSettings.FirstPage = 0
    PrinterSettings.LastPage = 0
    PrinterSettings.OutputBin = Auto
    PrintIfEmpty = True
    SnapToGrid = True
    Units = MM
    Zoom = 100
    object ColumnHeaderBand1: TQRBand
      Left = 38
      Top = 113
      Width = 718
      Height = 80
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        211.666666666667
        1899.70833333333)
      BandType = rbColumnHeader
      object QRLabel3: TQRLabel
        Left = 24
        Top = -2
        Width = 32
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          63.5
          -5.29166666666667
          84.6666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ลำดับ'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel4: TQRLabel
        Left = 80
        Top = -2
        Width = 91
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          211.666666666667
          -5.29166666666667
          240.770833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'เลขเรียกหนังสือ'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel5: TQRLabel
        Left = 80
        Top = 21
        Width = 49
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          211.666666666667
          55.5625
          129.645833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ชื่อผู้แต่ง'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel6: TQRLabel
        Left = 80
        Top = 48
        Width = 44
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          211.666666666667
          127
          116.416666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'ชื่อเรื่อง'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel7: TQRLabel
        Left = 368
        Top = -2
        Width = 68
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          973.666666666667
          -5.29166666666667
          179.916666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'เลขทะเบียน'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel8: TQRLabel
        Left = 590
        Top = -2
        Width = 55
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1561.04166666667
          -5.29166666666667
          145.520833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'วันที่พิมพ์'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRShape2: TQRShape
        Left = -8
        Top = 72
        Width = 729
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.8125
          -21.1666666666667
          190.5
          1928.8125)
        Shape = qrsHorLine
      end
    end
    object DetailBand1: TQRBand
      Left = 38
      Top = 193
      Width = 718
      Height = 80
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        211.666666666667
        1899.70833333333)
      BandType = rbDetail
      object QRDBText1: TQRDBText
        Left = 80
        Top = 2
        Width = 60
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          211.666666666667
          5.29166666666667
          158.75)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Form1.ADOQuery2
        DataField = 'BookCode'
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRDBText2: TQRDBText
        Left = 80
        Top = 27
        Width = 631
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          211.666666666667
          71.4375
          1669.52083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Form1.ADOQuery2
        DataField = 'AuthorName'
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRDBText3: TQRDBText
        Left = 80
        Top = 50
        Width = 631
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          211.666666666667
          132.291666666667
          1669.52083333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = False
        Color = clWhite
        DataSet = Form1.ADOQuery2
        DataField = 'title'
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRDBText4: TQRDBText
        Left = 368
        Top = 2
        Width = 48
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          973.666666666667
          5.29166666666667
          127)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Form1.ADOQuery2
        DataField = 'BookNo'
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRDBText5: TQRDBText
        Left = 590
        Top = 2
        Width = 24
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1561.04166666667
          5.29166666666667
          63.5)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Form1.ADOQuery2
        DataField = 'date'
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRDBText7: TQRDBText
        Left = 32
        Top = 2
        Width = 18
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          84.6666666666667
          5.29166666666667
          47.625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = Form1.ADOQuery2
        DataField = 'No'
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
    end
    object PageHeaderBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = False
      Size.Values = (
        198.4375
        1899.70833333333)
      BandType = rbPageHeader
      object QRLabel1: TQRLabel
        Left = 273
        Top = 2
        Width = 121
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.9583333333333
          722.3125
          5.29166666666667
          320.145833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'สำนักหอสมุดกลาง'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'AngsanaUPC'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 18
      end
      object QRLabel2: TQRLabel
        Left = 284
        Top = 27
        Width = 93
        Height = 34
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          89.9583333333333
          751.416666666667
          71.4375
          246.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'รายชื่อหนังสือ'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'AngsanaUPC'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 18
      end
      object QRSysData1: TQRSysData
        Left = 25
        Top = 31
        Width = 80
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          66.1458333333333
          82.0208333333333
          211.666666666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsDate
        Text = 'Date : '
        Transparent = False
        FontSize = 16
      end
      object QRSysData2: TQRSysData
        Left = 620
        Top = 27
        Width = 45
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1640.41666666667
          71.4375
          119.0625)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        Color = clWhite
        Data = qrsPageNumber
        Text = 'Page : '
        Transparent = False
        FontSize = 16
      end
      object QRShape1: TQRShape
        Left = -8
        Top = 65
        Width = 729
        Height = 9
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          23.8125
          -21.1666666666667
          171.979166666667
          1928.8125)
        Shape = qrsHorLine
      end
    end
  end
end
