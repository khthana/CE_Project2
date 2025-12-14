<HTML>
<HEAD>
<TITLE>
Logout
</TITLE>
</HEAD>
<%!
  HttpSession session;
  quote.Quote quote;
%>
<%
  session = request.getSession(true);
  session.removeValue("quote");
  response.sendRedirect("/product/program/index.jsp");
%>
<BODY>
<FORM method="post">
<BR><BR>
</FORM>
</BODY>
</HTML>
