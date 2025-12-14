Imports System.Web.Services
Imports System.Data.SqlClient

<WebService(Namespace:="http://tempuri.org/")> _
Public Class ServiceBank
    Inherits System.Web.Services.WebService

#Region " Web Services Designer Generated Code "

    Public Sub New()
        MyBase.New()

        'This call is required by the Web Services Designer.
        InitializeComponent()

        'Add your own initialization code after the InitializeComponent() call

    End Sub

    'Required by the Web Services Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Web Services Designer
    'It can be modified using the Web Services Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        components = New System.ComponentModel.Container()
    End Sub

    Protected Overloads Overrides Sub Dispose(ByVal disposing As Boolean)
        'CODEGEN: This procedure is required by the Web Services Designer
        'Do not modify it using the code editor.
        If disposing Then
            If Not (components Is Nothing) Then
                components.Dispose()
            End If
        End If
        MyBase.Dispose(disposing)
    End Sub

#End Region

    ' WEB SERVICE EXAMPLE
    ' The HelloWorld() example service returns the string Hello World.
    ' To build, uncomment the following lines then save and build the project.
    ' To test this web service, ensure that the .asmx file is the start page
    ' and press F5.
    '
    '<WebMethod()> Public Function HelloWorld() As String
    '	HelloWorld = "Hello World"
    ' End Function

    <WebMethod(Description:="จะตรวดสอบว่ามี สมาชิกคนนี้อยู่หรือไม่และมีเงินในบัญชีพอหรือไม่")> _
    Public Function BankingCheck(ByVal IDCredit As String, ByVal PasswordCredit As String, ByVal Price As Decimal) As Boolean
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim StrConn, sql As String
        Dim AddNowDate As Date

        StrConn = "Address=161.246.6.4;Database=dbBank;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        sql = "select * from BankMember where IDCredit = '" & IDCredit & "'"
        sql &= " and password = '" & PasswordCredit & "'"
        sql &= " and Price >= " & Price
        DA1 = New SqlDataAdapter(sql, conn)
        ds1.Clear()
        DA1.Fill(ds1, "CheckMember")
        dr1 = ds1.Tables("CheckMember").Select()
        'ในกรณีนี้จะ return ค่าจริงเมื่อมี row เดียว
        'UBound([Array]) จะ return ค่า คือ row-1
        If UBound(dr1) = 0 Then 'แสดงว่ามี 1 row
            Return True
        Else
            Return False
        End If
    End Function

    <WebMethod(Description:="จะตัดเงินในบัญชีธนาคาร")> _
       Public Sub BankingPayment(ByVal IDCredit As String, ByVal PasswordCredit As String, ByVal NameBookReceive As String, ByVal IDBookReceive As String, ByVal Price As Decimal)
        Dim conn As SqlConnection = New SqlConnection()
        Dim command1 As SqlCommand = New SqlCommand()
        Dim StrConn, sql As String
        Dim OldPrice As Decimal

        StrConn = "Address=161.246.6.4;Database=dbBank;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        sql = "select Price from BankMember where IDCredit = '" & IDCredit & "'"
        sql &= " and password = '" & PasswordCredit & "'"
        sql &= " and Price >= " & Price
        With command1
            .CommandType = CommandType.Text
            .CommandText = sql
            .Connection = conn
            OldPrice = CDec(.ExecuteScalar())
        End With
        sql = "Update BankMember set Price=" & OldPrice - Price
        sql &= " where IDCredit = '" & IDCredit & "'"
        sql &= " and password = '" & PasswordCredit & "'"
        sql &= " and Price >= " & Price
        With command1
            .CommandType = CommandType.Text
            .CommandText = sql
            .Connection = conn
            .ExecuteNonQuery()
        End With


        sql = "select Price from BankMember where NameBook = '" & NameBookReceive & "'" & _
            " and IDBook = '" & IDBookReceive & "'"
        With command1
            .CommandType = CommandType.Text
            .CommandText = sql
            .Connection = conn
            OldPrice = CDec(.ExecuteScalar())
        End With
        sql = "Update BankMember set Price=" & OldPrice + Price
        sql &= " where NameBook = '" & NameBookReceive & "'" & _
            " and IDBook = '" & IDBookReceive & "'"
        With command1
            .CommandType = CommandType.Text
            .CommandText = sql
            .Connection = conn
            .ExecuteNonQuery()
        End With

    End Sub
End Class
