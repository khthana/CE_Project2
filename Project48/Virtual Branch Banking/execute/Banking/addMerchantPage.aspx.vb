'**********************************************************************************
'Class addMerchantPage  : Definition Class for add new merchant show as web page  *
'**********************************************************************************
Public Class addMerchantPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents showtext As System.Web.UI.WebControls.Label
    Protected WithEvents submitButton As System.Web.UI.WebControls.Button
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents balanceTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents accTypeList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents accNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents merTypeList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents productNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents merNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents merIDTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents stateList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cityList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents districtTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents streetTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents addTypeList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents addNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label26 As System.Web.UI.WebControls.Label
    Protected WithEvents Label17 As System.Web.UI.WebControls.Label
    Protected WithEvents Label15 As System.Web.UI.WebControls.Label
    Protected WithEvents Label16 As System.Web.UI.WebControls.Label
    Protected WithEvents Label18 As System.Web.UI.WebControls.Label
    Protected WithEvents Label19 As System.Web.UI.WebControls.Label
    Protected WithEvents Label20 As System.Web.UI.WebControls.Label
    Protected WithEvents Label21 As System.Web.UI.WebControls.Label
    Protected WithEvents Label22 As System.Web.UI.WebControls.Label
    Protected WithEvents Label23 As System.Web.UI.WebControls.Label
    Protected WithEvents Label24 As System.Web.UI.WebControls.Label
    Protected WithEvents Label25 As System.Web.UI.WebControls.Label
    Protected WithEvents soiTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents postcodeTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents officePhoneTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents faxnoTextBox As System.Web.UI.WebControls.TextBox

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

    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles submitButton.Click
        If (merNameTextBox.Text = "" Or productNameTextBox.Text = "" Or accNoTextBox.Text = "" Or balanceTextBox.Text = "") Then
            showtext.Text = "Please fill out the form..."
            Exit Sub
        Else
            '*******************************Add new merchant
            Dim mer1 As New Merchant(merIDTextBox.Text, merNameTextBox.Text, merTypeList.SelectedItem.Value, productNameTextBox.Text, officePhoneTextBox.Text, faxnoTextBox.Text)
            '*******************************Add Merchant Address
            Dim addr1 As New Address(New Customer(merIDTextBox.Text), addTypeList.SelectedItem.Value, addNoTextBox.Text, _
                        soiTextBox.Text, streetTextBox.Text, districtTextBox.Text, cityList.SelectedItem.Value, _
                        stateList.SelectedItem.Value, postcodeTextBox.Text)
            '*******************************Add new account
            Dim acct1 As New Account(accNoTextBox.Text, accTypeList.SelectedItem.Value, _
            balanceTextBox.Text, balanceTextBox.Text, New Customer(merIDTextBox.Text), _
            Date.Today, Date.Today)

            If (mer1.Save(mer1) = 1 And acct1.Save(acct1) = 1 And addr1.Save(addr1) = 1) Then
                showtext.Text = "Add new Merchant successed..."
                showtext.Text = showtext.Text & "<a href=mainmenuPage.aspx>Bank to Main Menu Page</a>"
            Else
                showtext.Text = "Merchant had already exist,Please select other account"
            End If
            clearAllData()
        End If
    End Sub
    Public Sub clearAllData()
        merIDTextBox.Text = ""
        merNameTextBox.Text = ""
        merTypeList.SelectedIndex = 0
        productNameTextBox.Text = ""
        accNoTextBox.Text = ""
        accTypeList.SelectedIndex = 0
        balanceTextBox.Text = ""
    End Sub
End Class
