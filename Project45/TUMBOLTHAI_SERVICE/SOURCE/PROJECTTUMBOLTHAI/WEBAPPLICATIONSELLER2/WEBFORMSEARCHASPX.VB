Public Class WebFormSearch
    Inherits System.Web.UI.Page
    Protected WithEvents txtUsername As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnLogout As System.Web.UI.WebControls.Button
    Protected WithEvents btnLogin As System.Web.UI.WebControls.Button
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents txtNameSearch As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSearch As System.Web.UI.WebControls.Button
    Protected WithEvents ddlFrom As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblShowLogin As System.Web.UI.WebControls.Label
    Protected WithEvents DataSet1 As System.Data.DataSet
    Protected WithEvents DataTable1 As System.Data.DataTable
    Protected WithEvents DataColumn1 As System.Data.DataColumn
    Protected WithEvents DataColumn2 As System.Data.DataColumn
    Protected WithEvents DataColumn3 As System.Data.DataColumn
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents txtPrice As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtDetail As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents DataColumn4 As System.Data.DataColumn

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()
        Me.DataSet1 = New System.Data.DataSet()
        Me.DataTable1 = New System.Data.DataTable()
        Me.DataColumn1 = New System.Data.DataColumn()
        Me.DataColumn2 = New System.Data.DataColumn()
        Me.DataColumn3 = New System.Data.DataColumn()
        Me.DataColumn4 = New System.Data.DataColumn()
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DataTable1, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'DataSet1
        '
        Me.DataSet1.DataSetName = "NewDataSet"
        Me.DataSet1.Locale = New System.Globalization.CultureInfo("th-TH")
        Me.DataSet1.Tables.AddRange(New System.Data.DataTable() {Me.DataTable1})
        '
        'DataTable1
        '
        Me.DataTable1.Columns.AddRange(New System.Data.DataColumn() {Me.DataColumn1, Me.DataColumn2, Me.DataColumn3, Me.DataColumn4})
        Me.DataTable1.TableName = "Table1"
        '
        'DataColumn1
        '
        Me.DataColumn1.ColumnName = "รูปภาพ"
        '
        'DataColumn2
        '
        Me.DataColumn2.ColumnName = "ชื่อสินค้า"
        '
        'DataColumn3
        '
        Me.DataColumn3.ColumnName = "ข้อมูลสินค้า"
        '
        'DataColumn4
        '
        Me.DataColumn4.ColumnName = "ราคาสินค้า"
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataTable1, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
    Dim srvSellC As ServiceSellCenter.ServiceSell = New ServiceSellCenter.ServiceSell()
    Dim srvSell2 As ServiceSeller2.ServiceSell2 = New ServiceSeller2.ServiceSell2()
    Dim DataProductC() As ServiceSellCenter.ReturnInfoProduct
    Dim DataProduct2() As ServiceSeller2.ReturnProduct
    Dim srvAuthen As ServiceAuthens.ServiceAuthen = New ServiceAuthens.ServiceAuthen()
    Dim DataUser As ServiceAuthens.ReturnUser

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        DataUser = srvAuthen.Passport(Request.ServerVariables("REMOTE_HOST"))
        If DataUser.ID <> -1 Then
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Black
            lblShowLogin.Text = "สวัสดีคับ คุณ " & DataUser.Name
        Else
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Red
            lblShowLogin.Text = "ข้ออภัยครับ<br>คุณต้องทำการเข้าสู่ระบบก่อนทำรายการสินค้า"
        End If
        '----------------------------------------
        Dim count, i As Integer
        Dim Link As String
        'If txtNameProduct.Text = "" Then
        '  lblerror.Visible = True
        'Exit Sub
        'Else
        '   lblerror.Visible = False
        'End If
        Dim a As DataTable
        If Request.QueryString("From") = "0" Then
            DataProduct2 = srvSell2.GetInfoProductByName(Request.QueryString("Name"), Request.QueryString("detail"), Request.QueryString("Price"))
            count = DataProduct2.Length
            DataSet1.Tables("table1").Clear()
            a = DataSet1.Tables("table1")
            a.Rows.Clear()
            For i = 0 To count - 1
                If DataProduct2(i).ID > -1 Then
                    Dim rc As DataRow = a.NewRow()
                    Link = "webformPutIn.aspx?Product=" & DataProduct2(i).ID & "&Seller=" & DataProduct2(i).IDSeller
                    rc("ชื่อสินค้า") = "<a href=" & Link & ">" & DataProduct2(i).Name & "</a>"
                    rc("ข้อมูลสินค้า") = DataProduct2(i).Detail
                    rc("ราคาสินค้า") = DataProduct2(i).Price + "บาท / " + DataProduct2(i).Unit
                    rc("รูปภาพ") = "<center><a href=" + DataProduct2(i).Picture + " target=_blank> <img src =" + DataProduct2(i).Picture + " hight=150 width=150></center>"
                    a.Rows.Add(rc)
                End If
            Next
        Else
            DataProductC = srvSellC.SearchProductByName(Request.QueryString("Name"), Request.QueryString("detail"), Request.QueryString("Price"))
            count = DataProductC.Length
            DataSet1.Tables("table1").Clear()
            a = DataSet1.Tables("table1")
            a.Rows.Clear()
            For i = 0 To count - 1
                If DataProductC(i).ID > -1 Then
                    Dim rc As DataRow = a.NewRow()
                    Link = "webformPutIn.aspx?Product=" & DataProductC(i).ID & "&Seller=" & DataProductC(i).IDSeller
                    rc("ชื่อสินค้า") = "<a href=" & Link & ">" & DataProductC(i).Name & "</a>"
                    rc("ข้อมูลสินค้า") = DataProductC(i).Detail
                    rc("ราคาสินค้า") = DataProductC(i).Price + "บาท / " + DataProductC(i).Unit
                    rc("รูปภาพ") = "<center><a href=" + DataProductC(i).Picture + " target=_blank> <img src =" + DataProductC(i).Picture + " hight=150 width=150></center>"
                    a.Rows.Add(rc)
                End If
            Next

        End If
        DataGrid1.DataBind()
    End Sub
    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim Temp As String
        'Temp = "?From=" & ddlFrom.SelectedItem.Value & "&Name=" & txtNameSearch.Text
        Temp = "?From=" & ddlFrom.SelectedItem.Value & "&Name=" & txtNameSearch.Text & "&Detail=" & txtDetail.Text & "&Price=" & txtPrice.Text
        Response.Redirect("webformSearch.aspx" & Temp)
    End Sub

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        DataUser = srvAuthen.Login(txtUsername.Text, txtPassword.Text, Request.ServerVariables("REMOTE_HOST"))
        If DataUser.ID > -1 Then
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Black
            lblShowLogin.Text = "สวัสดีคับ คุณ " & DataUser.Name
            txtUsername.Text = ""
            txtPassword.Text = ""
        Else
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Red
            lblShowLogin.Text = "ข้ออภัยครับ<br>คุณไม่สามารถเข้าสู่ระบบได้"
        End If
    End Sub

    Private Sub btnLogout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogout.Click
        srvAuthen.Logout(Request.ServerVariables("REMOTE_HOST"))
        lblShowLogin.ForeColor = lblShowLogin.ForeColor.Pink
        lblShowLogin.Text = "ขอบคุณที่ใช้บริการครับ"
    End Sub

End Class
