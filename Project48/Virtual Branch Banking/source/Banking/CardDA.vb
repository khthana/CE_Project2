'****************************************************************************
'Class CardDA  : Definition Class for Database connection to card table     *
'****************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class CardDA
    '************************************************
    'Select card informstion from database
    '************************************************
    Public Function CardSelect(ByVal card As Card) As Card
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlCardSelect As String = "SELECT * FROM CARD WHERE CARD_NO = '" & card.GetCardNo & "'"
        Dim daCardSelect As OracleDataAdapter = New OracleDataAdapter(sqlCardSelect, Conn)
        Dim dsCardSelect As New DataSet("card_select")
        daCardSelect.Fill(dsCardSelect, "card_select")

        If dsCardSelect.Tables("card_select").Rows.Count = 0 Then
            Dim cardSelected As New Card(0)
            Return cardSelected
            Exit Function
        Else
            Dim cardSelected As New Card
            cardSelected.SetCardNo(dsCardSelect.Tables("card_select").Rows(0).Item(0))
            cardSelected.SetCardType(dsCardSelect.Tables("card_select").Rows(0).Item(1))
            cardSelected.SetPIN(dsCardSelect.Tables("card_select").Rows(0).Item(2))
            cardSelected.SetCustomerOwner(New Customer(dsCardSelect.Tables("card_select").Rows(0).Item(3)))
            cardSelected.SetAccOwner(New Account(dsCardSelect.Tables("atm_select").Rows(0).Item(4)))
            Return cardSelected
            Exit Function
        End If
    End Function
    '*********************************************
    'Verify Card & PIN
    '*********************************************
    Public Function CardCheckPIN(ByVal card As Card) As Card
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlCardCheck As String = "SELECT * FROM CARD WHERE CARD_NO LIKE '" & card.GetCardNo & "'"
        sqlCardCheck &= " AND PIN LIKE '" & card.GetPIN & "'"
        Dim daCardCheck As OracleDataAdapter = New OracleDataAdapter(sqlCardCheck, Conn)
        Dim dsCardCheck As New DataSet("card_check")
        daCardCheck.Fill(dsCardCheck, "card_check")

        If dsCardCheck.Tables("card_check").Rows.Count = 0 Then
            Dim cardChecked As New Card(0)
            Return cardChecked
            Exit Function
        Else
            Dim cardChecked As New Card
            cardChecked.SetCardNo(dsCardCheck.Tables("card_check").Rows(0).Item(0))
            cardChecked.SetCardType(dsCardCheck.Tables("card_check").Rows(0).Item(1))
            cardChecked.SetPIN(dsCardCheck.Tables("card_check").Rows(0).Item(2))
            cardChecked.SetCustomerOwner(New Customer(dsCardCheck.Tables("card_check").Rows(0).Item(3)))
            cardChecked.SetAccOwner(New Account(dsCardCheck.Tables("card_check").Rows(0).Item(4)))
            Return cardChecked
            Exit Function
        End If
    End Function
    '*********************************************
    'Insert new card to database
    '*********************************************
    Public Function CardInsert(ByVal card As Card) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlCardInsert As String = "SELECT * FROM CARD WHERE CARD_NO = '" & card.GetCardNo & "'"
        Dim daCardInsert As OracleDataAdapter = New OracleDataAdapter(sqlCardInsert, Conn)
        Dim dsCardInsert As New DataSet("card_insert")
        daCardInsert.Fill(dsCardInsert, "card_insert")

        If dsCardInsert.Tables("card_insert").Rows.Count <> 0 Then
            Return -1 ' this Card had already exist
            Exit Function
        Else
            sqlCardInsert = "SELECT * FROM CARD ORDER BY CARD_NO DESC"
            daCardInsert = New OracleDataAdapter(sqlCardInsert, Conn)
            Dim oCB As New OracleCommandBuilder(daCardInsert)
            daCardInsert.Fill(dsCardInsert, "card_insert")
            Dim oDR As DataRow = dsCardInsert.Tables("card_insert").NewRow()

            oDR.Item("CARD_NO") = card.GetCardNo
            oDR.Item("CARD_TYPE") = card.GetCardType
            oDR.Item("PIN") = card.GetPIN
            oDR.Item("CUSTOMER_ID") = card.GetCustomerOwner.GetcusID
            oDR.Item("ACC_NO") = card.GetAccOwner.GetAccNo

            dsCardInsert.Tables("card_insert").Rows.Add(oDR)
            daCardInsert.Update(dsCardInsert, "card_insert")

            Return 1 ' Insert Successed...
        End If
    End Function
End Class