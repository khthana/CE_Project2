Attribute VB_Name = "mdlXML"
Option Explicit

Public Function GenPRno(ByVal xmlPath As String, ByVal dest As String) As Boolean
    Dim objxml As XML
    Dim sql As String
    Dim prid As String
    Dim prno As Long
    Set objxml = New XML
    objxml.getParameter xmlPath
    If objxml.GetStatus = SOpen Then
        Dim conn As ADODB.Connection
        Set conn = New ADODB.Connection
        conn.ConnectionString = DBconString
        conn.Open
        Dim rcs As ADODB.Recordset
        Set rcs = New ADODB.Recordset
        
        Dim objXmldoc As DOMDocument30
        Dim objNodeList As IXMLDOMNodeList
        Dim objNode As IXMLDOMNode
        Dim objNameNodeMap As IXMLDOMNamedNodeMap
        Dim objNodeListAll As IXMLDOMNodeList
        Set objXmldoc = New DOMDocument30
      
        objXmldoc.async = False
        objXmldoc.validateOnParse = False
        objXmldoc.Load xmlPath
                
        Dim rcsmax As ADODB.Recordset
        Set rcsmax = New ADODB.Recordset
        rcsmax.Open "select max(IDNo) as maxIDNo from PROpen", conn
        If IsNull(rcsmax("maxIDNo")) Then
            prno = 1
        Else
            prno = rcsmax("maxIDNo")
            prno = prno + 1
        End If
        rcsmax.Close
        Set rcsmax = Nothing
        
        prid = objXmldoc.documentElement.getElementsByTagName("PRID").Item(0).Text
        rcs.Open "select prid from PROpen where prid = '" & prid & "'", conn, 1, 3
        Dim x As Integer
        If Not (IsNull(rcs("prid"))) Then
            If Not (rcs.BOF) Then
                rcs.MoveFirst
            End If
            Do While rcs.RecordCount > 0
                rcs.Delete adAffectCurrent
                rcs.MoveNext
            Loop
        End If
        rcs.Close
        
        rcs.Open "PROpen", conn, 1, 2
        
        If objXmldoc.parseError.errorCode <> 0 Then
            Message "Xml Error"
        Else
            'On Error Resume Next
            
            Set objNodeListAll = objXmldoc.documentElement.childNodes
            Dim J As Integer
            Dim i As Integer
            For J = 0 To objNodeListAll.Length - 1
                Set objNodeList = objNodeListAll.Item(J).childNodes
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
                rcs("prno") = "BY" & prno
                rcs("PRStatus") = SConfirm
                rcs.Update
            Next
    
            Set objNodeList = Nothing
            Set objNodeListAll = Nothing
        End If
        rcs.Close
        
        If dest = "" Then
            dest = App.Path & "\PR\Confirm\PR" & prid & "_Confirm.xml"
        End If
        
        sql = "select distinct PRID,PRNO from PROpen where prid = '" & prid & "'"
        rcs.Open sql, conn
        objxml.SetStatus = SConfirm
        objxml.SetRootName = "PR"
        objxml.SetSubRootName = "SELLER"
        
        objxml.Recordset2XMLwithoutDTD rcs, dest, dtdPRNo
        
        FileName = dest
        
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
        GenPRno = True
    Else
        GenPRno = False
    End If
    Set objxml = Nothing
End Function

Public Function ChkStatus(ByVal xmlPath As String) As Boolean
    Dim objxml As XML
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    Dim xno As String
    Dim currentStatus As String
    Set objxml = New XML
    Set conn = New ADODB.Connection
    Set rcs = New ADODB.Recordset
    conn.ConnectionString = DBconString
    conn.Open
    objxml.getParameter xmlPath
    '------------------ PR ------------------
    If objxml.GetRootName = "PR" Then
        Select Case objxml.GetStatus
            Case SOpen
                xno = objxml.query("PRID", xmlPath)
                rcs.Open "select PRStatus from PROpen where prid = """ & xno & """", conn, 1, 3
                If rcs.RecordCount = 0 Then
                    'new PR
                    If GenPRno(xmlPath, "") Then
                        Message "Gen P.R. No. Complete"
                        
                        'send file back to market
                        mdiMain.WSSend 1
                    
                    Else
                        Message "Gen P.R. Error!!!"
                    End If
                Else
                    Message "Error!! this P.R. ID Has already exist"
                End If
                rcs.Close
            Case SConfirm
                xno = objxml.query("PRID", xmlPath)
                rcs.Open "select PRStatus from PROpen where prid = """ & xno & """", conn, 1, 3
                currentStatus = rcs!PRStatus
                If LCase$(currentStatus) = LCase$(SConfirm) Then
                    If genPO(xno, "") Then
                        Message "Accept PR & Gen PO Complete"
                    Else
                        Message "Accept PR & Gen PO Error"
                    End If
                Else
                     Message "Current PR Status is " & currentStatus & _
                            " but xml status is " & objxml.GetStatus
                End If
            Case Else
                Message "Current PR Status is " & currentStatus & _
                       " but xml status is " & objxml.GetStatus
       End Select
    '------------------------- PO -----------------------
'    ElseIf objxml.GetRootName = "PO" Then
'            Select Case objxml.GetStatus
'            Case SSent
'                xno = objxml.query("PONO", xmlPath)
'                rcs.Open "select POStatus from PO where pono = """ & xno & """", conn, 1, 3
'                currentStatus = rcs!POStatus
'                If rcs.RecordCount = 0 Then
'                    'new po
'                    If ReceivePO(xmlPath) Then
'                        Message "Recieve PO Complete"
'                    Else
'                        Message "Recieve PO Error"
'                    End If
'                Else
'                    Message "Error!! this P.O. No. Has already exist"
'                End If
'                rcs.Close
'            Case Else
'       End Select
    Else
        Message "XML Type : " & objxml.GetRootName & vbCrLf & _
               "XML Status : " & objxml.GetStatus
    End If
    conn.Close
    Set rcs = Nothing
    Set conn = Nothing
    Set objxml = Nothing
End Function


Public Function genRejectPR(ByVal prid As String, ByVal reason As String, ByVal dest As String) As Boolean
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    Dim sql As String
    Dim objxml As XML
    On Error GoTo msgerr:
    Set conn = New ADODB.Connection
    Set rcs = New ADODB.Recordset
    
    conn.ConnectionString = DBconString
    conn.Open
    
    rcs.Open "select prid from PRReject where prid = '" & prid & "'", conn, 1, 3
    If rcs.RecordCount <= 0 Then
        sql = "insert into PRReject (prid,Comment,UpdateDate) " & _
              "values ('" & prid & "',""" & reason & """,""" & _
              Str(Now) & """)"
    Else
        sql = "update PRReject set Comment = """ & reason & """, " & _
              "UpdateDate=""" & Str(Now) & """ " & _
              "where prid = '" & prid & "'"
    End If
    rcs.Close
    conn.Execute sql
    
    sql = "update PROpen set PRstatus = """ & SReject & """ where prid = '" & prid & "'"
    conn.Execute sql
    
    
    rcs.Open "select PRID,Comment from PRReject where prid = '" & prid & "'", conn
    Set objxml = New XML
    If dest = "" Then
        dest = App.Path & PRdir & "\Reject\PR" & prid & "_Reject.xml"
    End If
    objxml.SetStatus = SReject
    objxml.SetRootName = "PR"
    objxml.SetSubRootName = "SELLER"
    objxml.Recordset2XMLwithoutDTD rcs, dest, dtdPRReject
    rcs.Close
    conn.Close
    Set rcs = Nothing
    Set conn = Nothing
    Set objxml = Nothing
    genRejectPR = True
Exit Function
msgerr:
        Message Error$
        genRejectPR = False
End Function

Public Function genPO(ByVal prid As String, ByVal dest As String) As Boolean
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    Dim sql As String
    Dim pono As String
    Dim objxml As XML
    Dim rcsCount As Long
    Dim i As Integer
    Set conn = New ADODB.Connection
    Set rcs = New ADODB.Recordset
    On Error GoTo msgerr:
    conn.ConnectionString = DBconString
    
    conn.Open
    
    rcs.Open "select PRID from PO where PRID = """ & prid & """", conn, 1, 3
    rcsCount = rcs.RecordCount
    rcs.Close
    If rcsCount = 0 Then
    
        'sql = "update PROpen set PRStatus = """ & SAccept & """ where prid = '" & prid & "'"
        'conn.Execute sql
        rcs.Open "select PRStatus from PROPen where prid = """ & prid & """", conn, 1, 3
        
        If rcs.RecordCount > 0 Then
            rcs!PRStatus = SAccept
            rcs.Update
        Else
            Message "Not Have this PRID in database"
            genPO = False
            rcs.Close
            Exit Function
        End If
        rcs.Close
        
        rcs.Open "select max(IDNo)  as maxid from PO", conn, 1, 3
            pono = "BYPO" & rcs("maxid")
        rcs.Close
        
        
        rcs.Open "select * from PO where prid = '" & prid & "'", conn, 1, 3
        If rcs.RecordCount > 0 Then
            For i = 0 To rcs.RecordCount - 1
                rcs.Fields("PRID") = prid
                rcs.MoveNext
            Next
        Else
                 ' sql = "insert into PO (PONO,prid,status,POdate) " & _
                 ' "values ('" & prid & "',""" & SSent & """," & _
                 '         """" & Str(Now) & """)"
                rcs.AddNew
                    rcs!pono = pono
                    rcs!prid = prid
                    rcs!Status = SSent
                    rcs!PODate = Now
                rcs.Update
        End If
        rcs.Close
        
        
        sql = "select " & _
              "PONO, PROpen.PRID, SellerID, BizName, PODate, " & _
              "PRTerm as POTerm, PRAddress as POAddress, PRShipPrice as POShipPrice, " & _
              "PRItemPrice as POItemPrice, Line, OrderName, OrderSellerItemID, OrderUnit, OrderQTY, " & _
              "OrderItemPrice, OrderShipPrice, needDate " & _
              "From PROpen,PO " & _
              "where PROPen.PRID = PO.PRID and PROpen.PRID='" & prid & "'"
        rcs.Open sql, conn, 1, 3
        Set objxml = New XML
        objxml.SetRootName = "PO"
        objxml.SetStatus = SSent
        objxml.SetSubRootName = "SELLER"
        If dest = "" Then
            dest = App.Path & POdir & "\Sent\PO" & pono & "_Sent.xml"
        End If
        objxml.Recordset2XMLwithoutDTD rcs, dest, dtdPOSent
        rcs.Close
        genPO = True
    Else
        genPO = False
        Message "This PO has already exist"
    End If
    conn.Close
    Set rcs = Nothing
    Set conn = Nothing
    Set objxml = Nothing
Exit Function
msgerr:
    Message Error$
    genPO = False
End Function

Public Function RecvPO_GenOrderNo(ByVal xmlPath As String, ByVal dest As String) As Boolean
        Dim objxml As XML
        Dim sql As String
        Dim poid As Long
        Dim OrderNo As Long
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim rcsmax As ADODB.Recordset
                
        Dim objXmldoc As DOMDocument30
        Dim objNodeList As IXMLDOMNodeList
        Dim objNode As IXMLDOMNode
        Dim objNameNodeMap As IXMLDOMNamedNodeMap
        Dim objNodeListAll As IXMLDOMNodeList
        
        Dim J As Integer
        Dim i As Integer
                        
        Set objxml = New XML
        objxml.getParameter xmlPath
        If (objxml.GetStatus = SSent) And (objxml.GetRootName = "PO") Then
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                Set rcsmax = New ADODB.Recordset
                Set objXmldoc = New DOMDocument30
                
                conn.ConnectionString = DBconString
                conn.Open
                
                objXmldoc.async = False
                objXmldoc.validateOnParse = False
                objXmldoc.Load xmlPath
                
                rcsmax.Open "select max(IDNo) as maxIDNo from PO", conn, 1, 3
                If IsNull(rcsmax("maxIDNo")) Then
                        OrderNo = 1
                Else
                        OrderNo = rcsmax("maxIDNo")
                        OrderNo = OrderNo + 1
                End If
                
                rcsmax.Close
                Set rcsmax = Nothing
        
                poid = objXmldoc.documentElement.getElementsByTagName("POID").Item(0).Text
                
                rcs.Open "select poid from PO where poid = '" & poid & "'", conn, 1, 3
                If Not (IsNull(rcs("poid"))) Then
                        If Not (rcs.BOF) Then
                                rcs.MoveFirst
                        End If
                        Do While rcs.RecordCount > 0
                                rcs.Delete adAffectCurrent
                                rcs.MoveNext
                        Loop
                End If
                rcs.Close
        
                rcs.Open "PO", conn, 1, 3
        
                If objXmldoc.parseError.errorCode <> 0 Then
                        Message "Xml Error"
                Else
                        'On Error Resume Next
                        On Error GoTo msgerr:
                        Set objNodeListAll = objXmldoc.documentElement.childNodes
                        For J = 0 To objNodeListAll.Length - 1
                                Set objNodeList = objNodeListAll.Item(J).childNodes
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
                                Next            'loop i
                                rcs("OrderNo") = "SL" & Trim$(Str$(OrderNo))
                                rcs("POUpdateDate") = Now
                                rcs("POStatus") = SReceive
                                rcs.Update
                        Next            'loop j
    
                        Set objNodeList = Nothing
                        Set objNodeListAll = Nothing
                End If
                rcs.Close
        
                If dest = "" Then
                        dest = App.Path & "\PO\Receive\PO" & poid & "_Receive.xml"
                End If
        
                sql = "select distinct OrderNo,POID from PO where poid = """ & poid & """"
                rcs.Open sql, conn
                objxml.SetStatus = SReceive
                objxml.SetRootName = "PO"
                objxml.SetSubRootName = "SELLER"
        
                objxml.Recordset2XMLwithoutDTD rcs, dest, dtdOrderNo
        
                FileName = dest
        
                rcs.Close
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
                RecvPO_GenOrderNo = True
        Else
                RecvPO_GenOrderNo = False
        End If
        Set objxml = Nothing
Exit Function
msgerr:
        RecvPO_GenOrderNo = False
End Function

Public Function GenAcceptPO(ByVal poid As String, ByVal dest As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim rcsUpdate As ADODB.Recordset
        Dim objxml As XML
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.Open
        rcs.Open "select distinct POID from PO where POID = """ & poid & """", conn, 1, 3
        If rcs.RecordCount > 0 Then
                Set objxml = New XML
                objxml.SetRootName = "PO"
                objxml.SetSubRootName = "SELLER"
                objxml.SetStatus = SAccept
                If dest = "" Then
                        dest = App.Path & POdir & "\Accept\PO" & poid & "_Accept.xml"
                End If
                objxml.Recordset2XMLwithoutDTD rcs, dest, dtdPOAccept
                
                '------------------ Update PO Table ------------------
                Set rcsUpdate = New ADODB.Recordset
                rcsUpdate.Open "select * from po where poid = """ & poid & """", conn, 1, 3
                If Not (rcsUpdate.BOF) Then rcsUpdate.MoveFirst
                Do While Not (rcsUpdate.EOF)
                        rcsUpdate!POStatus = SAccept
                        rcsUpdate!POUpdatedate = Now
                        rcsUpdate.Update
                        rcsUpdate.MoveNext
                Loop
                rcsUpdate.Close
                '---------------------------------------------------------------
                FileName = dest
                
                Set rcsUpdate = Nothing
                Set objxml = Nothing
                GenAcceptPO = True
        Else
                Message "Did Not have this POID in database"
                GenAcceptPO = False
        End If
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
End Function

Public Function GenRejectPO(ByVal poid As String, ByVal Comment As String, ByVal dest As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim sql As String
        Dim objxml As XML
        Dim rcsCount As Long
        Dim i As Long
    
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
    
        conn.ConnectionString = DBconString
        conn.Open
    
        rcs.Open "select * from PO where poid = """ & poid & """", conn, 1, 3
        rcsCount = rcs.RecordCount
        If rcs.RecordCount <= 0 Then
                GenRejectPO = False
                 Message "Error !!! Did Not have this POID in database"
        Else
                If Not (rcs.BOF) Then
                        rcs.MoveFirst
                End If
                For i = 0 To rcs.RecordCount - 1
                        rcs!POStatus = SReject
                        rcs!POUpdatedate = Now
                        rcs.Update
                        rcs.MoveNext
                Next
        End If
        rcs.Close
    
         If rcsCount > 0 Then
                rcs.Open "select * from POReject where poid = """ & poid & """", conn, 1, 3
                If rcs.RecordCount > 0 Then
                        If MsgBox("This POID was Rejected" & vbCrLf & "Do you want to Update and Regenerate this reject po again", _
                                         vbQuestion + vbYesNo + vbDefaultButton2, "Warnning !!!") = vbYes Then
                                rcs!Comment = Comment
                                rcs!POUpdatedate = Now
                                rcs.Update
                        Else
                                rcs.Close
                                conn.Close
                                GenRejectPO = False
                                Exit Function
                        End If
                Else
                        rcs.AddNew
                        rcs!poid = poid
                        rcs!Comment = Comment
                        rcs!POUpdatedate = Now
                        rcs.Update
                End If
                rcs.Close
                
                rcs.Open "select POID,Comment from POReject where poid = '" & poid & "'", conn
                Set objxml = New XML
                If dest = "" Then
                        dest = App.Path & POdir & "\Reject\PO" & poid & "_Reject.xml"
                End If
                objxml.SetStatus = SReject
                objxml.SetRootName = "PO"
                objxml.SetSubRootName = "SELLER"
                objxml.Recordset2XMLwithoutDTD rcs, dest, dtdPOReject
                GenRejectPO = True
                rcs.Close
        Else
                GenRejectPO = False
        End If
        
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
        Set objxml = Nothing
End Function

Public Function GenInvoice(ByVal IVno As String, ByVal dest As String) As Boolean
        Dim objxml As XML
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim sql As String
        
        Set objxml = New XML
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.Open
        sql = "select Invoice.InvoiceNo, POID, Line, NetAmount, VAT, TotalPrice, " & _
                  "DueDate " & _
                  "from Invoice,InvoiceDetail " & _
                  "where Invoice.InvoiceNo = InvoiceDetail.InvoiceNo and Invoice.InvoiceNo = """ & IVno & """"
        rcs.Open sql, conn, 1, 3
        If rcs.RecordCount > 0 Then
                If dest = "" Then
                        dest = App.Path & IVdir & "\Sent\IV" & IVno & "_Sent.xml"
                End If
                objxml.SetRootName = "Invoice"
                objxml.SetStatus = SSent
                objxml.SetSubRootName = "SELLER"
                objxml.Recordset2XMLwithoutDTD rcs, dest, dtdIVSent
                GenInvoice = True
                
                FileName = dest
        Else
                GenInvoice = False
        End If
        Set objxml = Nothing
        Set rcs = Nothing
        Set conn = Nothing
End Function

Public Function recvInvoice(ByVal xmlPath As String, ByVal dest As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim sql As String
        Dim pono As String
        Dim ivid As String
        Dim Line As String
        Dim objxml As XML
        Dim test As Boolean
        Dim i As Integer
        Dim xmldoc As DOMDocument30
        Dim nodeList As IXMLDOMNodeList
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        Set objxml = New XML
        objxml.getParameter xmlPath
        If (objxml.GetStatus = SSent) And (objxml.GetRootName = "Invoice") Then
                pono = objxml.query("PONO", xmlPath)
                ivid = objxml.query("InvoiceID", xmlPath)
                
                Set xmldoc = New DOMDocument30
                xmldoc.async = False
                xmldoc.validateOnParse = False
                xmldoc.Load xmlPath
                conn.ConnectionString = DBconString
                conn.Open
                test = True
                Set nodeList = xmldoc.documentElement.getElementsByTagName("Line")
                For i = 0 To nodeList.Length - 1
                        Line = nodeList(i).Text
                        rcs.Open "select count(*) as countline from InvoiceDetail " & _
                                           "where InvoiceID = '" & ivid & "' and pono = '" & pono & "' and line = " & Line, conn, 1, 3
                        If rcs!Countline > 0 Then
                                test = False
                        End If
                        rcs.Close
                Next
                
                If test Then
                        '--------------- Invoice Table ---------------
                        rcs.Open "Invoice", conn, 1, 3
                                rcs.AddNew
                                rcs!InvoiceID = ivid
                                rcs!pono = pono
                                rcs!NetAmount = objxml.query("NetAmount", xmlPath)
                                rcs!Vat = objxml.query("VAT", xmlPath)
                                rcs!TotalPrice = objxml.query("TotalPrice", xmlPath)
                                rcs!DueDate = objxml.query("DueDate", xmlPath)
                                rcs!Status = SReceive
                                rcs!Invoicedate = Now
                                rcs!updateDate = Now
                                rcs.Update
                        rcs.Close
                        
                        '-------------- InvoiceDetail Table -------------
                        rcs.Open "InvoiceDetail", conn, 1, 3
                        For i = 0 To nodeList.Length - 1
                                rcs.AddNew
                                rcs!InvoiceID = ivid
                                rcs!pono = pono
                                rcs!Line = nodeList(i).Text
                                rcs.Update
                        Next
                        rcs.Close
                        
                        rcs.Open "Select distinct InvoiceID from Invoice where InvoiceID = " & ivid, conn
                        objxml.SetRootName = "Invoice"
                        objxml.SetSubRootName = "SELLER"
                        objxml.SetStatus = SReceive
                        If dest = "" Then
                                dest = App.Path & IVdir & "\Receive\IVID" & ivid & "_Receive.xml"
                        End If
                        objxml.Recordset2XMLwithoutDTD rcs, dest, dtdIVRecv
                        conn.Close
                        Set rcs = Nothing
                        Set conn = Nothing
                        recvInvoice = True
                Else
                        Message "Some Line in this Invoice has Dupplicate"
                        recvInvoice = False
                End If
        Else
                recvInvoice = False
        End If
        Set objxml = Nothing
End Function

Public Function GenAcceptInvoice(ByVal InvoiceID As String, ByVal dest As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim sql As String
        Dim objxml As XML
        Dim rcsCount As Integer
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
    
        conn.ConnectionString = DBconString
        conn.Open
    
        rcs.Open "Select Status from Invoice where InvoiceID = " & InvoiceID, conn, 1, 3
                rcsCount = rcs.RecordCount
                If rcsCount > 0 Then
                        rcs!Status = SAccept
                        rcs.Update
                End If
        rcs.Close
        
        If rcsCount > 0 Then
                rcs.Open "select InvoiceID from Invoice where InvoiceID = " & InvoiceID, conn, 1, 3
                Set objxml = New XML
                If dest = "" Then
                        dest = App.Path & IVdir & "\Accept\IVID" & InvoiceID & "_Accept.xml"
                End If
                objxml.SetStatus = SAccept
                objxml.SetRootName = "Invoice"
                objxml.SetSubRootName = "SELLER"
                objxml.Recordset2XMLwithoutDTD rcs, dest, dtdIVAccept
                rcs.Close
                GenAcceptInvoice = True
        Else
                GenAcceptInvoice = False
                Message "Cannot find this InvoiceID in database"
        End If
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
        Set objxml = Nothing
End Function

Public Function GenRejectInvoice(ByVal InvoiceID As String, ByVal Comment As String, ByVal dest As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim sql As String
        Dim objxml As XML
        Dim rcsCount As Integer
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
    
        conn.ConnectionString = DBconString
        conn.Open
    
        rcs.Open "Select Status,InvoiceComment from Invoice where InvoiceID = " & InvoiceID, conn, 1, 3
                rcsCount = rcs.RecordCount
                If rcsCount > 0 Then
                        rcs!Status = SReject
                        rcs!InvoiceComment = Comment
                        rcs.Update
                End If
        rcs.Close
        
        If rcsCount > 0 Then
                rcs.Open "select InvoiceID, InvoiceComment from invoice where InvoiceID= " & InvoiceID, conn
                Set objxml = New XML
                If dest = "" Then
                        dest = App.Path & IVdir & "\Reject\IVID" & InvoiceID & "_Reject.xml"
                End If
                objxml.SetStatus = SReject
                objxml.SetRootName = "Invoice"
                objxml.SetSubRootName = "SELLER"
                objxml.Recordset2XMLwithoutDTD rcs, dest, dtdIVReject
                rcs.Close
                GenRejectInvoice = True
        Else
                GenRejectInvoice = False
                Message "Cannot find this InvoiceID in database"
        End If
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
        Set objxml = Nothing
End Function


Public Function Assign(ByVal xmlPath As String) As Boolean
        Dim objxml As XML
        Set objxml = New XML
        objxml.getParameter xmlPath
        
        '--------------------------- PR ---------------------------------------
        If (objxml.GetStatus = SOpen) And (objxml.GetRootName = "PR") Then
                If GenPRno(xmlPath, "") Then
                        Message "Generate  P.R. No. Complete"
                        Assign = True
                Else
                        Message "Generate P.R. No. Error !!!"
                        Assign = False
                End If
        '-------------------------- Invoice -----------------------------
        ElseIf (objxml.GetStatus = SReceive) And (objxml.GetRootName = "Invoice") Then
                If recvInvoice(xmlPath, "") Then
                        Message "Receive Invoice Complete"
                        Assign = True
                Else
                        Message "Receive Invoice Error !!!"
                        Assign = False
                End If
        '-------------------------- PO -----------------------------
        ElseIf (objxml.GetStatus = SSent) And (objxml.GetRootName = "PO") Then
                If RecvPO_GenOrderNo(xmlPath, "") Then
                        Message "Receive PO and Generate Order No. Complete"
                        Assign = True
                        
                        mdiMain.WSSend 1
                Else
                        Message "Receive PO and Generate Order No. Error !!!"
                        Assign = False
                End If
        Else
                Message "XML Error !!!"
                Assign = False
        End If
End Function

Public Function RecvTSPaid_Reject(ByVal xmlPath As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim objxml As XML
        Dim IVno As String
        
        Set objxml = New XML
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.Open
        objxml.getParameter xmlPath
        IVno = objxml.query("InvoiceNo", xmlPath)
        rcs.Open "select * from invoice where invoiceno = """ & IVno & """", conn, 1, 3
        If rcs.RecordCount > 0 Then
                If objxml.GetStatus = SReject Then
                        rcs!Status = "Fail"
                Else
                        rcs!Status = objxml.GetStatus
                End If
                rcs!InvoiceID = objxml.query("TransactionID", xmlPath)
                rcs.Update
                RecvTSPaid_Reject = True
        Else
                Message "Cannot find this InvoiceNo in database"
                RecvTSPaid_Reject = False
        End If
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
        Set objxml = Nothing
End Function
