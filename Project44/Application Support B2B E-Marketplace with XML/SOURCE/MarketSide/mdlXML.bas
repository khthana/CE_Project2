Attribute VB_Name = "mdlXML"
Option Explicit

Public Function GenPR(ByVal prid As Long, ByVal dest As String) As Boolean
    Dim sql As String
    Dim doc As XML
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    If dest = "" Then
        dest = App.Path & PRdir & "\Open\PR" & Trim$(Str(prid)) & "_Open" & ".xml"
    End If
    sql = "select  " & _
          "PR.PRID , PR.SellerID, BizName, PRFullDate,  " & _
          "PRTerm, PRAddress, PRShipPrice, PRItemPrice, Line, OrderName, OrderSellerItemID, " & _
          "OrderUnit, OrderQTY, OrderItemPrice, OrderShipPrice, needDate, ShipMethod " & _
          "From PR , Orderdetail, Member " & _
          "Where PR.SellerID=Member.ID And  PR.PRID=Orderdetail.PRID " & _
          "and PR.PRID=" & Str(prid)
          '"and PR.PRID=(  select Max(PRID)  from PR )"
    
    Set conn = New ADODB.Connection
    Set rcs = New ADODB.Recordset
    conn.ConnectionString = DBconString
    conn.CursorLocation = adUseClient
    conn.Open
    rcs.Open sql, conn, 1, 3
    If rcs.RecordCount > 0 Then
        Set doc = New XML
        doc.SetStatus = SOpen
        doc.SetRootName = "PR"
        doc.SetSubRootName = "MARKET"
        doc.Recordset2XMLwithoutDTD rcs, dest, dtdPROpen
        FileName = dest
        Set doc = Nothing
        GenPR = True
    Else
        GenPR = False
    End If
    rcs.Close
    conn.Close
    Set rcs = Nothing
    Set conn = Nothing
End Function

Public Function ConfirmPR(ByVal xmlPath As String) As Boolean
    Dim prid As String
    Dim prno As String
    Dim objxml As XML
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    'Dim sql As String
    
    Set objxml = New XML
    objxml.getParameter xmlPath
    If objxml.getStatus = SConfirm Then
        prid = objxml.query("PRID", xmlPath)
        prno = objxml.query("PRNO", xmlPath)
        Set conn = New ADODB.Connection
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        'sql = "update PR " & _
        '      "set PRNO = '" & prno & "', " & _
        '      "PRstatus = """ & SConfirm & """" & _
        '      "where prid = " & prid
        'conn.Execute sql
        
        Set rcs = New ADODB.Recordset
        rcs.Open "select * from PR where prid = " & prid, conn, 1, 3
            If Not (rcs.BOF) Then
                rcs.MoveFirst
            End If
            
            Do While Not (rcs.EOF)
                rcs("PRStatus") = SConfirm
                rcs("PRNO") = prno
                rcs("UpdateFullDate") = Now
                'rcs("UpdateTime") = Time()
                'rcs("UpdateDate") = Day(updateDate)
                'rcs("UpdateMonth") = Month(updateDate)
                'rcs("UpdateYear") = Year(updateDate)
                rcs.Update
                rcs.MoveNext
            Loop
        rcs.Close
        
        conn.Close
        Set conn = Nothing
        ConfirmPR = True
    Else
        ConfirmPR = False
    End If
    Set objxml = Nothing
End Function

Public Function RecvRejectPR(ByVal xmlPath As String) As Boolean
    Dim objxml As XML
    Dim prid As String
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    'Dim sql As String
    Set objxml = New XML
    objxml.getParameter xmlPath
    If objxml.getStatus = SReject Then
        prid = objxml.query("PRID", xmlPath)
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        'sql = "update PR set PRstatus = """ & SReject & """, " & _
        '      "PRComment = """ & objxml.query("Reason", xmlPath) & """ " & _
        '      "where PRID = " & prid
        'conn.Execute sql
        rcs.Open "select * from PR where prid =" & prid, conn, 1, 3
            If Not (rcs.BOF) Then
                rcs.MoveFirst
            End If
            
            Do While Not (rcs.EOF)
                rcs("PRStatus") = SReject
                rcs("PRComment") = objxml.query("Comment", xmlPath)
                rcs("UpdateFullDate") = Now
                'rcs("UpdateTime") = Time()
                'rcs("UpdateDate") = Day(updateDate)
                'rcs("UpdateMonth") = Month(updateDate)
                'rcs("UpdateYear") = Year(updateDate)
                rcs.Update
                rcs.MoveNext
            Loop
        rcs.Close
        conn.Close
        Set rcs = Nothing
        Set conn = Nothing
        RecvRejectPR = True
    Else
        RecvRejectPR = False
    End If
    Set objxml = Nothing
End Function

Public Function ReceivePO(ByVal xmlPath As String) As Boolean
    Dim pono As String
    Dim prid As String
    Dim objxml As XML
    Dim conn As ADODB.Connection
    Dim rcs As ADODB.Recordset
    Dim updateDate As Date
    Dim poid As Long
    
    Set objxml = New XML
    objxml.getParameter xmlPath
    If objxml.getStatus = SSent Then
        pono = objxml.query("PONO", xmlPath)
        prid = objxml.query("PRID", xmlPath)
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        
        updateDate = Str(Now)
        rcs.Open "select * from PR where prid = " & prid, conn, 1, 3
            If Not (rcs.BOF) Then
                rcs.MoveFirst
            End If
            Do While Not (rcs.EOF)
                rcs("PRStatus") = SAccept
                rcs("UpdateFullDate") = updateDate
                rcs.Update
                rcs.MoveNext
            Loop
        rcs.Close
        rcs.Open "select max(POID) as maxPOID from PO"
        If IsNull(rcs!maxPOID) Then
                poid = 1
        Else
                poid = rcs!maxPOID + 1
        End If
        rcs.Close
         rcs.Open "select * from PO where prid = " & prid, conn, 1, 3
         If rcs.RecordCount > 0 Then
                rcs!pono = pono
                rcs!pofulldate = updateDate
                rcs!POstatus = SSent
                rcs!updateDate = updateDate
                rcs!SellerOrderNo = "N/A"
                rcs.Update
         Else
                rcs.AddNew
                rcs!poid = poid
                rcs!pono = pono
                rcs!pofulldate = updateDate
                rcs!POstatus = SSent
                rcs!updateDate = updateDate
                rcs!prid = prid
                rcs!SellerOrderNo = "N/A"
                rcs.Update
        End If
        rcs.Close
        ReceivePO = True
    Else
        ReceivePO = False
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
    conn.CursorLocation = adUseClient
    conn.Open
    objxml.getParameter xmlPath
    '------------------ PR ------------------
    If objxml.GetRootName = "PR" Then
        xno = objxml.query("PRID", xmlPath)
        rcs.Open "select PRStatus from PR where prid = " & xno, conn, 1, 3
        currentStatus = rcs!PRStatus
        If LCase$(currentStatus) = LCase$(SOpen) Then
            Select Case objxml.getStatus
                Case SConfirm
                    If ConfirmPR(xmlPath) Then
                        Message "Receive Confirm PR Complete"
                    Else
                        Message "Receive Confirm PR Error"
                    End If
                Case Else
                    Message "Current PR Status is " & currentStatus & " but xml status is " & objxml.getStatus
            End Select
        ElseIf LCase$(currentStatus) = LCase$(SConfirm) Then
            Select Case objxml.getStatus
                Case SReject
                    If RecvRejectPR(xmlPath) Then
                        Message "Receive Reject PR Complete"
                    Else
                        Message "Receive Reject PR Error"
                    End If
                'Case Accept    'same as PO Sent
                Case Else
                    Message "Current PR Status is " & currentStatus & " but xml status is " & objxml.getStatus
            End Select
        Else
            Message "Current PR Status is " & currentStatus & " but xml status is " & objxml.getStatus
        End If
        rcs.Close
    '------------------------- PO -----------------------
    ElseIf objxml.GetRootName = "PO" Then
        Select Case objxml.getStatus
            Case SSent
                xno = objxml.query("PONO", xmlPath)
                rcs.Open "select POStatus from PO where pono = """ & xno & """", conn, 1, 3
                currentStatus = rcs!POstatus
                If rcs.RecordCount = 0 Then
                    'new po
                    If ReceivePO(xmlPath) Then
                        Message "Recieve PO Complete"
                    Else
                        Message "Recieve PO Error"
                    End If
                Else
                    Message "Error!! this P.O. No. Has already exist"
                End If
                rcs.Close
            Case Else
       End Select
    Else
        Message "XML Type : " & objxml.GetRootName & vbCrLf & _
               "XML Status : " & objxml.getStatus
    End If
    conn.Close
    Set rcs = Nothing
    Set conn = Nothing
    Set objxml = Nothing
End Function

Public Function genPOtoSeller(ByVal xmlPath As String, ByVal dest As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim objXmldoc As DOMDocument30
        Dim objxmlNodelist As IXMLDOMNodeList
        Dim newNode As IXMLDOMNode
        Dim i As Integer
        Dim prid As String
        Dim poid As String
        Dim sql As String
        Dim bizNode As IXMLDOMNode
        Dim addrNode As IXMLDOMNode
        Dim buyerIDNode As IXMLDOMNode
        Dim bizname As String
        Dim bizaddr As String
        Dim buyerID As String
               
        On Error GoTo msgerr:
               
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        Set objXmldoc = New DOMDocument30
        
        objXmldoc.async = False
        objXmldoc.validateOnParse = False
        objXmldoc.Load xmlPath
        prid = objXmldoc.documentElement.getElementsByTagName("PRID").item(0).Text
        
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        rcs.Open "select POID from PO where prid = " & prid, conn
        poid = rcs("POID")
        rcs.Close
        
        sql = "select BuyerID, BizName, BizAddress, ProvinceName " & _
                  "from Member, Province, PR " & _
                  "where PR.BuyerID = Member.ID and Member.ProvinceID = Province.ProvinceID and " & _
                  "PR.PRID = " & prid
        rcs.Open sql, conn, 1, 3
        bizname = rcs!bizname
        bizaddr = rcs!bizaddress & " " & rcs!ProvinceName
        buyerID = rcs!buyerID
        rcs.Close
                
        Set objxmlNodelist = objXmldoc.documentElement.getElementsByTagName("SellerID")
        For i = 0 To objxmlNodelist.Length - 1
                Set buyerIDNode = objXmldoc.createNode(1, "BuyerID", "")
                Set bizNode = objXmldoc.createNode(1, "BuyerBizName", "")
                Set addrNode = objXmldoc.createNode(1, "BuyerAddress", "")
                buyerIDNode.Text = buyerID
                bizNode.Text = bizname
                addrNode.Text = bizaddr
                
                objxmlNodelist.item(i).parentNode.appendChild bizNode
                objxmlNodelist.item(i).parentNode.appendChild objXmldoc.createTextNode(vbCrLf & vbTab & vbTab)
                objxmlNodelist.item(i).parentNode.appendChild addrNode
                objxmlNodelist.item(i).parentNode.appendChild objXmldoc.createTextNode(vbCrLf & vbTab)
                objxmlNodelist.item(i).parentNode.replaceChild buyerIDNode, objxmlNodelist.item(i)
                buyerIDNode.parentNode.insertBefore objXmldoc.createTextNode(vbCrLf & vbTab & vbTab), buyerIDNode.nextSibling
                
        Next
       
        Set objxmlNodelist = objXmldoc.documentElement.getElementsByTagName("PRID")
        For i = 0 To objxmlNodelist.Length - 1
                Set newNode = objXmldoc.createNode(1, "POID", "")
                newNode.Text = poid
                'objxmlNodelist.Item(i).parentNode.removeChild objxmlNodelist.Item(i)
                objxmlNodelist.item(i).parentNode.replaceChild newNode, objxmlNodelist.item(i)
                newNode.parentNode.insertBefore objXmldoc.createTextNode(vbCrLf & vbTab & vbTab), newNode.nextSibling
                
         Next
       
       
       If dest = "" Then
                dest = App.Path & POdir & "\Sent\POID" & poid & "_Sent.xml"
       End If
       objXmldoc.save dest
       Dim x As XML
       Set x = New XML
       x.ReplaceDOCTYPE dest, dtdPOSeller, "PO"
       
       Set x = Nothing
       
       '------------------------
       FileName = dest
       rcs.Open "select SellerID from PR where prid =" & prid
       mdlOperation.SetParameterByMemberID rcs!sellerID
       '------------------------
       
      rcs.Close
       conn.Close
       Set objXmldoc = Nothing
       Set rcs = Nothing
       Set conn = Nothing
       genPOtoSeller = True
Exit Function
msgerr:
        genPOtoSeller = False
        Message "GenPO to Seller Fail"
End Function

Public Function RecvOrderNo(ByVal xmlPath As String) As Boolean
        Dim poid As String
        Dim OrderNo As String
        Dim objxml As XML
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        
        Set objxml = New XML
        objxml.getParameter xmlPath
        If (objxml.getStatus = SReceive) And (objxml.GetRootName = "PO") Then
                poid = objxml.query("POID", xmlPath)
                OrderNo = objxml.query("OrderNo", xmlPath)
                
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                conn.ConnectionString = DBconString
                conn.CursorLocation = adUseClient
                conn.Open
                rcs.Open "select * from PO where poid = " & poid, conn, 1, 3
                If rcs.RecordCount = 1 Then
                        rcs!POstatus = SReceive
                        rcs!SellerOrderNo = OrderNo
                        rcs!updateDate = Now
                        rcs.Update
                        RecvOrderNo = True
                Else
                        Message "Error !!! this POID have more than one row"
                        RecvOrderNo = False
                End If
                rcs.Close
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
        Else
                RecvOrderNo = False
        End If
        Set objxml = Nothing
End Function

Public Function RecvRejectPO(ByVal xmlPath As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim objxml As XML
        Dim poid As String
        Dim Comment As String
        
        Set objxml = New XML
        objxml.getParameter xmlPath
        If objxml.getStatus = SReject Then
                poid = objxml.query("POID", xmlPath)
                Comment = objxml.query("Comment", xmlPath)
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                
                conn.ConnectionString = DBconString
                conn.CursorLocation = adUseClient
                conn.Open
                rcs.Open "select * from PO where POID = " & poid, conn, 1, 3
                If rcs.RecordCount > 0 Then
                        rcs!POstatus = SReject
                        rcs!POSellerComment = Comment
                        rcs!updateDate = Now
                        rcs.Update
                        RecvRejectPO = True
                Else
                        Message "Error !!! This POID doesn't exist in database"
                        RecvRejectPO = False
                End If
                
                rcs.Close
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
        Else
                RecvRejectPO = False
        End If
        Set objxml = Nothing
End Function

Public Function RecvAcceptPO(ByVal xmlPath As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim objxml As XML
        Dim poid As String
        
        Set objxml = New XML
        objxml.getParameter xmlPath
        If objxml.getStatus = SAccept Then
                poid = objxml.query("POID", xmlPath)
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                
                conn.ConnectionString = DBconString
                conn.CursorLocation = adUseClient
                conn.Open
                
                rcs.Open "select * from PO where POID = " & poid, conn, 1, 3
                If rcs.RecordCount > 0 Then
                        rcs!POstatus = SAccept
                        rcs!updateDate = Now
                        rcs.Update
                        RecvAcceptPO = True
                Else
                        Message "Error !!! This POID doesn't exist in database"
                        RecvAcceptPO = False
                End If
                rcs.Close
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
        Else
                RecvAcceptPO = False
        End If
        Set objxml = Nothing
End Function

Public Function Assign(ByVal xmlPath As String) As Boolean
        Dim objxml As XML
        Dim rcs As ADODB.Recordset
        Dim conn As ADODB.Connection
        Dim poid As String
        Dim serviceID As String
        
        Set objxml = New XML
        objxml.getParameter xmlPath
        '----------------------------- PO ------------------------------------
        If (objxml.getStatus = SAccept) And (objxml.GetRootName = "PO") Then
                If RecvAcceptPO(xmlPath) Then
                        Message "Receive Accept PO Complete"
                        Set conn = New ADODB.Connection
                        Set rcs = New ADODB.Recordset
                        poid = objxml.query("POID", xmlPath)
                        conn.ConnectionString = DBconString
                        conn.CursorLocation = adUseClient
                        conn.Open
                        rcs.Open "SELECT     PR.ShipMethod FROM   PO INNER JOIN " & _
                                           "PR ON PO.PRID = PR.PRID WHERE  (PO.POID = " & poid & ")", conn, 1, 3
                        If LCase$(rcs!shipmethod) = LCase$("FedEx") Then
                                mdlXML.UpdateDBFedEx poid, serviceID
                                If mdlXML.GenPartnerPO(poid, serviceID, "") Then
                                        mdlOperation.searchIP_PortfromUID "FedEx"
                                        Message "Generate FedEx PO Complete"
                                        
                                        mdiMain.WSSend 2
                                Else
                                        Message "Generate FedEx PO Error !!!"
                                End If
                        ElseIf LCase$(rcs!shipmethod) = LCase$("Ems") Then
                                mdlXML.UpdateDBCAT poid, serviceID
                                If mdlXML.GenPartnerPO(poid, serviceID, "") Then
                                        mdlOperation.searchIP_PortfromUID "CAT"
                                        Message "Generate CAT PO Complete"
                                        
                                        mdiMain.WSSend 2
                                Else
                                        Message "Generate CAT PO Error !!!"
                                End If
                        End If
                        rcs.Close
                        conn.Close
                        Set rcs = Nothing
                        Set conn = Nothing
                        Assign = True
                Else
                        Message "Receive Accept PO Error !!!"
                        Assign = False
                End If
        ElseIf (objxml.getStatus = SReject) And (objxml.GetRootName = "PO") Then
                If RecvRejectPO(xmlPath) Then
                        Message "Receive Reject PO Complete"
                        Assign = True
                Else
                        Message "Receive Reject PO Error !!!"
                        Assign = False
                End If
        ElseIf (objxml.getStatus = SReceive) And (objxml.GetRootName = "PO") Then
                If RecvOrderNo(xmlPath) Then
                        Message "Receive Order No. Complete"
                        Assign = True
                Else
                        Message "Receive Order No. Error !!!"
                        Assign = False
                End If
        
        '------------------------------ Invoice --------------------------------
        ElseIf (objxml.getStatus = SSent) And (objxml.GetRootName = "Invoice") Then
               If mdlXML.RecvInvoice(xmlPath) Then
                        Message "Receive Invoice Complete"
                        If mdlXML.GenInvoiceToBuyer(xmlPath, "") Then
                                Message "Gen Invoice To Buyer Complete"
                                Assign = True
                                
                                mdiMain.WSSend 2
                        Else
                                Message "Gen Invoice To Buyer Error !!!"
                                Assign = False
                        End If
                Else
                        Message "Receive Invoice Error !!!"
                        Assign = False
                End If
        ElseIf (objxml.getStatus = SReceive) And (objxml.GetRootName = "Invoice") Then
                If RecvIVRecv(xmlPath) Then
                        Message "Update Invoice Receive's Status Complete"
                        Assign = True
                Else
                        Message "Update Invoice Receive's Status Error !!!"
                        Assign = False
                End If
        ElseIf (objxml.getStatus = SAccept) And (objxml.GetRootName = "Invoice") Then
                If RecvAcceptIV(xmlPath) Then
                        Message "Receive Accept Invoice Complete"
                        If GenTSPayment(xmlPath, "") Then
                                 Message "Generate Market Transaction Payment Complete"
                                Assign = True
                        Else
                                Message "Generate Market Transaction Payment Error !!!"
                                Assign = False
                        End If
                Else
                        Message "Receive Accept Invoice Error !!!"
                        Assign = False
                End If
        ElseIf (objxml.getStatus = SReject) And (objxml.GetRootName = "Invoice") Then
                If RecvRejectIV(xmlPath) Then
                        Message "Receive Reject Invoice Complete"
                        Assign = True
                Else
                        Message "Receive Reject Invoice Error !!!"
                        Assign = False
                End If
        '--------------------------- PR ---------------------------------------
        ElseIf (objxml.getStatus = SSent) And (objxml.GetRootName = "PO") Then
                If mdlXML.ReceivePO(xmlPath) Then
                                Message "Update P.O. complete"
                                If genPOtoSeller(xmlPath, "") Then
                                        Message "Prepare PO to Seller Complete"
                                        Assign = True
                                        
                                        mdiMain.WSSend 2
                                Else
                                        Message "Prepare PO to Seller Error!!!"
                                        Assign = False
                                End If
                Else
                                Message "Accept P.R. Error"
                End If
        ElseIf (objxml.getStatus = SReject) And (objxml.GetRootName = "PR") Then
                If RecvRejectPR(xmlPath) Then
                        Message "Receive Reject PR Complete"
                        Assign = True
                Else
                        Message "Receive Reject PR Error !!!"
                        Assign = False
                End If
        ElseIf (objxml.getStatus = SConfirm) And (objxml.GetRootName = "PR") Then
                If ConfirmPR(xmlPath) Then
                        Message "Receive P.R. No.  Complete"
                        Assign = True
                Else
                        Message "Receive P.R. No. Error !!!"
                        Assign = False
                End If
        
        
        Else
                Message "XML Error !!!"
                Assign = False
        End If
End Function

Public Function RecvInvoice(ByVal xmlPath As String) As Boolean
        Dim objxml As XML
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim rcs2 As ADODB.Recordset
        Dim rcsCount As Long
        Dim sql As String
        Dim IvNo As String
        Dim xmldoc As DOMDocument30
        Dim nodeList As IXMLDOMNodeList
        Dim i As Integer
        Dim poid As String
        Dim IVid As Long
        
        Set objxml = New XML
        objxml.getParameter xmlPath
        If (objxml.getStatus = SSent) And (objxml.GetRootName = "Invoice") Then
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                IvNo = objxml.query("InvoiceNo", xmlPath)
                poid = objxml.query("POID", xmlPath)
                conn.ConnectionString = DBconString
                conn.CursorLocation = adUseClient
                conn.Open
                'sql = "select InvoiceDetail.InvoiceID, InvoiceDetail.POID, Line " & _
                '                   "from Invoice,InvoiceDetail " & _
                '                   "where Invoice.InvoiceID = InvoiceDetail.InvoiceID and InvoiceNo = '" & IvNo & "'"
                sql = "select InvoiceID from Invoice where poid = " & poid & " and InvoiceNo = '" & IvNo & "'"
                rcs.Open sql, conn, 1, 3
                        rcsCount = rcs.RecordCount
                rcs.Close
                rcs.Open "select max(InvoiceID) as maxID from Invoice", conn, 1, 3
                If IsNull(rcs!maxid) Then
                        IVid = 1
                Else
                        IVid = rcs!maxid + 1
                End If
                rcs.Close
                
                If rcsCount <= 0 Then
                        ' ---------------------------- Update Invoice Table ---------------------------------
                        rcs.Open "Invoice", conn, 1, 3
                                rcs.AddNew
                                rcs!invoiceID = IVid
                                rcs!InvoiceNo = IvNo
                                rcs!poid = poid
                                rcs!NetAmount = objxml.query("NetAmount", xmlPath)
                                rcs!Vat = objxml.query("VAT", xmlPath)
                                rcs!TotalPrice = objxml.query("TotalPrice", xmlPath)
                                rcs!DueDate = objxml.query("DueDate", xmlPath)
                                rcs!invoicestate = SSent
                                rcs!Invoicedate = Now
                                rcs!updateDate = Now
                                
                                rcs.Update
                        rcs.Close
                        '---------------------------------------------------------------------------
                        
                        '-------------------- Update Invoice Detail ------------------------
                        Set xmldoc = New DOMDocument30
                        xmldoc.async = False
                        xmldoc.validateOnParse = False
                        xmldoc.Load xmlPath
                        rcs.Open "InvoiceDetail", conn, 1, 3
                        Set nodeList = xmldoc.documentElement.getElementsByTagName("Line")
                        For i = 0 To nodeList.Length - 1
                                rcs.AddNew
                                rcs!invoiceID = IVid
                                rcs!poid = poid
                                rcs!Line = nodeList(i).Text
                                rcs.Update
                        Next
                        RecvInvoice = True
                        rcs.Close
                        '-----------------------------------------------------------------------------
                        
                        '---------------- Update PO Status ----------------------
                        Set rcs2 = New ADODB.Recordset
                        rcs.Open "SELECT     COUNT(*) AS OrderDetailCount " & _
                                            "FROM         OrderDetail INNER JOIN " & _
                                                                    "PR ON OrderDetail.PRID = PR.PRID INNER JOIN " & _
                                                                    "PO ON PR.PRID = PO.PRID  " & _
                                           "WHERE     (PO.POID = " & poid & ")", conn, 1, 3
                       rcs2.Open "SELECT     COUNT(*) AS InvoiceDetailCount " & _
                                                "FROM         PR INNER JOIN " & _
                                                                      "PO ON PR.PRID = PO.PRID INNER JOIN " & _
                                                                        "InvoiceDetail ON PO.POID = InvoiceDetail.POID " & _
                                                "WHERE     (PO.POID = " & poid & ")", conn, 1, 3
                        If rcs!OrderDetailCount = rcs2!InvoiceDetailCount Then
                                conn.Execute "Update PO set POStatus = '" & SDeliver & "' where poid = " & poid
                        Else
                                conn.Execute "Update PO set POStatus = '" & SPartial & "' where poid = " & poid
                        End If
                        rcs.Close
                        rcs2.Close
                Else
                        Message "This Invoice has already exist in database"
                        RecvInvoice = False
                End If
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
                Set xmldoc = Nothing
        Else
                RecvInvoice = False
        End If
        Set objxml = Nothing
End Function

Public Function GenInvoiceToBuyer(ByVal xmlPath As String, ByVal dest As String) As Boolean
        Dim objxml As XML
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim rcsCount As Long
        Dim sql As String
        Dim IVid As String
        Dim xmldoc As DOMDocument30
        Dim nodeList As IXMLDOMNodeList
        Dim newNode As IXMLDOMNode
        Dim i As Integer
        Dim poid As String
        Dim IvNo As String
        Dim pono As String
               
        Set objxml = New XML
        objxml.getParameter xmlPath
        If (objxml.getStatus = SSent) And (objxml.GetRootName = "Invoice") Then
                Set xmldoc = New DOMDocument30
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                xmldoc.async = False
                xmldoc.validateOnParse = False
                xmldoc.Load xmlPath
                conn.ConnectionString = DBconString
                conn.CursorLocation = adUseClient
                conn.Open
                poid = objxml.query("POID", xmlPath)
                IvNo = objxml.query("InvoiceNo", xmlPath)
                rcs.Open "select PONO from PO where POID = " & poid, conn, 1, 3
                pono = rcs!pono
                rcs.Close
                
                rcs.Open "select InvoiceID from Invoice where poid = " & poid & " and InvoiceNo = '" & IvNo & "'", conn, 1, 3
                IVid = rcs!invoiceID
                rcs.Close
                Set nodeList = xmldoc.documentElement.getElementsByTagName("POID")
                For i = 0 To nodeList.Length - 1
                        Set newNode = xmldoc.createNode(1, "PONO", "")
                        newNode.Text = pono
                        nodeList.item(i).parentNode.replaceChild newNode, nodeList.item(i)
                        newNode.parentNode.insertBefore xmldoc.createTextNode(vbCrLf & vbTab & vbTab), newNode.nextSibling
                Next
                
                Set nodeList = xmldoc.documentElement.getElementsByTagName("InvoiceNo")
                For i = 0 To nodeList.Length - 1
                        Set newNode = xmldoc.createNode(1, "InvoiceID", "")
                        newNode.Text = IVid
                        nodeList.item(i).parentNode.replaceChild newNode, nodeList.item(i)
                        newNode.parentNode.insertBefore xmldoc.createTextNode(vbCrLf & vbTab & vbTab), newNode.nextSibling
                Next
                
                If dest = "" Then
                        dest = App.Path & IVdir & "\Sent\IVID" & IVid & "_Sent.xml"
                End If
                xmldoc.save dest
                Dim x As XML
                Set x = New XML
                x.ReplaceDOCTYPE dest, dtdIVBuyer, "Invoice"
                
                Set x = Nothing
                
                '------------------------
                FileName = dest
                rcs.Open "select BuyerID from PR, PO where PO.PRID = PR.PRID and POID = " & poid, conn, 1, 3
                mdlOperation.SetParameterByMemberID rcs!buyerID
                rcs.Close
                '------------------------------
                
                conn.Close
                Set xmldoc = Nothing
                Set rcs = Nothing
                Set conn = Nothing
                GenInvoiceToBuyer = True
        Else
                GenInvoiceToBuyer = False
        End If
End Function

Public Function RecvRejectIV(ByVal xmlPath As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim objxml As XML
        Dim IVid As String
        Dim Comment As String
        
        Set objxml = New XML
        objxml.getParameter xmlPath
        If objxml.getStatus = SReject Then
                IVid = objxml.query("InvoiceID", xmlPath)
                Comment = objxml.query("InvoiceComment", xmlPath)
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                
                conn.ConnectionString = DBconString
                conn.CursorLocation = adUseClient
                conn.Open
                rcs.Open "select * from Invoice where InvoiceID = " & IVid, conn, 1, 3
                If rcs.RecordCount > 0 Then
                        rcs!invoicestate = SReject
                        rcs!InvoiceComment = Comment
                        rcs!updateDate = Now
                        rcs.Update
                        RecvRejectIV = True
                Else
                        Message "Error !!! This InvoiceID doesn't exist in database"
                        RecvRejectIV = False
                End If
                
                rcs.Close
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
        Else
                RecvRejectIV = False
        End If
        Set objxml = Nothing
End Function

Public Function RecvAcceptIV(ByVal xmlPath As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim objxml As XML
        Dim IVid As String
        
        Set objxml = New XML
        objxml.getParameter xmlPath
        If objxml.getStatus = SAccept Then
                IVid = objxml.query("InvoiceID", xmlPath)
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                
                conn.ConnectionString = DBconString
                conn.CursorLocation = adUseClient
                conn.Open
                
                rcs.Open "select * from Invoice where InvoiceID = " & IVid, conn, 1, 3
                If rcs.RecordCount > 0 Then
                        rcs!invoicestate = SAccept
                        rcs!updateDate = Now
                        rcs.Update
                        RecvAcceptIV = True
                Else
                        Message "Error !!! This InvoiceID doesn't exist in database"
                        RecvAcceptIV = False
                End If
                rcs.Close
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
        Else
                RecvAcceptIV = False
        End If
        Set objxml = Nothing
End Function

Public Function RecvIVRecv(ByVal xmlPath As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim objxml As XML
        Dim IVid As String

        Set objxml = New XML
        objxml.getParameter xmlPath
        If objxml.getStatus = SReceive Then
                IVid = objxml.query("InvoiceID", xmlPath)
                Set conn = New ADODB.Connection
                Set rcs = New ADODB.Recordset
                
                conn.ConnectionString = DBconString
                conn.CursorLocation = adUseClient
                
                conn.Open
                
                rcs.Open "select * from Invoice where InvoiceID = " & IVid, conn, 1, 3
                If rcs.RecordCount > 0 Then
                        rcs!invoicestate = SReceive
                        rcs!updateDate = Now
                        rcs.Update
                        RecvIVRecv = True
                Else
                        Message "Error !!! This InvoiceID doesn't exist in database"
                        RecvIVRecv = False
                End If
                rcs.Close
                conn.Close
                Set rcs = Nothing
                Set conn = Nothing
        Else
                RecvIVRecv = False
        End If
        Set objxml = Nothing
End Function



Public Function GenTSPayment(ByVal xmlPath As String, ByVal dest As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim objxml As XML
        Dim sql As String
        Dim IVid As String
        
        Set objxml = New XML
        objxml.getParameter xmlPath
        IVid = objxml.query("InvoiceID", xmlPath)
        
        On Error GoTo msgerr:
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
         sql = "SELECT     Invoice.InvoiceID as TransactionID, Invoice.InvoiceNo,  " & _
                                           "Invoice.TotalPrice as TotalPayment, Invoice.DueDate, " & _
                                                " (SELECT     Member.BankID" & _
                                                " FROM          Member INNER JOIN " & _
                                                                         "Invoice INNER JOIN " & _
                                                                        "PO ON Invoice.POID = PO.POID INNER JOIN " & _
                                                                        "PR ON PO.PRID = PR.PRID ON Member.ID = PR.BuyerID " & _
                                                "WHERE      (Invoice.InvoiceID = " & IVid & ")) AS BuyerBankID, " & _
                                                "(SELECT     Member.BankID " & _
                                                "FROM          Member INNER JOIN " & _
                                                                       "Invoice INNER JOIN " & _
                                                                       "PO ON Invoice.POID = PO.POID INNER JOIN " & _
                                                                       "PR ON PO.PRID = PR.PRID ON Member.ID = PR.SellerID " & _
                                                " WHERE      (Invoice.InvoiceID = " & IVid & ")) AS SellerBankID " & _
                "FROM         Invoice INNER JOIN " & _
                                        "PO ON Invoice.POID = PO.POID INNER JOIN " & _
                                        "PR ON PO.PRID = PR.PRID " & _
                "Where (Invoice.InvoiceID = " & IVid & ") "
        rcs.Open sql, conn
        
        objxml.SetStatus = SAccept
        objxml.SetRootName = "TransactionPayment"
        objxml.SetSubRootName = "Manager_market"
        
        If (dest = "") Then
                dest = App.Path & TSdir & "\Accept\TSMS" & IVid & "_Accept.xml"
        End If
        objxml.Recordset2XMLwithoutDTD rcs, dest, dtdMTS
        
        'mdiMain.tsFile = dest
         mdlSendQueue.AddQueue dest, "Bank"
                
        Set objxml = Nothing
        Set rcs = Nothing
        Set conn = Nothing
        GenTSPayment = True
Exit Function
msgerr:
        GenTSPayment = False
        Message Error$
End Function

Public Function RecvPaid_RejectTS(ByVal tsid As String, ByVal Status As String) As Boolean
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset

        On Error GoTo msgerr:
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        'conn.CursorLocation = adUseClient
        conn.Open
        rcs.Open "select invoicestate from invoice where invoiceid = " & tsid, conn, 1, 3
        If Status = SReject Then
                rcs!invoicestate = "fail"
        Else
                rcs!invoicestate = Status
        End If
        rcs.Update
        rcs.Close
        conn.Close
        RecvPaid_RejectTS = True
        Set rcs = Nothing
        Set conn = Nothing
Exit Function
msgerr:
        Message Error$
        RecvPaid_RejectTS = False
End Function

Public Function GenPartnerPO(ByVal poid As String, ByVal serviceID As String, ByVal dest As String) As Boolean
        Dim objxml As XML
        Dim xmldoc As DOMDocument30
        Dim rootNode As IXMLDOMNode
        Dim subRootNode As IXMLDOMNode
        Dim chldNode As IXMLDOMNode
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim sql As String
        Set xmldoc = New DOMDocument30
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        Set rootNode = xmldoc.createNode(1, "Partner", "")
        rootNode.Attributes.setNamedItem xmldoc.createAttribute("Status")
        rootNode.Attributes.getNamedItem("Status").Text = SSent
        
     Dim prInst As IXMLDOMProcessingInstruction
    Set prInst = xmldoc.createProcessingInstruction("xml", "version=""1.0""")
    xmldoc.appendChild prInst

        On Error GoTo msgerr:
        sql = "SELECT     PR.PRAddress, PR.PRShipPrice " & _
                   "FROM         PO INNER JOIN " & _
                                         "PR ON PO.PRID = PR.PRID " & _
                   "WHERE     (po.poid = " & poid & ")"
        rcs.Open sql, conn, 1, 3
        Set subRootNode = xmldoc.createNode(1, "PO_Information", "")
        rootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab)
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        Set chldNode = xmldoc.createElement("ServiceID")
        chldNode.Text = serviceID
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        
        Set chldNode = xmldoc.createElement("POAddress")
        chldNode.Text = rcs!praddress
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        
        Set chldNode = xmldoc.createElement("POShipPrice")
        chldNode.Text = rcs!PRShipPrice
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab)
        rcs.Close
        rootNode.appendChild subRootNode
        
        '---------- Buyer --------------
        sql = "SELECT    Province.ProvinceName, Member.BizName, Member.BizAddress " & _
                  "FROM         Member INNER JOIN " & _
                                        "PO INNER JOIN " & _
                                        "PR ON PO.PRID = PR.PRID ON Member.ID = PR.BuyerID INNER JOIN " & _
                                        "Province ON Member.ProvinceID = Province.ProvinceID " & _
                  "WHERE     (po.poid = " & poid & ")"
        rcs.Open sql, conn, 1, 3
        Set subRootNode = xmldoc.createNode(1, "Buyer_Information", "")
        rootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab)
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        
        Set chldNode = xmldoc.createElement("BuyerName")
        chldNode.Text = rcs!bizname
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        
        Set chldNode = xmldoc.createElement("BuyerAddress")
        chldNode.Text = rcs!bizaddress
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        
        Set chldNode = xmldoc.createElement("BuyerProvince")
        chldNode.Text = rcs!ProvinceName
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab)
        rcs.Close
        rootNode.appendChild subRootNode
        
        '---------- Seller ---------------
        sql = "SELECT     Province.ProvinceName, Member.BizName, Member.BizAddress " & _
                  "FROM         Member INNER JOIN " & _
                                  "Province ON Member.ProvinceID = Province.ProvinceID INNER JOIN " & _
                                  "PO INNER JOIN " & _
                                  "PR ON PO.PRID = PR.PRID ON Member.ID = PR.SellerID " & _
                 "WHERE     (po.poid = " & poid & ")"
        rcs.Open sql, conn, 1, 3
        Set subRootNode = xmldoc.createNode(1, "Seller_Information", "")
        rootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab)
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        
        Set chldNode = xmldoc.createElement("SellerName")
        chldNode.Text = rcs!bizname
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        
        Set chldNode = xmldoc.createElement("SellerAddress")
        chldNode.Text = rcs!bizaddress
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
        
        Set chldNode = xmldoc.createElement("SellerProvince")
        chldNode.Text = rcs!ProvinceName
        subRootNode.appendChild chldNode
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab)
        rcs.Close
        rootNode.appendChild subRootNode
        
        '------------- Item ---------------
        sql = "SELECT     OrderDetail.OrderName, OrderDetail.NeedDate, OrderDetail.OrderShipPrice, " & _
                                           "OrderDetail.OrderQTY, OrderDetail.OrderUnit " & _
                  "FROM         PO  INNER JOIN " & _
                                        "PR ON PO.PRID = PR.PRID INNER JOIN " & _
                                        "OrderDetail ON PR.PRID = OrderDetail.PRID " & _
                 "WHERE     (PO.POID = " & poid & ")"
        rcs.Open sql, conn, 1, 3
        
        
        Dim i As Integer
        Dim J As Integer
        Dim item As IXMLDOMNode
        
        rootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab)
        Set subRootNode = xmldoc.createNode(1, "Item_Information", "")
        'subRootNode.appendChild xmlDoc.createTextNode(vbCrLf & vbTab & vbTab)
        If Not (rcs.BOF) Then rcs.MoveFirst
        For i = 0 To rcs.RecordCount - 1
                Set item = xmldoc.createNode(1, "Item", "")
                subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
                For J = 0 To rcs.Fields.count - 1
                        item.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab & vbTab)
                        Set chldNode = xmldoc.createElement(rcs.Fields(J).Name)
                        chldNode.Text = rcs.Fields(J).value
                        item.appendChild chldNode
                Next
                rcs.MoveNext
                 item.appendChild xmldoc.createTextNode(vbCrLf & vbTab & vbTab)
                 subRootNode.appendChild item
                'subRootNode.appendChild xmlDoc.createTextNode(vbCrLf & vbTab & vbTab)
        Next
        
        subRootNode.appendChild xmldoc.createTextNode(vbCrLf & vbTab)
        rootNode.appendChild subRootNode
        rootNode.appendChild xmldoc.createTextNode(vbCrLf)
        xmldoc.appendChild rootNode
        
        If dest = "" Then
                dest = App.Path & PNdir & "\Sent\PN" & poid & "_Sent.xml"
        End If
        xmldoc.save dest
        rcs.Close
        conn.Close
        
        FileName = dest
        
        Dim x As XML
        Set x = New XML
        x.InsertDOCTYPE dest, dtdPartnerPO, "Partner"
        Set x = Nothing
        
        Set rcs = Nothing
        Set conn = Nothing
        Set xmldoc = Nothing
        GenPartnerPO = True
Exit Function
msgerr:
        GenPartnerPO = False
        Message Error$
End Function

Public Sub UpdateDBFedEx(ByVal poid As String, ByRef serviceID As String)
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim maxid As Integer
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        
        rcs.Open "select max(serviceID) as maxid from fedexservice", conn, 1, 3
        If IsNull(rcs!maxid) Then
                maxid = 1
        Else
                maxid = rcs!maxid + 1
        End If
        rcs.Close
        
        rcs.Open "select * from FedExService where poid = " & poid, conn, 1, 3
        If rcs.RecordCount > 0 Then
                rcs!servicestatus = SSent
                rcs!UseServiceDate = Now
                serviceID = rcs!serviceID
                rcs.Update
        Else
                rcs.AddNew
                rcs!serviceID = maxid
                rcs!poid = poid
                rcs!servicestatus = SSent
                rcs!UseServiceDate = Now
                rcs.Update
                serviceID = maxid
        End If
        rcs.Close
        conn.Close
        
        Set rcs = Nothing
        Set conn = Nothing
End Sub


Public Sub UpdateDBCAT(ByVal poid As String, ByRef serviceID As String)
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim maxid As Integer
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        
        conn.ConnectionString = DBconString
        conn.CursorLocation = adUseClient
        conn.Open
        
        rcs.Open "select max(serviceID) as maxid from catservice", conn, 1, 3
        If IsNull(rcs!maxid) Then
                maxid = 1
        Else
                maxid = rcs!maxid + 1
        End If
        rcs.Close
        
        rcs.Open "select * from CATService where poid = " & poid, conn, 1, 3
        If rcs.RecordCount > 0 Then
                rcs!servicestatus = SSent
                rcs!UseServiceDate = Now
                serviceID = rcs!serviceID
                rcs.Update
        Else
                rcs.AddNew
                rcs!serviceID = maxid
                rcs!poid = poid
                rcs!servicestatus = SSent
                rcs!UseServiceDate = Now
                rcs.Update
                serviceID = maxid
        End If
        rcs.Close
        conn.Close
        
        Set rcs = Nothing
        Set conn = Nothing
End Sub

