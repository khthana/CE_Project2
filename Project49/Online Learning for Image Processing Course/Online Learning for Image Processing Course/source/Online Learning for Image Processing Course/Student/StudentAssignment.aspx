<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentAssignment.aspx.vb" Inherits="Student_StudentAssignment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Assignment</title>
    <script src="../js/studentbtn.js" language="javascript" type="text/javascript"></script>
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
                <td colspan="2">:: ระบบสมาชิกประเภทผู้เรียน ::</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr style="font-weight:bold">
                <td colspan="2">
                    <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [std_name] FROM [Student] WHERE ([std_id] = @std_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="std_id" SessionField="user" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="std_nameLabel" runat="server" Text='<%# Eval("std_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold;" colspan="2"><asp:Label ID="title" runat="server"></asp:Label></td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr><td>
            <table width="600">
            <tr>
                <td colspan="2">
                    <asp:SqlDataSource ID="AssignmentTopicDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT * FROM [AssignmentTopic] WHERE ([ass_id] = @ass_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ass_id" QueryStringField="ass_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="AssignmentFileDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="select * from AssignmentFile where asst_id in (select asst_id from AssignmentTopic where ([ass_id] = @ass_id))">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ass_id" QueryStringField="ass_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DetailDTL" runat="server" BackColor="White" BorderColor="#CC9966" 
                        BorderStyle="None" BorderWidth="0px" CellPadding="4" DataKeyField="asst_id" 
                        DataSourceID="AssignmentTopicDTS" GridLines="Both">
                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                        <ItemTemplate>
                            <table width="550" border="1" bordercolor="#cccccc">
                                <tr align="center" height="30">
                                    <td width="150">หัวข้อ</td>
                                    <td width="400"><asp:Label ID="asst_topicLabel" runat="server" Text='<%# Eval("asst_topic") %>'></asp:Label></td>
                                </tr>
                                <tr align="center">
                                    <td valign="top">รายละเอียด</td>
                                    <td align="left"><asp:Label ID="asst_descriptionLabel" runat="server" Text='<%# Eval("asst_description") %>'></asp:Label></td>
                                </tr>
                                <tr align="center">
                                    <td valign="top">เอกสารประกอบ</td>
                                    <td>
                                        <asp:DataList ID="fileDTL" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="0px" CellPadding="4" DataKeyField="assf_id" DataSourceID="AssignmentFileDTS" GridLines="Both">
                                            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                            <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                                            <ItemTemplate>
                                                <%#"<a href=../" & Container.DataItem("assf_path") & " target=_self>" & Container.DataItem("assf_file") & "</a>"%>
                                            </ItemTemplate>
                                            <ItemStyle BackColor="White" ForeColor="#330099" />
                                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                                        </asp:DataList>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <ItemStyle BackColor="White" ForeColor="#330099" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td width="200">เลือกไฟล์สำหรับส่งงาน Assignment</td>
                <td width="400"><asp:FileUpload ID="AssFile" runat="server" Width="350px" /></td>
            </tr>
            <tr height="10"><td colspan="2">
                <asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td></tr>
            <tr>
                <td colspan="2"><asp:Button ID="submit" runat="server" Text="ส่งงาน Assignment" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="140px" /></td>
            </tr>
            </table></td></tr>
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
