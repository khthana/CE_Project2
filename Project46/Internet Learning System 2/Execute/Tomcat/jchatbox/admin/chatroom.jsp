<%@ page contentType="text/html; charset=windows-874" %>
<html>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,jChatBox.Chat.Filter.*,java.util.*" %>
<jsp:useBean id="SystemProcessor" class="jChatBox.Service.ModeratorProcessor" scope="application" />
<%
	jChatBox.Chat.ChatroomManager ChatroomManager = null;
	XMLPropertyResourceBundle defaultBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(XMLConfig.DEFAULTLANGUAGE);
	//response.setContentType("text/html; charset="+defaultBundle.getString("global.encoding"));
	jChatBox.Chat.Monitor Monitor = null;
	String ID = "";
	Chatroom aChatroom = null;
	int id = -1;
	String jspDisplay = SystemProcessor.execute(request,session, application);
	if (jspDisplay != null)
	{
		response.sendRedirect(jspDisplay);
	}
	else
	{
		ChatroomManager = jChatBox.Chat.ChatroomManager.getInstance();
		Monitor = jChatBox.Chat.Monitor.getInstance();
		ID = request.getParameter("id");
		if ( (ID != null) && (!ID.equals("")) )
		{
			id = Integer.parseInt(ID);
			aChatroom = ChatroomManager.getChatroom(id);

			String sub = request.getParameter("sub");
			if ( (sub != null) && (!sub.equals("")) )
			{
				if (sub.equals("viewusers")) session.putValue("winusers","open");
				else if (sub.equals("closeusers")) session.putValue("winusers","close");
				else if (sub.equals("viewblacklist")) session.putValue("winblacklist","open");
				else if (sub.equals("closeblacklist")) session.putValue("winblacklist","close");
			}
		}
		else
		{
			ID = (String) session.getValue("ID");
			if (ID == null) ID="";
		}
	}
%>
<head>
<LINK REL=STYLESHEET TYPE="text/css" HREF="styles/admin.css">
<script language="JavaScript">
<!--
function viewusers()
{
	location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id=<%= ID %>&sub=viewusers";
}
function closeusers()
{
	location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id=<%= ID %>&sub=closeusers";
}
function update()
{
	if (document.chatroom.subject.value.length > 0)
	{
		document.chatroom.todo.value="updatechatroom";
		document.chatroom.submit();
	}
	else
	{
		alert("You have to fill in SUBJECT field !");
	}
}
function close()
{
	location.href="menu.jsp?todo=closechatroom&id=<%= ID %>&rand=<%= System.currentTimeMillis() %>";
}
function clear()
{
	location.href="menu.jsp?todo=clearchatroom&id=<%= ID %>&rand=<%= System.currentTimeMillis() %>";
}
function generate()
{
	if (document.chatroom.filename.value.length > 0)
	{
		document.chatroom.todo.value="generatetranscript";
		document.chatroom.submit();
	}
	else
	{
		alert("You have to fill in FILENAME field !");
	}
}
function backup()
{
	location.href="menu.jsp?todo=backup&rand=<%= System.currentTimeMillis() %>";
}
function logout()
{
	location.href="index.jsp?todo=logout&rand=<%= System.currentTimeMillis() %>";
}
function manage(opt)
{
	if (opt != "")
	{
		location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id="+opt;
	}
}
function join()
{
	document.chatroom.todo.value="join";
	document.chatroom.submit();
}
//-->
</script>
<title>Chatroom Manager</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#9999CC" alink="#9999CC" vlink="#9999CC">

<form method="post" action="chatroom.jsp" name="chatroom">
  <p align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><br>
    </font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b>
    <%
 		if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMUPDATED)) out.print("Chatroom has been updated successfully.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMTRANSCRIPTED)) out.print("Chatroom has been transcripted successfully.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMSUBJECTMISSING)) out.print("Chatroom's subject missing.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMIDMISSING)) out.print("System error : Chatroom's id missing.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMNOTFOUND)) out.print("System error : Chatroom not found.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.SYSTEMERROR)) out.print("Cannot execute : System error.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.USERNAMEMISSING)) out.print("Username missing.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.NAMENOTFOUND)) out.print("Username not found.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.KICKEDOFF)) out.print("User has been kicked off this chatroom.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.BANNED)) out.print("User has been banned of this chatroom.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMBLACKLISTCLEARED)) out.print("Blacklist cleared.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.IPREMOVED)) out.print("IP removed from blacklist.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CANNOTKICKOFFORBAN)) out.print("Cannot kick off or ban SYSTEM user.");
 		else if ((SystemProcessor.getSysMessage(session)).equals(Conf.NAMENOTAVAILABLE)) out.print("Name already in use for this charoom.");
 		else if ( ((SystemProcessor.getSysMessage(session)).equals(Conf.SYSTEMUSERJOINED)) || ((SystemProcessor.getSysMessage(session)).equals(Conf.MODERATORUSERJOINED)))
 		{
 			if ((SystemProcessor.getSysMessage(session)).equals(Conf.SYSTEMUSERJOINED)) out.print("SYSTEM user has joined this chatroom.");
			else out.print("MODERATOR user has joined this chatroom.");
 			out.print(" Try <a href=\"../skin_multilanguage/room.jsp\" target=\"_blank\" class=\"bluelink\">this URL</a> to enter this chatroom.<br>");
 		}
 		else out.print(SystemProcessor.getSysMessage(session));
    %>
    </b></font></p>
  <table width="100%" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td width="25%" valign="top">
        <table width="100%" border="0" cellspacing="1" cellpadding="4">
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#990000">Manage
              chatroom<br>
              </font></b></font>
              <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td> <font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                    <select name="chatrooms" onChange="manage(this.options[selectedIndex].value);">
                      <option>Select a chatroom</option>
                      <%
                      	if (ChatroomManager != null)
                      	{
                      		Vector chatrooms = ChatroomManager.getChatrooms();
                      		Chatroom chatroom = null;
                      		String Selection = "";
                      		for (int i=0;i<chatrooms.size();i++)
                      		{
                      			chatroom = (Chatroom) chatrooms.elementAt(i);
                      			if (chatroom.getParams().getID() == id) Selection=" selected";
                      			else Selection = "";
                      			out.print("<option value=\""+chatroom.getParams().getID()+"\""+Selection+">"+chatroom.getParams().getName()+"</option>");
                      		}
                      	}
                      %>
                    </select>
                    </font></td>
                </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="open.jsp"><b>Open chatroom</b></a></font></td>
          </tr>
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="xmlconfig.jsp"><b>Manage chatroom</b></a></font></td>
          </tr>
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="javascript:logout()"><b>Logout</b></a></font></td>
          </tr>
        </table>
      </td>
      <td width="75%" valign="top">
        <table width="98%" border="0" cellspacing="1" cellpadding="0" align="center">
          <tr>
            <td>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr bgcolor="#999999">
                  <td bgcolor="#003399">
                    <table width="100%" border="0" cellspacing="1" cellpadding="2">
                      <tr bgcolor="#FFFFFF">
                        <td nowrap>
                          <table width="100%" border="0" cellspacing="5" cellpadding="5">
                            <tr>
                              <td>
                                <div align="center">
                                  <table width="100%" border="0" cellspacing="0" cellpadding="1">
                                    <tr>
                                      <td bgcolor="#FFFFCC"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#000099"><a href="javascript:clear()" class="tablink">Clear</a>&nbsp;</font>|<font color="#000099">&nbsp;</font></b></font><a href="javascript:close()" class="tablink">Close</a><font color="#000099">&nbsp;</font>|<font color="#000099">&nbsp;</font><a href="javascript:join()" class="tablink">Join</a><font color="#000099">&nbsp;</font></b></font></td>
                                    </tr>
                                    <tr>
                                      <td>
                                        <hr size="1" width="100%">
                                      </td>
                                    </tr>
                                  </table>
                                  <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                                    <tr>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2"><b><font color="#000099" size="-1">&nbsp;Info</font></b></font></td>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                      <td bgcolor="#EEEEEE"><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Name
                                        : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <% if (aChatroom != null) out.print(aChatroom.getParams().getName()); %>
                                        </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>History
                                        : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="history" class="SystemBox">
                                          <%
                                          	if (aChatroom != null)
                                          	{
                                          		int[] historyList = {20,25,30,35,40,45,50,55,60,70,80,90,100,120,150};
                                          		int history = aChatroom.getParams().getHistory();
                                          		String hStr = null;
                                          		String Selected = null;
                                          		for (int h=0;h<historyList.length;h++)
                                          		{
                                          		   hStr = ""+historyList[h];
                                          		   if (historyList[h]==history) Selected = " selected";
                                          		   else Selected = "";
                                          		   %>
                                          <option value="<%= hStr %>"<%= Selected %>><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><%= hStr %></font></option>
                                          <%}
                                          	}
                                          %>
                                        </select></font>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Subject
                                        :</b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="subject" size="16" class="SystemBox" value="<% if (aChatroom != null) out.print(aChatroom.getParams().getSubject()); %>">
                                        </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Refresh
                                        limit : </b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="refreshlimit" class="SystemBox">
                                          <%
										  if (aChatroom != null)
										  {
                                          	int[] refreshList = {3,5,8,10,12,15,18,20,25,30,40,50};
                                          	int refresh = aChatroom.getParams().getRefreshLimit();
                                          	String rStr = null;
                                          	String Select = null;
                                          	for (int r=0;r<refreshList.length;r++)
                                          	{
                                          	   rStr = ""+refreshList[r];
                                          	   if (refreshList[r]==refresh) Select = " selected";
                                          	   else Select = "";
                                          	   %>
                                          <option value="<%= rStr %>"<%= Select %>><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><%= rStr %>
                                          seconds</font></option>
                                          <%}
                                          }
                                         %>
                                        </select></font>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b>Max.
                                        users :</b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <% if (aChatroom != null) out.print(aChatroom.getParams().getMaxUsers()); %>
                                        </font></td>
                                    </tr>
                                   </table></td></tr>
                                  </table></td></tr>
                                  </table>
                                </div>
                              </td>
                            </tr>
                          </table>
                        </td>
                      </tr>
                    </table>
                  </td>
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
