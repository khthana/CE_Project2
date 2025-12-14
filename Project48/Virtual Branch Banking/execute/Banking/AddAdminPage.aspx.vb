'****************************************************************************
'Class addAdminPage  : Definition Class for add new admin show as web page  *
'****************************************************************************
Imports System.Security.Cryptography
Imports System.Text
Imports System.IO
Imports Banking.AdminDA
Public Class AddAdminPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents showtext As System.Web.UI.WebControls.Label
    Protected WithEvents passwordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents usernameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents confirmPassword As System.Web.UI.WebControls.TextBox
    Protected WithEvents submitButton As System.Web.UI.WebControls.Button

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
    '***********************************************************************
    'Encrypted : encypted the new password before keep in the database     *
    '***********************************************************************
    Private Sub Encrypted(ByVal Sender As Object, ByVal E As EventArgs)
        Dim md5Provider As New MD5CryptoServiceProvider
        Dim data() As Byte = Encoding.ASCII.GetBytes(passwordTextBox.Text)
        Dim encryptedData() As Byte = md5Provider.ComputeHash(data)
        Dim encryptedPassword As String = Convert.ToBase64String(encryptedData)
        Insert(encryptedPassword)
    End Sub
    '********************************************************
    'Insert : insert new admin and save to database         *
    '********************************************************
    Private Sub Insert(ByVal encryptedPassword As String)
        Dim admin1 As New Administrator(usernameTextBox.Text, encryptedPassword)
        If (admin1.Save(admin1)) = 1 Then ' Add New Admin Successed...
            Dim pathDir As String = Path.GetDirectoryName(Server.MapPath("./"))
            Dim objDir As DirectoryInfo = New DirectoryInfo(pathDir)
            objDir.CreateSubdirectory(usernameTextBox.Text)
            showtext.Text = "Add New Admin Successed..."
            showtext.Text = showtext.Text & "<a href=index.aspx>Click here for Log in</a>"
        Else ' Admin had already exist in database
            showtext.Text = "Username has already exist,Please select other username"
        End If
    End Sub
    '************************************************************************
    'submitButton_Click : Event then submit in order to insert new admin    *
    '************************************************************************
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles submitButton.Click
        If usernameTextBox.Text = "" Or passwordTextBox.Text = "" Or confirmPassword.Text = "" Then
            showtext.Text = "Please fill out the form especailly (*)"
            Exit Sub
        End If
        If passwordTextBox.Text().Equals(confirmPassword.Text) = False Then
            showtext.Text = "Confirm password error."
            Exit Sub
        End If
        Encrypted(sender, e)
    End Sub
End Class
