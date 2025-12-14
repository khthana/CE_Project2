object dataform: Tdataform
  Left = 253
  Top = 74
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #3610#3619#3636#3585#3634#3619#3586#3657#3629#3617#3641#3621#3627#3609#3633#3591#3626#3639#3629' '#3626#3636#3656#3591#3614#3636#3617#3614#3660
  ClientHeight = 469
  ClientWidth = 697
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 552
    Top = 424
    Width = 113
    Height = 33
    Caption = #3585#3621#3633#3610#3626#3641#3656#3627#3609#3657#3634#3648#3617#3609#3641#3627#3621#3633#3585
    TabOrder = 0
    OnClick = Button1Click
  end
  object TabbedNotebook1: TTabbedNotebook
    Left = 40
    Top = 24
    Width = 625
    Height = 393
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clBtnText
    TabFont.Height = -11
    TabFont.Name = 'MS Sans Serif'
    TabFont.Style = []
    TabOrder = 1
    object TTabPage
      Left = 4
      Top = 27
      Caption = #3627#3609#3633#3591#3626#3639#3629
      object Label1: TLabel
        Left = 64
        Top = 32
        Width = 87
        Height = 16
        Caption = #3648#3621#3586#3607#3632#3648#3610#3637#3618#3609#3627#3609#3633#3591#3626#3639#3629
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 120
        Top = 72
        Width = 31
        Height = 16
        Caption = #3648#3621#3586#3627#3617#3641#3656
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 336
        Top = 72
        Width = 31
        Height = 16
        Caption = 'ISBN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 104
        Top = 112
        Width = 47
        Height = 16
        Caption = #3594#3639#3656#3629#3627#3609#3633#3591#3626#3639#3629
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 24
        Top = 152
        Width = 46
        Height = 16
        Caption = #3594#3639#3656#3629#3612#3641#3657#3649#3605#3656#3591'1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 320
        Top = 152
        Width = 46
        Height = 16
        Caption = #3594#3639#3656#3629#3612#3641#3657#3649#3605#3656#3591'2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 24
        Top = 192
        Width = 46
        Height = 16
        Caption = #3594#3639#3656#3629#3612#3641#3657#3649#3605#3656#3591'3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label8: TLabel
        Left = 104
        Top = 232
        Width = 51
        Height = 16
        Caption = #3592#3635#3609#3623#3609#3627#3609#3657#3634
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label9: TLabel
        Left = 320
        Top = 232
        Width = 48
        Height = 16
        Caption = #3626#3635#3609#3633#3585#3614#3636#3617#3614#3660
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 104
        Top = 272
        Width = 50
        Height = 16
        Caption = #3614#3636#3617#3614#3660#3588#3619#3633#3657#3591#3607#3637#3656
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label11: TLabel
        Left = 328
        Top = 272
        Width = 46
        Height = 16
        Caption = #3623#3633#3609#3607#3637#3656#3652#3604#3657#3619#3633#3610
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EditBookSerial: TEdit
        Left = 160
        Top = 32
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyUp = EditBookSerialKeyUp
      end
      object EditBookCall_no: TEdit
        Left = 160
        Top = 72
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyUp = EditBookCall_noKeyUp
      end
      object EditBookIsbn: TEdit
        Left = 376
        Top = 72
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object EditBookName: TEdit
        Left = 160
        Top = 112
        Width = 441
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object EditBookAuthor1: TEdit
        Left = 80
        Top = 152
        Width = 225
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object EditBookAuthor2: TEdit
        Left = 376
        Top = 160
        Width = 225
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object EditBookAuthor3: TEdit
        Left = 80
        Top = 192
        Width = 225
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object EditPage_num: TEdit
        Left = 160
        Top = 232
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object EditBookPublish: TEdit
        Left = 376
        Top = 232
        Width = 225
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object EditBookEdition: TEdit
        Left = 160
        Top = 272
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object EditReceived_date: TEdit
        Left = 376
        Top = 272
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object ButtonBookCancel: TButton
        Left = 160
        Top = 320
        Width = 75
        Height = 25
        Caption = #3618#3585#3648#3621#3636#3585
        TabOrder = 11
        OnClick = ButtonBookCancelClick
      end
      object ButtonBookDelete: TButton
        Left = 304
        Top = 320
        Width = 75
        Height = 25
        Caption = #3621#3610#3586#3657#3629#3617#3641#3621
        TabOrder = 12
        OnClick = ButtonBookDeleteClick
      end
      object ButtonBookSave: TButton
        Left = 440
        Top = 320
        Width = 75
        Height = 25
        Caption = #3610#3633#3609#3607#3638#3585#3586#3657#3629#3617#3641#3621
        TabOrder = 13
        OnClick = ButtonBookSaveClick
      end
    end
    object TTabPage
      Left = 4
      Top = 27
      Caption = #3623#3634#3619#3626#3634#3619
      object Label12: TLabel
        Left = 56
        Top = 32
        Width = 88
        Height = 16
        Caption = #3648#3621#3586#3607#3632#3648#3610#3637#3618#3609#3623#3634#3619#3626#3634#3619
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 112
        Top = 80
        Width = 31
        Height = 16
        Caption = #3648#3621#3586#3627#3617#3641#3656
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label14: TLabel
        Left = 360
        Top = 80
        Width = 31
        Height = 16
        Caption = 'ISSN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label15: TLabel
        Left = 96
        Top = 128
        Width = 48
        Height = 16
        Caption = #3594#3639#3656#3629#3623#3634#3619#3626#3634#3619
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label16: TLabel
        Left = 128
        Top = 176
        Width = 20
        Height = 16
        Caption = 'Vol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label17: TLabel
        Left = 376
        Top = 176
        Width = 15
        Height = 16
        Caption = #3611#3637#3607#3637#3656
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label18: TLabel
        Left = 112
        Top = 224
        Width = 30
        Height = 16
        Caption = #3593#3610#3633#3610#3607#3637#3656
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label19: TLabel
        Left = 336
        Top = 224
        Width = 51
        Height = 16
        Caption = #3592#3635#3609#3623#3609#3627#3609#3657#3634
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label20: TLabel
        Left = 96
        Top = 272
        Width = 48
        Height = 16
        Caption = #3626#3635#3609#3633#3585#3614#3636#3617#3614#3660
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label21: TLabel
        Left = 344
        Top = 272
        Width = 46
        Height = 16
        Caption = #3623#3633#3609#3607#3637#3656#3652#3604#3657#3619#3633#3610
      end
      object EditMagSerial: TEdit
        Left = 160
        Top = 32
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnKeyUp = EditMagSerialKeyUp
      end
      object EditMagCall_no: TEdit
        Left = 160
        Top = 80
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnKeyUp = EditMagCall_noKeyUp
      end
      object EditMagIssn: TEdit
        Left = 400
        Top = 80
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object EditMagName: TEdit
        Left = 160
        Top = 128
        Width = 385
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object EditMagVol: TEdit
        Left = 160
        Top = 176
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object EditMagYear: TEdit
        Left = 400
        Top = 176
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object EditMagNo: TEdit
        Left = 160
        Top = 224
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object EditMagPage_num: TEdit
        Left = 400
        Top = 224
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object EditMagPublish: TEdit
        Left = 160
        Top = 272
        Width = 145
        Height = 24
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object ButtonMagCancel: TButton
        Left = 160
        Top = 320
        Width = 75
        Height = 25
        Caption = #3618#3585#3648#3621#3636#3585
        TabOrder = 9
        OnClick = ButtonMagCancelClick
      end
      object ButtonMagDelete: TButton
        Left = 304
        Top = 320
        Width = 75
        Height = 25
        Caption = #3621#3610#3586#3657#3629#3617#3641#3621
        TabOrder = 10
        OnClick = ButtonMagDeleteClick
      end
      object ButtonMagSave: TButton
        Left = 440
        Top = 320
        Width = 75
        Height = 25
        Caption = #3610#3633#3609#3607#3638#3585#3586#3657#3629#3617#3641#3621
        TabOrder = 11
        OnClick = ButtonMagSaveClick
      end
      object EditMagRdate: TEdit
        Left = 400
        Top = 272
        Width = 145
        Height = 24
        TabOrder = 12
      end
    end
  end
end
