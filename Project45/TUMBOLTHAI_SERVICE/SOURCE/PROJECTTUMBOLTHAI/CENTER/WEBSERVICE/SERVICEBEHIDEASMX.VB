Imports System.Web.Services
Imports System.Data.SqlClient
<WebService(Namespace := "http://tempuri.org/")> _
Public Class ServiceBehide
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
    Structure ReturnUpdateOrder
        Dim ID As String
        Dim DateOrder As String
        Dim IDProduct As Integer
        Dim NameProduct As String
        Dim Quantity As String
        Dim Price As Decimal
        Dim IDBuyer As Integer
        Dim NameBuyer As String
        Dim IDSeller As Integer
        Dim Send As Boolean
        Dim Getmoney As Boolean
    End Structure
    ' WEB SERVICE EXAMPLE
    ' The HelloWorld() example service returns the string Hello World.
    ' To build, uncomment the following lines then save and build the project.
    ' To test this web service, ensure that the .asmx file is the start page
    ' and press F5.
    '
    '<WebMethod()> Public Function HelloWorld() As String
    '	HelloWorld = "Hello World"
    ' End Function
    Dim srv1 As Servicesell1.ServiceSell1 = New Servicesell1.ServiceSell1()
    Dim srv2 As Servicesell2.ServiceSell2 = New Servicesell2.ServiceSell2()
    <WebMethod(Description:="ใช้ในการปรับปรุงรายการสินค้าที่ต้องส่ง(Search)")> _
     Public Function UpdateOrder(ByVal DateOrder As String, ByVal IDProduct As Integer, ByVal IDBuyer As Integer, ByVal send As Boolean, ByVal getmoney As Boolean, ByVal IDSeller As Integer) As Boolean
        Try
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
                getmoneyB = 0
            End If
            StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            Dim command1 As SqlCommand = New SqlCommand()
            sql = "Update ordersell set send = " & sendB & ",getmoney=" & getmoneyB & _
                    " where (Dateorder='" & DateOrder & "' and IDProduct=" & IDProduct & " and IDBuyer=" & IDBuyer & " and IDSeller=" & IDSeller & ")"
            With command1
                .CommandType = CommandType.Text
                .CommandText = sql
                .Connection = conn
                .ExecuteNonQuery()
            End With
            conn.Close()

            If IDSeller = 1 Then
                srv1.UpdateOrder(DateOrder, IDProduct, IDBuyer, send, getmoney)
            Else
                srv2.UpdateOrder(DateOrder, IDProduct, IDBuyer, send, getmoney)
            End If
            Return True
        Catch
            Return False
        End Try
    End Function
    <WebMethod(Description:="ใช้ในการปรับปรุงรายการสินค้าที่ต้องส่ง(Search)")> _
         Public Function SearchOrderID(ByVal id As Integer) As ReturnUpdateOrder
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim StrConn, sql As String
        Dim Temp As ReturnUpdateOrder
        Dim block, i As Integer
        StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        'ทำการ check ว่ามีสินค้าชนิดนี้อยู่ใน basket หรือยังถ้ามีแล้ว ต้อง update quantity 
        'ถ้าไม่ มีทำการ Add row เพิ่ม
        sql = "select Ordersell.ID as id,DateOrder,IDProduct,NameProduct,Quantity,Price,IDBuyer,buyer.name as NameBuyer,buyer.Surname as SurnameBuyer,IDSeller,send,Getmoney from Ordersell,Buyer where Buyer.id = ordersell.idbuyer" & _
                " and  Ordersell.id =" & id
        DA1 = New SqlDataAdapter(sql, conn)
        ds1.Clear()
        DA1.Fill(ds1, "order")
        dr1 = ds1.Tables("order").Select()
        block = UBound(dr1)
        'ReDim Temp(block)
        'ในกรณีนี้จะ return ค่าจริงเมื่อมี row เดียว
        'UBound([Array]) จะ return ค่า คือ row-1
        If block > -1 Then 'ถ้ามีสินค้าที่เคยสั่งชนิดเดียวกับที่มีอยู่แล้ว
            'For i = 0 To block
            Temp.ID = dr1(i)("ID")
            Temp.DateOrder = dr1(i)("DateOrder")
            Temp.IDProduct = dr1(i)("IDProduct")
            Temp.NameProduct = dr1(i)("Nameproduct")
            Temp.Quantity = dr1(i)("quantity")
            Temp.Price = dr1(i)("price") * dr1(i)("quantity")
            Temp.IDBuyer = dr1(i)("IDBuyer")
            Temp.NameBuyer = dr1(i)("Namebuyer") & "  " & dr1(i)("SurnameBuyer")
            Temp.IDSeller = dr1(i)("IDSeller")
            Temp.Send = dr1(i)("Send")
            Temp.Getmoney = dr1(i)("getmoney")
            ' Next
        End If
        Return Temp
    End Function

    <WebMethod(Description:="ใช้ในการปรับปรุงรายการสินค้าที่ต้องส่ง(Search)")> _
     Public Function SearchOrder(ByVal NameProduct As String) As ReturnUpdateOrder()
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim StrConn, sql As String
        Dim Temp() As ReturnUpdateOrder
        Dim block, i As Integer
        StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        'ทำการ check ว่ามีสินค้าชนิดนี้อยู่ใน basket หรือยังถ้ามีแล้ว ต้อง update quantity 
        'ถ้าไม่ มีทำการ Add row เพิ่ม
        sql = "select Ordersell.ID as id,DateOrder,IDProduct,NameProduct,Quantity,Price,IDBuyer,buyer.name as NameBuyer,buyer.Surname as SurnameBuyer,IDSeller,send,Getmoney from Ordersell,Buyer where Buyer.id = ordersell.idbuyer" & _
                " and  NameProduct like '%" & NameProduct & "%'"
        DA1 = New SqlDataAdapter(sql, conn)
        ds1.Clear()
        DA1.Fill(ds1, "order")
        dr1 = ds1.Tables("order").Select()
        block = UBound(dr1)
        ReDim Temp(block)
        'ในกรณีนี้จะ return ค่าจริงเมื่อมี row เดียว
        'UBound([Array]) จะ return ค่า คือ row-1
        If block > -1 Then 'ถ้ามีสินค้าที่เคยสั่งชนิดเดียวกับที่มีอยู่แล้ว
            For i = 0 To block
                Temp(i).ID = dr1(i)("ID")
                Temp(i).DateOrder = dr1(i)("DateOrder")
                Temp(i).IDProduct = dr1(i)("IDProduct")
                Temp(i).NameProduct = dr1(i)("Nameproduct")
                Temp(i).Quantity = dr1(i)("quantity")
                Temp(i).Price = dr1(i)("price") * dr1(i)("quantity")
                Temp(i).IDBuyer = dr1(i)("IDBuyer")
                Temp(i).NameBuyer = dr1(i)("Namebuyer") & "  " & dr1(i)("SurnameBuyer")
                Temp(i).IDSeller = dr1(i)("IDSeller")
                Temp(i).Send = dr1(i)("Send")
                Temp(i).Getmoney = dr1(i)("getmoney")
            Next
        End If
        Return Temp
    End Function
End Class
