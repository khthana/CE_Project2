object MainForm: TMainForm
  Left = 413
  Top = 221
  Width = 286
  Height = 212
  BorderIcons = []
  Caption = 'OlalaTour Admin Application'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnViewLog: TButton
    Left = 64
    Top = 112
    Width = 145
    Height = 25
    Caption = 'View &Log'
    TabOrder = 0
    OnClick = btnViewLogClick
  end
  object btnPlace: TButton
    Left = 64
    Top = 16
    Width = 145
    Height = 25
    Caption = '&Place Management'
    TabOrder = 1
    OnClick = btnPlaceClick
  end
  object btnUser: TButton
    Left = 64
    Top = 80
    Width = 145
    Height = 25
    Caption = '&User Management'
    TabOrder = 2
    OnClick = btnUserClick
  end
  object btnPackageManagement: TButton
    Left = 64
    Top = 48
    Width = 145
    Height = 25
    Caption = 'Pac&kage Management'
    TabOrder = 3
    OnClick = btnPackageManagementClick
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object Login1: TMenuItem
      Caption = '&Action'
      object mnuActionLogIn: TMenuItem
        Caption = 'Log&In'
        OnClick = mnuActionLogInClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mnuActionExit: TMenuItem
        Caption = 'E&xit'
        OnClick = mnuActionExitClick
      end
    end
  end
end
