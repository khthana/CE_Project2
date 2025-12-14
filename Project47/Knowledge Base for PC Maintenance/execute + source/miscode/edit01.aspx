<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UNamex ,UIdx ,UTelx ,UDepx ,USecx ,ULocx,UStatus

    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID) then
            GetSession() 'Get UName , UStatus
             Requests()
            Search()
            History()
            edit()

            menu1.visible = false
            menu2.visible = false
            menu3.visible = false
            menu4.visible = true

            RegNewSession()'Register New Session Value

            ShowUser.Text = UNamex
            Label1.Visible = false
            Label2.Visible = false


            due.text = Format(today, "dddd d MMMM yyyy")
        else
            Response.Redirect("default.aspx")
        end if
    End Sub 'Page_Load

    Sub GetSession()
        UIdx = Trim(Session.Contents("UId"))
        UNamex = Trim(Session.Contents("UName"))
        UTelx = Trim(Session.Contents("UTel"))
        UDepx = Trim(Session.Contents("UDep"))
        USecx = Trim(Session.Contents("USec"))
        ULocx = Trim(Session.Contents("ULoc"))
        UStatus = Trim(Session.Contents("UStatus"))
        RegNewSession()
    End Sub

    Sub RegNewSession()
        Session("UId") = UIdx
        Session("UName") = UNamex
        Session("UTel") = UTelx
        Session("UDep") = UDepx
        Session("USec") = USecx
        Session("ULoc") = ULocx
        Session.Contents("UStatus") = UStatus
        Session("SIDD") = Session.Contents("SIDD")
    End Sub

    Dim MaxId As Integer
    Dim TmpError As String

    Sub Page_Init()
        Clear_All()
        QueryAllDepartment()
        QueryAllSection()
        QueryAllLocation()
        Msg.Visible = "false"
    End Sub

    Sub Page_Load()

        TmpError = ""
    End Sub

    sub QueryAllSection()
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
            end while
    end sub

    sub QueryAllDepartment()
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
            end while
    end sub

    sub QueryAllLocation()
            DropDownList3.Items.Clear()
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Location_ID,Location FROM [T_Location]"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection
            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            while(dataReader.Read())
                DropDownList3.Items.Add(New ListItem( Trim(dataReader.GetString(1)),dataReader.GetInt32(0)))
            end while
    end sub

    Sub Submit_Click(sender As Object, e As EventArgs)
        TmpError = ""
        if (MyFirstName.Text = "") then
            TmpError = TmpError + " FirstName "
        end if
        if (MyLastName.Text = "") then
            TmpError = TmpError + " LastName "
        end if
        if (UName.Text = "") then
            TmpError = TmpError + " Login "
        end if
        if (UPass.Text = "" or RePass.Text = "") then
            TmpError = TmpError + " Password "
            UPass.Text = ""
            RePass.Text = ""
        end if
        if (UTel.Text = "") then
            TmpError = TmpError + " Telephone"
        end if
        if (UEmail.Text = "") then
            TmpError = TmpError + " Email"
        end if
        if (TmpError = "") then

            Dim dataReader As System.Data.IDataReader = QueryMaxId()
            dataReader.Read()
            Session("UName") = UName.text
            Session("UPass") = UPass.text
            try
                MaxId = dataReader.GetInt32(0)+1
            catch ex As Exception
                MaxId = 1
            Finally
                Dim loginReader As System.Data.IDataReader = QueryLogin()
                loginReader.Read()
                Try
                    loginReader.GetString(0)
                    Msg.Text = "UName Ready to use !!!"
                    UName.Text = ""
                Catch ex As Exception
                    loginReader = QueryName()
                    loginReader.Read()
                    Try
                        loginReader.GetString(0)
                        Msg.Text = "FirstName and LastName Ready to use !!!"
                        MyFirstName.Text = ""
                        MyLastName.Text = ""
                    Catch ex2 As Exception
                        Msg.Text = ""
                        RegisterUser()
                        Clear_All()
                        Response.Redirect("edit02.aspx")
                    End Try
                End Try
            End Try

        else
            Msg.Text = "Enter " + TmpError
        end if
        Msg.visible = true
    End Sub

    Sub Clear_All()
        MyFirstName.Text = ""
        MyLastName.Text = ""
        UName.Text = ""
        UPass.Text = ""
        RePass.Text = ""
        UTel.Text = ""
        UEmail.Text = ""
    End Sub

    Function RegisterUser()

            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "INSERT INTO T_Users (User_ID, Login, Password, Name, Department_ID, Section_ID, Location_ID, Tel, Email"& _
    ", Status) VALUES ('"& MaxId &"', '"+UName.Text+"', '"+UPass.Text+"', '"+MyFirstName.Text+ "  "+ mylastName.text +"', '"+DropDownList1.SelectedItem.Value +"', '"+DropDownList2.SelectedItem.Value+"','"+DropDownList3.SelectedItem.Value+"',  '"+UTel.Text+"', "& _
    "'"+UEmail.Text+"', '" + DropDownList4.SelectedItem.Value + "')"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim rowsAffected As Integer = 0
            dbConnection.Open
            Try
                rowsAffected = dbCommand.ExecuteNonQuery
            Finally
                dbConnection.Close
            End Try

    End Function

    Function QueryMaxId() As System.Data.IDataReader
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT MAX(User_ID) FROM T_Users"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

            Return dataReader
    End Function


    Function QueryLogin() As System.Data.IDataReader
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Login FROM T_Users WHERE Login='"+UName.Text+"'"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            dbConnection.Open

            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

            Return dataReader
    End Function

    Function QueryName() As System.Data.IDataReader
            Dim connectionString As String ="server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT Login FROM T_Users WHERE Name='"+MyFirstName.Text+ "  "+ mylastName.text +"'"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            dbConnection.Open
            Dim dataReader As System.Data.IDataReader = dbCommand.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

            Return dataReader
    End Function

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
    <meta http-equiv="refresh" content="360;request02.aspx" />
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
        <asp:Image id="Image3" style="Z-INDEX: 104; LEFT: 0px; POSITION: absolute; TOP: 0px" runat="server" ImageUrl="/images/adminstars.gif" Visible="true"></asp:Image>
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
                                            <span class="style1"><font color="#ffffff"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS" color="white"><font color="white" size="4"><span class="style1"><font color="red" size="4"><font face="Comic Sans MS"><font color="yellow" size="4">Essilor
                                            Manufacturing (Thailand) co.,ltd.<br />
                                            MIS Section</font>&nbsp;</font></font><font face="Times New Roman" color="#000000" size="2">&nbsp;</font></span></font>&nbsp;&nbsp;</font></font></span></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader_admin.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            &nbsp;<font face="Comic Sans MS" color="#ffff00" size="2">Queuing</font></td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" font-names="Comic Sans MS" forecolor="Yellow"></asp:Label></td>
                                                        <td align="right" width="120" colspan="2">
                                                            <asp:Label id="showUser" runat="server" font-names="Comic Sans MS" forecolor="Yellow"></asp:Label>&nbsp;</td>
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
                            <p>
                                <asp:table id="menu1" runat="server" visible="false" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#1F1FE2"></asp:table>
                                <asp:table id="menu2" runat="server" visible="false" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#1F1FE2"></asp:table>
                                <asp:table id="menu3" runat="server" visible="false" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#1F1FE2"></asp:table>
                                <asp:table id="menu4" runat="server" visible="false" Width="95" Border="0" CellPadding="0" CellSpacing="0" BackColor="#1F1FE2"></asp:table>
                                <br />
                                <hr />
                                <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" Width="37px" Height="33px" src="images/commond/images03.gif" AlternateText="Logout"></asp:ImageButton>
                                <br />
                                <font face="Comic Sans MS" color="yellow">Logout</font>
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
                            </p>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <table style="WIDTH: 454px; HEIGHT: 272px" cellspacing="1" cellpadding="1" width="454" align="center" border="0">
                                <tbody>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left" width="100">
                                            FirstName :</td>
                                        <td width="304">
                                            <asp:TextBox id="MyFirstName" runat="server" Width="194px"></asp:TextBox>
                                        </td>
                                        <td width="50">
                                            <asp:Label id="Label5" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            LastName :</td>
                                        <td>
                                            <asp:TextBox id="MyLastName" runat="server" Width="194px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label6" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            Login :</td>
                                        <td>
                                            <asp:TextBox id="UName" runat="server" Width="194px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label7" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            Password :</td>
                                        <td>
                                            <asp:TextBox id="UPass" runat="server" Width="194px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label8" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            Re Password :
                                        </td>
                                        <td>
                                            <asp:TextBox id="RePass" runat="server" Width="194px" TextMode="Password"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label9" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            Department&nbsp;:</td>
                                        <td>
                                            <asp:DropDownList id="DropDownList1" runat="server" Width="200px"></asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label id="Label10" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            Section :</td>
                                        <td>
                                            <asp:DropDownList id="DropDownList2" runat="server" Width="200px"></asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label id="Label11" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            Location :
                                        </td>
                                        <td>
                                            <asp:DropDownList id="DropDownList3" runat="server" Width="200px"></asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label id="Label12" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            Telephone :</td>
                                        <td>
                                            <asp:TextBox id="UTel" runat="server" Width="194px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label13" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left">
                                            Email :
                                        </td>
                                        <td>
                                            <asp:TextBox id="UEmail" runat="server" Width="194px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Label id="Label14" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="left" colspan="1">
                                            Status :</td>
                                        <td>
                                            <asp:DropDownList id="DropDownList4" runat="server" Width="200px">
                                                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                                <asp:ListItem Value="MIS">Mis</asp:ListItem>
                                                <asp:ListItem Value="User">User</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>
                                            <asp:Label id="Label3" runat="server" forecolor="Red">***</asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td colspan="3">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                        <td align="middle" colspan="3">
                                            <p align="center">
                                                <asp:Button id="Submit" onclick="Submit_Click" runat="server" Text="Submit"></asp:Button>
                                                &nbsp;&nbsp;
                                                <input style="WIDTH: 60px; HEIGHT: 24px" type="reset" size="23" value="Reset" />
                                            </p>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <asp:Label id="Msg" runat="server" forecolor="Red" width="36px"></asp:Label>
                            <asp:CompareValidator id="comp1" runat="server" ControlToValidate="UPass" ErrorMessage="Password miss match" ControlToCompare="RePass" Operator="Equal"></asp:CompareValidator>
                            <asp:RegularExpressionValidator id="ereq" runat="server" ControlToValidate="UEmail" ErrorMessage="Invalid Email" ValidationExpression="[\w-]+@[\w-]+\.(com|net|org|co\.th|ac\.th|or\.th|go\.th)"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
