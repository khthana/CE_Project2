<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdminViewOldCalendar.aspx.vb" Inherits="Administrator_AdminViewOldCalendar" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Admin View Old Learning Calendar</title>
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
                <td colspan="2" width="800" height="150"><img src="../Image/colorfull.jpg" border="0px" width="800" height="150" /></td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="30" bgcolor="#ff9933" style="font-weight:bold;color:White">
                <td colspan="2">:: ระบบสมาชิกประเภทผู้ดูแลระบบ ::</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr style="font-weight:bold">
                <td colspan="2">
                    <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [adm_name] FROM [Administrator] WHERE ([adm_id] = @adm_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="adm_id" SessionField="user" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="adm_nameLabel" runat="server" Text='<%# Eval("adm_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr style="font-weight:bold;">
                <td colspan="2">ปฏิทินย้อนหลัง</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="yearDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT distinct [cal_year] FROM [LearningCalendar] order by cal_year desc">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="termDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [cal_term] FROM [LearningCalendar] WHERE ([cal_year] = @cal_year) ORDER BY [cal_term]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="yearDDL" Name="cal_year" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="detailDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT * FROM [LearningCalendar] WHERE (([cal_year] = @cal_year) AND ([cal_term] = @cal_term))">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="yearDDL" Name="cal_year" PropertyName="SelectedValue"
                                Type="Int32" />
                            <asp:ControlParameter ControlID="termDDL" Name="cal_term" PropertyName="SelectedValue"
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    ปีการศึกษา&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="yearDDL" runat="server" AutoPostBack="True" DataSourceID="yearDTS" DataTextField="cal_year" DataValueField="cal_year">
                    </asp:DropDownList>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    ภาคการศึกษา&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="termDDL" runat="server" AutoPostBack="True" DataSourceID="termDTS" DataTextField="cal_term" DataValueField="cal_term">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr>
                <td>
                    <asp:DataList ID="CalendarDTL" runat="server" DataKeyField="cal_id" DataSourceID="detailDTS" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                        <ItemTemplate>
                            <table>
                                <tr align="center">
                                    <td width="375" bgcolor="#cc6633" style="color:White;font-weight:bold"><br />กิจกรรม<br /><br /></td>
                                    <td width="375" bgcolor="#ff9933" style="color:White;font-weight:bold"><br />วัน เดือน ปี<br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเริ่มต้นของการลงทะเบียนการศึกษา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label1" runat="server" Text='<%# Eval("cal_bregister") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันสุดท้ายของการลงทะเบียนการศึกษา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label2" runat="server" Text='<%# Eval("cal_eregister") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเปิดภาคการศึกษา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label3" runat="server" Text='<%# Eval("cal_bterm") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเริ่มต้นของการเพิ่มและเปลี่ยนรายวิชา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label4" runat="server" Text='<%# Eval("cal_bchange") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันสุดท้ายของการเพิ่มและเปลี่ยนรายวิชา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label5" runat="server" Text='<%# Eval("cal_echange") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเริ่มต้นของการถอนรายวิชา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label6" runat="server" Text='<%# Eval("cal_bdrop") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันสุดท้ายของการถอนรายวิชา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label7" runat="server" Text='<%# Eval("cal_edrop") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันเริ่มต้นของการสอบปลายภาค<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label8" runat="server" Text='<%# Eval("cal_bexam") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันสุดท้ายของการสอบปลายภาค<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label9" runat="server" Text='<%# Eval("cal_eexam") %>'></asp:Label><br /><br /></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="palegoldenrod"><br />วันปิดภาคการศึกษา<br /><br /></td>
                                    <td bgcolor="lightgoldenrodyellow"><br /><asp:Label ID="Label10" runat="server" Text='<%# Eval("cal_eterm") %>'></asp:Label><br /><br /></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle BackColor="#CCCCCC" />
                        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <AlternatingItemStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    </asp:DataList> 
                </td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
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
