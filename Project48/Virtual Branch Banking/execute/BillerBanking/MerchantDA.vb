Imports System.Data
Imports Oracle.DataAccess.Client
Public Class MerchantDA
    Public Function MerchantSelect(ByVal mer As Merchant) As Merchant
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlMerSelect As String = "SELECT * FROM MERCHANT WHERE MERCHANT_ID = '" & mer.GetMerchantID & "'"
        Dim daMerSelect As OracleDataAdapter = New OracleDataAdapter(sqlMerSelect, Conn)
        Dim dsMerSelect As New DataSet("mer_select")
        daMerSelect.Fill(dsMerSelect, "mer_select")

        If dsMerSelect.Tables("mer_select").Rows.Count = 0 Then
            Dim merSelected As New Merchant(0)
            Return merSelected
            Exit Function
        Else
            Dim merSelected As New Merchant
            merSelected.SetMerchantID(dsMerSelect.Tables("mer_select").Rows(0).Item(0))
            merSelected.SetMerchantName(dsMerSelect.Tables("mer_select").Rows(0).Item(1))
            merSelected.SetMerchantType(dsMerSelect.Tables("mer_select").Rows(0).Item(2))
            merSelected.SetMerchantProduct(dsMerSelect.Tables("mer_select").Rows(0).Item(3))
            merSelected.SetMerchantPhoneNo(dsMerSelect.Tables("mer_select").Rows(0).Item(4))
            merSelected.SetMerchantFaxNo(dsMerSelect.Tables("mer_select").Rows(0).Item(5))
            Return merSelected
            Exit Function
        End If
    End Function
    Public Function MerchantInsert(ByVal mer As Merchant) As Integer
        Dim i As Integer = 1
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlMerInsert As String = "SELECT * FROM MERCHANT WHERE MERCHANT_ID = '" & mer.GetMerchantID & "'"
        Dim daMerInsert As OracleDataAdapter = New OracleDataAdapter(sqlMerInsert, Conn)
        Dim dsMerInsert As New DataSet("mer_insert")
        daMerInsert.Fill(dsMerInsert, "mer_insert")
        '****************************
        If dsMerInsert.Tables("mer_insert").Rows.Count <> 0 Then
            Return -1 ' this merchant had already exist
            Exit Function
        Else
            sqlMerInsert = "SELECT * FROM MERCHANT ORDER BY MERCHANT_ID DESC"
            daMerInsert = New OracleDataAdapter(sqlMerInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daMerInsert)
            daMerInsert.Fill(dsMerInsert, "mer_insert")
            Dim oDR As DataRow = dsMerInsert.Tables("mer_insert").NewRow()

            oDR.Item("MERCHANT_ID") = mer.GetMerchantID
            oDR.Item("MERCHANT_NAME") = mer.GetMerchantName
            oDR.Item("MERCHANT_TYPE") = mer.GetMerchantType
            oDR.Item("PRODUCT_NAME") = mer.GetMerchantProduct
            oDR.Item("PHONE_NO") = mer.GetMerchantPhoneNO
            oDR.Item("FAX_NO") = mer.GetMerchantFaxNo

            dsMerInsert.Tables("mer_insert").Rows.Add(oDR)
            daMerInsert.Update(dsMerInsert, "mer_insert")
            Return 1 ' Insert Successed...
        End If
    End Function
    Public Function MerchantSelectByMerchantName(ByVal mer As Merchant) As Merchant
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlMerSelect As String = "SELECT * FROM MERCHANT WHERE MERCHANT_NAME = '" & mer.GetMerchantName & "'"
        Dim daMerSelect As OracleDataAdapter = New OracleDataAdapter(sqlMerSelect, Conn)
        Dim dsMerSelect As New DataSet("mer_select")
        daMerSelect.Fill(dsMerSelect, "mer_select")

        If dsMerSelect.Tables("mer_select").Rows.Count = 0 Then
            Dim merSelected As New Merchant(0)
            Return merSelected
            Exit Function
        Else
            Dim merSelected As New Merchant
            merSelected.SetMerchantID(dsMerSelect.Tables("mer_select").Rows(0).Item(0))
            merSelected.SetMerchantName(dsMerSelect.Tables("mer_select").Rows(0).Item(1))
            merSelected.SetMerchantType(dsMerSelect.Tables("mer_select").Rows(0).Item(2))
            merSelected.SetMerchantProduct(dsMerSelect.Tables("mer_select").Rows(0).Item(3))
            merSelected.SetMerchantPhoneNo(dsMerSelect.Tables("mer_select").Rows(0).Item(4))
            merSelected.SetMerchantFaxNo(dsMerSelect.Tables("mer_select").Rows(0).Item(5))
            Return merSelected
            Exit Function
        End If
    End Function
    '*******************************************************************
    Public Function MerSelectDataset() As DataSet
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlMerSelectDataset As String = "SELECT * FROM MERCHANT ORDER BY MERCHANT_ID" '"
        Dim daMerSelectDataset As OracleDataAdapter = New OracleDataAdapter(sqlMerSelectDataset, Conn)
        Dim dsMerSelectDataset As New DataSet("mer_select_dataset")
        daMerSelectDataset.Fill(dsMerSelectDataset, "mer_select_dataset")

        Return dsMerSelectDataset
    End Function

End Class

