<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LearningCalendar.aspx.vb" Inherits="LearningCalendar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Learning Calendar</title>
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
            <tr height="10"><td></td></tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="CalendarDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT * FROM [LearningCalendar] WHERE cal_year = (SELECT MAX(cal_year) FROM [LearningCalendar]) AND cal_term = (SELECT MAX(cal_term) FROM [LearningCalendar] WHERE cal_year = (SELECT MAX(cal_year) FROM [LearningCalendar]))">
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="cal_id" DataSourceID="CalendarDTS">
                        <ItemTemplate>
                            <table align="center" width="750" style="font-weight:normal">
                                <tr align="center">
                                    <td colspan="2" bgcolor="#00cc00" style="color:White;font-weight:bold">:: ปฏิทินการศึกษา ::<br />
                                        ปีการศึกษา <asp:Label ID="Label1" runat="server" Text='<%# Eval("cal_year") %>'></asp:Label>
                                        &nbsp; ภาคการศึกษาที่ 
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("cal_term") %>'></asp:Label>
                                        
                                    </td>
                                </tr>
                                <tr><td colspan="2" height="10"></td></tr>
                                <tr align="center">
                                    <td width="375" bgcolor="#cc6633" style="color:White;font-weight:bold">กิจกรรม</td>
                                    <td width="375" bgcolor="#ff9933" style="color:White;font-weight:bold">วัน เดือน ปี</td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเริ่มต้นของการลงทะเบียนการศึกษา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_bregisterLabel" runat="server" Text='<%# Eval("cal_bregister") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันสุดท้ายของการลงทะเบียนการศึกษา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_eregisterLabel" runat="server" Text='<%# Eval("cal_eregister") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเปิดภาคการศึกษา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_btermLabel" runat="server" Text='<%# Eval("cal_bterm") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเริ่มต้นของการเพิ่มและเปลี่ยนรายวิชา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_bchangeLabel" runat="server" Text='<%# Eval("cal_bchange") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันสุดท้ายของการเพิ่มและเปลี่ยนรายวิชา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_echangeLabel" runat="server" Text='<%# Eval("cal_echange") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเริ่มต้นของการถอนรายวิชา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_bdropLabel" runat="server" Text='<%# Eval("cal_bdrop") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันสุดท้ายของการถอนรายวิชา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_edropLabel" runat="server" Text='<%# Eval("cal_edrop") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเริ่มต้นของการสอบปลายภาค<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_bexamLabel" runat="server" Text='<%# Eval("cal_bexam") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันสุดท้ายของการสอบปลายภาค<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_eexamLabel" runat="server" Text='<%# Eval("cal_eexam") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันปิดภาคการศึกษา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="cal_etermLabel" runat="server" Text='<%# Eval("cal_eterm") %>'></asp:Label><br /><br /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr height="10"><td></td></tr>
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
