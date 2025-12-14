Attribute VB_Name = "mdlOperation"
Option Explicit
Global UseKey As Double
Global N As Double
Global keyDate As Date
Global KeyType As String
Global Userid As String
Global MarketID As String
Global KeyID As String
Global PrivateKeyFile As String
Global conString As String


Public Function ImportKey(ByVal FileName As String) As Boolean
        Dim IntNextFreeFile As Integer
        'Dim passwd As String
        Dim fso As FileSystemObject
        Dim txt As TextStream
        Dim keyfile1 As String
        Dim keyfile2 As String
        
        
                Select Case Right(FileName, 4)
                        Case ".pvk"     'private key
                                'passwd = InputBox("Enter Passphase to Decrypt Private Key", "Passphase")
                                If (Password <> "") Then
                                        Set fso = New FileSystemObject
                                        Set txt = fso.OpenTextFile(FileName, ForReading)
                                                keyfile1 = Decrypt(txt.ReadLine, Password)
                                                If keyfile1 <> "" Then
                                                        keyfile2 = Decrypt(txt.ReadLine, Password)
                                                        If keyfile2 <> "" Then
                                                                keyDate = CDate(txt.ReadLine)
                                                                If txt.AtEndOfStream Then
                                                                        If (keyfile1 <> vbNullString) And (keyfile2 <> vbNullString) Then
                                                                                UseKey = Val(keyfile1)
                                                                                N = Val(keyfile2)
                                                                                KeyType = "Private Key"
                                                                                'Message "Import Private Key Already", vbInformation + vbOKOnly, "Import Key"
                                                                                ImportKey = True
                                                                        Else
                                                                                MsgBox "Private key file Error"
                                                                                ImportKey = False
                                                                        End If
                                                                Else
                                                                        MsgBox "Private key file Error"
                                                                End If
                                                        End If
                                                End If
                                        txt.Close
                                        Set fso = Nothing
                                        
                                Else
                                    ImportKey = False
                                    MsgBox "Password is Empty" & vbCrLf & "Please Set Password in Setting Before", vbExclamation + vbOKOnly, "Error"
                                End If
                        Case ".pbk"     'public key
                                IntNextFreeFile = FreeFile
                                Open FileName For Binary As #IntNextFreeFile
                                Get #IntNextFreeFile, , UseKey
                                Get #IntNextFreeFile, , N
                                Get #IntNextFreeFile, , keyDate
                                Close #IntNextFreeFile
                                KeyType = ""
                                'MsgBox "Import Public Key Already", vbInformation + vbOKOnly, "Import Key"
                                ImportKey = True
                        Case Else
                                ImportKey = False
                                MsgBox "File type not match." & vbCrLf & "This file is not a key file." & vbCrLf & "Did not import key."
                 End Select
End Function


Public Sub GenKey(ByVal FileName As String)
                Dim passwd As String
                Dim IntNextFreeFile As Integer
                Dim dateCreate As Date
                passwd = InputBox("Enter Passphase to Encrypt Private Key" & vbCrLf & "(Must be at least 8 characters)", "Passphase")
                If (passwd <> "") Then
                       If (Len(passwd) >= 8) Then
                               keyGen
                               dateCreate = Now
                               IntNextFreeFile = FreeFile
                               Open FileName & ".pvk" For Binary Access Write As #IntNextFreeFile
                               Put #IntNextFreeFile, , Encrypt(Str(key(1)), passwd)
                               Put #IntNextFreeFile, , vbCrLf
                               Put #IntNextFreeFile, , Encrypt(Str(key(3)), passwd)
                               Put #IntNextFreeFile, , vbCrLf
                               Put #IntNextFreeFile, , CStr(dateCreate)
                               Close #IntNextFreeFile

                                IntNextFreeFile = FreeFile
                               Open FileName & ".pbk" For Binary Access Write As #IntNextFreeFile
                               Put #IntNextFreeFile, , key(2)
                               Put #IntNextFreeFile, , key(3)
                               Put #IntNextFreeFile, , dateCreate
                               Close #IntNextFreeFile
                               
                               MsgBox "Generated Private Key in """ & FileName & ".pvk""" & vbCrLf & _
                                                " Generated Public Key in """ & FileName & ".pbk""", vbInformation + vbOKOnly
                       Else
                               MsgBox "Passpahse must be at least 8 characters", vbExclamation + vbOKOnly, "Error !"
                       End If
                End If
End Sub

Public Function SearchPublicKey(ByVal Userid As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        
        On Error GoTo msgerr:
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.Open conString
        rcs.Open "PublicKey", conn, 1, 3
        rcs.Find "UserID = '" & Userid & "'"
        If rcs.AbsolutePosition <> adPosEOF Then
                With rcs
                        UseKey = !PublicKey
                        N = !N
                        keyDate = !keyDate
                End With
                SearchPublicKey = True
        Else
                SearchPublicKey = False
                MsgBox "Can not find this UserID in Public Key Ring"
        End If
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
Exit Function
msgerr:
        SearchPublicKey = False
        MsgBox "Market ID Error Try Another Market ID"
End Function



Public Sub GetIP_Port(ByVal Userid As String, ByRef ip As String, ByRef port As Long)
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    Set conn = New ADODB.Connection
    Set rcs = New ADODB.Recordset
    conn.ConnectionString = conString
    conn.Open
    rcs.Open "select ip,port from publickey where userid = '" & Userid & "'", conn
    ip = rcs("IP")
    port = rcs("Port")
    rcs.Close
    conn.Close
    Set conn = Nothing
    Set rcs = Nothing
End Sub

Public Function searchIP_PortfromUID(ByVal Usid As String) As Boolean
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    Set conn = New ADODB.Connection
    Set rcs = New ADODB.Recordset
    conn.ConnectionString = conString
    conn.Open
    rcs.Open "select * from PublicKey where userid = """ & Usid & """", conn, 1, 3
    If rcs.RecordCount > 0 Then
        Userid = Usid
        remoteIP = rcs!ip
        remotePort = rcs!port
        searchIP_PortfromUID = True
    Else
        Userid = ""
        searchIP_PortfromUID = False
    End If
    rcs.Close
    conn.Close
    Set rcs = Nothing
    Set conn = Nothing
End Function

Public Function SetParameterByMemberID(ByVal memberID As Integer) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = conString
        conn.Open
        rcs.Open "select * from PublicKey where memberid = " & memberID, conn, 1, 3
        If rcs.RecordCount > 0 Then
                Userid = rcs!Userid
                remoteIP = rcs!ip
                remotePort = rcs!port
                SetParameterByMemberID = True
        Else
        Userid = ""
        SetParameterByMemberID = False
    End If
    rcs.Close
    conn.Close
    Set rcs = Nothing
    Set conn = Nothing
End Function

Public Function getUserIDfromMemberID(ByVal memberID As String) As String
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset

        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = conString
        conn.Open
        rcs.Open "select UserID from PublicKey where MemberID = " & memberID, conn, 1, 3
        If rcs.RecordCount > 0 Then
                getUserIDfromMemberID = rcs!Userid
        Else
                getUserIDfromMemberID = ""
        End If
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
        
End Function

