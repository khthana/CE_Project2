Attribute VB_Name = "mdlXML"
Option Explicit

Public Function RecvPartnerPO(ByVal xmlPath As String) As Boolean
        Dim xmlDoc As DOMDocument30
        Dim nodeList As IXMLDOMNodeList
        Dim nodelist2 As IXMLDOMNodeList
        Dim conn As ADODB.Connection
        Dim rcs As ADODB.Recordset
        Dim serviceID As String
        Dim i As Integer
        Dim j As Integer
        
        'On Error GoTo msgerr:
        
        Set conn = New ADODB.Connection
        Set rcs = New ADODB.Recordset
        Set xmlDoc = New DOMDocument30
        conn.ConnectionString = DBconString
        conn.Open
        
        xmlDoc.async = False
        xmlDoc.validateOnParse = False
        xmlDoc.Load xmlPath
        
        serviceID = xmlDoc.documentElement.getElementsByTagName("ServiceID").Item(0).Text
        rcs.Open "select * from PO where serviceId = " & serviceID, conn, 1, 2
        If rcs.RecordCount > 0 Then
                rcs!poaddress = xmlDoc.documentElement.getElementsByTagName("POAddress").Item(0).Text
                rcs!poshipprice = xmlDoc.documentElement.getElementsByTagName("POShipPrice").Item(0).Text
                rcs!BuyerName = xmlDoc.documentElement.getElementsByTagName("BuyerName").Item(0).Text
                rcs!buyeraddress = xmlDoc.documentElement.getElementsByTagName("BuyerAddress").Item(0).Text
                rcs!BuyerProvince = xmlDoc.documentElement.getElementsByTagName("BuyerProvince").Item(0).Text
                rcs!SellerName = xmlDoc.documentElement.getElementsByTagName("SellerName").Item(0).Text
                rcs!SellerAddress = xmlDoc.documentElement.getElementsByTagName("SellerAddress").Item(0).Text
                rcs!SellerProvince = xmlDoc.documentElement.getElementsByTagName("SellerProvince").Item(0).Text
                rcs.Update
        Else
                rcs.AddNew
                rcs!serviceID = serviceID
                rcs!poaddress = xmlDoc.documentElement.getElementsByTagName("POAddress").Item(0).Text
                rcs!poshipprice = xmlDoc.documentElement.getElementsByTagName("POShipPrice").Item(0).Text
                rcs!BuyerName = xmlDoc.documentElement.getElementsByTagName("BuyerName").Item(0).Text
                rcs!buyeraddress = xmlDoc.documentElement.getElementsByTagName("BuyerAddress").Item(0).Text
                rcs!BuyerProvince = xmlDoc.documentElement.getElementsByTagName("BuyerProvince").Item(0).Text
                rcs!SellerName = xmlDoc.documentElement.getElementsByTagName("SellerName").Item(0).Text
                rcs!SellerAddress = xmlDoc.documentElement.getElementsByTagName("SellerAddress").Item(0).Text
                rcs!SellerProvince = xmlDoc.documentElement.getElementsByTagName("SellerProvince").Item(0).Text
                rcs.Update
        End If
        rcs.Close
        
        conn.Execute "Delete from PODetail where serviceID  = " & serviceID
        
        rcs.Open "PODetail", conn, 1, 3
        Set nodeList = xmlDoc.documentElement.getElementsByTagName("Item")
        For i = 0 To nodeList.Length - 1
                rcs.AddNew
                Set nodelist2 = nodeList(i).childNodes
                For j = 0 To nodelist2.Length - 1
                        rcs(nodelist2(j).nodeName) = nodelist2(j).Text
                Next
                rcs!serviceID = serviceID
                rcs!ItemNo = i + 1
                rcs.Update
        Next
        rcs.Close
        Set rcs = Nothing
        Set conn = Nothing
        Set xmlDoc = Nothing
        RecvPartnerPO = True
Exit Function
msgerr:
        Message Error$
        RecvPartnerPO = False
End Function
