Public Class login
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
    Protected WithEvents btnEdit As System.Web.UI.WebControls.Button
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
            Session("User") = txtUser.Text

            Return True

        End If

    End Function

    Private Sub btnLogin_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnLogin.Click

        If Check(Airline.Encrypted(txtPwd.Text)) = True Then
            Response.Redirect("index.aspx")
            '?DeptDay=" & Request("DeptDay") & _
            '"&DeptMon=" & Request("DeptMon") & _
            '"&ReDay=" & Request("ReDay") & _
            '"&ReMon=" & Request("ReMon") & _
            '"&Adult=" & Request("Adult") & _
            '"&Child=" & Request("Child") & _
            '"&WebFare=" & Request("WebFare") & _
            '"&Cabin=" & Request("Cabin"))
            '"&Email=" & txtEmail.Text)
        End If

    End Sub

    Private Sub btnEdit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnEdit.Click
        If Check(Airline.Encrypted(txtPwd.Text)) = True Then
            Response.Redirect("editinfo.aspx")
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
