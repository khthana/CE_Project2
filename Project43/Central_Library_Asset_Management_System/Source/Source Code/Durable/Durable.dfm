object Fr_Durable_Detail: TFr_Durable_Detail
  Left = 138
  Top = 211
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'รายละเอียดครุภัณฑ์'
  ClientHeight = 454
  ClientWidth = 763
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF004444
    44444444F877878874444444444444444444444F7877F88887F4444444444444
    444447878777F87887874444444444444777FF88777F78877788FFF744444444
    7888788777F80877F78888784444444478777FF778888888F787888874444444
    47787777888000808877777844444444444FF708F80888008888FFF444444444
    4444800087087F8880008F444444444444480000888887878000007444444444
    4480020888787880880000844444444444800008778080088880000744444444
    4480087788088800888200074444444444480887807FF7780888007444444444
    4447880808788888088887444444444444788800008888800088887444444444
    4788000887FF7FF78800008744444444888888807F7888FF8888087784444447
    77888808F7800088F8088808774444787880870888880888F807888888444778
    0888FF8888800808888FF88888844788808FF877F77808887887F78888877888
    80877F444780000844F77F78288877880008444448808008444478808888F788
    888444444888808844444788888788788F7F444448080887444444F788887788
    7F774444447888844444FFFF88887F87478884444447874444478887F8787784
    44788444444774444447087F4788788444444444444774444444FF444477F774
    4444444444444444444444444477FF74444444444444444444444444448F0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 9
    Top = 9
    Width = 742
    Height = 397
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'รายละเอียดทั่วไป'
      OnShow = TabSheet1Show
      object Label1: TLabel
        Left = 19
        Top = 33
        Width = 54
        Height = 14
        Caption = 'เลขครุภัณฑ์'
      end
      object Label3: TLabel
        Left = 52
        Top = 78
        Width = 22
        Height = 14
        Caption = 'ชนิด'
      end
      object Label2: TLabel
        Left = 362
        Top = 78
        Width = 37
        Height = 14
        Caption = 'ประเภท'
      end
      object Label12: TLabel
        Left = 43
        Top = 121
        Width = 31
        Height = 14
        Caption = 'สถานะ'
      end
      object Label4: TLabel
        Left = 181
        Top = 121
        Width = 23
        Height = 14
        Caption = 'ราคา'
      end
      object Label14: TLabel
        Left = 336
        Top = 121
        Width = 88
        Height = 14
        Caption = 'ระยะเวลาซ่อมบำรุง'
      end
      object Label9: TLabel
        Left = 17
        Top = 164
        Width = 54
        Height = 14
        Caption = 'ผู้รับผิดชอบ'
      end
      object Label11: TLabel
        Left = 336
        Top = 164
        Width = 18
        Height = 14
        Caption = 'ห้อง'
      end
      object Label5: TLabel
        Left = 34
        Top = 207
        Width = 34
        Height = 14
        Caption = 'วันที่ซื้อ'
      end
      object Label7: TLabel
        Left = 172
        Top = 207
        Width = 75
        Height = 14
        Caption = 'วันที่หมดประกัน'
      end
      object Label8: TLabel
        Left = 353
        Top = 207
        Width = 81
        Height = 14
        Caption = 'วันที่หมดประกัน2'
      end
      object Label13: TLabel
        Left = 17
        Top = 241
        Width = 54
        Height = 14
        Caption = 'รายละเอียด'
      end
      object Label15: TLabel
        Left = 43
        Top = 319
        Width = 28
        Height = 14
        Caption = 'บริษัท'
      end
      object Label16: TLabel
        Left = 362
        Top = 319
        Width = 34
        Height = 14
        Caption = 'ผู้ติดต่อ'
      end
      object Cb_Respond_Name: TComboBox
        Left = 86
        Top = 155
        Width = 225
        Height = 22
        TabStop = False
        ItemHeight = 14
        TabOrder = 17
        OnChange = Cb_Respond_NameChange
      end
      object Cb_Type: TComboBox
        Left = 86
        Top = 69
        Width = 265
        Height = 22
        TabStop = False
        ItemHeight = 14
        TabOrder = 16
        OnChange = Cb_TypeChange
      end
      object Ed_Durable_ID: TEdit
        Left = 86
        Top = 26
        Width = 130
        Height = 22
        Hint = 'ระบุเลขครุภัณฑ์'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnChange = Ed_Durable_IDChange
      end
      object Cb_Status: TComboBox
        Left = 86
        Top = 111
        Width = 79
        Height = 20
        Style = csOwnerDrawFixed
        ItemHeight = 14
        TabOrder = 2
        OnChange = Cb_StatusChange
      end
      object Ed_Price: TEdit
        Left = 215
        Top = 112
        Width = 96
        Height = 22
        Hint = 'ระบุราคาครุภัณฑ์'
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnChange = Ed_PriceChange
      end
      object Ed_Length_Maintain: TEdit
        Left = 439
        Top = 112
        Width = 27
        Height = 22
        Hint = 'ระบุระยะเลารับประกันครุภัณฑ์'
        MaxLength = 3
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnChange = Ed_Length_MaintainChange
        OnExit = Ed_Length_MaintainExit
      end
      object Cb_TypeMaintain: TComboBox
        Left = 474
        Top = 112
        Width = 53
        Height = 22
        Hint = 'เลือกหน่วยของการรับประกัน'
        Style = csDropDownList
        ItemHeight = 14
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnChange = Cb_TypeMaintainChange
        Items.Strings = (
          'ปี'
          'เดือน')
      end
      object Ed_Date_Buy: TEdit
        Left = 86
        Top = 198
        Width = 70
        Height = 22
        TabOrder = 9
        OnChange = Ed_Date_BuyChange
        OnExit = Ed_Date_BuyExit
      end
      object Ed_Date_Expire1: TEdit
        Left = 258
        Top = 198
        Width = 70
        Height = 22
        TabOrder = 10
        OnChange = Ed_Date_Expire1Change
        OnExit = Ed_Date_Expire1Exit
      end
      object Ed_Date_Expire2: TEdit
        Left = 457
        Top = 198
        Width = 70
        Height = 22
        TabOrder = 11
        OnChange = Ed_Date_Expire2Change
        OnExit = Ed_Date_Expire2Exit
      end
      object Mm_Detail: TMemo
        Left = 86
        Top = 241
        Width = 570
        Height = 53
        TabOrder = 12
        OnChange = Mm_DetailChange
      end
      object Ed_Contact_Name: TEdit
        Left = 405
        Top = 310
        Width = 251
        Height = 22
        TabOrder = 14
        OnChange = Ed_Contact_NameChange
      end
      object Ed_Type: TEdit
        Left = 88
        Top = 71
        Width = 246
        Height = 18
        BorderStyle = bsNone
        TabOrder = 1
        OnChange = Ed_TypeChange
        OnExit = Ed_TypeExit
        OnKeyDown = Ed_TypeKeyDown
      end
      object Ed_Category: TEdit
        Left = 414
        Top = 69
        Width = 113
        Height = 22
        TabStop = False
        ReadOnly = True
        TabOrder = 15
        OnChange = Ed_CategoryChange
      end
      object Ed_Respond_Name2: TEdit
        Left = 88
        Top = 157
        Width = 206
        Height = 18
        BorderStyle = bsNone
        TabOrder = 6
        OnChange = Ed_Respond_Name2Change
      end
      object Cb_Room: TComboBox
        Left = 366
        Top = 157
        Width = 198
        Height = 22
        TabStop = False
        ItemHeight = 14
        TabOrder = 8
        OnChange = Cb_RoomChange
      end
      object Ed_Room: TEdit
        Left = 368
        Top = 159
        Width = 180
        Height = 18
        BorderStyle = bsNone
        TabOrder = 7
        OnChange = Ed_RoomChange
      end
      object Cb_Select_Company: TComboBox
        Left = 86
        Top = 310
        Width = 249
        Height = 22
        TabStop = False
        ItemHeight = 14
        TabOrder = 18
        OnChange = Cb_Select_CompanyChange
      end
      object Ed_Select_Company: TEdit
        Left = 88
        Top = 312
        Width = 231
        Height = 18
        BorderStyle = bsNone
        TabOrder = 13
        OnChange = Ed_Select_CompanyChange
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'รายละเอียดคอมพิวเตอร์'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object Label6: TLabel
        Left = 34
        Top = 86
        Width = 22
        Height = 14
        Caption = 'CPU'
      end
      object Label10: TLabel
        Left = 17
        Top = 129
        Width = 35
        Height = 14
        Caption = 'Monitor'
      end
      object Label17: TLabel
        Left = 9
        Top = 172
        Width = 47
        Height = 14
        Caption = 'Hard Disk'
      end
      object Label18: TLabel
        Left = 34
        Top = 215
        Width = 24
        Height = 14
        Caption = 'RAM'
      end
      object Label19: TLabel
        Left = 26
        Top = 258
        Width = 32
        Height = 14
        Caption = 'Mouse'
      end
      object Label20: TLabel
        Left = 370
        Top = 86
        Width = 49
        Height = 14
        Caption = 'Key Board'
      end
      object Label21: TLabel
        Left = 370
        Top = 129
        Width = 46
        Height = 14
        Caption = 'LAN Card'
      end
      object Label22: TLabel
        Left = 379
        Top = 172
        Width = 43
        Height = 14
        Caption = 'CD-ROM'
      end
      object Label23: TLabel
        Left = 362
        Top = 215
        Width = 56
        Height = 14
        Caption = 'Sound Card'
      end
      object Label24: TLabel
        Left = 379
        Top = 258
        Width = 40
        Height = 14
        Caption = 'Speaker'
      end
      object Ed_CPU: TEdit
        Left = 69
        Top = 78
        Width = 277
        Height = 22
        TabOrder = 0
        OnChange = Ed_CPUChange
      end
      object Ed_Monitor: TEdit
        Left = 69
        Top = 121
        Width = 277
        Height = 22
        TabOrder = 1
        OnChange = Ed_MonitorChange
      end
      object Ed_Harddisk: TEdit
        Left = 69
        Top = 164
        Width = 277
        Height = 22
        TabOrder = 2
        OnChange = Ed_HarddiskChange
      end
      object Ed_Ram: TEdit
        Left = 69
        Top = 207
        Width = 277
        Height = 22
        TabOrder = 3
        OnChange = Ed_RamChange
      end
      object Ed_Keyboard: TEdit
        Left = 439
        Top = 78
        Width = 277
        Height = 22
        TabOrder = 5
        OnChange = Ed_KeyboardChange
      end
      object Ed_Mouse: TEdit
        Left = 69
        Top = 250
        Width = 277
        Height = 22
        TabOrder = 4
        OnChange = Ed_MouseChange
      end
      object Ed_Lancard: TEdit
        Left = 439
        Top = 121
        Width = 277
        Height = 22
        TabOrder = 6
        OnChange = Ed_LancardChange
      end
      object Ed_CDROM: TEdit
        Left = 439
        Top = 163
        Width = 277
        Height = 22
        TabOrder = 7
        OnChange = Ed_CDROMChange
      end
      object Ed_Soundcard: TEdit
        Left = 439
        Top = 207
        Width = 277
        Height = 22
        TabOrder = 8
        OnChange = Ed_SoundcardChange
      end
      object Ed_Speaker: TEdit
        Left = 439
        Top = 250
        Width = 277
        Height = 22
        TabOrder = 9
        OnChange = Ed_SpeakerChange
      end
      object ComboBox1: TComboBox
        Left = 70
        Top = 79
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 10
        Visible = False
      end
      object ComboBox2: TComboBox
        Left = 68
        Top = 120
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 11
        Visible = False
      end
      object ComboBox3: TComboBox
        Left = 68
        Top = 164
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 12
        Visible = False
      end
      object ComboBox4: TComboBox
        Left = 68
        Top = 206
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 13
        Visible = False
      end
      object ComboBox5: TComboBox
        Left = 70
        Top = 249
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 14
        Visible = False
      end
      object ComboBox6: TComboBox
        Left = 429
        Top = 79
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 15
        Visible = False
      end
      object ComboBox7: TComboBox
        Left = 427
        Top = 120
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 16
        Visible = False
      end
      object ComboBox8: TComboBox
        Left = 426
        Top = 163
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 17
        Visible = False
      end
      object ComboBox9: TComboBox
        Left = 426
        Top = 206
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 18
        Visible = False
      end
      object ComboBox10: TComboBox
        Left = 424
        Top = 250
        Width = 303
        Height = 22
        ItemHeight = 0
        TabOrder = 19
        Visible = False
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'รายละเอียดส่งซ่อม'
      ImageIndex = 2
      object GroupBox10: TGroupBox
        Left = 17
        Top = 13
        Width = 699
        Height = 139
        Caption = 'รายละเอียดการซ่อม'
        TabOrder = 1
        object Label43: TLabel
          Left = 17
          Top = 34
          Width = 52
          Height = 14
          Caption = 'วันที่ส่งซ่อม'
        end
        object Label44: TLabel
          Left = 164
          Top = 34
          Width = 88
          Height = 14
          Caption = 'วันที่คาดว่าจะได้รับ'
        end
        object Label45: TLabel
          Left = 362
          Top = 34
          Width = 38
          Height = 14
          Caption = 'ผู้ส่งซ่อม'
        end
        object Label46: TLabel
          Left = 43
          Top = 60
          Width = 29
          Height = 14
          Caption = 'อาการ'
        end
        object Label47: TLabel
          Left = 362
          Top = 60
          Width = 89
          Height = 14
          Caption = 'อุปกรณ์ที่ติดไปด้วย'
        end
        object Ed_Date_Take: TEdit
          Left = 267
          Top = 26
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object Ed_Date_Repair: TEdit
          Left = 78
          Top = 26
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object Mm_Condition: TMemo
          Left = 78
          Top = 60
          Width = 259
          Height = 62
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object Mm_Attach_Item: TMemo
          Left = 465
          Top = 60
          Width = 208
          Height = 62
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object Ed_Officer_Name: TEdit
          Left = 414
          Top = 26
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
      end
      object GroupBox9: TGroupBox
        Left = 17
        Top = 164
        Width = 699
        Height = 164
        Caption = 'บริษัทที่ส่งซ่อม'
        TabOrder = 2
        object Label32: TLabel
          Left = 26
          Top = 26
          Width = 41
          Height = 14
          Caption = 'ชื่อบริษัท'
        end
        object Label34: TLabel
          Left = 52
          Top = 52
          Width = 20
          Height = 14
          Caption = 'ที่อยู่'
        end
        object Label40: TLabel
          Left = 362
          Top = 26
          Width = 65
          Height = 14
          Caption = 'เบอร์โทรศัพท์'
        end
        object Label41: TLabel
          Left = 370
          Top = 129
          Width = 59
          Height = 14
          Caption = 'เบอร์โทรสาร'
        end
        object Label42: TLabel
          Left = 34
          Top = 138
          Width = 34
          Height = 14
          Caption = 'ผู้ติดต่อ'
        end
        object Ed_Contact_Name2: TEdit
          Left = 78
          Top = 129
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object Ed_Company_Name: TEdit
          Left = 78
          Top = 17
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object Mm_Company_Address: TMemo
          Left = 78
          Top = 52
          Width = 259
          Height = 61
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object Ed_Company_Phone1: TEdit
          Left = 439
          Top = 17
          Width = 131
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object Ed_Company_Phone2: TEdit
          Left = 439
          Top = 52
          Width = 131
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object Ed_Company_Phone3: TEdit
          Left = 439
          Top = 86
          Width = 131
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object Ed_Company_Fax: TEdit
          Left = 439
          Top = 121
          Width = 131
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
      end
      object Button2: TButton
        Left = 620
        Top = 337
        Width = 81
        Height = 27
        Caption = 'รับคืน'
        TabOrder = 0
        OnClick = Button2Click
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'รายละเอียดการจำหน่าย'
      ImageIndex = 3
      object GroupBox12: TGroupBox
        Left = 17
        Top = 30
        Width = 699
        Height = 264
        Caption = 'รายละเอียดการจำหน่าย'
        TabOrder = 0
        object Label62: TLabel
          Left = 34
          Top = 34
          Width = 59
          Height = 14
          Caption = 'วันที่จำหน่าย'
        end
        object Label63: TLabel
          Left = 198
          Top = 34
          Width = 59
          Height = 14
          Caption = 'เลขที่เอกสาร'
        end
        object Label64: TLabel
          Left = 17
          Top = 69
          Width = 71
          Height = 14
          Caption = 'กรรมการคนที่1'
        end
        object Label65: TLabel
          Left = 17
          Top = 103
          Width = 72
          Height = 14
          Caption = 'กรรมการคนที่2'
        end
        object Label66: TLabel
          Left = 17
          Top = 138
          Width = 72
          Height = 14
          Caption = 'กรรมการคนที่3'
        end
        object Label67: TLabel
          Left = 60
          Top = 172
          Width = 32
          Height = 14
          Caption = 'เหตุผล'
        end
        object Ed_Date_Over: TEdit
          Left = 103
          Top = 26
          Width = 79
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object Ed_Document_ID: TEdit
          Left = 267
          Top = 26
          Width = 199
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object Ed_Name1: TEdit
          Left = 103
          Top = 60
          Width = 363
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object Ed_Name2: TEdit
          Left = 103
          Top = 95
          Width = 363
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object Ed_Name3: TEdit
          Left = 103
          Top = 129
          Width = 363
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object Mm_Reason: TMemo
          Left = 103
          Top = 164
          Width = 363
          Height = 70
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'รายเอียดการบริจาค'
      ImageIndex = 4
      object GroupBox14: TGroupBox
        Left = 43
        Top = 39
        Width = 647
        Height = 272
        Caption = 'รายละเอียดการบริจาค'
        TabOrder = 0
        object Label77: TLabel
          Left = 34
          Top = 43
          Width = 52
          Height = 14
          Caption = 'วันที่บริจาค'
        end
        object Label78: TLabel
          Left = 198
          Top = 43
          Width = 59
          Height = 14
          Caption = 'เลขที่เอกสาร'
        end
        object Label79: TLabel
          Left = 34
          Top = 78
          Width = 51
          Height = 14
          Caption = 'ผู้รับบริจาค'
        end
        object Label80: TLabel
          Left = 52
          Top = 164
          Width = 32
          Height = 14
          Caption = 'เหตุผล'
        end
        object Ed_Date_Give: TEdit
          Left = 95
          Top = 34
          Width = 78
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object Ed_Give_Document: TEdit
          Left = 267
          Top = 34
          Width = 199
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object Mm_Receiver: TMemo
          Left = 95
          Top = 78
          Width = 371
          Height = 70
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object Mm_Give_Reason: TMemo
          Left = 95
          Top = 164
          Width = 371
          Height = 78
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'ประวัติการซ่อม'
      ImageIndex = 5
      object Lv_History: TListView
        Left = 17
        Top = 17
        Width = 699
        Height = 329
        Columns = <
          item
            Caption = 'อาการ'
            Width = 215
          end
          item
            Caption = 'ค่าใช้จ่าย'
            Width = 86
          end
          item
            Caption = 'ผลการซ่อม'
            Width = 68
          end
          item
            Caption = 'รายละเอียด'
            Width = 194
          end
          item
            Caption = 'วันที่ซ่อม'
            Width = 75
          end
          item
            Caption = 'วันรับคืน'
            Width = 75
          end
          item
            Caption = 'บริษัทที่ซ่อม'
            Width = 108
          end
          item
            Caption = 'ผู้รับคืน'
            Width = 108
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 508
    Top = 414
    Width = 81
    Height = 26
    Caption = 'ตกลง'
    TabOrder = 1
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      3333333333333333333333330000333333333333333333333333F33333333333
      00003333344333333333333333388F3333333333000033334224333333333333
      338338F3333333330000333422224333333333333833338F3333333300003342
      222224333333333383333338F3333333000034222A22224333333338F338F333
      8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
      33333338F83338F338F33333000033A33333A222433333338333338F338F3333
      0000333333333A222433333333333338F338F33300003333333333A222433333
      333333338F338F33000033333333333A222433333333333338F338F300003333
      33333333A222433333333333338F338F00003333333333333A22433333333333
      3338F38F000033333333333333A223333333333333338F830000333333333333
      333A333333333333333338330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 620
    Top = 414
    Width = 81
    Height = 26
    Cancel = True
    Caption = 'ยกเลิก'
    Default = True
    ModalResult = 2
    TabOrder = 2
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333333333000033338833333333333333333F333333333333
      0000333911833333983333333388F333333F3333000033391118333911833333
      38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
      911118111118333338F3338F833338F3000033333911111111833333338F3338
      3333F8330000333333911111183333333338F333333F83330000333333311111
      8333333333338F3333383333000033333339111183333333333338F333833333
      00003333339111118333333333333833338F3333000033333911181118333333
      33338333338F333300003333911183911183333333383338F338F33300003333
      9118333911183333338F33838F338F33000033333913333391113333338FF833
      38F338F300003333333333333919333333388333338FFF830000333333333333
      3333333333333333333888330000333333333333333333333333333333333333
      0000}
    NumGlyphs = 2
  end
  object Button1: TButton
    Left = 86
    Top = 414
    Width = 81
    Height = 26
    Caption = 'ลบครุภัณฑ์'
    ModalResult = 2
    TabOrder = 3
    OnClick = Button1Click
  end
end
