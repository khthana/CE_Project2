Public Class WebFormPutIn
    Inherits System.Web.UI.Page
    Protected WithEvents lblName As System.Web.UI.WebControls.Label
    Protected WithEvents btnInBasket As System.Web.UI.WebControls.Button
    Protected WithEvents lblDetail As System.Web.UI.WebControls.Label
    Protected WithEvents ImgProduct As System.Web.UI.WebControls.Image
    Protected WithEvents txtQuantity As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents lblUnit As System.Web.UI.WebControls.Label
    Protected WithEvents lblPrice As System.Web.UI.WebControls.Label
    Protected WithEvents btnOk As System.Web.UI.WebControls.Button
    Protected WithEvents btnLogout As System.Web.UI.WebControls.Button
    Protected WithEvents btnLogin As System.Web.UI.WebControls.Button
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtUsername As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnSearch As System.Web.UI.WebControls.Button
    Protected WithEvents txtNameSearch As System.Web.UI.WebControls.TextBox
    Protected WithEvents ddlFrom As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblShowLogin As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents txtPrice As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtDetail As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents lblError As System.Web.UI.WebControls.Label

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
        txtQuantity.Text = "1"
    End Sub

#End Region
    Dim srvSell As ServiceSellCenter.ServiceSell = New ServiceSellCenter.ServiceSell()
    Dim DataProduct As ServiceSellCenter.ReturnInfoProduct
    Dim srvAuthen As ServiceAuthens.ServiceAuthen = New ServiceAuthens.ServiceAuthen()
    Dim DataUser As ServiceAuthens.ReturnUser
    Dim Chk As Boolean
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
        '---------------------------------------------
        DataProduct = srvSell.SearchProductByID(Request.QueryString("Product"), Request.QueryString("seller"))
        If DataProduct.ID > -1 Then
            lblName.Text = DataProduct.Name
            lblDetail.Text = DataProduct.Detail
            lblUnit.Text = DataProduct.Unit
            lblPrice.Text = DataProduct.Price & "บาท / " & DataProduct.Unit
            ImgProduct.ImageUrl = DataProduct.Picture
            'txtQuantity.Text = "1"
            lblError.Visible = False
        End If
    End Sub

    Private Sub btnOk_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOk.Click
        If srvSell.CheckStrIsNumAll(txtQuantity.Text) = True And txtQuantity.Text.Length > 0 Then
            If srvSell.PutInBasket(Request.ServerVariables("REMOTE_HOST"), Request.QueryString("Product"), txtQuantity.Text, Request.QueryString("seller")) = False Then
                lblError.Text = "กรุณาเข้าสู่ระบบก่อนทำรายการสินค้าด้วยครับ หรือ อย่าใส่จำนวนเป็น 0"
                lblError.Visible = True
            Else
                'lblError.Text = "<font color=#0000ff> ทำการซื้อ  " & lblName.Text & "เสร็จเรียบร้อย</font>"
                'lblError.Visible = True
                Response.Redirect("webforminbasket.aspx")
            End If
        Else
            lblError.Text = "กรุณาใส่จำนวนเป็นตัวเลขด้วยครับ"
            lblError.Visible = True
        End If
    End Sub

    Private Sub btnInBasket_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnInBasket.Click
        'Response.Redirect("webforminbasket.aspx")
    End Sub

    Private Sub btnSearch_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        Dim Temp As String
        'Temp = "?From=" & ddlFrom.SelectedItem.Value & "&Name=" & txtNameSearch.Text
        Temp = "?From=" & ddlFrom.SelectedItem.Value & "&Name=" & txtNameSearch.Text & "&Detail=" & txtDetail.Text & "&Price=" & txtPrice.Text
        Response.Redirect("webformSearch.aspx" & Temp)
    End Sub

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click

        DataUser = srvAuthen.Login(txtUsername.Text, txtPassword.Text, Request.ServerVariables("REMOTE_HOST"))
        If DataUser.ID <> -1 Then
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
