Public Class searchresult
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents lblStatus As System.Web.UI.WebControls.Label
    Protected WithEvents Image2 As System.Web.UI.WebControls.Image
    Protected WithEvents lblAmont As System.Web.UI.WebControls.Label
    Protected WithEvents lblOnewayHead As System.Web.UI.WebControls.Label
    Protected WithEvents grdOneway As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblCabinOne As System.Web.UI.WebControls.Label
    Protected WithEvents radCabinOne As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents lblWebFareOne As System.Web.UI.WebControls.Label
    Protected WithEvents radWebFareOne As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents lblReturnHead As System.Web.UI.WebControls.Label
    Protected WithEvents grdReturn As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblCabinReturn As System.Web.UI.WebControls.Label
    Protected WithEvents radCabinReturn As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents lblWebFareReturn As System.Web.UI.WebControls.Label
    Protected WithEvents radWebFareReturn As System.Web.UI.WebControls.RadioButtonList
    Protected WithEvents lblFlight As System.Web.UI.WebControls.Label
    Protected WithEvents lblOneway As System.Web.UI.WebControls.Label
    Protected WithEvents lblReturnFlight As System.Web.UI.WebControls.Label
    Protected WithEvents lblReturn As System.Web.UI.WebControls.Label
    Protected WithEvents btnBack As System.Web.UI.WebControls.Button
    Protected WithEvents btnNext As System.Web.UI.WebControls.Button
    Protected WithEvents lblNotFOne2 As System.Web.UI.WebControls.Label
    Protected WithEvents lblNotFRe As System.Web.UI.WebControls.Label
    Protected WithEvents lblNotFOne As System.Web.UI.WebControls.Label
    Protected WithEvents lblNotFRe2 As System.Web.UI.WebControls.Label
    Protected WithEvents lblNotFRe3 As System.Web.UI.WebControls.Label
    Protected WithEvents lblNotFOne3 As System.Web.UI.WebControls.Label
    Protected WithEvents grdReturn3 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdReturn2 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents btnReSortCost As System.Web.UI.WebControls.Button
    Protected WithEvents btnSortCost As System.Web.UI.WebControls.Button
    Protected WithEvents grdOneway3 As System.Web.UI.WebControls.DataGrid
    Protected WithEvents grdOneway2 As System.Web.UI.WebControls.DataGrid

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
            Session("FID") = "null"
            Session("FID2") = "null"
            Session("FID3") = "null"
            Session("ReFID") = "null"
            Session("ReFID2") = "null"
            Session("ReFID3") = "null"
            FillDataGrid()
        End If
    End Sub

    Sub FillDataGrid()

        lblAmont.Text = CInt(Request("Adult")) + CInt(Request("Child")) & " person(s)"

        If Request("IsRound") = "0" Then
            lblFlight.Visible = True
        Else
            lblFlight.Visible = True
            lblReturnFlight.Visible = True
        End If

        '+++++Show Oneway Datagrid ***alway selected++++++++++++++++++++++++++++++++++++++++++
        lblOnewayHead.Text = "From " & Request("From") & " To " & Request("To") & ", On " & Request("DeptMDY")
        lblOnewayHead.Visible = True

        '++++If choose non-stop==========
        If Request("NonStop") = True Then
            '++++Searching SQL==========================
            Dim QueryString As String = "SELECT *,SUBSTR(fl.flightid,1,2) al FROM flight fl,available av,city c1,city c2 WHERE fl.flightid=av.flightid AND fl.dept_airport=c1.aircode AND fl.arr_airport=c2.aircode AND c1.city='" & Request("From") & "' AND c2.city='" & Request("To") & "' AND av.mdy='" & Request("DeptMDY") & "'"

            Dim ScheduleDataSet As New DataSet
            ScheduleDataSet = Airline.Query(QueryString)

            If ScheduleDataSet.Tables(0).Rows.Count <> 0 Then
                '++++Use DataView to filter or Sort something=========
                Dim ScheduleDataView As New DataView
                ScheduleDataView = ScheduleDataSet.Tables(0).DefaultView
                If Request("CabinOne") = "null" Then
                    '++++Sort by AllDuration=========
                    ScheduleDataView.Sort = "Duration"
                ElseIf Request("CabinOne") = "0" Then
                    '++++Sort by AllFirstCost=========
                    ScheduleDataView.Sort = "A_FIRST"
                ElseIf Request("CabinOne") = "1" Then
                    '++++Sort by AllBusinessCost=========
                    ScheduleDataView.Sort = "A_BUSINESS"
                ElseIf Request("CabinOne") = "2" Then
                    '++++Sort by AllEconomyCost=========
                    ScheduleDataView.Sort = "A_ECONOMY"
                End If

                If Request("NotAirline") <> "null" Then
                    ScheduleDataView.RowFilter = "al<>'" & Request("NotAirline") & "'"
                End If

                grdOneway.DataSource = ScheduleDataView
                grdOneway.DataBind()
                grdOneway.Visible = True
                radCabinOne.Visible = True
                radWebFareOne.Visible = True
                lblCabinOne.Visible = True
                lblWebFareOne.Visible = True
                btnSortCost.Visible = True
                btnNext.Enabled = True
            Else
                lblNotFOne.Text = "Flight not available from " & Request("From") & " to " & Request("To") & " on " & Request("DeptMDY") & " in non-stop."
                lblNotFOne.Visible = True
            End If
            '====End of Show Oneway Datagrid ***alway selected==============================

            '+++++Show Return Datagrid ***if selected***++++++++++++++++++++++++++++++++++++++++++
            If Request("IsRound") = 1 Then
                lblReturnHead.Text = " From " & Request("To") & " To " & Request("From") & ", On " & Request("ReMDY")
                lblReturnHead.Visible = True

                '++++Searching SQL==========================
                QueryString = "SELECT *,SUBSTR(fl.flightid,1,2) al FROM flight fl,available av,city c1,city c2 WHERE fl.flightid=av.flightid AND fl.dept_airport=c1.aircode AND fl.arr_airport=c2.aircode AND c1.city='" & Request("To") & "' AND c2.city='" & Request("From") & "' AND av.mdy='" & Request("ReMDY") & "'"
                Dim ReScheduleDataSet As DataSet = Airline.Query(QueryString)

                If ReScheduleDataSet.Tables(0).Rows.Count <> 0 Then
                    '++++Use DataView to filter or Sort something=========
                    Dim ReScheduleDataView As New DataView
                    ReScheduleDataView = ReScheduleDataSet.Tables(0).DefaultView
                    If Request("CabinOne") = "null" Then
                        '++++Sort by AllDuration=========
                        ReScheduleDataView.Sort = "Duration"
                    ElseIf Request("CabinOne") = "0" Then
                        '++++Sort by AllFirstCost=========
                        ReScheduleDataView.Sort = "A_FIRST"
                    ElseIf Request("CabinOne") = "1" Then
                        '++++Sort by AllBusinessCost=========
                        ReScheduleDataView.Sort = "A_BUSINESS"
                    ElseIf Request("CabinOne") = "2" Then
                        '++++Sort by AllEconomyCost=========
                        ReScheduleDataView.Sort = "A_ECONOMY"
                    End If

                    If Request("NotAirline") <> "null" Then
                        ReScheduleDataView.RowFilter = "al<>'" & Request("NotAirline") & "'"
                    End If

                    grdReturn.DataSource = ReScheduleDataView
                    grdReturn.DataBind()
                    grdReturn.Visible = True
                    radCabinReturn.Visible = True
                    radWebFareReturn.Visible = True
                    lblCabinReturn.Visible = True
                    lblWebFareReturn.Visible = True
                    btnReSortCost.Visible = True
                    btnNext.Enabled = True
                Else
                    lblNotFRe.Text = "Flight not available from " & Request("To") & " to " & Request("From") & " on " & Request("ReMDY") & " in non-stop."
                    lblNotFRe.Visible = True

                End If
            End If
            '====End of Show Return Datagrid ***if selected***==============================
        End If

        '++++If choose 1-stop==========
        If Request("1Stop") = True Then
            Dim Gapless As Integer = CInt(Request("Gapless"))
            Dim Gapmost As Integer = CInt(Request("Gapmost"))

            '+++++Show Oneway2 Datagrid ***alway selected++++++++++++++++++++++++++++++++++++++++++
            '++++Searching SQL==========================
            Dim QueryString As String = "SELECT DISTINCT fl1.flightid flight1,fl2.flightid flight2,fl1.dept_airport airport1,fl1.dept_time depttime1,fl1.arr_time arrtime1,fl1.arr_airport airport2,fl2.dept_time depttime2,fl2.arr_time arrtime2,fl2.arr_airport airport3,av1.mdy day1,av2.mdy day2,fl1.isnextday isnext1,fl1.duration duration1,fl2.duration duration2,fl1.a_first firstcost1,fl1.a_business businesscost1,fl1.a_economy economycost1,fl2.a_first firstcost2,fl2.a_business businesscost2,fl2.a_economy economycost2,SUBSTR(fl1.flightid,1,2) al1,SUBSTR(fl2.flightid,1,2) al2 FROM flight fl1,flight fl2,available av1,available av2,city c1,city c2 WHERE fl1.flightid=av1.flightid AND fl2.flightid=av2.flightid AND fl1.dept_airport=c1.aircode AND fl2.arr_airport=c2.aircode AND c1.city='" & Request("From") & "' AND c2.city='" & Request("To") & "' AND fl1.arr_airport=fl2.dept_airport AND c2.city NOT IN ('" & Request("From") & "') AND av1.mdy='" & Request("DeptMDY") & "' AND av2.mdy='" & Request("DeptMDY") & "'"
            Dim SearchedDataSet As DataSet = Airline.Query(QueryString)

            '++++Add column "Leg"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("Leg", GetType(String)))
            '++++Add column "Duration"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllDuration", GetType(Integer)))
            '++++Add column "AllFirstCost"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllFirstCost", GetType(Integer)))
            '++++Add column "AllBusinessCost"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllBusinessCost", GetType(Integer)))
            '++++Add column "AllEconomyCost"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllEconomyCost", GetType(Integer)))

            Dim ShowDataSet As New DataSet
            ShowDataSet = SearchedDataSet.Clone()

            Dim i As Integer
            For i = 0 To SearchedDataSet.Tables(0).Rows.Count - 1
                Dim ShowRow As DataRow = SearchedDataSet.Tables(0).Rows(i)
                Dim ArrDate1 As Date = ShowRow.Item("day1") & " " & ShowRow.Item("arrtime1")
                Dim DeptDate2 As Date = ShowRow.Item("day2") & " " & ShowRow.Item("depttime2")
                '++++Fill value==================
                ShowRow.Item("Leg") = "Out Bound"

                '++++If it's pass a day=====
                If ArrDate1 > DeptDate2 Then
                    '++++AddDays(1) to dept2 before calc================
                    If (Date.Compare(ArrDate1.AddMinutes(Gapless), DeptDate2.AddDays(1)) <> 1) And (Date.Compare(ArrDate1, DeptDate2.AddMinutes(Gapmost + 1440)) <> -1) Then
                        Select Case ShowRow.Item("IsNext1")
                            Case "0"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = Request("DeptMDY")
                                NextDay = NextDay.AddDays(1)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight2") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(1) to dept2==========
                                    ShowRow.Item("day2") = DeptDate2.AddDays(1).ToShortDateString
                                    ShowDataSet.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "1"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = Request("DeptMDY")
                                NextDay = NextDay.AddDays(2)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight2") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(1) to dept2==========
                                    ShowRow.Item("day2") = DeptDate2.AddDays(2).ToShortDateString
                                    ShowDataSet.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "2"
                            Case Else
                        End Select
                    End If
                Else
                    If (Date.Compare(ArrDate1.AddMinutes(Gapless), DeptDate2) <> 1) And (Date.Compare(ArrDate1, DeptDate2.AddMinutes(Gapmost)) <> -1) Then
                        Select Case ShowRow.Item("IsNext1")
                            Case "0"
                                ShowDataSet.Tables(0).ImportRow(ShowRow)
                            Case "1"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = Request("DeptMDY")
                                NextDay = NextDay.AddDays(1)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight2") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(1) to dept2==========
                                    ShowRow.Item("day2") = DeptDate2.AddDays(1).ToShortDateString
                                    ShowDataSet.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "2"
                            Case Else
                        End Select
                    End If
                End If
            Next

            If ShowDataSet.Tables(0).Rows.Count <> 0 Then
                For i = 0 To ShowDataSet.Tables(0).Rows.Count - 1
                    ShowDataSet.Tables(0).Rows(i).Item("AllDuration") = CInt(ShowDataSet.Tables(0).Rows(i).Item("Duration1")) + CInt(ShowDataSet.Tables(0).Rows(i).Item("Duration2"))
                    ShowDataSet.Tables(0).Rows(i).Item("AllFirstCost") = CInt(ShowDataSet.Tables(0).Rows(i).Item("FirstCost1")) + CInt(ShowDataSet.Tables(0).Rows(i).Item("FirstCost2"))
                    ShowDataSet.Tables(0).Rows(i).Item("AllBusinessCost") = CInt(ShowDataSet.Tables(0).Rows(i).Item("BusinessCost1")) + CInt(ShowDataSet.Tables(0).Rows(i).Item("BusinessCost2"))
                    ShowDataSet.Tables(0).Rows(i).Item("AllEconomyCost") = CInt(ShowDataSet.Tables(0).Rows(i).Item("EconomyCost1")) + CInt(ShowDataSet.Tables(0).Rows(i).Item("EconomyCost2"))
                Next
                '++++Use DataView to filter or Sort something=========
                Dim ShowDataView As New DataView
                ShowDataView = ShowDataSet.Tables(0).DefaultView
                If Request("CabinOne") = "null" Then
                    '++++Sort by AllDuration=========
                    ShowDataView.Sort = "AllDuration"
                ElseIf Request("CabinOne") = "0" Then
                    '++++Sort by AllFirstCost=========
                    ShowDataView.Sort = "AllFirstCost"
                ElseIf Request("CabinOne") = "1" Then
                    '++++Sort by AllBusinessCost=========
                    ShowDataView.Sort = "AllBusinessCost"
                ElseIf Request("CabinOne") = "2" Then
                    '++++Sort by AllEconomyCost=========
                    ShowDataView.Sort = "AllEconomyCost"
                End If

                If Request("NotAirline") <> "null" Then
                    ShowDataView.RowFilter = "al1<>'" & Request("NotAirline") & "' AND al2<>'" & Request("NotAirline") & "'"
                End If

                grdOneway2.DataSource = ShowDataView
                grdOneway2.DataBind()

                grdOneway2.Visible = True
                radCabinOne.Visible = True
                radWebFareOne.Visible = True
                lblCabinOne.Visible = True
                lblWebFareOne.Visible = True
                btnSortCost.Visible = True
                btnNext.Enabled = True
            Else
                lblNotFOne2.Text = "Flight not available from " & Request("From") & " to " & Request("To") & " on " & Request("DeptMDY") & " in 1-Stop."
                lblNotFOne2.Visible = True
            End If
            '====End of Show Oneway2 Datagrid ***alway selected==============================

            '+++++Show Return Datagrid ***if selected***++++++++++++++++++++++++++++++++++++++++++
            If Request("IsRound") = 1 Then
                lblReturnHead.Text = " From " & Request("To") & " To " & Request("From") & ", On " & Request("ReMDY")
                lblReturnHead.Visible = True

                Dim ReGapless As Integer = CInt(Request("Gapless"))
                Dim ReGapmost As Integer = CInt(Request("Gapmost"))

                '+++++Show Return2 Datagrid ***if selected++++++++++++++++++++++++++++++++++++++++++
                '++++Searching SQL==========================
                QueryString = "SELECT DISTINCT fl1.flightid flight1,fl2.flightid flight2,fl1.dept_airport airport1,fl1.dept_time depttime1,fl1.arr_time arrtime1,fl1.arr_airport airport2,fl2.dept_time depttime2,fl2.arr_time arrtime2,fl2.arr_airport airport3,av1.mdy day1,av2.mdy day2,fl1.isnextday isnext1,fl1.duration duration1,fl2.duration duration2,fl1.a_first firstcost1,fl1.a_business businesscost1,fl1.a_economy economycost1,fl2.a_first firstcost2,fl2.a_business businesscost2,fl2.a_economy economycost2,SUBSTR(fl1.flightid,1,2) al1,SUBSTR(fl2.flightid,1,2) al2  FROM flight fl1,flight fl2,available av1,available av2,city c1,city c2 WHERE fl1.flightid=av1.flightid AND fl2.flightid=av2.flightid AND fl1.dept_airport=c1.aircode AND fl2.arr_airport=c2.aircode AND c1.city='" & Request("To") & "' AND c2.city='" & Request("From") & "' AND c2.city NOT IN ('" & Request("To") & "') AND fl1.arr_airport=fl2.dept_airport AND av1.mdy='" & Request("ReMDY") & "' AND av2.mdy='" & Request("ReMDY") & "'"
                Dim ReSearchedDataSet As DataSet = Airline.Query(QueryString)

                '++++Add column "Leg"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("Leg", GetType(String)))
                '++++Add column "Duration"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllDuration", GetType(Integer)))
                '++++Add column "AllFirstCost"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllFirstCost", GetType(Integer)))
                '++++Add column "AllBusinessCost"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllBusinessCost", GetType(Integer)))
                '++++Add column "AllEconomyCost"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllEconomyCost", GetType(Integer)))

                Dim ReShowDataSet As New DataSet
                ReShowDataSet = ReSearchedDataSet.Clone()

                For i = 0 To ReSearchedDataSet.Tables(0).Rows.Count - 1
                    Dim ReShowRow As DataRow = ReSearchedDataSet.Tables(0).Rows(i)
                    Dim ArrDate1 As Date = ReShowRow.Item("day1") & " " & ReShowRow.Item("arrtime1")
                    Dim DeptDate2 As Date = ReShowRow.Item("day2") & " " & ReShowRow.Item("depttime2")
                    '++++Fill value==================
                    ReShowRow.Item("Leg") = "Return"

                    '++++If it's pass a day=====
                    If ArrDate1 > DeptDate2 Then
                        '++++AddDays(1) to dept2 before calc================
                        If (Date.Compare(ArrDate1.AddMinutes(Gapless), DeptDate2.AddDays(1)) <> 1) And (Date.Compare(ArrDate1, DeptDate2.AddMinutes(Gapmost + 1440)) <> -1) Then
                            Select Case ReShowRow.Item("IsNext1")
                                Case "0"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = Request("ReMDY")
                                    NextDay = NextDay.AddDays(1)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight2") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(1) to dept2==========
                                        ReShowRow.Item("day2") = DeptDate2.AddDays(1).ToShortDateString
                                        ReShowDataSet.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "1"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = Request("ReMDY")
                                    NextDay = NextDay.AddDays(2)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight2") & "' AND av.mdy='" & Request("ReMDY") & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(1) to dept2==========
                                        ReShowRow.Item("day2") = DeptDate2.AddDays(2).ToShortDateString
                                        ReShowDataSet.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "2"
                                Case Else
                            End Select
                        End If
                    Else
                        If (Date.Compare(ArrDate1.AddMinutes(Gapless), DeptDate2) <> 1) And (Date.Compare(ArrDate1, DeptDate2.AddMinutes(Gapmost)) <> -1) Then
                            Select Case ReShowRow.Item("IsNext1")
                                Case "0"
                                    ReShowDataSet.Tables(0).ImportRow(ReShowRow)
                                Case "1"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = Request("ReMDY")
                                    NextDay = NextDay.AddDays(1)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight2") & "' AND av.mdy='" & Request("ReMDY") & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(1) to dept2==========
                                        ReShowRow.Item("day2") = DeptDate2.AddDays(1).ToShortDateString
                                        ReShowDataSet.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "2"
                                Case Else
                            End Select
                        End If
                    End If
                Next

                If ReShowDataSet.Tables(0).Rows.Count <> 0 Then
                    For i = 0 To ReShowDataSet.Tables(0).Rows.Count - 1
                        ReShowDataSet.Tables(0).Rows(i).Item("AllDuration") = CInt(ReShowDataSet.Tables(0).Rows(i).Item("Duration1")) + CInt(ReShowDataSet.Tables(0).Rows(i).Item("Duration2"))
                        ReShowDataSet.Tables(0).Rows(i).Item("AllFirstCost") = CInt(ReShowDataSet.Tables(0).Rows(i).Item("FirstCost1")) + CInt(ReShowDataSet.Tables(0).Rows(i).Item("FirstCost2"))
                        ReShowDataSet.Tables(0).Rows(i).Item("AllBusinessCost") = CInt(ReShowDataSet.Tables(0).Rows(i).Item("BusinessCost1")) + CInt(ReShowDataSet.Tables(0).Rows(i).Item("BusinessCost2"))
                        ReShowDataSet.Tables(0).Rows(i).Item("AllEconomyCost") = CInt(ReShowDataSet.Tables(0).Rows(i).Item("EconomyCost1")) + CInt(ReShowDataSet.Tables(0).Rows(i).Item("EconomyCost2"))
                    Next
                    '++++Use DataView to filter or Sort something=========
                    Dim ReShowDataView As New DataView
                    ReShowDataView = ReShowDataSet.Tables(0).DefaultView
                    If Request("CabinOne") = "null" Then
                        '++++Sort by AllDuration=========
                        ReShowDataView.Sort = "AllDuration"
                    ElseIf Request("CabinOne") = "0" Then
                        '++++Sort by AllFirstCost=========
                        ReShowDataView.Sort = "AllFirstCost"
                    ElseIf Request("CabinOne") = "1" Then
                        '++++Sort by AllBusinessCost=========
                        ReShowDataView.Sort = "AllBusinessCost"
                    ElseIf Request("CabinOne") = "2" Then
                        '++++Sort by AllEconomyCost=========
                        ReShowDataView.Sort = "AllEconomyCost"
                    End If

                    If Request("NotAirline") <> "null" Then
                        ReShowDataView.RowFilter = "al1<>'" & Request("NotAirline") & "' AND al2<>'" & Request("NotAirline") & "'"
                    End If
                    grdReturn2.DataSource = ReShowDataView
                    grdReturn2.DataBind()
                    grdReturn2.Visible = True
                    radCabinReturn.Visible = True
                    radWebFareReturn.Visible = True
                    lblCabinReturn.Visible = True
                    lblWebFareReturn.Visible = True
                    btnReSortCost.Visible = True
                    btnNext.Enabled = True
                Else
                    lblNotFRe2.Text = "Flight not available from " & Request("To") & " to " & Request("From") & " on " & Request("ReMDY") & " in 1-Stop."
                    lblNotFRe2.Visible = True
                End If
            End If

        End If

        '++++If choose 2-stop==========
        '++++***Check first hop===========
        If Request("2Stop") = True Then
            Dim Gapless As Integer = CInt(Request("Gapless"))
            Dim Gapmost As Integer = CInt(Request("Gapmost"))

            '+++++Show Oneway3 Datagrid ***alway selected++++++++++++++++++++++++++++++++++++++++++
            '++++Searching SQL==========================
            Dim QueryString As String = "SELECT DISTINCT fl1.flightid flight1,fl2.flightid flight2,fl3.flightid flight3,fl1.dept_airport airport1,fl1.dept_time depttime1,fl1.arr_time arrtime1,fl1.arr_airport airport2,fl2.dept_time depttime2,fl2.arr_time arrtime2,fl2.arr_airport airport3,fl3.dept_time depttime3,fl3.arr_time arrtime3,fl3.arr_airport airport4,av1.mdy day1,av2.mdy day2,av3.mdy day3,fl1.isnextday isnext1,fl2.isnextday isnext2,fl1.duration duration1,fl2.duration duration2,fl3.duration duration3,fl1.a_first firstcost1,fl1.a_business businesscost1,fl1.a_economy economycost1,fl2.a_first firstcost2,fl2.a_business businesscost2,fl2.a_economy economycost2,fl3.a_first firstcost3,fl3.a_business businesscost3,fl3.a_economy economycost3, SUBSTR(fl1.flightid,1,2) al1,SUBSTR(fl2.flightid,1,2) al2,SUBSTR(fl3.flightid,1,2) al3 FROM flight fl1,flight fl2,flight fl3,available av1,available av2,available av3,city c1,city c2 WHERE fl1.flightid=av1.flightid AND fl2.flightid=av2.flightid AND fl3.flightid=av3.flightid AND fl1.dept_airport=c1.aircode AND fl3.arr_airport=c2.aircode AND c1.city='" & Request("From") & "' AND c2.city='" & Request("To") & "' AND fl1.arr_airport=fl2.dept_airport AND fl2.arr_airport=fl3.dept_airport AND c2.city <> '" & Request("From") & "' AND fl1.arr_airport <> fl3.arr_airport AND fl2.arr_airport <> fl1.dept_airport AND av1.mdy='" & Request("DeptMDY") & "' AND av2.mdy='" & Request("DeptMDY") & "' AND av3.mdy='" & Request("DeptMDY") & "'"
            Dim SearchedDataSet As DataSet = Airline.Query(QueryString)

            '++++Add column "Leg"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("Leg", GetType(String)))
            '++++Add column "Duration"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllDuration", GetType(Integer)))
            '++++Add column "AllFirstCost"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllFirstCost", GetType(Integer)))
            '++++Add column "AllBusinessCost"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllBusinessCost", GetType(Integer)))
            '++++Add column "AllEconomyCost"================
            SearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllEconomyCost", GetType(Integer)))

            Dim ShowDataSet As New DataSet
            ShowDataSet = SearchedDataSet.Clone()

            Dim i As Integer
            For i = 0 To SearchedDataSet.Tables(0).Rows.Count - 1
                Dim ShowRow As DataRow = SearchedDataSet.Tables(0).Rows(i)
                Dim ArrDate1 As Date = ShowRow.Item("day1") & " " & ShowRow.Item("arrtime1")
                Dim DeptDate2 As Date = ShowRow.Item("day2") & " " & ShowRow.Item("depttime2")
                '++++Fill value==================
                ShowRow.Item("Leg") = "Out Bound"

                '++++If it's pass a day=====
                If ArrDate1 > DeptDate2 Then
                    '++++AddDays(1) to dept2 before calc================
                    If (Date.Compare(ArrDate1.AddMinutes(Gapless), DeptDate2.AddDays(1)) <> 1) And (Date.Compare(ArrDate1, DeptDate2.AddMinutes(Gapmost + 1440)) <> -1) Then
                        Select Case ShowRow.Item("IsNext1")
                            Case "0"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = Request("DeptMDY")
                                NextDay = NextDay.AddDays(1)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight2") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(1) to dept2==========
                                    ShowRow.Item("day2") = DeptDate2.AddDays(1).ToShortDateString
                                    ShowDataSet.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "1"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = Request("DeptMDY")
                                NextDay = NextDay.AddDays(2)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight2") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(2) to dept2==========
                                    ShowRow.Item("day2") = DeptDate2.AddDays(2).ToShortDateString
                                    ShowDataSet.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "2"
                            Case Else
                        End Select
                    End If
                Else
                    If (Date.Compare(ArrDate1.AddMinutes(Gapless), DeptDate2) <> 1) And (Date.Compare(ArrDate1, DeptDate2.AddMinutes(Gapmost)) <> -1) Then
                        Select Case ShowRow.Item("IsNext1")
                            Case "0"
                                ShowDataSet.Tables(0).ImportRow(ShowRow)
                            Case "1"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = Request("DeptMDY")
                                NextDay = NextDay.AddDays(1)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight2") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(1) to dept2==========
                                    ShowRow.Item("day2") = DeptDate2.AddDays(1).ToShortDateString
                                    ShowDataSet.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "2"
                            Case Else
                        End Select
                    End If
                End If
            Next
            '++++Complete in first hop ....then let's do again in second hop=========
            Dim ShowDataSet2 As New DataSet
            ShowDataSet2 = ShowDataSet.Clone()

            For i = 0 To ShowDataSet.Tables(0).Rows.Count - 1
                Dim ShowRow As DataRow = ShowDataSet.Tables(0).Rows(i)
                '++++Made it easy and correct to compare====
                ShowRow.Item("day3") = ShowRow.Item("day2")

                Dim ArrDate2 As Date = ShowRow.Item("day2") & " " & ShowRow.Item("arrtime2")
                Dim DeptDate3 As Date = ShowRow.Item("day3") & " " & ShowRow.Item("depttime3")

                '++++If it's pass a day=====
                If ArrDate2 > DeptDate3 Then
                    '++++AddDays(1) to dept2 before calc================
                    If (Date.Compare(ArrDate2.AddMinutes(Gapless), DeptDate3.AddDays(1)) <> 1) And (Date.Compare(ArrDate2, DeptDate3.AddMinutes(Gapmost + 1440)) <> -1) Then
                        Select Case ShowRow.Item("IsNext2")
                            Case "0"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = ShowRow.Item("day2")
                                NextDay = NextDay.AddDays(1)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight3") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(1) to dept2==========
                                    ShowRow.Item("day3") = DeptDate3.AddDays(1).ToShortDateString
                                    ShowDataSet2.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "1"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = ShowRow.Item("day2")
                                NextDay = NextDay.AddDays(2)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight3") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(2) to dept2==========
                                    ShowRow.Item("day3") = DeptDate3.AddDays(2).ToShortDateString
                                    ShowDataSet2.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "2"
                            Case Else
                        End Select
                    End If
                Else
                    If (Date.Compare(ArrDate2.AddMinutes(Gapless), DeptDate3) <> 1) And (Date.Compare(ArrDate2, DeptDate3.AddMinutes(Gapmost)) <> -1) Then
                        Select Case ShowRow.Item("IsNext2")
                            Case "0"
                                ShowDataSet2.Tables(0).ImportRow(ShowRow)
                            Case "1"
                                '++++Check is next day on second flight valid???================
                                Dim NextDay As Date = ShowRow.Item("day2")
                                NextDay = NextDay.AddDays(1)
                                QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ShowRow.Item("flight3") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                    '++++AddDays(1) to dept2==========
                                    ShowRow.Item("day3") = DeptDate3.AddDays(1).ToShortDateString
                                    ShowDataSet2.Tables(0).ImportRow(ShowRow)
                                End If
                            Case "2"
                            Case Else
                        End Select
                    End If
                End If
            Next

            If ShowDataSet2.Tables(0).Rows.Count <> 0 Then
                For i = 0 To ShowDataSet2.Tables(0).Rows.Count - 1
                    ShowDataSet2.Tables(0).Rows(i).Item("AllDuration") = CInt(ShowDataSet2.Tables(0).Rows(i).Item("Duration1")) + CInt(ShowDataSet2.Tables(0).Rows(i).Item("Duration2")) + CInt(ShowDataSet2.Tables(0).Rows(i).Item("Duration3"))
                    ShowDataSet2.Tables(0).Rows(i).Item("AllFirstCost") = CInt(ShowDataSet2.Tables(0).Rows(i).Item("FirstCost1")) + CInt(ShowDataSet2.Tables(0).Rows(i).Item("FirstCost2")) + CInt(ShowDataSet2.Tables(0).Rows(i).Item("FirstCost3"))
                    ShowDataSet2.Tables(0).Rows(i).Item("AllBusinessCost") = CInt(ShowDataSet2.Tables(0).Rows(i).Item("BusinessCost1")) + CInt(ShowDataSet2.Tables(0).Rows(i).Item("BusinessCost2")) + CInt(ShowDataSet2.Tables(0).Rows(i).Item("BusinessCost3"))
                    ShowDataSet2.Tables(0).Rows(i).Item("AllEconomyCost") = CInt(ShowDataSet2.Tables(0).Rows(i).Item("EconomyCost1")) + CInt(ShowDataSet2.Tables(0).Rows(i).Item("EconomyCost2")) + CInt(ShowDataSet2.Tables(0).Rows(i).Item("EconomyCost3"))
                Next
                '++++Use DataView to filter or Sort something=========
                Dim ShowDataView2 As New DataView
                ShowDataView2 = ShowDataSet2.Tables(0).DefaultView
                If Request("CabinOne") = "null" Then
                    '++++Sort by AllDuration=========
                    ShowDataView2.Sort = "AllDuration"
                ElseIf Request("CabinOne") = "0" Then
                    '++++Sort by AllFirstCost=========
                    ShowDataView2.Sort = "AllFirstCost"
                ElseIf Request("CabinOne") = "1" Then
                    '++++Sort by AllBusinessCost=========
                    ShowDataView2.Sort = "AllBusinessCost"
                ElseIf Request("CabinOne") = "2" Then
                    '++++Sort by AllEconomyCost=========
                    ShowDataView2.Sort = "AllEconomyCost"
                End If

                If Request("NotAirline") <> "null" Then
                    ShowDataView2.RowFilter = "al1<>'" & Request("NotAirline") & "' AND al2<>'" & Request("NotAirline") & "' AND al3<>'" & Request("NotAirline") & "'"
                End If

                grdOneway3.DataSource = ShowDataView2
                grdOneway3.DataBind()

                grdOneway3.Visible = True
                radCabinOne.Visible = True
                radWebFareOne.Visible = True
                lblCabinOne.Visible = True
                lblWebFareOne.Visible = True
                btnSortCost.Visible = True
                btnNext.Enabled = True
            Else
                lblNotFOne3.Text = "Flight not available from " & Request("From") & " to " & Request("To") & " on " & Request("DeptMDY") & " in 2-Stop."
                lblNotFOne3.Visible = True
            End If

            '====End of Show Oneway2 Datagrid ***alway selected==============================

            '+++++Show Return Datagrid ***if selected***++++++++++++++++++++++++++++++++++++++++++
            If Request("IsRound") = 1 Then
                lblReturnHead.Text = " From " & Request("To") & " To " & Request("From") & ", On " & Request("ReMDY")
                lblReturnHead.Visible = True

                Dim ReGapless As Integer = CInt(Request("Gapless"))
                Dim ReGapmost As Integer = CInt(Request("Gapmost"))

                '+++++Show Return3 Datagrid ***if selected++++++++++++++++++++++++++++++++++++++++++
                '++++Searching SQL==========================
                QueryString = "SELECT DISTINCT fl1.flightid flight1,fl2.flightid flight2,fl3.flightid flight3,fl1.dept_airport airport1,fl1.dept_time depttime1,fl1.arr_time arrtime1,fl1.arr_airport airport2,fl2.dept_time depttime2,fl2.arr_time arrtime2,fl2.arr_airport airport3,fl3.dept_time depttime3,fl3.arr_time arrtime3,fl3.arr_airport airport4,av1.mdy day1,av2.mdy day2,av3.mdy day3,fl1.isnextday isnext1,fl2.isnextday isnext2,fl1.duration duration1,fl2.duration duration2,fl3.duration duration3,fl1.a_first firstcost1,fl1.a_business businesscost1,fl1.a_economy economycost1,fl2.a_first firstcost2,fl2.a_business businesscost2,fl2.a_economy economycost2,fl3.a_first firstcost3,fl3.a_business businesscost3,fl3.a_economy economycost3,SUBSTR(fl1.flightid,1,2) al1,SUBSTR(fl2.flightid,1,2) al2,SUBSTR(fl3.flightid,1,2) al3 FROM flight fl1,flight fl2,flight fl3,available av1,available av2,available av3,city c1,city c2 WHERE fl1.flightid=av1.flightid AND fl2.flightid=av2.flightid AND fl3.flightid=av3.flightid AND fl1.dept_airport=c1.aircode AND fl3.arr_airport=c2.aircode AND c1.city='" & Request("To") & "' AND c2.city='" & Request("From") & "' AND fl1.arr_airport=fl2.dept_airport AND fl2.arr_airport=fl3.dept_airport AND c2.city <> '" & Request("To") & "' AND fl1.arr_airport <> fl3.arr_airport AND fl2.arr_airport <> fl1.dept_airport AND av1.mdy='" & Request("ReMDY") & "' AND av2.mdy='" & Request("ReMDY") & "' AND av3.mdy='" & Request("ReMDY") & "'"
                Dim ReSearchedDataSet As DataSet = Airline.Query(QueryString)

                '++++Add column "Leg"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("Leg", GetType(String)))
                '++++Add column "Duration"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllDuration", GetType(Integer)))
                '++++Add column "AllFirstCost"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllFirstCost", GetType(Integer)))
                '++++Add column "AllBusinessCost"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllBusinessCost", GetType(Integer)))
                '++++Add column "AllEconomyCost"================
                ReSearchedDataSet.Tables(0).Columns.Add(New DataColumn("AllEconomyCost", GetType(Integer)))

                Dim ReShowDataSet As New DataSet
                ReShowDataSet = ReSearchedDataSet.Clone()

                For i = 0 To ReSearchedDataSet.Tables(0).Rows.Count - 1
                    Dim ReShowRow As DataRow = ReSearchedDataSet.Tables(0).Rows(i)
                    Dim ArrDate1 As Date = ReShowRow.Item("day1") & " " & ReShowRow.Item("arrtime1")
                    Dim DeptDate2 As Date = ReShowRow.Item("day2") & " " & ReShowRow.Item("depttime2")
                    '++++Fill value==================
                    ReShowRow.Item("Leg") = "Return"

                    '++++If it's pass a day=====
                    If ArrDate1 > DeptDate2 Then
                        '++++AddDays(1) to dept2 before calc================
                        If (Date.Compare(ArrDate1.AddMinutes(Gapless), DeptDate2.AddDays(1)) <> 1) And (Date.Compare(ArrDate1, DeptDate2.AddMinutes(Gapmost + 1440)) <> -1) Then
                            Select Case ReShowRow.Item("IsNext1")
                                Case "0"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = Request("ReMDY")
                                    NextDay = NextDay.AddDays(1)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight2") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(1) to dept2==========
                                        ReShowRow.Item("day2") = DeptDate2.AddDays(1).ToShortDateString
                                        ReShowDataSet.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "1"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = Request("ReMDY")
                                    NextDay = NextDay.AddDays(2)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight2") & "' AND av.mdy='" & Request("ReMDY") & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(2) to dept2==========
                                        ReShowRow.Item("day2") = DeptDate2.AddDays(2).ToShortDateString
                                        ReShowDataSet.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "2"
                                Case Else
                            End Select
                        End If
                    Else
                        If (Date.Compare(ArrDate1.AddMinutes(Gapless), DeptDate2) <> 1) And (Date.Compare(ArrDate1, DeptDate2.AddMinutes(Gapmost)) <> -1) Then
                            Select Case ReShowRow.Item("IsNext1")
                                Case "0"
                                    ReShowDataSet.Tables(0).ImportRow(ReShowRow)
                                Case "1"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = Request("ReMDY")
                                    NextDay = NextDay.AddDays(1)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight2") & "' AND av.mdy='" & Request("ReMDY") & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(1) to dept2==========
                                        ReShowRow.Item("day2") = DeptDate2.AddDays(1).ToShortDateString
                                        ReShowDataSet.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "2"
                                Case Else
                            End Select
                        End If
                    End If
                Next

                '++++Complete in first hop ....then let's do again in second hop=========
                Dim ReShowDataSet2 As New DataSet
                ReShowDataSet2 = ReShowDataSet.Clone()

                For i = 0 To ReShowDataSet.Tables(0).Rows.Count - 1
                    Dim ReShowRow As DataRow = ReShowDataSet.Tables(0).Rows(i)
                    '++++Made it easy and correct to compare====
                    ReShowRow.Item("day3") = ReShowRow.Item("day2")

                    Dim ArrDate2 As Date = ReShowRow.Item("day2") & " " & ReShowRow.Item("arrtime2")
                    Dim DeptDate3 As Date = ReShowRow.Item("day3") & " " & ReShowRow.Item("depttime3")

                    '++++If it's pass a day=====
                    If ArrDate2 > DeptDate3 Then
                        '++++AddDays(1) to dept2 before calc================
                        If (Date.Compare(ArrDate2.AddMinutes(Gapless), DeptDate3.AddDays(1)) <> 1) And (Date.Compare(ArrDate2, DeptDate3.AddMinutes(Gapmost + 1440)) <> -1) Then
                            Select Case ReShowRow.Item("IsNext2")
                                Case "0"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = ReShowRow.Item("day2")
                                    NextDay = NextDay.AddDays(1)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight3") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(1) to dept2==========
                                        ReShowRow.Item("day3") = DeptDate3.AddDays(1).ToShortDateString
                                        ReShowDataSet2.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "1"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = ReShowRow.Item("day2")
                                    NextDay = NextDay.AddDays(2)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight3") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(2) to dept2==========
                                        ReShowRow.Item("day3") = DeptDate3.AddDays(2).ToShortDateString
                                        ReShowDataSet2.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "2"
                                Case Else
                            End Select
                        End If
                    Else
                        If (Date.Compare(ArrDate2.AddMinutes(Gapless), DeptDate3) <> 1) And (Date.Compare(ArrDate2, DeptDate3.AddMinutes(Gapmost)) <> -1) Then
                            Select Case ReShowRow.Item("IsNext2")
                                Case "0"
                                    ReShowDataSet2.Tables(0).ImportRow(ReShowRow)
                                Case "1"
                                    '++++Check is next day on second flight valid???================
                                    Dim NextDay As Date = ReShowRow.Item("day2")
                                    NextDay = NextDay.AddDays(1)
                                    QueryString = "SELECT fl.flightid FROM flight fl,available av WHERE fl.flightid=av.flightid AND fl.flightid='" & ReShowRow.Item("flight3") & "' AND av.mdy='" & NextDay.ToShortDateString & "'"
                                    If Airline.Query(QueryString).Tables(0).Rows.Count <> 0 Then
                                        '++++AddDays(1) to dept2==========
                                        ReShowRow.Item("day3") = DeptDate3.AddDays(1).ToShortDateString
                                        ReShowDataSet2.Tables(0).ImportRow(ReShowRow)
                                    End If
                                Case "2"
                                Case Else
                            End Select
                        End If
                    End If
                Next

                If ReShowDataSet2.Tables(0).Rows.Count <> 0 Then
                    For i = 0 To ReShowDataSet2.Tables(0).Rows.Count - 1
                        ReShowDataSet2.Tables(0).Rows(i).Item("AllDuration") = CInt(ReShowDataSet2.Tables(0).Rows(i).Item("Duration1")) + CInt(ReShowDataSet2.Tables(0).Rows(i).Item("Duration2")) + CInt(ReShowDataSet2.Tables(0).Rows(i).Item("Duration3"))
                        ReShowDataSet2.Tables(0).Rows(i).Item("AllFirstCost") = CInt(ReShowDataSet2.Tables(0).Rows(i).Item("FirstCost1")) + CInt(ReShowDataSet2.Tables(0).Rows(i).Item("FirstCost2")) + CInt(ReShowDataSet2.Tables(0).Rows(i).Item("FirstCost3"))
                        ReShowDataSet2.Tables(0).Rows(i).Item("AllBusinessCost") = CInt(ReShowDataSet2.Tables(0).Rows(i).Item("BusinessCost1")) + CInt(ReShowDataSet2.Tables(0).Rows(i).Item("BusinessCost2")) + CInt(ReShowDataSet2.Tables(0).Rows(i).Item("BusinessCost3"))
                        ReShowDataSet2.Tables(0).Rows(i).Item("AllEconomyCost") = CInt(ReShowDataSet2.Tables(0).Rows(i).Item("EconomyCost1")) + CInt(ReShowDataSet2.Tables(0).Rows(i).Item("EconomyCost2")) + CInt(ReShowDataSet2.Tables(0).Rows(i).Item("EconomyCost3"))
                    Next
                    '++++Use DataView to filter or Sort something=========
                    Dim ReShowDataView2 As New DataView
                    ReShowDataView2 = ReShowDataSet2.Tables(0).DefaultView
                    If Request("CabinOne") = "null" Then
                        '++++Sort by AllDuration=========
                        ReShowDataView2.Sort = "AllDuration"
                    ElseIf Request("CabinOne") = "0" Then
                        '++++Sort by AllFirstCost=========
                        ReShowDataView2.Sort = "AllFirstCost"
                    ElseIf Request("CabinOne") = "1" Then
                        '++++Sort by AllBusinessCost=========
                        ReShowDataView2.Sort = "AllBusinessCost"
                    ElseIf Request("CabinOne") = "2" Then
                        '++++Sort by AllEconomyCost=========
                        ReShowDataView2.Sort = "AllEconomyCost"
                    End If

                    If Request("NotAirline") <> "null" Then
                        ReShowDataView2.RowFilter = "al1<>'" & Request("NotAirline") & "' AND al2<>'" & Request("NotAirline") & "' AND al3<>'" & Request("NotAirline") & "'"
                    End If

                    grdReturn3.DataSource = ReShowDataView2
                    grdReturn3.DataBind()

                    grdReturn3.Visible = True
                    radCabinReturn.Visible = True
                    radWebFareReturn.Visible = True
                    lblCabinReturn.Visible = True
                    lblWebFareReturn.Visible = True
                    btnReSortCost.Visible = True
                    btnNext.Enabled = True
                Else
                    lblNotFRe3.Text = "Flight not available from " & Request("To") & " to " & Request("From") & " on " & Request("ReMDY") & " in 2-Stop."
                    lblNotFRe3.Visible = True
                End If
            End If

        End If

    End Sub

    Private Sub Selecting(ByVal source As System.Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles grdOneway.ItemCommand

        Session("FID") = grdOneway.DataKeys.Item(e.Item.ItemIndex)

        lblOneway.ForeColor = lblOneway.ForeColor.Black
        lblOneway.Text = " You selected " & grdOneway.DataKeys.Item(e.Item.ItemIndex)
        lblOneway.Visible = True

    End Sub

    Private Sub SelectingReturn(ByVal source As System.Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles grdReturn.ItemCommand

        Session("ReFID") = grdReturn.DataKeys.Item(e.Item.ItemIndex)

        lblReturn.ForeColor = lblReturn.ForeColor.Black
        lblReturn.Text = " You selected " & grdReturn.DataKeys.Item(e.Item.ItemIndex)
        lblReturn.Visible = True

    End Sub

    Private Sub Selecting2(ByVal source As System.Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles grdOneway2.ItemCommand

        Session("FID") = e.Item.Cells(0).Text
        Session("FID2") = e.Item.Cells(4).Text
        Session("DeptMDY2") = e.Item.Cells(6).Text

        lblOneway.ForeColor = lblOneway.ForeColor.Black
        lblOneway.Text = " You selected " & e.Item.Cells(0).Text & " / " & e.Item.Cells(4).Text
        lblOneway.Visible = True

    End Sub

    Private Sub SelectingReturn2(ByVal source As System.Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles grdReturn2.ItemCommand

        Session("ReFID") = e.Item.Cells(0).Text
        Session("ReFID2") = e.Item.Cells(4).Text
        Session("ReMDY2") = e.Item.Cells(6).Text

        lblReturn.ForeColor = lblOneway.ForeColor.Black
        lblReturn.Text = " You selected " & e.Item.Cells(0).Text & " / " & e.Item.Cells(4).Text
        lblReturn.Visible = True

    End Sub

    Private Sub Selecting3(ByVal source As System.Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles grdOneway3.ItemCommand

        Session("FID") = e.Item.Cells(0).Text
        Session("FID2") = e.Item.Cells(4).Text
        Session("FID3") = e.Item.Cells(8).Text
        Session("DeptMDY2") = e.Item.Cells(6).Text
        Session("DeptMDY3") = e.Item.Cells(10).Text

        lblOneway.ForeColor = lblOneway.ForeColor.Black
        lblOneway.Text = " You selected " & e.Item.Cells(0).Text & " / " & e.Item.Cells(4).Text & " / " & e.Item.Cells(8).Text
        lblOneway.Visible = True

    End Sub

    Private Sub SelectingReturn3(ByVal source As Object, ByVal e As System.Web.UI.WebControls.DataGridCommandEventArgs) Handles grdReturn3.ItemCommand

        Session("ReFID") = e.Item.Cells(0).Text
        Session("ReFID2") = e.Item.Cells(4).Text
        Session("ReFID3") = e.Item.Cells(8).Text
        Session("ReMDY2") = e.Item.Cells(6).Text
        Session("ReMDY3") = e.Item.Cells(10).Text

        lblReturn.ForeColor = lblOneway.ForeColor.Black
        lblReturn.Text = " You selected " & e.Item.Cells(0).Text & " / " & e.Item.Cells(4).Text & " / " & e.Item.Cells(8).Text
        lblReturn.Visible = True

    End Sub

    Private Sub btnNext_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnNext.Click

        Dim CabinOne As String = radCabinOne.Items(radCabinOne.SelectedIndex).Value
        Dim CabinReturn As String = radCabinReturn.Items(radCabinReturn.SelectedIndex).Value

        Select Case Request("IsRound")
            '++++OneWay Trip====
        Case "0"
                If (Session("FID") = "null") Then
                    lblOneway.ForeColor = lblOneway.ForeColor.Red
                    lblOneway.Text = "Please select your departure Flight."
                    lblOneway.Visible = True
                ElseIf Airline.CheckEnoughSeat(Session("FID"), Session("FID2"), Session("FID3"), Request("DeptMDY"), Session("DeptMDY2"), Session("DeptMDY3"), Request("Adult"), Request("Child"), CabinOne) = True Then
                    '++++Check available seat before========
                    RedirectToFare()
                Else
                    '++++If selected non-valid seat============
                    lblStatus.Text = "Please select available seat."
                    lblStatus.Visible = True
                End If

                '++++Return Trip====
            Case "1"
                If (Session("FID") = "null") Or (Session("ReFID") = "null") Then

                    If (Session("FID") = "null") Then
                        lblOneway.ForeColor = lblOneway.ForeColor.Red
                        lblOneway.Text = "Please select your departure Flight."
                        lblOneway.Visible = True
                    End If

                    If (Session("ReFID") = "null") Then
                        lblReturn.ForeColor = lblReturn.ForeColor.Red
                        lblReturn.Text = "Please select your return Flight."
                        lblReturn.Visible = True
                    End If
                ElseIf (Airline.CheckEnoughSeat(Session("FID"), Session("FID2"), Session("FID3"), Request("DeptMDY"), Session("DeptMDY2"), Session("DeptMDY3"), Request("Adult"), Request("Child"), CabinOne) = True) _
                And (Airline.CheckEnoughSeat(Session("ReFID"), Session("ReFID2"), Session("ReFID3"), Request("ReMDY"), Session("ReMDY2"), Session("ReMDY3"), Request("Adult"), Request("Child"), CabinReturn) = True) Then
                    '++++Check available seat before========
                    RedirectToFareReturn()
                Else
                    '++++If selected non-valid seat============
                    lblStatus.Text = "Please select available seat."
                    lblStatus.Visible = True
                End If
        End Select
    End Sub

    Function CheckSeat(ByVal SeatAvailable As Integer, ByVal Adult As Integer, ByVal Child As Integer) As String

        If SeatAvailable = -1 Then
            '++++Not have this cabin class=====
            Return "X"
        ElseIf SeatAvailable = 0 Then
            '++++Seat is full========
            Return "F"
        ElseIf SeatAvailable < (Adult + Child) Then
            '++++Have not enough======
            Return "NE"
        Else
            '++++Have enough seat=====
            Return CStr(SeatAvailable)
        End If

    End Function

    Private Sub RedirectToFare()
        '++++selected all valid info=============
        Session("ReFID") = "null"
        Response.Redirect("fare.aspx?DeptMDY=" & Request("DeptMDY") & _
                                    "&ReMDY=null" & _
                                    "&Adult=" & Request("Adult") & _
                                    "&Child=" & Request("Child") & _
                                    "&WebFareOne=" & radWebFareOne.Items(radWebFareOne.SelectedIndex).Value & _
                                    "&CabinOne=" & radCabinOne.Items(radCabinOne.SelectedIndex).Value & _
                                    "&WebFareReturn=null" & _
                                    "&CabinReturn=null" & _
                                    "&IsRound=" & Request("IsRound"))
    End Sub

    Private Sub RedirectToFareReturn()
        '++++selected all valid info=============
        Response.Redirect("fare.aspx?DeptMDY=" & Request("DeptMDY") & _
                                    "&ReMDY=" & Request("ReMDY") & _
                                    "&Adult=" & Request("Adult") & _
                                    "&Child=" & Request("Child") & _
                                    "&WebFareOne=" & radWebFareOne.Items(radWebFareOne.SelectedIndex).Value & _
                                    "&CabinOne=" & radCabinOne.Items(radCabinOne.SelectedIndex).Value & _
                                    "&WebFareReturn=" & radWebFareReturn.Items(radWebFareReturn.SelectedIndex).Value & _
                                    "&CabinReturn=" & radCabinReturn.Items(radCabinReturn.SelectedIndex).Value & _
                                    "&IsRound=" & Request("IsRound"))
    End Sub

    Private Sub btnBack_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnBack.Click
        Response.Redirect("index.aspx")
    End Sub

    Private Sub BtnSortCost_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles BtnSortCost.Click
        SortCost()
    End Sub

    Private Sub btnReSortCost_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnReSortCost.Click
        SortCost()
    End Sub

    Function GetAllDuration(ByVal Minute1 As Integer) As String

        Dim Duration As TimeSpan
        Dim DurationString As String = Duration.FromMinutes(Minute1).ToString
        DurationString = Mid(DurationString, 1, 2) & "hr " & Mid(DurationString, 4, 2) & "min"

        Return DurationString
    End Function

    Function GetAllDuration(ByVal Minute1 As Integer, ByVal Minute2 As Integer) As String

        Dim Duration As TimeSpan
        Dim DurationString As String = Duration.FromMinutes(Minute1 + Minute2).ToString
        DurationString = Mid(DurationString, 1, 2) & "hr " & Mid(DurationString, 4, 2) & "min"

        Return DurationString
    End Function

    Function GetAllDuration(ByVal Minute1 As Integer, ByVal Minute2 As Integer, ByVal Minute3 As Integer) As String

        Dim Duration As TimeSpan
        Dim DurationString As String = Duration.FromMinutes(Minute1 + Minute2 + Minute3).ToString
        DurationString = Mid(DurationString, 1, 2) & "hr " & Mid(DurationString, 4, 2) & "min"

        Return DurationString
    End Function

    Shared Function GetAllCost(ByVal AllEconomy As Integer, ByVal AllBusiness As Integer, ByVal AllFirst As Integer, ByVal CabinType As String) As Integer
        Select Case CabinType
            Case "2"
                Return AllEconomy
            Case "1"
                Return AllBusiness
            Case "0"
                Return AllFirst
            Case Else
                Return AllBusiness
        End Select
    End Function

    Private Sub SortCost()
        Select Case Request("IsRound")
            Case "0"
                Response.Redirect("searchresult.aspx?DeptMDY=" & Request("DeptMDY") & _
                                                "&From=" & Request("From") & _
                                                "&To=" & Request("To") & _
                                                "&IsRound=" & Request("IsRound") & _
                                                "&Adult=" & Request("Adult") & _
                                                "&Child=" & Request("Child") & _
                                                "&NonStop=" & Request("NonStop") & _
                                                "&1Stop=" & Request("1Stop") & _
                                                "&2Stop=" & Request("2Stop") & _
                                                "&Gapless=" & Request("Gapless") & _
                                                "&Gapmost=" & Request("Gapmost") & _
                                                "&NotAirline=" & Request("NotAirline") & _
                                                "&CabinOne=" & radCabinOne.Items(radCabinOne.SelectedIndex).Value)
            Case "1"
                Response.Redirect("searchresult.aspx?DeptMDY=" & Request("DeptMDY") & _
                                                        "&ReMDY=" & Request("ReMDY") & _
                                                        "&From=" & Request("From") & _
                                                        "&To=" & Request("To") & _
                                                        "&IsRound=" & Request("IsRound") & _
                                                        "&Adult=" & Request("Adult") & _
                                                        "&Child=" & Request("Child") & _
                                                        "&NonStop=" & Request("NonStop") & _
                                                        "&1Stop=" & Request("1Stop") & _
                                                        "&2Stop=" & Request("2Stop") & _
                                                        "&Gapless=" & Request("Gapless") & _
                                                        "&Gapmost=" & Request("Gapmost") & _
                                                        "&NotAirline=" & Request("NotAirline") & _
                                                        "&CabinOne=" & radCabinOne.Items(radCabinOne.SelectedIndex).Value & _
                                                        "&CabinReturn=" & radCabinReturn.Items(radCabinReturn.SelectedIndex).Value)
            Case Else
        End Select
    End Sub
End Class
