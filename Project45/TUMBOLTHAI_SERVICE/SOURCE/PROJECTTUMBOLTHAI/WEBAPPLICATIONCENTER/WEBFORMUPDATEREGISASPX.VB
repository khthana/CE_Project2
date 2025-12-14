Public Class WebFormUpdateRegis
    Inherits System.Web.UI.Page
    Protected WithEvents txtName As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnCancel As System.Web.UI.WebControls.Button
    Protected WithEvents lblChkMobile As System.Web.UI.WebControls.Label
    Protected WithEvents lblChkZipcode As System.Web.UI.WebControls.Label
    Protected WithEvents lblChkPhone As System.Web.UI.WebControls.Label
    Protected WithEvents lblChkEmail As System.Web.UI.WebControls.Label
    Protected WithEvents lblChkUsername As System.Web.UI.WebControls.Label
    Protected WithEvents lblChkPassword As System.Web.UI.WebControls.Label
    Protected WithEvents lblChkRepassword As System.Web.UI.WebControls.Label
    Protected WithEvents lblChkSurname As System.Web.UI.WebControls.Label
    Protected WithEvents lblchkProvince As System.Web.UI.WebControls.Label
    Protected WithEvents lblChkAddress As System.Web.UI.WebControls.Label
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents txtRepassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtUsername As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtMobile As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtPhone As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtZipcode As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAddress As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtSurname As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents ddlProvince As System.Web.UI.WebControls.DropDownList
    Protected WithEvents lblChkName As System.Web.UI.WebControls.Label
    Protected WithEvents lblError As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents btnOK As System.Web.UI.WebControls.Button

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
        DataUser = srvAuthen.Passport(Request.ServerVariables("REMOTE_HOST"))
        If DataUser.ID > -1 Then
            txtName.Text = DataUser.Name
            txtSurname.Text = DataUser.SurName
            txtAddress.Text = DataUser.Address
            ddlProvince.SelectedItem.Text = DataUser.Province
            txtZipcode.Text = DataUser.Zipcode
            txtPhone.Text = DataUser.Phone
            txtMobile.Text = DataUser.Mobile
            txtEmail.Text = DataUser.Email
        Else
            lblError.Visible = True
        End If
    End Sub

#End Region
    Private srvAuthen As ServiceAuthen.ServiceAuthen = New ServiceAuthen.ServiceAuthen()
    Private DataRegis As ServiceAuthen.ReturnUserRegister
    Private DataUser As ServiceAuthen.ReturnUser
    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        'Put user code to initialize the page here
    End Sub

    Private Sub btnOK_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnOK.Click
        ClearChk()
        If txtPassword.Text = txtRepassword.Text And txtPassword.Text.Length <> 0 And txtRepassword.Text.Length <> 0 Then
            DataRegis = srvAuthen.UpdateRegisterBuyer(Request.ServerVariables("REMOTE_HOST"), txtPassword.Text, txtName.Text, txtSurname.Text, txtAddress.Text, ddlProvince.SelectedItem.Text, txtZipcode.Text, txtPhone.Text, txtMobile.Text, txtEmail.Text)
        Else
            lblChkRepassword.Visible = True
            Exit Sub
        End If


        With DataRegis
            If .Username = True Then  'กรณียังไม่ได้ login
                If .Status = False Then
                    If .Name = False Then lblChkName.Visible = True
                    If .Surname = False Then lblChkSurname.Visible = True
                    If .Address = False Then lblChkAddress.Visible = True
                    If .Province = False Then lblchkProvince.Visible = True
                    If .Zipcode = False Then lblChkZipcode.Visible = True
                    If .Phone = False Then lblChkPhone.Visible = True
                    If .Mobile = False Then lblChkMobile.Visible = True
                    If .Email = False Then lblChkEmail.Visible = True
                    'If .Username = False Then lblChkUsername.Visible = True
                    If .Password = False Then lblChkPassword.Visible = True
                    Dim Temp As String

                Else  ' กรณีที่ OK
                    Response.Redirect("webformshow.aspx")
                End If
                lblError.Visible = False
            Else
                lblError.Visible = True
            End If
        End With

    End Sub

    Private Sub ClearChk()
        lblChkName.Visible = False
        lblChkSurname.Visible = False
        lblChkAddress.Visible = False
        lblchkProvince.Visible = False
        lblChkZipcode.Visible = False
        lblChkPhone.Visible = False
        lblChkMobile.Visible = False
        lblChkEmail.Visible = False
        lblChkUsername.Visible = False
        lblChkPassword.Visible = False
        lblChkRepassword.Visible = False
    End Sub

End Class
