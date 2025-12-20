Imports System.Data
Imports System.Data.SqlClient
Imports Microsoft.VisualBasic

Public Module Connection
    Public ConnStr As String = "server=(local); database=ProjectDB; user id=sa; password=namtan;"
    Public sqlDA As SqlDataAdapter
    Public sqlDS As DataSet
    Public sqlComm As SqlCommand
    Public sqlConn As New SqlConnection(ConnStr)
    Public QueryStr As String
    Public TableStr As String

    Function OpenConn() As Boolean
        Try
            sqlConn.Open()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Function CloseConn() As Boolean
        Try
            sqlConn.Close()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Function FillCommQ(ByVal QueryStr As String, ByVal TableStr As String) As Boolean
        Try
            sqlDA = New SqlDataAdapter(QueryStr, sqlConn)
            sqlDS = New DataSet
            sqlDA.Fill(sqlDS, TableStr)
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Function ExecuteComm(ByVal QueryStr As String) As Boolean
        Try
            OpenConn()
            sqlComm = New SqlCommand(QueryStr, sqlConn)
            sqlComm.CommandType = CommandType.Text
            sqlComm.ExecuteNonQuery()
            CloseConn()
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function
End Module
