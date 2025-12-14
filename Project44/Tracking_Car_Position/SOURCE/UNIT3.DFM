object Form3: TForm3
  Left = 231
  Top = 138
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Load Data from Serial Port'
  ClientHeight = 254
  ClientWidth = 303
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
    Left = 22
    Top = 207
    Width = 73
    Height = 13
    Caption = 'Loading Data...'
  end
  object ProgressBar1: TProgressBar
    Left = 46
    Top = 229
    Width = 224
    Height = 15
    Min = 0
    Max = 100
    Smooth = True
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 289
    Height = 177
    Caption = 'Enter Tracking Info.'
    TabOrder = 1
    object Label2: TLabel
      Left = 48
      Top = 24
      Width = 62
      Height = 13
      Caption = 'Tracking ID. '
    end
    object Label3: TLabel
      Left = 48
      Top = 48
      Width = 59
      Height = 13
      Caption = 'Driver Name'
    end
    object Label4: TLabel
      Left = 48
      Top = 72
      Width = 33
      Height = 13
      Caption = 'Car ID.'
    end
    object Label5: TLabel
      Left = 48
      Top = 96
      Width = 29
      Height = 13
      Caption = 'Route'
    end
    object Ttrack_id: TEdit
      Left = 120
      Top = 24
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 4
    end
    object Tdriver: TEdit
      Left = 120
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Button1: TButton
      Left = 112
      Top = 136
      Width = 75
      Height = 25
      Caption = 'Load Data'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Tcar_id: TEdit
      Left = 120
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Troute: TEdit
      Left = 120
      Top = 96
      Width = 121
      Height = 21
      TabOrder = 2
    end
  end
  object all_data: TTable
    Active = True
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'local database'
    TableName = 'GPS'
    UpdateMode = upWhereChanged
    Left = 264
    Top = 136
  end
  object VaComm1: TVaComm
    Baudrate = br4800
    ParityCheck = True
    FlowControl.OutCtsFlow = False
    FlowControl.OutDsrFlow = False
    FlowControl.ControlDtr = dtrDisabled
    FlowControl.ControlRts = rtsDisabled
    FlowControl.XonXoffOut = False
    FlowControl.XonXoffIn = False
    FlowControl.DsrSensitivity = False
    FlowControl.TxContinueOnXoff = False
    Options = [coNullStrip]
    DeviceName = 'COM%d'
    MonitorEvents = [ceBreak, ceCts, ceDsr, ceError, ceRing, ceRlsd, ceRxChar, ceTxEmpty, ceRxFlag, cePErr, ceRx80Full, ceEvent1, ceEvent2]
    Buffers.ReadSize = 8096
    DirectWrite = True
    OnRxChar = VaComm1RxChar
    Left = 232
    Top = 136
  end
  object report1: TTable
    Active = True
    CachedUpdates = True
    AutoRefresh = True
    DatabaseName = 'local database'
    TableName = 'REPORT'
    Left = 264
    Top = 168
  end
  object Timer1: TTimer
    Interval = 200
    OnTimer = Timer1Timer
    Left = 232
    Top = 168
  end
end
