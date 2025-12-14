<%! XMLPropertyResourceBundle chatroomBundle = new XMLPropertyResourceBundle(); %>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,java.util.*,java.text.SimpleDateFormat" %>
<jsp:useBean id="UserLogin" class="jChatBox.Service.UserLogin" scope="page" />
<%
	jChatBox.Chat.ChatroomManager ChatroomManager = jChatBox.Chat.ChatroomManager.getInstance();
	String chatroomTotalUsers = "", chatroomMaxUsers = "", chatroomName = "", chatroomSubject = "", chatroomDate = "";
	/* I18N support since Servlets 2.3. */
	//try
	//{
	//  request.setCharacterEncoding(chatroomBundle.getString("global.encoding"));
	//} catch (Exception e) {}
	String chatroomID = request.getParameter("id");
	int ID = -1;
	if ( (chatroomID != null) && (!chatroomID.equals("")) )
	{
		try
		{
			ID = Integer.parseInt(chatroomID);
			Chatroom chatroom = ChatroomManager.getChatroom(ID);
			chatroomName = chatroom.getParams().getName();
			chatroomBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(chatroom.getParams().getLanguage());
			chatroomSubject = chatroom.getParams().getSubject();
			chatroomMaxUsers = ""+chatroom.getParams().getMaxUsers();
			chatroomTotalUsers = ""+chatroom.getTotalUsers();
			chatroomDate = (new SimpleDateFormat(chatroomBundle.getString("login.date.format"))).format(chatroom.getDate());
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
			chatroomBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(chatroom.getParams().getLanguage());
			chatroomSubject = chatroom.getParams().getSubject();
			chatroomMaxUsers = ""+chatroom.getParams().getMaxUsers();
			chatroomTotalUsers = ""+chatroom.getTotalUsers();
			chatroomDate = (new SimpleDateFormat(chatroomBundle.getString("login.date.format"))).format(chatroom.getDate());
		}
                else
                {
                   chatroomBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(XMLConfig.DEFAULTLANGUAGE);
                }
	}
	response.setContentType("text/html; charset="+chatroomBundle.getString("global.encoding"));
	String jspDisplay = UserLogin.doLogin(request, session);
	if (jspDisplay != null)
	{
		//response.sendRedirect(response.encodeRedirectURL(jspDisplay));
		%><jsp:forward page="<%= jspDisplay %>" /><%
	}
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="styles.css" />
<script language="JavaScript" type="text/JavaScript"><!--
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
	if ((id.length > 0) && (id > -1))
	{

		location.href="<%= response.encodeURL("login.jsp?rand="+System.currentTimeMillis()) %>&id="+id;
	}
}
//--></script>
<title><%= chatroomBundle.getString("login.title") %></title>
<meta http-equiv="Content-Type" content="text/html; charset=<%= chatroomBundle.getString("global.encoding") %>" />
</head>
<body onload="ready()">
<form action="<%= response.encodeURL("login.jsp") %>" method="post" name="chat" id="chat">
  <table width="98%" border="0" cellspacing="1" cellpadding="0" align="center">
    <tr>
      <td valign="top">
        <table width="100%">
          <tr>
            <td colspan="2" nowrap="nowrap">
              <table width="100%">
                <tr>
                  <td class="b" nowrap="nowrap"><%= chatroomBundle.getString("login.username.label") %>
                    <input type="text" name="name" size="10" maxlength="16" />
                  </td>
                </tr>
                    <%
                    	if (UserLogin.getSysMessage()==Conf.CHATROOMNOTFOUND) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.chatroomnotfound.error")+"</td></tr>");
                    	else if (UserLogin.getSysMessage()==Conf.CLOSED) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.closed.error")+"</td></tr>");
                    	else if (UserLogin.getSysMessage()==Conf.NOVACANCIES) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.novacancies.error")+"</td></tr>");
                    	else if (UserLogin.getSysMessage()==Conf.NAMENOTAVAILABLE) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.namenotavailable.error")+"</td></tr>");
                    	else if (UserLogin.getSysMessage()==Conf.BANNED) out.print("<tr><td class=\"s\">"+chatroomBundle.getString("login.banned.error")+"</td></tr>");
                    %>
              </table>
            </td>
          </tr>
          <tr>
            <td class="b" colspan="2" nowrap="nowrap"><a href="javascript:enter()"><%= chatroomBundle.getString("login.join.link") %></a><%= chatroomBundle.getString("login.join.label") %>
              <select name="chatrooms" onchange="info(this.options[selectedIndex].value);" class="dropdown">
                <option value="-1"><%= chatroomBundle.getString("login.list.label") %></option>
                 <%
                     if (ChatroomManager != null)
                     {
                   	Vector chatrooms = ChatroomManager.getChatrooms();
                   	Chatroom chatroom = null;
                   	String selection = "";
                   	for (int i=0;i<chatrooms.size();i++)
                   	{
                   		chatroom = (Chatroom) chatrooms.elementAt(i);
                   		if (ID == chatroom.getParams().getID()) selection = " selected=\"selected\"";
                   		else selection="";
                   		out.println("<option value=\""+chatroom.getParams().getID()+"\""+selection+">"+chatroom.getParams().getName()+"</option>");
                   	}
                     }
                 %>
              </select>
              </td>
          </tr>
        </table>
      </td>
      <td align="right">
        <table class="borderin" border="0">
          <tr>
            <td>
              <table width="100%">
                <tr>
                  <td class="sbb" nowrap="nowrap"><%= chatroomBundle.getString("login.chatroom.label") %><%= chatroomName %></td>
				</tr>
				<tr>
                  <td class="sbb" nowrap="nowrap"><%= chatroomBundle.getString("login.subject.label") %><%= chatroomSubject %></td>
                </tr>
				<tr>
				  <td class="xsg" nowrap="nowrap"><%= chatroomBundle.getString("login.open.label") %><%= chatroomDate %></td>
				</tr>
				<tr>
                  <td class="xsr" nowrap="nowrap"><%= chatroomBundle.getString("login.useramount.label") %><%= chatroomTotalUsers %></td>
                </tr>
				<tr>
                  <td class="xsr" nowrap="nowrap"><%= chatroomBundle.getString("login.userlimit.label") %><%= chatroomMaxUsers %></td>
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
