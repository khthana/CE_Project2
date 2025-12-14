object Fr_Durable: TFr_Durable
  Left = 161
  Top = 107
  BiDiMode = bdLeftToRight
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'ครุภัณฑ์'
  ClientHeight = 596
  ClientWidth = 794
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
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object PageSelect: TPageControl
    Left = 9
    Top = 9
    Width = 776
    Height = 578
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'ครุภัณฑ์'
      OnShow = TabSheet1Show
      object Label10: TLabel
        Left = 17
        Top = 26
        Width = 54
        Height = 14
        Caption = 'เลขครุภัณฑ์'
      end
      object Label24: TLabel
        Left = 250
        Top = 26
        Width = 22
        Height = 14
        Caption = 'ชนิด'
      end
      object Label25: TLabel
        Left = 534
        Top = 26
        Width = 37
        Height = 14
        Caption = 'ประเภท'
      end
      object Label26: TLabel
        Left = 293
        Top = 69
        Width = 18
        Height = 14
        Caption = 'ห้อง'
      end
      object Label27: TLabel
        Left = 517
        Top = 69
        Width = 31
        Height = 14
        Caption = 'สถานะ'
      end
      object Label28: TLabel
        Left = 52
        Top = 69
        Width = 19
        Height = 14
        Caption = 'ฝ่าย'
      end
      object Label90: TLabel
        Left = 536
        Top = 520
        Width = 78
        Height = 14
        Caption = 'จำนวนทั้งหมด = '
      end
      object Cb_Type2: TDBLookupComboBox
        Left = 284
        Top = 17
        Width = 234
        Height = 22
        KeyField = 'Type_ID'
        ListField = 'Type_Name'
        ListSource = DataModule1.Ds_Type
        TabOrder = 2
        OnMouseDown = Cb_Type2MouseDown
      end
      object Lv_Durable_Detail: TListView
        Left = 10
        Top = 102
        Width = 750
        Height = 411
        Columns = <
          item
            Caption = 'เลขครุภัณฑ์'
            Width = 129
          end
          item
            Caption = 'ชนิด'
            Width = 216
          end
          item
            Caption = 'ประเภท'
            Width = 86
          end
          item
            Caption = 'ห้อง'
            Width = 118
          end
          item
            Caption = 'ฝ่าย'
            Width = 140
          end
          item
            Caption = 'สถานะ'
            Width = 56
          end>
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = Lv_Durable_DetailDblClick
        OnKeyDown = Lv_Durable_DetailKeyDown
        OnKeyPress = Lv_Durable_DetailKeyPress
      end
      object Ed_Durable_ID2: TEdit
        Left = 86
        Top = 17
        Width = 156
        Height = 22
        TabOrder = 1
      end
      object Cb_Room2: TDBLookupComboBox
        Left = 319
        Top = 60
        Width = 173
        Height = 22
        KeyField = 'Room_ID'
        ListField = 'Room_Name'
        ListSource = DataModule1.Ds_Room_Detail
        TabOrder = 5
        OnMouseDown = Cb_Room2MouseDown
      end
      object Cb_Status2: TComboBox
        Left = 560
        Top = 60
        Width = 70
        Height = 22
        Style = csDropDownList
        ItemHeight = 14
        TabOrder = 6
        OnDropDown = Cb_Status2DropDown
        Items.Strings = (
          'ดี'
          'เสีย'
          'ส่งซ่อม'
          'บริจาค'
          'จำหน่าย')
      end
      object Cb_Category: TComboBox
        Left = 586
        Top = 17
        Width = 104
        Height = 22
        Style = csDropDownList
        ItemHeight = 14
        TabOrder = 3
        OnDropDown = Cb_CategoryDropDown
        Items.Strings = (
          'สำนักงาน'
          'อาคาร'
          'คอมพิวเตอร์')
      end
      object Bt_Show_Durable: TButton
        Left = 655
        Top = 60
        Width = 96
        Height = 27
        Caption = 'แสดงครุภัณฑ์'
        ModalResult = 1
        TabOrder = 7
        OnClick = Bt_Show_DurableClick
      end
      object Cb_Department_Name2: TDBLookupComboBox
        Left = 87
        Top = 60
        Width = 182
        Height = 22
        KeyField = 'Department_ID'
        ListField = 'Department_Name'
        ListSource = DataModule1.Ds_Department_Detail
        TabOrder = 4
        OnMouseDown = Cb_Department_Name2MouseDown
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'เพิ่ม'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object GroupBox1: TGroupBox
        Left = 16
        Top = 11
        Width = 734
        Height = 328
        Caption = 'รายละเอียด'
        TabOrder = 0
        object Label1: TLabel
          Left = 19
          Top = 42
          Width = 54
          Height = 14
          Caption = 'เลขครุภัณฑ์'
        end
        object Label2: TLabel
          Left = 362
          Top = 86
          Width = 37
          Height = 14
          Caption = 'ประเภท'
        end
        object Label3: TLabel
          Left = 52
          Top = 86
          Width = 22
          Height = 14
          Caption = 'ชนิด'
        end
        object Label4: TLabel
          Left = 181
          Top = 129
          Width = 23
          Height = 14
          Caption = 'ราคา'
        end
        object Label5: TLabel
          Left = 34
          Top = 215
          Width = 34
          Height = 14
          Caption = 'วันที่ซื้อ'
        end
        object Label6: TLabel
          Left = 179
          Top = 215
          Width = 91
          Height = 14
          Caption = 'ระยะเวลารับประกัน'
        end
        object Label7: TLabel
          Left = 379
          Top = 215
          Width = 75
          Height = 14
          Caption = 'วันที่หมดประกัน'
        end
        object Label8: TLabel
          Left = 543
          Top = 215
          Width = 81
          Height = 14
          Caption = 'วันที่หมดประกัน2'
        end
        object Label9: TLabel
          Left = 17
          Top = 172
          Width = 54
          Height = 14
          Caption = 'ผู้รับผิดชอบ'
        end
        object Label11: TLabel
          Left = 370
          Top = 172
          Width = 18
          Height = 14
          Caption = 'ห้อง'
        end
        object Label12: TLabel
          Left = 43
          Top = 129
          Width = 31
          Height = 14
          Caption = 'สถานะ'
        end
        object Label13: TLabel
          Left = 17
          Top = 250
          Width = 54
          Height = 14
          Caption = 'รายละเอียด'
        end
        object Label14: TLabel
          Left = 336
          Top = 129
          Width = 88
          Height = 14
          Caption = 'ระยะเวลาซ่อมบำรุง'
        end
        object Label82: TLabel
          Left = 465
          Top = 43
          Width = 14
          Height = 14
          Caption = 'ชุด'
        end
        object Ed_Date_Buy: TDateTimePicker
          Left = 87
          Top = 207
          Width = 86
          Height = 22
          CalAlignment = dtaLeft
          Date = 36979
          Time = 36979
          Checked = False
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 11
        end
        object Ed_Category: TEdit
          Left = 406
          Top = 78
          Width = 104
          Height = 22
          TabStop = False
          ReadOnly = True
          TabOrder = 21
          OnChange = Ed_CategoryChange
        end
        object Cb_Type: TComboBox
          Left = 86
          Top = 77
          Width = 260
          Height = 22
          TabStop = False
          ItemHeight = 14
          TabOrder = 20
          OnChange = Cb_TypeChange
        end
        object Cb_Room: TComboBox
          Left = 397
          Top = 164
          Width = 198
          Height = 22
          TabStop = False
          ItemHeight = 14
          TabOrder = 19
          OnChange = Cb_RoomChange
        end
        object Ed_Durable_ID: TEdit
          Left = 86
          Top = 34
          Width = 130
          Height = 22
          Hint = 'ระบุเลขครุภัณฑ์'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object Button1: TButton
          Left = 525
          Top = 78
          Width = 95
          Height = 26
          Hint = 'คลิ๊กเพื่อสร้างชนิดใหม่ตามต้องการ'
          Caption = 'เพิ่มชนิดครุภัณฑ์'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = Button1Click
        end
        object Ed_Price: TEdit
          Left = 215
          Top = 121
          Width = 96
          Height = 22
          Hint = 'ระบุราคาครุภัณฑ์'
          BiDiMode = bdLeftToRight
          ParentBiDiMode = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object Ed_Length_Guarantee: TEdit
          Left = 276
          Top = 207
          Width = 27
          Height = 22
          Hint = 'ระบุระยะเลารับประกันครุภัณฑ์'
          MaxLength = 3
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          OnExit = Ed_Length_GuaranteeExit
        end
        object Cb_TypeGuarantee: TComboBox
          Left = 310
          Top = 207
          Width = 53
          Height = 22
          Hint = 'เลือกหน่วยของการรับประกัน'
          Style = csDropDownList
          ItemHeight = 14
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          OnChange = Cb_TypeGuaranteeChange
          Items.Strings = (
            'ปี'
            'เดือน')
        end
        object Cb_Status: TComboBox
          Left = 86
          Top = 121
          Width = 79
          Height = 22
          Style = csDropDownList
          ItemHeight = 14
          TabOrder = 5
          Items.Strings = (
            'ดี'
            'เสีย')
        end
        object Mm_Detail: TMemo
          Left = 86
          Top = 250
          Width = 398
          Height = 53
          TabOrder = 16
        end
        object Bt_Computer_Detail: TButton
          Left = 500
          Top = 250
          Width = 199
          Height = 27
          Caption = 'รายละเอียดคอมพิวเตอร์'
          Enabled = False
          TabOrder = 17
          OnClick = Bt_Computer_DetailClick
        end
        object Ed_Length_Maintain: TEdit
          Left = 439
          Top = 121
          Width = 27
          Height = 22
          Hint = 'ระบุระยะเลารับประกันครุภัณฑ์'
          MaxLength = 3
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnExit = Ed_Length_MaintainExit
        end
        object Cb_TypeMaintain: TComboBox
          Left = 474
          Top = 121
          Width = 53
          Height = 22
          Hint = 'เลือกหน่วยของการรับประกัน'
          Style = csDropDownList
          ItemHeight = 14
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          Items.Strings = (
            'ปี'
            'เดือน')
        end
        object Ed_Date_Expire1: TEdit
          Left = 461
          Top = 208
          Width = 70
          Height = 22
          TabOrder = 14
          OnExit = Ed_Date_ExpireExit
        end
        object Ed_Date_Expire2: TEdit
          Left = 638
          Top = 207
          Width = 70
          Height = 22
          TabOrder = 15
          OnExit = Ed_Date_Expire2Exit
        end
        object Ck_Many: TCheckBox
          Left = 293
          Top = 43
          Width = 122
          Height = 18
          Caption = 'เพิ่มเป็นชุด จำนวน'
          TabOrder = 1
          OnClick = Ck_ManyClick
        end
        object Ed_Number: TEdit
          Left = 414
          Top = 34
          Width = 44
          Height = 22
          Color = clMenu
          Enabled = False
          TabOrder = 2
          OnExit = Ed_NumberExit
        end
        object Cb_Respond_Name: TComboBox
          Left = 86
          Top = 165
          Width = 259
          Height = 22
          TabStop = False
          ItemHeight = 14
          TabOrder = 18
          OnChange = Cb_Respond_NameChange
        end
        object Ed_Respond_Name2: TEdit
          Left = 88
          Top = 167
          Width = 240
          Height = 18
          BorderStyle = bsNone
          TabOrder = 9
        end
        object Ed_Room: TEdit
          Left = 399
          Top = 166
          Width = 180
          Height = 18
          BorderStyle = bsNone
          TabOrder = 10
        end
        object Ed_Type: TEdit
          Left = 88
          Top = 79
          Width = 242
          Height = 18
          BorderStyle = bsNone
          TabOrder = 3
          OnExit = Ed_TypeExit
          OnKeyDown = Ed_TypeKeyDown
        end
      end
      object GroupBox2: TGroupBox
        Left = 17
        Top = 353
        Width = 734
        Height = 105
        Caption = 'บริษัทผู้ขาย'
        TabOrder = 1
        object Label15: TLabel
          Left = 17
          Top = 34
          Width = 28
          Height = 14
          Caption = 'บริษัท'
        end
        object Label16: TLabel
          Left = 17
          Top = 69
          Width = 34
          Height = 14
          Caption = 'ผู้ติดต่อ'
        end
        object Cb_Select_Company: TComboBox
          Left = 61
          Top = 26
          Width = 249
          Height = 22
          TabStop = False
          ItemHeight = 14
          TabOrder = 3
          OnChange = Cb_Select_CompanyChange
        end
        object Bt_Insert_Company: TButton
          Left = 353
          Top = 26
          Width = 81
          Height = 27
          Caption = 'เพิ่มบริษัท'
          TabOrder = 1
          OnClick = Bt_Insert_CompanyClick
        end
        object Ed_Contact_Name: TEdit
          Left = 60
          Top = 60
          Width = 251
          Height = 22
          TabOrder = 2
        end
        object Ed_Select_Company: TEdit
          Left = 63
          Top = 28
          Width = 231
          Height = 18
          BorderStyle = bsNone
          TabOrder = 0
        end
      end
      object BitBtn2: TBitBtn
        Left = 551
        Top = 474
        Width = 81
        Height = 27
        Caption = 'ตกลง'
        TabOrder = 2
        OnClick = BitBtn2Click
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
      object BitBtn3: TBitBtn
        Left = 655
        Top = 474
        Width = 81
        Height = 27
        Caption = 'เคลียร์'
        TabOrder = 3
        OnClick = BitBtn3Click
        Kind = bkRetry
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'ส่งซ่อม'
      ImageIndex = 3
      OnShow = TabSheet4Show
      object Label29: TLabel
        Left = 28
        Top = 25
        Width = 54
        Height = 14
        Caption = 'เลขครุภัณฑ์'
      end
      object Cb_Repair_ID: TComboBox
        Left = 97
        Top = 18
        Width = 145
        Height = 22
        TabStop = False
        ItemHeight = 14
        TabOrder = 7
        Text = 'Cb_Repair_ID'
        OnChange = Cb_Repair_IDChange
      end
      object GroupBox8: TGroupBox
        Left = 17
        Top = 52
        Width = 725
        Height = 130
        Caption = 'รายละเอียด'
        TabOrder = 2
        object Label30: TLabel
          Left = 362
          Top = 34
          Width = 37
          Height = 14
          Caption = 'ประเภท'
        end
        object Label31: TLabel
          Left = 43
          Top = 34
          Width = 22
          Height = 14
          Caption = 'ชนิด'
        end
        object Label35: TLabel
          Left = 353
          Top = 103
          Width = 75
          Height = 14
          Caption = 'วันที่หมดประกัน'
        end
        object Label36: TLabel
          Left = 526
          Top = 103
          Width = 81
          Height = 14
          Caption = 'วันที่หมดประกัน2'
        end
        object Label37: TLabel
          Left = 9
          Top = 69
          Width = 54
          Height = 14
          Caption = 'ผู้รับผิดชอบ'
        end
        object Label38: TLabel
          Left = 362
          Top = 69
          Width = 18
          Height = 14
          Caption = 'ห้อง'
        end
        object Label39: TLabel
          Left = 526
          Top = 34
          Width = 31
          Height = 14
          Caption = 'สถานะ'
        end
        object Label33: TLabel
          Left = 17
          Top = 103
          Width = 48
          Height = 14
          Caption = 'บริษัทที่ซื้อ'
        end
        object Ed_Date_Expire12: TEdit
          Left = 439
          Top = 95
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object Ed_Date_Expire22: TEdit
          Left = 620
          Top = 95
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object Ed_Type_Name: TEdit
          Left = 78
          Top = 26
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object Ed_Category2: TEdit
          Left = 414
          Top = 26
          Width = 87
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object Ed_Status: TEdit
          Left = 569
          Top = 26
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object Ed_Respond_Name: TEdit
          Left = 78
          Top = 60
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object Ed_Room_Name: TEdit
          Left = 388
          Top = 60
          Width = 130
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object Ed_Company_Name: TEdit
          Left = 78
          Top = 95
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
      end
      object GroupBox9: TGroupBox
        Left = 17
        Top = 190
        Width = 734
        Height = 164
        Caption = 'บริษัทที่ส่งซ่อม'
        TabOrder = 3
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
        object Ed_Company_Fax: TEdit
          Left = 440
          Top = 121
          Width = 130
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 8
        end
        object Ed_Company_Phone3: TEdit
          Left = 440
          Top = 86
          Width = 130
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
        object Ed_Company_Phone2: TEdit
          Left = 439
          Top = 53
          Width = 131
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object Ed_Company_Phone1: TEdit
          Left = 440
          Top = 17
          Width = 129
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object Mm_Company_Address: TMemo
          Left = 78
          Top = 52
          Width = 259
          Height = 71
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object Cb_Company_Name2: TComboBox
          Left = 78
          Top = 17
          Width = 258
          Height = 22
          TabStop = False
          ItemHeight = 14
          TabOrder = 3
          OnChange = Cb_Company_Name2Change
        end
        object Button2: TButton
          Left = 612
          Top = 34
          Width = 80
          Height = 27
          Caption = 'เพิ่มบริษัท'
          TabOrder = 1
          OnClick = Button2Click
        end
        object Ed_Contact_Name2: TEdit
          Left = 78
          Top = 129
          Width = 259
          Height = 22
          TabOrder = 2
        end
        object Ed_Company_Name2: TEdit
          Left = 80
          Top = 19
          Width = 240
          Height = 18
          BorderStyle = bsNone
          TabOrder = 0
          OnExit = Ed_Company_Name2Exit
          OnKeyDown = Ed_Company_Name2KeyDown
        end
      end
      object Ed_Repair_ID: TEdit
        Left = 99
        Top = 20
        Width = 125
        Height = 18
        Hint = 'ระบุเลขครุภัณฑ์'
        BorderStyle = bsNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = Ed_Repair_IDExit
        OnKeyDown = Ed_Repair_IDKeyDown
      end
      object GroupBox10: TGroupBox
        Left = 17
        Top = 362
        Width = 734
        Height = 139
        Caption = 'รายละเอียดการซ่อม'
        TabOrder = 4
        object Label43: TLabel
          Left = 17
          Top = 34
          Width = 52
          Height = 14
          Caption = 'วันที่ส่งซ่อม'
        end
        object Label44: TLabel
          Left = 172
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
        object Ed_Date_Repair: TDateTimePicker
          Left = 77
          Top = 26
          Width = 87
          Height = 22
          CalAlignment = dtaLeft
          Date = 36979
          Time = 36979
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
        object Ed_Date_Take: TDateTimePicker
          Left = 266
          Top = 26
          Width = 85
          Height = 22
          CalAlignment = dtaLeft
          Date = 36979
          Time = 36979
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
        object Cb_Officer_Name: TComboBox
          Left = 414
          Top = 26
          Width = 257
          Height = 22
          TabStop = False
          ItemHeight = 14
          TabOrder = 5
          OnChange = Cb_Officer_NameChange
        end
        object Mm_Condition: TMemo
          Left = 78
          Top = 60
          Width = 259
          Height = 62
          TabOrder = 3
        end
        object Mm_Attach_Item: TMemo
          Left = 465
          Top = 60
          Width = 208
          Height = 62
          TabOrder = 4
        end
        object Ed_Officer_Name2: TEdit
          Left = 416
          Top = 28
          Width = 238
          Height = 18
          BorderStyle = bsNone
          TabOrder = 2
        end
      end
      object BitBtn1: TBitBtn
        Left = 532
        Top = 509
        Width = 81
        Height = 27
        Caption = 'ตกลง'
        TabOrder = 5
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
      object BitBtn4: TBitBtn
        Left = 646
        Top = 508
        Width = 81
        Height = 27
        Caption = 'เคลียร์'
        TabOrder = 6
        OnClick = BitBtn4Click
        Kind = bkRetry
      end
      object Button4: TButton
        Left = 638
        Top = 18
        Width = 98
        Height = 27
        Caption = 'ประวัติการซ่อม'
        Enabled = False
        TabOrder = 1
        OnClick = Button4Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'รับคืน'
      ImageIndex = 4
      OnShow = TabSheet5Show
      object Label48: TLabel
        Left = 17
        Top = 26
        Width = 54
        Height = 14
        Caption = 'เลขครุภัณฑ์'
      end
      object Label49: TLabel
        Left = 414
        Top = 26
        Width = 88
        Height = 14
        Caption = 'วันที่คาดว่าจะได้รับ'
      end
      object Label50: TLabel
        Left = 267
        Top = 26
        Width = 52
        Height = 14
        Caption = 'วันที่ส่งซ่อม'
      end
      object Label51: TLabel
        Left = 9
        Top = 60
        Width = 66
        Height = 14
        Caption = 'บริษัทที่ส่งซ่อม'
      end
      object Label52: TLabel
        Left = 310
        Top = 60
        Width = 38
        Height = 14
        Caption = 'ผู้ส่งซ่อม'
      end
      object Label91: TLabel
        Left = 560
        Top = 520
        Width = 37
        Height = 14
        Caption = 'Label91'
      end
      object Cb_Repair_ID2: TComboBox
        Left = 86
        Top = 17
        Width = 171
        Height = 22
        TabStop = False
        ItemHeight = 14
        TabOrder = 8
        OnChange = Cb_Repair_ID2Change
      end
      object Lv_Repair: TListView
        Left = 17
        Top = 88
        Width = 734
        Height = 419
        Columns = <
          item
            Caption = 'เลขครุภัณฑ์'
            Width = 108
          end
          item
            Caption = 'วันที่ซ่อม'
            Width = 75
          end
          item
            Caption = 'วันที่จะได้รับ'
            Width = 75
          end
          item
            Caption = 'อาการ'
            Width = 188
          end
          item
            Caption = 'บริษัทที่ส่งซ่อม'
            Width = 135
          end
          item
            Caption = 'ผู้ส่งซ่อม'
            Width = 135
          end
          item
            Caption = 'ผู้ติดต่อ'
            Width = 135
          end
          item
            Caption = 'อุปกรณืที่ติดไปด้วย'
            Width = 135
          end>
        GridLines = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = Lv_RepairDblClick
        OnKeyPress = Lv_RepairKeyPress
      end
      object Ed_Repair_ID2: TEdit
        Left = 88
        Top = 19
        Width = 150
        Height = 18
        BorderStyle = bsNone
        TabOrder = 1
      end
      object Cb_Diff: TComboBox
        Left = 517
        Top = 17
        Width = 44
        Height = 22
        Style = csDropDownList
        ItemHeight = 14
        TabOrder = 3
        Items.Strings = (
          '='
          '<'
          '>')
      end
      object Ed_Date_Take2: TEdit
        Left = 560
        Top = 17
        Width = 70
        Height = 22
        TabOrder = 4
        OnExit = Ed_Date_Take2Exit
      end
      object Ed_Date_Repair2: TEdit
        Left = 327
        Top = 17
        Width = 70
        Height = 22
        TabOrder = 2
        OnExit = Ed_Date_Repair2Exit
      end
      object Button3: TButton
        Left = 638
        Top = 52
        Width = 95
        Height = 27
        Caption = 'แสดงครุภัณฑ์'
        ModalResult = 1
        TabOrder = 7
        OnClick = Button3Click
      end
      object Cb_Repair_Company: TDBLookupComboBox
        Left = 86
        Top = 52
        Width = 208
        Height = 22
        KeyField = 'Company_ID'
        ListField = 'Company_Name'
        ListSource = DataModule1.Ds_Company_Detail
        TabOrder = 5
        OnMouseDown = Cb_Repair_CompanyMouseDown
      end
      object Cb_Repair_Officer: TDBLookupComboBox
        Left = 362
        Top = 52
        Width = 242
        Height = 22
        KeyField = 'Officer_ID'
        ListField = 'Officer_Name'
        ListSource = DataModule1.Ds_Officer_Detail
        TabOrder = 6
        OnMouseDown = Cb_Repair_OfficerMouseDown
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'จำหน่าย'
      ImageIndex = 5
      OnShow = TabSheet6Show
      object Label53: TLabel
        Left = 28
        Top = 25
        Width = 54
        Height = 14
        Caption = 'เลขครุภัณฑ์'
      end
      object Cb_Over_ID: TComboBox
        Left = 97
        Top = 18
        Width = 145
        Height = 22
        TabStop = False
        ItemHeight = 14
        TabOrder = 5
        OnChange = Cb_Over_IDChange
      end
      object Ed_Over_ID: TEdit
        Left = 99
        Top = 20
        Width = 125
        Height = 18
        Hint = 'ระบุเลขครุภัณฑ์'
        BorderStyle = bsNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = Ed_Over_IDExit
        OnKeyDown = Ed_Over_IDKeyDown
      end
      object GroupBox11: TGroupBox
        Left = 17
        Top = 52
        Width = 725
        Height = 130
        Caption = 'รายละเอียด'
        TabOrder = 1
        object Label54: TLabel
          Left = 362
          Top = 34
          Width = 37
          Height = 14
          Caption = 'ประเภท'
        end
        object Label55: TLabel
          Left = 43
          Top = 34
          Width = 22
          Height = 14
          Caption = 'ชนิด'
        end
        object Label56: TLabel
          Left = 353
          Top = 103
          Width = 75
          Height = 14
          Caption = 'วันที่หมดประกัน'
        end
        object Label57: TLabel
          Left = 526
          Top = 103
          Width = 81
          Height = 14
          Caption = 'วันที่หมดประกัน2'
        end
        object Label58: TLabel
          Left = 9
          Top = 69
          Width = 54
          Height = 14
          Caption = 'ผู้รับผิดชอบ'
        end
        object Label59: TLabel
          Left = 362
          Top = 69
          Width = 18
          Height = 14
          Caption = 'ห้อง'
        end
        object Label60: TLabel
          Left = 526
          Top = 34
          Width = 31
          Height = 14
          Caption = 'สถานะ'
        end
        object Label61: TLabel
          Left = 17
          Top = 103
          Width = 48
          Height = 14
          Caption = 'บริษัทที่ซื้อ'
        end
        object Ed_Over_Expire1: TEdit
          Left = 439
          Top = 95
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object Ed_Over_Expire2: TEdit
          Left = 620
          Top = 95
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object Ed_Over_Type: TEdit
          Left = 78
          Top = 26
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object Ed_Over_Category: TEdit
          Left = 414
          Top = 26
          Width = 87
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object Ed_Over_Status: TEdit
          Left = 569
          Top = 26
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object Ed_Over_Officer: TEdit
          Left = 78
          Top = 60
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object Ed_Over_Room: TEdit
          Left = 388
          Top = 60
          Width = 130
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object Ed_Over_Company: TEdit
          Left = 78
          Top = 95
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
      end
      object GroupBox12: TGroupBox
        Left = 17
        Top = 198
        Width = 725
        Height = 260
        Caption = 'รายละเอียดการจำหน่าย'
        TabOrder = 2
        object Label62: TLabel
          Left = 34
          Top = 34
          Width = 59
          Height = 14
          Caption = 'วันที่จำหน่าย'
        end
        object Label63: TLabel
          Left = 202
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
        object Ed_Date_Over: TDateTimePicker
          Left = 102
          Top = 27
          Width = 87
          Height = 22
          CalAlignment = dtaLeft
          Date = 36979
          Time = 36979
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
        object Ed_Document_ID: TEdit
          Left = 267
          Top = 26
          Width = 199
          Height = 22
          TabOrder = 1
        end
        object Ed_Name1: TEdit
          Left = 103
          Top = 60
          Width = 363
          Height = 22
          TabOrder = 2
        end
        object Ed_Name2: TEdit
          Left = 103
          Top = 95
          Width = 363
          Height = 22
          TabOrder = 3
        end
        object Ed_Name3: TEdit
          Left = 103
          Top = 129
          Width = 363
          Height = 22
          TabOrder = 4
        end
        object Mm_Reason: TMemo
          Left = 103
          Top = 164
          Width = 363
          Height = 70
          TabOrder = 5
        end
      end
      object BitBtn5: TBitBtn
        Left = 517
        Top = 475
        Width = 81
        Height = 27
        Caption = 'ตกลง'
        TabOrder = 3
        OnClick = BitBtn5Click
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
      object BitBtn6: TBitBtn
        Left = 629
        Top = 474
        Width = 81
        Height = 27
        Caption = 'เคลียร์'
        TabOrder = 4
        OnClick = BitBtn6Click
        Kind = bkRetry
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'บริจาค'
      ImageIndex = 6
      OnShow = TabSheet7Show
      object Label68: TLabel
        Left = 28
        Top = 25
        Width = 54
        Height = 14
        Caption = 'เลขครุภัณฑ์'
      end
      object Cb_Give_ID: TComboBox
        Left = 97
        Top = 18
        Width = 145
        Height = 22
        TabStop = False
        ItemHeight = 14
        TabOrder = 5
        Text = 'Cb_Give_ID'
        OnChange = Cb_Give_IDChange
      end
      object Ed_Give_ID: TEdit
        Left = 99
        Top = 20
        Width = 125
        Height = 18
        Hint = 'ระบุเลขครุภัณฑ์'
        BorderStyle = bsNone
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = Ed_Give_IDExit
        OnKeyDown = Ed_Give_IDKeyDown
      end
      object GroupBox13: TGroupBox
        Left = 17
        Top = 52
        Width = 725
        Height = 130
        Caption = 'รายละเอียด'
        TabOrder = 1
        object Label69: TLabel
          Left = 362
          Top = 34
          Width = 37
          Height = 14
          Caption = 'ประเภท'
        end
        object Label70: TLabel
          Left = 43
          Top = 34
          Width = 22
          Height = 14
          Caption = 'ชนิด'
        end
        object Label71: TLabel
          Left = 353
          Top = 103
          Width = 75
          Height = 14
          Caption = 'วันที่หมดประกัน'
        end
        object Label72: TLabel
          Left = 526
          Top = 103
          Width = 81
          Height = 14
          Caption = 'วันที่หมดประกัน2'
        end
        object Label73: TLabel
          Left = 9
          Top = 69
          Width = 54
          Height = 14
          Caption = 'ผู้รับผิดชอบ'
        end
        object Label74: TLabel
          Left = 362
          Top = 69
          Width = 18
          Height = 14
          Caption = 'ห้อง'
        end
        object Label75: TLabel
          Left = 526
          Top = 34
          Width = 31
          Height = 14
          Caption = 'สถานะ'
        end
        object Label76: TLabel
          Left = 17
          Top = 103
          Width = 48
          Height = 14
          Caption = 'บริษัทที่ซื้อ'
        end
        object Ed_Give_Expire1: TEdit
          Left = 439
          Top = 95
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 0
        end
        object Ed_Give_Expire2: TEdit
          Left = 620
          Top = 95
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 1
        end
        object Ed_Give_Type: TEdit
          Left = 78
          Top = 26
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 2
        end
        object Ed_Give_Category: TEdit
          Left = 414
          Top = 26
          Width = 87
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 3
        end
        object Ed_Give_Status: TEdit
          Left = 569
          Top = 26
          Width = 70
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 4
        end
        object Ed_Give_Officer: TEdit
          Left = 78
          Top = 60
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 5
        end
        object Ed_Give_Room: TEdit
          Left = 388
          Top = 60
          Width = 130
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 6
        end
        object Ed_Give_Company: TEdit
          Left = 78
          Top = 95
          Width = 259
          Height = 22
          TabStop = False
          Color = clMenu
          ReadOnly = True
          TabOrder = 7
        end
      end
      object GroupBox14: TGroupBox
        Left = 17
        Top = 198
        Width = 725
        Height = 260
        Caption = 'รายละเอียดการบริจาค'
        TabOrder = 2
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
        object Ed_Date_Give: TDateTimePicker
          Left = 95
          Top = 33
          Width = 90
          Height = 22
          CalAlignment = dtaLeft
          Date = 36979
          Time = 36979
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
        object Ed_Date_Give50: TEdit
          Left = 498
          Top = 86
          Width = 78
          Height = 22
          TabOrder = 1
        end
        object Ed_Give_Document: TEdit
          Left = 267
          Top = 34
          Width = 199
          Height = 22
          TabOrder = 2
        end
        object Mm_Receiver: TMemo
          Left = 95
          Top = 78
          Width = 371
          Height = 70
          TabOrder = 3
        end
        object Mm_Give_Reason: TMemo
          Left = 95
          Top = 164
          Width = 371
          Height = 78
          TabOrder = 4
        end
      end
      object BitBtn7: TBitBtn
        Left = 526
        Top = 474
        Width = 80
        Height = 27
        Caption = 'ตกลง'
        TabOrder = 3
        OnClick = BitBtn7Click
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
      object BitBtn8: TBitBtn
        Left = 629
        Top = 474
        Width = 81
        Height = 27
        Caption = 'เคลียร์'
        TabOrder = 4
        OnClick = BitBtn8Click
        Kind = bkRetry
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'ซ่อมบำรุง'
      ImageIndex = 8
      OnShow = TabSheet3Show
      object Label84: TLabel
        Left = 52
        Top = 69
        Width = 19
        Height = 14
        Caption = 'ฝ่าย'
      end
      object Label85: TLabel
        Left = 293
        Top = 69
        Width = 18
        Height = 14
        Caption = 'ห้อง'
      end
      object Label86: TLabel
        Left = 250
        Top = 26
        Width = 22
        Height = 14
        Caption = 'ชนิด'
      end
      object Label87: TLabel
        Left = 517
        Top = 69
        Width = 31
        Height = 14
        Caption = 'สถานะ'
      end
      object Label88: TLabel
        Left = 534
        Top = 26
        Width = 37
        Height = 14
        Caption = 'ประเภท'
      end
      object Label83: TLabel
        Left = 8
        Top = 104
        Width = 106
        Height = 14
        Caption = 'ครุภัณฑ์ที่ควรซ่อมบำรุง'
      end
      object Label89: TLabel
        Left = 17
        Top = 26
        Width = 54
        Height = 14
        Caption = 'เลขครุภัณฑ์'
      end
      object Label92: TLabel
        Left = 128
        Top = 104
        Width = 38
        Height = 14
        Caption = 'Label92'
      end
      object Lv_Maintainant: TListView
        Left = 7
        Top = 125
        Width = 750
        Height = 355
        Checkboxes = True
        Columns = <
          item
            Caption = 'เลขครุภัณฑ์'
            Width = 129
          end
          item
            Caption = 'ชนิด'
            Width = 216
          end
          item
            Caption = 'ประเภท'
            Width = 86
          end
          item
            Caption = 'ห้อง'
            Width = 118
          end
          item
            Caption = 'ฝ่าย'
            Width = 140
          end
          item
            Caption = 'สถานะ'
            Width = 56
          end>
        GridLines = True
        HideSelection = False
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = Lv_MaintainantDblClick
        OnKeyPress = Lv_MaintainantKeyPress
      end
      object Cb_Department_Name3: TDBLookupComboBox
        Left = 86
        Top = 60
        Width = 182
        Height = 22
        KeyField = 'Department_ID'
        ListField = 'Department_Name'
        ListSource = DataModule1.Ds_Department_Detail
        TabOrder = 7
        OnMouseDown = Cb_Department_Name3MouseDown
      end
      object Cb_Type3: TDBLookupComboBox
        Left = 284
        Top = 17
        Width = 234
        Height = 22
        KeyField = 'Type_ID'
        ListField = 'Type_Name'
        ListSource = DataModule1.Ds_Type
        TabOrder = 5
        OnMouseDown = Cb_Type3MouseDown
      end
      object Cb_Room3: TDBLookupComboBox
        Left = 319
        Top = 60
        Width = 173
        Height = 22
        KeyField = 'Room_ID'
        ListField = 'Room_Name'
        ListSource = DataModule1.Ds_Room_Detail
        TabOrder = 8
        OnMouseDown = Cb_Room3MouseDown
      end
      object Cb_Status3: TComboBox
        Left = 560
        Top = 60
        Width = 70
        Height = 22
        Style = csDropDownList
        ItemHeight = 14
        TabOrder = 9
        OnDropDown = Cb_Status3DropDown
        Items.Strings = (
          'ดี'
          'เสีย'
          'ส่งซ่อม')
      end
      object Cb_Category2: TComboBox
        Left = 586
        Top = 17
        Width = 104
        Height = 22
        Style = csDropDownList
        ItemHeight = 14
        TabOrder = 6
        OnDropDown = Cb_Category2DropDown
        Items.Strings = (
          'สำนักงาน'
          'อาคาร'
          'คอมพิวเตอร์')
      end
      object Button7: TButton
        Left = 655
        Top = 60
        Width = 96
        Height = 27
        Caption = 'แสดงครุภัณฑ์'
        ModalResult = 1
        TabOrder = 10
        OnClick = Button7Click
      end
      object BitBtn9: TBitBtn
        Left = 608
        Top = 496
        Width = 75
        Height = 25
        Caption = 'ตกลง'
        ModalResult = 1
        TabOrder = 3
        OnClick = BitBtn9Click
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
      object CheckBox1: TCheckBox
        Left = 8
        Top = 488
        Width = 97
        Height = 17
        Caption = 'เลือกทั้งหมด'
        TabOrder = 1
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 112
        Top = 488
        Width = 97
        Height = 17
        Caption = 'ไม่เลือกทั้งหมด'
        TabOrder = 2
        OnClick = CheckBox2Click
      end
      object Ed_Durable_ID3: TEdit
        Left = 86
        Top = 17
        Width = 156
        Height = 22
        TabOrder = 4
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'รายงาน'
      ImageIndex = 7
      OnShow = TabSheet8Show
      object Bt_Print2: TPageControl
        Left = 9
        Top = 9
        Width = 750
        Height = 526
        ActivePage = TabSheet14
        TabOrder = 0
        object TabSheet14: TTabSheet
          Caption = 'ตามสถานะ'
          object GroupBox15: TGroupBox
            Left = 26
            Top = 26
            Width = 147
            Height = 199
            Caption = 'สถานะ'
            TabOrder = 0
            object Ck_Good: TCheckBox
              Left = 26
              Top = 34
              Width = 70
              Height = 19
              Caption = 'ดี'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object Ck_Repair: TCheckBox
              Left = 26
              Top = 86
              Width = 78
              Height = 18
              Caption = 'ส่งซ่อม'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object Ck_Over: TCheckBox
              Left = 26
              Top = 112
              Width = 70
              Height = 18
              Caption = 'จำหน่าย'
              Checked = True
              State = cbChecked
              TabOrder = 3
            end
            object Ck_Bad: TCheckBox
              Left = 26
              Top = 60
              Width = 61
              Height = 19
              Caption = 'เสีย'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object Ck_Give: TCheckBox
              Left = 26
              Top = 138
              Width = 61
              Height = 18
              Caption = 'บริจาค'
              Checked = True
              State = cbChecked
              TabOrder = 4
            end
          end
          object GroupBox16: TGroupBox
            Left = 26
            Top = 250
            Width = 147
            Height = 182
            Caption = 'ประเภท'
            TabOrder = 1
            object Ck_Building: TCheckBox
              Left = 26
              Top = 60
              Width = 78
              Height = 19
              Caption = 'อาคาร'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object Ck_Computer: TCheckBox
              Left = 26
              Top = 86
              Width = 96
              Height = 18
              Caption = 'คอมพิวเตอร์'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object Ck_Office: TCheckBox
              Left = 26
              Top = 34
              Width = 78
              Height = 19
              Caption = 'สำนักงาน'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
          end
          object GroupBox17: TGroupBox
            Left = 190
            Top = 26
            Width = 259
            Height = 406
            Caption = 'ฝ่าย'
            TabOrder = 2
            object CkL_Department: TCheckListBox
              Left = 17
              Top = 17
              Width = 225
              Height = 346
              OnClickCheck = CkL_DepartmentClickCheck
              ItemHeight = 14
              TabOrder = 0
            end
            object Ck_AllDepartment: TCheckBox
              Left = 26
              Top = 370
              Width = 87
              Height = 19
              Caption = 'เลือกทั้งหมด'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = Ck_AllDepartmentClick
            end
            object Ck_NoneDepartment: TCheckBox
              Left = 125
              Top = 372
              Width = 97
              Height = 17
              Caption = 'ไม่เลือกทั้งหมด'
              TabOrder = 2
              OnClick = Ck_NoneDepartmentClick
            end
          end
          object GroupBox18: TGroupBox
            Left = 474
            Top = 26
            Width = 251
            Height = 406
            Caption = 'ห้อง'
            TabOrder = 3
            object CkL_Room: TCheckListBox
              Left = 17
              Top = 17
              Width = 217
              Height = 346
              OnClickCheck = CkL_RoomClickCheck
              ItemHeight = 14
              TabOrder = 0
            end
            object Ck_AllRoom: TCheckBox
              Left = 26
              Top = 370
              Width = 95
              Height = 19
              Caption = 'เลือกทั้งหมด'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = Ck_AllRoomClick
            end
            object Ck_NoneRoom: TCheckBox
              Left = 125
              Top = 372
              Width = 97
              Height = 17
              Caption = 'ไม่เลือกทั้งหมด'
              TabOrder = 2
              OnClick = Ck_NoneRoomClick
            end
          end
          object Bt_Print1: TButton
            Left = 612
            Top = 448
            Width = 80
            Height = 27
            Caption = 'พิมพ์'
            TabOrder = 4
            OnClick = Bt_Print1Click
          end
        end
        object TabSheet15: TTabSheet
          Caption = 'การสำรวจ'
          ImageIndex = 1
          object GroupBox19: TGroupBox
            Left = 26
            Top = 26
            Width = 147
            Height = 190
            Caption = 'สถานะ'
            TabOrder = 0
            object Ck_Good2: TCheckBox
              Left = 26
              Top = 34
              Width = 70
              Height = 19
              Caption = 'ดี'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object Ck_Bad2: TCheckBox
              Left = 26
              Top = 60
              Width = 61
              Height = 19
              Caption = 'เสีย'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object Ck_Repair2: TCheckBox
              Left = 26
              Top = 86
              Width = 78
              Height = 18
              Caption = 'ส่งซ่อม'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
          end
          object GroupBox20: TGroupBox
            Left = 26
            Top = 233
            Width = 147
            Height = 199
            Caption = 'ประเภท'
            TabOrder = 1
            object Ck_Building2: TCheckBox
              Left = 26
              Top = 60
              Width = 78
              Height = 19
              Caption = 'อาคาร'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object Ck_Computer2: TCheckBox
              Left = 26
              Top = 86
              Width = 96
              Height = 18
              Caption = 'คอมพิวเตอร์'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object Ck_Office2: TCheckBox
              Left = 26
              Top = 34
              Width = 78
              Height = 19
              Caption = 'สำนักงาน'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
          end
          object GroupBox21: TGroupBox
            Left = 190
            Top = 26
            Width = 259
            Height = 406
            Caption = 'ฝ่าย'
            TabOrder = 2
            object CkL_Department2: TCheckListBox
              Left = 17
              Top = 17
              Width = 225
              Height = 346
              OnClickCheck = CkL_Department2ClickCheck
              ItemHeight = 14
              TabOrder = 0
            end
            object Ck_AllDepartment2: TCheckBox
              Left = 26
              Top = 370
              Width = 104
              Height = 19
              Caption = 'เลือกทั้งหมด'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = Ck_AllDepartment2Click
            end
            object Ck_NoneDepartment2: TCheckBox
              Left = 125
              Top = 372
              Width = 97
              Height = 17
              Caption = 'ไม่เลือกทั้งหมด'
              TabOrder = 2
              OnClick = Ck_NoneDepartment2Click
            end
          end
          object GroupBox22: TGroupBox
            Left = 474
            Top = 26
            Width = 251
            Height = 406
            Caption = 'ห้อง'
            TabOrder = 3
            object CkL_Room2: TCheckListBox
              Left = 17
              Top = 17
              Width = 217
              Height = 346
              OnClickCheck = CkL_Room2ClickCheck
              ItemHeight = 14
              TabOrder = 0
            end
            object Ck_AllRoom2: TCheckBox
              Left = 26
              Top = 370
              Width = 104
              Height = 19
              Caption = 'เลือกทั้งหมด'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = Ck_AllRoom2Click
            end
            object Ck_NoneRoom2: TCheckBox
              Left = 125
              Top = 372
              Width = 97
              Height = 17
              Caption = 'ไม่เลือกทั้งหมด'
              TabOrder = 2
              OnClick = Ck_NoneRoom2Click
            end
          end
          object Button5: TButton
            Left = 612
            Top = 448
            Width = 80
            Height = 27
            Caption = 'พิมพ์'
            TabOrder = 4
            OnClick = Button5Click
          end
        end
        object TabSheet16: TTabSheet
          Caption = 'ใกล้หมดประกัน'
          ImageIndex = 2
          object GroupBox23: TGroupBox
            Left = 60
            Top = 26
            Width = 148
            Height = 190
            Caption = 'สถานะ'
            TabOrder = 0
            object Ck_Good3: TCheckBox
              Left = 26
              Top = 34
              Width = 70
              Height = 19
              Caption = 'ดี'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object Ck_Bad3: TCheckBox
              Left = 26
              Top = 60
              Width = 61
              Height = 19
              Caption = 'เสีย'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object Ck_Repair3: TCheckBox
              Left = 26
              Top = 86
              Width = 78
              Height = 18
              Caption = 'ส่งซ่อม'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
          end
          object GroupBox24: TGroupBox
            Left = 250
            Top = 26
            Width = 147
            Height = 190
            Caption = 'ประเภท'
            TabOrder = 1
            object Ck_Building3: TCheckBox
              Left = 26
              Top = 60
              Width = 78
              Height = 19
              Caption = 'อาคาร'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object Ck_Computer3: TCheckBox
              Left = 26
              Top = 86
              Width = 96
              Height = 18
              Caption = 'คอมพิวเตอร์'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object Ck_Office3: TCheckBox
              Left = 26
              Top = 34
              Width = 78
              Height = 19
              Caption = 'สำนักงาน'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
          end
          object GroupBox25: TGroupBox
            Left = 439
            Top = 26
            Width = 191
            Height = 122
            Caption = 'หมดประกันภายใน'
            TabOrder = 2
            object Label81: TLabel
              Left = 95
              Top = 60
              Width = 26
              Height = 14
              Caption = 'เดือน'
            end
            object Ed_Expire: TEdit
              Left = 52
              Top = 52
              Width = 35
              Height = 22
              TabOrder = 0
              Text = '3'
              OnExit = Ed_ExpireExit
            end
          end
          object Button6: TButton
            Left = 500
            Top = 190
            Width = 80
            Height = 26
            Caption = 'พิมพ์'
            TabOrder = 3
            OnClick = Button6Click
          end
        end
        object TabSheet17: TTabSheet
          Caption = 'การซ่อมบำรุง'
          ImageIndex = 3
          object GroupBox26: TGroupBox
            Left = 26
            Top = 26
            Width = 147
            Height = 190
            Caption = 'สถานะ'
            TabOrder = 0
            object Ck_Good4: TCheckBox
              Left = 26
              Top = 34
              Width = 70
              Height = 19
              Caption = 'ดี'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object Ck_Bad4: TCheckBox
              Left = 26
              Top = 60
              Width = 61
              Height = 19
              Caption = 'เสีย'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object Ck_Repair4: TCheckBox
              Left = 26
              Top = 86
              Width = 78
              Height = 18
              Caption = 'ส่งซ่อม'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
          end
          object GroupBox27: TGroupBox
            Left = 26
            Top = 233
            Width = 147
            Height = 199
            Caption = 'ประเภท'
            TabOrder = 1
            object Ck_Building4: TCheckBox
              Left = 26
              Top = 60
              Width = 78
              Height = 19
              Caption = 'อาคาร'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object Ck_Computer4: TCheckBox
              Left = 26
              Top = 86
              Width = 96
              Height = 18
              Caption = 'คอมพิวเตอร์'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object Ck_Office4: TCheckBox
              Left = 26
              Top = 34
              Width = 78
              Height = 19
              Caption = 'สำนักงาน'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
          end
          object GroupBox28: TGroupBox
            Left = 190
            Top = 26
            Width = 259
            Height = 406
            Caption = 'ฝ่าย'
            TabOrder = 2
            object Ckl_Department3: TCheckListBox
              Left = 17
              Top = 17
              Width = 225
              Height = 346
              OnClickCheck = Ckl_Department3ClickCheck
              ItemHeight = 14
              TabOrder = 0
            end
            object Ck_AllDepartment3: TCheckBox
              Left = 26
              Top = 370
              Width = 104
              Height = 19
              Caption = 'เลือกทั้งหมด'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = Ck_AllDepartment3Click
            end
            object Ck_NoneDepartment3: TCheckBox
              Left = 125
              Top = 372
              Width = 97
              Height = 17
              Caption = 'ไม่เลือกทั้งหมด'
              TabOrder = 2
              OnClick = Ck_NoneDepartment3Click
            end
          end
          object GroupBox29: TGroupBox
            Left = 474
            Top = 26
            Width = 251
            Height = 406
            Caption = 'ห้อง'
            TabOrder = 3
            object Ckl_Room3: TCheckListBox
              Left = 17
              Top = 17
              Width = 217
              Height = 346
              OnClickCheck = Ckl_Room3ClickCheck
              ItemHeight = 14
              TabOrder = 0
            end
            object Ck_AllRoom3: TCheckBox
              Left = 26
              Top = 370
              Width = 104
              Height = 19
              Caption = 'เลือกทั้งหมด'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = Ck_AllRoom3Click
            end
            object Ck_NoneRoom3: TCheckBox
              Left = 125
              Top = 372
              Width = 97
              Height = 17
              Caption = 'ไม่เลือกทั้งหมด'
              TabOrder = 2
              OnClick = Ck_NoneRoom3Click
            end
          end
          object Button8: TButton
            Left = 612
            Top = 448
            Width = 80
            Height = 27
            Caption = 'พิมพ์'
            TabOrder = 4
            OnClick = Button8Click
          end
        end
      end
    end
    object TabSheet13: TTabSheet
      Caption = 'ข้อมูลทั่วไป'
      ImageIndex = 8
      object PageControl1: TPageControl
        Left = 9
        Top = 9
        Width = 750
        Height = 526
        ActivePage = TabSheet9
        TabOrder = 0
        object TabSheet9: TTabSheet
          Caption = 'ฝ่าย/ห้อง'
          OnShow = TabSheet9Show
          object GroupBox3: TGroupBox
            Left = 9
            Top = 9
            Width = 371
            Height = 440
            Caption = 'ฝ่าย'
            TabOrder = 0
            object Label17: TLabel
              Left = 43
              Top = 43
              Width = 32
              Height = 14
              Caption = 'ชื่อฝ่าย'
            end
            object Label18: TLabel
              Left = 26
              Top = 78
              Width = 52
              Height = 14
              Caption = 'หัวหน้าฝ่าย'
            end
            object Label19: TLabel
              Left = 60
              Top = 121
              Width = 18
              Height = 14
              Caption = 'ห้อง'
            end
            object Ed_Officer_Name: TDBEdit
              Left = 95
              Top = 69
              Width = 225
              Height = 22
              TabStop = False
              DataField = 'Officer_Name'
              DataSource = DataModule1.Ds_Chief
              ReadOnly = True
              TabOrder = 1
            end
            object Cb_Department_Name: TDBLookupComboBox
              Left = 95
              Top = 34
              Width = 225
              Height = 22
              KeyField = 'Department_ID'
              ListField = 'Department_Name'
              ListSource = DataModule1.Ds_Department_Detail
              TabOrder = 0
              OnClick = Cb_Department_NameClick
            end
            object Bt_Insert_Department: TButton
              Left = 41
              Top = 395
              Width = 81
              Height = 27
              Caption = 'เพิ่ม'
              TabOrder = 2
              OnClick = Bt_Insert_DepartmentClick
            end
            object Bt_Update_Department: TButton
              Left = 144
              Top = 396
              Width = 81
              Height = 27
              Caption = 'แก้ไข'
              TabOrder = 3
              OnClick = Bt_Update_DepartmentClick
            end
            object Bt_Delete_Department: TButton
              Left = 250
              Top = 396
              Width = 81
              Height = 27
              Caption = 'ลบ'
              TabOrder = 4
              OnClick = Bt_Delete_DepartmentClick
            end
            object Gr_Room_Name: TDBGrid
              Left = 95
              Top = 112
              Width = 225
              Height = 242
              TabStop = False
              DataSource = DataModule1.Ds_Room
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 5
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Room_Name'
                  Title.Alignment = taCenter
                  Title.Caption = 'ชื่อห้อง'
                  Width = 207
                  Visible = True
                end>
            end
          end
          object GroupBox5: TGroupBox
            Left = 396
            Top = 9
            Width = 337
            Height = 440
            Caption = 'ห้อง'
            TabOrder = 1
            object Gr_Room_Detail: TDBGrid
              Left = 16
              Top = 35
              Width = 303
              Height = 320
              DataSource = DataModule1.Ds_Room_Detail
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Room_Name'
                  Title.Caption = 'ชื่อห้อง'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Department_Name'
                  Title.Caption = 'ชื่อฝ่าย'
                  Width = 202
                  Visible = True
                end>
            end
            object Bt_Insert_Room: TButton
              Left = 26
              Top = 396
              Width = 81
              Height = 27
              Caption = 'เพิ่ม'
              TabOrder = 1
              OnClick = Bt_Insert_RoomClick
            end
            object Bt_Update_Room: TButton
              Left = 129
              Top = 396
              Width = 81
              Height = 27
              Caption = 'แก้ไข'
              TabOrder = 2
              OnClick = Bt_Update_RoomClick
            end
            object Bt_Delete_Room: TButton
              Left = 233
              Top = 396
              Width = 80
              Height = 27
              Caption = 'ลบ'
              TabOrder = 3
              OnClick = Bt_Delete_RoomClick
            end
          end
        end
        object TabSheet10: TTabSheet
          Caption = 'เจ้าหน้าที่'
          ImageIndex = 1
          object GroupBox6: TGroupBox
            Left = 9
            Top = 9
            Width = 552
            Height = 449
            Caption = 'เจ้าหน้าที่'
            TabOrder = 0
            object Gr_Officer_Detail: TDBGrid
              Left = 17
              Top = 26
              Width = 518
              Height = 406
              DataSource = DataModule1.Ds_Officer_Detail
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Officer_Name'
                  Title.Caption = 'ชื่อเจ้าหน้าที่'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Department_Name'
                  Title.Caption = 'ฝ่าย'
                  Width = 243
                  Visible = True
                end>
            end
          end
          object Bt_Insert_Officer: TButton
            Left = 603
            Top = 69
            Width = 81
            Height = 27
            Caption = 'เพิ่ม'
            TabOrder = 1
            OnClick = Bt_Insert_OfficerClick
          end
          object Bt_Update_Officer: TButton
            Left = 603
            Top = 112
            Width = 81
            Height = 27
            Caption = 'แก้ไข'
            TabOrder = 2
            OnClick = Bt_Update_OfficerClick
          end
          object Bt_Delete_Officer: TButton
            Left = 603
            Top = 155
            Width = 81
            Height = 27
            Caption = 'ลบ'
            TabOrder = 3
            OnClick = Bt_Delete_OfficerClick
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'บริษัท'
          ImageIndex = 2
          OnShow = TabSheet11Show
          object GroupBox4: TGroupBox
            Left = 26
            Top = 26
            Width = 406
            Height = 406
            Caption = 'บริษัท'
            TabOrder = 0
            object Label20: TLabel
              Left = 43
              Top = 43
              Width = 41
              Height = 14
              Caption = 'ชื่อบริษัท'
            end
            object Label21: TLabel
              Left = 60
              Top = 78
              Width = 20
              Height = 14
              Caption = 'ที่อยู่'
            end
            object Label22: TLabel
              Left = 17
              Top = 198
              Width = 65
              Height = 14
              Caption = 'เบอร์โทรศัพท์'
            end
            object Label23: TLabel
              Left = 17
              Top = 302
              Width = 59
              Height = 14
              Caption = 'เบอร์โทรสาร'
            end
            object Mm_Address: TDBMemo
              Left = 95
              Top = 78
              Width = 225
              Height = 95
              TabStop = False
              DataField = 'Address'
              DataSource = DataModule1.Ds_Company_Detail
              ReadOnly = True
              TabOrder = 1
            end
            object Dbe_Phone1: TDBEdit
              Left = 95
              Top = 190
              Width = 130
              Height = 22
              TabStop = False
              DataField = 'Phone1'
              DataSource = DataModule1.Ds_Company_Detail
              ReadOnly = True
              TabOrder = 2
            end
            object Dbe_Phone2: TDBEdit
              Left = 95
              Top = 224
              Width = 130
              Height = 22
              TabStop = False
              DataField = 'Phone2'
              DataSource = DataModule1.Ds_Company_Detail
              ReadOnly = True
              TabOrder = 3
            end
            object Dbe_Phone3: TDBEdit
              Left = 95
              Top = 258
              Width = 130
              Height = 22
              TabStop = False
              DataField = 'Phone3'
              DataSource = DataModule1.Ds_Company_Detail
              ReadOnly = True
              TabOrder = 4
            end
            object Dbe_Fax: TDBEdit
              Left = 95
              Top = 293
              Width = 130
              Height = 22
              TabStop = False
              DataField = 'Fax'
              DataSource = DataModule1.Ds_Company_Detail
              ReadOnly = True
              TabOrder = 5
            end
            object Cb_Company_Name: TDBLookupComboBox
              Left = 95
              Top = 34
              Width = 225
              Height = 22
              DropDownRows = 15
              KeyField = 'Company_ID'
              ListField = 'Company_Name'
              ListSource = DataModule1.Ds_Company_Detail
              TabOrder = 0
            end
          end
          object Bt_Insert: TButton
            Left = 491
            Top = 60
            Width = 81
            Height = 27
            Caption = 'เพิ่ม'
            TabOrder = 1
            OnClick = Bt_InsertClick
          end
          object Bt_Update: TButton
            Left = 491
            Top = 103
            Width = 81
            Height = 27
            Caption = 'แก้ไข'
            TabOrder = 2
            OnClick = Bt_UpdateClick
          end
          object Bt_Delete: TButton
            Left = 491
            Top = 146
            Width = 81
            Height = 27
            Caption = 'ลบ'
            TabOrder = 3
            OnClick = Bt_DeleteClick
          end
        end
        object TabSheet12: TTabSheet
          Caption = 'ชนิด'
          ImageIndex = 3
          object GroupBox7: TGroupBox
            Left = 17
            Top = 17
            Width = 527
            Height = 406
            Caption = 'ชนิด'
            TabOrder = 0
            object Gr_Type_Detail: TDBGrid
              Left = 26
              Top = 27
              Width = 475
              Height = 354
              DataSource = DataModule1.Ds_Type
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  Expanded = False
                  FieldName = 'Type_Name'
                  Title.Alignment = taCenter
                  Title.Caption = 'ชนิด'
                  Width = 342
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Category'
                  Title.Alignment = taCenter
                  Title.Caption = 'ประเภท'
                  Width = 102
                  Visible = True
                end>
            end
          end
          object Bt_Insert_Type: TButton
            Left = 577
            Top = 78
            Width = 81
            Height = 26
            Caption = 'เพิ่ม'
            TabOrder = 1
            OnClick = Bt_Insert_TypeClick
          end
          object Bt_Update_Type: TButton
            Left = 577
            Top = 129
            Width = 81
            Height = 27
            Caption = 'แก้ไข'
            TabOrder = 2
            OnClick = Bt_Update_TypeClick
          end
          object Bt_Delete_Type: TButton
            Left = 577
            Top = 181
            Width = 81
            Height = 27
            Caption = 'ลบ'
            TabOrder = 3
            OnClick = Bt_Delete_TypeClick
          end
        end
      end
    end
  end
end
