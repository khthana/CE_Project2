'*******************************************************************************
'Class PaymentDA  : Definition Class for Database connection to payment table  *
'*******************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class PaymentDA
    Public Function PaymentInsert(ByVal pay As Payment) As Integer
        Dim i As Integer = 1
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlPayInsert As String = "SELECT * FROM PAYMENT WHERE PAYMENT_ID = '" & pay.GetPaymentID & "'"
        Dim daPayInsert As OracleDataAdapter = New OracleDataAdapter(sqlPayInsert, Conn)
        Dim dsPayInsert As New DataSet("pay_insert")
        daPayInsert.Fill(dsPayInsert, "pay_insert")
        '****************************
        If dsPayInsert.Tables("pay_insert").Rows.Count <> 0 Then
            Return -1 ' this payment id had already exist
            Exit Function
        Else
            sqlPayInsert = "SELECT * FROM PAYMENT ORDER BY PAYMENT_ID DESC"
            daPayInsert = New OracleDataAdapter(sqlPayInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daPayInsert)
            daPayInsert.Fill(dsPayInsert, "pay_insert")
            Dim oDR As DataRow = dsPayInsert.Tables("pay_insert").NewRow()

            oDR.Item("PAYMENT_ID") = pay.GetPaymentID
            oDR.Item("PAYMENT_TYPE") = pay.GetPaymentType
            oDR.Item("MERCHANT_NAME") = pay.GetMerChant.GetMerchantName
            Dim nameTmp As String = pay.GetCustomerUsed.GetEnName + " " + pay.GetCustomerUsed.GetEnSurname
            oDR.Item("CUSTOMER_NAME") = nameTmp
            oDR.Item("PAY_BY") = pay.GetPaymentBy
            oDR.Item("AMOUNT") = pay.GetPaymentAmount
            oDR.Item("DUE_DATE") = pay.GetPaymentDueDate

            dsPayInsert.Tables("pay_insert").Rows.Add(oDR)
            daPayInsert.Update(dsPayInsert, "pay_insert")
            Return 1 ' Insert Successed...
        End If
    End Function
    '*******************************************************************
    Public Function MerSelectPayDataset(ByVal pay As Payment) As DataSet
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlPayHisSelectDataset As String = "SELECT * FROM PAYMENT WHERE MERCHANT_ID LIKE '" & pay.GetMerChant.GetMerchantID & "' ORDER BY DUE_DATE "
        Dim daPayHisSelectDataset As OracleDataAdapter = New OracleDataAdapter(sqlPayHisSelectDataset, Conn)
        Dim dsPayHisSelectDataset As New DataSet("pay_his_select_dataset")
        daPayHisSelectDataset.Fill(dsPayHisSelectDataset, "pay_his_select_dataset")

        Return dsPayHisSelectDataset
    End Function
    Public Function CusPayselectDataset(ByVal cus As Customer) As DataSet
        Dim nameTmp As String = cus.GetEnName + " " + cus.GetEnSurname
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlPayHisSelectDataset As String = "SELECT * FROM PAYMENT WHERE CUSTOMER_NAME LIKE '" & nameTmp & "' ORDER BY DUE_DATE "
        Dim daPayHisSelectDataset As OracleDataAdapter = New OracleDataAdapter(sqlPayHisSelectDataset, Conn)
        Dim dsPayHisSelectDataset As New DataSet("pay_his_select_dataset")
        daPayHisSelectDataset.Fill(dsPayHisSelectDataset, "pay_his_select_dataset")

        Return dsPayHisSelectDataset
    End Function
End Class
