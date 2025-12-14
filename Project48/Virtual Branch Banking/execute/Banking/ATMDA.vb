'****************************************************************************
'Class AdminDA  : Definition Class for Database connection to ATM table     *
'****************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class ATMDA
    Public Function AtmSelect(ByVal atm As ATM) As ATM
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAtmSelect As String = "SELECT * FROM ATM WHERE ATM_CODE = '" & atm.GetAtmCode & "'"
        Dim daAtmSelect As OracleDataAdapter = New OracleDataAdapter(sqlAtmSelect, Conn)
        Dim dsAtmSelect As New DataSet("atm_select")
        daAtmSelect.Fill(dsAtmSelect, "atm_select")

        If dsAtmSelect.Tables("atm_select").Rows.Count = 0 Then
            Dim atmSelected As New ATM(0)
            Return atmSelected
            Exit Function
        Else
            Dim atmSelected As New ATM
            atmSelected.SetAtmCode(dsAtmSelect.Tables("atm_select").Rows(0).Item(0))
            atmSelected.SetBankCode(New Bank(dsAtmSelect.Tables("atm_select").Rows(0).Item(1)))
            atmSelected.SetAtmLocation(dsAtmSelect.Tables("atm_select").Rows(0).Item(2))
            atmSelected.SetAtmArea(dsAtmSelect.Tables("atm_select").Rows(0).Item(3))
            atmSelected.SetAtmCity(dsAtmSelect.Tables("atm_select").Rows(0).Item(4))
            atmSelected.SetSystemUsed(dsAtmSelect.Tables("atm_select").Rows(0).Item(5))
            Return atmSelected
            Exit Function
        End If
    End Function
    Public Function AtmInsert(ByVal atm As ATM) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlAtmInsert As String = "SELECT * FROM ATM WHERE ATM_CODE = '" & atm.GetAtmCode & "'"
        Dim daAtmInsert As OracleDataAdapter = New OracleDataAdapter(sqlAtmInsert, Conn)
        Dim dsAtmInsert As New DataSet("atm_insert")
        daAtmInsert.Fill(dsAtmInsert, "atm_insert")

        If dsAtmInsert.Tables("atm_insert").Rows.Count <> 0 Then
            Return -1 ' this ATM had already exist
            Exit Function
        Else
            sqlAtmInsert = "SELECT * FROM ATM ORDER BY ATM_CODE DESC"
            daAtmInsert = New OracleDataAdapter(sqlAtmInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daAtmInsert)
            daAtmInsert.Fill(dsAtmInsert, "atm_insert")
            Dim oDR As DataRow = dsAtmInsert.Tables("atm_insert").NewRow()

            oDR.Item("ATM_CODE") = atm.GetAtmCode
            oDR.Item("BANK_CODE") = atm.GetBankCode.GetBankID
            oDR.Item("ATM_LOCATION") = atm.GetAtmLocation
            oDR.Item("ATM_AREA") = atm.GetAtmArea
            oDR.Item("ATM_CITY") = atm.GetAtmCity
            oDR.Item("SYSTEM_USED") = atm.GetSystemUsed

            dsAtmInsert.Tables("atm_insert").Rows.Add(oDR)
            daAtmInsert.Update(dsAtmInsert, "atm_insert")

            Return 1 ' Insert Successed...
        End If
    End Function
End Class
