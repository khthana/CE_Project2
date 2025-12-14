Public Class updateseat
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
    Protected WithEvents cboDay As System.Web.UI.WebControls.DropDownList
    Protected WithEvents cboYear As System.Web.UI.WebControls.DropDownList
    Protected WithEvents radCabinClass As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents cboFlightID As System.Web.UI.WebControls.DropDownList
    Protected WithEvents txtSeat As System.Web.UI.WebControls.TextBox
    Protected WithEvents btnUpdate As System.Web.UI.WebControls.Button
    Protected WithEvents cboMonth As System.Web.UI.WebControls.DropDownList

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
        If IsPostBack = False Then
            cboFlightID.DataSource = SkyHigh.GetFlightColumn
            cboFlightID.DataBind()
        End If

    End Sub

    Private Sub btnUpdate_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnUpdate.Click
        Dim UpdateSeatSet As New DataSet
        Dim SeatTable As New DataTable
        Dim SeatRow As DataRow
        SeatTable.Columns.Add(New DataColumn("SeatString", GetType(String)))

        Dim FlightID As String = cboFlightID.Items(cboFlightID.SelectedIndex).Value
        Dim CabinClassType As String = radCabinClass.Items(radCabinClass.SelectedIndex).Value
        Dim MDY As String = cboDay.Items(cboDay.SelectedIndex).Value & "/" & cboMonth.Items(cboMonth.SelectedIndex).Value & "/" & cboYear.Items(cboYear.SelectedIndex).Value
        Dim Seat As Integer = CInt(txtSeat.Text)

        Dim UpdateString As String = "UPDATE available SET " & GetClass(CabinClassType) & "=" & Seat & " WHERE flightid='" & FlightID & "' AND mdy='" & MDY & "'"
        SeatRow = SeatTable.NewRow()
        SeatRow.Item("SeatString") = UpdateString
        SeatTable.Rows.Add(SeatRow)
        UpdateSeatSet.Tables.Add(SeatTable)

        Dim Service As New skyhighSeat.Seat
        If Service.UpdateSeat(UpdateSeatSet) = "OK" Then
            lblStatus.Text = "Success!!"
        Else
            lblStatus.Text = "Fail!!"
        End If
        'lblStatus.Text = Service.UpdateSeat(cboFlightID.Items(cboFlightID.SelectedIndex).Value, MDY, radCabinClass.Items(radCabinClass.SelectedIndex).Value, txtSeat.Text)
    End Sub

    Function GetClass(ByVal CabinClassType) As String
        Select Case CabinClassType
            Case "0"
                Return "first"
            Case "1"
                Return "business"
            Case "2"
                Return "economy"
        End Select
    End Function
End Class
