'******************************************************************************
'Class AccountDA  : Definition Class for Database connection to account table *
'******************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class AccountDA
    '************************************************
    'AccountSelect : select account information     *
    '************************************************
    Public Function accountSelect(ByVal acct As Account) As Account
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAcctSelect As String = "SELECT * FROM ACCOUNT WHERE ACC_NO = '" & acct.GetAccNo & "'"
        Dim daAcctSelect As OracleDataAdapter = New OracleDataAdapter(sqlAcctSelect, Conn)
        Dim dsAcctSelect As New DataSet("acct_select")
        daAcctSelect.Fill(dsAcctSelect, "acct_select")

        If dsAcctSelect.Tables("acct_select").Rows.Count = 0 Then
            Dim acctSelected As New Account(acct.SetAccNo(0))
            Return acctSelected
            Exit Function
        Else
            Dim acctSelected As New Account
            acctSelected.SetAccNo(dsAcctSelect.Tables("acct_select").Rows(0).Item(0))
            acctSelected.SetAccType(dsAcctSelect.Tables("acct_select").Rows(0).Item(1))
            acctSelected.SetCurrentBalance(dsAcctSelect.Tables("acct_select").Rows(0).Item(2))
            acctSelected.SetAvalBalance(dsAcctSelect.Tables("acct_select").Rows(0).Item(3))
            acctSelected.SetOwner(New Customer(dsAcctSelect.Tables("acct_select").Rows(0).Item(4)))
            acctSelected.SetOpenDate(dsAcctSelect.Tables("acct_select").Rows(0).Item(5))
            acctSelected.SetCloseDate(dsAcctSelect.Tables("acct_select").Rows(0).Item(6))

            Return acctSelected
            Exit Function
        End If
    End Function
    '**************************************************
    'AccountInsert : Insert new account to the system *
    '**************************************************
    Public Function accountInsert(ByVal acct As Account) As Integer
        Dim i As Integer = 1
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlAcctInsert As String = "SELECT * FROM ACCOUNT WHERE ACC_NO = '" & acct.GetAccNo & "'"
        Dim daAcctInsert As OracleDataAdapter = New OracleDataAdapter(sqlAcctInsert, Conn)
        Dim dsAcctInsert As New DataSet("acct_insert")
        daAcctInsert.Fill(dsAcctInsert, "acct_insert")
        '****************************
        If dsAcctInsert.Tables("acct_insert").Rows.Count <> 0 Then
            Return -1 ' this Account had already exist
            Exit Function
        Else
            sqlAcctInsert = "SELECT * FROM ACCOUNT ORDER BY ACC_NO DESC"
            daAcctInsert = New OracleDataAdapter(sqlAcctInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daAcctInsert)
            daAcctInsert.Fill(dsAcctInsert, "acct_insert")
            Dim oDR As DataRow = dsAcctInsert.Tables("acct_insert").NewRow()

            oDR.Item("ACC_NO") = acct.GetAccNo
            oDR.Item("ACC_TYPE") = acct.GetAccType
            oDR.Item("CUR_BALANCE") = acct.GetCurrentBalance
            oDR.Item("AVAL_BALANCE") = acct.GetAvalBalance
            oDR.Item("CUSTOMER_ID") = acct.GetOwner.GetcusID
            oDR.Item("OPEN_DATE") = acct.GetOpenDate
            oDR.Item("CLOSE_DATE") = acct.GetCloseDate

            dsAcctInsert.Tables("acct_insert").Rows.Add(oDR)
            daAcctInsert.Update(dsAcctInsert, "acct_insert")
            '*************************************
            If (acct.GetAccType = "Checking") Then
                For i = 1 To 30
                    Dim sqlAcctInsertCheck As String = "SELECT * FROM CHECKING ORDER BY CHECK_CODE DESC"
                    Dim daAcctInsertCheck As New OracleDataAdapter(sqlAcctInsertCheck, Conn)
                    Dim dsAcctInsertCheck As New DataSet("acct_insert_check")
                    Dim oCB2 As New OracleCommandBuilder(daAcctInsertCheck)
                    daAcctInsertCheck.Fill(dsAcctInsertCheck, "acct_insert_check")
                    Dim oDR2 As DataRow = dsAcctInsertCheck.Tables("acct_insert_check").NewRow()
                    If dsAcctInsertCheck.Tables("acct_insert_check").Rows.Count = 0 Then
                        oDR2.Item("CHECK_CODE") = 1
                    Else
                        oDR2.Item("CHECK_CODE") = dsAcctInsertCheck.Tables("acct_insert_check").Rows(0).Item("CHECK_CODE") + 1
                    End If
                    oDR2.Item("CHECK_NO") = i
                    oDR2.Item("ACC_NO") = acct.GetAccNo
                    oDR2.Item("CHECK_STATUS") = "active"
                    oDR2.Item("CHECK_TYPE") = "CashCheque"

                    dsAcctInsertCheck.Tables("acct_insert_check").Rows.Add(oDR2)
                    daAcctInsertCheck.Update(dsAcctInsertCheck, "acct_insert_check")
                Next
            End If
            Return 1 ' Insert Successed...
        End If
    End Function
End Class
