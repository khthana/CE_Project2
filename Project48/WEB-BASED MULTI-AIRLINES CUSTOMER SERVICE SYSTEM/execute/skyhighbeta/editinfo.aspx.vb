Public Class editinfo
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
    Protected WithEvents lblUser As System.Web.UI.WebControls.Label
    Protected WithEvents txtPwd As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtConFirmPwd As System.Web.UI.WebControls.TextBox
    Protected WithEvents radMember As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents txtFirstName As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtLastName As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAge As System.Web.UI.WebControls.TextBox
    Protected WithEvents radSex As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents cboCountry As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboMeal As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboCodeHome As System.Web.UI.WebControls.DropDownList
    Protected WithEvents txtTelHome As System.Web.UI.WebControls.TextBox
    Protected WithEvents cboCodeBiz As System.Web.UI.WebControls.DropDownList
    Protected WithEvents txtTelBiz As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtExt As System.Web.UI.WebControls.TextBox
    Protected WithEvents cboCodeFax As System.Web.UI.WebControls.DropDownList
    Protected WithEvents txtTelFax As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtEmail As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtIDCard As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtAddress As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnHome As System.Web.UI.WebControls.Button
    Protected WithEvents btnChange As System.Web.UI.WebControls.Button

    'NOTE: The following placeholder declaration is required by the Web Form Designer.
    'Do not delete or move it.
    Private designerPlaceholderDeclaration As System.Object

    Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
        'CODEGEN: This method call is required by the Web Form Designer
        'Do not modify it using the code editor.
        InitializeComponent()
    End Sub

#End Region

    Private Sub Page_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        If IsPostBack = False Then

            Dim QueryString As String = "SELECT * FROM member WHERE memberid='" & Session("MemberID") & "'"
            Dim MemberDataSet As DataSet = Airline.Query(QueryString)
            Dim MemberRow As DataRow = MemberDataSet.Tables(0).Rows(0)

            lblUser.Text = MemberRow.Item("MName")
            txtFirstName.Text = MemberRow.Item("FirstName")
            txtLastName.Text = MemberRow.Item("LastName")
            radSex.SelectedValue = MemberRow.Item("Sex")
            txtIDCard.Text = MemberRow.Item("IDCard")
            txtAddress.Text = MemberRow.Item("Address")
            radMember.SelectedValue = MemberRow.Item("MemberType")
            cboCountry.SelectedValue = MemberRow.Item("Country")
            cboMeal.SelectedValue = MemberRow.Item("Meal")
            txtEmail.Text = MemberRow.Item("Email")
            txtAge.Text = MemberRow.Item("Age")

            Dim HomePhone As String = MemberRow.Item("HomePhone")
            Dim BusinessPhone As String = MemberRow.Item("BusinessPhone")
            Dim Fax As String = MemberRow.Item("Fax")

            cboCodeHome.SelectedValue = Mid(HomePhone, 1, 2)
            txtTelHome.Text = Mid(HomePhone, 4)
            cboCodeBiz.SelectedValue = Mid(BusinessPhone, 1, 2)
            txtTelBiz.Text = Mid(BusinessPhone, 4, (InStr(BusinessPhone, "E") - 5))
            txtExt.Text = Mid(BusinessPhone, InStr(BusinessPhone, "E") + 5)
            cboCodeFax.SelectedValue = Mid(Fax, 1, 2)
            txtTelFax.Text = Mid(Fax, 4)

        End If

    End Sub

    Private Sub btnChange_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnChange.Click

        '++++++++required field========================
        If (txtFirstName.Text = "") Or (txtLastName.Text = "") Or (txtAge.Text = "") Or (txtTelHome.Text = "") Or (txtTelBiz.Text = "") Or (txtTelFax.Text = "") Or (txtExt.Text = "") Or (txtEmail.Text = "") Or (txtIDCard.Text = "") Or (txtAddress.Text = "") Then
            lblStatus.Text = "Please fill your information in every fields."
        End If

        If txtPwd.Text.Length < 4 Then
            lblStatus.Text = "Password must more than 4 letters."
            lblStatus.Visible = True
        ElseIf txtPwd.Text <> txtConFirmPwd.Text Then
            lblStatus.Text = "Confirm Password doesn't matched."
            lblStatus.Visible = True
        Else
            EditInfo(Airline.Encrypted(txtPwd.Text))
        End If

    End Sub

    Private Sub EditInfo(ByVal EncryptedPassword As String)

        Dim HomePhone As String = cboCodeHome.Items(cboCodeHome.SelectedIndex).Value & "-" & txtTelHome.Text
        Dim BusinessPhone As String = cboCodeBiz.Items(cboCodeBiz.SelectedIndex).Value & "-" & txtTelBiz.Text & " Ext. " & txtExt.Text
        Dim Fax As String = cboCodeFax.Items(cboCodeFax.SelectedIndex).Value & "-" & txtTelFax.Text

        Dim UpdateString As String = "UPDATE member SET pwd='" & txtPwd.Text & "',encryptedpwd='" & EncryptedPassword & "',firstname='" & txtFirstName.Text & "',lastname='" & txtLastName.Text & "',sex='" & radSex.Items(radSex.SelectedIndex).Value & "',idcard='" & txtIDCard.Text & "',address='" & txtAddress.Text & "',membertype='" & radMember.Items(radMember.SelectedIndex).Value & "',country='" & cboCountry.Items(cboCountry.SelectedIndex).Text & "',meal='" & cboMeal.Items(cboMeal.SelectedIndex).Text & "',email='" & txtEmail.Text & "',homephone='" & HomePhone & "',businessphone='" & BusinessPhone & "',fax='" & Fax & "',age='" & txtAge.Text & "' WHERE memberid='" & Session("MemberID") & "'"
        Dim Result As String = Airline.InsertUpdate(UpdateString)

        If Result = "OK" Then
            lblStatus.Text = "Edit your information completely."
            lblStatus.Visible = True
        Else
            lblStatus.Text = Result
        End If

    End Sub
End Class
