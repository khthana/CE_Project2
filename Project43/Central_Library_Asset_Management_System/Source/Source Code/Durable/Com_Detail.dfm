object Fr_Com_Detail: TFr_Com_Detail
  Left = 321
  Top = 133
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'รายละเอียดคอมพิวเตอร์'
  ClientHeight = 479
  ClientWidth = 433
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object GroupBox1: TGroupBox
    Left = 17
    Top = 17
    Width = 398
    Height = 398
    Caption = 'คอมพิวเตอร์'
    TabOrder = 0
    object Label1: TLabel
      Left = 34
      Top = 43
      Width = 22
      Height = 14
      Caption = 'CPU'
    end
    object Label2: TLabel
      Left = 17
      Top = 78
      Width = 35
      Height = 14
      Caption = 'Monitor'
    end
    object Label3: TLabel
      Left = 9
      Top = 112
      Width = 47
      Height = 14
      Caption = 'Hard Disk'
    end
    object Label4: TLabel
      Left = 34
      Top = 146
      Width = 24
      Height = 14
      Caption = 'RAM'
    end
    object Label5: TLabel
      Left = 26
      Top = 181
      Width = 32
      Height = 14
      Caption = 'Mouse'
    end
    object Label6: TLabel
      Left = 9
      Top = 215
      Width = 49
      Height = 14
      Caption = 'Key Board'
    end
    object Label7: TLabel
      Left = 9
      Top = 250
      Width = 46
      Height = 14
      Caption = 'LAN Card'
    end
    object Label8: TLabel
      Left = 17
      Top = 284
      Width = 43
      Height = 14
      Caption = 'CD-ROM'
    end
    object Label9: TLabel
      Left = 9
      Top = 319
      Width = 56
      Height = 14
      Caption = 'Sound Card'
    end
    object Label10: TLabel
      Left = 26
      Top = 353
      Width = 40
      Height = 14
      Caption = 'Speaker'
    end
    object ComboBox10: TComboBox
      Left = 79
      Top = 345
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 19
      Visible = False
    end
    object ComboBox9: TComboBox
      Left = 80
      Top = 311
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 18
      Visible = False
    end
    object ComboBox8: TComboBox
      Left = 79
      Top = 276
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 17
      Visible = False
    end
    object ComboBox7: TComboBox
      Left = 79
      Top = 241
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 16
      Visible = False
    end
    object ComboBox6: TComboBox
      Left = 79
      Top = 207
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 15
      Visible = False
    end
    object ComboBox5: TComboBox
      Left = 78
      Top = 172
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 14
      Visible = False
    end
    object ComboBox4: TComboBox
      Left = 80
      Top = 139
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 13
      Visible = False
    end
    object ComboBox3: TComboBox
      Left = 80
      Top = 103
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 12
      Visible = False
    end
    object ComboBox2: TComboBox
      Left = 78
      Top = 69
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 11
      Visible = False
    end
    object ComboBox1: TComboBox
      Left = 79
      Top = 34
      Width = 303
      Height = 22
      ItemHeight = 14
      TabOrder = 10
      Visible = False
    end
    object Ed_CPU: TEdit
      Left = 78
      Top = 34
      Width = 276
      Height = 22
      TabOrder = 0
    end
    object Ed_Monitor: TEdit
      Left = 78
      Top = 69
      Width = 276
      Height = 22
      TabOrder = 1
    end
    object Ed_Harddisk: TEdit
      Left = 78
      Top = 103
      Width = 276
      Height = 22
      TabOrder = 2
    end
    object Ed_Ram: TEdit
      Left = 78
      Top = 138
      Width = 276
      Height = 22
      TabOrder = 3
    end
    object Ed_Mouse: TEdit
      Left = 78
      Top = 172
      Width = 276
      Height = 22
      TabOrder = 4
    end
    object Ed_Keyboard: TEdit
      Left = 78
      Top = 207
      Width = 276
      Height = 22
      TabOrder = 5
    end
    object Ed_Lancard: TEdit
      Left = 78
      Top = 241
      Width = 276
      Height = 22
      TabOrder = 6
    end
    object Ed_CDROM: TEdit
      Left = 78
      Top = 276
      Width = 276
      Height = 22
      TabOrder = 7
    end
    object Ed_Speaker: TEdit
      Left = 78
      Top = 345
      Width = 276
      Height = 22
      TabOrder = 9
    end
    object Ed_Soundcard: TEdit
      Left = 78
      Top = 310
      Width = 276
      Height = 22
      TabOrder = 8
    end
  end
  object BitBtn1: TBitBtn
    Left = 224
    Top = 431
    Width = 81
    Height = 27
    Caption = 'ตกลง'
    ModalResult = 1
    TabOrder = 1
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
    Left = 327
    Top = 431
    Width = 81
    Height = 27
    Caption = 'ยกเลิก'
    TabOrder = 2
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
end
