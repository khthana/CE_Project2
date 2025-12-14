<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.Drawing.Color" %>
<%@ import Namespace="System.Data" %>
<%@ import Namespace="System.Data.OleDb" %>
<%@ import Namespace="System.Data.Odbc" %>
<%@ import Namespace="System.Data.SqlClient" %>
<script runat="server">

    dim UName ,UId ,UTel ,UDep ,USec ,ULoc ,UStatus
    
    Sub Page_Load(sender As Object, e As EventArgs)
        if (Session.Contents("SIDD") = Session.SessionID and Session.Contents("UStatus") = "admin") then
            GetSession()
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
    
    Sub ImageButton1_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("../default.aspx")
    End Sub
    
    Sub ImageButton2_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("register.aspx")
    End Sub
    
    Sub ImageButton3_Click(sender As Object, e As ImageClickEventArgs)
        Response.Redirect("controlpanel.aspx")
    End Sub

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
    <center><asp:Label id="Label1" visible="false" runat="server"></asp:Label><asp:Label id="Label2" visible="false" runat="server"></asp:Label><asp:Label id="dir_sort" visible="false" runat="server"></asp:Label> 
        <form name="form1" action="" method="post" runat="server">
            <table bordercolor="#000000" height="450" cellspacing="1" cellpadding="1" width="775" border="1">
                <tbody>
                    <tr>
                        <td colspan="2" height="65">
                            <table cellspacing="0" cellpadding="0" width="700" border="0">
                                <tbody>
                                    <tr>
                                        <td width="95" height="65" rowspan="2">
                                            <img height="65" src="images/images01.gif" width="95" /></td>
                                        <td width="673" background="images/images02.gif" height="45">
                                            <span class="style1"><font color="#ffffff">ESSILOR MANUFACTURING (THAILAND) CO., LTD.<br />
                                            MIS SECTION, LOGISTICS DEPARTMENT</font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="673" background="images/images02.gif" height="20">
                                            <table style="WIDTH: 673px; HEIGHT: 20px" height="20" cellspacing="0" cellpadding="0" width="673" border="0">
                                                <tbody>
                                                    <tr>
                                                        <td align="left" width="150">
                                                        </td>
                                                        <td align="middle">
                                                            <asp:Label id="Due" runat="server" forecolor="White">Administrators</asp:Label></td>
                                                        <td align="right" width="120">
                                                        </td>
                                                        <td align="right" width="30">
                                                            <asp:ImageButton id="ImageButton1" onclick="ImageButton1_Click" runat="server" height="20" width="20" src="images/images03.gif" AlternateText="Logout"></asp:ImageButton>
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
                            <p>
                            </p>
                            <p>
                                <asp:ImageButton id="ImageButton2" onclick="ImageButton2_Click" runat="server" ImageUrl="images/images04.gif"></asp:ImageButton>
                                <br />
                                <asp:Label id="Label4" runat="server" forecolor="White">New Administator</asp:Label>
                            </p>
                            <p>
                                <asp:ImageButton id="ImageButton3" onclick="ImageButton3_Click" runat="server" ImageUrl="images/images05.gif" Height="30px" Width="33px"></asp:ImageButton>
                                <br />
                                <asp:Label id="Label3" runat="server" forecolor="White">Control panal</asp:Label>
                            </p>
                        </td>
                        <td valign="top" align="middle" width="673" height="370">
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                            </p>
                            <p>
                                &nbsp;&nbsp;&nbsp; 
                                <br />
                            </p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
    </center>
</body>
</html>
