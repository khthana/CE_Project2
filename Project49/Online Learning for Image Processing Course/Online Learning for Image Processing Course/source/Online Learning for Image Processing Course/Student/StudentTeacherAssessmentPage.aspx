<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentTeacherAssessmentPage.aspx.vb" Inherits="Student_StudentTeacherAssessmentPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Teacher Assessment Page</title>
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
            <tr height="10"><td></td></tr>
            <tr height="30" bgcolor="#ff9933" style="font-weight:bold;color:White">
                <td colspan="2">:: ระบบสมาชิกประเภทผู้เรียน ::</td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr style="font-weight:bold">
                <td colspan="2">
                    <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [std_name] FROM [Student] WHERE ([std_id] = @std_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList3" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="std_nameLabel" runat="server" Text='<%# Eval("std_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <%--<tr height="30" style="font-weight:bold;">
                <td colspan="2">การประเมินผู้สอน</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>--%>
            <tr>
                <td valign="top" style="font-weight:bold;">
                    <asp:SqlDataSource ID="detailDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="select s.sub_id, s.sub_name, t.tch_name from subject s, teacher t 
                            where s.sub_id in (select sub_id 
                            from result where reg_id = (SELECT reg_id FROM [register] 
                            WHERE reg_year = (SELECT MAX(reg_year) FROM [register]) 
                            and reg_term = (select max(reg_term) from register 
                            where reg_year = (select max(reg_year) from register)) 
                            and ([std_id] = @std_id))) and ([sub_id] = @sub_id) and s.tch_id=t.tch_id">
                        <SelectParameters>
                            <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                            <asp:QueryStringParameter Name="sub_id" QueryStringField="sub_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="sub_id" DataSourceID="detailDTS">
                        <ItemTemplate>
                            การประเมินผู้สอน วิชา <asp:Label ID="sub_nameLabel" runat="server" Text='<%# Eval("sub_name") %>'></asp:Label>
                             (<asp:Label ID="sub_idLabel" runat="server" Text='<%# Eval("sub_id") %>'></asp:Label>)
                             ผู้สอนคือ 
                            <asp:Label ID="tch_nameLabel" runat="server" Text='<%# Eval("tch_name") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:DataList></td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr>
                <td>
                    <asp:PlaceHolder ID="holder" runat="server"></asp:PlaceHolder>
                </td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr>
                <td>
                    หมายเหตุ : 5 = ดีมาก , 4 = ดี , 3 = ปานกลาง , 2 = พอใช้ , 1 = ต้องปรับปรุง , 9 = ไม่สามารถประเมินได้
                </td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr>
                <td>
                    <asp:Button ID="submit" runat="server" Text="ตกลง" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" />
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
