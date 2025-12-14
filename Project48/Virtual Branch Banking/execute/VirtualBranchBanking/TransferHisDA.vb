'***********************************************************************************
'Class TransfeHisDA  : Definition Class for Database connection to transfer table  *
'***********************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class TransferHisDA
    Public Function SaveTransfer(ByVal transferHis As TransferHis) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlTransferHisInsert As String = "SELECT * FROM TRANSFER_HIS WHERE TRANSFER_ID = '" & transferHis.GetTransferHisID & "'"
        Dim daTransferHisInsert As OracleDataAdapter = New OracleDataAdapter(sqlTransferHisInsert, Conn)
        Dim dsTransferHisInsert As New DataSet("transfer_his_insert")
        daTransferHisInsert.Fill(dsTransferHisInsert, "transfer_his_insert")

        If dsTransferHisInsert.Tables("transfer_his_insert").Rows.Count <> 0 Then
            Return -1 ' this transfer id had already exist
            Exit Function
        Else
            sqlTransferHisInsert = "SELECT * FROM TRANSFER_HIS ORDER BY TRANSFER_ID DESC"
            daTransferHisInsert = New OracleDataAdapter(sqlTransferHisInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daTransferHisInsert)
            daTransferHisInsert.Fill(dsTransferHisInsert, "transfer_his_insert")
            Dim oDR As DataRow = dsTransferHisInsert.Tables("transfer_his_insert").NewRow()
            If dsTransferHisInsert.Tables("transfer_his_insert").Rows.Count = 0 Then
                oDR.Item("TRANSFER_ID") = 1
            Else
                oDR.Item("TRANSFER_ID") = dsTransferHisInsert.Tables("transfer_his_insert").Rows(0).Item("TRANSFER_ID") + 1
            End If
            oDR.Item("DUE_DATE") = transferHis.GetDueDate
            oDR.Item("FROM_ACCOUNT") = transferHis.GetFromAccount.GetAccNo
            oDR.Item("FROM_ACCOUNT_TYPE") = transferHis.GetFromAccount.GetAccType
            oDR.Item("TO_ACCOUNT") = transferHis.GetToAccount.GetAccNo
            oDR.Item("TO_ACCOUNT_TYPE") = transferHis.GetToAccount.GetAccType
            oDR.Item("AMOUNT") = transferHis.GetAmount
            oDR.Item("FEE") = transferHis.GetFee
            oDR.Item("CUSTOMER_ID") = transferHis.GetCusUsed.GetcusID


            dsTransferHisInsert.Tables("transfer_his_insert").Rows.Add(oDR)
            daTransferHisInsert.Update(dsTransferHisInsert, "transfer_his_insert")

            Return 1 ' Insert Successed...
        End If
    End Function
    '*******************************************************************
    Public Function SelectDataset(ByVal transferHis As TransferHis) As DataSet
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlTransferHisSelectDataset As String = "SELECT * FROM TRANSFER_HIS WHERE CUSTOMER_ID LIKE '" & transferHis.GetCusUsed.GetcusID & "'ORDER BY DUE_DATE"
        Dim daTransferHisSelectDataset As OracleDataAdapter = New OracleDataAdapter(sqlTransferHisSelectDataset, Conn)
        Dim dsTransferHisSelectDataset As New DataSet("transfer_his_select_dataset")
        daTransferHisSelectDataset.Fill(dsTransferHisSelectDataset, "transfer_his_select_dataset")

        Return dsTransferHisSelectDataset
    End Function
End Class
