Public Class alltrips
    Inherits System.Web.UI.Page

#Region " Web Form Designer Generated Code "

    'This call is required by the Web Form Designer.
    <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

    End Sub
    Protected WithEvents Image1 As System.Web.UI.WebControls.Image
    Protected WithEvents grdAllTrips As System.Web.UI.WebControls.DataGrid
    Protected WithEvents lblTotal As System.Web.UI.WebControls.Label
    Protected WithEvents btnHome As System.Web.UI.WebControls.Button
    Protected WithEvents lblMemberID As System.Web.UI.WebControls.Label

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
            If Session("MemberID") = "" Then
                Response.Redirect("login.aspx")
            Else
                Dim QueryString As String = "SELECT * FROM bookeddetails bd,bookedflight bf,flight f WHERE  bd.bookref=bf.bookref AND f.flightid=bf.flightid AND bd.memberid='" & Session("MemberID") & "' AND bd.isvalid='0' AND bf.isvalid='0' ORDER BY bf.BookRef,flightsequence" 'ORDER BY BookDateTime,flightsequence ====if real use***
                Dim AllTripsDataSet As DataSet = Airline.Query(QueryString)
                grdAllTrips.DataSource = AllTripsDataSet
                grdAllTrips.DataBind()

                Dim i As Integer
                Dim MileTotal As Integer = 0
                For i = 0 To AllTripsDataSet.Tables(0).Rows.Count - 1
                    MileTotal = MileTotal + AllTripsDataSet.Tables(0).Rows(i).Item("Mile")
                Next

                lblTotal.Text = MileTotal
                lblMemberID.Text = Session("MemberID")

            End If
        End If

    End Sub

    Function GetCabinFare(ByVal CabinType As String, ByVal Economy As Int16, ByVal Business As Int16, ByVal First As Int16) As Int16
        Select Case CabinType
            Case 2
                Return Economy
            Case 1
                Return Business
            Case 0
                Return First
        End Select
    End Function

    Function GetCabin(ByVal CabinType As String) As String
        Select Case CabinType
            Case 2
                Return "Economy"
            Case 1
                Return "Business"
            Case 0
                Return "First"
        End Select
    End Function

    Function GetWebFare(ByVal WebFareType As String) As String
        Select Case WebFareType
            Case "0"
                Return "Web Fare 6 months"
            Case "1"
                Return "Web Fare 1 year"
        End Select
    End Function

    Function GetLeg(ByVal IsReturn As String) As String
        Select Case IsReturn
            Case "N"
                Return "Out Bound"
            Case "Y"
                Return "Return"
        End Select
    End Function

    Function GetName(ByVal FirstName As String, ByVal LastName As String) As String
        Return FirstName & " " & LastName
    End Function

    Private Sub btnHome_Click(ByVal sender As System.Object, ByVal e As System.EventArgs)
        Response.Redirect("index.aspx")
    End Sub
End Class
