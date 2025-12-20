<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentDownloadDetail.aspx.vb" Inherits="Student_StudentDownloadDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Download Detail</title>
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
                </td>
            </tr>
            <tr height="30" style="font-weight:bold;">
                <td colspan="2">รายละเอียดของเอกสารสำหรับการดาวน์โหลด</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="580">
                <td valign="top">
                    <asp:SqlDataSource ID="downloadDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT [lrnc_id], [lrnc_topic], [lrnc_description], [lrnc_writer], [lrnc_date], [lrnc_year], [lrnc_term] FROM [LearningContent] WHERE ([lrnc_id] = @lrnc_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="lrnc_id" QueryStringField="lrnc_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="fileDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT [lrnc_id], [lrnf_id], [lrnf_name], [lrnf_path] FROM [LearningFile] WHERE ([lrnc_id] = @lrnc_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="lrnc_id" QueryStringField="lrnc_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="lrnc_id" DataSourceID="downloadDTS" BackColor="PaleGoldenrod" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                        <ItemTemplate>
                            <table width="750">
                                <tr align="center" style="font-weight:bold">
                                    <td colspan="2">
                                        หัวข้อ : <asp:Label ID="lrnc_topicLabel" runat="server" Text='<%# Eval("lrnc_topic") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td rowspan="4" width="200" valign="top">
                                        ปีการศึกษา <asp:Label ID="lrnc_yearLabel" runat="server" Text='<%# Eval("lrnc_year") %>'></asp:Label>
                                        <br />
                                        ภาคการศึกษาที่ <asp:Label ID="lrnc_termLabel" runat="server" Text='<%# Eval("lrnc_term") %>'></asp:Label>
                                    </td>
                                    <td align="right">
                                        วัน/เดือน/ปี ที่ประกาศ : <asp:Label ID="lrnc_dateLabel" runat="server" Text='<%# Eval("lrnc_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr height="100" bgcolor="white">
                                    <td align="left"><asp:Label ID="lrnc_descriptionLabel" runat="server" Text='<%# Eval("lrnc_description") %>'></asp:Label></td>
                                </tr>
                                <tr bgcolor="white">
                                    <td align="left">
                                        <asp:DataList ID="DataList2" runat="server" DataKeyField="lrnf_id" DataSourceID="fileDTS">
                                            <ItemTemplate>
                                                ไฟล์ดาวน์โหลด : <%#"<a href=../" & Container.DataItem("lrnf_path") & ">" & _
                                                            Container.DataItem("lrnf_name") & "</a>"%><br /><br />
                                            </ItemTemplate>
                                        </asp:DataList></td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td align="right" height="30">ผู้ประกาศ : <asp:Label ID="lrnc_writerLabel" runat="server" Text='<%# Eval("lrnc_writer") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle BackColor="Tan" />
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <AlternatingItemStyle BackColor="PaleGoldenrod" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    </asp:DataList></td>
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
