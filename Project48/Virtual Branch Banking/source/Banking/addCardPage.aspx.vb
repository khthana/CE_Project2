'*****************************************************************************
'Class addCardPage  : Definition Class for add new atm card show as web page *
'*****************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Imports System.IO
Public Class addCardPage
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
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents showtext As System.Web.UI.WebControls.Label
    Protected WithEvents submitButton As System.Web.UI.WebControls.Button
    Protected WithEvents cusIDTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents accNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents cardNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents cardTypeList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents pinTextBox As System.Web.UI.WebControls.TextBox

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
    '*******************************************************
    'Insert : insert new atm card and save to database     *
    '*******************************************************
    Public Sub Insert(ByVal cus As Customer, ByVal acc As Account)
        Dim card1 As New Card(cardNoTextBox.Text, cardTypeList.SelectedItem.Value, pinTextBox.Text, cus, acc)
        If (card1.Save(card1)) = 1 Then ' Add New Card Successed...
            showtext.Text = "Add Card Successed..."
            showtext.Text = showtext.Text & "<a href=mainmenuPage.aspx>Back to Main Menu</a>"
            Exit Sub
        Else ' Card had already exist in database
            showtext.Text = "ATM had already exist,Please select others"
            Exit Sub
        End If
    End Sub
    '************************************************************************
    'submitButton_Click : Event then submit in order to insert new atm card *
    '************************************************************************
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles submitButton.Click
        If cardNoTextBox.Text = "" Or pinTextBox.Text = "" Or cusIDTextBox.Text = "" Or accNoTextBox.Text = "" Then
            showtext.Text = "Please fill out the form especailly (*)"
            Exit Sub
        Else
            '************************************
            Dim customer1 As New Customer(cusIDTextBox.Text)
            Dim customerDA As New CustomerDA
            Dim acc1 As New Account(accNoTextBox.Text)
            Dim accDA As New AccountDA
            If (customerDA.cusSelect(customer1).GetcusID = 0 And _
                accDA.accountSelect(acc1).GetAccNo = 0) Then
                showtext.Text = "Invalid Customer or Account, Please select others"
                Exit Sub
            Else
                Insert(customer1, acc1)
                clearAllData()
            End If
        End If

    End Sub
    '*************************************
    'Clear : Clear all data in the form  *
    '*************************************
    Public Sub clearAllData()
        cardNoTextBox.Text = ""
        cardTypeList.SelectedIndex = 0
        pinTextBox.Text = ""
        cusIDTextBox.Text = ""
        accNoTextBox.Text = ""
    End Sub
End Class
