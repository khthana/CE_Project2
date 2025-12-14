'******************************************************************************
'Class ForexDA  : Definition Class for Database connection to forex table     *
'******************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class ForexDA
    '************************************************
    'Select from database
    '************************************************
    Public Function ForexSelect(ByVal forex As Forex) As Forex
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlForexSelect As String = "SELECT * FROM FOREX WHERE CURRENCY = '" & forex.GetCurrency & "'"
        Dim daForexSelect As OracleDataAdapter = New OracleDataAdapter(sqlForexSelect, Conn)
        Dim dsForexSelect As New DataSet("forex_select")
        daForexSelect.Fill(dsForexSelect, "forex_select")

        If dsForexSelect.Tables("forex_select").Rows.Count = 0 Then
            Dim forexSelected As New Forex("", 0)
            Return forexSelected
            Exit Function
        Else
            Dim forexSelected As New Forex
            forexSelected.SetCurrency(dsForexSelect.Tables("forex_select").Rows(0).Item(1))
            forexSelected.SetRate(dsForexSelect.Tables("forex_select").Rows(0).Item(2))
            Return forexSelected
            Exit Function
        End If
    End Function
    '*********************************************
    'Insert to database
    '*********************************************
    Public Function ForexInsert(ByVal forex As Forex) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlForexInsert As String = "SELECT * FROM FOREX WHERE CURRENCY = '" & forex.GetCurrency & "'"
        Dim daForexInsert As OracleDataAdapter = New OracleDataAdapter(sqlForexInsert, Conn)
        Dim dsForexInsert As New DataSet("forex_insert")
        daForexInsert.Fill(dsForexInsert, "forex_insert")

        If dsForexInsert.Tables("forex_insert").Rows.Count <> 0 Then
            Return -1 ' this Card had already exist
            Exit Function
        Else
            sqlForexInsert = "SELECT * FROM FOREX ORDER BY FOREX_ID DESC"
            daForexInsert = New OracleDataAdapter(sqlForexInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daForexInsert)
            daForexInsert.Fill(dsForexInsert, "forex_insert")
            Dim oDR As DataRow = dsForexInsert.Tables("forex_insert").NewRow()
            If dsForexInsert.Tables("forex_insert").Rows.Count = 0 Then
                oDR.Item("FOREX_ID") = 1
            Else
                oDR.Item("FOREX_ID") = dsForexInsert.Tables("forex_insert").Rows(0).Item("FOREX_ID") + 1
            End If
            oDR.Item("CURRENCY") = forex.GetCurrency
            oDR.Item("RATE") = forex.GetRate

            dsForexInsert.Tables("forex_insert").Rows.Add(oDR)
            daForexInsert.Update(dsForexInsert, "forex_insert")

            Return 1 ' Insert Successed...
        End If
    End Function
End Class
