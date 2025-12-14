'******************************************************************************
'Class registerPage : Definition class for customer register show as web page *
'******************************************************************************
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
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents usernameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents passwordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents confirmPasswordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents regisByList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents cardNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents pinTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents noOfUser As System.Web.UI.WebControls.Label
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents Label14 As System.Web.UI.WebControls.Label
    Protected WithEvents Label15 As System.Web.UI.WebControls.Label
    Protected WithEvents personalOptionButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents creditLoanButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents forexButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents chequeButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents paymentButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents accessAccButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents logoffButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents Label16 As System.Web.UI.WebControls.Label
    Protected WithEvents submitButton As System.Web.UI.WebControls.ImageButton
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
            Exit Sub
        Else ' Member had already exist in database
            Exit Sub
        End If
    End Sub
    '*************************************************************
    'เหต์การณ์เมื่อกดปุ่มลิงค์ต่างๆ
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
    '*************************************************************
    'เหต์การณ์เมื่อกดปุ่ม submit เพื่อทำการสมัครสมาชิก
    '*************************************************************
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles submitButton.Click
        '**********************************
        'Verify invalid input
        '**********************************
        If cardNoTextBox.Text = "" Or pinTextBox.Text = "" Or usernameTextBox.Text = "" Or _
            passwordTextBox.Text = "" Or confirmPasswordTextBox.Text = "" Then
            Exit Sub
        End If
        If passwordTextBox.Text().Equals(confirmPasswordTextBox.Text) = False Then
            Exit Sub
        End If
        '**********************************
        'Verify ATM Card No. & PIN 
        '**********************************
        Dim card1 As New Card(cardNoTextBox.Text, pinTextBox.Text)
        If (card1.CheckPIN(card1).GetCardNo = 0) Then
            'showtext.Text = "Invalid Card No. or PIN, Please select others"
            Exit Sub
        Else
            '******************************
            'Get customer id from Card
            Dim cusIDTmp As String = card1.Check(card1).GetCustomerOwner.GetcusID()
            Dim cus1 As New Customer(cusIDTmp)
            cus1 = cus1.Check(cus1)
            Encrypted(sender, e, cus1)
        End If
        '**********************************
    End Sub
End Class
