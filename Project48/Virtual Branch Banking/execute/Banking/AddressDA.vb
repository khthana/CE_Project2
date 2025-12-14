'******************************************************************************
'Class AddressDA  : Definition Class for Database connection to address table *
'******************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class AddressDA
    Public Function addressSelect(ByVal addr As Address) As Address
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlAddrSelect As String = "SELECT * FROM ADDRESS WHERE CUSTOMER_ID = '" & addr.GetCustomer.GetcusID & "'"
        Dim daAddrSelect As OracleDataAdapter = New OracleDataAdapter(sqlAddrSelect, Conn)
        Dim dsAddrSelect As New DataSet("addr_select")
        daAddrSelect.Fill(dsAddrSelect, "addr_select")

        If dsAddrSelect.Tables("addr_select").Rows.Count = 0 Then
            Dim addrSelected As New Address(addr.GetCustomer.SetCusID(0))
            Return addrSelected
            Exit Function
        Else
            Dim addrSelected As New Address
            addrSelected.SetCustomer(New Customer(dsAddrSelect.Tables("addr_select").Rows(0).Item(0)))
            addrSelected.SetAddType(dsAddrSelect.Tables("addr_select").Rows(0).Item(1))
            addrSelected.SetAddType(dsAddrSelect.Tables("addr_select").Rows(0).Item(2))
            addrSelected.SetAddType(dsAddrSelect.Tables("addr_select").Rows(0).Item(3))
            addrSelected.SetAddType(dsAddrSelect.Tables("addr_select").Rows(0).Item(4))
            addrSelected.SetAddType(dsAddrSelect.Tables("addr_select").Rows(0).Item(5))
            addrSelected.SetAddType(dsAddrSelect.Tables("addr_select").Rows(0).Item(6))
            addrSelected.SetAddType(dsAddrSelect.Tables("addr_select").Rows(0).Item(7))
            addrSelected.SetAddType(dsAddrSelect.Tables("addr_select").Rows(0).Item(8))
            Return addrSelected
            Exit Function
        End If
    End Function
    Public Function addressInsert(ByVal addr As Address) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlAddrInsert As String = "SELECT * FROM ADDRESS WHERE CUSTOMER_ID = '" & addr.GetCustomer.GetcusID & "'"
        Dim daAddrInsert As OracleDataAdapter = New OracleDataAdapter(sqlAddrInsert, Conn)
        Dim dsAddrInsert As New DataSet("addr_insert")
        daAddrInsert.Fill(dsAddrInsert, "addr_insert")

        If dsAddrInsert.Tables("addr_insert").Rows.Count <> 0 Then
            Return -1 ' this username has already exist
            Exit Function
        Else
            sqlAddrInsert = "SELECT * FROM ADDRESS ORDER BY CUSTOMER_ID DESC"
            daAddrInsert = New OracleDataAdapter(sqlAddrInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daAddrInsert)
            daAddrInsert.Fill(dsAddrInsert, "addr_insert")
            Dim oDR As DataRow = dsAddrInsert.Tables("addr_insert").NewRow()

            oDR.Item("CUSTOMER_ID") = addr.GetCustomer.GetcusID
            oDR.Item("ADDRESS_TYPE") = addr.GetAddType
            oDR.Item("ADDRESS_NO") = addr.GetAddNo
            oDR.Item("SOI") = addr.GetSoi
            oDR.Item("STREET") = addr.GetStreet
            oDR.Item("DISTRICT") = addr.GetDistrict
            oDR.Item("CITY") = addr.GetCity
            oDR.Item("STATE") = addr.GetState
            oDR.Item("POSTCODE") = addr.GetPostCode

            dsAddrInsert.Tables("addr_insert").Rows.Add(oDR)
            daAddrInsert.Update(dsAddrInsert, "addr_insert")

            Return 1 ' Insert Successed...
        End If
    End Function
End Class
