Public Class confirmcancel
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents radCancel As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents txtCancel As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnBack As System.Web.UI.WebControls.Button
    Protected WithEvents btnConfirm As System.Web.UI.WebControls.Button

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

        End If
    End Sub

    Private Function GetReason() As String
        '++++Prepare reason of cancelation===========
        Dim Reason As String
        If radCancel.Items(radCancel.SelectedIndex).Value = "0" Then
            Reason = radCancel.Items(0).Text
        Else
            Reason = txtCancel.Text
        End If
    End Function

    Private Sub btnConfirm_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnConfirm.Click

        '++++Sending info to each airline & skyhigh============================
        Dim AllCancel As New SkyHighTP.TwoPhaseWS
        If AllCancel.Cancel(Session("BookRef"), CStr(radCancel.Items(radCancel.SelectedIndex).Value), GetReason()) = True Then
            '++++Sending e-mail to our customer about cancelation===========
            Dim QueryString As String = "SELECT email FROM member m,bookeddetails bd WHERE m.memberid=bd.memberid AND bd.bookref='" & Session("BookRef") & "'"
            Dim Email As String = Airline.Query(QueryString).Tables(0).Rows(0).Item("Email")

            Dim Content As String = "Your booking (Booking Reference = " & Session("BookRef") & ") has been canceled.<br>...Thank you for visit us."
            Airline.MailTo(Email, "Flight Cancelation", Content)
            Response.Redirect("cancelresult.aspx?IsCancel=Yes")
        Else
            Response.Redirect("cancelresult.aspx?IsCancel=No")
        End If

    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("itinerary.aspx")
    End Sub
End Class
