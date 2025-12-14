'************************************************************************************
'Class CustomerDA  : Definition Class for Database connection to customer table     *
'************************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class CustomerDA
    Public Function cusSelect(ByVal customer As Customer) As Customer
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlCusSelect As String = "SELECT * FROM CUSTOMER WHERE CUSTOMER_ID = '" & customer.GetcusID & "'"
        Dim daCusSelect As OracleDataAdapter = New OracleDataAdapter(sqlCusSelect, Conn)
        Dim dsCusSelect As New DataSet("cus_select")
        daCusSelect.Fill(dsCusSelect, "cus_select")

        If dsCusSelect.Tables("cus_select").Rows.Count = 0 Then
            Dim cusSelected As New Customer(0)
            Return cusSelected
            Exit Function
        Else
            Dim cusSelected As New Customer
            cusSelected.SetCusID(dsCusSelect.Tables("cus_select").Rows(0).Item(0))
            cusSelected.SetEnName(dsCusSelect.Tables("cus_select").Rows(0).Item(1))
            cusSelected.SetEnSurname(dsCusSelect.Tables("cus_select").Rows(0).Item(2))
            cusSelected.SetThName(dsCusSelect.Tables("cus_select").Rows(0).Item(3))
            cusSelected.SetThSurname(dsCusSelect.Tables("cus_select").Rows(0).Item(4))
            cusSelected.SetdBirth(dsCusSelect.Tables("cus_select").Rows(0).Item(5))
            cusSelected.SetmBirth(dsCusSelect.Tables("cus_select").Rows(0).Item(6))
            cusSelected.SetyBirth(dsCusSelect.Tables("cus_select").Rows(0).Item(7))
            cusSelected.SetAge(dsCusSelect.Tables("cus_select").Rows(0).Item(8))
            cusSelected.SetGender(dsCusSelect.Tables("cus_select").Rows(0).Item(9))
            cusSelected.SetEmail(dsCusSelect.Tables("cus_select").Rows(0).Item(10))
            cusSelected.SetOccu(dsCusSelect.Tables("cus_select").Rows(0).Item(11))
            cusSelected.SetSalary(dsCusSelect.Tables("cus_select").Rows(0).Item(12))
            cusSelected.SetHomePhone(dsCusSelect.Tables("cus_select").Rows(0).Item(13))
            cusSelected.SetOfficePhone(dsCusSelect.Tables("cus_select").Rows(0).Item(14))
            cusSelected.SetMobilePhone(dsCusSelect.Tables("cus_select").Rows(0).Item(15))
            cusSelected.SetFaxNo(dsCusSelect.Tables("cus_select").Rows(0).Item(16))
            cusSelected.SetStatus(dsCusSelect.Tables("cus_select").Rows(0).Item(17))
            
            Return cusSelected
            Exit Function
        End If
    End Function
    Public Function cusInsert(ByVal customer As Customer) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlCusInsert As String = "SELECT * FROM CUSTOMER WHERE CUSTOMER_ID = '" & customer.GetcusID & "'"
        Dim daCusInsert As OracleDataAdapter = New OracleDataAdapter(sqlCusInsert, Conn)
        Dim dsCusInsert As New DataSet("cus_insert")
        daCusInsert.Fill(dsCusInsert, "cus_insert")
        If dsCusInsert.Tables("cus_insert").Rows.Count <> 0 Then
            Return -1 ' Customer had alreay exist in database
            Exit Function
        Else
            sqlCusInsert = "SELECT * FROM CUSTOMER ORDER BY CUSTOMER_ID DESC"
            daCusInsert = New OracleDataAdapter(sqlCusInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daCusInsert)
            daCusInsert.Fill(dsCusInsert, "cus_insert")
            Dim oDR As DataRow = dsCusInsert.Tables("cus_insert").NewRow()
            oDR.Item("CUSTOMER_ID") = customer.GetcusID
            oDR.Item("CUS_EN_NAME") = customer.GetEnName
            oDR.Item("CUS_EN_SURNAME") = customer.GetEnSurname
            oDR.Item("CUS_TH_NAME") = customer.GetThName
            oDR.Item("CUS_TH_SURNAME") = customer.GetThSurname
            oDR.Item("D_BIRTH") = customer.GetdBirth
            oDR.Item("M_BIRTH") = customer.GetmBirth
            oDR.Item("Y_BIRTH") = customer.GetyBirth
            oDR.Item("AGE") = customer.GetAge
            oDR.Item("GENDER") = customer.GetGender
            oDR.Item("EMAIL") = customer.GetEmail
            oDR.Item("OCCUPATION") = customer.GetOccu
            oDR.Item("SALARY") = customer.GetSalary
            oDR.Item("HOME_PHONE") = customer.GetHomePhone
            oDR.Item("OFFICE_PHONE") = customer.GetOfficePhone
            oDR.Item("MOBILE_PHONE") = customer.GetMobilePhone
            oDR.Item("FAXNO") = customer.GetFaxNo
            oDR.Item("CUS_STATUS") = customer.GetStatus

            dsCusInsert.Tables("cus_insert").Rows.Add(oDR)
            daCusInsert.Update(dsCusInsert, "cus_insert")

            Return 1 ' Add New Customer Successed...
        End If
    End Function

End Class
