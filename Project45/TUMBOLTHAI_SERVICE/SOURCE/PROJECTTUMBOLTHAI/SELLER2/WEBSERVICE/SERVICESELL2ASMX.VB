Imports System.Web.Services
Imports System.Data.SqlClient

<WebService(Namespace:="http://tempuri.org/")> _
Public Class ServiceSell2
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
    Structure ReturnProduct
        Dim ID As Integer
        Dim Name As String
        Dim Detail As String
        Dim Unit As String
        Dim Price As String
        Dim Picture As String
        Dim IDSeller As Integer
    End Structure
    Const IDSell = "2"

    <WebMethod(Description:="ใช้ในการค้นหารายการสินค้าโดยใช้ชื่อสินค้าในการค้นหา(Search)")> _
    Public Function GetInfoProductByName(ByVal NameProduct As String, ByVal Detail As String, ByVal PriceStr As String) As ReturnProduct()
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim StrConn, sql As String
        Dim i, Block As Integer
        Dim Temp() As ReturnProduct
        'DB_name = "c:\dbSeller1.mdb"
        Dim Price As Decimal = Val(PriceStr)
        If Price = 0 Then Price = 99999999
        If NameProduct <> "" Then
            StrConn = "Address=161.246.6.4;Database=dbSeller2;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            sql = "select * from Product where Name Like '%" & NameProduct & "%'" & _
                    " and Detail Like '%" & Detail & "%' and Price <=" & Price
            DA1 = New SqlDataAdapter(sql, conn)
            ds1.Clear()
            DA1.Fill(ds1, "GetProduct")
            dr1 = ds1.Tables("GetProduct").Select()
            Block = UBound(dr1)
            ReDim Temp(Block)
            For i = 0 To Block
                With Temp(i)
                    .ID = dr1(i)("ID")
                    .Name = dr1(i)("Name")
                    .Detail = dr1(i)("Detail")
                    .Unit = dr1(i)("Unit")
                    .Price = dr1(i)("Price")
                    .Picture = dr1(i)("Picture")
                    .IDSeller = IDSell
                End With
            Next
            If Block = -1 Then 'ไม่มี row
                ReDim Temp(0)
                With Temp(0)
                    .ID = -1
                    .Name = ""
                    .Detail = ""
                    .Unit = ""
                    .Price = -1
                    .Picture = ""
                    .IDSeller = -1
                End With
            End If
            conn.Close()
        Else
            ReDim Temp(0)
            With Temp(0)
                .ID = -1
                .Name = ""
                .Detail = ""
                .Unit = ""
                .Price = -1
                .Picture = ""
                .IDSeller = -1
            End With
        End If
        GetInfoProductByName = Temp
    End Function


    <WebMethod(Description:="ใช้ในการค้นหารายการสินค้าโดยใช้รหัสสินค้าในการค้นหา(Search)")> _
    Public Function GetInfoProductByID(ByVal IDProduct As Integer) As ReturnProduct
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim StrConn, sql As String
        Dim i, Block As Integer
        Dim Temp As ReturnProduct
        StrConn = "Address=161.246.6.4;Database=dbSeller2;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        sql = "select * from Product where ID = " & IDProduct
        DA1 = New SqlDataAdapter(sql, conn)
        ds1.Clear()
        DA1.Fill(ds1, "GetProduct")
        dr1 = ds1.Tables("GetProduct").Select()
        Block = UBound(dr1)
        If Block = 0 Then
            With Temp
                .ID = dr1(0)("ID")
                .Name = dr1(0)("Name")
                .Detail = dr1(0)("Detail")
                .Unit = dr1(0)("Unit")
                .Price = dr1(0)("Price")
                .Picture = dr1(0)("Picture")
                .IDSeller = IDSell
            End With
        Else
            With Temp
                .ID = -1
                .Name = ""
                .Detail = ""
                .Unit = ""
                .Price = -1
                .Picture = ""
                .IDSeller = -1
            End With
        End If
        conn.Close()
        GetInfoProductByID = Temp
    End Function

    <WebMethod(Description:="ใช้ในการค้นหารายการสินค้าโดยใช้ชื่อสินค้าในการค้นหา(Search)")> _
    Public Function AddOrder(ByVal DateOrder As String, ByVal IDProduct As Integer, ByVal Quantity As Integer, ByVal IDBuyer As Integer, ByVal Name As String, ByVal Address As String, ByVal province As String, ByVal zipcode As String, ByVal WayPay As String) As Boolean
        Try
            Dim conn As SqlConnection = New SqlConnection()
            Dim StrConn, DB_name, sql As String
            StrConn = "Address=161.246.6.4;Database=dbseller2;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            '-------way pay---------------
            Dim GetMoney As Byte
            If WayPay = "บัตรเครดิต" Then
                GetMoney = 1
            Else 'เก็บเงินปลายทาง
                GetMoney = 0
            End If
            '----------------------------
            Dim command1 As SqlCommand = New SqlCommand()
            sql = "Insert Into Ordersell(DateOrder,IDProduct,Quantity,IDBuyer,Name,Address,Province,Zipcode,Waypay,getmoney)"
            sql &= " Values('" & DateOrder & "'," & IDProduct & "," & Quantity & "," & IDBuyer & ",'" & Name & "','" & Address & "','" & province & "','" & zipcode & _
                   "','" & WayPay & "'," & GetMoney & ")"
            With command1
                .CommandType = CommandType.Text
                .CommandText = sql
                .Connection = conn
                .ExecuteNonQuery()
            End With
            conn.Close()
            Return True
        Catch
            Return False
        End Try
    End Function


    <WebMethod(Description:="ใช้ในการค้นหารายการสินค้าที่ต้องส่ง(Search)")> _
       Public Function SearchOrder() As DataSet
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim StrConn, sql As String
        StrConn = "Address=161.246.6.4;Database=dbSeller2;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        sql = "SELECT OrderSell.DateOrder as วันที่, Product.Name as ชื่อสินค้า, OrderSell.Quantity as จำนวน, OrderSell.Name as ชื่อผู้รับ, OrderSell.Address as ที่อยู่, OrderSell.Province as จังหวัด, OrderSell.Zipcode as รหัส, OrderSell.WayPay as จ่ายโดย, OrderSell.Send as ส่ง, OrderSell.GetMoney as รับเงิน" & _
                " FROM Product INNER JOIN OrderSell ON Product.ID = OrderSell.IDProduct"
        DA1 = New SqlDataAdapter(sql, conn)
        ds1.Clear()
        DA1.Fill(ds1, "order")
        Return ds1
    End Function

    <WebMethod(Description:="ใช้ในการปรับปรุงรายการสินค้าที่ต้องส่ง(Search)")> _
     Public Function UpdateOrder(ByVal DateOrder As String, ByVal IDProduct As Integer, ByVal IDBuyer As Integer, ByVal send As Boolean, ByVal getmoney As Boolean) As Boolean
        Dim conn As SqlConnection = New SqlConnection()
        Dim StrConn, DB_name, sql As String
        Dim sendB, getmoneyB As Byte
        If send Then
            sendB = 1
        Else
            sendB = 0
        End If
        If getmoney Then
            getmoneyB = 1
        Else
            sendB = 0
        End If
        StrConn = "Address=161.246.6.4;Database=dbseller2;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        Dim command1 As SqlCommand = New SqlCommand()
        sql = "Update ordersell set send = " & sendB & ",getmoney=" & getmoneyB & _
                " where (Dateorder='" & DateOrder & "' and IDProduct=" & IDProduct & " and IDBuyer=" & IDBuyer & ")"
        With command1
            .CommandType = CommandType.Text
            .CommandText = sql
            .Connection = conn
            .ExecuteNonQuery()
        End With
        conn.Close()
    End Function
End Class
