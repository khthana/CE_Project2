Attribute VB_Name = "mdlSendXML"
Option Explicit
Option Base 1

Public Function SendXMLAll(ByVal SrcFile As String) As String
        
        If PrivateKeyFile = "" Then
                        MsgBox "Please Select Private Key File in Setting Key Ring Beffore Send XML file", vbExclamation + vbOKOnly
        ElseIf UserID = "" Then
                        MsgBox "Please Set UserID in KeyRing Before Send XML file", vbExclamation + vbOKOnly
        Else
                        Dim dest(2) As String
                        Dim datestr As String
                        Dim fso As FileSystemObject
                        Dim txt As TextStream
                        Dim txt2 As TextStream
                        Set fso = New FileSystemObject
                        Flag = False
                        
                         'dest(1) = App.Path & "\temp1.tmp"
                         'dest(2) = App.Path & "\temp2.tmp"
                         dest(1) = Left$(SrcFile, Len(SrcFile) - 4) & "SIGN" & Right$(SrcFile, 4)
                         dest(2) = Left$(SrcFile, Len(SrcFile) - 4) & "ENC" & Right$(SrcFile, 4)
                         ' ********* sign file **********
                         On Error GoTo msgerr
                        datestr = Format$(Now, "Short Date")
                        ImportKey PrivateKeyFile
                        KeyID = ""
                        'If optSha1.value Then
                                Sha1SignFile MarketID, UserID, datestr, SrcFile, dest(1), UseKey, N
                        'ElseIf optMD5.value Then
                        '        MD5SignFile "", UserID, lblDateCreate.Caption, txtSource.Text, txtDest.Text, UseKey, N
                        'End If
                                       
                         '******** Encrypt File ********
                         If fso.FileExists(dest(1)) Then
                                Set txt = fso.OpenTextFile(dest(1), ForReading)
                                Set txt2 = fso.CreateTextFile(dest(2), True)
                                
                                KeyID = ""
                                SearchPublicKey MarketID
                                txt2.Write enc(txt.ReadAll, UseKey, N)
                                Message "Encrypt File Complete"
                                txt.Close
                                txt2.Close
                                
                                SendXMLAll = dest(2)
                                Flag = True
                                
                                Dim key As String
                                key = frmRecvFiles.AddRootTree_S("", SrcFile, mdiMain.imgType)
                                frmRecvFiles.AddChildTree key, "", dest(1), mdiMain.imgType
                                frmRecvFiles.AddChildTree key, "", dest(2), mdiMain.imgType
                                
                        End If
                        Set fso = Nothing
        End If
Exit Function
msgerr:
        Message Error$
        SendXMLAll = ""
        Flag = False
End Function

Public Function SendTSXMLAll(ByVal SrcFile As String) As String
        
        If PrivateKeyFile = "" Then
                        MsgBox "Please Select Private Key File in Setting Key Ring Beffore Send XML file", vbExclamation + vbOKOnly
        ElseIf UserID = "" Then
                        MsgBox "Please Set UserID in KeyRing Before Send XML file", vbExclamation + vbOKOnly
        Else
                        Dim dest(2) As String
                        Dim datestr As String
                        Dim fso As FileSystemObject
                        Dim txt As TextStream
                        Dim txt2 As TextStream
                        Set fso = New FileSystemObject
                        Flag = False
                        
                         'dest(1) = App.Path & "\temp1.tmp"
                         'dest(2) = App.Path & "\temp2.tmp"
                         dest(1) = Left$(SrcFile, Len(SrcFile) - 4) & "SIGN" & Right$(SrcFile, 4)
                         dest(2) = Left$(SrcFile, Len(SrcFile) - 4) & "ENC" & Right$(SrcFile, 4)
                         ' ********* sign file **********
                         On Error GoTo msgerr
                        datestr = Format$(Now, "Short Date")
                        ImportKey PrivateKeyFile
                        KeyID = ""
                        'If optSha1.value Then
                                Sha1SignFile MarketID, UserID, datestr, SrcFile, dest(1), UseKey, N
                        'ElseIf optMD5.value Then
                        '        MD5SignFile "", UserID, lblDateCreate.Caption, txtSource.Text, txtDest.Text, UseKey, N
                        'End If
                         Dim x As XML
                         Set x = New XML
                         x.ReplaceDOCTYPE dest(1), dtdBuyerTSSign, "Document"
                         Set x = Nothing
                         '******** Encrypt File ********
                         If fso.FileExists(dest(1)) Then
                                Set txt = fso.OpenTextFile(dest(1), ForReading)
                                Set txt2 = fso.CreateTextFile(dest(2), True)
                                
                                KeyID = ""
                                SearchPublicKey MarketID
                                txt2.Write enc(txt.ReadAll, UseKey, N)
                                Message "Encrypt File Complete"
                                txt.Close
                                txt2.Close
                                
                                Dim key As String
                                key = frmRecvFiles.AddRootTree_S("", SrcFile, mdiMain.imgType)
                                frmRecvFiles.AddChildTree key, "", dest(1), mdiMain.imgType
                                frmRecvFiles.AddChildTree key, "", dest(2), mdiMain.imgType
                                SendTSXMLAll = dest(2)
                                Flag = True
                        End If
                        Set fso = Nothing
        End If
Exit Function
msgerr:
        Message Error$
        SendTSXMLAll = ""
        Flag = False
End Function

