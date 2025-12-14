'****************************************************************************
'Class EduPaymentPage  : Definition Class for education payment transaction * 
'                           show as web page                                *
'****************************************************************************
Public Class EduPaymentPage
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label14 As System.Web.UI.WebControls.Label
    Protected WithEvents Label13 As System.Web.UI.WebControls.Label
    Protected WithEvents amountTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents payerNameTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents Label11 As System.Web.UI.WebControls.Label
    Protected WithEvents cashAmountTextBox As System.Web.UI.WebControls.TextBox
    Protected WithEvents cashokLabel As System.Web.UI.WebControls.Label
    Protected WithEvents cashImage As System.Web.UI.WebControls.Image
    Protected WithEvents paybyRadioButton As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents Label8 As System.Web.UI.WebControls.Label
    Protected WithEvents amountLabel As System.Web.UI.WebControls.Label
    Protected WithEvents Label7 As System.Web.UI.WebControls.Label
    Protected WithEvents Label9 As System.Web.UI.WebControls.Label
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents Label5 As System.Web.UI.WebControls.Label
    Protected WithEvents Label4 As System.Web.UI.WebControls.Label
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents fromAccountList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents merchantList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents uniAccLabel As System.Web.UI.WebControls.Label
    Protected WithEvents uniLabel As System.Web.UI.WebControls.Label
    Protected WithEvents studentLabel As System.Web.UI.WebControls.Label
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
    Protected WithEvents payButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents verifyButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents quickPayButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents paymybillButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents eduPayButton As System.Web.UI.WebControls.ImageButton
    Protected WithEvents paymentHisButton As System.Web.UI.WebControls.ImageButton
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
        '***************************************************************
        'สร้างออบเจ็คที่ติดต่อกับ merchant database เพื่อรอรับค่าที่ส่งกลับมาเป็น dataset
        '***************************************************************
        Dim merDA As New MerchantDA
        Dim merchantDataset As New DataSet("mer_select_dataset")
        merchantDataset = merDA.MerSelectUniDataset()
        '****************************************
        'กำหนดค่าให้กับ account list
        '****************************************
        If merchantList.Items.Count = 0 Then
            For i = 0 To merchantDataset.Tables("mer_select_dataset").Rows.Count - 1
                merchantList.Items.Add(merchantDataset.Tables("mer_select_dataset").Rows(i).Item("MERCHANT_NAME"))
            Next
        Else : Exit Sub
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
    '****************************************************************
    Private Sub verifyButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles verifyButton.Click
    End Sub
    Private Sub payButton_Click(ByVal sender As System.Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles payButton.Click
    End Sub
End Class
