Public Class WebFormCheckOut
    Inherits System.Web.UI.Page
    Protected WithEvents TextBox2 As System.Web.UI.WebControls.TextBox
    Protected WithEvents TextBox6 As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents btnOK As System.Web.UI.WebControls.Button
    Protected WithEvents txtAddress As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtProvince As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtZipcode As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblNAme As System.Web.UI.WebControls.Label
    Protected WithEvents txtName As System.Web.UI.WebControls.TextBox
    Protected WithEvents lblError As System.Web.UI.WebControls.Label
    Protected WithEvents ddlWaypay As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblWaypay As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
        DataUser = srvAuthen.Passport(Request.ServerVariables("REMOTE_HOST"))
        txtName.Text = DataUser.Name & "  " & DataUser.SurName
        txtAddress.Text = DataUser.Address
        txtProvince.Text = DataUser.Province
        txtZipcode.Text = DataUser.Zipcode
        '--------------------------------
        DataShiping = srvShiping.GetWayPay("")
        Dim i As Integer
        For i = 0 To DataShiping.Length - 1
            ddlWaypay.Items.Add(DataShiping(i).Name.ToString)
            lblWaypay.Text += "<b>" & DataShiping(i).Name & "</b>  "
            lblWaypay.Text += DataShiping(i).Detail & "<br>"
        Next


    End Sub

#End Region
    Private srvAuthen As ServiceAuthen.ServiceAuthen = New ServiceAuthen.ServiceAuthen()
    Private DataUser As ServiceAuthen.ReturnUser
    Private srvShiping As ServiceSellCenter.ServiceSell = New ServiceSellCenter.ServiceSell()
    Private DataShiping() As ServiceSellCenter.ReturnInfoPay
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
        lblError.Visible = False
        'If Request.QueryString("Name") Is Nothing Then
        If DataUser.ID = -1 Then
            btnOK.Enabled = False
            'lblNAme.Text = "<font color=#ff0000>คุณต้องทำการเข้าสู่ระบบก่อนครับ</font>"
            lblError.Visible = True
            'Exit Sub
        End If
        'Else
        'txtName.Text = Request.QueryString("Name")
        'txtAddress.Text = Request.QueryString("Address")
        'txtProvince.Text = Request.QueryString("Province")
        'txtZipcode.Text = Request.QueryString("Zipcode")
        'End If
    End Sub


    Private Sub btnOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOK.Click
        Dim Temp As String
        Temp = "?Name=" & txtName.Text & "&Address=" & txtAddress.Text & "&Province=" & txtProvince.Text & _
                "&Zipcode=" & txtZipcode.Text & "&WayPay=" & ddlWaypay.SelectedItem.Text
        Response.Redirect("webformBuy.aspx" & Temp)
    End Sub

End Class
