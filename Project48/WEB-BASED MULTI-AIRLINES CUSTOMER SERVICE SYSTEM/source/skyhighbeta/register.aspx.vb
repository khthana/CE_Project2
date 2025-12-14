Public Class register
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
    Protected WithEvents txtUser As System.Web.UI.WebControls.TextBox
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
    Protected WithEvents btnSubmit As System.Web.UI.WebControls.Button

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
        '++++Init value for first visit to this page====================
        If IsPostBack = False Then

        End If
    End Sub

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click ', txtAreaBiz.TextChanged, txtAreaFax.TextChanged, txtAreaHome.TextChanged, txtExt.TextChanged, txtFirstName.TextChanged, txtLastName.TextChanged, txtTelBiz.TextChanged, txtTelFax.TextChanged, txtTelHome.TextChanged, txtEmail.TextChanged, txtAddress.TextChanged, txtIDCard.TextChanged, txtAge.TextChanged, txtConFirmPwd.TextChanged, txtUser.TextChanged, txtPwd.TextChanged

        '++++++++required field========================
        If (txtFirstName.Text = "") Or (txtLastName.Text = "") Or (txtAge.Text = "") Or (txtTelHome.Text = "") Or (txtTelBiz.Text = "") Or (txtTelFax.Text = "") Or (txtExt.Text = "") Or (txtEmail.Text = "") Or (txtIDCard.Text = "") Or (txtAddress.Text = "") Then
            lblStatus.Text = "Please fill your information in every fields."
        End If

        If txtUser.Text.Length = 0 Or txtPwd.Text.Length < 4 Then
            If txtUser.Text.Length = 0 Then
                lblStatus.Text = "Please fill your Username."
                lblStatus.Visible = True
            End If

            If txtPwd.Text.Length < 4 Then
                lblStatus.Text = "Password must more than 4 letters."
                lblStatus.Visible = True
            End If

            If txtUser.Text.Length = 0 And txtPwd.Text.Length < 4 Then
                lblStatus.Text = "Please fill your Username. Password must more than 4 letters."
                lblStatus.Visible = True
            End If
        ElseIf txtPwd.Text <> txtConFirmPwd.Text Then
            lblStatus.Text = "Confirm Password doesn't matched."
            lblStatus.Visible = True
        Else
            AddUser(Airline.Encrypted(txtPwd.Text))
        End If

    End Sub

    Private Sub AddUser(ByVal encryptedPassword As String)

        Dim QueryString As String = "SELECT mname FROM member WHERE mname = '" & txtUser.Text & "'"

        Dim MemberDataSet As New DataSet
        MemberDataSet = Airline.Query(QueryString)

        If MemberDataSet.Tables(0).Rows.Count <> 0 Then
            lblStatus.Text = "Username is used. Please try the new one."
            lblStatus.Visible = True
        Else
            Dim MemberID As String
            QueryString = "SELECT memberid FROM member WHERE membertype = '" & radMember.Items(radMember.SelectedIndex).Value & "' ORDER BY memberid DESC"
            MemberDataSet = Airline.Query(QueryString)

            If MemberDataSet.Tables(0).Rows.Count = 0 Then
                MemberID = "00001"
            Else
                MemberID = (CInt(Mid(MemberDataSet.Tables(0).Rows(0).Item("memberid"), 3, 5)) + 1).ToString("00000")

            End If

            Select Case radMember.Items(radMember.SelectedIndex).Value
                Case 1
                    MemberID = "ST" & MemberID
                Case 2
                    MemberID = "ML" & MemberID
                Case 3
                    MemberID = "SS" & MemberID
            End Select

            Dim HomePhone As String = cboCodeHome.Items(cboCodeHome.SelectedIndex).Value & "-" & txtTelHome.Text
            Dim BusinessPhone As String = cboCodeBiz.Items(cboCodeBiz.SelectedIndex).Value & "-" & txtTelBiz.Text & " Ext. " & txtExt.Text
            Dim Fax As String = cboCodeFax.Items(cboCodeFax.SelectedIndex).Value & "-" & txtTelFax.Text

            'if every input is valid. Keep info in database
            Dim InsertString As String = "INSERT INTO member VALUES ('" & MemberID & "','" & txtUser.Text & "','" & txtPwd.Text & "','" & encryptedPassword & "','" & txtFirstName.Text & "','" & txtLastName.Text & "','" & radSex.Items(radSex.SelectedIndex).Value & "','" & txtIDCard.Text & "','" & txtAddress.Text & "','" & radMember.Items(radMember.SelectedIndex).Value & "','" & DateTime.Now.ToShortDateString() & "','" & DateTime.Now.AddYears(1).ToShortDateString() & "','" & cboCountry.Items(cboCountry.SelectedIndex).Text & "','0','" & cboMeal.Items(cboMeal.SelectedIndex).Text & "','" & txtEmail.Text & "','" & HomePhone & "','" & BusinessPhone & "','" & Fax & "','" & txtAge.Text & "')"
            Dim Result As String = Airline.InsertUpdate(InsertString)

            If Result = "OK" Then
                '+++++++Sending E-mail=======================================
                Dim Content As String = "Your registration is success. Your Infomation is:<br>" _
                                        & "<br>MemberID: " & MemberID & "<br>" _
                                        & "User Name: " & txtUser.Text & "<br>" _
                                        & "Password: " & txtPwd.Text & "<br>" _
                                        & "Admit Date: " & DateTime.Now.ToShortDateString() & "<br>" _
                                        & "Expire Date: " & DateTime.Now.AddYears(1).ToShortDateString() & "<br>" _
                                        & "<br>Thank you to visit us."
                Airline.MailTo(txtEmail.Text, "SkyHigh member registration", Content)

                Response.Redirect("registerresult.aspx?IsRegistered=Y")
            Else
                Response.Redirect("registerresult.aspx?IsRegistered=N&FailReason=" & Result)
            End If
        End If
    End Sub

    Private Sub btnHome_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnHome.Click
        Response.Redirect("index.aspx")
    End Sub
End Class
