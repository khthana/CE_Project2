<html>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,java.util.*,java.text.SimpleDateFormat" %>
<jsp:useBean id="UserLogin" class="jChatBox.Service.UserLogin" scope="page" />
<%
	jChatBox.Chat.ChatroomManager ChatroomManager = jChatBox.Chat.ChatroomManager.getInstance();
	String chatroomTotalUsers = "", chatroomMaxUsers = "", chatroomName = "", chatroomSubject = "", chatroomDate = "";
	String chatroomID = request.getParameter("id");
	int ID = -1;
	if ( (chatroomID != null) && (!chatroomID.equals("")) )
	{
		try
		{
			ID = Integer.parseInt(chatroomID);
			Chatroom chatroom = ChatroomManager.getChatroom(ID);
			chatroomName = chatroom.getParams().getName();
			chatroomSubject = chatroom.getParams().getSubject();
			chatroomMaxUsers = ""+chatroom.getParams().getMaxUsers();
			chatroomTotalUsers = ""+chatroom.getTotalUsers();
			chatroomDate = (new SimpleDateFormat("yyyy/MM/dd HH:mm")).format(chatroom.getDate());
		} catch (Exception e)
		  {}
	}
	else
	{
		Vector vChat = ChatroomManager.getChatrooms();
		if (vChat.size() > 0)
		{
			Chatroom chatroom = (Chatroom) vChat.elementAt(0);
			ID = chatroom.getParams().getID();
			chatroomName = chatroom.getParams().getName();
			chatroomSubject = chatroom.getParams().getSubject();
			chatroomMaxUsers = ""+chatroom.getParams().getMaxUsers();
			chatroomTotalUsers = ""+chatroom.getTotalUsers();
			chatroomDate = (new SimpleDateFormat("yyyy/MM/dd HH:mm")).format(chatroom.getDate());
		}
	}
	String jspDisplay = UserLogin.doLogin(request, session);
	if (jspDisplay != null)
	{
		//response.sendRedirect(response.encodeRedirectURL(jspDisplay));
		%><jsp:forward page="<%= response.encodeURL(jspDisplay) %>" /><%
	}
%>
<head>
<script language="Javascript"><!--
function ready()
{
	if(self.name == "content") self.parent.location.href=self.location;
	document.chat.name.focus();
}
function enter()
{
	document.chat.submit();
}
function info(id)
{
	if (id.length > 0)
	{

		location.href="<%= response.encodeURL("login.jsp?rand="+System.currentTimeMillis()) %>&id="+id;
	}
}
//--></script>
<title>Chat Login</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="1" topmargin="1" marginwidth="1" marginheight="1" onLoad="ready()">
<form method="post" action="<%= response.encodeURL("login.jsp") %>" name="chat">
  <table width="98%" border="0" cellspacing="1" cellpadding="0" align="center">
    <tr>
      <td>
        <table width="100%" border="0" cellspacing="1" cellpadding="1" align="center">
          <tr>
            <td colspan="2" nowrap>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td nowrap><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099">NickName
                    :&nbsp;</font></b></font>
                    <input type="text" name="name" size="10" maxlength="16">
                    <font face="Verdana, Arial, Helvetica, sans-serif" size="-2" color="#FF0000">&nbsp;&nbsp;<br>
                    <%
                    	if (UserLogin.getSysMessage()==Conf.CHATROOMNOTFOUND) out.print("CHATROOM NOT FOUND.");
                    	else if (UserLogin.getSysMessage()==Conf.CLOSED) out.print("CHATROOM IS CLOSED.");
                    	else if (UserLogin.getSysMessage()==Conf.NOVACANCIES) out.print("CHATROOM IS FULL.");
                    	else if (UserLogin.getSysMessage()==Conf.NAMENOTAVAILABLE) out.print("NAME NOT AVAILABLE.");
                    	else if (UserLogin.getSysMessage()==Conf.BANNED) out.print("YOU'RE BANNED.");
                    %>
                    </font> </td>
                </tr>
              </table>

            </td>
          </tr>
          <tr>
            <td colspan="2" nowrap><b><a href="javascript:enter()"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Enter</font></a></b>
              <b><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">chatroom</font></b>
              <select name="chatrooms" onChange="info(this.options[selectedIndex].value);">
                <option value="none">Select a chatroom</option>
                 <%
                     if (ChatroomManager != null)
                     {
                   	Vector chatrooms = ChatroomManager.getChatrooms();
                   	Chatroom chatroom = null;
                   	String selection = "";
                   	for (int i=0;i<chatrooms.size();i++)
                   	{
                   		chatroom = (Chatroom) chatrooms.elementAt(i);
                   		if (ID == chatroom.getParams().getID()) selection = " selected";
                   		else selection="";
                   		out.print("<option value=\""+chatroom.getParams().getID()+"\""+selection+">"+chatroom.getParams().getName()+"</option>");
                   	}
                     }
                 %>
              </select>
              </td>
          </tr>
        </table>
      </td>
      <td align="right">
        <table border="0" cellspacing="0" cellpadding="0">
          <tr bgcolor="#999999">
            <td bgcolor="#0000AA">
              <table width="100%" border="0" cellspacing="1" cellpadding="2">
                <tr bgcolor="#FFFFFF">
                  <td nowrap><font size="-2" face="Verdana, Arial, Helvetica, sans-serif">ChatRoom
                    : <font color="#FF0000"><b><%= chatroomName %></b></font> (<%= chatroomTotalUsers %>/<%= chatroomMaxUsers %>)<br>
                    Opened :<b> <%= chatroomDate %><br>
                    </b><font size="-2" face="Verdana, Arial, Helvetica, sans-serif">Subject
                    :</font><b><font size="-2" face="Verdana, Arial, Helvetica, sans-serif">
                    <font color="#000066"><b><%= chatroomSubject %></b></font></font></b></font></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
  </table>
</form>
</body>
</html>
