'************************************************************************************
'Class checkExPage  : Definition Class for chqeue enhancement show as web page      *
'************************************************************************************
Public Class CheckExPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents chequeTypelabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents amountLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents accNoLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents chequeNoLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Label3 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents amountTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents accNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents checkNoTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label As System.Web.UI.WebControls.Label
    Protected WithEvents ImageButton1 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label14 As System.Web.UI.WebControls.Label
    Protected WithEvents Label15 As System.Web.UI.WebControls.Label
    Protected WithEvents noOfUser As System.Web.UI.WebControls.Label
    Protected WithEvents Label16 As System.Web.UI.WebControls.Label
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents Label12 As System.Web.UI.WebControls.Label
    Protected WithEvents personalOptionButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents creditLoanButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents forexButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents chequeButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents paymentButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents accessAccButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents logoffButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents Label17 As System.Web.UI.WebControls.Label
    Protected WithEvents verifyButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents exchangeButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents cheqExButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents stopcheqButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents homebutton As System.Web.UI.WebControls.ImageButton

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
    '*************************************************************
    'Event then click any button
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
    Private Sub homeButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles homebutton.Click
        If Session("user") = "" Then
            Response.Clear()
            Response.Redirect("noSessionerrorPage.aspx")
            Exit Sub
        Else
            Response.Redirect("accSumPage.aspx")
        End If
    End Sub

    Private Sub verifyButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles verifyButton.Click
        Dim atm1 As New ATM(Session("ATMCODE"))
        atm1 = atm1.Check(atm1)
        Dim systemUsed As String = atm1.GetSystemUsed
        '****************************************
        If (checkNoTextBox.Text = "" Or accNoTextBox.Text = "" Or amountTextBox.Text = "") Then
            Response.Redirect("errorPage.aspx?reason=Please insert amount...")
            Exit Sub
        Else
            Select Case systemUsed
                Case "CapitalSystem"
                    Dim system1 As New CapitalSystem
                    Dim chequeVerify As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(checkNoTextBox.Text), CDbl(accNoTextBox.Text), atm1)
                    chequeNoLabel.Text = CStr(chequeVerify.GetCheckNo)
                    chequeTypelabel.Text = CStr(chequeVerify.GetCheckType)
                    accNoLabel.Text = CStr(chequeVerify.GetAccount.GetAccNo)
                    If (chequeVerify.GetCheckNo = 0) Then
                        amountLabel.Text = CStr(0)
                    Else : amountLabel.Text = amountTextBox.Text
                    End If
                    '*************************************
                Case "ProvinceSystem"
                    Dim system1 As New ProvinceSystem
                    Dim chequeVerify As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(checkNoTextBox.Text), CDbl(accNoTextBox.Text), atm1)
                    chequeNoLabel.Text = CStr(chequeVerify.GetCheckNo)
                    chequeTypelabel.Text = CStr(chequeVerify.GetCheckType)
                    accNoLabel.Text = CStr(chequeVerify.GetAccount.GetAccNo)
                    If (chequeVerify.GetCheckNo = 0) Then
                        amountLabel.Text = CStr(0)
                    Else : amountLabel.Text = amountTextBox.Text
                    End If
                    '*************************************
                Case "DistrictSystem"
                    Dim system1 As New DistrictSystem
                    Dim chequeVerify As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(checkNoTextBox.Text), CDbl(accNoTextBox.Text), atm1)
                    chequeNoLabel.Text = CStr(chequeVerify.GetCheckNo)
                    chequeTypelabel.Text = CStr(chequeVerify.GetCheckType)
                    accNoLabel.Text = CStr(chequeVerify.GetAccount.GetAccNo)
                    If (chequeVerify.GetCheckNo = 0) Then
                        amountLabel.Text = CStr(0)
                    Else : amountLabel.Text = amountTextBox.Text
                    End If
                    '*************************************
                Case Else
                    Dim system1 As New BankingSystem
                    Dim chequeVerify As Cheque = system1.chequeVerifyService(Session("cusID"), CInt(checkNoTextBox.Text), CDbl(accNoTextBox.Text), atm1)
                    chequeNoLabel.Text = CStr(chequeVerify.GetCheckNo)
                    chequeTypelabel.Text = CStr(chequeVerify.GetCheckType)
                    accNoLabel.Text = CStr(chequeVerify.GetAccount.GetAccNo)
                    If (chequeVerify.GetCheckNo = 0) Then
                        amountLabel.Text = CStr(0)
                    Else : amountLabel.Text = amountTextBox.Text
                    End If
                    '*************************************
            End Select
        End If
    End Sub
    '**************************************************************
    'เหตุการณ์เมื่อกดปุ่ม แลกเปลี่ยน เช็ค
    '**************************************************************
    Private Sub exchangeButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles exchangeButton.Click
        Dim atm1 As New ATM(Session("ATMCODE"))
        atm1 = atm1.Check(atm1)
        Dim systemUsed As String = atm1.GetSystemUsed
        '****************************************
        If (checkNoTextBox.Text = "" Or accNoTextBox.Text = "" Or amountTextBox.Text = "") Then
            Response.Redirect("errorPage.aspx?reason=Please insert amount...")
            Exit Sub
        ElseIf (chequeNoLabel.Text = 0) Then
            Exit Sub
        Else
            Select Case systemUsed
                Case "CapitalSystem"
                    Dim system1 As New CapitalSystem
                    If (system1.chequeExService(Session("cusID"), CInt(checkNoTextBox.Text), CDbl(accNoTextBox.Text), CDbl(amountTextBox.Text), atm1) = -1) Then
                        Response.Redirect("outOfServicePage.aspx")
                    Else

                    End If
                Case "ProvinceSystem"
                    Dim system1 As New ProvinceSystem
                    If (system1.chequeExService(Session("cusID"), CInt(checkNoTextBox.Text), CDbl(accNoTextBox.Text), CDbl(amountTextBox.Text), atm1) = -1) Then
                        Response.Redirect("outOfServicePage.aspx")
                    Else
                    End If
                Case "DistrictSystem"
                    Dim system1 As New DistrictSystem
                    If (system1.chequeExService(Session("cusID"), CInt(checkNoTextBox.Text), CDbl(accNoTextBox.Text), CDbl(amountTextBox.Text), atm1) = -1) Then
                        Response.Redirect("outOfServicePage.aspx")
                    Else
                    End If
                Case Else
                    Dim system1 As New BankingSystem
                    If (system1.chequeExService(Session("cusID"), CInt(checkNoTextBox.Text), CDbl(accNoTextBox.Text), CDbl(amountTextBox.Text), atm1) = -1) Then
                        Response.Redirect("outOfServicePage.aspx")
                    Else
                    End If
            End Select
        End If
    End Sub
End Class
