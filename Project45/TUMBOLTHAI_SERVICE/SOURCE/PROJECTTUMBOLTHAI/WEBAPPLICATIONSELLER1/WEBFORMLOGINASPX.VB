Public Class WebFormLogin
    Inherits System.Web.UI.Page
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnLogin As System.Web.UI.WebControls.Button
    Protected WithEvents btnLogout As System.Web.UI.WebControls.Button
    Protected WithEvents lblShowLogin As System.Web.UI.WebControls.Label
    Protected WithEvents lblDetail As System.Web.UI.WebControls.Label
    Protected WithEvents txtUsername As System.Web.UI.WebControls.TextBox

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region
    Dim srvAuthen As ServiceAuthens.ServiceAuthen = New ServiceAuthens.ServiceAuthen()
    Dim DataUser As ServiceAuthens.ReturnUser
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        DataUser = srvAuthen.Passport(Request.ServerVariables("REMOTE_HOST"))
        If DataUser.ID <> -1 Then
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Black
            lblShowLogin.Text = "สวัสดีคับ คุณ " & DataUser.Name
            lblDetail.Text = "<b>ข้อมูลส่วนตัว</b>" & _
                            "<br><b>ที่อยู่</b> " & DataUser.Address & "  <b>จังหวัด</b>" & DataUser.Province & _
                            "  <b>รหัสไปรษณีย์</b>" & DataUser.Zipcode & _
                            "<br><b>เบอร์โทรศัพท์</b>  " & DataUser.Phone & "<b>มือถือ</b>" & DataUser.Mobile & _
                            "<br><b>Email</b>  " & DataUser.Email
            lblDetail.Visible = True
        Else
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Red
            lblShowLogin.Text = "ข้ออภัยครับ<br>คุณต้องทำการเข้าสู่ระบบก่อนทำรายการสินค้า"
            lblDetail.Visible = False
        End If
    End Sub

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        DataUser = srvAuthen.Login(txtUsername.Text, txtPassword.Text, Request.ServerVariables("REMOTE_HOST"))
        If DataUser.ID <> -1 Then
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Black
            lblShowLogin.Text = "สวัสดีคับ คุณ " & DataUser.Name
            txtUsername.Text = ""
            txtPassword.Text = ""
            lblDetail.Text = "<b>ข้อมูลส่วนตัว</b>" & _
                            "<br><b>ที่อยู่</b> " & DataUser.Address & "  <b>จังหวัด</b>" & DataUser.Province & _
                            "  <b>รหัสไปรษณีย์</b>" & DataUser.Zipcode & _
                            "<br><b>เบอร์โทรศัพท์</b>  " & DataUser.Phone & "<b>มือถือ</b>" & DataUser.Mobile & _
                            "<br><b>Email</b>  " & DataUser.Email
            lblDetail.Visible = True
        Else
            lblShowLogin.ForeColor = lblShowLogin.ForeColor.Red
            lblShowLogin.Text = "ข้ออภัยครับ<br>คุณไม่สามารถเข้าสู่ระบบได้"
            lblDetail.Visible = False
        End If
    End Sub

    Private Sub btnLogout_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogout.Click

        srvAuthen.Logout(Request.ServerVariables("REMOTE_HOST"))
        lblShowLogin.ForeColor = lblShowLogin.ForeColor.Pink
        lblShowLogin.Text = "ขอบคุณที่ใช้บริการครับ"

    End Sub
End Class
