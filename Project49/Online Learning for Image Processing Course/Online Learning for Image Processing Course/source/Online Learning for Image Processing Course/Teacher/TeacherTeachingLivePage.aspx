<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherTeachingLivePage.aspx.vb" Inherits="Teacher_TeacherTeachingLivePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Teaching Live</title>
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
                <td colspan="2">
                    :: ระบบสมาชิกประเภทผู้สอน ::</td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr style="font-weight:bold">
                <td colspan="2">
                    <asp:SqlDataSource ID="userDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" 
                        SelectCommand="SELECT [tch_name] FROM [Teacher] WHERE ([tch_id] = @tch_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="tch_id" SessionField="user" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList2" runat="server" DataSourceID="userDTS">
                        <ItemTemplate>
                            คุณ 
                            <asp:Label ID="tch_nameLabel" runat="server" Text='<%# Eval("tch_name") %>'></asp:Label><br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td style="font-weight:bold">การสอนแบบถ่ายทอดสดและการสนทนา</td>
            </tr>
            <tr height="10"><td></td></tr>
            <tr>
                <td style="width: 750px" align="center">
                    <asp:SqlDataSource ID="subjectDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>"
                        SelectCommand="SELECT [sub_id], [sub_url] FROM [Subject] WHERE ([sub_id] = @sub_id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="sub_id" QueryStringField="sub_id" Type="Int64" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="sub_id" DataSourceID="subjectDTS">
                        <ItemTemplate>
                            <table width="750" align="center">
                                <tr height="450" align="center">
                                    <td width="500" align="center">
                                        <OBJECT classid=clsid:6bf52a52-394a-11d3-b153-00c04f79faa6 height=450 id=objMediaPlayer1 width=500 viewastext>
                                          <param name="URL" value='<%# Container.DataItem("sub_url") %>'>
                                          <param name="rate" value="1">
                                          <param name="balance" value="0">
                                          <param name="currentPosition" value="0">
                                          <param name="defaultFrame" value>
                                          <param name="playCount" value="1">
                                          <param name="autoStart" value="1">
                                          <param name="currentMarker" value="0">
                                          <param name="invokeURLs" value="-1">
                                          <param name="baseURL" value='<%# Container.DataItem("sub_url") %>'>
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
                                          <embed src='<%# Container.DataItem("sub_url") %>' width="500" height="450" bgcolor="ffffff" autoplay="true" cache="true" enablejavascript="true" controller="true">
                                          </embed>
                                        </OBJECT>
                                    </td>
                                    <td width="280" align="center">
                                        <%#"<iframe src=TeacherChatRoom.aspx?sub_id=" & Container.DataItem("sub_id") & " width=280 height=450 />"%>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
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
