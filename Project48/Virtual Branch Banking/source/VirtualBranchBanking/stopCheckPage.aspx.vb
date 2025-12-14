'*******************************************************************************
'Class stopCheckPage : Definition class for customer register show as web page *
'*******************************************************************************
Public Class stopCheckPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents accountList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents fromRangeTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents toRangeTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents RadioList As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents chequeNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
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
    Protected WithEvents stopButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents cheqExButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents stopcheqButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents homeButton As System.Web.UI.WebControls.ImageButton
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
        Dim cus1 As New Customer(Session("CusID"))
        Dim cusChecked As Customer = cus1.Check(cus1)
        Dim i As Integer = 0
        '**************************************************************
        'สร้างออบเจ็คที่ติดต่อกับ account database เพื่อรอรับค่าที่ส่งกลับมาเป็น dataset
        '**************************************************************
        Dim acc1 As New Account(0, cusChecked)
        Dim acc1DA As New AccountDA
        Dim accountDataset As New DataSet("acct_select_dataset_cheq")
        accountDataset = acc1DA.SelectDatasetCheque(acc1)
        '****************************************
        'กำหนดค่าให้กับ list
        '****************************************
        If accountList.Items.Count = 0 Then
            For i = 0 To accountDataset.Tables("acct_select_dataset_cheq").Rows.Count - 1
                accountList.Items.Add(accountDataset.Tables("acct_select_dataset_cheq").Rows(i).Item("ACC_NO"))
            Next
            accountList.SelectedIndex = 0
        Else
            Exit Sub
        End If
    End Sub
    '*************************************************************
    'เหต์การณ์เมื่อกดปุ่มลิงค์ต่างๆ
    '*************************************************************
    Private Sub RadioList_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles RadioList.SelectedIndexChanged
        If (RadioList.SelectedItem.Value = "ChequeNo") Then
            fromRangeTextBox.Text = ""
            toRangeTextBox.Text = ""
        ElseIf (RadioList.SelectedItem.Value = "ChequeRange") Then
            chequeNoTextBox.Text = ""
        End If
    End Sub
    '*****************************************************************
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
    '************************************************************
    Private Sub cheqExButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles cheqExButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("CheckExPage.aspx")
        End If
    End Sub
    Private Sub stopcheqButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles stopcheqButton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("stopCheckPage.aspx")
        End If
    End Sub
    '************************************************************
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
    'เหต์การณ์เมื่อกดปุ่ม stop เพื่อทำการอายัดเช็ค
    '*************************************************************
    Private Sub stopButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles stopButton.Click
        Dim i As Integer
        Dim atm1 As New ATM(Session("ATMCODE"))
        atm1 = atm1.Check(atm1)
        Dim systemUsed As String = atm1.GetSystemUsed
        ''****************************************
        If (RadioList.SelectedItem.Value = "ChequeNo") Then
            If (chequeNoTextBox.Text = "") Then
                Response.Redirect("errorPage.aspx?reason=Please insert cheque number...")
                Exit Sub
            Else
                Select Case systemUsed
                    Case "CapitalSystem"
                        Dim system1 As New CapitalSystem
                        Dim chequeVerify As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(chequeNoTextBox.Text), CDbl(accountList.SelectedItem.Value), atm1)
                        If (chequeVerify.GetCheckNo = 0) Then
                            showtext.Text = "Invalid Cheque..."
                        Else
                            Dim cheqDA As New ChequeDA
                            If (cheqDA.Update(chequeVerify) = -1) Then
                                showtext.Text = "Cannot Stop Cheque..."
                                Exit Sub
                            Else
                                showtext.Text = "Stop Cheque Successed..."
                                chequeNoTextBox.Text = ""
                            End If
                        End If
                        '*************************************
                    Case "ProvinceSystem"
                        Dim system1 As New ProvinceSystem
                        Dim chequeExchanged As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(chequeNoTextBox.Text), CDbl(accountList.SelectedItem.Value), atm1)
                        '*************************************
                    Case "DistrictSystem"
                        Dim system1 As New DistrictSystem
                        Dim chequeExchanged As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(chequeNoTextBox.Text), CDbl(accountList.SelectedItem.Value), atm1)
                        '*************************************
                    Case Else
                        Dim system1 As New BankingSystem
                        Dim chequeExchanged As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(chequeNoTextBox.Text), CDbl(accountList.SelectedItem.Value), atm1)
                        '*************************************
                End Select
            End If
        ElseIf (RadioList.SelectedItem.Value = "ChequeRange") Then
            If (fromRangeTextBox.Text = "" Or toRangeTextBox.Text = "") Then
                Response.Redirect("errorPage.aspx?reason=Please insert range...")
                Exit Sub
            Else
                Dim fromrange As Integer = CInt(fromRangeTextBox.Text)
                Dim torange As Integer = CInt(toRangeTextBox.Text)
                For i = fromrange To torange
                    Select Case systemUsed
                        Case "CapitalSystem"
                            Dim system1 As New CapitalSystem
                            Dim chequeVerify As Cheque = system1.chequeVerifyService(Session("cusID"), i, CDbl(accountList.SelectedItem.Value), atm1)
                            If (chequeVerify.GetCheckNo = 0) Then
                                showtext.Text = "Invalid Cheque..."
                            Else
                                Dim cheqDA As New ChequeDA
                                If (cheqDA.Update(chequeVerify) = -1) Then
                                    showtext.Text = "Cannot Stop Cheque..."
                                    Exit Sub
                                Else
                                    showtext.Text = "Stop Cheque Successed..."
                                    fromRangeTextBox.Text = ""
                                    toRangeTextBox.Text = ""
                                End If
                            End If
                            '*************************************
                        Case "ProvinceSystem"
                            Dim system1 As New ProvinceSystem
                            Dim chequeExchanged As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(chequeNoTextBox.Text), CDbl(accountList.SelectedItem.Value), atm1)
                            '*************************************
                        Case "DistrictSystem"
                            Dim system1 As New DistrictSystem
                            Dim chequeExchanged As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(chequeNoTextBox.Text), CDbl(accountList.SelectedItem.Value), atm1)
                            '*************************************
                        Case Else
                            Dim system1 As New BankingSystem
                            Dim chequeExchanged As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(chequeNoTextBox.Text), CDbl(accountList.SelectedItem.Value), atm1)
                            '*************************************
                    End Select
                Next
            End If
        End If
    End Sub
End Class
