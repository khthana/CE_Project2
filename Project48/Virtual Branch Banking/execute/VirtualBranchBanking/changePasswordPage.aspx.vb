'***********************************************************************************
'Class changePasswordPage  : Definition Class for change password show as web page *
'***********************************************************************************
Public Class changePasswordPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents usernameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents confirmNewPasswordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents oldPasswordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents newPasswordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents noOfUser As System.Web.UI.WebControls.Label
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents personalOptionButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents creditLoanButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents forexButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents chequeButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents paymentButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents accessAccButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents logoffButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents submitButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents changeUserButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents changePassButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents homeButton As System.Web.UI.WebControls.ImageButton

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
        'Put user code to initialize the page here
    End Sub
    '*************************************************************
    'Event then click any button
    '*************************************************************
    Private Sub accessAccButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles accessAccButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("accSumPage.aspx")
        End If
    End Sub
    Private Sub paymentButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles paymentButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("quickPaymentPage.aspx")
        End If
    End Sub

    Private Sub chequeButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles chequeButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("CheckExPage.aspx")
        End If
    End Sub

    Private Sub forexButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles forexButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("forexPage.aspx")
        End If
    End Sub

    Private Sub personalOptionButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles personalOptionButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("changeUserPage.aspx")
        End If
    End Sub
    '******************************************************
    Private Sub changeUserButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles changeUserButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("changeUserPage.aspx")
        End If
    End Sub
    Private Sub changePassButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles changePassButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("changePasswordPage.aspx")
        End If
    End Sub
    '******************************************************
    Private Sub logoffButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles logoffButton.Click
        Session.Clear()
        Response.Redirect("index.aspx")
    End Sub
    Private Sub homeButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles homeButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("accSumPage.aspx")
        End If
    End Sub
    '***************************************************************************
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles submitButton.Click
        If (usernameTextBox.Text = "" Or oldPasswordTextBox.Text = "" Or newPasswordTextBox.Text = "" Or confirmNewPasswordTextBox.Text = "") Then
            'showtext.Text = "Please fill out the form..."
            Exit Sub
        Else
            '********************************
            Dim mem1 As New Member(usernameTextBox.Text, oldPasswordTextBox.Text)
            Dim memChecked As Member = mem1.Check(mem1)
            If (memChecked.GetMemberID = 0) Then
                'showtext.Text = "Invalid Username or Password..."
                Exit Sub
            Else
                If (newPasswordTextBox.Text.Equals(confirmNewPasswordTextBox.Text) = False) Then
                    'showtext.Text = "Invalid Confirm Password..."
                Else
                    Dim memUpdatePass As New Member(memChecked.GetMemberID, memChecked.GetUsername, newPasswordTextBox.Text, _
                        memChecked.GetMemExpDate, memChecked.GetMemStatus)
                    If (memUpdatePass.UpdatePass(memUpdatePass) = -1) Then
                        'showtext.Text = "Cannot Update Password..."
                        Exit Sub
                    Else
                        'showtext.Text = "Update Successed..."
                        oldPasswordTextBox.Text = ""
                        confirmNewPasswordTextBox.Text = ""
                        usernameTextBox.Text = ""
                        newPasswordTextBox.Text = ""
                    End If
                    Exit Sub
                End If
            End If
        End If
    End Sub
End Class
