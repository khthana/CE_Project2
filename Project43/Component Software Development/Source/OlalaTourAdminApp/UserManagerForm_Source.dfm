object UserManagerForm: TUserManagerForm
  Left = 155
  Top = 70
  Width = 706
  Height = 546
  BorderIcons = []
  Caption = 'User Manager'
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
  object Label1: TLabel
    Left = 136
    Top = 288
    Width = 54
    Height = 13
    Caption = 'LoginName'
  end
  object Label2: TLabel
    Left = 136
    Top = 312
    Width = 47
    Height = 13
    Caption = 'FirstName'
  end
  object Label3: TLabel
    Left = 136
    Top = 336
    Width = 48
    Height = 13
    Caption = 'LastName'
  end
  object Label4: TLabel
    Left = 136
    Top = 360
    Width = 38
    Height = 13
    Caption = 'Address'
  end
  object Label5: TLabel
    Left = 136
    Top = 408
    Width = 65
    Height = 13
    Caption = 'TelephoneNo'
  end
  object Label6: TLabel
    Left = 136
    Top = 384
    Width = 63
    Height = 13
    Caption = 'EmailAddress'
  end
  object Label7: TLabel
    Left = 136
    Top = 432
    Width = 35
    Height = 13
    Caption = 'Gender'
  end
  object Label8: TLabel
    Left = 424
    Top = 288
    Width = 44
    Height = 13
    Caption = 'BirthDate'
  end
  object Label9: TLabel
    Left = 424
    Top = 312
    Width = 38
    Height = 13
    Caption = 'Religion'
  end
  object Label10: TLabel
    Left = 424
    Top = 336
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object LogType: TGroupBox
    Left = 8
    Top = 280
    Width = 113
    Height = 97
    Caption = 'User Type'
    TabOrder = 0
    object RdoAdmin: TRadioButton
      Left = 8
      Top = 24
      Width = 89
      Height = 17
      Caption = 'Admin'
      TabOrder = 0
      OnClick = RdoAdminClick
    end
    object RdoMember: TRadioButton
      Left = 8
      Top = 40
      Width = 89
      Height = 17
      Caption = 'Member'
      TabOrder = 1
      OnClick = RdoMemberClick
    end
    object RdoTraveller: TRadioButton
      Left = 8
      Top = 56
      Width = 73
      Height = 17
      Caption = 'Traveller'
      TabOrder = 2
      OnClick = RdoTravellerClick
    end
  end
  object BtnConditionalView: TButton
    Left = 8
    Top = 416
    Width = 113
    Height = 25
    Caption = '&Conditional View'
    TabOrder = 1
    OnClick = BtnConditionalViewClick
  end
  object BtnClose: TButton
    Left = 576
    Top = 464
    Width = 113
    Height = 25
    Caption = '&Close'
    TabOrder = 2
    OnClick = BtnCloseClick
  end
  object StringGrid1: TStringGrid
    Left = 12
    Top = 16
    Width = 673
    Height = 256
    ColCount = 4
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goDrawFocusSelected, goRowSizing, goColSizing, goRowMoving, goColMoving, goAlwaysShowEditor, goThumbTracking]
    TabOrder = 3
    ColWidths = (
      194
      189
      138
      142)
  end
  object EdtLoginName: TEdit
    Left = 216
    Top = 288
    Width = 185
    Height = 21
    TabOrder = 4
  end
  object EdtLastName: TEdit
    Left = 216
    Top = 336
    Width = 185
    Height = 21
    TabOrder = 5
  end
  object EdtAddress: TEdit
    Left = 216
    Top = 360
    Width = 185
    Height = 21
    TabOrder = 6
  end
  object EdtTelephoneNo: TEdit
    Left = 216
    Top = 408
    Width = 185
    Height = 21
    TabOrder = 7
  end
  object EdtEmailAddress: TEdit
    Left = 216
    Top = 384
    Width = 185
    Height = 21
    TabOrder = 8
  end
  object EdtBirthDate: TEdit
    Left = 504
    Top = 288
    Width = 185
    Height = 21
    TabOrder = 9
  end
  object EdtReligion: TEdit
    Left = 504
    Top = 312
    Width = 185
    Height = 21
    TabOrder = 10
  end
  object btnCreate: TButton
    Left = 216
    Top = 464
    Width = 113
    Height = 25
    Caption = 'Create'
    TabOrder = 11
  end
  object btnViewAll: TButton
    Left = 8
    Top = 384
    Width = 113
    Height = 25
    Caption = 'View &All'
    TabOrder = 12
    OnClick = btnViewAllClick
  end
  object EdtPassword: TEdit
    Left = 504
    Top = 336
    Width = 185
    Height = 21
    TabOrder = 13
  end
  object EdtFirstName: TEdit
    Left = 216
    Top = 312
    Width = 185
    Height = 21
    TabOrder = 14
  end
  object btnRemove: TButton
    Left = 456
    Top = 464
    Width = 113
    Height = 25
    Caption = 'Remove'
    TabOrder = 15
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 500
    Width = 698
    Height = 19
    Panels = <>
    SimplePanel = False
  end
  object btnModify: TButton
    Left = 336
    Top = 464
    Width = 113
    Height = 25
    Caption = '&Modify'
    TabOrder = 17
  end
  object ChkHasBusCompanyCustomerID: TCheckBox
    Left = 424
    Top = 368
    Width = 169
    Height = 17
    Caption = 'has Bus Company CustomerID'
    TabOrder = 18
  end
  object ChkHasAirlineCustomerID: TCheckBox
    Left = 424
    Top = 392
    Width = 169
    Height = 17
    Caption = 'has Airline CustomerID'
    TabOrder = 19
  end
  object ChkHasHotelCustomerID: TCheckBox
    Left = 424
    Top = 416
    Width = 169
    Height = 17
    Caption = 'has Hotel CustomerID'
    TabOrder = 20
  end
  object EdtGender: TEdit
    Left = 216
    Top = 432
    Width = 185
    Height = 21
    TabOrder = 21
  end
end
