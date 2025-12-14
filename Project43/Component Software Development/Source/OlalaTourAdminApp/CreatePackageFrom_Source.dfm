object frmCreatePackage: TfrmCreatePackage
  Left = 60
  Top = 10
  Width = 903
  Height = 682
  Caption = 'Create package'
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
  object labAdminID: TLabel
    Left = 472
    Top = 472
    Width = 43
    Height = 13
    Caption = 'Admin ID'
  end
  object labArriveTime: TLabel
    Left = 680
    Top = 504
    Width = 49
    Height = 13
    Caption = 'Arrive time'
  end
  object labDescription: TLabel
    Left = 464
    Top = 536
    Width = 53
    Height = 13
    Caption = 'Description'
  end
  object labPackageName: TLabel
    Left = 448
    Top = 504
    Width = 72
    Height = 13
    Caption = 'Package name'
  end
  object labDepartTime: TLabel
    Left = 680
    Top = 472
    Width = 54
    Height = 13
    Caption = 'Depart time'
  end
  object labTotalPrice: TLabel
    Left = 688
    Top = 536
    Width = 50
    Height = 13
    Caption = 'Total price'
  end
  object grbPlace: TGroupBox
    Left = 16
    Top = 8
    Width = 425
    Height = 209
    Caption = 'Place'
    TabOrder = 0
    object stgPlace: TStringGrid
      Left = 16
      Top = 24
      Width = 377
      Height = 137
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
    end
    object btnAddPlace: TButton
      Left = 320
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Add place'
      TabOrder = 1
      OnClick = btnAddPlaceClick
    end
  end
  object grbAircarft: TGroupBox
    Left = 16
    Top = 224
    Width = 425
    Height = 209
    Caption = 'Aircarft'
    TabOrder = 1
    object stgAircraft: TStringGrid
      Left = 16
      Top = 24
      Width = 377
      Height = 137
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
    end
    object btnAddAircraft: TButton
      Left = 320
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Add aircraft'
      TabOrder = 1
      OnClick = btnAddAircraftClick
    end
  end
  object grbBus: TGroupBox
    Left = 16
    Top = 440
    Width = 425
    Height = 209
    Caption = 'Bus'
    TabOrder = 2
    object stgBus: TStringGrid
      Left = 16
      Top = 24
      Width = 377
      Height = 137
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
    end
    object btnBus: TButton
      Left = 320
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Add bus'
      TabOrder = 1
      OnClick = btnBusClick
    end
  end
  object grbHotel: TGroupBox
    Left = 456
    Top = 8
    Width = 425
    Height = 209
    Caption = 'Hotel'
    TabOrder = 3
    object stgHotel: TStringGrid
      Left = 16
      Top = 24
      Width = 377
      Height = 137
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
      RowHeights = (
        24
        24
        24
        24
        24)
    end
    object btnHotel: TButton
      Left = 320
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Add hotel'
      TabOrder = 1
      OnClick = btnHotelClick
    end
  end
  object grbRestaurant: TGroupBox
    Left = 456
    Top = 224
    Width = 425
    Height = 209
    Caption = 'Restaurant'
    TabOrder = 4
    object stgRestaurant: TStringGrid
      Left = 16
      Top = 24
      Width = 377
      Height = 137
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
      TabOrder = 0
    end
    object btnRestaurant: TButton
      Left = 320
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Add restaurant'
      TabOrder = 1
      OnClick = btnRestaurantClick
    end
  end
  object btnCreatePackage: TButton
    Left = 624
    Top = 576
    Width = 100
    Height = 25
    Caption = 'Create package'
    TabOrder = 5
    OnClick = btnCreatePackageClick
  end
  object btnClose: TButton
    Left = 800
    Top = 616
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = btnCloseClick
  end
  object edtAdminID: TEdit
    Left = 528
    Top = 464
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 7
  end
  object edtPackageName: TEdit
    Left = 528
    Top = 496
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object edtDescription: TEdit
    Left = 528
    Top = 528
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object edtArriveTime: TEdit
    Left = 744
    Top = 496
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object edtDepartTime: TEdit
    Left = 744
    Top = 464
    Width = 121
    Height = 21
    TabOrder = 11
  end
  object edtTotalPrice: TEdit
    Left = 744
    Top = 528
    Width = 121
    Height = 21
    TabOrder = 12
  end
end
