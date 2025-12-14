'****************************************************************************
'Class addAccPage  : Definition Class for add new accoount show as web page *
'****************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Imports System.IO
Public Class addAccPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents cusIDTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents accNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents accTypeList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents balanceTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents submitButton As System.Web.UI.WebControls.Button
    Protected WithEvents showtext As System.Web.UI.WebControls.Label

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
    '******************************************************
    'Insert : insert new account and save to database     *
    '******************************************************
    Public Sub Insert()
        Dim acct1 As New Account(accNoTextBox.Text, accTypeList.SelectedItem.Value, _
            balanceTextBox.Text, balanceTextBox.Text, New Customer(cusIDTextBox.Text), _
            Date.Today, Date.Today)
        If (acct1.Save(acct1)) = 1 Then ' Add New Account Successed...
            showtext.Text = "Add New Account Successed..."
            showtext.Text = showtext.Text & "<a href=mainmenuPage.aspx>Bank to Main Menu Page</a>"
        Else ' Account had already exist in database
            showtext.Text = "Account had already exist,Please select other account"
        End If
    End Sub
    '************************************************************************
    'submitButton_Click : Event then submit in order to insert new account  *
    '************************************************************************
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles submitButton.Click
        If cusIDTextBox.Text = "" Or accNoTextBox.Text = "" Or balanceTextBox.Text = "" Then
            showtext.Text = "Please fill out the form especailly (*)"
            Exit Sub
        End If
        Insert()
        clearAllData()
    End Sub
    '*************************************
    'Clear : Clear all data in the form  *
    '*************************************
    Public Sub clearAllData()
        cusIDTextBox.Text = ""
        accNoTextBox.Text = ""
        accTypeList.SelectedIndex = 0
        balanceTextBox.Text = ""
    End Sub
End Class
