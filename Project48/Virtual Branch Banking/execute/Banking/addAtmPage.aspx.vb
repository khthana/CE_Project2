'***********************************************************************
'Class addAtmPage  : Definition Class for add new atm show as web page *
'***********************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Imports System.IO
Public Class addAtmPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents showtext As System.Web.UI.WebControls.Label
    Protected WithEvents submitButton As System.Web.UI.WebControls.Button
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents areaCodeTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents bankCodeTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents atmCodeTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents locationTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents cityList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents systemUsedList As System.Web.UI.WebControls.DropDownList

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
    '**************************************************
    'Insert : insert new atm and save to database     *
    '**************************************************
    Public Sub Insert()
        Dim atm1 As New ATM(atmCodeTextBox.Text, New Bank(bankCodeTextBox.Text), locationTextBox.Text, _
            areaCodeTextBox.Text, cityList.SelectedItem.Value, systemUsedList.SelectedItem.Value)
        If (atm1.Save(atm1)) = 1 Then ' Add New Admin Successed...
            showtext.Text = "Add ATM Successed..."
            showtext.Text = showtext.Text & "<a href=mainmenuPage.aspx>Back to Main Menu</a>"
        Else ' ATM had already exist in database
            showtext.Text = "ATM had already exist,Please select others"
        End If
    End Sub
    '************************************************************************
    'submitButton_Click : Event then submit in order to insert new atm      *
    '************************************************************************
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles submitButton.Click
        'ShowText.Text = "OK"
        If atmCodeTextBox.Text = "" Or bankCodeTextBox.Text = "" Then
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
        atmCodeTextBox.Text = ""
        bankCodeTextBox.Text = ""
        locationTextBox.Text = ""
        areaCodeTextBox.Text = ""
        cityList.SelectedIndex = 0
    End Sub
End Class
