<%@ page contentType="text/html; charset=windows-874" %>
<html>
<%@ page import="jChatBox.Util.*,jChatBox.Chat.*,jChatBox.Chat.Filter.*,java.util.*" %>
<jsp:useBean id="SystemProcessor" class="jChatBox.Service.ModeratorProcessor" scope="application" />
<%
	jChatBox.Chat.ChatroomManager ChatroomManager = null;
	XMLPropertyResourceBundle defaultBundle = (XMLPropertyResourceBundle) XMLConfig.RESOURCES.get(XMLConfig.DEFAULTLANGUAGE);
	//response.setContentType("text/html; charset="+defaultBundle.getString("global.encoding"));
	String jspDisplay = SystemProcessor.execute(request,session,application);
	if (jspDisplay != null)
	{
		response.sendRedirect(jspDisplay);
	}
	else
	{
		ChatroomManager = jChatBox.Chat.ChatroomManager.getInstance();
	}
%>
<head>
<LINK REL=STYLESHEET TYPE="text/css" HREF="styles/admin.css">
<script language="JavaScript"><!--
function validate()
{
	if (document.chatroom.name.value.length != 0)
	{
		if (document.chatroom.subject.value.length != 0)
		{
			document.chatroom.todo.value = "openchatroom";
                        document.chatroom.submit();
		}
		else
		{
			alert("You have to fill in SUBJECT parameter !");
		}
	}
	else
	{
		alert("You have to fill in NAME parameter !");
	}
}
function cancel()
{
	location.href="menu.jsp";
}
function manage(opt)
{
	if (opt != "")
	{
		location.href="chatroom.jsp?todo=manage&rand=<%= System.currentTimeMillis() %>&id="+opt;
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
//--></script>
<title>jChatBox Manager</title>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" link="#9999CC" alink="#9999CC" vlink="#9999CC">
<form method="post" action="menu.jsp" name="chatroom">
  <table width="100%" border="0" cellspacing="1" cellpadding="0">
    <tr>
      <td width="25%" valign="top">
        <table width="100%" border="0" cellspacing="1" cellpadding="4">
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"><br>
              <br>
              </font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font color="#990000">Manage
              chatroom<br>
              </font></b></font>
              <table width="100%%" border="0" cellspacing="1" cellpadding="0">
                <tr>
                  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                    <select name="chatrooms" onChange="manage(this.options[selectedIndex].value);">
                      <option selected>Select a chatroom</option>
                      <%
                      	if (ChatroomManager != null)
                      	{
                      		Vector chatrooms = ChatroomManager.getChatrooms();
                      		Chatroom chatroom = null;
                      		for (int i=0;i<chatrooms.size();i++)
                      		{
                      			chatroom = (Chatroom) chatrooms.elementAt(i);
                      			out.print("<option value=\""+chatroom.getParams().getID()+"\">"+chatroom.getParams().getName()+"</option>");
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
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b>Open
              a chatroom</b></font></td>
          </tr>
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><a class="menulink" href="xmlconfig.jsp"><b>Manage
              jChatBox</b></a></font></td>
          </tr>
          <tr>
            <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><img src="images/reddot.gif" width="12" height="12"></font></td>
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
                                <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif"><b><font color="#0000FF">
                                  <font face="Arial, Helvetica, sans-serif">-
                                  ตั้งค่าเพื่อเปิดบริการ ห้องสนทนา -</font></font></b></font><br>
                                  <font face="Verdana, Arial, Helvetica, sans-serif" size="-1" color="#FF0000"><b><font size="-2">
                                  <%
                                	if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMNAMEMISSING)) out.print("Chatroom's name missing !");
                                  	else if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMSUBJECTMISSING)) out.print("Chatroom's subject missing !");
                                  %>
                                  </font></b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-2"><b>
                                  </b></font><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><br>
                                  <br>
                                  </b></font>
                                  <table width="65%" border="0" cellspacing="1" cellpadding="0">
                                    <tr bgcolor="#EEEEEE">
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1"><b><font size="-2" color="#000099">กรุณาติดตั้งค่า:</font></b></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-2">&nbsp;</font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Name
                                        : <% if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMNAMEMISSING)) out.print("<font color=#ff0000>*</font>"); %></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="name" size="16" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Subject
                                        : <% if ((SystemProcessor.getSysMessage(session)).equals(Conf.CHATROOMSUBJECTMISSING)) out.print("<font color=#ff0000>*</font>"); %></font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="text" name="subject" size="16" class="SystemBox">
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Max.
                                        users : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="maxusers" class="SystemBox">
                                          <option value="5">5</option>
                                          <option value="10">10</option>
                                          <option value="15">15</option>
                                          <option value="20" selected>20</option>
                                          <option value="25">25</option>
                                          <option value="30">30</option>
                                          <option value="35">35</option>
                                          <option value="40">40</option>
                                          <option value="45">45</option>
                                          <option value="50">50</option>
                                          <option value="55">55</option>
                                          <option value="60">60</option>
                                          <option value="65">65</option>
                                          <option value="70">70</option>
                                          <option value="75">75</option>
                                          <option value="80">80</option>
                                          <option value="85">85</option>
                                          <option value="90">90</option>
                                          <option value="95">95</option>
                                          <option value="100">100</option>
                                          <option value="150">150</option>
                                          <option value="200">200</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    </table>
                                  <hr noshade width="65%" size="1">
                                  <table width="65%" border="0" cellspacing="1" cellpadding="0">
                                  <tr>
								  <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">History
                                        : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="history" class="SystemBox">
                                          <option value="20">20</option>
                                          <option value="25">25</option>
                                          <option value="30">30</option>
                                          <option value="35" selected>35</option>
                                          <option value="40">40</option>
                                          <option value="45">45</option>
                                          <option value="50">50</option>
                                          <option value="55">55</option>
                                          <option value="60">60</option>
                                          <option value="70">70</option>
                                          <option value="80">80</option>
                                          <option value="90">90</option>
                                          <option value="100">100</option>
                                          <option value="120">120</option>
                                          <option value="150">150</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                    <tr>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">Refresh
                                        limit : </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <select name="refreshlimit" class="SystemBox">
                                          <option value="3">3 seconds</option>
                                          <option value="5">5 seconds</option>
                                          <option value="8">8 seconds</option>
                                          <option value="10">10 seconds</option>
                                          <option value="12" selected>12 seconds</option>
                                          <option value="15">15 seconds</option>
                                          <option value="18">18 seconds</option>
                                          <option value="20">20 seconds</option>
                                          <option value="25">25 seconds</option>
                                          <option value="30">30 seconds</option>
                                          <option value="40">40 seconds</option>
                                          <option value="50">50 seconds</option>
                                        </select>
                                        </font></td>
                                    </tr>
                                   </table></td></tr>
                                 </table>
                               <table border="0" cellspacing="2" cellpadding="1">
                                    <tr>
                                      <td align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="button" name="Button" value="Open" onClick="validate()" class="SystemButton">
                                        </font></td>
                                      <td><font face="Verdana, Arial, Helvetica, sans-serif" size="-1">
                                        <input type="button" name="Cancel" value="Cancel" onClick="cancel()" class="SystemButton">
                                        <input type="hidden" name="todo" value="openchatroom">
                                        </font></td>
                                    </tr>
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
