<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SubjectDetail.aspx.vb" Inherits="SubjectDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Subject Detail</title>
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
            <tr bgcolor="#00cc00" style="font-weight:bold;color:White" height="20">
                <td align="center">:: รายละเอียดของวิชาต่างๆ ::</td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr>
                <td align="center">สถานะของวิชา 
                    <asp:DropDownList ID="StatusDDL" runat="server" AutoPostBack="True" Width="230px">
                        <asp:ListItem Value="Select">- - - เลือก - - -</asp:ListItem>
                        <asp:ListItem Value="Open">รายวิชาที่เปิดการสอนในภาคการศึกษานี้</asp:ListItem>
                        <asp:ListItem Value="Close">รายวิชาที่ปิดการสอนในภาคการศึกษานี้</asp:ListItem>
                        <asp:ListItem Value="Open and Close">รายวิชาที่เปิดและปิดในภาคการศึกษานี้</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                    วิชา            
                    <asp:DropDownList ID="SubjectDDL" runat="server" AutoPostBack="True" Width="150px">
                    </asp:DropDownList>
                    <%--<asp:Button ID="show" runat="server" BackColor="#FFC080" Font-Bold="True" Font-Names="Microsoft Sans Serif"
                        Font-Strikeout="False" Font-Underline="False" ForeColor="White" Text="SHOW" />--%>
                </td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr>
                <td align="center"><asp:Label ID="warning" runat="server" ForeColor="Red"></asp:Label></td>
            </tr>
            <tr>
                <td align="center">
                    <asp:SqlDataSource ID="SubjectDetailDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="select s.sub_id, s.sub_name, t.tch_name, s.sub_description, s.sub_book from subject s, teacher t where s.tch_id=t.tch_id and ([sub_id] = @sub_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="SubjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                Type="Int64" />
                        </SelectParameters>
                        
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="LessonDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT * FROM [Lesson] WHERE ([sub_id] = @sub_id) ORDER BY [les_number]">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="SubjectDDL" Name="sub_id" PropertyName="SelectedValue"
                                Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SubjectDetailDTS" DataKeyField="sub_id" BackColor="PaleGoldenrod" BorderColor="Tan" BorderWidth="1px" CellPadding="1" ForeColor="Black">
                        <ItemTemplate>
                            <table align="center" width="700">
                                <tr align="center">
                                    <td width="250" bgcolor="lightgoldenrodyellow">รหัสวิชา</td>
                                    <td width="450" bgcolor="white"><asp:Label ID="sub_idLabel" runat="server" Text='<%# Eval("sub_id") %>'></asp:Label></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="lightgoldenrodyellow">ชื่อวิชา</td>
                                    <td bgcolor="white"><asp:Label ID="sub_nameLabel" runat="server" Text='<%# Eval("sub_name") %>'></asp:Label></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="lightgoldenrodyellow">ชื่ออาจารย์ผู้สอน</td>
                                    <td bgcolor="white"><asp:Label ID="tch_nameLabel" runat="server" Text='<%# Eval("tch_name") %>'></asp:Label></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="lightgoldenrodyellow">รายละเอียดเกี่ยวกับวิชา</td>
                                    <td bgcolor="white"><asp:Label ID="sub_descriptionLabel" runat="server" Text='<%# Eval("sub_description") %>'></asp:Label></td>
                                </tr>
                                <tr align="center">
                                    <td bgcolor="lightgoldenrodyellow">หนังสืออ้างอิงสำหรับการเรียน</td>
                                    <td bgcolor="white"><asp:Label ID="sub_bookLabel" runat="server" Text='<%# Eval("sub_book") %>'></asp:Label></td>
                                </tr>
                            </table>
                            <asp:DataList ID="DataList2" runat="server" DataKeyField="les_id" DataSourceID="LessonDTS">
                                <ItemTemplate>
                                    <table align="center" width="700">
                                        <tr>
                                            <td rowspan="2" width="250" bgcolor="LightGoldenrodYellow">บทที่
                                                <asp:Label ID="les_numberLabel" runat="server" Text='<%# Eval("les_number") %>'></asp:Label>
                                            </td>
                                            <td align="left" width="450" bgcolor="white">หัวข้อ :
                                                <asp:Label ID="les_topicLabel" runat="server" Text='<%# Eval("les_topic") %>'></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" bgcolor="white">รายละเอียด :
                                            <asp:Label ID="les_descriptionLabel" runat="server" Text='<%# Eval("les_description") %>'></asp:Label></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
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
