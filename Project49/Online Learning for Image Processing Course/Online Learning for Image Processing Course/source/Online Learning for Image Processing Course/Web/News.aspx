<%@ Page Language="VB" AutoEventWireup="false" CodeFile="News.aspx.vb" Inherits="News" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Detail News</title>
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
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" valign="top" height="20">
                <td>:: ประกาศข่าว ::</td>
            </tr>
            <tr height="10">
                <td></td>
            </tr>
            <tr valign="top">
                <td>
                    <asp:SqlDataSource ID="DetailNewsDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [News] WHERE ([new_id] = @new_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="new_id" QueryStringField="new_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="NewsFileDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [NewsFile] WHERE ([new_id] = @new_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="new_id" QueryStringField="new_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="new_id" DataSourceID="DetailNewsDTS" BackColor="PaleGoldenrod" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                        <ItemTemplate>
                            <table width="750">
                                <tr align="center">
                                    <td bgcolor="palegoldenrod" style="font-weight:bold"><img src="Image/note.gif" align="middle" height="30" width="30" border="0" />
                                        เรื่อง : <asp:Label ID="new_topicLabel" runat="server" Text='<%# Eval("new_topic") %>'></asp:Label></td>
                                </tr>
                                <tr height="30">
                                    <td align="right" bgcolor="lightgoldenrodyellow">วัน/เดือน/ปี ที่ประกาศ : <asp:Label ID="new_dateLabel" runat="server" Text='<%# Eval("new_date") %>'></asp:Label></td>
                                </tr>
                                <tr align="center" height="150">
                                    <td bgcolor="PaleGoldenrod"><img src='<%# Container.DataItem("new_picpath") %>' alt='<%# Eval("new_picfile") %>' /></td>
                                </tr>
                                <tr height="100">
                                    <td style="text-align:justify" bgcolor="white"><asp:Label ID="new_descriptionLabel" runat="server" Text='<%# Eval("new_description") %>'></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataList ID="DataList2" BorderWidth="0px" runat="server" DataKeyField="newf_id" DataSourceID="NewsFileDTS">
                                            <ItemTemplate>
                                                <table width="750" border="0px">
                                                <tr align="left" height="30">
                                                    <td bgcolor="PaleGoldenrod">ไฟล์ดาวน์โหลด : 
                                                        <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("newf_path") %>' runat="server"><%# Container.DataItem("newf_name") %></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr align="right" bgcolor="lightgoldenrodyellow">
                                    <td><img src="Image/write.gif" align="middle" height="30" width="30" border="0" /> ผู้ประกาศ : <asp:Label ID="new_writerLabel" runat="server" Text='<%# Eval("new_writer") %>'></asp:Label></td>
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
            <tr height="10">
                <td></td>
            </tr>
            <tr height="70" bgcolor="#cccccc" align="center">
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
