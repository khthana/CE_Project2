Public Class addForexRate
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Label6 As System.Web.UI.WebControls.Label
    Protected WithEvents showtext As System.Web.UI.WebControls.Label
    Protected WithEvents submitButton As System.Web.UI.WebControls.Button
    Protected WithEvents Label2 As System.Web.UI.WebControls.Label
    Protected WithEvents Label1 As System.Web.UI.WebControls.Label
    Protected WithEvents currencyList As System.Web.UI.WebControls.DropDownList
    Protected WithEvents rateTextBox As System.Web.UI.WebControls.TextBox

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
    Private Sub submitButton_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles submitButton.Click
        If (rateTextBox.Text = "") Then
            showtext.Text = "Please insert rate..."
            Exit Sub
        Else
            Dim forex As New Forex(currencyList.SelectedItem.Value, CDbl(rateTextBox.Text))
            If (forex.Save(forex) = -1) Then
                showtext.Text = "Cannot save currency rate..."
                Exit Sub
            Else
                showtext.Text = "Save currency rate successed..."
                currencyList.SelectedIndex = 0
                rateTextBox.Text = ""
            End If
        End If
    End Sub
End Class
