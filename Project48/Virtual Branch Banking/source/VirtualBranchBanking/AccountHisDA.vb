'************************************************************************************
'Class AccountHisDA  : Definition Class for Database connection to accountHis table *
'************************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class AccountHisDA
    Public Function accountHisInsert(ByVal acct As AccountHis) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlAcctHisInsert As String = "SELECT * FROM ACCOUNT_HIS WHERE ACC_HIS_ID = '" & acct.GetAccHisID & "'"
        Dim daAcctHisInsert As OracleDataAdapter = New OracleDataAdapter(sqlAcctHisInsert, Conn)
        Dim dsAcctHisInsert As New DataSet("acct_his_insert")
        daAcctHisInsert.Fill(dsAcctHisInsert, "acct_his_insert")

        If dsAcctHisInsert.Tables("acct_his_insert").Rows.Count <> 0 Then
            Return -1 ' this Account had already exist
            Exit Function
        Else
            sqlAcctHisInsert = "SELECT * FROM ACCOUNT_HIS ORDER BY ACC_HIS_ID DESC"
            daAcctHisInsert = New OracleDataAdapter(sqlAcctHisInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daAcctHisInsert)
            daAcctHisInsert.Fill(dsAcctHisInsert, "acct_his_insert")
            Dim oDR As DataRow = dsAcctHisInsert.Tables("acct_his_insert").NewRow()
            If dsAcctHisInsert.Tables("acct_his_insert").Rows.Count = 0 Then
                oDR.Item("ACC_HIS_ID") = 1
            Else
                oDR.Item("ACC_HIS_ID") = dsAcctHisInsert.Tables("acct_his_insert").Rows(0).Item("ACC_HIS_ID") + 1
            End If
            oDR.Item("ACC_NO") = acct.GetAccOwner.GetAccNo
            oDR.Item("DUE_DATE") = acct.GetDueDate
            oDR.Item("WITHDRAW") = acct.GetAmtWithdraw
            oDR.Item("DEPOSIT") = acct.GetAmtDeposit
            oDR.Item("FEE") = acct.GetFee
            oDR.Item("BALANCE") = acct.GetRemainBalance

            dsAcctHisInsert.Tables("acct_his_insert").Rows.Add(oDR)
            daAcctHisInsert.Update(dsAcctHisInsert, "acct_his_insert")

            Return 1 ' Insert Successed...
        End If
    End Function
    '*******************************************************************
    Public Function SelectDataset(ByVal acct As Account) As DataSet
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAcctHisSelectDataset As String = "SELECT * FROM ACCOUNT_HIS WHERE ACC_NO LIKE '" & acct.GetAccNo & "' ORDER BY DUE_DATE "
        Dim daAcctHisSelectDataset As OracleDataAdapter = New OracleDataAdapter(sqlAcctHisSelectDataset, Conn)
        Dim dsAcctHisSelectDataset As New DataSet("acct_his_select_dataset")
        daAcctHisSelectDataset.Fill(dsAcctHisSelectDataset, "acct_his_select_dataset")

        Return dsAcctHisSelectDataset
    End Function
    '*******************************************************************
End Class
