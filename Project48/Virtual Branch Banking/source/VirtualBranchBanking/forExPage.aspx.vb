Public Class forExPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents currencyList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents amountTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents ImageButton1 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ImageButton2 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ImageButton3 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ImageButton4 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ImageButton5 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ImageButton6 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ImageButton7 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ImageButton8 As System.Web.UI.WebControls.ImageButton
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents convertedLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents HyperLink1 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink2 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink3 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink4 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink5 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink6 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink7 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink8 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink9 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink10 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink11 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink12 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink13 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink14 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink15 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink16 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink17 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink18 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink19 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents HyperLink20 As System.Web.UI.WebControls.HyperLink
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents userLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label10 As System.Web.UI.WebControls.Label
    Protected WithEvents Label14 As System.Web.UI.WebControls.Label
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
    Protected WithEvents calculateButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents convertButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents ImageButton9 As System.Web.UI.WebControls.ImageButton
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
    '******************************************************
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
    '*************************************************************
    'เหต์การณ์เมื่อกดปุ่มเพื่อทำการคำนวนจำนวนเงิน ก่อนการแลกเปลี่ยน
    '*************************************************************
    Private Sub calculateButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles calculateButton.Click
        Dim atm1 As New ATM(Session("ATMCODE"))
        atm1 = atm1.Check(atm1)
        Dim systemUsed As String = atm1.GetSystemUsed
        '****************************************
        If amountTextBox.Text = "" Then
            Response.Redirect("errorPage.aspx?reason=Please insert amount...")
            Exit Sub
        Else
            Select Case systemUsed
                Case "CapitalSystem"
                    Dim system1 As New CapitalSystem
                    Dim forexConverted As Forex = system1.forexService(Session("cusID"), currencyList.SelectedItem.Value, amountTextBox.Text, atm1)
                    convertedLabel.Text = CStr(forexConverted.GetAmount)
                Case "ProvinceSystem"
                    Dim system1 As New ProvinceSystem
                    Dim forexConverted As Forex = system1.forexService(Session("cusID"), currencyList.SelectedItem.Value, amountTextBox.Text, atm1)
                    convertedLabel.Text = CStr(forexConverted.GetAmount)
                Case "DistrictSystem"
                    Dim system1 As New DistrictSystem
                    Dim forexConverted As Forex = system1.forexService(Session("cusID"), currencyList.SelectedItem.Value, amountTextBox.Text, atm1)
                    convertedLabel.Text = CStr(forexConverted.GetAmount)
                Case Else
                    Dim system1 As New BankingSystem
                    Dim forexConverted As Forex = system1.forexService(Session("cusID"), currencyList.SelectedItem.Value, amountTextBox.Text, atm1)
                    convertedLabel.Text = CStr(forexConverted.GetAmount)
            End Select
        End If
    End Sub
End Class
