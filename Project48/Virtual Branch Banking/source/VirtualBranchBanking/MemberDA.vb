'*****************************************************************************
'Class MemberDA  : Definition Class for Database connection to member table  *
'*****************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class MemberDA
    Public Function MemberSelect(ByVal mem As Member) As Member
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlMemSelect As String = "SELECT * FROM MEMBER WHERE USERNAME = '" & mem.GetUsername & "'"
        Dim daMemSelect As OracleDataAdapter = New OracleDataAdapter(sqlMemSelect, Conn)
        Dim dsMemSelect As New DataSet("mem_select")
        daMemSelect.Fill(dsMemSelect, "mem_select")

        If dsMemSelect.Tables("mem_select").Rows.Count = 0 Then
            Dim memSelected As New Member(0)
            Return memSelected
            Exit Function
        Else
            Dim memSelected As New Member
            memSelected.SetMemberID(dsMemSelect.Tables("mem_select").Rows(0).Item(0))
            memSelected.SetUsername(dsMemSelect.Tables("mem_select").Rows(0).Item(1))
            memSelected.SetPassword(dsMemSelect.Tables("mem_select").Rows(0).Item(2))
            memSelected.SetMemExpDate(dsMemSelect.Tables("mem_select").Rows(0).Item(3))
            memSelected.SetMemStatus(dsMemSelect.Tables("mem_select").Rows(0).Item(4))
            memSelected.SetCusID(dsMemSelect.Tables("mem_select").Rows(0).Item(5))
            Return memSelected
            Exit Function
        End If
    End Function
    Public Function MemberInsert(ByVal mem As Member) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlMemInsert As String = "SELECT * FROM MEMBER WHERE MEMBER_ID = '" & mem.GetMemberID & "'"
        Dim daMemInsert As OracleDataAdapter = New OracleDataAdapter(sqlMemInsert, Conn)
        Dim dsMemInsert As New DataSet("mem_insert")
        daMemInsert.Fill(dsMemInsert, "mem_insert")

        If dsMemInsert.Tables("mem_insert").Rows.Count <> 0 Then
            Return -1 ' this member had already exist
            Exit Function
        Else
            sqlMemInsert = "SELECT * FROM MEMBER ORDER BY MEMBER_ID DESC"
            daMemInsert = New OracleDataAdapter(sqlMemInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daMemInsert)
            daMemInsert.Fill(dsMemInsert, "mem_insert")
            Dim oDR As DataRow = dsMemInsert.Tables("mem_insert").NewRow()
            If dsMemInsert.Tables("mem_insert").Rows.Count = 0 Then
                oDR.Item("MEMBER_ID") = 1
            Else
                oDR.Item("MEMBER_ID") = dsMemInsert.Tables("mem_insert").Rows(0).Item("MEMBER_ID") + 1
            End If
            oDR.Item("USERNAME") = mem.GetUsername
            oDR.Item("PASSWORD") = mem.GetPassword
            oDR.Item("MEM_EXP_DATE") = mem.GetMemExpDate
            oDR.Item("MEM_STATUS") = mem.GetMemStatus
            oDR.Item("CUSTOMER_ID") = mem.GetcusID

            dsMemInsert.Tables("mem_insert").Rows.Add(oDR)
            daMemInsert.Update(dsMemInsert, "mem_insert")

            Return 1 ' Insert Successed...
        End If
    End Function
    Public Function MemberUpdateUser(ByVal mem As Member) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlMemUpdateUser As String = "SELECT * FROM MEMBER WHERE MEMBER_ID = '" & mem.GetMemberID & "'"
        Dim daMemUpdateUser As OracleDataAdapter = New OracleDataAdapter(sqlMemUpdateUser, Conn)
        Dim dsMemUpdateUser As New DataSet("mem_update_user")
        daMemUpdateUser.Fill(dsMemUpdateUser, "mem_update_user")

        If dsMemUpdateUser.Tables("mem_update_user").Rows.Count <> 0 Then
            Return -1 ' this member had already exist
            Exit Function
        Else
            sqlMemUpdateUser = "UPDATE MEMBER SET USERNAME = '" & mem.GetUsername & "' WHERE MEMBER_ID LIKE '" & mem.GetMemberID & "'"
            Dim memCommandUser As New OracleCommand(sqlMemUpdateUser, Conn)
            memCommandUser.Connection.Open()
            memCommandUser.ExecuteNonQuery()
            Conn.Close()
            Return 1 ' Update Successed...
        End If
    End Function
    Public Function MemberUpdatePass(ByVal mem As Member) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlMemUpdatePass As String = "SELECT * FROM MEMBER WHERE MEMBER_ID = '" & mem.GetMemberID & "'"
        Dim daMemUpdatePass As OracleDataAdapter = New OracleDataAdapter(sqlMemUpdatePass, Conn)
        Dim dsMemUpdatePass As New DataSet("mem_update_pass")
        daMemUpdatePass.Fill(dsMemUpdatePass, "mem_update_pass")

        If dsMemUpdatePass.Tables("mem_update_pass").Rows.Count <> 0 Then
            Return -1 ' this member had already exist
            Exit Function
        Else
            sqlMemUpdatePass = "UPDATE MEMBER SET PASSWORD = '" & mem.GetPassword & "' WHERE MEMBER_ID LIKE '" & mem.GetMemberID & "'"
            Dim memCommandPass As New OracleCommand(sqlMemUpdatePass, Conn)
            memCommandPass.Connection.Open()
            memCommandPass.ExecuteNonQuery()
            Conn.Close()
            Return 1 ' Update Successed...
        End If
    End Function
End Class
