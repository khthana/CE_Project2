'********************************************************************************
'Class ChequeDA  : Definition Class for Database connection to cheque table     *
'********************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Public Class ChequeDA
    Public Function Check(ByVal cheque As Cheque) As Cheque
        Dim invalidStr As String = ""
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                           + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                          + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                           + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb) ' VB.NET
        Dim sqlChequeCheck As String = "SELECT * FROM CHECKING WHERE CHECK_NO = '" & cheque.GetCheckNo & "'"
        sqlChequeCheck &= " AND ACC_NO = '" & cheque.GetAccount.GetAccNo & "' "
        Dim daChequeCheck As OracleDataAdapter = New OracleDataAdapter(sqlChequeCheck, Conn)
        Dim dsChequeCheck As New DataSet("cheque_check")
        daChequeCheck.Fill(dsChequeCheck, "cheque_check")

        If dsChequeCheck.Tables("cheque_check").Rows.Count = 0 Then
            Dim chequeChecked As New Cheque(0)
            Return chequeChecked
            Exit Function
        Else
            If (dsChequeCheck.Tables("cheque_check").Rows(0).Item(3) = "exchanged") Then
                Dim chequeChecked As New Cheque(0)
                Return chequeChecked
                Exit Function
            Else
                Dim chequeChecked As New Cheque
                chequeChecked.SetCheckNo(dsChequeCheck.Tables("cheque_check").Rows(0).Item(1))
                chequeChecked.SetCheckType(dsChequeCheck.Tables("cheque_check").Rows(0).Item(4))
                Dim acc1 As New Account(dsChequeCheck.Tables("cheque_check").Rows(0).Item(2))
                acc1 = acc1.Check(acc1)
                chequeChecked.SetAccNo(acc1)
                chequeChecked.SetCheckStatus(dsChequeCheck.Tables("cheque_check").Rows(0).Item(3))
                Return chequeChecked
                Exit Function
            End If
        End If
    End Function
    Public Function Update(ByVal cheque As Cheque) As Integer
        Dim Oradb As String = "Data Source=(DESCRIPTION=(ADDRESS_LIST=" _
                                   + "(ADDRESS=(PROTOCOL=TCP)(HOST=thawatchai)(PORT=1521)))" _
                                  + "(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=ORCL)));" _
                                   + "User Id=scott;Password=tiger;"

        Dim Conn As New OracleConnection(Oradb)
        Dim sqlChequeCheck As String = "SELECT * FROM CHECKING WHERE CHECK_NO = '" & cheque.GetCheckNo & "'"
        sqlChequeCheck &= " AND ACC_NO = '" & cheque.GetAccount.GetAccNo & "'"
        Dim daChequeCheck As OracleDataAdapter = New OracleDataAdapter(sqlChequeCheck, Conn)
        Dim dsChequeCheck As New DataSet("cheque_check")

        daChequeCheck.Fill(dsChequeCheck, "cheque_check")
        If dsChequeCheck.Tables("cheque_check").Rows.Count = 0 Then
            Return -1 ' Cannot update account...
            Exit Function
        Else
            Try
                Dim sqlChequeUpdate = "UPDATE CHECKING SET CHECK_STATUS = 'exchanged' WHERE CHECK_NO = '" & cheque.GetCheckNo & "'"
                sqlChequeUpdate &= " AND ACC_NO = '" & cheque.GetAccount.GetAccNo & "'"
                Dim daChequeUpdate = New OracleDataAdapter(sqlChequeUpdate, Conn)
                Dim dsChequeUpdate As New DataSet("cheque_update")
                Dim oCB2 As New OracleCommandBuilder(daChequeUpdate)
                daChequeUpdate.Fill(dsChequeUpdate, "cheque_update")
                'tr.Commit()
                Return 1
            Catch ex As Exception
                'tr.Rollback()
                Return -1
            End Try
        End If
    End Function
End Class
