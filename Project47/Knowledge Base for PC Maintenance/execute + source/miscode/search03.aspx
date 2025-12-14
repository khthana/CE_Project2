<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc ,UStatus
    sub Page_Init()
        QueryRquests()
        QueryDepartment()
        QuerySection()
        QueryLocation()

        InitDateForm()
    end sub

    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID) then
            GetSession()
            Requests()
            Search()
            History()
            edit()

            menu1.visible = false
            menu2.visible = true
            menu3.visible = false
            menu4.visible = false


            ShowUser.Text = UName
            Label1.Visible = false
            Label2.Visible = false
            due.text = Format(today, "dddd d MMMM yyyy")
        else
            Response.Redirect("default.aspx")
        end if
    End Sub 'Page_Load


    sub InitDateForm()
                Dim myMon = Month(ToDay)
                Dim myDay = Day(ToDay)
                Dim myYear  = Year(ToDay)
                Dim tmpYear as integer
                if(myYear > 2100) then
                    tmpYear = Int(MyYear) - 2548
                else
                    tmpYear =INt(myyear) - 2005
                end if
               ' DropDownFDay.SelectedIndex = Int(myDay)-1
               ' DropDownFMon.SelectedIndex = Int(myMon)-1
               ' DropDownFYear.SelectedIndex = tmpYear
                DropDownTDay.SelectedIndex = Int(myDay)-1
                DropDownTMon.SelectedIndex = Int(myMon)-1
                DropDownTYear.SelectedIndex = tmpYear
    end sub

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
        Session("UStatus") = UStatus
        Session("SIDD") = Session.Contents("SIDD")
    End Sub

    sub QueryRquests()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
            queryString = "SELECT     Name " & _
                          "FROM         T_Users " & _
                          "WHERE     (Status = N'USER')"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownReq.Items.Add(New ListItem(Trim(dataReader.GetString(0)),dataReader.GetString(0)))
            end while
    end sub

    sub QueryDepartment()
            'DropDownSec.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Department_ID,Department FROM T_Department"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownDep.Items.Add(New ListItem(Trim(dataReader.GetString(1)),dataReader.GetInt32(0).ToString))
            end while
    end sub

    sub QuerySection()
            'DropDownSec.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Section_ID,Section FROM T_Section"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownSec.Items.Add(New ListItem(Trim(dataReader.GetString(1)),dataReader.GetInt32(0).ToString))
            end while
    end sub

    sub QueryLocation()
            'DropDownLoc.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Location_ID,Location FROM T_Location"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownLoc.Items.Add(New ListItem(Trim(dataReader.GetString(1)),dataReader.GetInt32(0).ToString))
            end while
    end sub

    Sub FindButton_Click(sender As Object, e As ImageClickEventArgs)
        Dim queryString, From1, To1 As String
        queryString = ""

            If (DropDownReq.SelectedItem.Text <> "All Rquests") Then
                queryString = " T_Users.User_ID LIKE '%"+ DropDownReq.SelectedItem.Text+"%'"
             else
                queryString = " T_Users.User_ID LIKE '%%'"
            End If
            If (DropDownDep.SelectedItem.Text <> "All Departments") Then
                queryString = queryString & " AND T_Department.Department_ID='" + DropDownDep.SelectedItem.Value + "'"
            else
                queryString = queryString & " AND T_Department.Department_ID <> 0"
            End If
            If (DropDownSec.SelectedItem.Text <> "All Sections") Then
                queryString = queryString & " AND T_Section.Section_ID='" + DropDownSec.SelectedItem.Value + "'"
            else
                queryString = queryString & " AND T_Section.Section_ID <> 0"
            End If
            If (DropDownLoc.SelectedItem.Text <> "All Locations") Then
                queryString = queryString & " AND T_Location.Location_ID='" + DropDownLoc.SelectedItem.Value + "'"
            else
                queryString = queryString & " AND T_Location.Location_ID <> 0"
            End If

            if (queryString <> "") then
                From1 = DropDownFYear.SelectedItem.Value + DropDownFMon.SelectedItem.Value + DropDownFDay.SelectedItem.Value
                To1 =   DropDownTYear.SelectedItem.Value + DropDownTMon.SelectedItem.Value + DropDownTDay.SelectedItem.Value
                'queryString = queryString + " AND ( T_Request.Dates BETWEEN " + From1 + " AND " + To1 + ")"

                queryString = "SELECT T_Users.Name AS Expr1, T_Request.Times AS Expr2, T_Department.Department AS Expr3, T_Section.[Section] AS Expr4, " & _
                              "T_Location.Location AS Expr5, SUM(DISTINCT T_Reply.Cost) AS Expr6 " & _
                              "FROM T_Users INNER JOIN " & _
                              "T_Department ON T_Users.Department_ID = T_Department.Department_ID INNER JOIN " & _
                              "T_Location ON T_Users.Location_ID = T_Location.Location_ID INNER JOIN " & _
                              "T_Request ON T_Users.User_ID = T_Request.User_ID INNER JOIN " & _
                              "T_Section ON T_Users.Section_ID = T_Section.Section_ID INNER JOIN " & _
                              "T_Reply ON T_Request.Request_ID = T_Reply.Request_ID " & _
                              "Where ( T_Request.Dates BETWEEN " + From1 + " AND " + To1 + ") " & _
                              "GROUP BY T_Users.User_ID,T_Users.Name, T_Request.Times, T_Department.Department, T_Section.[Section], T_Location.Location, T_Department.Department_ID, " & _
                              "T_Section.Section_ID, T_Location.Location_ID " & _
                              "HAVING " & queryString
                              '(T_Users.Name = N'out  xxx') AND (T_Department.Department_ID = 1) AND (T_Section.Section_ID = 2) AND (T_Location.Location_ID = 4)"
    '

                              'msgbox(queryString)

                Session("queryString") = queryString
                Response.Redirect("search03show.aspx")

            end if
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
            if (((Session.Contents("UStatus") <> "User") and j > 0) or (Session.Contents("UStatus") = "User")) then

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

            if (Session.Contents("UStatus") <> "User") then
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

            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "Edi1"
                d6.ImageUrl="images/requests/images10.gif"
                AddHandler d6.Click, AddressOf Edi_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu1.Rows.Add(r6)
     End Sub

     Sub Search()
            Dim A() AS String = {"Search History","Job","Cost"} '10
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
            if (UStatus <> "User") then
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
            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "Edi2"
                d6.ImageUrl="images/search/images08.gif"
                AddHandler d6.Click, AddressOf Edi_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu2.Rows.Add(r6)
        End Sub

        Sub History()
            if (Session.Contents("UStatus") <> "User") then
                Dim A() AS String = {"Add History","Edit History","Support Rep","Workstation"}
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
                For j = 0 To 1
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

            Dim r6 As New TableRow()
                Dim c6 As New TableCell()
                Dim d6 as New ImageButton()
                d6.ID = "His03"
                d6.ImageUrl="images/search/images03.gif"
                AddHandler d6.Click, AddressOf Me.All_Click
                c6.Controls.Add(d6)
                r6.Cells.Add(c6)
                menu3.Rows.Add(r6)

                Dim r22 As New TableRow()
                    Dim c22 As New TableCell()
                    Dim d22 As New Label()
                    d22.ForeColor=white
                    d22.Text = "Search History"
                    c22.Controls.Add(d22)
                    r22.Cells.Add(c22)
                    menu3.Rows.Add(r22)

            Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Edi3"
                d5.ImageUrl="images/history/images09.gif"
                AddHandler d5.Click, AddressOf Edi_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu3.Rows.Add(r5)
        End Sub

        Sub edit()
            if (Session.Contents("UStatus") <> "User") then
                Dim A() AS String = {"Administator","User","Control panal","User Info"}
                Dim r As New TableRow()
                Dim c As New TableCell()
                Dim d as New ImageButton()

                d.ID = "Req4"
                d.ImageUrl="images/edit/images01.gif"
                AddHandler d.Click, AddressOf Req_Click
                c.Controls.Add(d)
                r.Cells.Add(c)
                menu4.Rows.Add(r)

                Dim r3 As New TableRow()
                Dim c3 As New TableCell()
                Dim d3 as New ImageButton()
                d3.ID = "Sea4"
                d3.ImageUrl="images/edit/images02.gif"
                AddHandler d3.Click, AddressOf Sea_Click
                c3.Controls.Add(d3)
                r3.Cells.Add(c3)
                menu4.Rows.Add(r3)

                Dim r4 As New TableRow()
                Dim c4 As New TableCell()
                Dim d4 as New ImageButton()
                d4.ID = "His4"
                d4.ImageUrl="images/edit/images03.gif"
                AddHandler d4.Click, AddressOf His_Click
                c4.Controls.Add(d4)
                r4.Cells.Add(c4)
                menu4.Rows.Add(r4)

                Dim r5 As New TableRow()
                Dim c5 As New TableCell()
                Dim d5 as New ImageButton()
                d5.ID = "Edi4"
                d5.ImageUrl="images/edit/images04.gif"
                AddHandler d5.Click, AddressOf Edi_Click
                c5.Controls.Add(d5)
                r5.Cells.Add(c5)
                menu4.Rows.Add(r5)

                if (Session.Contents("UStatus") = "Admin") then
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()

                    d2.ID = "Edi01"
                    d2.ImageUrl="images/edit/images05.gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu4.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(0)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu4.Rows.Add(r21)
                 end if


                Dim j As Integer
                For j = 0 To 1
                    Dim r2 As New TableRow()
                    Dim c2 As New TableCell()
                    Dim d2 As New ImageButton()
                    d2.ID = "Edi0" & (j+2)
                    d2.ImageUrl="images/edit/images0" + Mid(str(j+6),2) + ".gif"
                    AddHandler d2.Click, AddressOf Me.All_Click
                    c2.Controls.Add(d2)
                    r2.Cells.Add(c2)
                    menu4.Rows.Add(r2)

                    Dim r21 As New TableRow()
                    Dim c21 As New TableCell()
                    Dim d21 As New Label()
                    d21.ForeColor=white
                    d21.Text = A(j+1)
                    c21.Controls.Add(d21)
                    r21.Cells.Add(c21)
                    menu4.Rows.Add(r21)
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
            menu4.Visible = false
        End Sub

        Sub Sea_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu3.Visible = false
            menu2.Visible = true
            menu4.Visible = false
        End Sub

        Sub His_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu2.Visible = false
            menu3.Visible = true
            menu4.Visible = false
        End Sub

        Sub Edi_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)
            menu1.Visible = false
            menu2.Visible = false
            menu3.Visible = false
            menu4.Visible = true
        End Sub

        ' My function
        Sub All_Click(sender As Object, e As System.Web.UI.ImageClickEventArgs)

            'MsgBox(Sender.ID)
            if (Sender.ID = "Req01") then
                Response.Redirect("request01.aspx") 'new.aspx
            else if (Sender.ID = "Req02") then
                Response.Redirect("request02.aspx") 'showalarm.aspx
            else if (Sender.ID = "Req03") then
                Response.Redirect("request03.aspx")
            else if (Sender.ID = "Req04") then
                Response.Redirect("request04.aspx")
            else if (Sender.ID = "Req05") then
                Response.Redirect("request05.aspx")
            end if

            'Sea
            if (Sender.ID = "Sea01") then
                Response.Redirect("search01.aspx")
            else if (Sender.ID = "Sea02") then
                Response.Redirect("search02.aspx")
            else if (Sender.ID = "Sea03") then
                Response.Redirect("search03.aspx")
            end if

            if (Sender.ID = "His01") then
                Response.Redirect("history01.aspx")
            else if (Sender.ID = "His02") then
                Response.Redirect("history02.aspx")
            else if (Sender.ID = "His03") then
                Response.Redirect("history03x.aspx")
            else if (Sender.ID = "His04") then
                Response.Redirect("history04.aspx")
            end if

            if (Sender.ID = "Edi01") then
                Response.Redirect("edit01.aspx")
            else if (Sender.ID = "Edi02") then
                Response.Redirect("edit02.aspx")
            else if (Sender.ID = "Edi03") then
                Response.Redirect("edit03.aspx")
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
        <asp:Image id="Image3" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 0px" runat="server" ImageUrl="./images/adminstars.gif" Visible="true"></asp:Image>
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
                                        <td width="673" background="images/bgheader_admin.gif" height="45">
                                            <span class="style1"><font color="#ffffff"><span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS"><font color="yellow" size="4">Essilor
                                            Manufacturing (Thailand) co.,ltd.<br />
                                            MIS Section</font></font></font></span></font></span></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader_admin.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            &nbsp;<font color="#ffffff"> </font><font face="Comic Sans MS" color="#ffff00" size="2">Search
                                                            Job Cost</font></td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" forecolor="Yellow" font-names="Comic Sans MS"></asp:Label></td>
                                                        <td align="right" width="120" colspan="2">
                                                            <asp:Label id="showUser" runat="server" forecolor="Yellow" font-names="Comic Sans MS"></asp:Label>&nbsp;</td>
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
                        <td valign="top" align="middle" width="95" bgcolor="#1f1fe2" height="370">
                            <asp:table id="menu1" runat="server" visible="false" BackColor="#1F1FE2" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <asp:table id="menu2" runat="server" visible="false" BackColor="#1F1FE2" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <asp:table id="menu3" runat="server" visible="false" BackColor="#1F1FE2" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <asp:table id="menu4" runat="server" visible="false" BackColor="#1F1FE2" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <hr />
                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" Width="37px" src="images/commond/images03.gif" AlternateText="Logout" Height="33px"></asp:ImageButton>
                            <br />
                            <font face="Comic Sans MS" color="#ffff00">Logout</font>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <p>
                                &nbsp;&nbsp;&nbsp;
                                <table style="WIDTH: 286px; HEIGHT: 198px">
                                    <tbody>
                                        <tr>
                                            <td align="left">
                                                Requests
                                            </td>
                                            <td align="right">
                                                <asp:DropDownList id="DropDownReq" runat="server" Width="200px">
                                                    <asp:ListItem Value="All Rquests">All Rquests</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Department</td>
                                            <td align="right">
                                                <asp:DropDownList id="DropDownDep" runat="server" Width="200px">
                                                    <asp:ListItem Value="All Departments">All Departments</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Section
                                            </td>
                                            <td align="right">
                                                <asp:DropDownList id="DropDownSec" runat="server" Width="200px">
                                                    <asp:ListItem Value="All Sections">All Sections</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                Location
                                            </td>
                                            <td align="right">
                                                <asp:DropDownList id="DropDownLoc" runat="server" Width="200px">
                                                    <asp:ListItem Value="All Locations">All Locations</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <hr />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>
                                                <asp:Label id="Label3" runat="server" width="106px">DD/MM/YY</asp:Label></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                From</td>
                                            <td align="right">
                                                <asp:DropDownList id="DropDownFDay" runat="server" Width="53px">
                                                    <asp:ListItem Value="01" Selected="True">01</asp:ListItem>
                                                    <asp:ListItem Value="02">02</asp:ListItem>
                                                    <asp:ListItem Value="03">03</asp:ListItem>
                                                    <asp:ListItem Value="04">04</asp:ListItem>
                                                    <asp:ListItem Value="05">05</asp:ListItem>
                                                    <asp:ListItem Value="06">06</asp:ListItem>
                                                    <asp:ListItem Value="07">07</asp:ListItem>
                                                    <asp:ListItem Value="08">08</asp:ListItem>
                                                    <asp:ListItem Value="09">09</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">12</asp:ListItem>
                                                    <asp:ListItem Value="13">13</asp:ListItem>
                                                    <asp:ListItem Value="14">14</asp:ListItem>
                                                    <asp:ListItem Value="15">15</asp:ListItem>
                                                    <asp:ListItem Value="16">16</asp:ListItem>
                                                    <asp:ListItem Value="17">17</asp:ListItem>
                                                    <asp:ListItem Value="18">18</asp:ListItem>
                                                    <asp:ListItem Value="19">19</asp:ListItem>
                                                    <asp:ListItem Value="20">20</asp:ListItem>
                                                    <asp:ListItem Value="21">21</asp:ListItem>
                                                    <asp:ListItem Value="22">22</asp:ListItem>
                                                    <asp:ListItem Value="23">23</asp:ListItem>
                                                    <asp:ListItem Value="24">24</asp:ListItem>
                                                    <asp:ListItem Value="25">25</asp:ListItem>
                                                    <asp:ListItem Value="26">26</asp:ListItem>
                                                    <asp:ListItem Value="27">27</asp:ListItem>
                                                    <asp:ListItem Value="28">28</asp:ListItem>
                                                    <asp:ListItem Value="29">29</asp:ListItem>
                                                    <asp:ListItem Value="30">30</asp:ListItem>
                                                    <asp:ListItem Value="31">31</asp:ListItem>
                                                </asp:DropDownList>
                                                <b></b>
                                                <asp:DropDownList id="DropDownFMon" runat="server" Width="53px">
                                                    <asp:ListItem Value="01" Selected="True">JAN</asp:ListItem>
                                                    <asp:ListItem Value="02">FEB</asp:ListItem>
                                                    <asp:ListItem Value="03">MAR</asp:ListItem>
                                                    <asp:ListItem Value="04">APR</asp:ListItem>
                                                    <asp:ListItem Value="05">MAY</asp:ListItem>
                                                    <asp:ListItem Value="06">JUN</asp:ListItem>
                                                    <asp:ListItem Value="07">JUL</asp:ListItem>
                                                    <asp:ListItem Value="08">AUG</asp:ListItem>
                                                    <asp:ListItem Value="09">SEP</asp:ListItem>
                                                    <asp:ListItem Value="10">OCT</asp:ListItem>
                                                    <asp:ListItem Value="11">NOV</asp:ListItem>
                                                    <asp:ListItem Value="12">DEC</asp:ListItem>
                                                </asp:DropDownList>
                                                <b></b>
                                                <asp:DropDownList id="DropDownFYear" runat="server" Width="53px">
                                                    <asp:ListItem Selected="True" Value="2005">2005</asp:ListItem>
                                                    <asp:ListItem Value="2006">2006</asp:ListItem>
                                                    <asp:ListItem Value="2007">2007</asp:ListItem>
                                                    <asp:ListItem Value="2008">2008</asp:ListItem>
                                                    <asp:ListItem Value="2009">2009</asp:ListItem>
                                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                To</td>
                                            <td align="right">
                                                <asp:DropDownList id="DropDownTDay" runat="server" Width="53px">
                                                    <asp:ListItem Value="01">01</asp:ListItem>
                                                    <asp:ListItem Value="02">02</asp:ListItem>
                                                    <asp:ListItem Value="03">03</asp:ListItem>
                                                    <asp:ListItem Value="04">04</asp:ListItem>
                                                    <asp:ListItem Value="05">05</asp:ListItem>
                                                    <asp:ListItem Value="06">06</asp:ListItem>
                                                    <asp:ListItem Value="07">07</asp:ListItem>
                                                    <asp:ListItem Value="08">08</asp:ListItem>
                                                    <asp:ListItem Value="09">09</asp:ListItem>
                                                    <asp:ListItem Value="10">10</asp:ListItem>
                                                    <asp:ListItem Value="11">11</asp:ListItem>
                                                    <asp:ListItem Value="12">12</asp:ListItem>
                                                    <asp:ListItem Value="13">13</asp:ListItem>
                                                    <asp:ListItem Value="14">14</asp:ListItem>
                                                    <asp:ListItem Value="15">15</asp:ListItem>
                                                    <asp:ListItem Value="16">16</asp:ListItem>
                                                    <asp:ListItem Value="17">17</asp:ListItem>
                                                    <asp:ListItem Value="18">18</asp:ListItem>
                                                    <asp:ListItem Value="19">19</asp:ListItem>
                                                    <asp:ListItem Value="20">20</asp:ListItem>
                                                    <asp:ListItem Value="21">21</asp:ListItem>
                                                    <asp:ListItem Value="22">22</asp:ListItem>
                                                    <asp:ListItem Value="23">23</asp:ListItem>
                                                    <asp:ListItem Value="24">24</asp:ListItem>
                                                    <asp:ListItem Value="25">25</asp:ListItem>
                                                    <asp:ListItem Value="26">26</asp:ListItem>
                                                    <asp:ListItem Value="27">27</asp:ListItem>
                                                    <asp:ListItem Value="28">28</asp:ListItem>
                                                    <asp:ListItem Value="29">29</asp:ListItem>
                                                    <asp:ListItem Value="30">30</asp:ListItem>
                                                    <asp:ListItem Value="31">31</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList id="DropDownTMon" runat="server" Width="53px">
                                                    <asp:ListItem Value="01">JAN</asp:ListItem>
                                                    <asp:ListItem Value="02">FEB</asp:ListItem>
                                                    <asp:ListItem Value="03">MAR</asp:ListItem>
                                                    <asp:ListItem Value="04">APR</asp:ListItem>
                                                    <asp:ListItem Value="05">MAY</asp:ListItem>
                                                    <asp:ListItem Value="06">JUN</asp:ListItem>
                                                    <asp:ListItem Value="07">JUL</asp:ListItem>
                                                    <asp:ListItem Value="08">AUG</asp:ListItem>
                                                    <asp:ListItem Value="09">SEP</asp:ListItem>
                                                    <asp:ListItem Value="10">OCT</asp:ListItem>
                                                    <asp:ListItem Value="11">NOV</asp:ListItem>
                                                    <asp:ListItem Value="12">DEC</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:DropDownList id="DropDownTYear" runat="server" Width="53px">
                                                    <asp:ListItem Selected="True" Value="2005">2005</asp:ListItem>
                                                    <asp:ListItem Value="2006">2006</asp:ListItem>
                                                    <asp:ListItem Value="2007">2007</asp:ListItem>
                                                    <asp:ListItem Value="2008">2008</asp:ListItem>
                                                    <asp:ListItem Value="2009">2009</asp:ListItem>
                                                    <asp:ListItem Value="2010">2010</asp:ListItem>
                                                    <asp:ListItem Value="2011">2011</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <br />
                                <asp:ImageButton id="FindButton" onclick="FindButton_Click" runat="server" ImageUrl="images\commond\images08.gif"></asp:ImageButton>
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
