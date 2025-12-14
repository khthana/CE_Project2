'********************************************************************************
'Class AdminDA  : Definition Class for Database connection to admin table       *
'********************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class AdminDA
    Public Function adminSelect(ByVal admin As Administrator) As Administrator
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAdminSelect As String = "SELECT * FROM ADMIN WHERE USERNAME = '" & admin.GetUsername & "'"
        sqlAdminSelect &= "AND PASSWORD = '" & admin.GetPassword & "'"
        Dim daAdminSelect As OracleDataAdapter = New OracleDataAdapter(sqlAdminSelect, Conn)
        Dim dsAdminSelect As New DataSet("admin_select")
        daAdminSelect.Fill(dsAdminSelect, "admin_select")

        If dsAdminSelect.Tables("admin_select").Rows.Count = 0 Then
            Dim adminSelected As New Administrator(0)
            Return adminSelected
            Exit Function
        Else
            Dim adminSelected As New Administrator
            adminSelected.SetAdminID(dsAdminSelect.Tables("admin_select").Rows(0).Item(0))
            adminSelected.SetUsername(dsAdminSelect.Tables("admin_select").Rows(0).Item(1))
            adminSelected.SetPassword(dsAdminSelect.Tables("admin_select").Rows(0).Item(2))
            Return adminSelected
            Exit Function
        End If
    End Function
    Public Function adminInsert(ByVal admin As Administrator) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlAdminInsert As String = "SELECT * FROM ADMIN WHERE USERNAME = '" & admin.GetUsername & "'"
        Dim daAdminInsert As OracleDataAdapter = New OracleDataAdapter(sqlAdminInsert, Conn)
        Dim dsAdminInsert As New DataSet("admin_insert")
        daAdminInsert.Fill(dsAdminInsert, "admin_insert")

        If dsAdminInsert.Tables("admin_insert").Rows.Count <> 0 Then
            Return -1 ' this username has already exist
            Exit Function
        Else
            sqlAdminInsert = "SELECT * FROM ADMIN ORDER BY ADMIN_ID DESC"
            daAdminInsert = New OracleDataAdapter(sqlAdminInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daAdminInsert)
            daAdminInsert.Fill(dsAdminInsert, "admin_insert")
            Dim oDR As DataRow = dsAdminInsert.Tables("admin_insert").NewRow()
            If dsAdminInsert.Tables("admin_insert").Rows().Count = 0 Then
                oDR.Item("ADMIN_ID") = 1
            Else
                oDR.Item("ADMIN_ID") = dsAdminInsert.Tables("admin_insert").Rows(0).Item("ADMIN_ID") + 1
            End If
            oDR.Item("USERNAME") = admin.GetUsername
            oDR.Item("PASSWORD") = admin.GetPassword

            dsAdminInsert.Tables("admin_insert").Rows.Add(oDR)
            daAdminInsert.Update(dsAdminInsert, "admin_insert")

            Return 1 ' Insert Successed...
        End If
    End Function
End Class
