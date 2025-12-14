Public Class passenger
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents txtUser As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtPwd As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnLogin As System.Web.UI.WebControls.Button
    Protected WithEvents btnForget As System.Web.UI.WebControls.Button
    Protected WithEvents chkNonMember As System.Web.UI.WebControls.CheckBox
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
    Protected WithEvents txtFirstName As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtLastName As System.Web.UI.WebControls.TextBox
    Protected WithEvents radSex As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents txtAge As System.Web.UI.WebControls.TextBox
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
    Protected WithEvents Image3 As System.Web.UI.WebControls.Image
    Protected WithEvents Image4 As System.Web.UI.WebControls.Image
    Protected WithEvents Image5 As System.Web.UI.WebControls.Image
    Protected WithEvents Image6 As System.Web.UI.WebControls.Image
    Protected WithEvents btnStart As System.Web.UI.WebControls.Button
    Protected WithEvents btnNext As System.Web.UI.WebControls.Button

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

    Private Sub chkNonMember_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles chkNonMember.CheckedChanged
        If chkNonMember.Checked = True Then

            cboCountry.Enabled = True
            cboMeal.Enabled = True
            txtFirstName.Enabled = True
            txtLastName.Enabled = True
            txtAge.Enabled = True
            radSex.Enabled = True

            cboCodeHome.Enabled = True
            cboCodeBiz.Enabled = True
            cboCodeFax.Enabled = True
            txtTelHome.Enabled = True
            txtTelBiz.Enabled = True
            txtTelFax.Enabled = True
            txtExt.Enabled = True
            txtEmail.Enabled = True
            btnNext.Enabled = True

            txtUser.Enabled = False
            txtPwd.Enabled = False
            btnLogin.Enabled = False
            btnForget.Enabled = False

        Else

            cboCountry.Enabled = False
            cboMeal.Enabled = False
            txtFirstName.Enabled = False
            txtLastName.Enabled = False
            txtAge.Enabled = False
            radSex.Enabled = False

            cboCodeHome.Enabled = False
            cboCodeBiz.Enabled = False
            cboCodeFax.Enabled = False
            txtTelHome.Enabled = False
            txtTelBiz.Enabled = False
            txtTelFax.Enabled = False
            txtExt.Enabled = False
            txtEmail.Enabled = False
            btnNext.Enabled = False

            txtUser.Enabled = True
            txtPwd.Enabled = True
            btnLogin.Enabled = True
            btnForget.Enabled = True

        End If
    End Sub

    Function Check(ByVal encryptedPassword As String) As Boolean

        Dim QueryString As String = "SELECT memberid,mname,encryptedpwd FROM member WHERE mname ='" & txtUser.Text & _
                                   "' AND encryptedpwd='" & encryptedPassword & "'"

        Dim MemberDataSet As New DataSet
        MemberDataSet = Airline.Query(QueryString)

        If MemberDataSet.Tables(0).Rows.Count = 0 Then
            QueryString = "SELECT mname FROM member WHERE mname = '" & txtUser.Text & "'"
            MemberDataSet = Airline.Query(QueryString)

            'check what is the wrong input
            If MemberDataSet.Tables(0).Rows.Count = 0 Then
                lblStatus.Text = txtUser.Text & " not found in our database."
                lblStatus.Visible = True
            Else
                'found user in database
                lblStatus.Text = "Incorrect Password"
                lblStatus.Visible = True
            End If
        Else

            Session("MemberID") = MemberDataSet.Tables(0).Rows(0).Item("MemberID")

            Return True

        End If
    End Function

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        If Check(Airline.Encrypted(txtPwd.Text)) = True Then
            Response.Redirect("review.aspx?DeptMDY=" & Request("DeptMDY") & _
                                    "&ReMDY=" & Request("ReMDY") & _
                                    "&Adult=" & Request("Adult") & _
                                    "&Child=" & Request("Child") & _
                                    "&WebFareOne=" & Request("WebFareOne") & _
                                    "&CabinOne=" & Request("CabinOne") & _
                                    "&WebFareReturn=" & Request("WebFareReturn") & _
                                    "&CabinReturn=" & Request("CabinReturn"))
        End If
    End Sub

    Private Sub btnNext_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNext.Click
        ', txtAreaBiz.TextChanged, txtAreaFax.TextChanged, txtAreaHome.TextChanged, txtExt.TextChanged, txtFirstName.TextChanged, txtLastName.TextChanged, txtTelBiz.TextChanged, txtTelFax.TextChanged, txtTelHome.TextChanged, txtEmail.TextChanged

        '++++++++required field========================
        If (txtFirstName.Text = "") Or (txtLastName.Text = "") Or (txtAge.Text = "") Or (txtTelHome.Text = "") Or (txtTelBiz.Text = "") Or (txtTelFax.Text = "") Or (txtExt.Text = "") Or (txtEmail.Text = "") Then
            lblStatus.Text = "Please fill your information in every fields."
        End If

        Dim QueryString As String = "SELECT memberid FROM member WHERE membertype ='0' ORDER BY memberid DESC"
        Dim MemberDataSet As New DataSet
        MemberDataSet = Airline.Query(QueryString)

        Dim MemberID As String

        If MemberDataSet.Tables(0).Rows.Count = 0 Then
            MemberID = "NM00001"
        Else
            MemberID = "NM" & (CInt(Mid(MemberDataSet.Tables(0).Rows(0).Item("memberid"), 3, 5)) + 1).ToString("00000")
        End If

        Dim HomePhone As String = cboCodeHome.Items(cboCodeHome.SelectedIndex).Value & "-" & txtTelHome.Text
        Dim BusinessPhone As String = cboCodeBiz.Items(cboCodeBiz.SelectedIndex).Value & "-" & txtTelBiz.Text & " Ext. " & txtExt.Text
        Dim Fax As String = cboCodeFax.Items(cboCodeFax.SelectedIndex).Value & "-" & txtTelFax.Text

        Dim InsertString As String = "INSERT INTO member VALUES ('" & MemberID & "','" & txtLastName.Text & "',NULL ,NULL,'" & txtFirstName.Text & "','" & txtLastName.Text & "','" & radSex.Items(radSex.SelectedIndex).Value & "',NULL,NULL,'0',NULL,NULL,'" & cboCountry.Items(cboCountry.SelectedIndex).Text & "','0','" & cboMeal.Items(cboMeal.SelectedIndex).Text & "','" & txtEmail.Text & "','" & HomePhone & "','" & BusinessPhone & "','" & Fax & "','" & txtAge.Text & "')"
        Dim Result As String = Airline.InsertUpdate(InsertString)

        If Result = "OK" Then
            Session("MemberID") = MemberID

            Response.Redirect("review.aspx?DeptDay=" & Request("DeptMDY") & _
                                        "&ReMDY=" & Request("ReMDY") & _
                                        "&Adult=" & Request("Adult") & _
                                        "&Child=" & Request("Child") & _
                                        "&WebFareOne=" & Request("WebFareOne") & _
                                        "&CabinOne=" & Request("CabinOne") & _
                                        "&WebFareReturn=" & Request("WebFareReturn") & _
                                        "&CabinReturn=" & Request("CabinReturn") & _
                                        "&Email=" & txtEmail.Text)
        Else
            lblStatus.Text = Result
            lblStatus.Visible = True
        End If

    End Sub

    Private Sub btnForget_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnForget.Click
        If txtUser.Text = "" Then
            lblStatus.Text = "Please type your UserName."
            lblStatus.Visible = True
        Else
            Dim QueryString As String = "SELECT memberid,mname,pwd,email FROM member WHERE mname='" & txtUser.Text & "'"
            Dim ForgetDataSet As DataSet = Airline.Query(QueryString)

            If ForgetDataSet.Tables(0).Rows.Count = 0 Then
                lblStatus.Text = txtUser.Text & " not found in our database."
                lblStatus.Visible = True
            Else
                'found user in database
                '++++++Sending E-Mail=============================
                Dim Content As String = "Your Infomation:<br><br>" _
                                        & "MemberID: " & ForgetDataSet.Tables(0).Rows(0).Item("MemberID") & "<br>" _
                                        & "User Name: " & ForgetDataSet.Tables(0).Rows(0).Item("Mname") & "<br>" _
                                        & "Password: " & ForgetDataSet.Tables(0).Rows(0).Item("Pwd") & "<br>" _
                                        & "<br>Thank you to visit us."
                Airline.MailTo(ForgetDataSet.Tables(0).Rows(0).Item("EMail"), "Your Password", Content)

                lblStatus.Text = "Your Password has been sent to your e-mail. "
                lblStatus.Visible = True
            End If
        End If
    End Sub
End Class
