Imports Oracle.DataAccess.Client

Public Class Alliance

    Shared Function Query(ByVal AirlineCode As String, ByVal QueryString As String) As DataSet
        'for any "SELECT" from airline's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=" & AirlineCode & "; Password=" & AirlineCode & "; Data Source=AIRLINE; " & _
                                        "Min Pool Size=1; Connection Lifetime=60; Connection Timeout=40; " & _
                                        "Incr Pool Size=5; Decr Pool Size=1; Enlist=True"

        Dim OraConnection As New OracleConnection(ConnectionString)
        OraConnection.Open()
        Dim QueryAdapter As OracleDataAdapter = New OracleDataAdapter(QueryString, OraConnection)

        Dim QueryDataSet As New DataSet
        QueryAdapter.Fill(QueryDataSet)

        OraConnection.Close()
        QueryAdapter.Dispose()
        OraConnection.Dispose()

        Return QueryDataSet

    End Function

    Shared Function InsertUpdate(ByVal AirlineCode As String, ByVal InsertUpdateString As String) As String
        'for any "INSERT & UPDATE" from airline's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=" & AirlineCode & "; Password=" & AirlineCode & "; Data Source=AIRLINE; " & _
                                        "Min Pool Size=1; Connection Lifetime=60; Connection Timeout=40; " & _
                                        "Incr Pool Size=5; Decr Pool Size=1; Enlist=True"

        Dim Result As String = "OK"
        Dim OraConnection As New OracleConnection(ConnectionString)
        Dim InsertUpdateCommand As New OracleCommand(InsertUpdateString, OraConnection)
        OraConnection.Open()

        Try
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function InsertUpdate(ByVal AirlineCode As String, ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String) As String
        'for any "INSERT & UPDATE" from airline's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=" & AirlineCode & "; Password=" & AirlineCode & "; Data Source=AIRLINE; " & _
                                        "Min Pool Size=1; Connection Lifetime=60; Connection Timeout=40; " & _
                                        "Incr Pool Size=5; Decr Pool Size=1; Enlist=True"

        Dim Result As String = "OK"
        Dim OraConnection As New OracleConnection(ConnectionString)
        Dim InsertUpdateCommand As New OracleCommand(InsertUpdateString, OraConnection)
        OraConnection.Open()

        Try
            '++++first time insertupdate=====================
            InsertUpdateCommand.ExecuteNonQuery()

            '++++second time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString2
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function InsertUpdate(ByVal AirlineCode As String, ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=" & AirlineCode & "; Password=" & AirlineCode & "; Data Source=AIRLINE; " & _
                                        "Min Pool Size=1; Connection Lifetime=60; Connection Timeout=40; " & _
                                        "Incr Pool Size=5; Decr Pool Size=1; Enlist=True"

        Dim Result As String = "OK"
        Dim OraConnection As New OracleConnection(ConnectionString)
        Dim InsertUpdateCommand As New OracleCommand(InsertUpdateString, OraConnection)
        OraConnection.Open()

        Try
            '++++first time insertupdate=====================
            InsertUpdateCommand.ExecuteNonQuery()

            '++++second time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString2
            InsertUpdateCommand.ExecuteNonQuery()

            '++++third time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString3
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function InsertUpdate(ByVal AirlineCode As String, ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=" & AirlineCode & "; Password=" & AirlineCode & "; Data Source=AIRLINE; " & _
                                        "Min Pool Size=1; Connection Lifetime=60; Connection Timeout=40; " & _
                                        "Incr Pool Size=5; Decr Pool Size=1; Enlist=True"

        Dim Result As String = "OK"
        Dim OraConnection As New OracleConnection(ConnectionString)
        Dim InsertUpdateCommand As New OracleCommand(InsertUpdateString, OraConnection)
        OraConnection.Open()

        Try
            '++++first time insertupdate=====================
            InsertUpdateCommand.ExecuteNonQuery()

            '++++second time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString2
            InsertUpdateCommand.ExecuteNonQuery()

            '++++third time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString3
            InsertUpdateCommand.ExecuteNonQuery()

            '++++forth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString4
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function InsertUpdate(ByVal AirlineCode As String, ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String, ByVal InsertUpdateString5 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=" & AirlineCode & "; Password=" & AirlineCode & "; Data Source=AIRLINE; " & _
                                        "Min Pool Size=1; Connection Lifetime=60; Connection Timeout=40; " & _
                                        "Incr Pool Size=5; Decr Pool Size=1; Enlist=True"

        Dim Result As String = "OK"
        Dim OraConnection As New OracleConnection(ConnectionString)
        Dim InsertUpdateCommand As New OracleCommand(InsertUpdateString, OraConnection)
        OraConnection.Open()

        Try
            '++++first time insertupdate=====================
            InsertUpdateCommand.ExecuteNonQuery()

            '++++second time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString2
            InsertUpdateCommand.ExecuteNonQuery()

            '++++third time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString3
            InsertUpdateCommand.ExecuteNonQuery()

            '++++forth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString4
            InsertUpdateCommand.ExecuteNonQuery()

            '++++fifth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString5
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function InsertUpdate(ByVal AirlineCode As String, ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String, ByVal InsertUpdateString5 As String, ByVal InsertUpdateString6 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=" & AirlineCode & "; Password=" & AirlineCode & "; Data Source=AIRLINE; " & _
                                        "Min Pool Size=1; Connection Lifetime=60; Connection Timeout=40; " & _
                                        "Incr Pool Size=5; Decr Pool Size=1; Enlist=True"

        Dim Result As String = "OK"
        Dim OraConnection As New OracleConnection(ConnectionString)
        Dim InsertUpdateCommand As New OracleCommand(InsertUpdateString, OraConnection)
        OraConnection.Open()

        Try
            '++++first time insertupdate=====================
            InsertUpdateCommand.ExecuteNonQuery()

            '++++second time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString2
            InsertUpdateCommand.ExecuteNonQuery()

            '++++third time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString3
            InsertUpdateCommand.ExecuteNonQuery()

            '++++forth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString4
            InsertUpdateCommand.ExecuteNonQuery()

            '++++fifth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString5
            InsertUpdateCommand.ExecuteNonQuery()

            '++++sixth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString6
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function InsertUpdate(ByVal AirlineCode As String, ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String, ByVal InsertUpdateString5 As String, ByVal InsertUpdateString6 As String, ByVal InsertUpdateString7 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=" & AirlineCode & "; Password=" & AirlineCode & "; Data Source=AIRLINE; " & _
                                        "Min Pool Size=1; Connection Lifetime=60; Connection Timeout=40; " & _
                                        "Incr Pool Size=5; Decr Pool Size=1; Enlist=True"

        Dim Result As String = "OK"
        Dim OraConnection As New OracleConnection(ConnectionString)
        Dim InsertUpdateCommand As New OracleCommand(InsertUpdateString, OraConnection)
        OraConnection.Open()
        Try
            '++++first time insertupdate=====================
            InsertUpdateCommand.ExecuteNonQuery()

            '++++second time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString2
            InsertUpdateCommand.ExecuteNonQuery()

            '++++third time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString3
            InsertUpdateCommand.ExecuteNonQuery()

            '++++forth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString4
            InsertUpdateCommand.ExecuteNonQuery()

            '++++fifth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString5
            InsertUpdateCommand.ExecuteNonQuery()

            '++++sixth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString6
            InsertUpdateCommand.ExecuteNonQuery()

            '++++seventh time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString7
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function MakeSeatString(ByVal AirlineCode As String, ByVal BookRef As String, ByVal Operator As String) As DataSet

        Dim SeatDataSet As New DataSet
        Dim SeatTable As New DataTable
        Dim SeatRow As DataRow
        Dim SeatString As String

        SeatTable.Columns.Add(New DataColumn("SeatString", GetType(String)))

        Dim QueryString As String = "SELECT adult,child,cabinclasstype,flightid,mdy FROM bookeddetails bd,bookedflight bf WHERE bd.bookref=bf.bookref AND bf.bookref='" & BookRef & "' AND bd.isvalid='0' AND bf.isvalid='0'"
        Dim PassengerDataSet As DataSet = Alliance.Query(AirlineCode, QueryString)

        Dim i As Integer
        For i = 0 To PassengerDataSet.Tables(0).Rows.Count - 1

            Dim PassengerRow As DataRow = PassengerDataSet.Tables(0).Rows(i)

            '++++Get value to variable===================================================
            Dim ChangingAmount As Integer = PassengerRow.Item("adult") + PassengerRow.Item("child")
            Dim CabinClassType As String = PassengerRow.Item("cabinclasstype")
            Dim FlightID As String = PassengerRow.Item("flightid")
            Dim MDY As String = PassengerRow.Item("MDY")
            Dim StandbySeat As Integer

            '++++Calculate stand by seat===================================
            QueryString = "SELECT " & GetClass(CabinClassType) & " FROM available WHERE flightid='" & FlightID & "' AND mdy='" & MDY & "'"
            Select Case Operator
                Case "+"
                    StandbySeat = Alliance.Query(AirlineCode, QueryString).Tables(0).Rows(0).Item(0) + ChangingAmount
                Case "-"
                    StandbySeat = Alliance.Query(AirlineCode, QueryString).Tables(0).Rows(0).Item(0) - ChangingAmount
            End Select

            '++++Make standby seats string==================================
            SeatString = "UPDATE available SET " & GetClass(CabinClassType) & "=" & StandbySeat & " WHERE flightid='" & FlightID & "' AND mdy='" & MDY & "'"
            SeatRow = SeatTable.NewRow()
            SeatRow.Item("SeatString") = SeatString
            SeatTable.Rows.Add(SeatRow)
        Next
        SeatDataSet.Tables.Add(SeatTable)

        Return SeatDataSet

    End Function

    Shared Function GetClass(ByVal CabinClassType) As String
        Select Case CabinClassType
            Case "0"
                Return "first"
            Case "1"
                Return "business"
            Case "2"
                Return "economy"
        End Select
    End Function
End Class
