Attribute VB_Name = "tapiGeneral"
Option Explicit

Public lApiVer As Long
Public nDev As Long
Public lDev As Long
Public lineApp As Long
Public lphLine As Long
Public lphCall As Long
Public lMediaID As Long

Public Function InitializeTAPI() As Long
  Dim lineExID As LINEEXTENSIONID
  Dim lineCaps As LINEDEVCAPS
  Dim ret As Long
  
  ret = lineInitialize(lineApp, App.hInstance, AddressOf LineCallBack, 0, nDev)
  If ret <> 0 Then
    ErrBox "lineInitialize : " & TapiErrMsg(ret)
  Else
    If lDev > nDev - 1 Then lDev = 0
    If lDev < 0 Then lDev = 0
    ret = lineNegotiateAPIVersion(lineApp, lDev, &H10004, &H30000, lApiVer, lineExID)
    If ret <> 0 Then
      ErrBox "lineNegotiate : " & TapiErrMsg(ret)
    Else
      ret = lineOpen(lineApp, lDev, lphLine, lApiVer, &H0, AddressOf LineCallBack, LINECALLPRIVILEGE_OWNER, LINEMEDIAMODE_AUTOMATEDVOICE, 0)
      If ret <> 0 Then
        ErrBox "lineOpen : " & TapiErrMsg(ret)
      Else
        lineCaps.dwTotalSize = Len(lineCaps)
        ret = lineGetDevCaps(lineApp, lDev, lApiVer, &H0, lineCaps)
        If ret < 0 Then
          ErrBox "lineGetDevCaps : " & TapiErrMsg(ret)
        Else
          ret = lineSetStatusMessages(lphLine, lineCaps.dwLineStates, 0)
          If ret < 0 Then
            ErrBox "lineSetStatusMessage : " & TapiErrMsg(ret)
          Else
            ShowStatus "พร้อม"
          End If
        End If
      End If
    End If
  End If
  InitializeTAPI = ret
End Function

Public Sub ShutDownTAPI()
  Dim ret As Long
  ret = lineShutdown(lineApp)
  If ret <> 0 Then
    ErrBox "lineShutdown : " & TapiErrMsg(ret)
  End If
End Sub

Public Sub EnumerateModems()
  Dim i As Long
  Dim lineCaps As LINEDEVCAPS
  Dim lineExID As LINEEXTENSIONID
  Dim ret As Long

  lineCaps.dwTotalSize = Len(lineCaps)
  frmSetting.cmbModem.Clear
  For i = 0 To nDev - 1
    ret = lineNegotiateAPIVersion(lineApp, i, &H10000, &H30000, lApiVer, lineExID)
    If ret = 0 Then
      ret = lineGetDevCaps(lineApp, i, lApiVer, &H0, lineCaps)
      If ret = 0 Then
        frmSetting.cmbModem.AddItem GetVarInfo(Clean(lineCaps.mem), (lineCaps.dwLineNameOffset - LINEDEVCAPS_FIXEDSIZE) + 1, lineCaps.dwLineNameSize - 1)
      End If
    End If
  Next
End Sub

Public Function Clean(strTemp As String) As String
  ' clean up &H0 from string
  Dim x As Integer
  For x = 1 To Len(strTemp)
    If Mid(strTemp, x, 1) = chr(0) Then
      Mid(strTemp, x, 1) = "|"
    End If
  Next
  Clean = strTemp
End Function

Public Function GetVarInfo(Data As String, Offset As Long, Length As Long) As String
  Dim strTemp As String
  GetVarInfo = Mid(Data, Offset, Length)
End Function

Public Sub GetLineID(sWave As String)
  On Error Resume Next
  Dim sTemp As String
  Dim oVar As VARSTRING
  Dim ret As Long
  
  oVar.dwTotalSize = Len(oVar)
  ret = lineGetID(lphLine, 0, lphCall, LINECALLSELECT_CALL, oVar, sWave)
  If ret <> 0 Then
    ErrBox "lineGetID : " & TapiErrMsg(ret)
  Else
    If oVar.dwStringOffset = 0 Then 'Nothing to get!
      lMediaID = -1
      Exit Sub
    End If
    sTemp = Trim(Left(oVar.bBytes(0), oVar.dwStringSize))
    lMediaID = sTemp
  End If
ErrH:
End Sub

Public Sub LineCallBack(ByVal hDevice As Long, ByVal dwMessage As Long, ByVal dwInstance As Long, ByVal dwParam1 As Long, ByVal dwParam2 As Long, ByVal dwParam3 As Long)
  Debug.Print "=> " & LineMsg(dwMessage) & " : " & Hex(dwParam1) & " : " & Hex(dwParam2) & " : " & Hex(dwParam3) & " : "
  Select Case dwMessage
    Case LINE_CALLSTATE
      Debug.Print "==> " & LineMsg(dwMessage) & " : " & LineCallStateMsg(dwParam1) & " : " & Hex(dwParam2) & " : " & Hex(dwParam3) & " : "
      Select Case dwParam1
        Case LINECALLSTATE_IDLE
          IdleCall
        Case LINECALLSTATE_OFFERING
          lphCall = hDevice
          IncomingCall
        Case LINECALLSTATE_CONNECTED
          ConnectedCall
        Case LINECALLSTATE_DISCONNECTED
            Select Case dwParam2
            Case LINEDISCONNECTMODE_NORMAL
              InfoBox "จบบทสนทนา วางสายแล้ว"
            Case LINEDISCONNECTMODE_BUSY
              ErrBox "สายไม่ว่าง"
            Case Else
              ErrBox LineDisconnectModeMsg(dwParam2)
          End Select
          DropCall
      End Select
    Case LINE_MONITORDIGITS
      MonitorDigit chr(dwParam1)
  End Select
End Sub
