object Mainfrm: TMainfrm
  Left = 182
  Top = 191
  Width = 403
  Height = 303
  AutoSize = True
  Caption = 'Admin'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object ServerMemo: TMemo
    Left = 0
    Top = 0
    Width = 337
    Height = 209
    Lines.Strings = (
      '')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Button1: TButton
    Left = 320
    Top = 232
    Width = 75
    Height = 25
    Caption = #3648#3588#3621#3637#3618#3619#3660
    TabOrder = 1
    OnClick = Button1Click
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnAccept = ServerSocket1Accept
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 32
    Top = 8
  end
  object MainMenu1: TMainMenu
    Left = 336
    object LoginMenu: TMenuItem
      Caption = #3621#3655#3629#3585#3629#3636#3609
      OnClick = LoginMenuClick
    end
    object N1: TMenuItem
      Caption = #3648#3611#3621#3637#3656#3618#3609#3586#3657#3629#3617#3641#3621#3651#3609#3610#3633#3605#3619
      object CardInfoMenu: TMenuItem
        Caption = #3586#3657#3629#3617#3641#3621#3626#3656#3623#3609#3605#3633#3623
        OnClick = CardInfoMenuClick
      end
      object IncBalMenu: TMenuItem
        Caption = #3648#3605#3636#3617#3648#3591#3636#3609
        OnClick = IncBalMenuClick
      end
    end
    object RateMenu: TMenuItem
      Caption = #3648#3611#3621#3637#3656#3618#3609#3629#3633#3605#3619#3634#3588#3656#3634#3610#3619#3636#3585#3634#3619
      OnClick = RateMenuClick
    end
    object LogoutMenu: TMenuItem
      Caption = #3621#3655#3629#3585#3648#3629#3634#3607#3660
      OnClick = LogoutMenuClick
    end
    object LockMenu: TMenuItem
      Caption = #3621#3655#3629#3585
      object lockallMenu: TMenuItem
        Caption = #3621#3655#3629#3585#3648#3588#3619#3639#3656#3629#3591#3607#3633#3657#3591#3627#3617#3604
        OnClick = lockallMenuClick
      end
      object unlockMenu: TMenuItem
        Caption = #3611#3621#3604#3621#3655#3629#3585#3648#3588#3619#3639#3656#3629#3591#3607#3633#3657#3591#3627#3617#3604
        OnClick = unlockMenuClick
      end
    end
  end
end
