VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "XML"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim objRootName As String
Dim subRootName As String
Dim RootNamespace As String
Dim Status As String
Public objXmlErr As IXMLDOMParseError

Private Sub Class_Initialize()
    objRootName = "Table"
    subRootName = "Row"
    RootNamespace = ""
    Status = ""
End Sub

Public Property Let SetStatus(ByVal StatusValue As String)
    Status = StatusValue
End Property

Public Property Get GetStatus() As String
    GetStatus = Status
End Property

Public Property Let SetRootName(ByVal Name As String)
    objRootName = Name
End Property

Public Property Get GetRootName() As String
    GetRootName = objRootName
End Property

Public Property Let SetRootNamespace(ByVal Namespace As String)
    RootNamespace = Namespace
End Property

Public Property Get GetRootNamespace() As String
    GetRootNamespace = RootNamespace
End Property

Public Property Let SetSubRootName(ByVal Name As String)
    subRootName = Name
End Property

Public Property Get GetSubRootName() As String
    GetSubRootName = subRootName
End Property

'check if xmlPath has valid or not
'return false if xmlPath hasn't error
'return true if xmlPath has error occured
Public Function chkErrXML(ByVal xmlPath As String) As Boolean
    Dim xmldoc As DOMDocument30
    Set xmldoc = New DOMDocument30
    chkErrXML = True
    xmldoc.async = False
    xmldoc.Load xmlPath
    
    If xmldoc.parseError.errorCode <> 0 Then
        Set objXmlErr = xmldoc.parseError
        chkErrXML = True
    Else
        chkErrXML = False
    End If

End Function

Private Function InsertDOCTYPE(ByVal xmlPath As String, ByVal dtdURI As String, ByVal objRootName As String) As Boolean
    Dim fso As FileSystemObject
    Dim txtStreamRead As TextStream
    Dim txtStreamWrite As TextStream
    Dim tmp As String
    On Error GoTo err:
    Set fso = New FileSystemObject
    If fso.FileExists(xmlPath) Then
        tmp = Left$(xmlPath, Len(xmlPath) - 3)
        tmp = tmp + "tmp"
        fso.MoveFile xmlPath, tmp
        
        Set txtStreamWrite = fso.CreateTextFile(xmlPath, True)
        Set txtStreamRead = fso.GetFile(tmp).OpenAsTextStream(ForReading)
        'copy data
        txtStreamWrite.WriteLine txtStreamRead.ReadLine
        txtStreamWrite.WriteLine "<!DOCTYPE " & objRootName & " SYSTEM """ & dtdURI & """>"
        txtStreamWrite.Write txtStreamRead.ReadAll
        txtStreamWrite.Close
        txtStreamRead.Close
        fso.DeleteFile tmp
        InsertDOCTYPE = True
    Else
        InsertDOCTYPE = False
    End If
    Set fso = Nothing
    Exit Function
err:
    InsertDOCTYPE = False
End Function

Private Sub CreateDTD(ByVal rcs As ADODB.Recordset, ByVal objRootName As String, _
                      ByVal dtdPath As String, ByVal subRootName As String, ByVal RootNamespace As String)
    Dim fso As FileSystemObject
    Dim txt As TextStream
    Set fso = New FileSystemObject
    Set txt = fso.CreateTextFile(dtdPath, True)
    
    rcs.MoveFirst
    
    txt.WriteLine "<!ELEMENT " & objRootName & " (" & subRootName & "*)>"
    txt.WriteLine "<!ATTLIST " & objRootName & "  Status" & " CDATA """">"
             
    'define namespace for root element
    If RootNamespace <> "" Then
        txt.WriteLine "<!ATTLIST " & objRootName & " xmlns:" & " CDATA #FIXED """ & RootNamespace & """>"
        txt.WriteLine "<!ATTLIST " & subRootName & " xmlns:" & " CDATA #FIXED """">"
    End If
    
    txt.Write "<!ELEMENT " & subRootName & " ("
    Dim i As Integer
    For i = 0 To rcs.Fields.count - 1
        txt.Write rcs.Fields.Item(i).Name
        If i = rcs.Fields.count - 1 Then
            txt.Write ")>"
            txt.WriteLine
        Else
            txt.Write ", "
        End If
    Next
    
    For i = 0 To rcs.Fields.count - 1
        txt.WriteLine "<!ELEMENT " & rcs.Fields.Item(i).Name & " (#PCDATA)>"
        txt.WriteLine "<!ATTLIST " & rcs.Fields.Item(i).Name & " xmlns:" & " CDATA #FIXED """">"
    Next
    
    txt.Close
    Set fso = Nothing
End Sub

Public Sub Recordset2XMLwithoutDTD(ByVal rcs As ADODB.Recordset, ByVal xmlPath As String, ByVal dtdURI As String)
    Dim objXmldoc As DOMDocument30
    Dim objNewNode As IXMLDOMNode
    Dim objRoot As IXMLDOMNode
    Dim objParent As IXMLDOMNode
    Dim objStatus As IXMLDOMAttribute
    
    Set objXmldoc = New DOMDocument30
    Set objRoot = objXmldoc.createNode(1, objRootName, RootNamespace)
    Dim prInst As IXMLDOMProcessingInstruction
    Set prInst = objXmldoc.createProcessingInstruction("xml", "version=""1.0""")
    objXmldoc.appendChild prInst

    If Not (rcs.BOF) Then
        rcs.MoveFirst
    End If
    Dim i As Integer
    Do Until rcs.EOF
        Set objParent = objXmldoc.createElement(subRootName)
       For i = 0 To rcs.Fields.count - 1
            Set objNewNode = objXmldoc.createElement(rcs.Fields.Item(i).Name)
            If rcs.Fields.Item(i).value <> "" Then
                objNewNode.Text = rcs.Fields.Item(i).value
            End If
            objParent.appendChild objXmldoc.createTextNode(vbCrLf & vbTab & vbTab) 'newline
            objParent.appendChild objNewNode

        Next
        objParent.appendChild objXmldoc.createTextNode(vbCrLf & vbTab) 'newline

        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vbTab) 'newline
        objRoot.appendChild objParent
        rcs.MoveNext
    Loop
    Set objStatus = objXmldoc.createAttribute("Status") 'add status
    objStatus.value = Status
    objRoot.Attributes.setNamedItem objStatus
    
    objRoot.appendChild objXmldoc.createTextNode(vbCrLf)    'newline
    objXmldoc.appendChild objRoot   'add all node to document

    objXmldoc.Save App.Path & "\xmltmp.tmp"
    objXmldoc.validateOnParse = False
    objXmldoc.Load App.Path & "\xmltmp.tmp"
    objXmldoc.Save xmlPath
    On Error Resume Next
    Kill App.Path & "\xmltmp.tmp"
   
    If dtdURI <> "" Then
        InsertDOCTYPE xmlPath, dtdURI, objRootName
    End If
End Sub

Public Sub Recordset2XMLwithDTD(ByVal rcs As ADODB.Recordset, ByVal xmlPath As String, ByVal dtdURI As String, ByVal dtdPath As String)
    Dim objXmldoc As DOMDocument30
    Dim objNewNode As IXMLDOMNode
    Dim objRoot As IXMLDOMNode
    Dim objParent As IXMLDOMNode
    Dim objStatus As IXMLDOMAttribute
    
    'create file dtd for rcs
    CreateDTD rcs, objRootName, dtdPath, subRootName, RootNamespace
    
    Set objXmldoc = New DOMDocument30
    Set objRoot = objXmldoc.createNode(1, objRootName, RootNamespace)
    Dim prInst As IXMLDOMProcessingInstruction
    Set prInst = objXmldoc.createProcessingInstruction("xml", "version=""1.0""")
    objXmldoc.appendChild prInst

    rcs.MoveFirst
    Dim i As Integer
    Do Until rcs.EOF
        Set objParent = objXmldoc.createElement(subRootName)
        For i = 0 To rcs.Fields.count - 1
            Set objNewNode = objXmldoc.createElement(rcs.Fields.Item(i).Name)
            If rcs.Fields.Item(i).value <> "" Then
                objNewNode.Text = rcs.Fields.Item(i).value
            End If
            objParent.appendChild objXmldoc.createTextNode(vbCrLf & vbTab & vbTab) 'newline
            objParent.appendChild objNewNode

        Next
        objParent.appendChild objXmldoc.createTextNode(vbCrLf & vbTab) 'newline

        objRoot.appendChild objXmldoc.createTextNode(vbCrLf & vbTab) 'newline
        objRoot.appendChild objParent
        rcs.MoveNext
    Loop
    Set objStatus = objXmldoc.createAttribute("Status") 'add status
    objStatus.value = Status
    objRoot.Attributes.setNamedItem objStatus
    
    objRoot.appendChild objXmldoc.createTextNode(vbCrLf)    'newline
    objXmldoc.appendChild objRoot   'add all node to document
    
    'objXmldoc.Save xmlPath
    objXmldoc.Save App.Path & "\xmltmp.tmp"
    objXmldoc.validateOnParse = False
    objXmldoc.Load App.Path & "\xmltmp.tmp"
    objXmldoc.Save xmlPath
    On Error Resume Next
    Kill App.Path & "\xmltmp.tmp"
    
    If dtdURI <> "" Then
        InsertDOCTYPE xmlPath, dtdURI, objRootName
    End If
End Sub

Public Sub ADOsave2XML(ByVal conString As String, ByVal sql As String, ByVal xmlPath As String)
    Dim conn As ADODB.Connection
    Set conn = New ADODB.Connection
    conn.ConnectionString = conString
    conn.Open
    Dim rcs As ADODB.Recordset
    Set rcs = New ADODB.Recordset
    rcs.Open conn, sql, 1, 1
    
    rcs.Save xmlPath, adPersistXML
    rcs.Close
    conn.Close
End Sub

Public Sub parseXML2DB(ByVal conString As String, ByVal tblName As String, ByVal xmlPath As String)
    Dim conn As ADODB.Connection
    Set conn = New ADODB.Connection
    conn.ConnectionString = conString
    conn.Open
    Dim rcs As ADODB.Recordset
    Set rcs = New ADODB.Recordset
    Dim cmd As ADODB.Command
    
    rcs.Open tblName, conn, 1, 2
    
    Dim objXmldoc As DOMDocument30
    Dim objNodeList As IXMLDOMNodeList
    Dim objNode As IXMLDOMNode
    Dim objNameNodeMap As IXMLDOMNamedNodeMap
    Dim objNodeListAll As IXMLDOMNodeList
    Set objXmldoc = New DOMDocument30
      
    objXmldoc.async = False
    objXmldoc.validateOnParse = False
    objXmldoc.Load xmlPath
    If objXmldoc.parseError.errorCode <> 0 Then
        Set objXmlErr = objXmldoc.parseError
    Else
        On Error Resume Next
        Set objNameNodeMap = objXmldoc.documentElement.Attributes
        Set objNode = objNameNodeMap.getNamedItem("Status")
        Status = objNode.Text
        objRootName = objXmldoc.documentElement.nodeName
        subRootName = objXmldoc.documentElement.firstChild.nodeName
        
        Set objNodeListAll = objXmldoc.documentElement.childNodes
    
        Dim J As Integer
        Dim i As Integer
        For J = 0 To objNodeListAll.Length - 1
            Set objNodeList = objNodeListAll.Item(J).childNodes
            'assume pamarykey not same
            rcs.AddNew
            For i = 0 To objNodeList.Length - 1
                If objNodeList.Item(i).Text <> "" Then
                    Select Case rcs(objNodeList.Item(i).nodeName).Type
                        Case adNumeric
                            rcs(objNodeList.Item(i).nodeName) = Val(objNodeList.Item(i).Text)
                        Case adInteger, adUnsignedInt
                            rcs(objNodeList.Item(i).nodeName) = CInt(objNodeList.Item(i).Text)
                        Case adSingle
                            rcs(objNodeList.Item(i).nodeName) = CSng(objNodeList.Item(i).Text)
                        Case adDouble
                            rcs(objNodeList.Item(i).nodeName) = CDbl(objNodeList.Item(i).Text)
                        Case adDBDate, adDate, adDBTime
                            rcs(objNodeList.Item(i).nodeName) = CDate(objNodeList.Item(i).Text)
                        Case adBoolean
                            rcs(objNodeList.Item(i).nodeName) = CBool(objNodeList.Item(i).Text)
                        Case adCurrency
                            rcs(objNodeList.Item(i).nodeName) = CCur(objNodeList.Item(i).Text)
                        Case Else
                            rcs(objNodeList.Item(i).nodeName) = objNodeList.Item(i).Text
                        End Select
                End If
            Next
            rcs.Update
            If err.Number <> 0 Then
                'Dim errstr As String
                'errstr = ""
                'For i = 0 To objNodeList.Length - 1
                '    If objNodeList.Item(i).Text <> "" Then
                '        errstr = errstr + " " + objNodeList.Item(i).Text
                '    End If
                'Next
                MsgBox err.Description & vbCrLf & "Some Row does not insert", vbExclamation + vbOKOnly, "Warning!!!"
                'MsgBox "Error in insert row """ & Trim$(errstr) & """", vbInformation + vbOKOnly, "Problem"
                err.Number = 0
            End If
        Next
    
        Set objNodeList = Nothing
        Set objNodeListAll = Nothing
    End If
    rcs.Close
    conn.Close
End Sub

Public Sub getParameter(ByVal xmlPath As String)
    Dim objXmldoc As DOMDocument30
    Dim objNode As IXMLDOMNode
    Dim objNameNodeMap As IXMLDOMNamedNodeMap
    Set objXmldoc = New DOMDocument30
    On Error Resume Next
    objXmldoc.async = False
    objXmldoc.validateOnParse = False
    objXmldoc.Load xmlPath
    If objXmldoc.parseError.errorCode <> 0 Then
        Set objXmlErr = objXmldoc.parseError
    Else
        Set objNameNodeMap = objXmldoc.documentElement.Attributes
        Set objNode = objNameNodeMap.getNamedItem("Status")
        Status = objNode.Text
        objRootName = objXmldoc.documentElement.nodeName
        subRootName = objXmldoc.documentElement.firstChild.nodeName
        
    End If
End Sub


Public Sub saveXML2DBwithADODB(ByRef con As ADODB.Connection, ByVal tblName As String, ByVal xmlPath As String)
    Dim rsXml As New ADODB.Recordset
    rsXml.Open xmlPath, , , , adCmdFile

    Dim rcsDB As ADODB.Recordset
    Set rcsDB = New ADODB.Recordset
    rcsDB.Open tblName, con, 1, 2

    If rsXml.RecordCount <> 0 Then
        On Error Resume Next
        Dim i As Integer
        rsXml.MoveFirst
        Do Until rsXml.EOF
            rcsDB.AddNew
            For i = 0 To rsXml.Fields.count - 1
                rcsDB(rsXml.Fields.Item(i).Name) = rsXml.Fields.Item(i).value
            Next
            rcsDB.Update
            'display error if occur
            If err.Number <> 0 Then
                Dim errstr As String
                errstr = ""
                For i = 0 To rsXml.Fields.count - 1
                    If rsXml.Fields(i).value <> "" Then
                        errstr = errstr + " " + rsXml.Fields(i).value
                    End If
                Next
                MsgBox err.Description, vbExclamation + vbOKOnly, "Warning!!!"
                MsgBox "Error in insert row """ & Trim$(errstr) & """", vbInformation + vbOKOnly, "Problem"
                err.Number = 0
            End If
            rsXml.MoveNext
        Loop
    End If
End Sub

Private Sub Class_Terminate()
    Set objXmlErr = Nothing
End Sub

Public Function query(ByVal tagName As String, ByVal xmlPath) As String
    Dim objXmldoc As DOMDocument30
    Dim objNode As IXMLDOMNode
    Dim objNameNodeMap As IXMLDOMNamedNodeMap
    Set objXmldoc = New DOMDocument30
    
    objXmldoc.async = False
    objXmldoc.validateOnParse = False
    objXmldoc.Load xmlPath
    If objXmldoc.parseError.errorCode <> 0 Then
        Set objXmlErr = objXmldoc.parseError
    Else
        query = objXmldoc.documentElement.getElementsByTagName(tagName).Item(0).Text
    End If
    Set objXmldoc = Nothing
End Function

Public Function ReplaceDOCTYPE(ByVal xmlPath As String, ByVal dtdURI As String, ByVal objRootName As String) As Boolean
    Dim fso As FileSystemObject
    Dim txtStreamRead As TextStream
    Dim txtStreamWrite As TextStream
    Dim tmp As String
    On Error GoTo err:
    Set fso = New FileSystemObject
    If fso.FileExists(xmlPath) Then
        tmp = Left$(xmlPath, Len(xmlPath) - 3)
        tmp = tmp + "tmp"
        fso.MoveFile xmlPath, tmp
        
        Set txtStreamWrite = fso.CreateTextFile(xmlPath, True)
        Set txtStreamRead = fso.GetFile(tmp).OpenAsTextStream(ForReading)
        'copy data
        txtStreamWrite.WriteLine txtStreamRead.ReadLine
        txtStreamRead.ReadLine
        txtStreamWrite.WriteLine "<!DOCTYPE " & objRootName & " SYSTEM """ & dtdURI & """>"
        txtStreamWrite.Write txtStreamRead.ReadAll
        txtStreamWrite.Close
        txtStreamRead.Close
        fso.DeleteFile tmp
        ReplaceDOCTYPE = True
    Else
        ReplaceDOCTYPE = False
    End If
    Set fso = Nothing
    Exit Function
err:
    ReplaceDOCTYPE = False
End Function
