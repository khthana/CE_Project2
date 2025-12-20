<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherViewTesting.aspx.vb" Inherits="Teacher_TeacherViewTesting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher View Testing</title>
<script src="../js/teacherbtn.js" language="javascript" type="text/javascript"></script>
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
                <td colspan="3">:: ระบบสมาชิกประเภทผู้สอน ::</td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr style="font-weight:bold">
                <td colspan="3">
                    <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [tch_name] FROM [Teacher] WHERE ([tch_id] = @tch_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="tch_nameLabel" runat="server" Text='<%# Eval("tch_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr height="30" style="font-weight:bold;">
                <td colspan="3">ตัวอย่างข้อสอบที่ได้สร้างไว้</td>
            </tr>
            <tr>
                <td colspan="3"><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td width="100"></td>
                <td valign="top" align="left">
                    <asp:PlaceHolder ID="hold" runat="server" ></asp:PlaceHolder>
                </td>
                <td width="100"></td>
            </tr>
            <tr height="10"><td colspan="3"></td></tr>
            <tr>
                <td colspan="3"><asp:Button ID="back" runat="server" Text="ย้อนกลับ" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" /></td>
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
