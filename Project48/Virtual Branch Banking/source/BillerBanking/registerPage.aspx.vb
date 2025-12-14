Imports System.Security.Cryptography
Imports System.Data
Imports Oracle.DataAccess.Client
Imports System.Text
Imports System.IO
Public Class registerPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents HyperLink2 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents showtext As System.Web.UI.WebControls.Label
    Protected WithEvents Label28 As System.Web.UI.WebControls.Label
    Protected WithEvents submitButton As System.Web.UI.WebControls.Button
    Protected WithEvents confirmPasswordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents passwordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents usernameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents merIDTextBox As System.Web.UI.WebControls.TextBox

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
    Private Sub Encrypted(ByVal Sender As Object, ByVal E As EventArgs, ByVal cus As Customer)
        Dim md5Provider As New MD5CryptoServiceProvider
        Dim data() As Byte = Encoding.ASCII.GetBytes(passwordTextBox.Text)
        Dim encryptedData() As Byte = md5Provider.ComputeHash(data)
        Dim encryptedPassword As String = Convert.ToBase64String(encryptedData)
        Insert(encryptedPassword, cus)
    End Sub
    Private Sub Insert(ByVal encryptedPassword As String, ByVal cus As Customer)
        Dim mem1 As New Member(0, usernameTextBox.Text, encryptedPassword, Date.Today, "active", cus)
        If (mem1.Save(mem1)) = 1 Then ' Add New Member Successed...
            showtext.Text = "Add Member Successed..."
            showtext.Text = showtext.Text & "<a href=index.aspx>Back to Log in page</a>"
            Exit Sub
        Else ' Member had already exist in database
            showtext.Text = "Member had already exist,Please select others"
            Exit Sub
        End If
    End Sub
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles submitButton.Click
        '**********************************
        'Verify invalid input
        '**********************************
        If (merIDTextBox.Text = "" Or usernameTextBox.Text = "" Or _
            passwordTextBox.Text = "" Or confirmPasswordTextBox.Text = "") Then
            showtext.Text = "Please fill out the form especailly (*)"
            Exit Sub
        End If
        If passwordTextBox.Text().Equals(confirmPasswordTextBox.Text) = False Then
            showtext.Text = "Confirm password error."
            Exit Sub
        End If
        '**********************************
        'Verify Merchant 
        '**********************************
        Dim mer1 As New Merchant(merIDTextBox.Text, "", "", "", "", "")
        If (mer1.Check(mer1).GetMerchantID = 0) Then
            showtext.Text = "Invalid Merchant, Please select others"
            Exit Sub
        Else
            'Get customer id from merchant
            Dim cus1 As New Customer(mer1.Check(mer1).GetMerchantID)
            Encrypted(sender, e, cus1)
        End If
        '**********************************
    End Sub
End Class
