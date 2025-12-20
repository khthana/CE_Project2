<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SearchTopicWB.aspx.vb" Inherits="SearchTopicWebboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Topic Webboard Searching</title>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" background="Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <table width="800" align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" style="border:0px;text-align:center;">
            <tr height="150" valign="top">
                <td colspan="2" width="800" height="150"><img src="Image/colorfull.jpg" border="0px" width="800" height="150" /></td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                <td>:: ผลการค้นหากระทู้ ::</td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr>
                <td><asp:Label id="Warning2" runat="server" ForeColor="Red"></asp:Label>
                    <asp:GridView ID="GridView1" Width="800px" runat="server" AllowPaging="True" PageSize="20" AutoGenerateColumns="False"
                        CellPadding="4" DataKeyNames="top_id" ForeColor="#333333"
                        GridLines="None">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <Columns>
                            <asp:BoundField DataField="top_id" HeaderText="เลขกระทู้" InsertVisible="False" ReadOnly="True"
                                SortExpression="top_id" >
                                <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="top_id" DataNavigateUrlFormatString="DetailWB.aspx?top_id={0}"
                                DataTextField="top_name" HeaderText="หัวข้อกระทู้" SortExpression="top_name"
                                Target="_blank" >
                                <ControlStyle Width="300px" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="top_writer" HeaderText="ผู้ตั้งกระทู้" SortExpression="top_writer" >
                                <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="top_nreplier" HeaderText="จำนวนผู้ตอบกระทู้" SortExpression="top_nreplier" >
                                <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="top_nreader" HeaderText="จำนวนผู้อ่านกระทู้" SortExpression="top_nreader" >
                                <ControlStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="top_name" HeaderText="top_name" SortExpression="top_name"
                                Visible="False" />
                            <asp:BoundField DataField="top_type" HeaderText="top_type" SortExpression="top_type"
                                Visible="False" />
                            <asp:BoundField DataField="top_date" HeaderText="top_date" SortExpression="top_date"
                                Visible="False" />
                            <asp:BoundField DataField="top_email" HeaderText="top_email" SortExpression="top_email"
                                Visible="False" />
                            <asp:BoundField DataField="top_content" HeaderText="top_content" SortExpression="top_content"
                                Visible="False" />
                            <asp:BoundField DataField="top_ip" HeaderText="top_ip" SortExpression="top_ip" Visible="False" />
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <HeaderStyle BackColor="#FF9933" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                </td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr>
                <td><asp:Button ID="back" runat="server" Text="ย้อนกลับ" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" /></td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr height="70" bgcolor="#cccccc">
                <td colspan="2">
                    <span style="font-size: 10pt; color: #000080; font-family: MS Sans Serif">
                        Developed by Ant + Namtan<br />
                        Department of Computer Engineering Faculty of Engineering<br />
                        King Mongkut's Institute of Technology Ladkrabang BKK 10520, Thailand.</span></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
