<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DisplayChatting.aspx.vb" Inherits="Student_DisplayChatting" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Display Chatting</title>
    <meta http-equiv="refresh" content="5;DisplayChatting.aspx" />
    <style>
	    a:link {COLOR: #000080; TEXT-DECORATION: none}
	    a:visited {	COLOR: #000080; TEXT-DECORATION: none}
	    a:hover {COLOR: blue; TEXT-DECORATION: none}
    </style>
</head>
<body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0" background="../Image/bg.jpg" style="font-family:MS Sans Serif;font-size:10pt">
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="displaybox" Width="264" Height="362" AutoPostBack="true" ReadOnly="true" TextMode="MultiLine" runat="server"></asp:TextBox>
    </div>
    </form>
</body>
</html>
