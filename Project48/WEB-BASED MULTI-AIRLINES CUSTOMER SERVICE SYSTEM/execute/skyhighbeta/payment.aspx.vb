Public Class payment
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblBookRef As System.Web.UI.WebControls.Label
    Protected WithEvents Image5 As System.Web.UI.WebControls.Image
    Protected WithEvents lblTotal As System.Web.UI.WebControls.Label
    Protected WithEvents Image2 As System.Web.UI.WebControls.Image
    Protected WithEvents Image3 As System.Web.UI.WebControls.Image
    Protected WithEvents txtCredit1 As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCredit2 As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCredit3 As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCredit4 As System.Web.UI.WebControls.TextBox
    Protected WithEvents txtCreditLast3 As System.Web.UI.WebControls.TextBox
    Protected WithEvents Image4 As System.Web.UI.WebControls.Image
    Protected WithEvents cboMonth As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboYear As System.Web.UI.WebControls.DropDownList
    Protected WithEvents btnSubmit As System.Web.UI.WebControls.Button

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
        '++++Init value for first visit to this page====================
        If IsPostBack = False Then
            lblBookRef.Text = Session("BookRef")
            lblTotal.Text = "$ " & Session("AllTotal")
        End If

    End Sub

    Private Sub btnSubmit_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnSubmit.Click

        Dim CreditNumberPart1 As String = Airline.Encrypted(txtCredit1.Text)
        Dim CreditNumberPart2 As String = Airline.Encrypted(txtCredit2.Text)
        Dim CreditNumberPart3 As String = Airline.Encrypted(txtCredit3.Text)
        Dim CreditNumberPart4 As String = Airline.Encrypted(txtCredit4.Text)
        Dim CreditNumberLast3Digit As String = Airline.Encrypted(txtCreditLast3.Text)
        Dim ExpireMonth As String = cboMonth.Items(cboMonth.SelectedIndex).Value
        Dim ExpireYear As String = cboYear.Items(cboYear.SelectedIndex).Value

        '+++++Using WebService EPayment====================
        Dim ePayment As New VisaEPay.EPayment

        '++++Send info to credit card owner===============================
        If ePayMent.Pay(CreditNumberPart1, CreditNumberPart2, CreditNumberPart3, CreditNumberPart4, CreditNumberLast3Digit, ExpireMonth, ExpireYear) = "Y" Then
            '++++Send info to each airline & skyhigh===============================
            Dim AllPayment As New SkyHighTP.TwoPhaseWS
            If AllPayment.Paying(Session("BookRef")) = True Then
                Response.Redirect("paymentresult.aspx?IsPay=Y")
            Else
                Response.Redirect("paymentresult.aspx?IsPay=N")
            End If
        Else
            '++++Invalid by Visa===========================
            Response.Redirect("paymentresult.aspx?IsPay=N")
        End If

    End Sub
End Class
