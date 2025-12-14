Public Class WebFormBuy
    Inherits System.Web.UI.Page
    Protected WithEvents DataGrid1 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents DataSet1 As System.Data.DataSet
    Protected WithEvents DataColumn1 As System.Data.DataColumn
    Protected WithEvents DataColumn2 As System.Data.DataColumn
    Protected WithEvents DataColumn3 As System.Data.DataColumn
    Protected WithEvents DataColumn4 As System.Data.DataColumn
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents lblSum As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents lblTo As System.Web.UI.WebControls.Label
    Protected WithEvents btnOK As System.Web.UI.WebControls.Button
    Protected WithEvents txtRePassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtID As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblError As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents DataTable1 As System.Data.DataTable

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
        Me.DataColumn1.ColumnName = "รูปสินค้า"
        '
        'DataColumn2
        '
        Me.DataColumn2.ColumnName = "ชื่อสินค้า"
        '
        'DataColumn3
        '
        Me.DataColumn3.ColumnName = "จำนวน"
        '
        'DataColumn4
        '
        Me.DataColumn4.ColumnName = "ราคา"
        CType(Me.DataSet1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DataTable1, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
        DataUser = srvAuthen.Passport(Request.ServerVariables("REMOTE_HOST"))
        txtEmail.Text = DataUser.Email
    End Sub

#End Region
    Dim srvSell As ServiceSellCenter.ServiceSell = New ServiceSellCenter.ServiceSell()
    Dim DataInBasket() As ServiceSellCenter.ReturnInfoBasket
    Dim DataProduct As ServiceSellCenter.ReturnInfoProduct
    Dim srvAuthen As ServiceAuthen.ServiceAuthen = New ServiceAuthen.ServiceAuthen()
    Dim DataUser As ServiceAuthen.ReturnUser

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        lblError.Visible = False
        'Put user code to initialize the page here
        lblTo.Text = "ข้อมูลของผู้รับสินค้า<br>" & _
                    "<b>คุณ  </b>" & Request.QueryString("Name") & _
                    "<br><b>อยู่ที่  </b>" & Request.QueryString("Address") & _
                    "<br><b>จังหวัด </b>" & Request.QueryString("Province") & _
                    "<br><b>รหัสไปรษณีย์ </b>" & Request.QueryString("Zipcode") & _
                    "<br><b>จ่ายเงินผ่านทาง </b>" & Request.QueryString("Waypay")


        '------------------------------------------
        DataInBasket = srvSell.GetInBasket(Request.ServerVariables("REMOTE_HOST"))
        Dim count As Integer = DataInBasket.Length
        DataSet1.Tables("table1").Clear()
        Dim a As DataTable = DataSet1.Tables("table1")
        Dim i As Integer
        Dim Link As String
        Dim mul As Decimal

        For i = 0 To count - 1
            If DataInBasket(i).IDProduct > -1 Then
                DataProduct = srvSell.SearchProductByID(DataInBasket(i).IDProduct, DataInBasket(i).IDSeller)
                If DataProduct.IDSeller > -1 Then
                    Dim rc As DataRow = a.NewRow()
                    rc("รูปสินค้า") = "<center><a href=" + DataProduct.Picture + " target=_blank> <img src =" + DataProduct.Picture + " hight=50 width=50></center>"
                    rc("ชื่อสินค้า") = DataProduct.Name
                    rc("จำนวน") = DataInBasket(i).Quantity
                    mul = (CDec(DataProduct.Price) * CInt(DataInBasket(i).Quantity))
                    rc("ราคา") = CStr(mul) + "บาท"
                    a.Rows.Add(rc)
                End If
            End If
        Next
        DataGrid1.DataBind()
        lblSum.Text = srvSell.SumBasket(Request.ServerVariables("REMOTE_HOST"))
    End Sub

    

    Private Sub btnOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOK.Click
        If ((txtPassword.Text = txtRePassword.Text) And (txtPassword.Text.Length > 0) And (txtRePassword.Text.Length > 0)) Or Request.QueryString("Waypay") <> "บัตรเครดิต" Then
            If srvSell.CheckOut(Request.ServerVariables("REMOTE_HOST"), txtID.Text, txtPassword.Text, Request.QueryString("Name"), Request.QueryString("Address"), Request.QueryString("Province"), Request.QueryString("Zipcode"), Request.QueryString("waypay"), txtEmail.Text) Then
                Response.Redirect("webformCheckStatusSelled.aspx")
            Else
                lblError.Text = "กรุณาตรวจสอบข้อมูลของบัตรเครดิตของท่าน "
                lblError.Visible = True
            End If

        Else
            lblError.Text = "รหัสผ่านไม่ถูกต้อง"
            lblError.Visible = True
        End If
    End Sub
End Class
