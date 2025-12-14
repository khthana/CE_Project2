Public Class QuickPaymentPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents payerLabel As System.Web.UI.WebControls.Label
    Protected WithEvents billerLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents billerAccLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents amountLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents fromAccountList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cashAmountTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents payerNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents amountTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents Label14 As System.Web.UI.WebControls.Label
    Protected WithEvents merchantList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents paybyRadioButton As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents cashokLabel As System.Web.UI.WebControls.Label
    Protected WithEvents cashImage As System.Web.UI.WebControls.Image
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label15 As System.Web.UI.WebControls.Label
    Protected WithEvents Label16 As System.Web.UI.WebControls.Label
    Protected WithEvents noOfUser As System.Web.UI.WebControls.Label
    Protected WithEvents Label17 As System.Web.UI.WebControls.Label
    Protected WithEvents Label18 As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents personalOptionButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents creditLoanButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents forexButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents chequeButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents paymentButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents accessAccButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents logoffButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents verifyButton As System.Web.UI.WebControls.ImageButton
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
        Dim i As Integer = 0
        '**************************************************************
        'สร้างออบเจ็คที่ติดต่อกับ merchant database เพื่อรอรับค่าที่ส่งกลับมาเป็น dataset
        '**************************************************************
        Dim merDA As New MerchantDA
        Dim merchantDataset As New DataSet("mer_select_dataset")
        merchantDataset = merDA.MerSelectDataset()
        '****************************************
        If merchantList.Items.Count = 0 Then
            For i = 0 To merchantDataset.Tables("mer_select_dataset").Rows.Count - 1
                merchantList.Items.Add(merchantDataset.Tables("mer_select_dataset").Rows(i).Item("MERCHANT_NAME"))
                Next
        Else : Exit Sub
        End If
    End Sub
    '*************************************************************
    'เหต์การณ์เมื่อกดปุ่มลิงค์ต่างๆ
    '*************************************************************
    Private Sub paybyRadioButton_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles paybyRadioButton.SelectedIndexChanged
        If (paybyRadioButton.SelectedItem.Value = "byAccount") Then
            cashImage.Visible = False
            cashokLabel.Visible = False
            cashAmountTextBox.Visible = False
            '***************************************
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
            '****************************************
            'กำหนดค่าให้กับ list
            '****************************************
            If fromAccountList.Items.Count = 0 Then
                For i = 0 To accountDataset.Tables("acct_select_dataset").Rows.Count - 1
                    fromAccountList.Items.Add(accountDataset.Tables("acct_select_dataset").Rows(i).Item("ACC_NO"))
                Next
            Else : Exit Sub
            End If
            '****************************************
        ElseIf (paybyRadioButton.SelectedItem.Value = "byCash") Then
            fromAccountList.Items.Clear()
            cashImage.Visible = True
            cashokLabel.Visible = True
            cashAmountTextBox.Visible = True
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
    '*********************************************************
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
    'เหต์การณ์เมื่อกดปุ่ม verify เพื่อทำการตรวจสอบใบเสร็จที่อ่านได้จากเครื่อง
    '*************************************************************
    Private Sub verifyButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles verifyButton.Click
        Dim mer1 As New Merchant(0, merchantList.SelectedItem.Value, "", "", "", "")
        Dim merChecked1 As Merchant = mer1.CheckByMerchantName(mer1)
        Dim toAcc1 As New Account(0, New Customer(merChecked1.GetMerchantID))
        Dim toAccNo1 As Double = toAcc1.CheckAccNo(toAcc1).GetAccNo
        '******************************
        billerLabel.Text = mer1.GetMerchantName
        billerAccLabel.Text = CStr(toAccNo1)
        payerLabel.Text = payerNameTextBox.Text
        amountLabel.Text = amountTextBox.Text
        '*********************************
    End Sub
    '*************************************************************
    'เหต์การณ์เมื่อกดปุ่ม Pay เพื่อทำการ ชำระค่าสินค้า
    '*************************************************************
    Private Sub payButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles payButton.Click
        If (paybyRadioButton.SelectedItem.Value = "byAccount") Then
            Dim atm1 As New ATM(Session("ATMCODE"))
            atm1 = atm1.Check(atm1)
            Dim systemUsed As String = atm1.GetSystemUsed
            '***************************************
            Dim cus1 As New Customer(Session("CusID"))
            Dim cusChecked As Customer = cus1.Check(cus1)
            '****************************************
            Dim mer1 As New Merchant(0, merchantList.SelectedItem.Value, "", "", "", "")
            Dim merChecked1 As Merchant = mer1.CheckByMerchantName(mer1)
            Dim toAcc1 As New Account(0, New Customer(merChecked1.GetMerchantID))
            Dim toAccNo1 As Double = toAcc1.CheckAccNo(toAcc1).GetAccNo
            '****************************************
            Dim fromAcc As New Account(fromAccountList.SelectedItem.Value)
            Dim fromAccChecked As Account = (fromAcc.Check(fromAcc))
            If (fromAccChecked.GetAccNo = 0) Then
                Response.Clear()
                Response.Redirect("errorPage.aspx?reason=Invalid account...")
                Exit Sub
            Else
                'ตรวจสอบยอดเงินคงเหลือว่าพอชำระค่าบริการหรือไม่
                If (fromAccChecked.GetAvalBalance < CInt(amountTextBox.Text)) Then
                    Response.Clear()
                    Response.Redirect("errorPage.aspx?reason=Amount over available balance...")
                Else
                    '*************************************
                    'Start Payment Service transaction
                    '*************************************
                    Select Case systemUsed
                        Case "CapitalSystem"
                            Dim system1 As New CapitalSystem
                            system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, CDbl(amountTextBox.Text), atm1)
                            system1.depositService(Session("cusID"), toAccNo1, CDbl(amountTextBox.Text), atm1)
                            Dim payHis1 As New Payment(0, merchecked1.GetMerchantType, merchecked1, cusChecked, _
                                "account", CDbl(amountTextBox.Text), Date.Today.Date)
                            payHis1.Save(payHis1)
                        Case "ProvinceSystem"
                            Dim system1 As New ProvinceSystem
                            system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, CDbl(amountTextBox.Text), atm1)
                            system1.depositService(Session("cusID"), toAccNo1, CDbl(amountTextBox.Text), atm1)
                            Dim payHis1 As New Payment(0, merchecked1.GetMerchantType, merchecked1, cusChecked, _
                                "account", CDbl(amountTextBox.Text), Date.Today.Date)
                            payHis1.Save(payHis1)
                        Case "DistrictSystem"
                            Dim system1 As New DistrictSystem
                            system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, CDbl(amountTextBox.Text), atm1)
                            system1.depositService(Session("cusID"), toAccNo1, CDbl(amountTextBox.Text), atm1)
                            Dim payHis1 As New Payment(0, merchecked1.GetMerchantType, merchecked1, cusChecked, _
                                "account", CDbl(amountTextBox.Text), Date.Today.Date)
                            payHis1.Save(payHis1)
                        Case Else
                            Dim system1 As New BankingSystem
                            system1.withdrawService(Session("cusID"), fromAccountList.SelectedItem.Value, CDbl(amountTextBox.Text), atm1)
                            system1.depositService(Session("cusID"), toAccNo1, CDbl(amountTextBox.Text), atm1)
                            Dim payHis1 As New Payment(0, merchecked1.GetMerchantType, merchecked1, cusChecked, _
                                "account", CDbl(amountTextBox.Text), Date.Today.Date)
                            payHis1.Save(payHis1)
                    End Select
                End If
            End If
        ElseIf (paybyRadioButton.SelectedItem.Value = "byCash") Then
            Dim atm1 As New ATM(Session("ATMCODE"))
            atm1 = atm1.Check(atm1)
            Dim systemUsed As String = atm1.GetSystemUsed
            '****************************************
            Dim mer1 As New Merchant(0, merchantList.SelectedItem.Value, "", "", "", "")
            Dim merChecked1 As Merchant = mer1.CheckByMerchantName(mer1)
            Dim toAcc1 As New Account(0, New Customer(merChecked1.GetMerchantID))
            Dim toAccNo1 As Double = toAcc1.CheckAccNo(toAcc1).GetAccNo
            '****************************************
            If (CDbl(cashAmountTextBox.Text) < CDbl(amountTextBox.Text)) Then
                Response.Clear()
                Response.Redirect("errorPage.aspx?reason=Cash amount is not enough...")
            Else
                '*****************************
                'Start Payment Service
                '*****************************
                Select Case systemUsed
                    Case "CapitalSystem"
                        Dim system1 As New CapitalSystem
                        system1.depositService(Session("cusID"), toAccNo1, CDbl(cashAmountTextBox.Text), atm1)
                        Dim payHis1 As New Payment(0, merchecked1.GetMerchantType, merchecked1, New Customer(0, payerNameTextBox.Text), _
                                                "account", CDbl(amountTextBox.Text), Date.Today.Date)
                        payHis1.Save(payHis1)
                    Case "ProvinceSystem"
                        Dim system1 As New ProvinceSystem
                        system1.depositService(Session("cusID"), toAccNo1, CDbl(cashAmountTextBox.Text), atm1)
                        Dim payHis1 As New Payment(0, merchecked1.GetMerchantType, merchecked1, New Customer(0, payerNameTextBox.Text), _
                                                "account", CDbl(amountTextBox.Text), Date.Today.Date)
                        payHis1.Save(payHis1)
                    Case "DistrictSystem"
                        Dim system1 As New DistrictSystem
                        system1.depositService(Session("cusID"), toAccNo1, CDbl(cashAmountTextBox.Text), atm1)
                        Dim payHis1 As New Payment(0, merchecked1.GetMerchantType, merchecked1, New Customer(0, payerNameTextBox.Text), _
                                                "account", CDbl(amountTextBox.Text), Date.Today.Date)
                        payHis1.Save(payHis1)
                    Case Else
                        Dim system1 As New BankingSystem
                        system1.depositService(Session("cusID"), toAccNo1, CDbl(cashAmountTextBox.Text), atm1)
                        Dim payHis1 As New Payment(0, merchecked1.GetMerchantType, merchecked1, New Customer(0, payerNameTextBox.Text), _
                                                "account", CDbl(amountTextBox.Text), Date.Today.Date)
                        payHis1.Save(payHis1)
                End Select
            End If
        End If
    End Sub
End Class
