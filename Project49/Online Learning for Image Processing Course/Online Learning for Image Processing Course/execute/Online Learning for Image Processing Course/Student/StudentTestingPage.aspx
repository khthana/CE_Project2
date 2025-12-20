<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentTestingPage.aspx.vb" Inherits="Student_StudentTestingPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Testing Page</title>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <table width="800" align="center" bgcolor="white" border="0" cellpadding="0" cellspacing="0" style="border:0px;text-align:center;">
            <tr height="150" valign="top">
                <td colspan="3" width="800" height="150"><img src="../Image/colorfull.jpg" border="0px" width="800" height="150" /></td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr height="30" bgcolor="#ff9933" style="font-weight:bold;color:White">
                <td colspan="3">
                    :: ระบบสมาชิกประเภทผู้เรียน ::</td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr style="font-weight:bold">
                <td colspan="3">
                    <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [std_name] FROM [Student] WHERE ([std_id] = @std_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="std_nameLabel" runat="server" Text='<%# Eval("std_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr height="30" style="font-weight:bold">
                <td colspan="3">เข้าสู่การทดสอบ</td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr>
                <td colspan="3" align="center" style="font-weight:bold">
                    <asp:Label ID="title" runat="server"></asp:Label><br />
                    <asp:Label ID="showtime" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="StartTesting" runat="server" Text="เริ่มทำข้อสอบ" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                </td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr>
                <td width="150">&nbsp;</td>
                <td align="left" width="450">
                    <asp:PlaceHolder ID="hold" runat="server" Visible="False"></asp:PlaceHolder>
                </td>
                <td width="150">&nbsp;</td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr>
                <td colspan="3">
                    <asp:Button ID="submit" runat="server" Text="เสร็จ" Visible="False" Width="90px" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
                </td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr height="70" bgcolor="#cccccc">
                <td colspan="3">
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
