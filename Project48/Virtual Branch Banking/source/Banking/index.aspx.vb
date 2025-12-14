'*****************************************************************
'LoginPage    : Class Definition for Start up Page
'Author       : Mr.Thanapong Chattanupakorn 46015350
'             : Mr.Thawatchai Bunsri        46015351
'Senior Project for Computer Engineering Faculty,KMITL (2005-2006)
'Date         : 5 Feb 2006
'*****************************************************************
Imports System.Security.Cryptography
Imports System.Text
Imports System.IO
Imports Banking.AdminDA

Public Class StartPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents enterButton As System.Web.UI.WebControls.Button
    Protected WithEvents passwordTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents usernameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents loginLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents BankLocationLabel As System.Web.UI.WebControls.Label
    Protected WithEvents BankNameLabel As System.Web.UI.WebControls.Label

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
        '****************************************************
        'ทดสอบการใช้งานของ class Bank โดยปกติ ก่อนที่เราจะรันเว็บเพจ เราต้อง
        'สร้างObject ของระบบ คือ Bank และ BankingSystem ขึ้นมาก่อนแล้ว
        '****************************************************
        Dim KMITL As New Bank
        KMITL.SetBankID("001")
        KMITL.SetBankName("KMITL")
        KMITL.SetBankLocation("225 ถ.ฉลองกรุง ลาดกระบัง")
        BankNameLabel.Text = KMITL.GetBankName + " BANK"
        BankLocationLabel.Text = KMITL.GetBankLocation

    End Sub
    Private Sub Encrypted(ByVal Sender As Object, ByVal E As EventArgs) ' เข้ารหัสข้อมูลด้วยวิธีมาตรฐาน MD5
        Dim md5Provider As New MD5CryptoServiceProvider
        Dim data() As Byte = Encoding.ASCII.GetBytes(passwordTextBox.Text)
        Dim encryptedData() As Byte = md5Provider.ComputeHash(data)
        Dim encryptedPassword As String = Convert.ToBase64String(encryptedData)
        Check(encryptedPassword)

    End Sub
    Private Sub Check(ByVal encryptedPassword As String) 'ยืนยันตัวตนในการเข้าใช้งาน
        Dim admin1 As New Administrator
        'admin1.SetAdminID(1)
        admin1.SetUsername(usernameTextBox.Text)
        admin1.SetPassword(encryptedPassword)

        If (admin1.Check(admin1).GetAdminID = 0) Then ' GetAdminID = 0 หมายถึง ไม่มีรายชื่อผู้ใช้ในฐานข้อมูล
            Label1.Text = "Invalid Username or Password"
            Exit Sub
        Else
            Session("User") = usernameTextBox.Text
            Response.Redirect("mainmenuPage.aspx?path=" & Session("User"))
            Exit Sub
        End If

    End Sub

    Private Sub enterButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles enterButton.Click
        If usernameTextBox.Text = "" Or passwordTextBox.Text = "" Then 'ตรวจสอบความผิดพลาดในการกรอกข้อมูล
            Label1.Text = "Please insert Username or Password"
            Exit Sub
        Else
            Encrypted(sender, e)
            Exit Sub
        End If
    End Sub
End Class
