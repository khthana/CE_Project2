Public Class itinerary
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblBookRef As System.Web.UI.WebControls.Label
    Protected WithEvents lblBookDateTime As System.Web.UI.WebControls.Label
    Protected WithEvents lblPaidTime As System.Web.UI.WebControls.Label
    Protected WithEvents lblPaidTime2 As System.Web.UI.WebControls.Label
    Protected WithEvents grdPassenger As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdFare As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblTotal As System.Web.UI.WebControls.Label
    Protected WithEvents lblCondition As System.Web.UI.WebControls.Label
    Protected WithEvents lbl6MonthsHead As System.Web.UI.WebControls.Label
    Protected WithEvents lbl6Months As System.Web.UI.WebControls.Label
    Protected WithEvents lbl1YearHead As System.Web.UI.WebControls.Label
    Protected WithEvents lbl1Year As System.Web.UI.WebControls.Label
    Protected WithEvents chkAck As System.Web.UI.WebControls.CheckBox
    Protected WithEvents btnPrint As System.Web.UI.WebControls.Button
    Protected WithEvents btnCancel As System.Web.UI.WebControls.Button
    Protected WithEvents btnPayNow As System.Web.UI.WebControls.Button
    Protected WithEvents btnChange As System.Web.UI.WebControls.Button
    Protected WithEvents grdSelected As System.Web.UI.WebControls.DataGrid

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
            FillInfo()
        End If
    End Sub

    Private Sub FillInfo()

        Dim QueryString As String = "SELECT bookdatetime FROM bookeddetails WHERE bookref='" & Session("BookRef") & "' ORDER BY bookdatetime"
        Dim PayTimeDataSet As DataSet = Airline.Query(QueryString)
        lblBookDateTime.Text = PayTimeDataSet.Tables(0).Rows(0).Item("BookDateTime")

        QueryString = "SELECT ispay FROM bookeddetails WHERE bookref='" & Session("BookRef") & "' AND isvalid='0'"
        Session("IsPay") = Airline.Query(QueryString).Tables(0).Rows(0).Item("ispay")
        If Session("IsPay") = "N" Then
            lblPaidTime.Text = CDate(PayTimeDataSet.Tables(0).Rows(0).Item("BookDateTime")).AddDays(5).ToString
            lblPaidTime2.Visible = True
        ElseIf Session("IsPay") = "Y" Then
            lblPaidTime.ForeColor = lblPaidTime.ForeColor.Red
            lblPaidTime.Text = " You already paid it."
        End If

        '+++++Show Info On grdPassenger==========
        QueryString = "SELECT * FROM member m,bookeddetails bd WHERE bd.memberid=m.memberid AND bd.isvalid='0' AND bd.bookref='" & Session("BookRef") & "'"
        Dim MemberDataSet As DataSet = Airline.Query(QueryString)
        '++++Add for column 'FullName'=======================
        MemberDataSet.Tables(0).Columns.Add(New DataColumn("FullName", GetType(String)))
        MemberDataSet.Tables(0).Rows(0).Item("FullName") = GetName(MemberDataSet.Tables(0).Rows(0).Item("FirstName"), MemberDataSet.Tables(0).Rows(0).Item("LastName"))
        grdPassenger.DataSource = MemberDataSet
        grdPassenger.DataBind()
        Session("MemberID") = MemberDataSet.Tables(0).Rows(0).Item("MemberID")

        '+++++Show Info On grdSelected==========
        QueryString = "SELECT * FROM flight f,bookedflight bf,bookeddetails bd,airport a WHERE f.flightid=bf.flightid AND bd.bookref=bf.bookref AND bd.isvalid='0' AND bf.isvalid='0' AND a.airportcode=f.dept_airport AND bf.bookref='" & Session("BookRef") & "'ORDER BY flightsequence"
        Dim SelectedDataSet As DataSet
        SelectedDataSet = Airline.Query(QueryString)

        Dim Adult As String = SelectedDataSet.Tables(0).Rows(0).Item("Adult")
        Dim Child As String = SelectedDataSet.Tables(0).Rows(0).Item("Child")
        Dim CabinOne As String = "null"
        Dim CabinReturn As String = "null"
        Dim WebFareOne As String = "null"
        Dim WebFareReturn As String = "null"

        'Add column schema for grdSeleted
        '++++for column 'Leg'=======================
        SelectedDataSet.Tables(0).Columns.Add(New DataColumn("Leg", GetType(String)))
        '++++for column 'Class'=======================
        SelectedDataSet.Tables(0).Columns.Add(New DataColumn("Cabin", GetType(String)))
        '++++for column 'Fare*'=======================
        SelectedDataSet.Tables(0).Columns.Add(New DataColumn("Fare", GetType(String)))
        '++++for column 'Valid'=======================
        SelectedDataSet.Tables(0).Columns.Add(New DataColumn("WebFare", GetType(String)))

        Dim i As Integer
        For i = 0 To SelectedDataSet.Tables(0).Rows.Count - 1
            Dim A_Economy As String = SelectedDataSet.Tables(0).Rows(i).Item("A_Economy")
            Dim A_Business As String = SelectedDataSet.Tables(0).Rows(i).Item("A_Business")
            Dim A_First As String = SelectedDataSet.Tables(0).Rows(i).Item("A_First")
            Dim Cabin As String = SelectedDataSet.Tables(0).Rows(i).Item("CabinClassType")
            Dim WebFare As String = SelectedDataSet.Tables(0).Rows(i).Item("WebFareType")
            Dim IsReturn As String = SelectedDataSet.Tables(0).Rows(i).Item("IsReturn")
            '++++Fill value==========================================
            If IsReturn = "N" Then
                SelectedDataSet.Tables(0).Rows(i).Item("Leg") = "Out Bound"
                CabinOne = SelectedDataSet.Tables(0).Rows(i).Item("CabinClassType")
                WebFareOne = SelectedDataSet.Tables(0).Rows(i).Item("WebFareType")
            Else
                SelectedDataSet.Tables(0).Rows(i).Item("Leg") = "Return"
                CabinReturn = SelectedDataSet.Tables(0).Rows(i).Item("CabinClassType")
                WebFareReturn = SelectedDataSet.Tables(0).Rows(i).Item("WebFareType")
            End If
            SelectedDataSet.Tables(0).Rows(i).Item("Cabin") = Airline.GetCabin(Cabin)
            SelectedDataSet.Tables(0).Rows(i).Item("Fare") = Airline.GetFare(A_Economy, A_Business, A_First, Cabin)
            SelectedDataSet.Tables(0).Rows(i).Item("WebFare") = Airline.GetWebFare(WebFare)
        Next

        '+++++Show Info On grdSelected==========
        grdSelected.DataSource = SelectedDataSet
        grdSelected.DataBind()

        SelectedDataSet = Airline.ShowFare(SelectedDataSet, Adult, Child, CabinOne, WebFareOne, CabinReturn, WebFareReturn)
        '+++++Show Info On grdFare==========
        grdFare.DataSource = SelectedDataSet
        grdFare.DataBind()

        '++++if it's OneWay trip=========================
        If (CabinReturn = "null") Or (WebFareReturn = "null") Then
            '++++Fill info===============================
            lblCondition.Text = "Ticket is valid for " & Airline.GetWebFare(WebFareOne) & " from the first flight date."
            If WebFareOne = "0" Then
                lbl6MonthsHead.Visible = True
                lbl6Months.Visible = True
            End If
            If WebFareOne = "1" Then
                lbl1YearHead.Visible = True
                lbl1Year.Visible = True
            End If
        Else
            '++++Fill info===============================
            lblCondition.Text = "Ticket is valid for " & Airline.GetWebFare(WebFareOne) & " (Departure) and " & Airline.GetWebFare(WebFareReturn) & " (Return) from the first flight date."
            If (WebFareOne = "0") Or (WebFareReturn = "0") Then
                lbl6MonthsHead.Visible = True
                lbl6Months.Visible = True
            End If
            If (WebFareOne = "1") Or (WebFareReturn = "1") Then
                lbl1YearHead.Visible = True
                lbl1Year.Visible = True
            End If
        End If

        Session("AllTotal") = SelectedDataSet.Tables(0).Rows(0).Item("AllTotal")
        lblTotal.Text = "$ " & Session("AllTotal")

    End Sub

    Function GetName(ByVal FirstName As String, ByVal LastName As String) As String
        Return FirstName & " " & LastName
    End Function

    Private Sub chkAck_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles chkAck.CheckedChanged
        If chkAck.Checked = True Then
            btnPayNow.Enabled = True
        Else
            btnPayNow.Enabled = False
        End If
    End Sub

    Private Sub btnPayNow_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnPayNow.Click
        Response.Redirect("payment.aspx")
    End Sub

    Private Sub btnCancel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        Response.Redirect("confirmcancel.aspx")
    End Sub

    Private Sub btnChange_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnChange.Click

        Dim QueryString As String = "SELECT *,c1.city deptcity,c2.city arrcity FROM flight f,bookedflight bf,bookeddetails bd,city c1,city c2 WHERE f.flightid=bf.flightid AND bd.bookref=bf.bookref AND f.dept_airport=c1.aircode AND f.arr_airport=c2.aircode AND bd.isvalid='0' AND bf.isvalid='0' AND bf.bookref='" & Session("BookRef") & "'ORDER BY flightsequence"
        Dim SelectedDataSet As DataSet
        SelectedDataSet = Airline.Query(QueryString)

        Dim DeptMDY As String = "null"
        Dim ReMDY As String = "null"
        Dim CabinOne As String = "null"
        Dim WebFareOne As String = "null"
        Dim CabinReturn As String = "null"
        Dim WebFareReturn As String = "null"
        Dim Adult As Integer = SelectedDataSet.Tables(0).Rows(0).Item("Adult")
        Dim Child As Integer = SelectedDataSet.Tables(0).Rows(0).Item("Child")
        Dim From As String
        Dim Destination As String

        Dim i As Integer
        For i = 0 To SelectedDataSet.Tables(0).Rows.Count - 1
            If SelectedDataSet.Tables(0).Rows(i).Item("IsReturn") = "N" Then
                If SelectedDataSet.Tables(0).Rows(i).Item("FlightSequence") = "1" Then
                    DeptMDY = SelectedDataSet.Tables(0).Rows(i).Item("MDY")
                    CabinOne = SelectedDataSet.Tables(0).Rows(i).Item("CabinClassType")
                    WebFareOne = SelectedDataSet.Tables(0).Rows(i).Item("WebFareType")
                    '++++To find "Source"===================
                    From = SelectedDataSet.Tables(0).Rows(i).Item("deptcity")
                End If
                '++++To find "Destination"===================
                Destination = SelectedDataSet.Tables(0).Rows(i).Item("arrcity")
            Else
                If SelectedDataSet.Tables(0).Rows(i).Item("FlightSequence") = "4" Then
                    ReMDY = SelectedDataSet.Tables(0).Rows(i).Item("MDY")
                    CabinReturn = SelectedDataSet.Tables(0).Rows(i).Item("CabinClassType")
                    WebFareReturn = SelectedDataSet.Tables(0).Rows(i).Item("WebFareType")
                End If
            End If
        Next

        Response.Redirect("changeflight.aspx?DeptMDY=" & DeptMDY & _
                                            "&ReMDY=" & ReMDY & _
                                            "&Adult=" & Adult & _
                                            "&Child=" & Child & _
                                            "&From=" & From & _
                                            "&To=" & Destination & _
                                            "&CabinOne=" & CabinOne & _
                                            "&WebFareOne=" & WebFareOne & _
                                            "&CabinReturn=" & CabinReturn & _
                                            "&WebFareReturn=" & WebFareReturn)
    End Sub

End Class
