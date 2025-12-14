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
    '****************************************************************
    'AccountSelectAccno : Select account number from user condition *
    '****************************************************************
    Public Function accountSelectAccNo(ByVal acct As Account) As Account
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAcctSelect As String = "SELECT * FROM ACCOUNT WHERE CUSTOMER_ID = '" & acct.GetOwner.GetcusID & "'"
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
    '********************************************************
    'SelectDataset : Select a group of account information  *
    '********************************************************
    Public Function SelectDataset(ByVal acct As Account) As DataSet
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAcctSelectDataset As String = "SELECT * FROM ACCOUNT WHERE CUSTOMER_ID LIKE '" & acct.GetOwner.GetcusID & "'"
        Dim daAcctSelectDataset As OracleDataAdapter = New OracleDataAdapter(sqlAcctSelectDataset, Conn)
        Dim dsAcctSelectDataset As New DataSet("acct_select_dataset")
        daAcctSelectDataset.Fill(dsAcctSelectDataset, "acct_select_dataset")

        Return dsAcctSelectDataset
    End Function
    '*******************************************************************
    Public Function SelectDatasetCheque(ByVal acct As Account) As DataSet
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAcctSelectDatasetCheq As String = "SELECT * FROM ACCOUNT WHERE CUSTOMER_ID LIKE '" & acct.GetOwner.GetcusID & "'"
        sqlAcctSelectDatasetCheq &= " AND ACC_TYPE LIKE 'Checking'"
        Dim daAcctSelectDatasetCheq As OracleDataAdapter = New OracleDataAdapter(sqlAcctSelectDatasetCheq, Conn)
        Dim dsAcctSelectDatasetCheq As New DataSet("acct_select_dataset_cheq")
        daAcctSelectDatasetCheq.Fill(dsAcctSelectDatasetCheq, "acct_select_dataset_cheq")

        Return dsAcctSelectDatasetCheq
    End Function
    '*******************************************************************
    Public Function accountCheckCus(ByVal acct As Account) As Account
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAcctCheckCus As String = "SELECT * FROM ACCOUNT WHERE CUSTOMER_ID LIKE '" & acct.GetOwner.GetcusID & "'"
        Dim daAcctCheckCus As OracleDataAdapter = New OracleDataAdapter(sqlAcctCheckCus, Conn)
        Dim dsAcctCheckCus As New DataSet("acct_check")
        daAcctCheckCus.Fill(dsAcctCheckCus, "acct_check")

        If dsAcctCheckCus.Tables("acct_check").Rows.Count = 0 Then
            Dim acctSelectedCus As New Account(acct.SetAccNo(0))
            Return acctSelectedCus
            Exit Function
        Else
            Dim acctSelected As New Account
            acctSelected.SetAccNo(dsAcctCheckCus.Tables("acct_check").Rows(0).Item(0))
            acctSelected.SetAccType(dsAcctCheckCus.Tables("acct_check").Rows(0).Item(1))
            acctSelected.SetCurrentBalance(dsAcctCheckCus.Tables("acct_check").Rows(0).Item(2))
            acctSelected.SetAvalBalance(dsAcctCheckCus.Tables("acct_check").Rows(0).Item(3))
            acctSelected.SetOwner(New Customer(dsAcctCheckCus.Tables("acct_check").Rows(0).Item(4)))
            acctSelected.SetOpenDate(dsAcctCheckCus.Tables("acct_check").Rows(0).Item(5))
            acctSelected.SetCloseDate(dsAcctCheckCus.Tables("acct_check").Rows(0).Item(6))

            Return acctSelected
            Exit Function
        End If
    End Function
    '*****************************************************************************
    Public Function accountInsert(ByVal acct As Account) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlAcctInsert As String = "SELECT * FROM ACCOUNT WHERE ACC_NO = '" & acct.GetAccNo & "'"
        Dim daAcctInsert As OracleDataAdapter = New OracleDataAdapter(sqlAcctInsert, Conn)
        Dim dsAcctInsert As New DataSet("acct_insert")
        daAcctInsert.Fill(dsAcctInsert, "acct_insert")

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

            Return 1 ' Insert Successed...
        End If
    End Function
    '*********************************************************************************
    Public Function accountUpdate(ByVal acct As Account) As Integer
        'Dim tr As OracleTransaction
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlAcctCheck As String = "SELECT * FROM ACCOUNT WHERE ACC_NO = '" & acct.GetAccNo & "'"
        Dim daAcctCheck As OracleDataAdapter = New OracleDataAdapter(sqlAcctCheck, Conn)
        Dim dsAcctCheck As New DataSet("acct_check")

        'tr = Conn.BeginTransaction

        daAcctCheck.Fill(dsAcctCheck, "acct_check")
        If dsAcctCheck.Tables("acct_check").Rows.Count = 0 Then
            Return -1 ' Cannot update account...
            Exit Function
        Else
            Try
                Dim sqlAcctUpdate = "UPDATE ACCOUNT SET CUR_BALANCE = '" & acct.GetCurrentBalance & "',AVAL_BALANCE = '" & acct.GetAvalBalance & "'"
                sqlAcctUpdate &= "WHERE ACC_NO = '" & acct.GetAccNo & "'"

                Dim daAcctUpdate = New OracleDataAdapter(sqlAcctUpdate, Conn)
                Dim dsAcctUpdate As New DataSet("acct_update")
                Dim oCB2 As New OracleCommandBuilder(daAcctUpdate)
                daAcctUpdate.Fill(dsAcctUpdate, "acct_update")
                'tr.Commit()
                Return 1
            Catch ex As Exception
                'tr.Rollback()
                Return -1
                Exit Function
            End Try
        End If
    End Function
End Class
