<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TeacherChatRoom.aspx.vb" Inherits="Teacher_TeacherChatRoom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Teacher Chat Room</title>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="chatDTS" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectDBConnectionString %>" SelectCommand="SELECT * FROM [Subject] WHERE ([sub_id] = @sub_id)">
            <SelectParameters>
                <asp:QueryStringParameter Name="sub_id" QueryStringField="sub_id" Type="Int64" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DataList ID="DataList1" runat="server" DataKeyField="sub_id" DataSourceID="chatDTS">
            <ItemTemplate>
                <%#"<iframe src=TeacherDisplayChatting.aspx?sub_id=" & Container.DataItem("sub_id") & " width=274 height=374 /><br />" & _
                   "<iframe src=TeacherSendMessageChatting.aspx?sub_id=" & Container.DataItem("sub_id") & " width=274 height=70 />"%>
            </ItemTemplate>
        </asp:DataList>
    </div>
    </form>
</body>
</html>