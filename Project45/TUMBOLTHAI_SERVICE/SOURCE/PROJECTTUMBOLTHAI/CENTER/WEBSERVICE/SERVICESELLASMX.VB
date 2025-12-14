Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.IO
Imports System.Web
Imports System.Web.Mail

<WebService(Namespace := "http://tempuri.org/")> _
Public Class ServiceSell
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
    Structure ReturnInfoProduct
        Dim ID As Integer
        Dim Name As String
        Dim Detail As String
        Dim Unit As String
        Dim Price As String
        Dim Picture As String
        Dim IDSeller As Integer
    End Structure

    Structure ReturnInfoBasket
        Dim IDProduct As Integer
        Dim Quantity As Integer
        Dim IDSeller As Integer
    End Structure

    Structure ReturnInfoPay
        Dim Name As String
        Dim Detail As String
    End Structure
    Structure ReturnOrder
        Dim DateOrder As String
        Dim NameProduct As String
        Dim Quantity As String
        Dim Price As String
        'Dim Address As String
        Dim Waypay As String
        Dim Send As Boolean
        Dim GetMoney As Boolean
    End Structure

    Dim srv1 As Servicesell1.ServiceSell1 = New Servicesell1.ServiceSell1()
    Dim srv2 As Servicesell2.ServiceSell2 = New Servicesell2.ServiceSell2()
    Dim Data1() As Servicesell1.ReturnProduct
    Dim Data2() As Servicesell2.ReturnProduct
    Dim SrvBank As ServiceBank.ServiceBank = New ServiceBank.ServiceBank()

    <WebMethod(Description:="ใช้สำหรับค้นหาสินค้าโดยใช้ IDProduct และ IDSell จากร้านค้า")> _
        Public Function SearchProductByID(ByVal StrIDProduct As String, ByVal StrIDSeller As String) As ReturnInfoProduct

        Dim Temp As ReturnInfoProduct
        'Dim Rownum, i, j As Integer
        Dim IDProductInt, IDSellInt As Integer
        IDProductInt = Val(StrIDProduct)
        IDSellInt = Val(StrIDSeller)

        Select Case IDSellInt
            Case 1
                ReDim Data1(0)
                Data1(0) = srv1.GetInfoProductByID(IDProductInt)
                With Temp
                    .ID = Data1(0).ID
                    .Name = Data1(0).Name
                    .Detail = Data1(0).Detail
                    .Unit = Data1(0).Unit
                    .Picture = Data1(0).Picture
                    .Price = Data1(0).Price
                    .IDSeller = Data1(0).IDSeller
                End With
            Case 2
                ReDim Data2(0)
                Data2(0) = srv2.GetInfoProductByID(IDProductInt)
                With Temp
                    .ID = Data2(0).ID
                    .Name = Data2(0).Name
                    .Detail = Data2(0).Detail
                    .Unit = Data2(0).Unit
                    .Picture = Data2(0).Picture
                    .Price = Data2(0).Price
                    .IDSeller = Data2(0).IDSeller
                End With
        End Select
        SearchProductByID = Temp
    End Function


    <WebMethod(Description:="ใช้สำหรับค้นหาสินค้าโดยใช้ NameProduct จากร้านค้าทุกร้าน")> _
    Public Function SearchProductByName(ByVal NameProduct As String, ByVal Detail As String, ByVal PriceStr As String) As ReturnInfoProduct()

        Dim Temp() As ReturnInfoProduct
        Dim Rownum, i, j As Integer
        Data1 = srv1.GetInfoProductByName(NameProduct, Detail, PriceStr)
        Data2 = srv2.GetInfoProductByName(NameProduct, Detail, PriceStr)
        'i = UBound(Data1) + 1
        Rownum = -1
        For j = 0 To UBound(Data1)
            If Data1(j).ID <> -1 Then
                Rownum += 1
                ReDim Preserve Temp(Rownum)
                Temp(Rownum).ID = Data1(j).ID
                Temp(Rownum).Name = Data1(j).Name
                Temp(Rownum).Detail = Data1(j).Detail
                Temp(Rownum).Unit = Data1(j).Unit
                Temp(Rownum).Picture = Data1(j).Picture
                Temp(Rownum).Price = Data1(j).Price
                Temp(Rownum).IDSeller = Data1(j).IDSeller
            End If
        Next
        'i = UBound(Data2) + 1
        For j = 0 To UBound(Data2)
            If Data2(j).ID <> -1 Then
                Rownum += 1
                ReDim Preserve Temp(Rownum)
                Temp(Rownum).ID = Data2(j).ID
                Temp(Rownum).Name = Data2(j).Name
                Temp(Rownum).Detail = Data2(j).Detail
                Temp(Rownum).Unit = Data2(j).Unit
                Temp(Rownum).Picture = Data2(j).Picture
                Temp(Rownum).Price = Data2(j).Price
                Temp(Rownum).IDSeller = Data2(j).IDSeller
            End If
        Next

        If Rownum = -1 Then 'ดูว่ามี row หรือเปล่า แต่นี้แสดงว่าไม่มี
            ReDim Temp(0)
            With Temp(0)
                .ID = -1
                .Name = ""
                .Detail = ""
                .Unit = ""
                .Picture = ""
                .Price = -1
                .IDSeller = -1
            End With
        End If
        SearchProductByName = Temp
    End Function


    <WebMethod(Description:="ใช้สำหรับหยิบของใส่ตระกล้า", EnableSession:=True)> _
    Public Function PutInBasket(ByVal IP As String, ByVal StrIDProduct As String, ByVal StrQuantity As String, ByVal StrIDSeller As String) As Boolean
        'ต้องนำIP ไปดูว่าหมดเวลาหรือยังถ้าหมดแล้ว ต้องต่อเวลาให้อีก 10 นาที่จาก now
        'ถ้ายังไม่หมด ก็ทำการ Addของมูล ใส่ basket
        'มีกรณี่ ที่ put ไม่ได้คือ  ไม่มีข้อมูลของ user ใน session
        Dim IDUser, IDProduct, Quantity, IDSeller As Integer
        Dim check As Boolean = False
        IDProduct = Val(StrIDProduct)
        Quantity = Val(StrQuantity)
        IDSeller = Val(StrIDSeller)
        IDUser = SetTimeSession(IP)
        If ((IDUser <> -1) And (Quantity > 0)) Then 'ทำการ Add ข้อมูลสินค้า ลงBasket
            Dim conn As SqlConnection = New SqlConnection()
            Dim command1 As SqlCommand = New SqlCommand()
            Dim DA1 As SqlDataAdapter
            Dim ds1 As DataSet = New DataSet()
            Dim dr1() As DataRow
            Dim StrConn, sql As String
            StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            'ทำการ check ว่ามีสินค้าชนิดนี้อยู่ใน basket หรือยังถ้ามีแล้ว ต้อง update quantity 
            'ถ้าไม่ มีทำการ Add row เพิ่ม
            sql = "select Quantity from basket where iduser =" & IDUser & " and " & _
             "idproduct =" & IDProduct & " and idseller =" & IDSeller
            DA1 = New SqlDataAdapter(sql, conn)
            ds1.Clear()
            DA1.Fill(ds1, "Basket")
            dr1 = ds1.Tables("Basket").Select()
            'ในกรณีนี้จะ return ค่าจริงเมื่อมี row เดียว
            'UBound([Array]) จะ return ค่า คือ row-1
            If UBound(dr1) > -1 Then 'ถ้ามีสินค้าที่เคยสั่งชนิดเดียวกับที่มีอยู่แล้ว
                sql = "update basket set quantity= " & dr1(0)("Quantity") + Quantity & _
                    " where iduser =" & IDUser & " and " & _
                    "idproduct =" & IDProduct & " and idseller =" & IDSeller
            Else 'ถ้าไม่เคยซื้อก็ทำการ Add สินค้า ใหม่เข้าไป
                sql = "Insert Into Basket(IP,IDUser,IDProduct,Quantity,IDSeller)"
                sql &= " Values('" & IP & "'," & IDUser & "," & IDProduct & "," & _
                        Quantity & "," & IDSeller & ")"
            End If
            With command1
                .CommandType = CommandType.Text
                .CommandText = sql
                .Connection = conn
                .ExecuteNonQuery()
            End With
            check = True
        End If
        Return check
    End Function


    Private Function SetTimeSession(ByVal IP As String) As Integer
        'ต้องตรวจสอบด้วยไว่มีipนี้อยู่หรือไม่ถ้าไม่มี คืน false 
        'ถ้ามีตรวจสอบว่า หมดเวลาหรือยัง ถ้าหมดแลว ต้อง เพิ่มเวลาไปอีก 10 นาที
        Dim Applica, SplitApp(), TempOld, TempNew As String
        Dim i, IDUser As Integer
        IDUser = -1
        Applica = Context.Application("AuthenIP")
        If Applica Is Nothing Then Applica = ""
        SplitApp = Applica.Split(",")
        For i = 0 To UBound(SplitApp) - 1 Step +3
            If SplitApp(i) = IP Then
                IDUser = SplitApp(i + 1)
                If SplitApp(i + 2) < Now Then 'เวลาหมดหรือยัง
                    TempOld = SplitApp(i) & "," & SplitApp(i + 1) & "," & SplitApp(i + 2) & ","
                    TempNew = SplitApp(i) & "," & SplitApp(i + 1) & "," & DateAdd(DateInterval.Minute, 10, Now) & ","
                    Applica = Applica.Replace(TempOld, TempNew)
                    Context.Application.Lock()
                    Context.Application("AuthenIP") = Applica
                    Context.Application.UnLock()
                End If
                Exit For
            End If
        Next
        Return IDUser
    End Function

    <WebMethod(Description:="ใช้สำหรับ ดึงข้อมูลสินค้าออกจาก รถเข็น ยังไม่ได้ทำ", EnableSession:=True)> _
    Public Function GetInBasket(ByVal IP As String) As ReturnInfoBasket()
        Dim i, j, IDUser, row As Integer
        Dim temp() As ReturnInfoBasket
        IDUser = SetTimeSession(IP)
        If IDUser > -1 Then ' แสดงว่ามี ลูกค้าคนนั้นอยู่
            Dim conn As SqlConnection = New SqlConnection()
            Dim DA1 As SqlDataAdapter
            Dim ds1 As DataSet = New DataSet()
            Dim dr1() As DataRow
            Dim StrConn, sql As String
            StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            sql = "select IdProduct,Quantity,IDSeller from basket where iduser =" & IDUser
            DA1 = New SqlDataAdapter(sql, conn)
            ds1.Clear()
            DA1.Fill(ds1, "Basket")
            dr1 = ds1.Tables("Basket").Select()
            row = UBound(dr1)
            If row >= 0 Then 'แก้ error เมื่อไม่มีสินค้าในbasket
                ReDim temp(row)
                For j = 0 To row
                    With temp(j)
                        .IDProduct = dr1(j)("IDProduct")
                        .Quantity = dr1(j)("Quantity")
                        .IDSeller = dr1(j)("IDSeller")
                    End With
                Next
            Else
                ReDim temp(0)
                With temp(0)
                    .IDProduct = -1
                    .Quantity = -1
                    .IDSeller = -1
                End With
            End If
        Else
            ReDim temp(0)
            With temp(0)
                .IDProduct = -1
                .Quantity = -1
                .IDSeller = -1
            End With
        End If
        Return temp
    End Function
    <WebMethod(Description:="ใช้สำหรับ ลบข้อมูลสินค้าออกจาก รถเข็น ยังไม่ได้ทำ", EnableSession:=True)> _
        Public Function DeleteInbasket(ByVal IP As String, ByVal StrIDProduct As String, ByVal StrIDSell As String) As Boolean
        Dim IDUser, IDProduct, IDSeller As Integer
        Dim Check As Boolean = False
        Dim conn As SqlConnection = New SqlConnection()
        Dim command1 As SqlCommand = New SqlCommand()
        Dim StrConn, sql As String
        IDUser = SetTimeSession(IP)
        If IDUser > -1 Then ' แสดงว่ามี ลูกค้าคนนั้นอยู่
            IDProduct = Val(StrIDProduct)
            IDSeller = Val(StrIDSell)

            StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            sql = "Delete from Basket"
            sql &= " Where(IDuser= " & IDUser & " And IDProduct=" & IDProduct & _
                   " and IDSeller = " & IDSeller & ")"

            With command1
                .CommandType = CommandType.Text
                .CommandText = sql
                .Connection = conn
                .ExecuteNonQuery()
            End With
            Check = True
        End If
        Return Check
    End Function

    <WebMethod(Description:="ใช้สำหรับ เปลี่ยนแปลงข้อมูลจำนวนของสินค้าใน รถเข็น", EnableSession:=True)> _
           Public Function UpdateQuantityInbasket(ByVal IP As String, ByVal StrIDProduct As String, ByVal StrQuantity As String, ByVal StrIDSell As String) As Boolean
        Dim IDUser, IDProduct, IDSeller, Quantity As Integer
        Dim Check As Boolean = False
        Dim conn As SqlConnection = New SqlConnection()
        Dim command1 As SqlCommand = New SqlCommand()
        Dim StrConn, sql As String
        IDUser = SetTimeSession(IP)
        Quantity = Val(StrQuantity)
        If ((IDUser > -1) And (Quantity > 0)) Then ' แสดงว่ามี ลูกค้าคนนั้นอยู่
            IDProduct = Val(StrIDProduct)
            IDSeller = Val(StrIDSell)

            StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            sql = "Update Basket set Quantity=" & Quantity
            sql &= " Where(IDuser= " & IDUser & " And IDProduct=" & IDProduct & _
                   " and IDSeller = " & IDSeller & ")"
            With command1
                .CommandType = CommandType.Text
                .CommandText = sql
                .Connection = conn
                .ExecuteNonQuery()
            End With
            Check = True
        End If
        Return Check
    End Function

    <WebMethod(Description:="ใช้สำหรับขายสินค้าใน รถเข็น", EnableSession:=True)> _
           Public Function CheckOut(ByVal IP As String, ByVal IDCradit As String, ByVal PasswordCradit As String, ByVal Name As String, ByVal Address As String, ByVal Province As String, ByVal Zipcode As String, ByVal WayPay As String, ByVal Email As String) As Boolean
        Dim SumPrice As Decimal = SumBasket(IP)
        Dim Temp As Boolean = False
        Dim DateNow As Date
        Dim StrMail As String
        If SumPrice > -1 Then 'ถ้าไม่เท่ากัน -1 แส่ดงว่ามีuser คนนั้นชื่อของอยู่
            If WayPay = "บัตรเครดิต" Then
                If SrvBank.BankingCheck(IDCradit, PasswordCradit, SumPrice) = False Then
                    Return False
                    Exit Function
                End If
            End If

            Dim IDUser As Integer = SetTimeSession(IP)
            If IDUser > -1 Then
                Dim conn As SqlConnection = New SqlConnection()
                Dim DA1 As SqlDataAdapter
                Dim ds1 As DataSet = New DataSet()
                Dim dr1(), drSell1(), drSell2() As DataRow
                Dim StrConn, sql As String
                Dim row, i As Integer
                StrConn = "Address=161.246.6.4;Database=tumbolthai;uid=off;pwd=off"
                With conn
                    If .State = ConnectionState.Open Then .Close()
                    .ConnectionString = StrConn
                    .Open()
                End With
                sql = "select IdProduct,Quantity,IDSeller from basket where iduser =" & IDUser
                DA1 = New SqlDataAdapter(sql, conn)
                ds1.Clear()
                DA1.Fill(ds1, "Basket")
                dr1 = ds1.Tables("Basket").Select()

                sql = "Select Name,IDBook ,NameBook from Seller where ID =1"
                DA1 = New SqlDataAdapter(sql, conn)
                DA1.Fill(ds1, "Seller1")
                drSell1 = ds1.Tables("Seller1").Select

                sql = "Select Name,IDBook ,NameBook from Seller where ID =2"
                DA1 = New SqlDataAdapter(sql, conn)
                DA1.Fill(ds1, "Seller2")
                drSell2 = ds1.Tables("Seller2").Select

                row = UBound(dr1)
                If row >= 0 Then 'แก้ error เมื่อไม่มีสินค้าในbasket
                    '-------way pay---------------
                    Dim GetMoney As Byte
                    If WayPay = "บัตรเครดิต" Then
                        GetMoney = 1
                    Else 'ธนาณัติ โอนเงิน ATM เก็บเงินปลายทาง
                        GetMoney = 0
                    End If
                    '----------------------------
                    Dim command1 As SqlCommand = New SqlCommand()
                    For i = 0 To row
                        If dr1(i)("IdSeller") = 1 Then
                            ReDim Data1(0)
                            Data1(0) = srv1.GetInfoProductByID(dr1(i)("IDProduct"))
                            StrMail += dr1(i)("Quantity") & " อัน" & vbTab & Data1(0).Name & vbTab & Data1(0).Price * dr1(i)("Quantity") & "บาท" & vbCrLf
                            'TempMoney += dr1(i)("Quantity") * Data1(0).Price
                            If Data1(0).ID > -1 Then
                                'กรณี่ที่ ส่งสินค้าไปให้ได้ก็โอนเงินไป
                                DateNow = Now.Now
                                If srv1.AddOrder(DateNow.ToString, dr1(i)("IDProduct"), dr1(i)("Quantity"), IDUser, Name, Address, Province, Zipcode, WayPay) = True Then
                                    If WayPay = "บัตรเครดิต" Then
                                        SrvBank.BankingPayment(IDCradit, PasswordCradit, drSell1(0)("NameBook"), drSell1(0)("IDBook"), Data1(0).Price * dr1(i)("Quantity"))
                                    End If 'นอกนั้นจ่ายเก็บเงินปลายทาง ธนาณัติ โอนเงิน ATM

                                    'ทำการ add สินค้า ใน Order sellเพื่อยืนยันว่าส่งสินค้าไปแล้ว
                                    sql = "Insert Into OrderSell(DateOrder,IDProduct,NameProduct,Quantity,Price,IDBuyer,Name,Address,Province,Zipcode,NameSeller,IDSeller,waypay,getmoney)"
                                    sql &= " Values('" & DateNow.ToString & "'," & dr1(i)("IDProduct") & ",'" & Data1(0).Name & "'," & dr1(i)("Quantity") & "," & _
                                            Data1(0).Price & "," & IDUser & ",'" & Name & "','" & Address & "','" & Province & "','" & Zipcode & "','" & _
                                             drSell1(0)("Name") & "'," & Data1(0).IDSeller & ",'" & WayPay & "'," & GetMoney & ")"
                                    With command1
                                        .CommandType = CommandType.Text
                                        .CommandText = sql
                                        .Connection = conn
                                        .ExecuteNonQuery()
                                    End With
                                End If
                            End If
                        ElseIf dr1(i)("IDSeller") = 2 Then
                            ReDim Data2(0)
                            Data2(0) = srv2.GetInfoProductByID(dr1(i)("IDProduct"))
                            'TempMoney += dr1(i)("Quantity") * Data2(0).Price
                            StrMail += dr1(i)("Quantity") & " อัน" & vbTab & Data2(0).Name & vbTab & Data2(0).Price * dr1(i)("Quantity") & "บาท" & vbCrLf
                            If Data2(0).ID > -1 Then
                                'กรณี่ที่ ส่งสินค้าไปให้ได้ก็โอนเงินไป
                                DateNow = Now
                                If srv2.AddOrder(DateNow.ToString, dr1(i)("IDProduct"), dr1(i)("Quantity"), IDUser, Name, Address, Province, Zipcode, WayPay) = True Then
                                    If WayPay = "บัตรเครดิต" Then
                                        SrvBank.BankingPayment(IDCradit, PasswordCradit, drSell2(0)("NameBook"), drSell2(0)("IDBook"), Data2(0).Price * dr1(i)("Quantity"))
                                    End If

                                    sql = "Insert Into OrderSell(DateOrder,IDProduct,NameProduct,Quantity,Price,IDBuyer,Name,Address,Province,Zipcode,NameSeller,IDSeller,waypay,getmoney)"
                                    sql &= " Values('" & DateNow.ToString & "'," & dr1(i)("IDProduct") & ",'" & Data2(0).Name & "'," & dr1(i)("Quantity") & "," & _
                                            Data2(0).Price & "," & IDUser & ",'" & Name & "','" & Address & "','" & Province & "','" & Zipcode & "','" & _
                                             drSell2(0)("Name") & "'," & Data2(0).IDSeller & ",'" & WayPay & "'," & GetMoney & ")"
                                    With command1
                                        .CommandType = CommandType.Text
                                        .CommandText = sql
                                        .Connection = conn
                                        .ExecuteNonQuery()
                                    End With
                                End If

                            End If
                        End If
                    Next
                    '----ส่งemail --------------------------------
                    Dim dataPay() As ReturnInfoPay = GetWayPay(WayPay)
                    StrMail += vbCrLf & "รวมทั้งสิ้น" & vbTab & SumPrice & "บาท" & vbCrLf
                    StrMail += "จ่ายเงินแบบ " & WayPay & vbTab & "  โดย : " & dataPay(0).Detail
                    StrMail += vbCrLf & "หลังจากทำการชำระเงินแล้วให้ท่าน FAX สำเนานำฝาก พร้อมแนบรายการสินค้า  มาที่เบอร์ Fax 0-2852-3698 หรือ ส่ง Emailมาที่ TumbolThai@ksc.com"
                    SendMail("Tumbolthai@ksc.com", Email, StrMail)
                    '---------------------------------------------
                    'ทำการลบสินค้าในตระกล้า
                    sql = "Delete from Basket"
                    sql &= " Where(IDUser= " & IDUser & ")"
                    With command1
                        .CommandType = CommandType.Text
                        .CommandText = sql
                        .Connection = conn
                        .ExecuteNonQuery()
                    End With
                End If
                'Else
                'TempMoney = -1
            End If
            Temp = True

        End If

        Return Temp
    End Function

    'จำลองธนาคาร โดยจะให้ idcradit password จำนวนเงินที่จะจ่าย
    'Private Function BankingCheck(ByVal IDCradit As String, ByVal PasswordCradit As String, ByVal Price As Decimal) As Boolean
    '    Return True
    'End Function

    'Private Sub BankingPayment(ByVal IDCradit As String, ByVal PasswordCradit As String, ByVal NameBookReceive As String, ByVal IDBookReceive As String, ByVal Price As Decimal)
    'End Sub

    '-----------------------------------------------

    <WebMethod(Description:="ใช้สำหรับรวมเงินของสินค้าใน รถเข็น", EnableSession:=True)> _
               Public Function SumBasket(ByVal IP As String) As Decimal
        'ทำการรวม เงินของuserคนนั้น แล้วจะคืนจำนวนเงิน ถ้า เป็น -1 แสดงว่าคนคนนั้นไม่ได้ทำการ loginเข้ามา
        Dim TempMoney As Decimal = 0
        Dim IDUser As Integer
        IDUser = SetTimeSession(IP)
        If IDUser > -1 Then
            Dim conn As SqlConnection = New SqlConnection()
            Dim DA1 As SqlDataAdapter
            Dim ds1 As DataSet = New DataSet()
            Dim dr1() As DataRow
            Dim StrConn, sql As String
            Dim row, i As Integer
            StrConn = "Address=161.246.6.4;Database=tumbolthai;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            sql = "select IdProduct,Quantity,IDSeller from basket where iduser =" & IDUser
            DA1 = New SqlDataAdapter(sql, conn)
            ds1.Clear()
            DA1.Fill(ds1, "Basket")
            dr1 = ds1.Tables("Basket").Select()
            row = UBound(dr1)
            If row >= 0 Then 'แก้ error เมื่อไม่มีสินค้าในbasket
                For i = 0 To row
                    If dr1(i)("IdSeller") = 1 Then
                        ReDim Data1(0)
                        Data1(0) = srv1.GetInfoProductByID(dr1(i)("IDProduct"))
                        If Data1(0).ID > -1 Then
                            TempMoney += dr1(i)("Quantity") * Data1(0).Price
                        End If
                    ElseIf dr1(i)("IDSeller") = 2 Then
                        ReDim Data2(0)
                        Data2(0) = srv2.GetInfoProductByID(dr1(i)("IDProduct"))
                        If Data2(0).ID > -1 Then
                            TempMoney += dr1(i)("Quantity") * Data2(0).Price
                        End If
                    End If
                Next
            End If
        Else
            TempMoney = -1
        End If
        Return TempMoney
    End Function
    <WebMethod(Description:="ใช้สำหรับตรวจสอบว่าstringนั้นเป็นตัวเลขทั้งหมดหรือไม่")> _
    Public Function CheckStrIsNumAll(ByVal Str As String) As Boolean
        Dim LengthStr As Integer = Str.Length
        Dim i As Integer
        Dim ch As String
        Dim Temp As Boolean = True
        For i = 1 To LengthStr
            ch = Asc(Mid(Str, i, 1))
            If ch < 48 Or ch > 57 Then
                Temp = False
                Exit For
            End If
        Next
        Return Temp
    End Function

    <WebMethod(Description:="ใช้สำหรับตรวจสอบว่าstringนั้นเป็นตัวหนังสือทั้งหมดหรือไม่")> _
    Public Function CheckStrIsTextAll(ByVal Str As String) As Boolean
        Dim LengthStr As Integer = Str.Length
        Dim i As Integer
        Dim ch As String
        Dim Temp As Boolean = True
        For i = 1 To LengthStr
            ch = Asc(Mid(Str, i, 1))
            If ch > 48 And ch < 57 Then
                Temp = False
                Exit For
            End If
        Next
        Return Temp
    End Function

    <WebMethod(Description:="ใช้สำหรับตรวจสอบว่าstringนั้นเป็นตัวหนังสือทั้งหมดหรือไม่")> _
    Public Function GetWayPay(ByVal Name As String) As ReturnInfoPay()
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim StrConn, sql As String
        Dim i, Block As Integer
        Dim Temp As ReturnInfoPay()
        StrConn = "Address=161.246.6.4;Database=TumbolThai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        sql = "select * from Waypay where namepay like '" & Name & "%'"
        DA1 = New SqlDataAdapter(sql, conn)
        ds1.Clear()
        DA1.Fill(ds1, "GetProduct")
        dr1 = ds1.Tables("GetProduct").Select()
        Block = UBound(dr1)
        ReDim Temp(Block)
        For i = 0 To Block
            Temp(i).Name = dr1(i)("namepay")
            Temp(i).Detail = dr1(i)("Detail")
        Next
        Return Temp
    End Function


    <WebMethod(Description:="ใช้สำหรับส่งจดหมาย")> _
    Public Function SendMail(ByVal Frommail As String, ByVal Tomail As String, ByVal message As String) As Boolean
        Dim ms As New MailMessage()
        'Dim ToMail As String = "nattiga_s@hotmail.com" '"nattiga@hotmail.com@hotmail.com"
        'Dim MailFrom As String = "off@off.off.com"
        'Dim DetailOfCustomer As String
        'DetailOfCustomer = "Customer Name : " & DataRowOfCustomer("Name") & vbCrLf
        'DetailOfCustomer &= "Customer Phone : " & DataRowOfCustomer("Phone") & vbCrLf
        'DetailOfCustomer &= "Customer E-Mail : " & DataRowOfCustomer("EMail") & vbCrLf
        'DetailOfCustomer &= "Reserved => " & vbCrLf
        'DetailOfCustomer &= "HallName : " & HallName & vbCrLf
        'DetailOfCustomer &= "Date : " & DateReserved & vbCrLf
        'DetailOfCustomer &= "Time : " & TimeReserved & vbCrLf
        'DetailOfCustomer = "เป็นการทดสอบการใช้ Email ว่าใช้งานได้จริงหรือไม่" & vbCrLf & StrDup(20, "-") & _
        '                   vbCrLf & "เป็นอย่างไรใช้ได้หรือไม่ ครับ"
        'DetailOfCustomer = "ตกใจเหรอ อิอิ เราคิดถึงไงเลยส่งมาให้แต่พอดีส่งเพลินไปหน่อยนะ 555"
        message = "วันที่  " & Now.Date.ToLongDateString & "  เวลา " & Now.TimeOfDay.ToString & vbCrLf & StrDup(100, "-") & vbCrLf & message & _
                    vbCrLf & StrDup(100, "-") & vbCrLf & "ขอบคุณที่ใช้บริการตำบลไทย (http://161.246.6.4/projecttumbolthai/webapplicationcenter/index.htm)"

        ms.To = Tomail
        ms.From = Frommail
        ms.Body = message
        ms.BodyFormat = MailFormat.Text
        ms.Subject = "บริการตำบลไทย"
        'ms.Attachments.Add(matt)
        SmtpMail.SmtpServer = "161.246.10.21" '"mail.kmitl.ac.th"
        Dim i As Integer
        ' For i = 0 To 50
        SmtpMail.Send(ms)
        'Next

    End Function

    <WebMethod(Description:="ดูสินค้าที่ซื้อไปแล้ว", EnableSession:=True)> _
    Public Function CheckStatusSelled(ByVal IP As String) As ReturnOrder()
        Dim iduser As Integer
        iduser = SetTimeSession(IP)
        If iduser > -1 Then ' แสดงว่ามี ลูกค้าคนนั้นอยู่
            Dim conn As SqlConnection = New SqlConnection()
            Dim DA1 As SqlDataAdapter
            Dim ds1 As DataSet = New DataSet()
            Dim dr1() As DataRow
            Dim StrConn, sql As String
            Dim Block, i As Integer
            Dim temp() As ReturnOrder
            StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            sql = "select DateOrder,NameProduct,quantity,Price,Waypay,Getmoney,Send from ordersell where IDBuyer =" & iduser
            DA1 = New SqlDataAdapter(sql, conn)
            ds1.Clear()
            DA1.Fill(ds1, "order")
            dr1 = ds1.Tables("order").Select()
            Block = UBound(dr1)
            ReDim temp(Block)
            For i = 0 To Block
                temp(i).DateOrder = dr1(i)("dateorder")
                temp(i).NameProduct = dr1(i)("NameProduct")
                temp(i).Quantity = dr1(i)("quantity")
                temp(i).Price = dr1(i)("Price") * dr1(i)("quantity")
                'temp(i).Address = dr1(i)("Address") & dr1(i)("Privince") & dr1(i)("Zipcode")
                temp(i).Waypay = dr1(i)("waypay")
                temp(i).Send = dr1(i)("send")
                temp(i).GetMoney = dr1(i)("Getmoney")
            Next
            Return temp
        End If
    End Function

    <WebMethod(Description:="ใช้ในการค้นหารายการสินค้าที่ต้องส่ง(Search)")> _
       Public Function SearchOrder(ByVal Username As String, ByVal Password As String) As DataSet
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim StrConn, sql As String
        Dim row As Integer
        Dim temp() As ReturnOrder
        StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        sql = "select id from seller where username='" & Username & "' and Password='" & Password & "'"
        DA1 = New SqlDataAdapter(sql, conn)
        ds1.Clear()
        DA1.Fill(ds1, "order")
        dr1 = ds1.Tables("order").Select()
        row = UBound(dr1)
        If row = 0 Then 'แก้ error เมื่อไม่มีสินค้าในbasket
            If dr1(0)("id") = 1 Then
                Return srv1.SearchOrder()
                Exit Function
            Else
                Return srv2.SearchOrder()
                Exit Function
            End If
        End If
    End Function

End Class
