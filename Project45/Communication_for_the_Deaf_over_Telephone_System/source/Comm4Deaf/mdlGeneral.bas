Attribute VB_Name = "mdlGeneral"
Option Explicit

Public Declare Function SendMessage Lib "USER32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Public ModemSettingEnabled As Boolean
Public mName1 As String ' station name
Public mName2 As String ' remote name
Public mColor1 As Long ' station color
Public mColor2 As Long ' remote color
Public dtmfText As String
Public makingCall As Boolean ' make call = true, answer call = false
Public onCall As Boolean ' on = true, off = false
Public Const mColor0 As Long = &HA000& ' system text color
Public MixWaveFilename As String
Public AnimateFrame As Integer

Public Sub ErrBox(str As String)
  MsgBox str, vbCritical & vbOKOnly, "ผิดพลาด"
End Sub

Public Sub InfoBox(str As String)
  MsgBox str, vbInformation & vbOKOnly, "รายละเอียด"
End Sub

Public Sub ShowStatus(str As String)
  frmMain.labStatus.Caption = str
End Sub

Public Sub StartImcomingAnimation()
  AnimateFrame = 0
  frmMain.Timer3.Enabled = True
  frmMain.imgPhone(0).ZOrder
End Sub

Public Sub StopImcomingAnimation()
  frmMain.Timer3.Enabled = False
  frmMain.imgPhone(0).ZOrder
End Sub

Public Sub LoadValues()
  lDev = GetSetting("Comm4Deaf", "Setting", "LineDev", 0)
  mName1 = GetSetting("Comm4Deaf", "Setting", "Name1", "เจ้าของเครื่อง")
  mName2 = GetSetting("Comm4Deaf", "Setting", "Name2", "คู่สนทนา")
  mColor1 = GetSetting("Comm4Deaf", "Setting", "Color1", &HC80000)
  mColor2 = GetSetting("Comm4Deaf", "Setting", "Color2", &H8000FF)
  frmMain.cmbChatLine.c1Fore = mColor1
End Sub

Public Sub SaveValues()
  SaveSetting "Comm4Deaf", "Setting", "LineDev", lDev
  SaveSetting "Comm4Deaf", "Setting", "Name1", mName1
  SaveSetting "Comm4Deaf", "Setting", "Name2", mName2
  SaveSetting "Comm4Deaf", "Setting", "Color1", mColor1
  SaveSetting "Comm4Deaf", "Setting", "Color2", mColor2
End Sub

Public Sub MakeCall(ByVal Addr As String)
  Dim lpCallParams As LINECALLPARAMS
  Dim ret As Long

  If Trim(Addr) = "" Then Exit Sub
  lpCallParams.dwTotalSize = Len(lpCallParams)
  lpCallParams.dwMediaMode = LINEMEDIAMODE_INTERACTIVEVOICE
  ret = lineMakeCall(lphLine, lphCall, Addr, 0, lpCallParams)
  If ret < 0 Then
    ErrBox "lineMakeCall : " & TapiErrMsg(ret)
  Else
    makingCall = True
    onCall = True
    frmMain.txtChatBox.Text = ""
    frmMain.btnMakeCall.Enabled = False
    frmMain.btnAnswerCall.Enabled = False
    frmMain.btnDropCall.Enabled = True
    frmMain.btnExit.Enabled = False
    ModemSettingEnabled = False
    ShowStatus "กำลังโทร... " & Addr
  End If
End Sub

Public Sub AnswerCall()
  Dim ret As Long
  StopImcomingAnimation
  ret = lineAnswer(lphCall, vbNullString, 0)
  If ret < 0 Then
    ErrBox "lineAnswer : " & TapiErrMsg(ret)
  Else
    makingCall = False
    onCall = True
    frmMain.txtChatBox.Text = ""
    frmMain.btnMakeCall.Enabled = False
    frmMain.btnAnswerCall.Enabled = False
    frmMain.btnDropCall.Enabled = True
    frmMain.btnExit.Enabled = False
    ModemSettingEnabled = False
  End If
End Sub

Public Sub DropCall()
  If Not onCall Then Exit Sub
  Dim ret As Long
  'frmMain.fraChat.Enabled = False
  frmMain.Width = 4220
  CenterForm frmMain
  ret = lineDrop(lphCall, vbNullString, 0)
  If ret < 0 Then
    ErrBox "lineDrop : " & TapiErrMsg(ret)
  Else
    onCall = False
    frmMain.btnMakeCall.Enabled = True
    frmMain.btnAnswerCall.Enabled = False
    frmMain.btnDropCall.Enabled = False
    frmMain.btnExit.Enabled = True
    ModemSettingEnabled = True
  End If
  ShowStatus "พร้อม"
  StopImcomingAnimation
End Sub

Public Sub IncomingCall()
  frmMain.btnMakeCall.Enabled = False
  frmMain.btnAnswerCall.Enabled = True
  frmMain.btnDropCall.Enabled = False
  frmMain.btnExit.Enabled = True
  ModemSettingEnabled = False
  ShowStatus "รับสายโทรเข้า"
  StartImcomingAnimation
End Sub

Public Sub IdleCall()
  lineDeallocateCall (lphCall)
  frmMain.btnMakeCall.Enabled = True
  frmMain.btnAnswerCall.Enabled = False
  frmMain.btnDropCall.Enabled = False
  frmMain.btnExit.Enabled = True
  ModemSettingEnabled = True
  ShowStatus "พร้อม"
  StopImcomingAnimation
End Sub

Public Sub ConnectedCall()
  Dim ret As Long
  ret = lineMonitorDigits(lphCall, LINEDIGITMODE_DTMF)
  If ret < 0 Then ErrBox "lineMonitorDigits : " & TapiErrMsg(ret)
  ShowStatus "โทรติด"
  frmMain.StatusBar.Caption = ""
  frmMain.fraChat.Enabled = True
  frmMain.cmbChatLine.Clear
  frmMain.cmbChatLine.Text = ""
  frmMain.txtChatLine.Text = ""
  If makingCall Then ' Make Call
    AddTxtChatBox "<ในการโทรออก โมเด็มส่วนใหญ่ทำงานได้ไม่ถูกต้อง>", mColor0
    AddTxtChatBox "<โมเด็มมักถือว่าการโทรติดแต่ยังไม่มีผู้รับสาย คือ การโทรติดและมีผู้รับสายแล้ว>", mColor0
    AddTxtChatBox "<ดังนั้น ผู้ใช้ควรส่งข้อความเป็นระยะๆ จนกว่าคู่สนทนาจะตอบกลับ>", mColor0
  End If
  frmMain.Width = 11685
  CenterForm frmMain
End Sub

Public Sub MonitorDigit(digit As String)
  Dim chr As String
  frmMain.btnSend.Enabled = False
  frmMain.Timer1.Enabled = True
  frmMain.StatusBar.Caption = mName2 & " กำลังพิมพ์ข้อความ"
  If (Right(InBuff, 1) = "#") And (digit = "#") Then
    MakeWave "<SEND> <BEEP>", MixWaveFilename
    PlayWave MixWaveFilename
    AddTxtChatBox mName2 & " : " & OutBuff, mColor2
    InBuff = ""
    OutBuff = ""
    Exit Sub
  End If
 
  If (digit = "*") Then
    chr = MatchPattern(InBuff, OutBuff)
    InBuff = ""
    'If (GetFilenameOf(chr) <> "") And (Not isPlaying) Then
    '-----------------
    If (chr <> "") And (Not isPlaying) Then
    '-----------------
      MakeWave chr & " <BEEP>", MixWaveFilename
      PlayWave MixWaveFilename
    End If
    Exit Sub
  End If
  
  InBuff = InBuff & digit
End Sub

Public Sub PlayWave(ByVal Filename As String)
  GetLineID "wave/out"
  LoadFile Filename
  Play lMediaID
End Sub

Public Sub DonePlayWave()
  frmMain.btnSend.Enabled = True
  frmMain.btnSend.Caption = "ส่งข้อความ"
End Sub

Public Sub AddTxtChatBox(str As String, col As Long)
  frmMain.txtTemp.Text = str
  frmMain.txtTemp.SelStart = 0
  frmMain.txtTemp.SelLength = Len(frmMain.txtTemp.Text)
  frmMain.txtTemp.SelColor = col
  Clipboard.Clear
  Clipboard.SetText frmMain.txtTemp.TextRTF, vbCFRTF
  frmMain.txtChatBox.Locked = False
  frmMain.txtChatBox.SelStart = Len(frmMain.txtChatBox.Text)
  SendMessage frmMain.txtChatBox.hWnd, &H302, 0, 0 ' Paste
  frmMain.txtChatBox.Locked = True
End Sub

Public Sub CenterForm(frm As Form)
  frm.Left = (Screen.Width - frm.Width) / 2
  frm.Top = (Screen.Height - frm.Height) / 2
End Sub

