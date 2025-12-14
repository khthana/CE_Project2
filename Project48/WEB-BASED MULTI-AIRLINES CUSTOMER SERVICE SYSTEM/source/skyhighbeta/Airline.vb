Imports System.Text
Imports System.Random
Imports System.Web.Mail
Imports Oracle.DataAccess.Client
Imports System.Security.Cryptography

Public Class Airline
    Inherits System.Web.UI.Page

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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
            InsertUpdateCommand.ExecuteNonQuery()

            '++++Commit Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
            '++++first time insertupdate=====================
            InsertUpdateCommand.ExecuteNonQuery()

            '++++second time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString2
            InsertUpdateCommand.ExecuteNonQuery()

            '++++Commit all Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback all transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
            '++++first time insertupdate=====================
            InsertUpdateCommand.ExecuteNonQuery()

            '++++second time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString2
            InsertUpdateCommand.ExecuteNonQuery()

            '++++third time insertupdate========================
            InsertUpdateCommand.CommandText = InsertUpdateString3
            InsertUpdateCommand.ExecuteNonQuery()

            '++++Commit all Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback all transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
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

            '++++Commit all Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback all transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
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

            '++++Commit all Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback all transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
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

            '++++Commit all Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback all transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
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

            '++++Commit all Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback all transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
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

            '++++Commit all Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback all transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
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
        Dim OraTransaction As OracleTransaction = OraConnection.BeginTransaction(IsolationLevel.ReadCommitted)
        Try
            OraTransaction.Save("OraSavePoint")
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

            '++++Commit all Transaction==========
            OraTransaction.Commit()
        Catch ex As Exception
            '++++Rollback all transaction=========
            Result = ex.Message
            OraTransaction.Rollback("OraSavePoint")
        End Try

        OraConnection.Close()
        InsertUpdateCommand.Dispose()
        OraTransaction.Dispose()
        OraConnection.Dispose()

        Return Result

    End Function

    Shared Function Encrypted(ByVal DataString As String) As String

        Dim MD5Provider As New MD5CryptoServiceProvider
        Dim Data() As Byte = Encoding.ASCII.GetBytes(DataString)
        Dim EncryptedData() As Byte = MD5Provider.ComputeHash(Data)
        Dim EncryptedString As String = Convert.ToBase64String(EncryptedData)

        Return EncryptedString

    End Function

    Shared Function AutoGenBookRef() As String

        Dim BookRefGen1 As New Random(DateTime.Now.Millisecond)
        Dim BookRefGen2 As New Random(DateTime.Now.Second)
        Dim BookRefGen3 As New Random(DateTime.Now.DayOfYear)

        Dim BookRandom1 As Integer = BookRefGen1.Next(65, 90)
        Dim BookRandom2 As Integer = BookRefGen1.Next(0, 99)
        Dim BookRandom3 As Integer = BookRefGen1.Next(97, 122)
        Dim BookRandom4 As Integer = BookRefGen2.Next(65, 90)
        Dim BookRandom5 As Integer = BookRefGen3.Next(65, 90)
        Dim BookRandom6 As Integer = BookRefGen2.Next(97, 122)

        Dim BookCode As String = Chr(BookRandom1.ToString("00")) & UCase(Chr(BookRandom6.ToString("00"))) _
                                & BookRandom2.ToString("00") & Chr(BookRandom4.ToString("00")) _
                                & Chr(BookRandom5.ToString("00")) & UCase(Chr(BookRandom3.ToString("00")))

        '+++++Check if BookRef is repeat+++++++++++++++++++++++++++++++++++
        Dim QueryString As String = "SELECT bookref FROM bookeddetails WHERE bookref = '" & BookCode & "'"

        Dim BookRefDataSet As New DataSet
        BookRefDataSet = Airline.Query(QueryString)

        If BookRefDataSet.Tables(0).Rows.Count = 0 Then
            Return BookCode
        Else
            AutoGenBookRef()
        End If

    End Function

    Shared Function GenerateTxID() As String
        Dim TxID As String

        Dim QueryString As String = "SELECT txid FROM bookeddetails ORDER BY txid DESC"
        Dim TxDataSet As DataSet = Query(QueryString)

        If TxDataSet.Tables(0).Rows.Count = 0 Then
            TxID = ("0000001")
        Else
            TxID = (CInt(TxDataSet.Tables(0).Rows(0).Item("TxID")) + 1).ToString("0000000")
        End If

        Return TxID
    End Function

    Shared Function MakeBookingSet(ByVal TxID As String, ByVal BookRef As String, ByVal FID As String, ByVal FID2 As String, ByVal FID3 As String, ByVal DeptMDY As String, ByVal DeptMDY2 As String, ByVal DeptMDY3 As String, ByVal ReFID As String, ByVal ReFID2 As String, ByVal ReFID3 As String, ByVal ReMDY As String, ByVal ReMDY2 As String, ByVal ReMDY3 As String, ByVal CabinOne As String, ByVal WebFareOne As String, ByVal CabinReturn As String, ByVal WebFareReturn As String) As DataSet

        Dim BookingSet As New DataSet
        Dim BookingTable As New DataTable
        Dim BookingRow As DataRow
        Dim BookingString As String

        BookingTable.Columns.Add(New DataColumn("BookString", GetType(String)))

        '++++Alway do for FID==========================
        BookingString = "INSERT INTO bookedflight VALUES ('" & TxID & "','" & BookRef & "','" & FID & "','" & DeptMDY & "','" & CabinOne & "','" & WebFareOne & "','N','0','1')"
        BookingRow = BookingTable.NewRow()
        BookingRow.Item("BookString") = BookingString
        BookingTable.Rows.Add(BookingRow)

        If FID2 <> "null" Then
            BookingString = "INSERT INTO bookedflight VALUES ('" & TxID & "','" & BookRef & "','" & FID2 & "','" & DeptMDY2 & "','" & CabinOne & "','" & WebFareOne & "','N','0','2')"
            BookingRow = BookingTable.NewRow()
            BookingRow.Item("BookString") = BookingString
            BookingTable.Rows.Add(BookingRow)
        End If

        If FID3 <> "null" Then
            BookingString = "INSERT INTO bookedflight VALUES ('" & TxID & "','" & BookRef & "','" & FID3 & "','" & DeptMDY3 & "','" & CabinOne & "','" & WebFareOne & "','N','0','3')"
            BookingRow = BookingTable.NewRow()
            BookingRow.Item("BookString") = BookingString
            BookingTable.Rows.Add(BookingRow)
        End If

        If ReFID = "null" Then
            BookingSet.Tables.Add(BookingTable)
            Return BookingSet
        End If

        BookingString = "INSERT INTO bookedflight VALUES ('" & TxID & "','" & BookRef & "','" & ReFID & "','" & ReMDY & "','" & CabinReturn & "','" & WebFareReturn & "','Y','0','4')"
        BookingRow = BookingTable.NewRow()
        BookingRow.Item("BookString") = BookingString
        BookingTable.Rows.Add(BookingRow)

        If ReFID2 <> "null" Then
            BookingString = "INSERT INTO bookedflight VALUES ('" & TxID & "','" & BookRef & "','" & ReFID2 & "','" & ReMDY2 & "','" & CabinReturn & "','" & WebFareReturn & "','Y','0','5')"
            BookingRow = BookingTable.NewRow()
            BookingRow.Item("BookString") = BookingString
            BookingTable.Rows.Add(BookingRow)
        End If

        If ReFID3 <> "null" Then
            BookingString = "INSERT INTO bookedflight VALUES ('" & TxID & "','" & BookRef & "','" & ReFID3 & "','" & ReMDY3 & "','" & CabinReturn & "','" & WebFareReturn & "','Y','0','6')"
            BookingRow = BookingTable.NewRow()
            BookingRow.Item("BookString") = BookingString
            BookingTable.Rows.Add(BookingRow)
        End If

        BookingSet.Tables.Add(BookingTable)
        Return BookingSet

    End Function

    Shared Function MakeUpdateSeatSet(ByVal BookRef As String, ByVal Operator As String) As DataSet

        Dim SeatDataSet As New DataSet
        Dim SeatTable As New DataTable
        Dim SeatRow As DataRow
        Dim SeatString As String

        SeatTable.Columns.Add(New DataColumn("SeatString", GetType(String)))

        Dim QueryString As String = "SELECT adult,child,cabinclasstype,flightid,mdy FROM bookeddetails bd,bookedflight bf WHERE bd.bookref=bf.bookref AND bf.bookref='" & BookRef & "' AND bd.isvalid='0' AND bf.isvalid='0'"
        Dim PassengerDataSet As DataSet = Airline.Query(QueryString)

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
                    StandbySeat = Airline.Query(QueryString).Tables(0).Rows(0).Item(0) + ChangingAmount
                Case "-"
                    StandbySeat = Airline.Query(QueryString).Tables(0).Rows(0).Item(0) - ChangingAmount
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

    Shared Function MakebdDataSet(ByVal TxID As String, ByVal BookRef As String, ByVal MemberID As String, ByVal Adult As Integer, ByVal Child As Integer, ByVal IsPay As String, ByVal BookDateTime As String, ByVal IsValid As String) As DataSet
        Dim QueryString As String = "SELECT * FROM bookeddetail"
        Dim bdSchema As DataSet = Airline.Query(QueryString)
        Dim bdDataSet As DataSet = bdSchema.Clone()

        Dim bdRow As DataRow = bdDataSet.Tables(0).NewRow()
        bdRow.Item("TxID") = TxID
        bdRow.Item("BookRef") = BookRef
        bdRow.Item("MemberID") = MemberID
        bdRow.Item("Adult") = Adult
        bdRow.Item("Child") = Child
        bdRow.Item("IsPay") = IsPay
        bdRow.Item("BookDateTime") = BookDateTime
        bdRow.Item("IsValid") = IsValid

        Return bdDataSet
    End Function

    Shared Function MakebfDataSet(ByVal TxID As String, ByVal BookRef As String, ByVal FlightID As String, ByVal Day As String, ByVal Month As String, ByVal Year As String, ByVal CabinClassType As String, ByVal WebFareType As String, ByVal IsReturn As String, ByVal IsValid As String) As DataSet
        Dim QueryString As String = "SELECT * FROM bookedflight"
        Dim bfSchema As DataSet = Airline.Query(QueryString)
        Dim bfDataSet As DataSet = bfSchema.Clone()

        'Dim i As Integer
        'For i = 0 To 0
        Dim bfRow As DataRow = bfDataSet.Tables(0).NewRow()
        bfRow.Item("TxID") = TxID
        bfRow.Item("BookRef") = BookRef
        bfRow.Item("FlightID") = FlightID
        bfRow.Item("Day") = Day
        bfRow.Item("Month") = Month
        bfRow.Item("Year") = Year
        bfRow.Item("CabinClassType") = CabinClassType
        bfRow.Item("WebFareType") = WebFareType
        bfRow.Item("IsReturn") = IsReturn
        bfRow.Item("IsValid") = IsValid
        'Next

        Return bfDataSet
    End Function

    Shared Sub MailTo(ByVal Receiver As String, ByVal Subject As String, ByVal Content As String)

        Dim reservationMail As New MailMessage

        reservationMail.To = Receiver
        reservationMail.From = "reservation@skyhigh.com"
        'reservationMail.Cc = Cc
        'reservationMail.Bcc = Bcc
        reservationMail.Subject = Subject
        reservationMail.BodyFormat = MailFormat.Html
        reservationMail.Body = Content
        'reservationMail.Attachments.Add(New MailAttachment(File))

        SmtpMail.SmtpServer = "mail.kmitl.ac.th"    'set SMTP server
        SmtpMail.Send(reservationMail)   'send mail
        reservationMail = Nothing

    End Sub

    Shared Function ShowItinerary(ByVal FID As String, ByVal FID2 As String, ByVal FID3 As String, ByVal DeptMDY As String, ByVal DeptMDY2 As String, ByVal DeptMDY3 As String, ByVal ReFID As String, ByVal ReFID2 As String, ByVal ReFID3 As String, ByVal ReMDY As String, ByVal ReMDY2 As String, ByVal ReMDY3 As String, ByVal CabinOne As String, ByVal CabinReturn As String, ByVal WebFareOne As String, ByVal WebFareReturn As String) As DataSet

        Dim QueryString As String = "SELECT * FROM flight f,available av,airport ai WHERE f.flightid=av.flightid AND dept_airport=airportcode AND f.flightid='" & FID & "' AND mdy='" & DeptMDY & "'"

        Dim i As Integer = 0
        Dim ItineraryDataSet As New DataSet
        ItineraryDataSet = Airline.Query(QueryString)

        'Add column schema for grdSeleted
        '++++for column 'Leg'=======================
        ItineraryDataSet.Tables(0).Columns.Add(New DataColumn("Leg", GetType(String)))
        '++++for column 'Date'=======================
        ItineraryDataSet.Tables(0).Columns.Add(New DataColumn("Date", GetType(String)))
        '++++for column 'Class'=======================
        ItineraryDataSet.Tables(0).Columns.Add(New DataColumn("Cabin", GetType(String)))
        '++++for column 'Fare*'=======================
        ItineraryDataSet.Tables(0).Columns.Add(New DataColumn("Fare", GetType(String)))
        '++++for column 'Valid'=======================
        ItineraryDataSet.Tables(0).Columns.Add(New DataColumn("WebFare", GetType(String)))

        '++++For FID (alway do it)===================================================
        Dim A_Economy As String = ItineraryDataSet.Tables(0).Rows(i).Item("A_Economy")
        Dim A_Business As String = ItineraryDataSet.Tables(0).Rows(i).Item("A_Business")
        Dim A_First As String = ItineraryDataSet.Tables(0).Rows(i).Item("A_First")
        '++++Fill value==========================================
        ItineraryDataSet.Tables(0).Rows(i).Item("Leg") = "Out Bound"
        ItineraryDataSet.Tables(0).Rows(i).Item("Date") = DeptMDY
        ItineraryDataSet.Tables(0).Rows(i).Item("Cabin") = GetCabin(CabinOne)
        ItineraryDataSet.Tables(0).Rows(i).Item("Fare") = GetFare(A_Economy, A_Business, A_First, CabinOne)
        ItineraryDataSet.Tables(0).Rows(i).Item("WebFare") = GetWebFare(WebFareOne)

        '++++1-stop===========
        If FID2 <> "null" Then
            QueryString = "SELECT * FROM flight f,available av,airport ai WHERE f.flightid=av.flightid AND dept_airport=airportcode AND f.flightid='" & FID2 & "' AND av.mdy='" & DeptMDY2 & "'"
            Dim ItineraryDataSet2 As DataSet = Airline.Query(QueryString)
            ItineraryDataSet.Tables(0).ImportRow(ItineraryDataSet2.Tables(0).Rows(0))

            i = i + 1
            A_Economy = ItineraryDataSet.Tables(0).Rows(i).Item("A_Economy")
            A_Business = ItineraryDataSet.Tables(0).Rows(i).Item("A_Business")
            A_First = ItineraryDataSet.Tables(0).Rows(i).Item("A_First")
            '++++Fill value==========================================
            ItineraryDataSet.Tables(0).Rows(i).Item("Leg") = "Out Bound"
            ItineraryDataSet.Tables(0).Rows(i).Item("Date") = DeptMDY2
            ItineraryDataSet.Tables(0).Rows(i).Item("Cabin") = GetCabin(CabinOne)
            ItineraryDataSet.Tables(0).Rows(i).Item("Fare") = GetFare(A_Economy, A_Business, A_First, CabinOne)
            ItineraryDataSet.Tables(0).Rows(i).Item("WebFare") = GetWebFare(WebFareOne)
        End If

        '++++2-stop===========
        If FID3 <> "null" Then
            QueryString = "SELECT * FROM flight f,available av,airport ai WHERE f.flightid=av.flightid AND dept_airport=airportcode AND f.flightid='" & FID3 & "' AND mdy='" & DeptMDY3 & "'"
            Dim ItineraryDataSet3 As DataSet = Airline.Query(QueryString)
            ItineraryDataSet.Tables(0).ImportRow(ItineraryDataSet3.Tables(0).Rows(0))

            i = i + 1
            A_Economy = ItineraryDataSet.Tables(0).Rows(i).Item("A_Economy")
            A_Business = ItineraryDataSet.Tables(0).Rows(i).Item("A_Business")
            A_First = ItineraryDataSet.Tables(0).Rows(i).Item("A_First")
            '++++Fill value==========================================
            ItineraryDataSet.Tables(0).Rows(i).Item("Leg") = "Out Bound"
            ItineraryDataSet.Tables(0).Rows(i).Item("Date") = DeptMDY3
            ItineraryDataSet.Tables(0).Rows(i).Item("Cabin") = GetCabin(CabinOne)
            ItineraryDataSet.Tables(0).Rows(i).Item("Fare") = GetFare(A_Economy, A_Business, A_First, CabinOne)
            ItineraryDataSet.Tables(0).Rows(i).Item("WebFare") = GetWebFare(WebFareOne)
        End If

        '++++if it's OneWay Trip====
        '++++Return DataSet=========
        If ReFID = "null" Then
            Return ItineraryDataSet
        End If

        '++++if it's Return Trip===========================================================
        '++++non-stop===========

        QueryString = "SELECT * FROM flight f,available a,airport ai WHERE f.flightid=a.flightid AND dept_airport=airportcode AND f.flightid = '" & ReFID & "' AND mdy='" & ReMDY & "'"

        '+++++Append Return flight to SelectedDataSet++++++++++++++++++
        Dim ReSelectedDataSet As New DataSet
        ReSelectedDataSet = Airline.Query(QueryString)
        ItineraryDataSet.Tables(0).ImportRow(ReSelectedDataSet.Tables(0).Rows(0))

        i = i + 1
        Dim A_EconomyReturn As String = ItineraryDataSet.Tables(0).Rows(i).Item("A_Economy")
        Dim A_BusinessReturn As String = ItineraryDataSet.Tables(0).Rows(i).Item("A_Business")
        Dim A_FirstReturn As String = ItineraryDataSet.Tables(0).Rows(i).Item("A_First")
        '++++Fill value==========================================
        ItineraryDataSet.Tables(0).Rows(i).Item("Leg") = "Return"
        ItineraryDataSet.Tables(0).Rows(i).Item("Date") = ReMDY
        ItineraryDataSet.Tables(0).Rows(i).Item("Cabin") = GetCabin(CabinReturn)
        ItineraryDataSet.Tables(0).Rows(i).Item("Fare") = GetFare(A_EconomyReturn, A_BusinessReturn, A_FirstReturn, CabinReturn)
        ItineraryDataSet.Tables(0).Rows(i).Item("WebFare") = GetWebFare(WebFareReturn)

        '++++1-stop===========
        If ReFID2 <> "null" Then
            QueryString = "SELECT * FROM flight f,available a,airport ai WHERE f.flightid=a.flightid AND dept_airport=airportcode AND f.flightid = '" & ReFID2 & "' AND mdy='" & ReMDY2 & "'"

            '+++++Append Return flight to SelectedDataSet++++++++++++++++++
            Dim ReSelectedDataSet2 As New DataSet
            ReSelectedDataSet2 = Airline.Query(QueryString)
            ItineraryDataSet.Tables(0).ImportRow(ReSelectedDataSet2.Tables(0).Rows(0))

            i = i + 1
            A_EconomyReturn = ItineraryDataSet.Tables(0).Rows(i).Item("A_Economy")
            A_BusinessReturn = ItineraryDataSet.Tables(0).Rows(i).Item("A_Business")
            A_FirstReturn = ItineraryDataSet.Tables(0).Rows(i).Item("A_First")
            '++++Fill value==========================================
            ItineraryDataSet.Tables(0).Rows(i).Item("Leg") = "Return"
            ItineraryDataSet.Tables(0).Rows(i).Item("Date") = ReMDY2
            ItineraryDataSet.Tables(0).Rows(i).Item("Cabin") = GetCabin(CabinReturn)
            ItineraryDataSet.Tables(0).Rows(i).Item("Fare") = GetFare(A_EconomyReturn, A_BusinessReturn, A_FirstReturn, CabinReturn)
            ItineraryDataSet.Tables(0).Rows(i).Item("WebFare") = GetWebFare(WebFareReturn)
        End If

        '++++2-stop===========
        If ReFID3 <> "null" Then
            QueryString = "SELECT * FROM flight f,available a,airport ai WHERE f.flightid=a.flightid AND dept_airport=airportcode AND f.flightid = '" & ReFID3 & "' AND mdy='" & ReMDY3 & "'"

            '+++++Append Return flight to SelectedDataSet++++++++++++++++++
            Dim ReSelectedDataSet3 As New DataSet
            ReSelectedDataSet3 = Airline.Query(QueryString)
            ItineraryDataSet.Tables(0).ImportRow(ReSelectedDataSet3.Tables(0).Rows(0))

            i = i + 1
            A_EconomyReturn = ItineraryDataSet.Tables(0).Rows(i).Item("A_Economy")
            A_BusinessReturn = ItineraryDataSet.Tables(0).Rows(i).Item("A_Business")
            A_FirstReturn = ItineraryDataSet.Tables(0).Rows(i).Item("A_First")
            '++++Fill value==========================================
            ItineraryDataSet.Tables(0).Rows(i).Item("Leg") = "Return"
            ItineraryDataSet.Tables(0).Rows(i).Item("Date") = ReMDY3
            ItineraryDataSet.Tables(0).Rows(i).Item("Cabin") = GetCabin(CabinReturn)
            ItineraryDataSet.Tables(0).Rows(i).Item("Fare") = GetFare(A_EconomyReturn, A_BusinessReturn, A_FirstReturn, CabinReturn)
            ItineraryDataSet.Tables(0).Rows(i).Item("WebFare") = GetWebFare(WebFareReturn)
        End If

        Return ItineraryDataSet

    End Function

    Shared Function ShowFare(ByVal FareDataSet As DataSet, ByVal Adult As Integer, ByVal Child As Integer, ByVal CabinOne As String, ByVal WebFareOne As String, ByVal CabinReturn As String, ByVal WebFareReturn As String) As DataSet

        'Add column schema for grdFare
        FareDataSet.Tables(0).Columns.Add(New DataColumn("Passenger", GetType(String)))
        FareDataSet.Tables(0).Columns.Add(New DataColumn("PersonFare", GetType(Integer)))
        FareDataSet.Tables(0).Columns.Add(New DataColumn("PersonTax", GetType(Integer)))
        FareDataSet.Tables(0).Columns.Add(New DataColumn("Total", GetType(Integer)))
        FareDataSet.Tables(0).Columns.Add(New DataColumn("AllTotal", GetType(Integer)))

        '+++++New DataSet to return=====
        Dim FareShowDataSet As DataSet
        FareShowDataSet = FareDataSet.Clone()
        '++++Data Source Row============ 
        Dim FareShowRow As DataRow = FareShowDataSet.Tables(0).NewRow()
        '++++Initial value================
        FareShowRow.Item("PersonFare") = 0
        FareShowRow.Item("PersonTax") = 0
        FareShowRow.Item("Total") = 0
        Dim FareAdultRow As DataRow 'Temp row

        '+++Fill value, Calc adult======================
        FareShowRow.Item("Passenger") = Adult & " Adult"
        Dim i As Integer
        For i = 0 To FareDataSet.Tables(0).Rows.Count - 1
            FareAdultRow = FareDataSet.Tables(0).Rows(i)
            If FareAdultRow.Item("Leg") = "Out Bound" Then
                FareShowRow.Item("PersonFare") = CInt(FareShowRow.Item("PersonFare")) + CInt(GetPersonFare("A", FareAdultRow.Item("A_ECONOMY"), FareAdultRow.Item("A_BUSINESS"), FareAdultRow.Item("A_FIRST"), CabinOne, WebFareOne))
            ElseIf FareAdultRow.Item("Leg") = "Return" Then
                FareShowRow.Item("PersonFare") = CInt(FareShowRow.Item("PersonFare")) + CInt(GetPersonFare("A", FareAdultRow.Item("A_ECONOMY"), FareAdultRow.Item("A_BUSINESS"), FareAdultRow.Item("A_FIRST"), CabinReturn, WebFareReturn))
            End If
            FareShowRow.Item("PersonTax") = CInt(FareShowRow.Item("PersonTax")) + CInt(FareAdultRow.Item("AIRPORTTAX"))
        Next
        FareShowRow.Item("Total") = CInt(Airline.TotalPersonFare(Adult, FareShowRow.Item("PersonFare"), FareShowRow.Item("PersonTax")))
        FareShowRow.Item("AllTotal") = FareShowRow.Item("Total")
        FareShowDataSet.Tables(0).Rows.Add(FareShowRow)

        If Child = "0" Then
            Return FareShowDataSet
        End If

        '++++Calc child and append it============
        If Child <> "0" Then
            '++++Data Source Row============ 
            Dim FareShowRow2 As DataRow = FareShowDataSet.Tables(0).NewRow()
            '++++Initial value================
            FareShowRow2.Item("PersonFare") = 0
            FareShowRow2.Item("PersonTax") = 0
            FareShowRow2.Item("Total") = 0
            Dim FareChildRow As DataRow 'Temp row

            '+++Fill value, Calc adult======================
            FareShowRow2.Item("Passenger") = Child & " Child"
            For i = 0 To FareDataSet.Tables(0).Rows.Count - 1
                FareChildRow = FareDataSet.Tables(0).Rows(i)
                If FareChildRow.Item("Leg") = "Out Bound" Then
                    FareShowRow2.Item("PersonFare") = CInt(FareShowRow2.Item("PersonFare")) + CInt(GetPersonFare("C", FareChildRow.Item("C_ECONOMY"), FareChildRow.Item("C_BUSINESS"), FareChildRow.Item("C_FIRST"), CabinOne, WebFareOne))
                ElseIf FareChildRow.Item("Leg") = "Return" Then
                    FareShowRow2.Item("PersonFare") = CInt(FareShowRow2.Item("PersonFare")) + CInt(GetPersonFare("C", FareChildRow.Item("C_ECONOMY"), FareChildRow.Item("C_BUSINESS"), FareChildRow.Item("C_FIRST"), CabinReturn, WebFareReturn))
                End If
                FareShowRow2.Item("PersonTax") = CInt(FareShowRow2.Item("PersonTax")) + CInt(FareChildRow.Item("AIRPORTTAX"))
            Next
            FareShowRow2.Item("Total") = CInt(Airline.TotalPersonFare(Child, FareShowRow2.Item("PersonFare"), FareShowRow2.Item("PersonTax")))
            FareShowRow2.Item("AllTotal") = FareShowRow2.Item("Total") + FareShowRow.Item("AllTotal")
            '++++Also fill value to rows(0) ==========================
            FareShowDataSet.Tables(0).Rows(0).Item("AllTotal") = FareShowRow2.Item("AllTotal")
            FareShowDataSet.Tables(0).Rows.Add(FareShowRow2)
        End If

        Return FareShowDataSet
    End Function

    Shared Function GetPersonFare(ByVal Passenger As String, ByVal Economy As Integer, ByVal Business As Integer, ByVal First As Integer, ByVal Cabin As String, ByVal WebFare As String) As Integer
        Select Case Cabin
            Case "2"
                Return Economy + (Economy * GetChargeRate(Passenger, WebFare) / 100)
            Case "1"
                Return Business + (Business * GetChargeRate(Passenger, WebFare) / 100)
            Case "0"
                Return First + (First * GetChargeRate(Passenger, WebFare) / 100)
        End Select
    End Function

    Shared Function GetChargeRate(ByVal Passenger As String, ByVal WebFare As String) As Integer
        Select Case Passenger
            Case "A"
                Select Case WebFare
                    Case "0"
                        Return 20
                    Case "1"
                        Return 30
                End Select

            Case "C"
                Select Case WebFare
                    Case "0"
                        Return 15
                    Case "1"
                        Return 25
                End Select
        End Select
    End Function

    Shared Function GetCabin(ByVal CabinType As String) As String
        Select Case CabinType
            Case "2"
                Return "Economy"
            Case "1"
                Return "Business"
            Case "0"
                Return "First"
        End Select
    End Function

    Shared Function GetWebFare(ByVal WebFareType) As String
        Select Case WebFareType
            Case "0"
                Return "Web Fare 6 months"
            Case "1"
                Return "Web Fare 1 year"
        End Select
    End Function

    Shared Function GetFare(ByVal Economy As Integer, ByVal Business As Integer, ByVal First As Integer, ByVal CabinType As String) As Integer
        Select Case CabinType
            Case "2"
                Return Economy
            Case "1"
                Return Business
            Case "0"
                Return First
            Case Else
                Return Business
        End Select
    End Function

    Shared Function TotalPersonFare(ByVal Qty As Integer, ByVal PersonFare As Integer, ByVal AirportTax As Integer)
        Return (Qty * PersonFare) + (Qty * AirportTax)
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

    Shared Function CheckEnoughSeat(ByVal FID As String, ByVal FID2 As String, ByVal FID3 As String, ByVal MDY As String, ByVal MDY2 As String, ByVal MDY3 As String, ByVal Adult As Integer, ByVal Child As Integer, ByVal Cabin As String) As Boolean
        If FID2 = "null" Then '++++it's non-stop====
            Return CheckSeat(FID, MDY, Adult, Child, Cabin)
        ElseIf FID3 = "null" Then '++++it's 1-stop====
            Return CheckSeat(FID2, MDY2, Adult, Child, Cabin)
        Else '++++it's 2-stop====
            Return CheckSeat(FID3, MDY3, Adult, Child, Cabin)
        End If
    End Function

    Shared Function CheckSeat(ByVal FlightID As String, ByVal MDY As String, ByVal Adult As Integer, ByVal Child As Integer, ByVal Cabin As String) As Boolean

        Dim QueryString As String = "SELECT first,business,economy FROM available WHERE flightid='" & FlightID & "' AND mdy='" & MDY & "'"
        Dim SeatRow As DataRow = Airline.Query(QueryString).Tables(0).Rows(0)

        Select Case Cabin
            Case "0"
                If (SeatRow.Item("First") = -1) Or (SeatRow.Item("First") = 0) Or (SeatRow.Item("First") < (Adult + Child)) Then
                    Return False
                Else
                    Return True '++++Have enough seat=====
                End If

            Case "1"
                If (SeatRow.Item("Business") = -1) Or (SeatRow.Item("Business") = 0) Or (SeatRow.Item("Business") < (Adult + Child)) Then
                    Return False
                Else
                    Return True '++++Have enough seat=====
                End If

            Case "2"
                If (SeatRow.Item("Economy") = -1) Or (SeatRow.Item("Economy") = 0) Or (SeatRow.Item("Economy") < (Adult + Child)) Then
                    Return False
                Else
                    Return True '++++Have enough seat=====
                End If
        End Select
    End Function
End Class
