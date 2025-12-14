object LoginForm: TLoginForm
  Left = 300
  Top = 253
  Width = 453
  Height = 195
  BorderIcons = []
  Caption = 'Login'
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
  object Label3: TLabel
    Left = 40
    Top = 24
    Width = 369
    Height = 20
    Caption = 'Please Enter LoginName and Password Below'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 40
    Top = 64
    Width = 91
    Height = 20
    Caption = 'LoginName'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 40
    Top = 96
    Width = 83
    Height = 20
    Caption = 'Password '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EdtLoginName: TEdit
    Left = 144
    Top = 64
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object BtnLogin: TButton
    Left = 168
    Top = 128
    Width = 105
    Height = 25
    Caption = 'Login'
    Default = True
    TabOrder = 2
    OnClick = BtnLoginClick
  end
  object EdtPassword: TMaskEdit
    Left = 144
    Top = 96
    Width = 177
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
end
