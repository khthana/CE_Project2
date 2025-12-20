<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AdministratorViewNews.aspx.vb" Inherits="Administrator_AdministratorViewNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Administrator View News</title>
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
                <td colspan="2">
                    :: ระบบสมาชิกประเภทผู้ดูแลระบบ ::</td>
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
            <tr height="30" style="font-weight:bold;">
                <td colspan="2">ตัวอย่างการประกาศข่าวสาร</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="580">
                <td valign="top">
                    <asp:SqlDataSource ID="NewsDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [new_id], [new_topic], [new_description], [new_writer], [new_date], [new_picpath] FROM [News] WHERE ([new_id] = @new_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="new_id" QueryStringField="new_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="fileDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT [new_id], [newf_id], [newf_name], [newf_path] FROM [NewsFile] WHERE ([new_id] = @new_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="new_id" QueryStringField="new_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="new_id" DataSourceID="NewsDTS" BackColor="PaleGoldenrod" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                        <ItemTemplate>
                            <table width="750">
                                <tr align="center" style="font-weight:bold" height="30">
                                    <td>เรื่อง : <asp:Label ID="new_topicLabel" runat="server" Text='<%# Eval("new_topic") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow" height="30">
                                    <td align="right">
                                        วัน/เดือน/ปี ที่ประกาศ : <asp:Label ID="new_dateLabel" runat="server" Text='<%# Eval("new_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr height="150">
                                    <td align="center"><%#"<img src=../" & Container.DataItem("new_picpath") & " align=middle />"%></td>
                                </tr>
                                <tr height="100" bgcolor="white">
                                    <td align="left" style="text-align:justify">
                                        <asp:Label ID="new_descriptionLabel" runat="server" Text='<%# Eval("new_description") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:DataList ID="DataList2" runat="server" DataKeyField="new_id" DataSourceID="fileDTS">
                                            <ItemTemplate>
                                                ไฟล์ดาวน์โหลด : <%#"<a href=../" & Container.DataItem("newf_path") & ">" & _
                                                              Container.DataItem("newf_name") & "</a>"%><br /><br />
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow" height="30">
                                    <td align="right">ผู้ประกาศ : <asp:Label ID="new_writerLabel" runat="server" Text='<%# Eval("new_writer") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <FooterStyle BackColor="Tan" />
                        <SelectedItemStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <AlternatingItemStyle BackColor="PaleGoldenrod" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    </asp:DataList>
                </td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="30" align="center">
                <td><asp:Button ID="close" runat="server" Text="ย้อนกลับ" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" Width="90px" /></td>
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
