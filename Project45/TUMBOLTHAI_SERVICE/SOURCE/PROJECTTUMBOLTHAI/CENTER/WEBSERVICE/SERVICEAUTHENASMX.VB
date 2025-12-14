Imports System.Web.Services
Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.Text

<System.Web.Services.WebService(Namespace:="http://tempuri.org/")> _
Public Class ServiceAuthen
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

    Structure ReturnUser
        Dim ID As Integer
        Dim Name As String
        Dim SurName As String
        Dim Address As String
        Dim Province As String
        Dim Zipcode As String
        Dim Phone As String
        Dim Mobile As String
        Dim Email As String
    End Structure

    Structure ReturnUserRegister
        Dim Status As Boolean
        Dim Username As Boolean
        Dim Password As Boolean
        Dim Name As Boolean
        Dim Surname As Boolean
        Dim Address As Boolean
        Dim Province As Boolean
        Dim Zipcode As Boolean
        Dim Phone As Boolean
        Dim Mobile As Boolean
        Dim Email As Boolean
    End Structure

    <WebMethod(Description:="จะคืนค่ารายละเอียดของuserถ้ามี ถ้าไม่มี จะReturn ID=-1 และ infoอื่นๆ = Error", _
        EnableSession:=True)> _
    Public Function Login(ByVal username As String, ByVal password As String, ByVal IP As String) As ReturnUser
        Dim conn As SqlConnection = New SqlConnection()
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim StrConn, sql As String
        Dim AddNowDate As Date
        Dim Temp As ReturnUser
        'cryptography-------------------
        Dim md5Provider As MD5CryptoServiceProvider = New MD5CryptoServiceProvider()
        Dim data As Byte() = Encoding.ASCII.GetBytes(password)
        Dim EncryptedData As Byte() = md5Provider.ComputeHash(data)
        Dim EncryptPassword As String = Convert.ToBase64String(EncryptedData)
        '-----------------------------
        StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        sql = "select * from Buyer where username = '" & username & "'"
        sql &= " and password = '" & EncryptPassword & "'"
        DA1 = New SqlDataAdapter(sql, conn)
        ds1.Clear()
        DA1.Fill(ds1, "Login")
        dr1 = ds1.Tables("Login").Select()
        'ในกรณีนี้จะ return ค่าจริงเมื่อมี row เดียว
        'UBound([Array]) จะ return ค่า คือ row-1
        If UBound(dr1) = 0 Then 'แสดงว่ามี 1 row
            DelUserSession(IP, dr1(0)("ID"))
            'ให้session หมดเวลา ในอีก 3 ชม ข้างหน้า
            AddNowDate = DateAdd(DateInterval.Hour, 3, Now)
            Context.Application.Lock()
            Context.Application("AuthenIP") = Context.Application("AuthenIP") & IP & "," & dr1(0)("ID") & "," & AddNowDate & ","
            Context.Application.UnLock()
            With Temp
                .ID = dr1(0)("ID")
                .Name = dr1(0)("Name")
                .SurName = dr1(0)("Surname")
                .Address = dr1(0)("Address")
                .Province = dr1(0)("Province")
                .Zipcode = dr1(0)("zipcode")
                .Phone = dr1(0)("phone")
                .Mobile = dr1(0)("mobile")
                .Email = dr1(0)("Email")
            End With
        Else
            With Temp
                .ID = -1
                .Name = "Error"
                .SurName = "Error"
                .Address = "Error"
                .Province = "Error"
                .Zipcode = "Error"
                .Phone = "Error"
                .Mobile = "Error"
                .Email = "Error"
            End With
        End If
        conn.Close()
        Return Temp
    End Function

    Private Sub DelUserSession(ByVal IP As String, ByVal IDUser As Integer)
        Dim TempApp As String
        'SplitApp = CheckUserSession(Context.Application("AuthenIP"), IP)
        ' If SplitApp <> "" Then 'ดูว่ามี คนคนนี้อยู่เปล่า ถ้าเป็น""แสดงว่าไม่มี แต่ถ้ามีจะทำการลบทิ้งก่อน
        TempApp = Context.Application("AuthenIP")
        If TempApp <> "" Then
            Context.Application.Lock()
            Context.Application("AuthenIP") = SplitUserSession(TempApp, IP, IDUser)
            Context.Application.UnLock()
        End If
    End Sub

    Private Function SplitUserSession(ByVal Applica As String, ByVal IP As String, ByVal IDUser As String) As String
        Dim SplitApp(), temp As String
        Dim i As Integer
        Dim conn As SqlConnection = New SqlConnection()
        Dim command1 As SqlCommand = New SqlCommand()
        Dim StrConn, sql As String
        StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        temp = ""
        If Applica Is Nothing Then Applica = ""
        SplitApp = Applica.Split(",")
        For i = 0 To UBound(SplitApp) - 1 Step +3
            If SplitApp(i) <> IP And SplitApp(i + 1) <> IDUser Then
                temp = temp & SplitApp(i) & "," & SplitApp(i + 1) & "," & SplitApp(i + 2) & ","
            Else
                'ทำการ del สินค้าที่ user คนเก่าได้ทำการ ชื่อไว้ออก
                sql = "Delete from Basket"
                sql &= " Where(IDuser= " & CInt(SplitApp(i + 1)) & ")"
                With command1
                    .CommandType = CommandType.Text
                    .CommandText = sql
                    .Connection = conn
                    .ExecuteNonQuery()
                End With
            End If
        Next
        conn.Close()
        Return temp
    End Function

    <WebMethod(Description:="เป็น method ของการ Logout", EnableSession:=True)> _
    Public Sub Logout(ByVal IP As String)
        Dim conn As SqlConnection = New SqlConnection()
        Dim command1 As SqlCommand = New SqlCommand()
        Dim StrConn, SplitApp(), Applica, sql, temp As String
        Dim i As Integer
        StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        Applica = Context.Application("AuthenIP")
        If Applica Is Nothing Then Applica = ""
        SplitApp = Applica.Split(",")

        For i = 0 To UBound(SplitApp) - 1 Step +3
            If SplitApp(i) <> IP Then
                temp = temp & SplitApp(i) & "," & SplitApp(i + 1) & "," & SplitApp(i + 2) & ","
            Else
                'ทำการ del สินค้าที่ user คนเก่าได้ทำการ ชื่อไว้ออก โดยใข้ IP
                sql = "Delete from Basket"
                sql &= " Where(IP= '" & SplitApp(i) & "')"
                With command1
                    .CommandType = CommandType.Text
                    .CommandText = sql
                    .Connection = conn
                    .ExecuteNonQuery()
                End With
            End If
        Next
        Context.Application("AuthenIP") = temp
    End Sub
    <WebMethod(Description:="ดูว่าuserคนนั้นยังทำการloginอยู่หรือไม่", EnableSession:=True)> _
    Public Function Passport(ByVal IP As String) As ReturnUser
        Dim Applica, SplitApp(), StrTemp As String
        Dim Check As Boolean
        Dim i, IDUser As Integer
        Dim DA1 As SqlDataAdapter
        Dim ds1 As DataSet = New DataSet()
        Dim dr1() As DataRow
        Dim temp As ReturnUser
        StrTemp = ""
        Check = False
        Applica = Context.Application("AuthenIP")
        If Applica Is Nothing Then Applica = ""
        SplitApp = Applica.Split(",")
        For i = 0 To UBound(SplitApp) - 1 Step +3
            If ((SplitApp(i) = IP) And (CDate(SplitApp(i + 2)) >= Now)) Then
                Check = True
                IDUser = SplitApp(i + 1)
                Exit For
            ElseIf ((SplitApp(i) = IP) And (CDate(SplitApp(i + 2)) < Now)) Then
                StrTemp = StrTemp & SplitApp(i) & "," & SplitApp(i + 1) & "," & SplitApp(i + 2) & ","
                Exit For
            End If
        Next

        Dim conn As SqlConnection = New SqlConnection()
        Dim command1 As SqlCommand = New SqlCommand()
        Dim StrConn, sql As String
        StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With

        If StrTemp <> "" Then 'กรณีที่มี  user คนนั้น เลยเวลา
            Context.Application("AuthenIP") = Applica.Replace(StrTemp, "")
            'ลบสินค้าที่ เคย ชื้อไปแล้วออกเมื่อเวลาหมด
            sql = "Delete from Basket"
            sql &= " Where(IP= '" & SplitApp(i) & "')"
            With command1
                .CommandType = CommandType.Text
                .CommandText = sql
                .Connection = conn
                .ExecuteNonQuery()
            End With
        End If

        If Check = True Then
            'ทำการ check iduser กับ ตาราง Seller แล้วส่งค่าที่จะเป็นออกมา
            sql = "select * from Buyer where ID = " & IDUser
            DA1 = New SqlDataAdapter(sql, conn)
            ds1.Clear()
            DA1.Fill(ds1, "Buyer")
            dr1 = ds1.Tables("Buyer").Select()
            'ในกรณีนี้จะ return ค่าจริงเมื่อมี row เดียว
            'UBound([Array]) จะ return ค่า คือ row-1
            If UBound(dr1) = 0 Then 'แสดงว่ามี 1 row
                With temp
                    .ID = dr1(0)("ID")
                    .Name = dr1(0)("Name")
                    .SurName = dr1(0)("Surname")
                    .Address = dr1(0)("Address")
                    .Province = dr1(0)("Province")
                    .Zipcode = dr1(0)("zipcode")
                    .Phone = dr1(0)("phone")
                    .Mobile = dr1(0)("mobile")
                    .Email = dr1(0)("Email")
                End With
            Else
                With temp
                    .ID = -1
                    .Name = "Error"
                    .SurName = "Error"
                    .Address = "Error"
                    .Province = "Error"
                    .Zipcode = "Error"
                    .Phone = "Error"
                    .Mobile = "Error"
                    .Email = "Error"
                End With
            End If
            conn.Close()
        Else
            With temp
                .ID = -1
                .Name = "Error"
                .SurName = "Error"
                .Address = "Error"
                .Province = "Error"
                .Zipcode = "Error"
                .Phone = "Error"
                .Mobile = "Error"
                .Email = "Error"
            End With
        End If
        Return temp
    End Function

    <WebMethod(Description:="ใช้ในการสมัครสมาชิกลูกค้า")> _
       Public Function CheckRegisterBuyer(ByVal Username As String, ByVal Password As String, _
       ByVal Name As String, ByVal Surname As String, ByVal Address As String, ByVal Province As String, _
       ByVal Zipcode As String, ByVal Phone As String, ByVal Mobile As String, ByVal Email As String) As ReturnUserRegister
        Dim Temp As ReturnUserRegister
        'Init ค่าของ Temp ให้เป็นTrue
        With Temp
            .Status = True
            .Username = True
            .Password = True
            .Name = True
            .Surname = True
            .Address = True
            .Province = True
            .Zipcode = True
            .Phone = True
            .Mobile = True
            .Email = True
        End With
        'ดู username Password ว่ามีอยู่ใน DB หรือไม่ (ต้องใส่)
        If (Username <> "") And (Password <> "") Then
            'If ChkRegUsername(Username) = True Then  'Reg แล้ว 
            '  Temp.Status = False
            '  Temp.Username = False
            '  Temp.Password = False
                'End If
        Else
        Temp.Status = False
        Temp.Username = False
        Temp.Password = False
        End If
        'ดูชือ นามสกุล ห้ามมีตัวเลขอยู่ (ต้องใส่)
        If (Name <> "") And (Surname <> "") Then
            If CheckStrIsTextAll(Name) = False Then
                Temp.Status = False
                Temp.Name = False
            End If
            If CheckStrIsTextAll(Surname) = False Then
                Temp.Status = False
                Temp.Surname = False
            End If
        Else
            Temp.Status = False
            Temp.Name = False
            Temp.Surname = False
        End If
        'ดูAddress ว่า Zipcode สอดคร้องกับ Province (ต้องใส่)
        If (Zipcode <> "") And (Province <> "") And (Address <> "") Then
            If CheckStrIsNumAll(Zipcode) = False Then
                Temp.Status = False
                Temp.Address = False
                Temp.Province = False
                Temp.Zipcode = False
            End If
        Else
            Temp.Status = False
            Temp.Address = False
            Temp.Province = False
            Temp.Zipcode = False
        End If
        'ดูว่า phone mobile มีตัวหนังสืออืนไหม นอกจาก ตัวเลข กัน ( ) -
        'ดูEmail ว่ามี  @ หรือไม่
        If InStr(Email, "@", CompareMethod.Text) = 0 And Email <> "" Then
            Temp.Status = False
            Temp.Email = False
        End If
        Return Temp
    End Function


    <WebMethod(Description:="ใช้ในการสมัครสมาชิกลูกค้า")> _
    Public Function RegisterBuyer(ByVal Username As String, ByVal Password As String, _
    ByVal Name As String, ByVal Surname As String, ByVal Address As String, ByVal Province As String, _
    ByVal Zipcode As String, ByVal Phone As String, ByVal Mobile As String, ByVal Email As String) As Boolean
        Dim Temp As ReturnUserRegister
        Dim chk As Boolean = False

        If ChkRegUsername(Username) = True Then  'Reg แล้ว 
            Return False
            Exit Function
        End If

        Temp = CheckRegisterBuyer(Username, Password, Name, Surname, Address, Province, Zipcode, Phone, Mobile, Email)

        If Temp.Status = True Then 'แสดงว่าไม่ Error ทำการ Register ได้
            Dim conn As SqlConnection = New SqlConnection()
            Dim StrConn, DB_name, sql As String
            StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
            With conn
                If .State = ConnectionState.Open Then .Close()
                .ConnectionString = StrConn
                .Open()
            End With
            'cryptography-------------------
            Dim md5Provider As MD5CryptoServiceProvider = New MD5CryptoServiceProvider()
            Dim data As Byte() = Encoding.ASCII.GetBytes(Password)
            Dim EncryptedData As Byte() = md5Provider.ComputeHash(data)
            Dim EncryptPassword As String = Convert.ToBase64String(EncryptedData)
            '-----------------------------

            Dim command1 As SqlCommand = New SqlCommand()
            sql = "Insert Into Buyer(Name,Surname,Username,Password,Address,Province,Zipcode,Phone,Mobile,Email)"
            sql &= " Values('" & Name & "','" & Surname & "','" & Username & "','" & EncryptPassword & "','" & _
                   Address & "','" & Province & "','" & Zipcode & "','" & _
                   Phone & "','" & Mobile & "','" & Email & "')"
            With command1
                .CommandType = CommandType.Text
                .CommandText = sql
                .Connection = conn
                .ExecuteNonQuery()
            End With
            conn.Close()
            chk = True
        End If
        RegisterBuyer = chk
    End Function

    'ใช้ตรวจสอบว่ามี  username นี้อยู่ในDatabase หรือไม่
    <WebMethod(Description:="ใช้ในการตรวจสอบชื่อสมาชิก(username)ลูกค้า")> _
    Public Function ChkRegUsername(ByVal Username As String) As Boolean
        'True = Reg แล้ว     False = ยังไม่ Reg
        Dim conn As SqlConnection = New SqlConnection()
        Dim command1 As SqlCommand = New SqlCommand()
        Dim StrConn, DB_name, sql As String
        Dim Count As Integer
        Dim Temp As Boolean = True
        If Username = "" Then
            Return True
            Exit Function
        End If

        StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
        'StrConn = "Address=161.246.6.14;Database=Tumbolthai;uid=off;pwd=off"
        With conn
            If .State = ConnectionState.Open Then .Close()
            .ConnectionString = StrConn
            .Open()
        End With
        sql = "select count(*) from Buyer where username='" & Username & "'"
        With command1
            .CommandType = CommandType.Text
            .CommandText = sql
            .Connection = conn
            Count = CInt(.ExecuteScalar)
        End With
        If Count > 0 Then 'แสดงว่ามี 1 row
            Temp = True
        Else 'แสดงว่าไม่มีrow
            Temp = False
        End If
        ChkRegUsername = Temp
        conn.Close()
    End Function

    Private Function CheckStrIsNumAll(ByVal Str As String) As Boolean
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
    Private Function CheckStrIsTextAll(ByVal Str As String) As Boolean
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

    <WebMethod(Description:="ใช้สำหรับหยิบของใส่ตระกล้า", EnableSession:=True)> _
       Public Function UpdateRegisterBuyer(ByVal IP As String, ByVal Password As String, _
    ByVal Name As String, ByVal Surname As String, ByVal Address As String, ByVal Province As String, _
    ByVal Zipcode As String, ByVal Phone As String, ByVal Mobile As String, ByVal Email As String) As ReturnUserRegister
        Dim IDUser As Integer
        Dim check As Boolean = False
        Dim Temp As ReturnUserRegister
        'Init ค่าของ Temp ให้เป็นTrue
        With Temp
            .Status = True
            .Username = True  'ทำให้เป็นตัว check ว่ามีการloginหรือไม่
            .Password = True
            .Name = True
            .Surname = True
            .Address = True
            .Province = True
            .Zipcode = True
            .Phone = True
            .Mobile = True
            .Email = True
        End With


        IDUser = SetTimeSession(IP)
        If IDUser > -1 Then
            If (Password = "") Then
                Temp.Status = False
                Temp.Password = False
            End If
            'ดูชือ นามสกุล ห้ามมีตัวเลขอยู่ (ต้องใส่)
            If (Name <> "") And (Surname <> "") Then
                If CheckStrIsTextAll(Name) = False Then
                    Temp.Status = False
                    Temp.Name = False
                End If
                If CheckStrIsTextAll(Surname) = False Then
                    Temp.Status = False
                    Temp.Surname = False
                End If
            Else
                Temp.Status = False
                Temp.Name = False
                Temp.Surname = False
            End If
            'ดูAddress ว่า Zipcode สอดคร้องกับ Province (ต้องใส่)
            If (Zipcode <> "") And (Province <> "") And (Address <> "") Then
                If CheckStrIsNumAll(Zipcode) = False Then
                    Temp.Status = False
                    Temp.Address = False
                    Temp.Province = False
                    Temp.Zipcode = False
                End If
            Else
                Temp.Status = False
                Temp.Address = False
                Temp.Province = False
                Temp.Zipcode = False
            End If
            'ดูว่า phone mobile มีตัวหนังสืออืนไหม นอกจาก ตัวเลข กัน ( ) -
            'ดูEmail ว่ามี  @ หรือไม่
            If InStr(Email, "@", CompareMethod.Text) = 0 And Email <> "" Then
                Temp.Status = False
                Temp.Email = False
            End If

            If Temp.Status = True Then 'แสดงว่าไม่ Error ทำการ Register ได้
                Dim conn As SqlConnection = New SqlConnection()
                Dim command1 As SqlCommand = New SqlCommand()
                Dim StrConn, sql As String
                StrConn = "Address=161.246.6.4;Database=Tumbolthai;uid=off;pwd=off"
                With conn
                    If .State = ConnectionState.Open Then .Close()
                    .ConnectionString = StrConn
                    .Open()
                End With
                'cryptography-------------------
                Dim md5Provider As MD5CryptoServiceProvider = New MD5CryptoServiceProvider()
                Dim data As Byte() = Encoding.ASCII.GetBytes(Password)
                Dim EncryptedData As Byte() = md5Provider.ComputeHash(data)
                Dim EncryptPassword As String = Convert.ToBase64String(EncryptedData)
                '-----------------------------
                sql = "Update Buyer set Password='" & EncryptPassword & "'," & _
                    " Name='" & Name & "',Surname='" & Surname & "'," & _
                    " Address='" & Address & "',Province='" & Province & "',Zipcode='" & Zipcode & "'," & _
                    " Phone='" & Phone & "',Mobile='" & Mobile & "',Email='" & Email & "'" & _
                    " Where (ID=" & IDUser & ")"
                With command1
                    .CommandType = CommandType.Text
                    .CommandText = sql
                    .Connection = conn
                    .ExecuteNonQuery()
                End With
            End If
        Else
            Temp.Status = False
            Temp.Username = False
        End If
        Return Temp
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

    <WebMethod(Description:="เป็น backdoor เพื้อดูว่ามีอะไรเก็บใน sessionบ้าง", EnableSession:=True)> Public Function check() As String
        Return Context.Application("AuthenIP")
    End Function
End Class
