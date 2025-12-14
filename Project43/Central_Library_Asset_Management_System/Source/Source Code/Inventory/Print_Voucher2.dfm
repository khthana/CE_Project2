object Fr_PVoucher2: TFr_PVoucher2
  Left = 153
  Top = 144
  Width = 812
  Height = 612
  VertScrollBar.Position = 245
  Caption = 'บัญทึกรายงานการขอซื้อ'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  PixelsPerInch = 96
  TextHeight = 14
  object QuickRep1: TQuickRep
    Left = 0
    Top = -243
    Width = 794
    Height = 1123
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    DataSet = DM.Qr_Buy_Detail
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'CordiaUPC'
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
    object QRBand1: TQRBand
      Left = 38
      Top = 38
      Width = 718
      Height = 62
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
        164.041666666667
        1899.70833333333)
      BandType = rbTitle
    end
    object QRBand4: TQRBand
      Left = 38
      Top = 100
      Width = 718
      Height = 1192
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      AlignToBottom = False
      Color = clWhite
      ForceNewColumn = False
      ForceNewPage = True
      Size.Values = (
        3153.83333333333
        1899.70833333333)
      BandType = rbSummary
      object QRMemo4: TQRMemo
        Left = 358
        Top = 336
        Width = 321
        Height = 250
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          661.458333333333
          947.208333333333
          889
          849.3125)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        Lines.Strings = (
          
            'ลงชื่อ..................................................นักวิชาก' +
            'ารพัสดุ'
          ''
          'อนุมัติให้ซื้อโดยวิธีตกลงราคาและอนุมัติ'
          'แต่งตั้งกรรมการ ดังกล่าวข้างต้น'
          ''
          
            'ลงชื่อ..................................................ผู้อนุมั' +
            'ติ'
          ''
          '                      ผู้อำนวยการ')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel3: TQRLabel
        Left = 365
        Top = 510
        Width = 243
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          965.729166666667
          1349.375
          642.9375)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(                                                          )'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRLabel2: TQRLabel
        Left = 389
        Top = 358
        Width = 203
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1029.22916666667
          947.208333333333
          537.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '(                                                )'
        Color = clWhite
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRMemo2: TQRMemo
        Left = 39
        Top = 6
        Width = 673
        Height = 137
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          362.479166666667
          103.1875
          15.875
          1780.64583333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = False
        AutoStretch = True
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        Lines.Strings = (
          
            'รวม .....................รายการ เป็นเง็นทั้งสิ้น................' +
            '..................บาท (.........................................' +
            '...................)'
          
            'กำหนดเวลาที่ต้องใช้................วัน       ตามรายละเอียดข้างบน' +
            'นี้  จะดำเนินการจัดซื้อโดบวิธีตกลงราคาตามข้อ 19'
          
            'แห่งระเบียบสำนักนายกรัฐมนตรีว่าด้วยการพัสดุ    2535     โดยขอเบิ' +
            'กจ่ายจากเงิน     รายได้ประจำปี 2543'
          
            'หมวดค่าวัสดุ รหัสบัญชี 0302                                     ' +
            '                        พร้อมทั้งขอแต่งตั้งกรรมการตรวจรับพัสดุ')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel24: TQRLabel
        Left = 115
        Top = 151
        Width = 277
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          304.270833333333
          399.520833333333
          732.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '1  .............................................................' +
          '....'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel25: TQRLabel
        Left = 115
        Top = 183
        Width = 277
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          304.270833333333
          484.1875
          732.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '2  .............................................................' +
          '....'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRLabel26: TQRLabel
        Left = 115
        Top = 215
        Width = 277
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          304.270833333333
          568.854166666667
          732.895833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 
          '3  .............................................................' +
          '....'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRDBText10: TQRDBText
        Left = 145
        Top = 180
        Width = 59
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          383.645833333333
          476.25
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Qr_Voucher
        DataField = 'Referee2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRDBText9: TQRDBText
        Left = 145
        Top = 148
        Width = 59
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          383.645833333333
          391.583333333333
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Qr_Voucher
        DataField = 'Referee1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRMemo3: TQRMemo
        Left = 45
        Top = 268
        Width = 634
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          119.0625
          709.083333333333
          1677.45833333333)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        Lines.Strings = (
          
            'จึงเรียนมาเพื่อโปรดพิจารณาอนุมัติให้ซื้อ โดยวิธีตกลงราคา พร้อมทั' +
            '้งแต่ตั้งกรรมการตรวจรับพัสดุข้างต้นต่อไปด้วย')
        ParentFont = False
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRDBText12: TQRDBText
        Left = 452
        Top = 509
        Width = 60
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1195.91666666667
          1346.72916666667
          158.75)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Qr_Off
        DataField = 'President'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRDBText13: TQRDBText
        Left = 449
        Top = 359
        Width = 76
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1187.97916666667
          949.854166666667
          201.083333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Qr_Off
        DataField = 'Invenofficer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QROrder_N: TQRLabel
        Left = 66
        Top = 4
        Width = 75
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          174.625
          10.5833333333333
          198.4375)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QROrder_N'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object QRToTal_Money: TQRLabel
        Left = 292
        Top = 4
        Width = 104
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          772.583333333333
          10.5833333333333
          275.166666666667)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'QRToTal_Money'
        Color = clWhite
        Transparent = False
        WordWrap = True
        FontSize = 16
      end
      object Str_Buy: TQRLabel
        Left = 445
        Top = 4
        Width = 47
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          1177.39583333333
          10.5833333333333
          124.354166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = 'Str_Buy'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 15
      end
      object QRDBText1: TQRDBText
        Left = 145
        Top = 210
        Width = 59
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          383.645833333333
          555.625
          156.104166666667)
        Alignment = taLeftJustify
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Color = clWhite
        DataSet = DM.Qr_Voucher
        DataField = 'Referee3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
      object QRLabel1: TQRLabel
        Left = 174
        Top = 32
        Width = 25
        Height = 30
        Frame.Color = clBlack
        Frame.DrawTop = False
        Frame.DrawBottom = False
        Frame.DrawLeft = False
        Frame.DrawRight = False
        Size.Values = (
          79.375
          460.375
          84.6666666666667
          66.1458333333333)
        Alignment = taCenter
        AlignToBand = False
        AutoSize = True
        AutoStretch = False
        Caption = '999'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'CordiaUPC'
        Font.Style = []
        ParentFont = False
        Transparent = True
        WordWrap = True
        FontSize = 16
      end
    end
  end
end
