object frmAddHotelToPackage: TfrmAddHotelToPackage
  Left = 177
  Top = -6
  Width = 684
  Height = 720
  Caption = 'Add hotel to package'
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
  object grbSearchHotel: TGroupBox
    Left = 8
    Top = 8
    Width = 657
    Height = 233
    Caption = 'Search hotel'
    TabOrder = 0
    object labNameSearch: TLabel
      Left = 32
      Top = 176
      Width = 28
      Height = 13
      Caption = 'Name'
    end
    object labAddressSearch: TLabel
      Left = 24
      Top = 208
      Width = 38
      Height = 13
      Caption = 'Address'
    end
    object labDescriptionSearch: TLabel
      Left = 248
      Top = 176
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object labClassSearch: TLabel
      Left = 272
      Top = 208
      Width = 25
      Height = 13
      Caption = 'Class'
    end
    object stgSearchHotel: TStringGrid
      Left = 16
      Top = 24
      Width = 625
      Height = 137
      FixedCols = 0
      TabOrder = 0
      OnMouseUp = stgSearchHotelMouseUp
    end
    object edtNameSearch: TEdit
      Left = 72
      Top = 168
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtAddressSearch: TEdit
      Left = 72
      Top = 200
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtDescriptionSearch: TEdit
      Left = 312
      Top = 168
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtClassSearch: TEdit
      Left = 312
      Top = 200
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object btnSearch: TButton
      Left = 512
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Search'
      TabOrder = 5
      OnClick = btnSearchClick
    end
  end
  object grbViewHotelProperty: TGroupBox
    Left = 8
    Top = 248
    Width = 657
    Height = 217
    Caption = 'Hotel property'
    TabOrder = 1
    object labHotelIDView: TLabel
      Left = 96
      Top = 184
      Width = 39
      Height = 13
      Caption = 'Hotel ID'
    end
    object stgViewHotelProperty: TStringGrid
      Left = 16
      Top = 24
      Width = 625
      Height = 137
      FixedCols = 0
      TabOrder = 0
      OnMouseUp = stgViewHotelPropertyMouseUp
    end
    object edtHotelIDView: TEdit
      Left = 152
      Top = 176
      Width = 233
      Height = 21
      TabOrder = 1
    end
    object btnView: TButton
      Left = 520
      Top = 176
      Width = 75
      Height = 25
      Caption = 'View'
      TabOrder = 2
      OnClick = btnViewClick
    end
  end
  object grbAddHotelToPackage: TGroupBox
    Left = 8
    Top = 472
    Width = 657
    Height = 185
    Caption = 'Add hotel to package'
    TabOrder = 2
    object labHotelIDAdd: TLabel
      Left = 88
      Top = 32
      Width = 39
      Height = 13
      Caption = 'Hotel ID'
    end
    object labBookCheckInTimeAdd: TLabel
      Left = 32
      Top = 64
      Width = 91
      Height = 13
      Caption = 'Book check in time'
    end
    object labBookCheckOutTimeAdd: TLabel
      Left = 24
      Top = 96
      Width = 98
      Height = 13
      Caption = 'Book check out time'
    end
    object labPricePerDayAdd: TLabel
      Left = 64
      Top = 128
      Width = 62
      Height = 13
      Caption = 'Price per day'
    end
    object labDescriptionAdd: TLabel
      Left = 72
      Top = 160
      Width = 53
      Height = 13
      Caption = 'Description'
    end
    object labNumberOfSingleBedAdd: TLabel
      Left = 288
      Top = 32
      Width = 100
      Height = 13
      Caption = 'Number of single bed'
    end
    object labNumberOfCoupleBedAdd: TLabel
      Left = 280
      Top = 64
      Width = 105
      Height = 13
      Caption = 'Number of couple bed'
    end
    object labRoomClass: TLabel
      Left = 336
      Top = 96
      Width = 55
      Height = 13
      Caption = 'Room class'
    end
    object labFloorAdd: TLabel
      Left = 368
      Top = 128
      Width = 23
      Height = 13
      Caption = 'Floor'
    end
    object labRoomAmountAdd: TLabel
      Left = 320
      Top = 160
      Width = 66
      Height = 13
      Caption = 'Room amount'
    end
    object edtHotelIDAdd: TEdit
      Left = 136
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object edtBookCheckInTimeAdd: TEdit
      Left = 136
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object edtBookCheckOutTimeAdd: TEdit
      Left = 136
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object edtPricePerDayAdd: TEdit
      Left = 136
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object edtDescriptionAdd: TEdit
      Left = 136
      Top = 152
      Width = 121
      Height = 21
      TabOrder = 4
    end
    object edtNumberOfSingleBedAdd: TEdit
      Left = 400
      Top = 24
      Width = 121
      Height = 21
      TabOrder = 5
    end
    object edtNumberOfCoupleBedAdd: TEdit
      Left = 400
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 6
    end
    object edtRoomClassAdd: TEdit
      Left = 400
      Top = 88
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object edtFloorAdd: TEdit
      Left = 400
      Top = 120
      Width = 121
      Height = 21
      TabOrder = 8
    end
    object edtRoomAmountAdd: TEdit
      Left = 400
      Top = 152
      Width = 121
      Height = 21
      TabOrder = 9
    end
    object btnAddToPackage: TButton
      Left = 544
      Top = 88
      Width = 100
      Height = 25
      Caption = 'Add to package'
      TabOrder = 10
      OnClick = btnAddToPackageClick
    end
  end
  object btnClose: TButton
    Left = 592
    Top = 664
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = btnCloseClick
  end
end
