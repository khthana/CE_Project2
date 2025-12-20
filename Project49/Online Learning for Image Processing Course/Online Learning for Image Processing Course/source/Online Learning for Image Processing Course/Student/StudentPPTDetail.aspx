<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentPPTDetail.aspx.vb" Inherits="Student_StudentPPTDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student PPT Detail</title>
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
                <td colspan="2">รายละเอียดของสื่อการสอน Power Point</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="580">
                <td>
                    <asp:SqlDataSource ID="pptdetailDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT [lowppt_id], [lowppt_topic], [lowppt_description], [lowppt_writer], [lowppt_date], [lowppt_year], [lowppt_term], [lowppt_path] FROM [LearningOnWebPPT] WHERE ([lowppt_id] = @lowppt_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="lowppt_id" QueryStringField="lowppt_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="lowppt_id" DataSourceID="pptdetailDTS" BackColor="PaleGoldenrod" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                        <ItemTemplate>
                            <table width="750">
                                <tr height="450" align="center">
                                    <td colspan="2" bgcolor="white">
                                        <%#"<iframe src=../" & Container.DataItem("lowppt_path") & " width=750 height=450></iframe>"%>
                                    </td>
                                </tr>
                                <tr align="center">
                                    <td colspan="2" style="font-weight:bold">
                                        หัวข้อ : <asp:Label ID="lowppt_topicLabel" runat="server" Text='<%# Eval("lowppt_topic") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr align="left" bgcolor="LightGoldenrodYellow">
                                    <td align="center" rowspan="3" valign="top" width="150">
                                        ปีการศึกษา <asp:Label ID="lowppt_yearLabel" runat="server" Text='<%# Eval("lowppt_year") %>'></asp:Label>
                                        <br />
                                        ภาคการศึกษาที่ <asp:Label ID="lowppt_termLabel" runat="server" Text='<%# Eval("lowppt_term") %>'></asp:Label>
                                    </td>
                                    <td align="right" width="600">
                                        วัน/เดือน/ปี ที่ประกาศ : <asp:Label ID="lowppt_dateLabel" runat="server" Text='<%# Eval("lowppt_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr align="left" height="100" style="text-align:justify" bgcolor="white">
                                    <td><asp:Label ID="lowppt_descriptionLabel" runat="server" Text='<%# Eval("lowppt_description") %>'></asp:Label></td>
                                </tr>
                                <tr align="right" bgcolor="LightGoldenrodYellow">
                                    <td>ผู้ประกาศ : <asp:Label ID="lowppt_writerLabel" runat="server" Text='<%# Eval("lowppt_writer") %>'></asp:Label></td>
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
