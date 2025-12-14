'*****************************************************************************
'Class addCusPage  : Definition Class for add new customer show as web page  *
'*****************************************************************************
Imports System.Data
Imports Oracle.DataAccess.Client
Imports System.IO
Public Class addCusPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents personalIDTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents Label14 As System.Web.UI.WebControls.Label
    Protected WithEvents Label15 As System.Web.UI.WebControls.Label
    Protected WithEvents Label16 As System.Web.UI.WebControls.Label
    Protected WithEvents Label17 As System.Web.UI.WebControls.Label
    Protected WithEvents Label18 As System.Web.UI.WebControls.Label
    Protected WithEvents Label19 As System.Web.UI.WebControls.Label
    Protected WithEvents Label20 As System.Web.UI.WebControls.Label
    Protected WithEvents Label21 As System.Web.UI.WebControls.Label
    Protected WithEvents Label22 As System.Web.UI.WebControls.Label
    Protected WithEvents Label23 As System.Web.UI.WebControls.Label
    Protected WithEvents Label24 As System.Web.UI.WebControls.Label
    Protected WithEvents Label25 As System.Web.UI.WebControls.Label
    Protected WithEvents Label26 As System.Web.UI.WebControls.Label
    Protected WithEvents Label27 As System.Web.UI.WebControls.Label
    Protected WithEvents enNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents enSurnameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents thNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents thSurnameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents dBirthList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents mBirthList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents yBirthList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents ageTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents genderList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents emailTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents occupationList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents salaryTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents addNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents addTypeList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents soiTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents streetTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents districtTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents cityList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents stateList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents postcodeTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents homePhoneTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents officePhoneTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents mobilePhoneTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents faxnoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents showtext As System.Web.UI.WebControls.Label
    Protected WithEvents submitButton As System.Web.UI.WebControls.Button
    Protected WithEvents clearButton As System.Web.UI.WebControls.Button

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
        Dim i As Integer
        '*********************************
        'Load items for dayList
        '*********************************
        If dBirthList.Items.Count <> 0 Then
            Exit Sub
        Else
            For i = 1 To 31
                dBirthList.Items.Add(i)
                dBirthList.DataBind()
            Next
        End If
        '*********************************
        'Load items for day Lists
        '*********************************
        If mBirthList.Items.Count <> 0 Then
            Exit Sub
        Else
            For i = 1 To 12
                mBirthList.Items.Add(i)
                mBirthList.DataBind()
            Next
        End If
        '*********************************
        'Load items for year Lists
        '*********************************
        If yBirthList.Items.Count <> 0 Then
            Exit Sub
        Else
            For i = 2470 To 2550
                yBirthList.Items.Add(i)
                yBirthList.DataBind()
            Next
        End If
    End Sub
    '*******************************************************
    'Insert : insert new customer and save to database     *
    '*******************************************************
    Private Sub Insert()
        Dim customer1 As New Customer(personalIDTextBox.Text, enNameTextBox.Text, _
            enSurnameTextBox.Text, thNameTextBox.Text, thSurnameTextBox.Text, CInt(dBirthList.SelectedItem.Value), _
            CInt(mBirthList.SelectedItem.Value), CInt(yBirthList.SelectedItem.Value), ageTextBox.Text, _
            genderList.SelectedItem.Value, emailTextBox.Text, occupationList.SelectedItem.Value, _
            salaryTextBox.Text, homePhoneTextBox.Text, officePhoneTextBox.Text, mobilePhoneTextBox.Text, _
            faxnoTextBox.Text, "active")
        Dim addr1 As New Address(customer1, addTypeList.SelectedItem.Value, addNoTextBox.Text, _
            soiTextBox.Text, streetTextBox.Text, districtTextBox.Text, cityList.SelectedItem.Value, _
            stateList.SelectedItem.Value, postcodeTextBox.Text)

        If (customer1.Save(customer1) And addr1.Save(addr1)) = 1 Then  ' Add New Customer Successed...
            showtext.Text = "Add New Customer Successed..."
            showtext.Text = showtext.Text & "<a href=mainmenuPage.aspx>Back to Main Menu Page</a>"
        Else ' Customer had already exist in database
            showtext.Text = "Customer had already exist,Please select other customer ID"
        End If
    End Sub
    '*******************************************************************************
    'submitButton_Click : Event then submit in order to insert new bank's customer *
    '*******************************************************************************
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles submitButton.Click
        If personalIDTextBox.Text = "" Or enNameTextBox.Text = "" Or enSurnameTextBox.Text = "" Or dBirthList.SelectedValue = "" Or mBirthList.SelectedValue = "" _
        Or yBirthList.SelectedValue = "" Or genderList.SelectedValue = "" Then
            showtext.Text = "Please fill out the form especailly (*)"
            Exit Sub
        End If
        If homePhoneTextBox.Text = "" Then
            homePhoneTextBox.Text = CStr(0)
        End If
        If officePhoneTextBox.Text = "" Then
            officePhoneTextBox.Text = CStr(0)
        End If
        If mobilePhoneTextBox.Text = "" Then
            mobilePhoneTextBox.Text = CStr(0)
        End If
        If faxnoTextBox.Text = "" Then
            faxnoTextBox.Text = CStr(0)
        End If
        Insert()
        clearAllData()
    End Sub
    '*************************************
    'Clear : Clear all data in the form  *
    '*************************************
    Private Sub clearAllData()
        personalIDTextBox.Text = ""
        enNameTextBox.Text = ""
        enSurnameTextBox.Text = ""
        thNameTextBox.Text = ""
        thSurnameTextBox.Text = ""
        dBirthList.SelectedIndex = 0
        mBirthList.SelectedIndex = 0
        yBirthList.SelectedIndex = 0
        ageTextBox.Text = ""
        genderList.SelectedIndex = 0
        emailTextBox.Text = ""
        occupationList.SelectedIndex = 0
        salaryTextBox.Text = ""
        addNoTextBox.Text = ""
        addTypeList.SelectedIndex = 0
        soiTextBox.Text = ""
        streetTextBox.Text = ""
        districtTextBox.Text = ""
        cityList.SelectedIndex = 0
        stateList.SelectedIndex = 0
        postcodeTextBox.Text = ""
        homePhoneTextBox.Text = ""
        officePhoneTextBox.Text = ""
        mobilePhoneTextBox.Text = ""
        faxnoTextBox.Text = ""
    End Sub
    Private Sub clearButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles clearButton.Click
        clearAllData()
    End Sub
End Class
