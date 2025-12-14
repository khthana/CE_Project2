'****************************************************************************
'Class PayMyBillsPage  : Definition Class for many paymeny transaction      *
'                           in the same time and show as web page           *                    *
'****************************************************************************
Public Class PayMyBillsPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents merchantList1 As System.Web.UI.WebControls.DropDownList
    Protected WithEvents merchantList2 As System.Web.UI.WebControls.DropDownList
    Protected WithEvents merchantList3 As System.Web.UI.WebControls.DropDownList
    Protected WithEvents merchantList4 As System.Web.UI.WebControls.DropDownList
    Protected WithEvents merchantList5 As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents amountTextBox1 As System.Web.UI.WebControls.TextBox
    Protected WithEvents amountTextBox2 As System.Web.UI.WebControls.TextBox
    Protected WithEvents amountTextBox3 As System.Web.UI.WebControls.TextBox
    Protected WithEvents amountTextBox4 As System.Web.UI.WebControls.TextBox
    Protected WithEvents amountTextBox5 As System.Web.UI.WebControls.TextBox
    Protected WithEvents dateTextBox1 As System.Web.UI.WebControls.TextBox
    Protected WithEvents dateTextBox2 As System.Web.UI.WebControls.TextBox
    Protected WithEvents dateTextBox3 As System.Web.UI.WebControls.TextBox
    Protected WithEvents dateTextBox4 As System.Web.UI.WebControls.TextBox
    Protected WithEvents dateTextBox5 As System.Web.UI.WebControls.TextBox
    Protected WithEvents fromAccountList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label14 As System.Web.UI.WebControls.Label
    Protected WithEvents Label15 As System.Web.UI.WebControls.Label
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
    Protected WithEvents payButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents quickPayButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents eduPayButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents paymentHisButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents paymybillButton As System.Web.UI.WebControls.ImageButton
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
        Dim cus1 As New Customer(Session("CusID"))
        Dim cusChecked As Customer = cus1.Check(cus1)
        Dim i As Integer = 0
        '**************************************************************
        'สร้างออบเจ็คที่ติดต่อกับ account database เพื่อรอรับค่าที่ส่งกลับมาเป็น dataset
        '**************************************************************
        Dim acc1 As New Account(0, cusChecked)
        Dim acc1DA As New AccountDA
        Dim accountDataset As New DataSet("acct_select_dataset")
        accountDataset = acc1DA.SelectDataset(acc1)
        '**************************************************************
        'สร้างออบเจ็คที่ติดต่อกับ merchant database เพื่อรอรับค่าที่ส่งกลับมาเป็น dataset
        '**************************************************************
        Dim merDA As New MerchantDA
        Dim merchantDataset As New DataSet("mer_select_dataset")
        merchantDataset = merDA.MerSelectDataset()
        '****************************************
        'กำหนดค่าให้กับ list
        '****************************************
        If fromAccountList.Items.Count = 0 Then
            For i = 0 To accountDataset.Tables("acct_select_dataset").Rows.Count - 1
                fromAccountList.Items.Add(accountDataset.Tables("acct_select_dataset").Rows(i).Item("ACC_NO"))
            Next
        Else : Exit Sub
        End If
        If merchantList1.Items.Count = 0 Then
            For i = 0 To merchantDataset.Tables("mer_select_dataset").Rows.Count - 1
                merchantList1.Items.Add(merchantDataset.Tables("mer_select_dataset").Rows(i).Item("MERCHANT_NAME"))
                merchantList2.Items.Add(merchantDataset.Tables("mer_select_dataset").Rows(i).Item("MERCHANT_NAME"))
                merchantList3.Items.Add(merchantDataset.Tables("mer_select_dataset").Rows(i).Item("MERCHANT_NAME"))
                merchantList4.Items.Add(merchantDataset.Tables("mer_select_dataset").Rows(i).Item("MERCHANT_NAME"))
                merchantList5.Items.Add(merchantDataset.Tables("mer_select_dataset").Rows(i).Item("MERCHANT_NAME"))
            Next
        Else : Exit Sub
        End If
        '****************************************
        amountTextBox1.Text = CInt(0)
        amountTextBox2.Text = CInt(0)
        amountTextBox3.Text = CInt(0)
        amountTextBox4.Text = CInt(0)
        amountTextBox5.Text = CInt(0)
        '****************************************
        dateTextBox1.Text = CStr(Date.Today.Date)
        dateTextBox2.Text = CStr(Date.Today.Date)
        dateTextBox3.Text = CStr(Date.Today.Date)
        dateTextBox4.Text = CStr(Date.Today.Date)
        dateTextBox5.Text = CStr(Date.Today.Date)
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
    '***************************************************************
    Private Sub quickPayButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles quickPayButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("quickPaymentPage.aspx")
        End If
    End Sub
    Private Sub paymybillButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles paymybillButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("PayMyBillsPage.aspx")
        End If
    End Sub
    Private Sub eduPayButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles eduPayButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("EduPaymentPage.aspx")
        End If
    End Sub
    Private Sub paymentHisButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles paymentHisButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("PayHistoryPage.aspx")
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
    'เหต์การณ์เมื่อกดปุ่ม Pay เพื่อทำการ ชำระค่าสินค้า
    '*************************************************************
    Private Sub payButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles payButton.Click
        Dim atm1 As New ATM(Session("ATMCODE"))
        atm1 = atm1.Check(atm1)
        Dim systemUsed As String = atm1.GetSystemUsed
        '****************************************
        Dim mer1 As New Merchant(0, merchantList1.SelectedItem.Value, "", "", "", "")
        Dim merChecked1 As Merchant = mer1.CheckByMerchantName(mer1)
        Dim toAcc1 As New Account(0, New Customer(merChecked1.GetMerchantID))
        Dim toAccNo1 As Double = toAcc1.CheckAccNo(toAcc1).GetAccNo
        '****************************************
        Dim mer2 As New Merchant(0, merchantList2.SelectedItem.Value, "", "", "", "")
        Dim merChecked2 As Merchant = mer2.Check(mer2)
        Dim toAcc2 As New Account(0, New Customer(merChecked2.GetMerchantID))
        Dim toAccNo2 As Double = toAcc2.CheckAccNo(toAcc2).GetAccNo
        '****************************************
        Dim mer3 As New Merchant(0, merchantList3.SelectedItem.Value, "", "", "", "")
        Dim merChecked3 As Merchant = mer3.Check(mer3)
        Dim toAcc3 As New Account(0, New Customer(merChecked3.GetMerchantID))
        Dim toAccNo3 As Double = toAcc3.CheckAccNo(toAcc3).GetAccNo
        '****************************************
        Dim mer4 As New Merchant(0, merchantList4.SelectedItem.Value, "", "", "", "")
        Dim merChecked4 As Merchant = mer4.Check(mer4)
        Dim toAcc4 As New Account(0, New Customer(merChecked4.GetMerchantID))
        Dim toAccNo4 As Double = toAcc4.CheckAccNo(toAcc4).GetAccNo
        '****************************************
        Dim mer5 As New Merchant(0, merchantList5.SelectedItem.Value, "", "", "", "")
        Dim merChecked5 As Merchant = mer5.Check(mer5)
        Dim toAcc5 As New Account(0, New Customer(merChecked5.GetMerchantID))
        Dim toAccNo5 As Double = toAcc5.CheckAccNo(toAcc5).GetAccNo
        '****************************************
        Dim fromAcc As New Account(fromAccountList.SelectedItem.Value)
        Dim fromAccChecked As Account = (fromAcc.Check(fromAcc))
        If (fromAccChecked.GetAccNo = 0) Then
            Response.Clear()
            Response.Redirect("errorPage.aspx?reason=Invalid account...")
            Exit Sub
        Else
            Dim i As Integer
            Dim sumAmount As Integer = 0
            sumAmount = CInt(amountTextBox1.Text) + CInt(amountTextBox2.Text) + CInt(amountTextBox3.Text) + CInt(amountTextBox4.Text) + CInt(amountTextBox5.Text)
            If (fromAccChecked.GetAvalBalance < sumAmount) Then
                Response.Clear()
                Response.Redirect("errorPage.aspx?reason=Amount over available balance...")
            Else
                '*****************************
                'Start Payment Service
                '*****************************
                Select Case systemUsed
                    Case "CapitalSystem"
                        Dim system1 As New CapitalSystem
                        system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, sumAmount, atm1)
                        system1.depositService(Session("cusID"), toAccNo1, CDbl(amountTextBox1.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo2, CDbl(amountTextBox2.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo3, CDbl(amountTextBox3.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo4, CDbl(amountTextBox4.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo5, CDbl(amountTextBox5.Text), atm1)
                    Case "ProvinceSystem"
                        Dim system1 As New ProvinceSystem
                        system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, sumAmount, atm1)
                        system1.depositService(Session("cusID"), toAccNo1, CDbl(amountTextBox1.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo2, CDbl(amountTextBox2.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo3, CDbl(amountTextBox3.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo4, CDbl(amountTextBox4.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo5, CDbl(amountTextBox5.Text), atm1)
                    Case "DistrictSystem"
                        Dim system1 As New DistrictSystem
                        system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, sumAmount, atm1)
                        system1.depositService(Session("cusID"), toAccNo1, CDbl(amountTextBox1.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo2, CDbl(amountTextBox2.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo3, CDbl(amountTextBox3.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo4, CDbl(amountTextBox4.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo5, CDbl(amountTextBox5.Text), atm1)
                    Case Else
                        Dim system1 As New BankingSystem
                        system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, sumAmount, atm1)
                        system1.depositService(Session("cusID"), toAccNo1, CDbl(amountTextBox1.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo2, CDbl(amountTextBox2.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo3, CDbl(amountTextBox3.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo4, CDbl(amountTextBox4.Text), atm1)
                        system1.depositService(Session("cusID"), toAccNo5, CDbl(amountTextBox5.Text), atm1)
                End Select
            End If
        End If
    End Sub
End Class
