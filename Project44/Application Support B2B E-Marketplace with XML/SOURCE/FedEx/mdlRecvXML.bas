Attribute VB_Name = "mdlRecvXML"
Option Explicit
Option Base 1

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)


Public Function RecvXMLAll(ByVal SrcFile As String) As Boolean
        
        If PrivateKeyFile = "" Then
              MsgBox "Please Select Private Key File in Setting Key Ring Beffore Send XML file", vbExclamation + vbOKOnly
              RecvXMLAll = False
        'ElseIf UserID = "" Then
         '               MsgBox "Please Set UserID in KeyRing Before Send XML file", vbExclamation + vbOKOnly
        Else
                        RecvXMLAll = False
                        Dim dest(2) As String
                        Dim datestr As String
                        Dim fso As FileSystemObject
                        Dim txt As TextStream
                        Dim txt2 As TextStream
                        Set fso = New FileSystemObject
                        
                         'dest(1) = App.Path & "\temp1.tmp"
                         'dest(2) = App.Path & "\temp2.tmp"
                         dest(1) = Left$(SrcFile, Len(SrcFile) - 4) & "DEC" & Right$(SrcFile, 4)
                         dest(2) = Left$(SrcFile, Len(SrcFile) - 4) & "Valid" & Right$(SrcFile, 4)
                         ' ********* Decrypt  File **********
                        If fso.FileExists(SrcFile) Then
                                On Error GoTo msgerr
                                Set txt = fso.OpenTextFile(SrcFile, ForReading)
                                Set txt2 = fso.CreateTextFile(dest(1), True)
                               If PrivateKeyFile = "" Then
                                        RecvXMLAll = False
                                        Message "Please Setting Private Key File in Manage Key Ring Before Encrypt"
                                Else
                                        ImportKey PrivateKeyFile
                                        KeyID = ""
                                        txt2.Write dec(txt.ReadAll, UseKey, n)
                                        Message "Decrypt File Complete"
                                        RecvXMLAll = True
                                End If
                                txt.Close
                                txt2.Close
                        End If
                        
                        Sleep 3000
                        
                        '********** Valid File *************
                        If fso.FileExists(dest(1)) Then
                                'SearchPublicKey UserID
                                ValidateFile dest(1), dest(2)
                                RecvXMLAll = True
                        Else
                                RecvXMLAll = False
                                Message "Source File does not Exist"
                        End If
                        
                        Set fso = Nothing
                        
                        mdiMain.decFile = dest(1)
                        mdiMain.valFile = dest(2)
        End If
Exit Function
msgerr:
        RecvXMLAll = False
        Message Error$
End Function

Public Function DecryptFileOnly(ByVal SrcFile As String) As Boolean
        If PrivateKeyFile = "" Then
                        MsgBox "Please Select Private Key File in Setting Key Ring Beffore Send XML file", vbExclamation + vbOKOnly
        Else
                        DecryptFileOnly = False
                        Dim dest As String
                        Dim datestr As String
                        Dim fso As FileSystemObject
                        Dim txt As TextStream
                        Dim txt2 As TextStream
                        Set fso = New FileSystemObject
                        
                         dest = Left$(SrcFile, Len(SrcFile) - 4) & "DEC" & Right$(SrcFile, 4)
                         ' ********* Decrypt  File **********
                        If fso.FileExists(SrcFile) Then
                                On Error GoTo msgerr
                                Set txt = fso.OpenTextFile(SrcFile, ForReading)
                                Set txt2 = fso.CreateTextFile(dest, True)
                               If PrivateKeyFile = "" Then
                                        MsgBox "Please Setting Private Key File in Manage Key Ring Before Encrypt"
                                        DecryptFileOnly = False
                                Else
                                        ImportKey PrivateKeyFile
                                        KeyID = ""
                                        txt2.Write dec(txt.ReadAll, UseKey, n)
                                        
                                        Message "Decrypt File Complete"
                                        DecryptFileOnly = True
                                
                                End If
                                txt.Close
                                txt2.Close
                                             
                                If DecryptFileOnly Then
                                        Dim x As XML
                                        Set x = New XML
                                        x.ReplaceDOCTYPE dest, dtdBuyerTS, "TransactionPayment"
                                        Set x = Nothing
                                End If
                                             
                                mdiMain.decFile = dest
                        End If
        End If
Exit Function
msgerr:
        Message Error$
        DecryptFileOnly = False
End Function



