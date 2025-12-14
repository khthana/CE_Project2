'*********************************************************************************
'Class withdrawPage : Definition class for withdraw transaction show as web page *
'*********************************************************************************
Public Class withdrawPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents fromAccountList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents secureCodeTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents amountTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
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
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents withdrawButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents accSumButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents openNewAccButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents withdrawMenuButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents depositMenuButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents transferMenuButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents updatePassButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents transferHisButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents homeButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents recieptImage As System.Web.UI.WebControls.Image

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
        Dim cus1 As New Customer(Session("CusID"))
        Dim cusChecked As Customer = cus1.Check(cus1)
        Dim i As Integer = 0
        '****************************************
        'สร้างออบเจ็คที่ติดต่อกับ account database เพื่อรอรับค่าที่ส่งกลับมาเป็น dataset
        '****************************************
        Dim acc1 As New Account(0, cusChecked)
        Dim acc1DA As New AccountDA
        Dim accountDataset As New DataSet("acct_select_dataset")
        accountDataset = acc1DA.SelectDataset(acc1)
        '****************************************
        'กำหนดค่าให้กับ account list
        '****************************************
        If fromAccountList.Items.Count = 0 Then
            For i = 0 To accountDataset.Tables("acct_select_dataset").Rows.Count - 1
                fromAccountList.Items.Add(accountDataset.Tables("acct_select_dataset").Rows(i).Item("ACC_NO"))
            Next
            Exit Sub
        Else
            Exit Sub
        End If
    End Sub
    '*************************************************************
    'เหต์การณ์เมื่อกดลิงค์ปุ่มต่างๆ
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
    '****************************************************************
    Private Sub accSumButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles accSumButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("accSumPage.aspx")
        End If
    End Sub

    Private Sub openNewAccButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles openNewAccButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("openAccPage.aspx")
        End If
    End Sub
    Private Sub tranferMenuButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles transferMenuButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("transferPage.aspx")
        End If
    End Sub

    Private Sub updatePassButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles updatePassButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("updatePassbookPage.aspx")
        End If
    End Sub

    Private Sub tranferHisButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles transferHisButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("transferHisPage.aspx")
        End If
    End Sub
    Private Sub withdrawMenuButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles withdrawMenuButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("withdrawPage.aspx")
        End If
    End Sub

    Private Sub depositMenuButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles depositMenuButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("depositPage.aspx")
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
    '********************************************************
    'เหตูการเมื่อกดปุ่ม withdrawal เพื่อทำการ ถอนเงิน
    '********************************************************
    Private Sub withdrawButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles withdrawButton.Click
        Dim atm1 As New ATM(Session("ATMCODE"))
        atm1 = atm1.Check(atm1)
        Dim systemUsed As String = atm1.GetSystemUsed
        '****************************************
        'ตรวจสอบความผิดพลาดในการกรอกข้อมูล
        '****************************************
        If amountTextBox.Text = "" Then
            Response.Redirect("errorPage.aspx?reason=Please insert amount...")
            Exit Sub
        Else
            '********************************************
            'แยกประเภทของระบบการทำงานให้กับ ATM ในแต่ละพื้นที่
            '********************************************
            Select Case systemUsed
                Case "CapitalSystem"
                    Dim system1 As New CapitalSystem
                    system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, amountTextBox.Text, atm1)
                    recieptImage.Visible = True
                    ClearAllData()
                Case "ProvinceSystem"
                    Dim system1 As New ProvinceSystem
                    system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, amountTextBox.Text, atm1)
                    recieptImage.Visible = True
                    ClearAllData()
                Case "DistrictSystem"
                    Dim system1 As New DistrictSystem
                    system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, amountTextBox.Text, atm1)
                    recieptImage.Visible = True
                    ClearAllData()
                Case Else
                    Dim system1 As New BankingSystem
                    system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, amountTextBox.Text, atm1)
                    recieptImage.Visible = True
                    ClearAllData()
            End Select
        End If
    End Sub
    '********************************************************
    Private Sub ClearAllData()
        fromAccountList.SelectedIndex = 0
        amountTextBox.Text = ""
    End Sub
End Class
