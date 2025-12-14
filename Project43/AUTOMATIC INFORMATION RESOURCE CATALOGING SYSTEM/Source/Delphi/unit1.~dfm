object Form1: TForm1
  Left = 99
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'พิมพ์รายชื่อหนังสือ'
  ClientHeight = 176
  ClientWidth = 543
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 330
    Top = 141
    Width = 119
    Height = 23
    Caption = 'แสดงตัวอย่างก่อนพิมพ์'
    Default = True
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 463
    Top = 141
    Width = 69
    Height = 23
    Caption = 'ยกเลิก'
    TabOrder = 1
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 30
    Top = 22
    Width = 350
    Height = 98
    Caption = 'ปี/เดือน/วัน ที่ต้องการ'
    TabOrder = 2
    object Label1: TLabel
      Left = 74
      Top = 48
      Width = 27
      Height = 13
      Caption = 'ตั้งแต่'
    end
    object Label2: TLabel
      Left = 193
      Top = 48
      Width = 12
      Height = 13
      Caption = 'ถึง'
    end
    object MaskEdit1: TMaskEdit
      Left = 111
      Top = 45
      Width = 53
      Height = 21
      EditMask = '!99/99/99;1;_'
      MaxLength = 8
      TabOrder = 0
      Text = '  /  /  '
    end
    object MaskEdit2: TMaskEdit
      Left = 230
      Top = 45
      Width = 53
      Height = 21
      EditMask = '!99/99/99;1;_'
      MaxLength = 8
      TabOrder = 1
      Text = '  /  /  '
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 409
    Top = 22
    Width = 119
    Height = 98
    Caption = 'เรียงลำดับจาก'
    Items.Strings = (
      'เรียงตามตัวอักษร'
      'เรียงตามวันที่')
    TabOrder = 3
  end
  object ADOQuery1: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MarcsheetDB.mdb;Per' +
      'sist Security Info=False'
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select t008_7,t090_1,t099_1,t100_1,t110_1,t111_1,t130_1,t245_1,t' +
        '210_1,t240_1,t242_1,book_no from tagdata1'
      'order by 1')
    Left = 32
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery2
    Left = 64
    Top = 136
  end
  object ADOTable1: TADOTable
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MarcsheetDB.mdb;Per' +
      'sist Security Info=False'
    CursorType = ctStatic
    TableName = 'tmp'
    Left = 144
    Top = 136
  end
  object ADOQuery2: TADOQuery
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=MarcsheetDB.mdb;Per' +
      'sist Security Info=False'
    OnCalcFields = ADOQuery2CalcFields
    Parameters = <>
    SQL.Strings = (
      'select BookCode,AuthorName,title,BookNo,Date'
      'from tmp')
    Left = 112
    Top = 136
    object ADOQuery2BookCode: TWideStringField
      FieldName = 'BookCode'
      Size = 255
    end
    object ADOQuery2AuthorName: TWideStringField
      FieldName = 'AuthorName'
      Size = 255
    end
    object ADOQuery2title: TWideStringField
      FieldName = 'title'
      Size = 255
    end
    object ADOQuery2BookNo: TWideStringField
      FieldName = 'BookNo'
      Size = 255
    end
    object ADOQuery2Date: TWideStringField
      FieldName = 'Date'
      Size = 255
    end
    object ADOQuery2No: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'No'
      Calculated = True
    end
  end
end
