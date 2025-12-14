object Fr_Main: TFr_Main
  Left = 141
  Top = 155
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'วัสดุภัณฑ์'
  ClientHeight = 561
  ClientWidth = 777
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 777
    Height = 561
    ActivePage = TabSheet4
    TabOrder = 0
    OnEnter = PageControl1Enter
    object TabSheet4: TTabSheet
      Caption = 'รับ'
      ImageIndex = 5
      OnShow = TabSheet4Show
      object Lv_Voucher_Detail: TListView
        Left = 9
        Top = 14
        Width = 750
        Height = 507
        Columns = <
          item
            Caption = 'เลขที่ใบสั่งซื้อ'
            Width = 129
          end
          item
            Alignment = taCenter
            Caption = 'วันที่ออกใบสั่งซื้อ'
            Width = 110
          end
          item
            Alignment = taCenter
            Caption = 'วันที่คาดว่าจะได้รับ'
            Width = 110
          end
          item
            Alignment = taCenter
            Caption = 'บริษัท'
            Width = 200
          end
          item
            Alignment = taCenter
            Caption = 'ผู้ติดต่อ'
            Width = 197
          end>
        GridLines = True
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupMenu1
        TabOrder = 0
        ViewStyle = vsReport
        OnDblClick = Lv_Voucher_DetailDblClick
        OnKeyPress = Lv_Voucher_DetailKeyPress
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'ใบสั่งซื้อ'
      OnShow = TabSheet1Show
      object Button3: TBitBtn
        Left = 585
        Top = 497
        Width = 75
        Height = 25
        Caption = 'ตกลง'
        ModalResult = 1
        TabOrder = 1
        OnClick = Button3Click
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
      object BtnClear: TBitBtn
        Left = 672
        Top = 496
        Width = 75
        Height = 25
        Caption = 'เคลียร์'
        TabOrder = 2
        OnClick = BtnClearClick
        Kind = bkRetry
      end
      object PageControl4: TPageControl
        Left = 8
        Top = 8
        Width = 753
        Height = 473
        ActivePage = TabSheet13
        TabOrder = 0
        object TabSheet13: TTabSheet
          Caption = 'รายละเอียด'
          object GroupBox2: TGroupBox
            Left = 8
            Top = 3
            Width = 729
            Height = 358
            Caption = 'รายละเอียดทั่วไป'
            TabOrder = 0
            object Label1: TLabel
              Left = 80
              Top = 24
              Width = 61
              Height = 14
              Caption = 'เลขที่ใบสั่งซื้อ'
            end
            object Label2: TLabel
              Left = 432
              Top = 24
              Width = 21
              Height = 14
              Caption = 'วันที่'
            end
            object Label3: TLabel
              Left = 64
              Top = 56
              Width = 75
              Height = 14
              Caption = 'เรื่องขออนุมัติซื้อ'
            end
            object Label4: TLabel
              Left = 33
              Top = 137
              Width = 105
              Height = 14
              Caption = 'เนื่องจากมีความจำเป็น'
            end
            object Label5: TLabel
              Left = 48
              Top = 200
              Width = 94
              Height = 14
              Caption = 'กำหนดเวลาที่ต้องใช้'
            end
            object Label6: TLabel
              Left = 224
              Top = 200
              Width = 67
              Height = 14
              Caption = 'ขอเบิกจ่ายจาก'
            end
            object Label7: TLabel
              Left = 88
              Top = 240
              Width = 49
              Height = 14
              Caption = 'กรรมการ1'
            end
            object Label8: TLabel
              Left = 88
              Top = 280
              Width = 50
              Height = 14
              Caption = 'กรรมการ2'
            end
            object Label9: TLabel
              Left = 88
              Top = 320
              Width = 50
              Height = 14
              Caption = 'กรรมการ3'
            end
            object Label11: TLabel
              Left = 256
              Top = 24
              Width = 7
              Height = 14
              Caption = 'ที่'
            end
            object Label12: TLabel
              Left = 8
              Top = 98
              Width = 130
              Height = 14
              Caption = 'ขอรายงานเสนอเพื่อขอจัดซื้อ'
            end
            object Label13: TLabel
              Left = 200
              Top = 200
              Width = 14
              Height = 14
              Caption = 'วัน'
            end
            object Label43: TLabel
              Left = 452
              Top = 200
              Width = 19
              Height = 14
              Caption = 'รหัส'
            end
            object Label44: TLabel
              Left = 533
              Top = 200
              Width = 39
              Height = 14
              Caption = 'หมวดค่า'
            end
            object MSource: TEdit
              Left = 296
              Top = 198
              Width = 417
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
              Visible = False
            end
            object Add_ID: TEdit
              Left = 152
              Top = 21
              Width = 97
              Height = 22
              TabOrder = 0
            end
            object At: TEdit
              Left = 272
              Top = 21
              Width = 153
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object Case_Buy: TEdit
              Left = 152
              Top = 54
              Width = 401
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object Req_For: TEdit
              Left = 152
              Top = 94
              Width = 401
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object Reason: TMemo
              Left = 152
              Top = 136
              Width = 505
              Height = 49
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object Day_Use: TEdit
              Left = 152
              Top = 198
              Width = 41
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
              OnExit = Day_UseExit
            end
            object Referee1: TEdit
              Left = 152
              Top = 238
              Width = 169
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
            end
            object Referee3: TEdit
              Left = 152
              Top = 318
              Width = 169
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 10
            end
            object Referee2: TEdit
              Left = 152
              Top = 278
              Width = 169
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
            end
            object Date_Buy: TDateTimePicker
              Left = 464
              Top = 22
              Width = 89
              Height = 22
              CalAlignment = dtaLeft
              Date = 36526
              Time = 36526
              DateFormat = dfShort
              DateMode = dmComboBox
              Kind = dtkDate
              ParseInput = False
              TabOrder = 2
            end
            object Money: TComboBox
              Left = 296
              Top = 198
              Width = 153
              Height = 22
              ItemHeight = 0
              TabOrder = 11
            end
            object Code: TComboBox
              Left = 480
              Top = 198
              Width = 49
              Height = 22
              ItemHeight = 14
              TabOrder = 12
              Items.Strings = (
                '0701'
                '0715')
            end
            object Edit1: TEdit
              Left = 576
              Top = 198
              Width = 137
              Height = 22
              TabOrder = 13
            end
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 363
            Width = 729
            Height = 65
            Caption = 'บริษัทผู้ขาย'
            TabOrder = 1
            object Label14: TLabel
              Left = 32
              Top = 24
              Width = 28
              Height = 14
              Caption = 'บริษัท'
            end
            object Label15: TLabel
              Left = 360
              Top = 24
              Width = 34
              Height = 14
              Caption = 'ผู้ติดต่อ'
            end
            object Add_CP1: TButton
              Left = 248
              Top = 21
              Width = 75
              Height = 25
              Caption = 'เ&พิ่มบริษัท'
              TabOrder = 1
              OnClick = CP_AddClick
            end
            object Respond_name: TEdit
              Left = 408
              Top = 22
              Width = 161
              Height = 22
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object LC_Company_Name: TDBLookupComboBox
              Left = 70
              Top = 22
              Width = 169
              Height = 22
              KeyField = 'Company_ID'
              ListField = 'Company_Name'
              ListSource = DM.Ds_Company
              TabOrder = 0
              OnMouseDown = LC_Company_NameMouseDown
            end
          end
        end
        object TabSheet14: TTabSheet
          Caption = 'รายการวัสดุ'
          ImageIndex = 1
          OnShow = TabSheet14Show
          object StringGrid1: TStringGrid
            Left = 31
            Top = 21
            Width = 546
            Height = 340
            DefaultColWidth = 20
            DefaultRowHeight = 20
            RowCount = 16
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
            TabOrder = 0
            OnKeyPress = StringGrid1KeyPress
            ColWidths = (
              47
              53
              289
              76
              55)
          end
          object BitBtn10: TBitBtn
            Left = 504
            Top = 371
            Width = 75
            Height = 25
            Caption = 'เพิ่มวัสดุ'
            TabOrder = 16
            OnClick = BitBtn10Click
            Glyph.Data = {
              F2010000424DF201000000000000760000002800000024000000130000000100
              0400000000007C01000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
              3333333333388F3333333333000033334224333333333333338338F333333333
              0000333422224333333333333833338F33333333000033422222243333333333
              83333338F3333333000034222A22224333333338F33F33338F33333300003222
              A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
              38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
              2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
              0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
              333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
              33333A2224A2233333333338F338F83300003333333333A2224A333333333333
              8F338F33000033333333333A222433333333333338F338F30000333333333333
              A224333333333333338F38F300003333333333333A223333333333333338F8F3
              000033333333333333A3333333333333333383330000}
            NumGlyphs = 2
          end
          object ComboBox1: TComboBox
            Left = 134
            Top = 43
            Width = 291
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            Sorted = True
            TabOrder = 1
            OnChange = ComboBox1Change
            OnDropDown = ComboBox1DropDown
            OnExit = ComboBox1Exit
          end
          object ComboBox2: TComboBox
            Left = 134
            Top = 64
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 2
            OnChange = ComboBox2Change
            OnDropDown = ComboBox2DropDown
            OnExit = ComboBox2Exit
          end
          object ComboBox3: TComboBox
            Left = 134
            Top = 85
            Width = 291
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            Sorted = True
            TabOrder = 3
            OnChange = ComboBox3Change
            OnDropDown = ComboBox3DropDown
            OnExit = ComboBox3Exit
          end
          object ComboBox4: TComboBox
            Left = 134
            Top = 106
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 4
            OnChange = ComboBox4Change
            OnDropDown = ComboBox4DropDown
            OnExit = ComboBox4Exit
          end
          object ComboBox5: TComboBox
            Left = 134
            Top = 127
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 5
            OnChange = ComboBox5Change
            OnDropDown = ComboBox5DropDown
            OnExit = ComboBox5Exit
          end
          object ComboBox6: TComboBox
            Left = 134
            Top = 148
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 6
            OnChange = ComboBox6Change
            OnDropDown = ComboBox6DropDown
            OnExit = ComboBox6Exit
          end
          object ComboBox7: TComboBox
            Left = 134
            Top = 169
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 7
            OnChange = ComboBox7Change
            OnDropDown = ComboBox7DropDown
            OnExit = ComboBox7Exit
          end
          object ComboBox8: TComboBox
            Left = 134
            Top = 190
            Width = 291
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            Sorted = True
            TabOrder = 8
            OnChange = ComboBox8Change
            OnDropDown = ComboBox8DropDown
            OnExit = ComboBox8Exit
          end
          object ComboBox9: TComboBox
            Left = 134
            Top = 211
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 9
            OnChange = ComboBox9Change
            OnDropDown = ComboBox9DropDown
            OnExit = ComboBox9Exit
          end
          object ComboBox10: TComboBox
            Left = 134
            Top = 232
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 10
            OnChange = ComboBox10Change
            OnDropDown = ComboBox10DropDown
            OnExit = ComboBox10Exit
          end
          object ComboBox11: TComboBox
            Left = 134
            Top = 253
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 11
            OnChange = ComboBox11Change
            OnDropDown = ComboBox11DropDown
            OnExit = ComboBox11Exit
          end
          object ComboBox12: TComboBox
            Left = 134
            Top = 274
            Width = 291
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            Sorted = True
            TabOrder = 12
            OnChange = ComboBox12Change
            OnDropDown = ComboBox12DropDown
            OnExit = ComboBox12Exit
          end
          object ComboBox13: TComboBox
            Left = 134
            Top = 295
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 13
            OnChange = ComboBox13Change
            OnDropDown = ComboBox13DropDown
            OnExit = ComboBox13Exit
          end
          object ComboBox14: TComboBox
            Left = 134
            Top = 316
            Width = 291
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 14
            OnChange = ComboBox14Change
            OnDropDown = ComboBox14DropDown
            OnExit = ComboBox14Exit
          end
          object ComboBox15: TComboBox
            Left = 134
            Top = 337
            Width = 291
            Height = 22
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 0
            ParentFont = False
            Sorted = True
            TabOrder = 15
            OnChange = ComboBox15Change
            OnDropDown = ComboBox15DropDown
            OnExit = ComboBox15Exit
          end
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'เบิก'
      ImageIndex = 2
      OnShow = TabSheet3Show
      object GroupBox4: TGroupBox
        Left = 8
        Top = 8
        Width = 753
        Height = 489
        Caption = 'รายละเอียด'
        TabOrder = 0
        object Label21: TLabel
          Left = 16
          Top = 24
          Width = 64
          Height = 14
          Caption = 'เลขที่ใบสำคัญ'
        end
        object Label22: TLabel
          Left = 180
          Top = 24
          Width = 21
          Height = 14
          Caption = 'วันที่'
        end
        object Label23: TLabel
          Left = 312
          Top = 24
          Width = 26
          Height = 14
          Caption = 'ผู้เบิก'
        end
        object Label24: TLabel
          Left = 56
          Top = 56
          Width = 20
          Height = 14
          Caption = 'ผู้รับ'
        end
        object Label25: TLabel
          Left = 488
          Top = 56
          Width = 36
          Height = 14
          Caption = 'ผู้สั่งจ่าย'
        end
        object Label26: TLabel
          Left = 264
          Top = 56
          Width = 25
          Height = 14
          Caption = 'ผู้จ่าย'
        end
        object Label27: TLabel
          Left = 40
          Top = 88
          Width = 36
          Height = 14
          Caption = 'รายการ'
        end
        object Label29: TLabel
          Left = 504
          Top = 24
          Width = 19
          Height = 14
          Caption = 'ฝ่าย'
        end
        object Bring_ID: TEdit
          Left = 88
          Top = 21
          Width = 81
          Height = 22
          TabOrder = 0
        end
        object Recieve_Name: TEdit
          Left = 88
          Top = 53
          Width = 153
          Height = 22
          TabOrder = 4
        end
        object Bring_Name: TEdit
          Left = 351
          Top = 21
          Width = 137
          Height = 22
          TabOrder = 2
        end
        object BitBtn1: TBitBtn
          Left = 320
          Top = 449
          Width = 75
          Height = 25
          Caption = 'เบิก'
          TabOrder = 22
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
          Left = 408
          Top = 448
          Width = 75
          Height = 25
          Caption = 'เคลียร์'
          TabOrder = 23
          OnClick = BitBtn2Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object StringGrid2: TStringGrid
          Left = 85
          Top = 97
          Width = 394
          Height = 340
          ColCount = 3
          DefaultColWidth = 45
          DefaultRowHeight = 20
          RowCount = 16
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
          TabOrder = 24
          OnKeyPress = StringGrid2KeyPress
          ColWidths = (
            45
            266
            60)
        end
        object BringDate: TDateTimePicker
          Left = 207
          Top = 21
          Width = 89
          Height = 22
          CalAlignment = dtaLeft
          Date = 36526
          Time = 36526
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
        object Pay_Name: TEdit
          Left = 304
          Top = 53
          Width = 169
          Height = 22
          TabOrder = 5
        end
        object Command_Pay: TEdit
          Left = 536
          Top = 53
          Width = 177
          Height = 22
          TabOrder = 6
        end
        object Bring_Department: TDBLookupComboBox
          Left = 536
          Top = 22
          Width = 177
          Height = 22
          KeyField = 'Department_ID'
          ListField = 'Department_Name'
          ListSource = DM.Ds_Depart
          TabOrder = 3
        end
        object ComboBox16: TComboBox
          Left = 132
          Top = 119
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 7
          OnChange = ComboBox16Change
          OnDropDown = ComboBox16DropDown
          OnExit = ComboBox16Exit
        end
        object ComboBox17: TComboBox
          Left = 132
          Top = 140
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 8
          OnChange = ComboBox17Change
          OnDropDown = ComboBox17DropDown
          OnExit = ComboBox17Exit
        end
        object ComboBox18: TComboBox
          Left = 132
          Top = 161
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 9
          OnChange = ComboBox18Change
          OnDropDown = ComboBox18DropDown
          OnExit = ComboBox18Exit
        end
        object ComboBox19: TComboBox
          Left = 132
          Top = 182
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 10
          OnChange = ComboBox19Change
          OnDropDown = ComboBox19DropDown
          OnExit = ComboBox19Exit
        end
        object ComboBox20: TComboBox
          Left = 132
          Top = 203
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 11
          OnChange = ComboBox20Change
          OnDropDown = ComboBox20DropDown
          OnExit = ComboBox20Exit
        end
        object ComboBox21: TComboBox
          Left = 132
          Top = 224
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 12
          OnChange = ComboBox21Change
          OnDropDown = ComboBox21DropDown
          OnExit = ComboBox21Exit
        end
        object ComboBox22: TComboBox
          Left = 132
          Top = 245
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 13
          OnChange = ComboBox22Change
          OnDropDown = ComboBox22DropDown
          OnExit = ComboBox22Exit
        end
        object ComboBox23: TComboBox
          Left = 132
          Top = 266
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 14
          OnChange = ComboBox23Change
          OnDropDown = ComboBox23DropDown
          OnExit = ComboBox23Exit
        end
        object ComboBox24: TComboBox
          Left = 132
          Top = 287
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 15
          OnChange = ComboBox24Change
          OnDropDown = ComboBox24DropDown
          OnExit = ComboBox24Exit
        end
        object ComboBox25: TComboBox
          Left = 132
          Top = 308
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 16
          OnChange = ComboBox25Change
          OnDropDown = ComboBox25DropDown
          OnExit = ComboBox25Exit
        end
        object ComboBox26: TComboBox
          Left = 132
          Top = 329
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 17
          OnChange = ComboBox26Change
          OnDropDown = ComboBox26DropDown
          OnExit = ComboBox26Exit
        end
        object ComboBox27: TComboBox
          Left = 132
          Top = 350
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 18
          OnChange = ComboBox27Change
          OnDropDown = ComboBox27DropDown
          OnExit = ComboBox27Exit
        end
        object ComboBox28: TComboBox
          Left = 132
          Top = 371
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 19
          OnChange = ComboBox28Change
          OnDropDown = ComboBox28DropDown
          OnExit = ComboBox28Exit
        end
        object ComboBox29: TComboBox
          Left = 132
          Top = 392
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 20
          OnChange = ComboBox29Change
          OnDropDown = ComboBox29DropDown
          OnExit = ComboBox29Exit
        end
        object ComboBox30: TComboBox
          Left = 132
          Top = 413
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 21
          OnChange = ComboBox30Change
          OnDropDown = ComboBox30DropDown
          OnExit = ComboBox30Exit
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'รับคืน'
      ImageIndex = 1
      OnShow = TabSheet2Show
      object GroupBox3: TGroupBox
        Left = 8
        Top = 10
        Width = 745
        Height = 498
        Caption = 'รายละเอียด'
        TabOrder = 0
        object Label16: TLabel
          Left = 29
          Top = 24
          Width = 21
          Height = 14
          Caption = 'วันที่'
        end
        object Label17: TLabel
          Left = 169
          Top = 24
          Width = 22
          Height = 14
          Caption = 'ผู้คืน'
        end
        object Label18: TLabel
          Left = 345
          Top = 24
          Width = 19
          Height = 14
          Caption = 'ฝ่าย'
        end
        object Label19: TLabel
          Left = 553
          Top = 24
          Width = 35
          Height = 14
          Caption = 'ผู้รับคืน'
        end
        object Label20: TLabel
          Left = 17
          Top = 107
          Width = 36
          Height = 14
          Caption = 'รายการ'
        end
        object Label37: TLabel
          Left = 20
          Top = 57
          Width = 32
          Height = 14
          Caption = 'เหตุผล'
        end
        object Return_Name: TEdit
          Left = 198
          Top = 21
          Width = 137
          Height = 22
          TabOrder = 1
        end
        object ReturnDepart: TDBLookupComboBox
          Left = 377
          Top = 21
          Width = 161
          Height = 22
          KeyField = 'Department_ID'
          ListField = 'Department_Name'
          ListSource = DM.Ds_Depart
          TabOrder = 2
        end
        object BitBtn11: TBitBtn
          Left = 294
          Top = 458
          Width = 75
          Height = 25
          Caption = 'รับคืน'
          Default = True
          TabOrder = 20
          OnClick = BitBtn11Click
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
        object Date_Return: TDateTimePicker
          Left = 65
          Top = 21
          Width = 89
          Height = 22
          CalAlignment = dtaLeft
          Date = 36526
          Time = 36526
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
        object BitBtn12: TBitBtn
          Left = 383
          Top = 458
          Width = 75
          Height = 25
          Caption = 'เคลียร์'
          TabOrder = 21
          OnClick = BitBtn12Click
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
        object StringGrid3: TStringGrid
          Left = 64
          Top = 107
          Width = 394
          Height = 341
          ColCount = 3
          DefaultColWidth = 45
          DefaultRowHeight = 20
          RowCount = 16
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goTabs, goAlwaysShowEditor]
          TabOrder = 22
          OnKeyPress = StringGrid3KeyPress
          ColWidths = (
            45
            266
            60)
        end
        object ReTake: TEdit
          Left = 601
          Top = 21
          Width = 129
          Height = 22
          TabOrder = 3
        end
        object ComboBox31: TComboBox
          Left = 111
          Top = 129
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 5
          OnChange = ComboBox31Change
          OnDropDown = ComboBox31DropDown
          OnExit = ComboBox31Exit
        end
        object ComboBox32: TComboBox
          Left = 111
          Top = 150
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 6
          OnChange = ComboBox32Change
          OnDropDown = ComboBox32DropDown
          OnExit = ComboBox32Exit
        end
        object ComboBox33: TComboBox
          Left = 111
          Top = 171
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 7
          OnChange = ComboBox33Change
          OnDropDown = ComboBox33DropDown
          OnExit = ComboBox33Exit
        end
        object ComboBox34: TComboBox
          Left = 111
          Top = 192
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 8
          OnChange = ComboBox34Change
          OnDropDown = ComboBox34DropDown
          OnExit = ComboBox34Exit
        end
        object ComboBox35: TComboBox
          Left = 111
          Top = 213
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 9
          OnChange = ComboBox35Change
          OnDropDown = ComboBox35DropDown
          OnExit = ComboBox35Exit
        end
        object ComboBox36: TComboBox
          Left = 111
          Top = 234
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 10
          OnChange = ComboBox36Change
          OnDropDown = ComboBox36DropDown
          OnExit = ComboBox36Exit
        end
        object ComboBox37: TComboBox
          Left = 111
          Top = 255
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 11
          OnChange = ComboBox37Change
          OnDropDown = ComboBox37DropDown
          OnExit = ComboBox37Exit
        end
        object ComboBox38: TComboBox
          Left = 111
          Top = 276
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 12
          OnChange = ComboBox38Change
          OnDropDown = ComboBox38DropDown
          OnExit = ComboBox38Exit
        end
        object ComboBox39: TComboBox
          Left = 111
          Top = 297
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 13
          OnChange = ComboBox39Change
          OnDropDown = ComboBox39DropDown
          OnExit = ComboBox39Exit
        end
        object ComboBox40: TComboBox
          Left = 111
          Top = 318
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 14
          OnChange = ComboBox40Change
          OnDropDown = ComboBox40DropDown
          OnExit = ComboBox40Exit
        end
        object ComboBox41: TComboBox
          Left = 111
          Top = 339
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 15
          OnChange = ComboBox41Change
          OnDropDown = ComboBox41DropDown
          OnExit = ComboBox41Exit
        end
        object ComboBox42: TComboBox
          Left = 111
          Top = 360
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 16
          OnChange = ComboBox42Change
          OnDropDown = ComboBox42DropDown
          OnExit = ComboBox42Exit
        end
        object ComboBox43: TComboBox
          Left = 111
          Top = 381
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 17
          OnChange = ComboBox43Change
          OnDropDown = ComboBox43DropDown
          OnExit = ComboBox43Exit
        end
        object ComboBox44: TComboBox
          Left = 111
          Top = 402
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 18
          OnChange = ComboBox44Change
          OnDropDown = ComboBox44DropDown
          OnExit = ComboBox44Exit
        end
        object ComboBox45: TComboBox
          Left = 111
          Top = 423
          Width = 267
          Height = 22
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 19
          OnChange = ComboBox45Change
          OnDropDown = ComboBox45DropDown
          OnExit = ComboBox45Exit
        end
        object RReason: TMemo
          Left = 63
          Top = 53
          Width = 475
          Height = 44
          TabOrder = 4
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'รายงาน'
      ImageIndex = 5
      OnShow = TabSheet9Show
      object PageControl3: TPageControl
        Left = 8
        Top = 9
        Width = 753
        Height = 513
        ActivePage = TabSheet10
        TabOrder = 0
        object TabSheet10: TTabSheet
          Caption = 'ตามประเภท'
          object Label10: TLabel
            Left = 8
            Top = 240
            Width = 22
            Height = 14
            Caption = 'ชนิด'
          end
          object Label36: TLabel
            Left = 8
            Top = 12
            Width = 37
            Height = 14
            Caption = 'ประเภท'
          end
          object DBGrid1: TDBGrid
            Left = 184
            Top = 8
            Width = 553
            Height = 433
            DataSource = DM.Ds_Show_Inven
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'Inventory_Name'
                Title.Alignment = taCenter
                Title.Caption = 'ชื่อหรือชนิด'
                Width = 158
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Category'
                Title.Alignment = taCenter
                Title.Caption = 'ประเภท'
                Width = 108
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Have_No'
                Title.Alignment = taCenter
                Title.Caption = 'จำนวน'
                Width = 60
                Visible = True
              end
              item
                Alignment = taRightJustify
                Expanded = False
                FieldName = 'Numerative'
                Title.Alignment = taCenter
                Title.Caption = 'หน่วย'
                Width = 56
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Min_Have'
                Title.Alignment = taCenter
                Title.Caption = 'จำนวนต่ำสุด'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PPE'
                Title.Alignment = taCenter
                Title.Caption = 'ราคาต่อหน่วย'
                Visible = True
              end>
          end
          object Type_Print: TButton
            Left = 657
            Top = 447
            Width = 75
            Height = 25
            Caption = 'พิมพ์รายงาน'
            TabOrder = 0
            OnClick = Type_PrintClick
          end
          object CkL_Type: TCheckListBox
            Left = 8
            Top = 262
            Width = 169
            Height = 177
            OnClickCheck = CkL_TypeClickCheck
            ItemHeight = 14
            TabOrder = 2
          end
          object BitBtn16: TBitBtn
            Left = 80
            Top = 448
            Width = 99
            Height = 25
            Caption = 'แสดงรายการ'
            TabOrder = 4
            Visible = False
            OnClick = BitBtn16Click
            Kind = bkRetry
          end
          object CkL_Cat: TCheckListBox
            Left = 8
            Top = 32
            Width = 169
            Height = 177
            OnClickCheck = CkL_CatClickCheck
            ItemHeight = 14
            TabOrder = 3
          end
        end
        object TabSheet11: TTabSheet
          Caption = 'การเบิก'
          ImageIndex = 1
          OnShow = TabSheet11Show
          object Label39: TLabel
            Left = 334
            Top = 450
            Width = 27
            Height = 14
            Caption = 'สิ้นสุด'
          end
          object Label40: TLabel
            Left = 195
            Top = 450
            Width = 33
            Height = 14
            Caption = 'เริ่มต้น'
          end
          object Label41: TLabel
            Left = 8
            Top = 164
            Width = 37
            Height = 14
            Caption = 'ประเภท'
          end
          object Label42: TLabel
            Left = 8
            Top = 328
            Width = 22
            Height = 14
            Caption = 'ชนิด'
          end
          object Label38: TLabel
            Left = 8
            Top = 4
            Width = 19
            Height = 14
            Caption = 'ฝ่าย'
          end
          object Bring_Show: TSpeedButton
            Left = 613
            Top = 452
            Width = 20
            Height = 18
            Visible = False
            OnClick = Bring_ShowClick
          end
          object Bring_Print: TButton
            Left = 663
            Top = 447
            Width = 75
            Height = 25
            Caption = 'พิมพ์รายงาน'
            TabOrder = 0
            OnClick = Bring_PrintClick
          end
          object Ckl_Cat2: TCheckListBox
            Left = 8
            Top = 184
            Width = 169
            Height = 129
            OnClickCheck = Ckl_Cat2ClickCheck
            ItemHeight = 14
            TabOrder = 1
          end
          object Ckl_Type2: TCheckListBox
            Left = 8
            Top = 344
            Width = 169
            Height = 129
            OnClickCheck = Ckl_Type2ClickCheck
            ItemHeight = 14
            TabOrder = 2
          end
          object CkL_Depart: TCheckListBox
            Left = 8
            Top = 24
            Width = 169
            Height = 129
            OnClickCheck = CkL_DepartClickCheck
            ItemHeight = 14
            TabOrder = 3
          end
          object Bring_D1: TDateTimePicker
            Left = 232
            Top = 448
            Width = 89
            Height = 22
            CalAlignment = dtaLeft
            Date = 54789.0011467593
            Time = 54789.0011467593
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 4
            OnChange = Bring_D1Change
          end
          object Bring_D2: TDateTimePicker
            Left = 368
            Top = 448
            Width = 89
            Height = 22
            CalAlignment = dtaLeft
            Date = 36959.0011849537
            Time = 36959.0011849537
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 5
            OnChange = Bring_D2Change
          end
          object Bring_Report: TDBGrid
            Left = 192
            Top = 8
            Width = 545
            Height = 425
            DataSource = DM.Ds_Show_Bring
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 6
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Expanded = False
                FieldName = 'Department_Name'
                Title.Caption = 'ฝ่าย'
                Width = 154
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Category'
                Title.Caption = 'ประเภท'
                Width = 158
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Inventory_Name'
                Title.Caption = 'ชื่อวัสดุ'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COLUMN4'
                Title.Caption = 'จำนวนที่เบิก'
                Width = 79
                Visible = True
              end>
          end
          object Temp_Date: TDateTimePicker
            Left = 464
            Top = 448
            Width = 0
            Height = 0
            CalAlignment = dtaLeft
            Date = 36961.0922347222
            Time = 36961.0922347222
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkDate
            ParseInput = False
            TabOrder = 7
            Visible = False
          end
        end
        object TabSheet12: TTabSheet
          Caption = 'สรุปรายงานประจำปี'
          ImageIndex = 2
          OnShow = TabSheet12Show
          object Year_Report: TDBGrid
            Left = 8
            Top = 8
            Width = 729
            Height = 425
            DataSource = DM.Ds_Year
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Alignment = taCenter
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'Inventory_Name'
                Title.Caption = 'ชื่อวัสดุ'
                Width = 178
                Visible = True
              end
              item
                Alignment = taCenter
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'Category'
                Title.Caption = 'ประเภท'
                Width = 159
                Visible = True
              end
              item
                Alignment = taCenter
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'H'
                Title.Caption = 'จำนวนคงเหลือ'
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'R'
                Title.Caption = 'จำนวนซื้อ'
                Width = 83
                Visible = True
              end
              item
                Alignment = taCenter
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'B'
                Title.Caption = 'จำนวนเบิก'
                Width = 81
                Visible = True
              end
              item
                Alignment = taCenter
                ButtonStyle = cbsEllipsis
                Expanded = False
                FieldName = 'COLUMN6'
                Title.Caption = 'ราคาเฉลี่ยต่อหน่วย'
                Visible = True
              end>
          end
          object Year_Print: TButton
            Left = 657
            Top = 450
            Width = 75
            Height = 25
            Caption = 'พิมพ์รายงาน'
            TabOrder = 1
            OnClick = Year_PrintClick
          end
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'ข้อมูลทั่วไป'
      ImageIndex = 4
      object PageControl2: TPageControl
        Left = 9
        Top = 8
        Width = 753
        Height = 521
        ActivePage = TabSheet7
        TabOrder = 0
        object TabSheet7: TTabSheet
          Caption = 'บัญชีวัสดุ'
          ImageIndex = 1
          OnShow = TabSheet7Show
          object GroupBox5: TGroupBox
            Left = 16
            Top = 2
            Width = 617
            Height = 439
            Caption = 'รายละเอียด'
            TabOrder = 0
            object Inventory_List: TDBGrid
              Left = 16
              Top = 24
              Width = 585
              Height = 393
              DataSource = DM.Ds_Inventory_Detail
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                  FieldName = 'Inventory_Name'
                  Title.Alignment = taCenter
                  Title.Caption = 'ชื่อหรือชนิด'
                  Width = 167
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Category'
                  Title.Alignment = taCenter
                  Title.Caption = 'ประเภท'
                  Width = 117
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Have_No'
                  Title.Alignment = taCenter
                  Title.Caption = 'จำนวน'
                  Width = 86
                  Visible = True
                end
                item
                  Alignment = taRightJustify
                  Expanded = False
                  FieldName = 'Numerative'
                  Title.Alignment = taCenter
                  Title.Caption = 'หน่วย'
                  Width = 49
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'Min_Have'
                  Title.Alignment = taCenter
                  Title.Caption = 'จำนวนต่ำสุด'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PPE'
                  Title.Alignment = taCenter
                  Title.Caption = 'ราคาต่อหน่วย'
                  Width = 67
                  Visible = True
                end>
            end
          end
          object BitBtn4: TBitBtn
            Left = 655
            Top = 50
            Width = 75
            Height = 25
            Caption = 'เพิ่ม'
            TabOrder = 1
            OnClick = BitBtn4Click
            Glyph.Data = {
              F2010000424DF201000000000000760000002800000024000000130000000100
              0400000000007C01000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
              3333333333388F3333333333000033334224333333333333338338F333333333
              0000333422224333333333333833338F33333333000033422222243333333333
              83333338F3333333000034222A22224333333338F33F33338F33333300003222
              A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
              38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
              2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
              0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
              333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
              33333A2224A2233333333338F338F83300003333333333A2224A333333333333
              8F338F33000033333333333A222433333333333338F338F30000333333333333
              A224333333333333338F38F300003333333333333A223333333333333338F8F3
              000033333333333333A3333333333333333383330000}
            NumGlyphs = 2
          end
          object BitBtn5: TBitBtn
            Left = 653
            Top = 88
            Width = 75
            Height = 25
            Caption = 'แก้ไข'
            TabOrder = 2
            OnClick = BitBtn5Click
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
              33333333333F8888883F33330000324334222222443333388F3833333388F333
              000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
              F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
              223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
              3338888300003AAAAAAA33333333333888888833333333330000333333333333
              333333333333333333FFFFFF000033333333333344444433FFFF333333888888
              00003A444333333A22222438888F333338F3333800003A2243333333A2222438
              F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
              22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
              33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object BitBtn6: TBitBtn
            Left = 653
            Top = 128
            Width = 75
            Height = 25
            Cancel = True
            Caption = 'ลบ'
            ModalResult = 2
            TabOrder = 3
            OnClick = BitBtn6Click
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
        end
        object TabSheet6: TTabSheet
          Caption = 'บริษัท'
          OnShow = TabSheet6Show
          object Label28: TLabel
            Left = 24
            Top = 24
            Width = 41
            Height = 14
            Caption = 'ชื่อบริษัท'
          end
          object Label30: TLabel
            Left = 48
            Top = 64
            Width = 20
            Height = 14
            Caption = 'ที่อยู่'
          end
          object Label31: TLabel
            Left = 344
            Top = 24
            Width = 65
            Height = 14
            Caption = 'เบอร์โทรศัพท์'
          end
          object Label32: TLabel
            Left = 352
            Top = 144
            Width = 59
            Height = 14
            Caption = 'เบอร์โทรสาร'
          end
          object CP_Addr: TDBMemo
            Left = 80
            Top = 62
            Width = 217
            Height = 161
            AutoDisplay = False
            Color = clMenu
            DataField = 'Address'
            DataSource = DM.Ds_Company
            Font.Charset = EASTEUROPE_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object CP_Tel1: TDBEdit
            Left = 424
            Top = 22
            Width = 121
            Height = 22
            Color = clMenu
            DataField = 'Phone1'
            DataSource = DM.Ds_Company
            TabOrder = 1
          end
          object CP_Tel2: TDBEdit
            Left = 425
            Top = 62
            Width = 121
            Height = 22
            Color = clMenu
            DataField = 'Phone2'
            DataSource = DM.Ds_Company
            TabOrder = 2
          end
          object CP_Tel3: TDBEdit
            Left = 424
            Top = 102
            Width = 121
            Height = 22
            Color = clMenu
            DataField = 'Phone3'
            DataSource = DM.Ds_Company
            TabOrder = 3
          end
          object CP_Fax: TDBEdit
            Left = 424
            Top = 142
            Width = 121
            Height = 22
            Color = clMenu
            DataField = 'Fax'
            DataSource = DM.Ds_Company
            TabOrder = 4
          end
          object LB_CompanyN: TDBLookupComboBox
            Left = 80
            Top = 22
            Width = 217
            Height = 22
            KeyField = 'Company_ID'
            ListField = 'Company_Name'
            ListSource = DM.Ds_Company
            TabOrder = 5
            OnMouseDown = LB_CompanyNMouseDown
          end
          object BitBtn7: TBitBtn
            Left = 344
            Top = 200
            Width = 75
            Height = 25
            Caption = 'เพิ่ม'
            TabOrder = 6
            OnClick = BitBtn7Click
            Glyph.Data = {
              F2010000424DF201000000000000760000002800000024000000130000000100
              0400000000007C01000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
              3333333333388F3333333333000033334224333333333333338338F333333333
              0000333422224333333333333833338F33333333000033422222243333333333
              83333338F3333333000034222A22224333333338F33F33338F33333300003222
              A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
              38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
              2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
              0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
              333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
              33333A2224A2233333333338F338F83300003333333333A2224A333333333333
              8F338F33000033333333333A222433333333333338F338F30000333333333333
              A224333333333333338F38F300003333333333333A223333333333333338F8F3
              000033333333333333A3333333333333333383330000}
            NumGlyphs = 2
          end
          object BitBtn8: TBitBtn
            Left = 440
            Top = 200
            Width = 75
            Height = 25
            Caption = 'แก้ไข'
            TabOrder = 7
            OnClick = BitBtn8Click
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
              33333333333F8888883F33330000324334222222443333388F3833333388F333
              000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
              F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
              223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
              3338888300003AAAAAAA33333333333888888833333333330000333333333333
              333333333333333333FFFFFF000033333333333344444433FFFF333333888888
              00003A444333333A22222438888F333338F3333800003A2243333333A2222438
              F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
              22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
              33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
              3333333333338888883333330000333333333333333333333333333333333333
              0000}
            NumGlyphs = 2
          end
          object BitBtn9: TBitBtn
            Left = 536
            Top = 200
            Width = 75
            Height = 25
            Cancel = True
            Caption = 'ลบ'
            ModalResult = 2
            TabOrder = 8
            OnClick = BitBtn9Click
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
        end
        object TabSheet8: TTabSheet
          Caption = 'บุคคลากร/ฝ่าย'
          ImageIndex = 2
          OnShow = TabSheet8Show
          object GroupBox7: TGroupBox
            Left = 16
            Top = 16
            Width = 481
            Height = 137
            Caption = 'บุคคลากร'
            TabOrder = 0
            object Label33: TLabel
              Left = 16
              Top = 96
              Width = 94
              Height = 14
              Caption = 'เจ้าหน้าที่ธุรการพัสดุ'
            end
            object Label34: TLabel
              Left = 40
              Top = 64
              Width = 72
              Height = 14
              Caption = 'นักวิชาการพัสดุ'
            end
            object Label35: TLabel
              Left = 56
              Top = 32
              Width = 57
              Height = 14
              Caption = 'ผู้อำนวยการ'
            end
            object President: TEdit
              Left = 128
              Top = 32
              Width = 193
              Height = 22
              TabOrder = 0
            end
            object InvenOfficer: TEdit
              Left = 128
              Top = 64
              Width = 193
              Height = 22
              TabOrder = 1
            end
            object InvenSec: TEdit
              Left = 128
              Top = 96
              Width = 193
              Height = 22
              TabOrder = 2
            end
            object BitBtn3: TBitBtn
              Left = 352
              Top = 96
              Width = 105
              Height = 25
              Caption = 'แก้ไขบุคคลากร'
              TabOrder = 3
              OnClick = BitBtn3Click
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
                33333333333F8888883F33330000324334222222443333388F3833333388F333
                000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
                F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
                223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
                3338888300003AAAAAAA33333333333888888833333333330000333333333333
                333333333333333333FFFFFF000033333333333344444433FFFF333333888888
                00003A444333333A22222438888F333338F3333800003A2243333333A2222438
                F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
                22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
                33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
                3333333333338888883333330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
            end
          end
          object GroupBox8: TGroupBox
            Left = 16
            Top = 168
            Width = 425
            Height = 273
            Caption = 'ฝ่าย'
            TabOrder = 1
            object DBG_Depart: TDBGrid
              Left = 24
              Top = 24
              Width = 257
              Height = 231
              DataSource = DM.Ds_Depart
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Columns = <
                item
                  DropDownRows = 12
                  Expanded = False
                  FieldName = 'Department_Name'
                  Title.Alignment = taCenter
                  Title.Caption = 'ชื่อฝ่าย'
                  Width = 241
                  Visible = True
                end>
            end
            object BitBtn13: TBitBtn
              Left = 312
              Top = 152
              Width = 75
              Height = 25
              Caption = 'เพิ่ม'
              TabOrder = 1
              OnClick = BitBtn13Click
              Glyph.Data = {
                F2010000424DF201000000000000760000002800000024000000130000000100
                0400000000007C01000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333334433333
                3333333333388F3333333333000033334224333333333333338338F333333333
                0000333422224333333333333833338F33333333000033422222243333333333
                83333338F3333333000034222A22224333333338F33F33338F33333300003222
                A2A2224333333338F383F3338F33333300003A2A222A222433333338F8333F33
                38F33333000034A22222A22243333338833333F3338F333300004222A2222A22
                2433338F338F333F3338F3330000222A3A2224A22243338F3838F338F3338F33
                0000A2A333A2224A2224338F83338F338F3338F300003A33333A2224A2224338
                333338F338F3338F000033333333A2224A2243333333338F338F338F00003333
                33333A2224A2233333333338F338F83300003333333333A2224A333333333333
                8F338F33000033333333333A222433333333333338F338F30000333333333333
                A224333333333333338F38F300003333333333333A223333333333333338F8F3
                000033333333333333A3333333333333333383330000}
              NumGlyphs = 2
            end
            object BitBtn14: TBitBtn
              Left = 312
              Top = 192
              Width = 75
              Height = 25
              Caption = 'แก้ไข'
              TabOrder = 2
              OnClick = BitBtn14Click
              Glyph.Data = {
                DE010000424DDE01000000000000760000002800000024000000120000000100
                0400000000006801000000000000000000001000000000000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
                33333333333F8888883F33330000324334222222443333388F3833333388F333
                000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
                F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
                223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
                3338888300003AAAAAAA33333333333888888833333333330000333333333333
                333333333333333333FFFFFF000033333333333344444433FFFF333333888888
                00003A444333333A22222438888F333338F3333800003A2243333333A2222438
                F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
                22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
                33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
                3333333333338888883333330000333333333333333333333333333333333333
                0000}
              NumGlyphs = 2
            end
            object BitBtn15: TBitBtn
              Left = 312
              Top = 232
              Width = 75
              Height = 25
              Cancel = True
              Caption = 'ลบ'
              ModalResult = 7
              TabOrder = 3
              OnClick = BitBtn15Click
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
          end
        end
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 12
    Top = 521
    object N1: TMenuItem
      Caption = 'รับของ'
      Default = True
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = 'แก้ไข'
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = 'ลบ'
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = 'พิมพ์'
      OnClick = N4Click
    end
  end
end
