Public Class WebFormRegisOK
    Inherits System.Web.UI.Page
    Protected WithEvents lblName As System.Web.UI.WebControls.Label
    Protected WithEvents lblDetail As System.Web.UI.WebControls.Label
    Protected WithEvents btnEdit As System.Web.UI.WebControls.Button
    Protected WithEvents btnOK As System.Web.UI.WebControls.Button

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
    Private srvAuthen As ServiceAuthens.ServiceAuthen = New ServiceAuthens.ServiceAuthen()
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        lblName.Text = "สวัสดีครับ คุณ  " & Request.QueryString("Name") & "   " & Request.QueryString("Surname")
        lblDetail.Text = "ขอต้อนรับ คุณ " & Request.QueryString("Name") & "   " & Request.QueryString("Surname") & _
                        "เข้าเป็นสมาชิกของ ระบบ บริการตำบลไทย <br>ซึ่งท่านสามารถใช้ ชื่อสมาชิก และ รหัสมาชิกทำการซื้อสินค้าได้ทุกชนิดของร้านค้าต่างๆที่เป็นสมาชิกของ ระบบบริการตำบลไทย" & _
                        "<br><hr>" & _
                        "<b>ข้อมูลส่วนตัว</b>" & _
                        "<br><b>อยู่ที่</b>  " & Request.QueryString("Address") & _
                        "<br><b>จังหวัด</b>  " & Request.QueryString("Province") & "  <b>รหัสไปรษณีย์</b>  " & Request.QueryString("Zipcode") & _
                        "<br><b>เบอร์โทรศัพท์</b>  " & Request.QueryString("Phone") & "  <b>เบอร์มือถือ</b>  " & Request.QueryString("Mobile") & _
                        "<br><b>ชื่อสมาชิก</b>  " & Request.QueryString("Username") & _
                        "<br><b>รหัสสมาชิก</b>" & Request.QueryString("Password")
    End Sub

    Private Sub btnOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOK.Click
        If srvAuthen.RegisterBuyer(Request.QueryString("Username"), Request.QueryString("Password"), Request.QueryString("Name"), Request.QueryString("Surname"), Request.QueryString("Address"), Request.QueryString("Province"), Request.QueryString("Zipcode"), Request.QueryString("Phone"), Request.QueryString("Mobile"), Request.QueryString("Email")) Then
            Response.Redirect("webformcandle1.aspx")
        Else
            Response.Redirect("webformerror.aspx")
        End If
    End Sub

    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        Dim Temp As String
        Temp = "?name=" & Request.QueryString("Name") & "&Surname=" & Request.QueryString("Surname") & _
                        "&Address=" & Request.QueryString("Address") & "&Province=" & Request.QueryString("Province") & _
                        "&Zipcode=" & Request.QueryString("Zipcode") & "&Phone=" & Request.QueryString("Phone") & _
                        "&Mobile=" & Request.QueryString("Mobile") & "&Email=" & Request.QueryString("Email") & _
                        "&Username=" & Request.QueryString("Username") & "&Password=" & Request.QueryString("Password")


        Response.Redirect("webformregis.aspx" & Temp)
    End Sub
End Class
