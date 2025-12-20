<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentVDODetail.aspx.vb" Inherits="Student_StudentVDODetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student VDO Detail</title>
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
                    :: ระบบสมาชิกประเภทผู้เรียน ::</td>
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
                <td colspan="2">รายละเอียดของสื่อการสอน Clip VDO</td>
            </tr>
            <tr height="10"><td colspan="2"></td></tr>
            <tr height="580">
                <td>
                    <asp:SqlDataSource ID="vdodetailDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT [lowvdo_id], [lowvdo_topic], [lowvdo_description], [lowvdo_writer], [lowvdo_date], [lowvdo_year], [lowvdo_term], [lowvdo_path] FROM [LearningOnWebVDO] WHERE ([lowvdo_id] = @lowvdo_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="lowvdo_id" QueryStringField="lowvdo_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="lowvdo_id" DataSourceID="vdodetailDTS" BackColor="PaleGoldenrod" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black">
                        <ItemTemplate>
                            <table width="750">
                                <tr height="450" align="center">
                                    <td colspan="2" bgcolor="white">
                                        <OBJECT classid=clsid:6bf52a52-394a-11d3-b153-00c04f79faa6 height=450 id=objMediaPlayer1 width=600 viewastext>
                                          <param name="URL" value='<%# Container.DataItem("lowvdo_path") %>'>
                                          <param name="rate" value="1">
                                          <param name="balance" value="0">
                                          <param name="currentPosition" value="0">
                                          <param name="defaultFrame" value>
                                          <param name="playCount" value="1">
                                          <param name="autoStart" value="1">
                                          <param name="currentMarker" value="0">
                                          <param name="invokeURLs" value="-1">
                                          <param name="baseURL" value='<%# Container.DataItem("lowvdo_path") %>'>
                                          <param name="volume" value="80">
                                          <param name="mute" value="0">
                                          <param name="uiMode" value="full">
                                          <param name="enabled" value="-1">
                                          <param name="enableContextMenu" value="1">
                                          <param name="fullScreen" value="0">
                                          <param name="SAMIStyle" value>
                                          <param name="SAMILang" value>
                                          <param name="SAMIFilename" value>
                                          <param name="captioningID" value>
                                          <embed src='<%# Container.DataItem("lowvdo_path") %>' width="600" height="450" bgcolor="ffffff" autoplay="true" cache="true" enablejavascript="true" controller="true">
                                          </embed>
                                        </OBJECT>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="font-weight:bold">
                                        หัวข้อ : <asp:Label ID="lowvdo_topicLabel" runat="server" Text='<%# Eval("lowvdo_topic") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr bgcolor="lightgoldenrodyellow">
                                    <td align="center" valign="top" rowspan="3" width="150">
                                        ปีการศึกษา <asp:Label ID="lowvdo_yearLabel" runat="server" Text='<%# Eval("lowvdo_year") %>'></asp:Label>
                                        <br />
                                        ภาคการศึกษาที่ <asp:Label ID="lowvdo_termLabel" runat="server" Text='<%# Eval("lowvdo_term") %>'></asp:Label>
                                    </td>
                                    <td align="right" width="600">
                                        วัน/เดือน/ปี ที่ประกาศ : <asp:Label ID="lowvdo_dateLabel" runat="server" Text='<%# Eval("lowvdo_date") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr align="left" style="text-align:justify" height="100" bgcolor="white">
                                    <td><asp:Label ID="lowvdo_descriptionLabel" runat="server" Text='<%# Eval("lowvdo_description") %>'></asp:Label></td>
                                </tr>
                                <tr align="right" bgcolor="lightgoldenrodyellow">
                                    <td>ผู้ประกาศ : <asp:Label ID="lowvdo_writerLabel" runat="server" Text='<%# Eval("lowvdo_writer") %>'></asp:Label></td>
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
