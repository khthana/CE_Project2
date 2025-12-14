Imports Oracle.DataAccess.Client

Public Class SkyHigh

    Shared Function Query(ByVal QueryString As String) As DataSet
        'for any "SELECT" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

    Shared Function InsertUpdate(ByVal InsertUpdateString As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

    Shared Function InsertUpdate(ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

    Shared Function InsertUpdate(ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

    Shared Function InsertUpdate(ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

    Shared Function InsertUpdate(ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String, ByVal InsertUpdateString5 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

    Shared Function InsertUpdate(ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String, ByVal InsertUpdateString5 As String, ByVal InsertUpdateString6 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

    Shared Function InsertUpdate(ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String, ByVal InsertUpdateString5 As String, ByVal InsertUpdateString6 As String, ByVal InsertUpdateString7 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

    Shared Function InsertUpdate(ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String, ByVal InsertUpdateString5 As String, ByVal InsertUpdateString6 As String, ByVal InsertUpdateString7 As String, ByVal InsertUpdateString8 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

            '++++eight time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString8
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function InsertUpdate(ByVal InsertUpdateString As String, ByVal InsertUpdateString2 As String, ByVal InsertUpdateString3 As String, ByVal InsertUpdateString4 As String, ByVal InsertUpdateString5 As String, ByVal InsertUpdateString6 As String, ByVal InsertUpdateString7 As String, ByVal InsertUpdateString8 As String, ByVal InsertUpdateString9 As String) As String
        'for any "INSERT & UPDATE" from alliance's tables ++++++++++++++++
        Dim ConnectionString As String = "User Id=alliance; Password=alliance; Data Source=AIRLINE; " & _
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

            '++++eight time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString8
            InsertUpdateCommand.ExecuteNonQuery()

            '++++ninth time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString9
            InsertUpdateCommand.ExecuteNonQuery()
        Catch ex As Exception
            Result = ex.Message
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function GetFlightColumn() As SortedList

        Dim QueryString As String = "SELECT flightid FROM flight ORDER BY flightid"
        Dim FlightDataSet As DataSet = Query(QueryString)

        Dim i As Integer
        Dim FlightSortedList As New SortedList
        Dim TempFlight As String

        For i = 0 To FlightDataSet.Tables(0).Rows.Count - 1
            TempFlight = FlightDataSet.Tables(0).Rows(i).Item("FlightID")
            FlightSortedList.Add(TempFlight, TempFlight)
        Next

        Return FlightSortedList

    End Function

    Shared Function GetAirportColumn() As SortedList

        Dim QueryString As String = "SELECT airportname,airportcode FROM airport ORDER BY airportname"
        Dim AirportDataSet As DataSet = Query(QueryString)

        Dim i As Integer
        Dim AirportSortedList As New SortedList
        Dim TempFlight As String

        For i = 0 To AirportDataSet.Tables(0).Rows.Count - 1
            'TempFlight = AirportDataSet.Tables(0).Rows(i).Item("FlightID")
            AirportSortedList.Add(AirportDataSet.Tables(0).Rows(i).Item("airportname"), AirportDataSet.Tables(0).Rows(i).Item("airportcode"))
        Next

        Return AirportSortedList
    End Function

End Class
