<%@ Page Language="VB" AutoEventWireup="false" CodeFile="StudentSendMessageChatting.aspx.vb" Inherits="Student_StudentSendMessageChatting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Student Send Message Chatting</title>
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="writtingbox" TextMode="MultiLine" runat="server" Height="58px" Width="190"></asp:TextBox>
        <asp:Button ID="send" runat="server" Text="ส่งข้อความ" Height="64" Width="71" BackColor="#FF8000" Font-Bold="True" Font-Names="Microsoft Sans Serif" ForeColor="White" />
    </div>
    </form>
</body>
</html>
