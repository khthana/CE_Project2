object PackageManagerForm: TPackageManagerForm
  Left = 379
  Top = 197
  Width = 279
  Height = 313
  BorderIcons = []
  Caption = 'Package Manager Form'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnViewPackage: TButton
    Left = 96
    Top = 80
    Width = 100
    Height = 25
    Caption = 'View package'
    TabOrder = 0
    OnClick = btnViewPackageClick
  end
  object btnCreatePackage: TButton
    Left = 96
    Top = 120
    Width = 100
    Height = 25
    Caption = 'Create package'
    TabOrder = 1
    OnClick = btnCreatePackageClick
  end
  object btnConfirmPackage: TButton
    Left = 96
    Top = 160
    Width = 100
    Height = 25
    Caption = 'Confirm package'
    TabOrder = 2
    OnClick = btnConfirmPackageClick
  end
  object btnClose: TButton
    Left = 184
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 3
    OnClick = btnCloseClick
  end
end
