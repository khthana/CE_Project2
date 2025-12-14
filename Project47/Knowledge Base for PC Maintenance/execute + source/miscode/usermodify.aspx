<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc,UStatus
    Dim MaxId As Integer
    Dim TmpError As String

    Sub Page_Init()
        GetSession()
        Clear_All()
        getinfo()
        Msg.Visible = "false"
    End Sub

    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID) then
            GetSession() 'Get UName , UStatus
            Requests()
            Search()
            History()
            menu1.visible = true
            menu2.visible = false
            menu3.visible = false
            ShowUser.Text = UName
            due.text = Format(today, "dddd d MMMM yyyy")
            if(Session.Contents("Refx") <> "4") then
               Clear_All()
               getinfo()
               Msg.Visible = "false"
               session("Refx") = 4
            end if
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


    'start program

    sub getinfo()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
            queryString = "SELECT Name AS Expr1, Login AS Expr2, Password AS Expr3, Department_ID AS Expr4, Section_ID AS Expr5, Location_ID AS Expr6, Tel AS Expr7, Email AS Expr8 " & _
                          "FROM T_Users " & _
                          "WHERE (User_ID = " & UId & ")"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            dataReader.Read()
                Dim xx() as String
                Dim xxx As String
                xxx = dataReader.GetString(0).Replace("  ", ":")
                'msgbox(dataReader.GetString(0))
                xx = xxx.Split(":")
                MyFirstName.Text = xx(0)
                MyLastName.Text = xx(1)
                Unamex.Text = dataReader.GetString(1)
                QueryAllDepartment(dataReader.GetInt32(3))
                QueryAllSection(dataReader.GetInt32(4))
                QueryAllLocation(dataReader.GetInt32(5))
                Utelx.Text = dataReader.GetString(6)
                UEmailx.Text = dataReader.GetString(7)
    end sub

    sub QueryAllDepartment(sel as integer)
            DropDownList1.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Department_ID,Department FROM [T_Department]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownList1.Items.Add(New ListItem( Trim(dataReader.GetString(1)),dataReader.GetInt32(0)))
                if(dataReader.GetInt32(0) = sel) then
                    DropDownList1.Items((DropDownList1.Items.Count)-1).Selected = True
                end if
            end while
    end sub

    sub QueryAllSection(sel as integer)
            DropDownList2.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Section_ID,Section FROM [T_Section]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownList2.Items.Add(New ListItem( Trim(dataReader.GetString(1)),dataReader.GetInt32(0)))
                if(dataReader.GetInt32(0) = sel) then
                    DropDownList2.Items((DropDownList2.Items.Count)-1).Selected = True
                end if
            end while
    end sub

    sub QueryAllLocation(sel as integer)
            DropDownList3.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Location_ID,Location FROM T_Location"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownList3.Items.Add(New ListItem( Trim(dataReader.GetString(1)),dataReader.GetInt32(0)))
                if(dataReader.GetInt32(0) = sel) then
                    DropDownList3.Items((DropDownList3.Items.Count)-1).Selected = True
                end if
            end while
    end sub

    Sub Submit_Click(sender As Object, e As EventArgs)

        Dim queryStringx As String
        'if( checkPassword(Curpassword.Text) > 0 )then
            if(UPass.Text = RePass.Text) then
                if( checkname(myFirstName.Text & "  " & myLastName.Text ) = 0 )then
                   if( checklogin(UNamex.Text) = 0 )then
                'msgbox(Unamex.Text)
                        if (UPass.Text <> "" and  RePass.Text <> "") then
                            queryStringx = "UPDATE T_Users " & _
                                           "SET Login = N'" & Unamex.Text & "', Password = N'" & UPass.Text & "', Name = N'" & MyFirstName.Text & "  " & MyLastName.Text & "', " & _
                                           "Department_ID = " & DropDownList1.SelectedItem.Value & ", Section_ID = " & DropDownList2.SelectedItem.Value & ", " & _
                                           "Location_ID = " & DropDownList3.SelectedItem.Value & ", Tel = N'" & UTelx.Text & "', Email = N'" & UEmailx.Text & "' " & _
                                           "WHERE (User_ID = " & UId  & ")"
                            'msgbox(queryStringx)
                        else
                            queryStringx = "UPDATE T_Users " & _
                                           "SET Login = N'" & Unamex.Text & "', Name = N'" & MyFirstName.Text & "  " & MyLastName.Text & "', " & _
                                           "Department_ID = " & DropDownList1.SelectedItem.Value & ", Section_ID = " & DropDownList2.SelectedItem.Value & ", " & _
                                           "Location_ID = " & DropDownList3.SelectedItem.Value & ", Tel = N'" & UTelx.Text & "', Email = N'" & UEmailx.Text & "' " & _
                                           "WHERE (User_ID = " & UId  & ")"
                            'msgbox(queryStringx)
                        end if
                        Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
                        Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)
                        Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                        dbCommand.CommandText = queryStringx
                        dbCommand.Connection = dbConnection
                        Dim rowsAffected As Integer = 0
                        dbConnection.Open
                        Try
                            rowsAffected = dbCommand.ExecuteNonQuery
                        Finally
                            dbConnection.Close
                        End Try
                        Response.Redirect("default.aspx")
                    end if
                 end if
             end if
         'end if


    End Sub


    function checkPassword(pass As String)' as Integer

            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
            queryString = "SELECT User_ID FROM T_Users " & _
                          "WHERE (User_ID = " & UId & ") AND (Password = N'" & pass & "')"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Dim cc As Integer = 0

            while(dataReader.Read())
                cc = cc + dataReader.GetInt32(0)
            end while
            return cc
    end function

    function checkname(pass As String)' as Integer

            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
            queryString = "SELECT     COUNT(User_ID) AS Expr1 " & _
                          "FROM         T_Users " & _
                          "WHERE     (Name = N'" & pass & "') AND (User_ID <> " & UId & ") "

            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Dim cc As Integer = 0

            while(dataReader.Read())
                cc = cc + dataReader.GetInt32(0)
            end while
            return cc
    end function

    function checklogin(pass As String)' as Integer

            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String
            queryString = "SELECT     COUNT(User_ID) AS Expr1 " & _
                          "FROM         T_Users " & _
                          "WHERE     (Login = N'" & pass & "') AND (User_ID <> " & UId & ") "
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Dim cc As Integer = 0

            while(dataReader.Read())
                cc = cc + dataReader.GetInt32(0)
            end while
            return cc
    end function


    Sub Clear_All()
        MyFirstName.Text = ""
        MyLastName.Text = ""
        UNamex.Text = ""
        UPass.Text = ""
        RePass.Text = ""
        UTelx.Text = ""
        UEmailx.Text = ""
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
    <meta http-equiv="refresh" content="360;showalarm.aspx" />
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
    <center><asp:Label id="Label1" runat="server" visible="false"></asp:Label><asp:Label id="Label2" runat="server" visible="false"></asp:Label><asp:Label id="dir_sort" runat="server" visible="false"></asp:Label>
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
                                            <span class="style1"><font color="#ffffff"><span class="style1"><font color="#ffffff"><span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS" color="white"><font color="white" size="4">Essilor
                                            Manufacturing (Thailand) co.,ltd.<br />
                                            MIS Section</font>&nbsp;&nbsp;</font></font></span></font></span></font></span></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            <asp:ImageButton id="ButtonRefresh" runat="server" ImageUrl="images/refresh.gif" width="20" height="20" AlternateText="Refresh"></asp:ImageButton>
                                                            &nbsp;<span class="style1"><font face="Comic Sans MS" color="#ffffff">Queuing</font></span></td>
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
                                <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" AlternateText="Logout" Width="37px" Height="33px" src="images/commond/images03.gif"></asp:ImageButton>
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
                            <br />
                            <table style="WIDTH: 454px; HEIGHT: 272px" cellspacing="1" cellpadding="1" width="454" align="center" border="0">
                                <tbody>
                                    <tr>
                                        <td align="left" width="130">
                                            FirstName :</td>
                                        <td width="304">
                                            <asp:TextBox id="MyFirstName" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                        <td width="20">
                                            <asp:Label id="Label3" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            LastName :</td>
                                        <td>
                                            <asp:TextBox id="MyLastName" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label4" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Login :</td>
                                        <td>
                                            <asp:TextBox id="UNamex" runat="server" Width="250px" AutoPostBack="True"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label5" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            New Password :</td>
                                        <td>
                                            <asp:TextBox id="UPass" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Re New Password :
                                        </td>
                                        <td>
                                            <asp:TextBox id="RePass" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Department&nbsp;:</td>
                                        <td>
                                            <asp:DropDownList id="DropDownList1" runat="server" Width="256px"></asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label id="Label8" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Section :</td>
                                        <td>
                                            <asp:DropDownList id="DropDownList2" runat="server" Width="256px" Height="193px"></asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label id="Label9" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Location :
                                        </td>
                                        <td>
                                            <asp:DropDownList id="DropDownList3" runat="server" Width="256px"></asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label id="Label10" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Telephone :</td>
                                        <td>
                                            <asp:TextBox id="UTelx" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label11" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            Email :
                                        </td>
                                        <td>
                                            <asp:TextBox id="UEmailx" runat="server" Width="250px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label12" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="COLOR: white" align="left">
                                            Current Password :</td>
                                        <td>
                                            <asp:TextBox id="CurPassword" runat="server" Width="250px" TextMode="Password" Visible="False"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label13" runat="server" visible="False" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td align="middle" colspan="3">
                                            <p align="center">
                                                <asp:Button id="Submit" onclick="Submit_Click" runat="server" Text="Submit"></asp:Button>
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <p>
                                <asp:Label id="Msg" runat="server" width="206px" forecolor="Red"></asp:Label>
                                <asp:CompareValidator id="comp1" runat="server" ControlToValidate="UPass" ErrorMessage="Password miss match" ControlToCompare="RePass" Operator="Equal"></asp:CompareValidator>
                                <asp:RegularExpressionValidator id="ereq" runat="server" ControlToValidate="UEmailx" ErrorMessage="Invalid Email" ValidationExpression="[\w-]+@[\w-]+\.(com|net|org|co\.th|ac\.th|or\.th|go\.th)"></asp:RegularExpressionValidator>
                            </p>
                            <p>
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
