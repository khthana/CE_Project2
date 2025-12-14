<%@ Page Language="VB" ContentType="text/html" Debug="true" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Drawing.Color" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc,UStatus,Reference
    Sub Page_Load(Src As Object, E As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID) then
            GetSession()
            if UStatus <> "MIS" Then
                ButtonEdit.visible = "false"
            End If
            If IsPostBack=False Then
                Dim myDataSet As New DataSet()
                myDataSet = ShowRepeat1_2()
                myRepeater.DataSource = myDataSet
                myRepeater.DataBind
                myRepeater2.DataSource = myDataSet
                myRepeater2.DataBind
                ShowRepeat3()
            End If
            Requests()
            Search()
            History()
            menu1.visible = false
            menu2.visible = true
            menu3.visible = false
            ShowUser.Text = Session.Contents("UName")
            due.text = Format(today, "dddd d MMMM yyyy")
        else
            Response.Redirect("default.aspx")
        end if
    End Sub


    Sub GetSession()
        UId = Trim(Session.Contents("UId"))
        UName = Trim(Session.Contents("UName"))
        UTel = Trim(Session.Contents("UTel"))
        UDep = Trim(Session.Contents("UDep"))
        USec = Trim(Session.Contents("USec"))
        ULoc = Trim(Session.Contents("ULoc"))
        UStatus = Trim(Session.Contents("UStatus"))
        Reference = Session.Contents("Reference")
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

    Function ShowRepeat1_2() As System.Data.DataSet
            Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
            Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

            Dim queryString As String = "SELECT * FROM Request WHERE Ref = '" &Reference &"'"
            Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
            dbCommand.CommandText = queryString
            dbCommand.Connection = dbConnection

            Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
            dataAdapter.SelectCommand = dbCommand
            Dim dataSet As System.Data.DataSet = New System.Data.DataSet
            dataAdapter.Fill(dataSet)

            Return dataSet
    End Function


    Sub ShowRepeat3()
                 Reference = Session.Contents("Reference")
                 If IsPostBack=False Then
                    Dim connectionString As String = "server='(local)'; trusted_connection=true; database='misjob_order'"
                    Dim dbConnection As System.Data.IDbConnection = New System.Data.SqlClient.SqlConnection(connectionString)

                    Dim queryString As String = "SELECT * FROM Replys WHERE Ref = '" &Reference &"'"
                    Dim dbCommand As System.Data.IDbCommand = New System.Data.SqlClient.SqlCommand
                    dbCommand.CommandText = queryString
                    dbCommand.Connection = dbConnection

                    Dim dataAdapter As System.Data.IDbDataAdapter = New System.Data.SqlClient.SqlDataAdapter
                    dataAdapter.SelectCommand = dbCommand
                    Dim dataSet As System.Data.DataSet = New System.Data.DataSet
                    dataAdapter.Fill(dataSet)
                   myRepeater3.DataSource = dataSet
                   myRepeater3.DataBind
         End If
    End Sub



    Sub ButtonNew_Click(sender As Object, e As ImageClickEventArgs)
                Response.Redirect("request01.aspx") 'new.aspx
    End Sub

    Sub ButtonAlarm_Click(sender As Object, e As ImageClickEventArgs)
            Response.Redirect("request02.aspx") 'showalarm.aspx
    End Sub

    Sub ButtonEdit_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("searchedit.aspx")
    End Sub

    Sub ButtonLogout_Click(sender As Object, e As ImageClickEventArgs)
        Session("UName") = ""
        Session("PWord") = ""
        Response.Redirect("default.aspx")
    End Sub

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
                Response.Redirect("history03.aspx")
            else if (Sender.ID = "His04") then
                Response.Redirect("history04.aspx")
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
    <center><asp:Label id="label_hide" runat="server" visible="false"></asp:Label><asp:Label id="us_hide" runat="server" visible="false"></asp:Label>
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
                                            <span class="style1"><font color="#ffffff">ESSILOR MANUFACTURING (THAILAND) CO., LTD.<br />
                                            MIS SECTION, LOGISTICS DEPARTMENT</font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/bgheader.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                            <asp:ImageButton id="ButtonRefresh" runat="server" ImageUrl="images/refresh.gif" width="20" height="20" AlternateText="Refresh"></asp:ImageButton>
                                                            <asp:ImageButton id="ButtonEdit" onclick="ButtonEdit_Click" runat="server" ImageUrl="images/edit.JPG" width="20" height="20" AlternateText="Update"></asp:ImageButton>
                                                        </td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" forecolor="White"></asp:Label></td>
                                                        <td align="right" width="120">
                                                            <asp:Label id="showUser" runat="server" forecolor="White"></asp:Label></td>
                                                        <td align="right" width="30">
                                                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" width="20" height="20" AlternateText="Logout" src="images/commond/images03.gif"></asp:ImageButton>
                                                            &nbsp;</td>
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
                        <td valign="top" align="middle" width="95" bgcolor="#4f70c7" height="370">
                            <asp:table id="menu1" runat="server" visible="false" BackColor="#4f70c7" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <asp:table id="menu2" runat="server" visible="false" BackColor="#4f70c7" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                            <asp:table id="menu3" runat="server" visible="false" BackColor="#4f70c7" CellSpacing="0" CellPadding="0" Border="0" Width="95"></asp:table>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <table height="498" cellspacing="0" cellpadding="0" width="99%" border="0">
                                <tbody>
                                    <tr>
                                        <td valign="top" align="left" height="498">
                                            <asp:Repeater id="myRepeater" runat="server">
                                                <HeaderTemplate>
                                                    <b><u>Detail</u></b>
                                                    <table border="0">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td width="70">
                                                            <b>Reference # : </b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Ref") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Title: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Title") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Status: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Status") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Requester: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Request") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Department: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Department") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Section: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Section") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Location: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Location") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Telephon: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Tel") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Request Date: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Times") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Priority: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Priority") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Support By: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Reply") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Problem request: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Problem_req") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Problem Type: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Problem_rep") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Machine: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Machine") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Workstation: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Workstation") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Cost: &nbsp; &nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Cost") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td hight="2" bgcolor"#999999" width="100%"></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b> ==== REQUEST SERVICE ====</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Times") %>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            <asp:Repeater id="myRepeater2" runat="server">
                                                <HeaderTemplate>
                                                    <table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <b>&nbsp; &nbsp;</b></td>
                                                        <td>
                                                            <%# DataBinder.Eval(Container.DataItem, "Memo") %>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                    <hr />
                                                </FooterTemplate>
                                            </asp:Repeater>
                                            <asp:Repeater id="myRepeater3" runat="server">
                                                <HeaderTemplate>
                                                    <table border="0" cellpadding="0" cellspacing="0">
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <tr>
                                                        <td width="600">
                                                            <b>===== UPDATE =====</b>&nbsp; &nbsp;<%# DataBinder.Eval(Container.DataItem, "Times") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Reply By : : </b><%# DataBinder.Eval(Container.DataItem, "ReBy") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <b>Status : : </b><%# DataBinder.Eval(Container.DataItem, "Status") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td bgcolor="#839AD8">
                                                            &nbsp; &nbsp; <%# DataBinder.Eval(Container.DataItem, "Memo") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td height="15" bgcolor="#839AD8"></td>
                                                    </tr>
                                                </ItemTemplate>
                                                <FooterTemplate>
                                                    </table>
                                                    <hr />
                                                </FooterTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
