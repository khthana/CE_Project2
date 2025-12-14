<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc,UStatus

    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID) then
            GetSession() 'Get UName , UStatus
            Requests()
            Search()
            History()

            menu1.visible = true
            menu2.visible = false
            menu3.visible = false

            RegNewSession()'Register New Session Value

            ShowUser.Text = UName
            Label1.Visible = false
            Label2.Visible = false

            ShowAlarm()
            due.text = Format(today, "dddd d MMMM yyyy")
        else
            Response.Redirect("default.aspx")
        end if
    End Sub 'Page_Load

    Sub GetSession()
        UId = Trim(Session.Contents("UId"))
        UName = Trim(Session.Contents("UName"))
        UTel = Trim(Session.Contents("UTel"))
        UDep = Trim(Session.Contents("UDep"))
        USec = Trim(Session.Contents("USec"))
        ULoc = Trim(Session.Contents("ULoc"))
        UStatus = Trim(Session.Contents("UStatus"))
        RegNewSession()
    End Sub

    Sub RegNewSession()
        Session("UId") = UId
        Session("UName") = UName
        Session("UTel") = UTel
        Session("UDep") = UDep
        Session("USec") = USec
        Session("ULoc") = ULoc
        Session.Contents("UStatus") = UStatus
        Session("SIDD") = Session.Contents("SIDD")
    End Sub

    Sub ShowAlarm()
    If Not IsPostBack Then
      If (UStatus = "MIS" or UStatus = "Admin") Then
            myDataBinding()'MIS

      Else
            myDataBinding2() 'User
             Image3.visible = false
      End If
    end if
    End Sub

    Sub myDataBinding2()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
            queryString = "SELECT T_Request.Request_ID AS Expr1, T_Request.Title AS Expr2, T_Request.Times AS Expr4, T_Request.Status AS Expr5, T_Request.Priority AS Expr6, " & _
                          "T_Users.Name AS Expr7, T_Machine.Machine AS Expr8 " & _
                          "FROM T_Request INNER JOIN " & _
                          "T_Users ON T_Request.User_ID = T_Users.User_ID INNER JOIN " & _
                          "T_Machine ON T_Request.Machine_ID = T_Machine.Machine_ID " & _
                          "WHERE (T_Request.Type = 'Normal') AND (T_Request.User_ID = " + UId + ") AND (T_Request.Status = 'Complete')"


            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)
            DataGrid1.DataSource = dataSet

            DataGrid1.DataBind
    End Sub

    Sub myDataBinding()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT T_Request.Request_ID AS Expr1, T_Request.Title AS Expr2," & _
                                        "T_Request.Times AS Expr4, T_Request.Status AS Expr5, T_Request.Priority AS Expr6, T_Users.Name AS Expr7 " & _
                                        "FROM T_Request INNER JOIN T_Users ON T_Request.User_ID = T_Users.User_ID " & _
                                        "WHERE (T_Request.Type = 'Normal'  AND T_Request.Status = 'Complete')"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            DataGrid1.DataSource = dataSet
            DataGrid1.DataBind
    End Sub


    Sub sortDataGrid(o As Object , e As DataGridSortCommandEventArgs)
        If (UStatus = "MIS") Then
            mySortDataBinding(e.SortExpression) 'Suport
       Else
            mySortDataBinding2(e.SortExpression) 'User
       End If

    End Sub

    Sub mySortDataBinding2(Optional sortExpr As String = "Request_ID") 'Suport
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
            Dim queryString As String
            If dir_sort.Text = sortExpr Then
                queryString = "SELECT T_Request.Request_ID AS Expr1, T_Request.Title AS Expr2, T_Request.Times AS Expr4, T_Request.Status AS Expr5, T_Request.Priority AS Expr6, " & _
                          "T_Users.Name AS Expr7, T_Machine.Machine AS Expr8 " & _
                          "FROM T_Request INNER JOIN " & _
                          "T_Users ON T_Request.User_ID = T_Users.User_ID INNER JOIN " & _
                          "T_Machine ON T_Request.Machine_ID = T_Machine.Machine_ID " & _
                          "WHERE (T_Request.Type = 'Normal') AND (T_Request.User_ID = " + UId + ") AND (T_Request.Status = 'Complete') " & _
                              "ORDER BY " & sortExpr &" DESC"
                dir_sort.Text = ""
            Else
                queryString = "SELECT T_Request.Request_ID AS Expr1, T_Request.Title AS Expr2, T_Request.Times AS Expr4, T_Request.Status AS Expr5, T_Request.Priority AS Expr6, " & _
                          "T_Users.Name AS Expr7, T_Machine.Machine AS Expr8 " & _
                          "FROM T_Request INNER JOIN " & _
                          "T_Users ON T_Request.User_ID = T_Users.User_ID INNER JOIN " & _
                          "T_Machine ON T_Request.Machine_ID = T_Machine.Machine_ID " & _
                          "WHERE (T_Request.Type = 'Normal') AND (T_Request.User_ID = " + UId + ") AND (T_Request.Status = 'Complete') " & _
                              "ORDER BY " & sortExpr &" ASC"
                dir_sort.Text = sortExpr
            End If
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)
            DataGrid1.DataSource = dataSet
            DataGrid1.DataBind
    End Sub


    Sub mySortDataBinding(Optional sortExpr As String = "Request_ID") 'User
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
            Dim queryString As String
            If dir_sort.Text = sortExpr Then
                queryString  = "SELECT T_Request.Request_ID AS Expr1, T_Request.Title AS Expr2," & _
                               "T_Request.Times AS Expr4, T_Request.Status AS Expr5, T_Request.Priority AS Expr6, T_Users.Name AS Expr7 " & _
                               "FROM T_Request INNER JOIN T_Users ON T_Request.User_ID = T_Users.User_ID " & _
                               "WHERE (T_Request.Type = 'Normal'  AND T_Request.Status = 'Complete') ORDER BY " & sortExpr &" DESC"
                dir_sort.Text = ""
            Else
                queryString  = "SELECT T_Request.Request_ID AS Expr1, T_Request.Title AS Expr2," & _
                               "T_Request.Times AS Expr4, T_Request.Status AS Expr5, T_Request.Priority AS Expr6, T_Users.Name AS Expr7 " & _
                               "FROM T_Request INNER JOIN T_Users ON T_Request.User_ID = T_Users.User_ID " & _
                               "WHERE (T_Request.Type = 'Normal' AND T_Request.Status = 'Complete') ORDER BY " & sortExpr &" ASC"
                dir_sort.Text = sortExpr
            End If

            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)
            DataGrid1.DataSource = dataSet
            DataGrid1.DataBind
    End Sub


    Sub pageDataGrid(o As Object, e As DataGridPageChangedEventArgs)
        DataGrid1.CurrentPageIndex = e.NewPageIndex
          If (UStatus = "MIS") Then
            myDataBinding2()'Support
          Else
            myDataBinding() 'User
          End If
    End Sub

    Sub MyDataGrid_Select(sender As Object, e As EventArgs)
                 Session("Reference") = DataGrid1.SelectedItem.Cells(0).Text
                 Response.Redirect("detail_user.aspx")
    End Sub

    'end sub in this page

    'my change
    Sub Requests()
            Dim A() AS String = {"New","Queuing","Pending","Complete","Borrow"}
            Dim r As New TableRow()
            Dim c As New TableCell()
            Dim d as New ImageButton()

            d.ID = "Req1"
            d.ImageUrl="images/requests/images01.gif"
            AddHandler d.Click, AddressOf Req_Click
            c.Controls.Add(d)
            r.Cells.Add(c)
            menu1.Rows.Add(r)

            Dim j As Integer
            For j = 0 To 4
            if (((Session.Contents("UStatus") = "MIS") and j > 0) or (Session.Contents("UStatus") <> "MIS")) then

                Dim r2 As New TableRow()
                Dim c2 As New TableCell()
                Dim d2 As New ImageButton()
                d2.ID = "Req0" & (j+1)
                d2.ImageUrl="images/requests/images0" + Mid(str(j+2),2) + ".gif"
                AddHandler d2.Click, AddressOf Me.All_Click
                c2.Controls.Add(d2)
                r2.Cells.Add(c2)
                menu1.Rows.Add(r2)

                Dim r21 As New TableRow()
                Dim c21 As New TableCell()
                Dim d21 As New Label()
                d21.ForeColor = White
                d21.Text = A(j)
                c21.Controls.Add(d21)
                r21.Cells.Add(c21)
                menu1.Rows.Add(r21)
            end if

            Next j

            Dim r3 As New TableRow()
            Dim c3 As New TableCell()
            Dim d3 as New ImageButton()
            d3.ID = "Sea1"
            d3.ImageUrl="images/requests/images07.gif"
            AddHandler d3.Click, AddressOf Sea_Click
            c3.Controls.Add(d3)
            r3.Cells.Add(c3)
            menu1.Rows.Add(r3)

            if (Session.Contents("UStatus") = "MIS") then
                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His1"
                d4.ImageUrl="images/requests/images08.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu1.Rows.Add(r4)
            end if

            if (UStatus = "User") then
                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Cost1"
                d5.ImageUrl="images/requests/images09.gif"
                AddHandler d5.Click, AddressOf Cost_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu1.Rows.Add(r5)
            end if

     End Sub

     Sub Search()
            Dim A() AS String = {"Best Solutions","Job","Cost"} '10
            Dim r As New TableRow()
            Dim c As New TableCell()
            Dim d as New ImageButton()

            d.ID = "Req2"
            d.ImageUrl="images/search/images01.gif"
            AddHandler d.Click, AddressOf Req_Click
            c.Controls.Add(d)
            r.Cells.Add(c)
            menu2.Rows.Add(r)

            Dim r3 As New TableRow()
            Dim c3 As New TableCell()
            Dim d3 as New ImageButton()
            d3.ID = "Sea2"
            d3.ImageUrl="images/search/images02.gif"
            AddHandler d3.Click, AddressOf Sea_Click
            c3.Controls.Add(d3)
            r3.Cells.Add(c3)
            menu2.Rows.Add(r3)


            Dim j As Integer
            For j = 0 To 2
                if (((Session.Contents("UStatus") = "User") and j < 2) or (Session.Contents("UStatus") <> "User")) then
                Dim r2 As New TableRow()
                Dim c2 As New TableCell()
                Dim d2 As New ImageButton()
                d2.ID = "Sea0" & (j+1)
                d2.ImageUrl="images/search/images0" + Mid(str(j+3),2) + ".gif"
                AddHandler d2.Click, AddressOf Me.All_Click
                c2.Controls.Add(d2)
                r2.Cells.Add(c2)
                menu2.Rows.Add(r2)

                Dim r21 As New TableRow()
                Dim c21 As New TableCell()
                Dim d21 As New Label()
                d21.ForeColor=White
                d21.Text = A(j)
                c21.Controls.Add(d21)
                r21.Cells.Add(c21)
                menu2.Rows.Add(r21)
                end if
            Next j
            if (UStatus = "MIS") then
                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His2"
                d4.ImageUrl="images/search/images06.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu2.Rows.Add(r4)
            end if
            if (UStatus = "User") then
                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Cost2"
                d5.ImageUrl="images/search/images07.gif"
                AddHandler d5.Click, AddressOf Cost_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu2.Rows.Add(r5)
            end if
        End Sub

        Sub History()

            if (Session.Contents("UStatus") = "MIS") then
                Dim A() AS String = {"Requester","Department","Support Rep","Workstation"}
                Dim r As New TableRow()
                Dim c As New TableCell()
                Dim d as New ImageButton()

                d.ID = "Req3"
                d.ImageUrl="images/history/images01.gif"
                AddHandler d.Click, AddressOf Req_Click
                c.Controls.Add(d)
                r.Cells.Add(c)
                menu3.Rows.Add(r)

                Dim r3 As New TableRow()
                Dim c3 As New TableCell()
                Dim d3 as New ImageButton()
                d3.ID = "Sea3"
                d3.ImageUrl="images/history/images02.gif"
                AddHandler d3.Click, AddressOf Sea_Click
                c3.Controls.Add(d3)
                r3.Cells.Add(c3)
                menu3.Rows.Add(r3)

                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His3"
                d4.ImageUrl="images/history/images03.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu3.Rows.Add(r4)

                Dim j As Integer
                For j = 0 To 3
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()
                    d2.ID = "His0" & (j+1)
                    d2.ImageUrl="images/history/images0" + Mid(str(j+4),2) + ".gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu3.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(j)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu3.Rows.Add(r21)
                Next j
            end if
        End Sub

        Sub Cost_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            Response.Redirect("usermodify.aspx") 'new.aspx
        End Sub

        Sub Req_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu2.Visible = false
            menu3.Visible = false
            menu1.Visible = true
        End Sub

        Sub Sea_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu3.Visible = false
            menu2.Visible = true
        End Sub

        Sub His_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu2.Visible = false
            menu3.Visible = true
        End Sub
        ' My function
        Sub All_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)

            'MsgBox(Sender.ID)
            if (Sender.ID = "Req01") then
                Response.Redirect("request01.aspx") 'new.aspx
            else if (Sender.ID = "Req02") then
                Response.Redirect("request02_user.aspx") 'showalarm.aspx
            else if (Sender.ID = "Req03") then
                Response.Redirect("request03_user.aspx")
            else if (Sender.ID = "Req04") then
                Response.Redirect("request04_user.aspx")
            else if (Sender.ID = "Req05") then
                Response.Redirect("request05_user.aspx")
            end if

            'Sea
            if (Sender.ID = "Sea01") then
                Response.Redirect("search01_user.aspx")
            else if (Sender.ID = "Sea02") then
                Response.Redirect("search02use.aspx")
            else if (Sender.ID = "Sea03") then
                Response.Redirect("search03.aspx")
            end if



        End Sub

    Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("default.aspx")
    End Sub

    ' MY Change

</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>ESSILOR MANUFACTURING (THAILAND) CO., LTD.</title>
    <meta http-equiv="refresh" content="360;request04.aspx" />
    <meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
    <style type="text/css">BODY {
	MARGIN: 2px
}
BODY {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
TD {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
TH {
	FONT-SIZE: 12px; FONT-FAMILY: Times New Roman, Times, serif
}
A {
	FONT-SIZE: 12px; COLOR: #0066ff; FONT-FAMILY: Courier New, Courier, mono
}
A:link {
	TEXT-DECORATION: none
}
A:visited {
	COLOR: #0066ff; TEXT-DECORATION: none
}
A:hover {
	COLOR: #0066ff; TEXT-DECORATION: none
}
A:active {
	COLOR: #0066ff; TEXT-DECORATION: none
}
.style2 {
	COLOR: #ffffff
}
</style>
</head>
<body>
    <center>
        <asp:Image id="Image3" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 0px" Visible="true" ImageUrl="/images/adminstars.gif" runat="server"></asp:Image>
        <asp:Label id="Label1" runat="server" visible="false"></asp:Label><asp:Label id="Label2" runat="server" visible="false"></asp:Label><asp:Label id="dir_sort" runat="server" visible="false"></asp:Label>
        <form name="form1" action="" method="post" runat="server">
            <table bordercolor="#000000" height="450" cellspacing="1" cellpadding="1" width="775" border="1">
                <tbody>
                    <tr>
                        <td colspan="2" height="65">
                            <table cellspacing="0" cellpadding="0" width="700" border="0">
                                <tbody>
                                    <tr>
                                        <td width="95" height="65" rowspan="2">
                                            <img height="65" src="images/logo/images01.gif" width="95" /></td>
                                        <td width="673" background="images/bgheader.gif" height="45">
                                            <span class="style1"><font color="#ffffff"><span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS" color="white"><font color="white" size="4">Essilor
                                            Manufacturing (Thailand) co.,ltd.<br />
                                            MIS Section</font>&nbsp;&nbsp;</font></font></span></font></span></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            <asp:ImageButton id="ButtonRefresh" ImageUrl="images/refresh.gif" runat="server" width="20" height="20" AlternateText="Refresh"></asp:ImageButton>
                                                            &nbsp;<span class="style1"><font face="Comic Sans MS" color="#ffffff"><span style="COLOR: white">Complete</span></font></span></td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" font-names="Comic Sans MS" forecolor="White"></asp:Label></td>
                                                        <td align="right" width="120" colspan="2">
                                                            <asp:Label id="showUser" runat="server" font-names="Comic Sans MS" forecolor="White"></asp:Label>&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="middle" width="95" bgcolor="#009cc6" height="370">
                            <p>
                                <asp:table id="menu1" runat="server" visible="false" BackColor="#009CC6" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                                <asp:table id="menu2" runat="server" visible="false" BackColor="#009CC6" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                                <asp:table id="menu3" runat="server" visible="false" BackColor="#009CC6" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                                <hr />
                                <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" AlternateText="Logout" Width="37px" src="images/commond/images03.gif" Height="33px"></asp:ImageButton>
                            </p>
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                                <font face="Comic Sans MS" color="white">Login</font>
                            </p>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <asp:DataGrid id="DataGrid1" Visible="true" runat="server" Width="666px" Font-Names="Comic Sans MS" OnSelectedIndexChanged="MyDataGrid_Select" OnPageIndexChanged="pageDataGrid" PageSize="15" AllowPaging="true" OnSortCommand="sortDataGrid" AllowSorting="true" AutoGenerateColumns="false" BorderColor="#999999">
                                <HeaderStyle backcolor="#DDDDDD"></HeaderStyle>
                                <PagerStyle horizontalalign="Right" mode="NumericPages"></PagerStyle>
                                <SelectedItemStyle backcolor="Yellow"></SelectedItemStyle>
                                <Columns>
                                    <asp:BoundColumn DataField="Expr1" SortExpression="Expr1" HeaderText="Ref#">
                                        <HeaderStyle width="1cm"></HeaderStyle>
                                    </asp:BoundColumn>
                                    <asp:ButtonColumn Text="Detail" HeaderText="Detail" CommandName="Select"></asp:ButtonColumn>
                                    <asp:BoundColumn DataField="Expr2" SortExpression="Expr2" HeaderText="Title">
                                        <HeaderStyle width="5.2cm"></HeaderStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Expr4" SortExpression="Expr4" HeaderText="Date/Time">
                                        <HeaderStyle width="3cm"></HeaderStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Expr5" SortExpression="Expr5" HeaderText=" Status">
                                        <HeaderStyle width="1.8cm"></HeaderStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Expr6" SortExpression="Expr6" HeaderText=" Priority">
                                        <HeaderStyle width="1.9cm"></HeaderStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Expr8" SortExpression="Expr8" HeaderText="Type">
                                        <HeaderStyle width="1cm"></HeaderStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Expr7" SortExpression="Expr7" HeaderText=" Requester">
                                        <HeaderStyle width="1.9cm"></HeaderStyle>
                                    </asp:BoundColumn>
                                </Columns>
                            </asp:DataGrid>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
