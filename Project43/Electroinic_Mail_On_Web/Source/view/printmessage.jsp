<%@ page session="true" import="java.text.SimpleDateFormat,java.util.Date,dtw.webmail.model.*" %>

<html>
<head>
        <title>Java WebMail Project</title>
         <link rel=stylesheet href="style.css" type="text/css">
</head>

<body bgcolor="#ffffff" link="#666666" vlink="#666666" alink="#FFFFFF">
<%-- Ensure authenticated & valid session --%>
<%
    if(session.isNew() || session.getValue("jwma.htmlhelper")==null) {	
    	response.sendRedirect(response.encodeRedirectUrl("login.jsp"));
    }
%>
<%-- Prepare references for use in the page --%> 
<%
	JwmaHtmlHelper htmlhelper=(JwmaHtmlHelper) session.getValue("jwma.htmlhelper");
	JwmaMessage message=(JwmaMessage) session.getValue("jwma.message");
	JwmaMailbox mailbox=(JwmaMailbox) session.getValue("jwma.mailbox");
%>
<%-- Display message --%> 
<table>
  <tr> 
    <td><img src="images/message.jpg" alt="Message"></td>
    <td> <font face="Arial,Helvetica"><b> Message #<%= message.getMessageNumber() %> 
      from <%= htmlhelper.getPathHierarchyNavigator(mailbox.getPath())%> </b></font> 
    </td>
  </tr>
</table>
<table border="0" width="75%" cellspacing="1" cellpadding="1">
  <tr> 
    <td colspan="2" align="left" bgcolor="#006699"> <font color="#FFFFFF" face="Arial, Helvetica, sans-serif"> 
      <b><%= ((message.getDate()!=null)? message.getDate():new Date()) %></b> 
      <i> &nbsp;&quot;<%= ((message.getSubject().length()>25)? (message.getSubject().substring(0,24)+"..."):message.getSubject()) %>&quot;</i> 
      </font> </td>
  </tr>
  <tr> 
    <td  align=left valign=top width="20%" ><b>From:</b></td>
    <td  align=left valign=top width="80%" > <%= message.getFrom() %> 
    </td>
  </tr>
  <tr> 
    <td  align=left valign=top width="20%" ><b>To:</b></td>
    <td  align=left valign=top width="80%" > <%= message.getTo() %> 
    </td>
  </tr>
  <tr> 
    <td  align=left valign=top width="20%" ><b>Subject:</b></td>
    <td  align=left valign=top width="80%" > <em><%= message.getSubject() %></em> 
    </td>
  </tr>
  <tr> 
    <td  align="left" valign="top" colspan="2" > <% if (message.isSinglepart()) { %> 
      <pre><%= message.getBody() %></pre>
      <% } else {
							JwmaMessagePart[] parts=message.getMessageParts();
							for (int i=0;i<parts.length;i++) {
					%> <%= htmlhelper.getPartDescription(parts[i],i) %> <%
					   		}
					   } 
					%> </td>
  </tr>
</table>
<br>
<p>
<table>
  <tr> 
    <td><font size=-2 face=ARIAL,HELVETICA><a href="message.jsp">Message printed by Pjung & Pommy Project.</a></font><a href="message.jsp"> </a></td>
  </tr>
</table>
<p>
</body>
</html>
