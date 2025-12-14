<HTML>
<HEAD>
<TITLE>
ViewNewSell
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%!
    HttpSession session;
    quote.Quote quote;
    buy.BuyHome buyHome;
%>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="ViewNewSell.jsp">
<%
    try {
      javax.naming.Context ic = new javax.naming.InitialContext();
      java.lang.Object objref = ic.lookup("MyBuy");
      buyHome = (buy.BuyHome) javax.rmi.PortableRemoteObject.narrow(objref,
                 buy.BuyHome.class);
      System.out.println("obtained buyHome object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate attribHome");
      re.printStackTrace();
    }
    session = request.getSession(true);
    quote = (quote.Quote)session.getValue("quote");
if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
    String submit = request.getParameter("Submit");
    if (submit!=null) {
    if (submit.equals("remove")) {
      String re = request.getParameter("receiptNo");
      String user = request.getParameter("username");
      buy.Buy buy = buyHome.findMaxReceiptNo();
      buy.changeVerify(user,re,"true");
    }
    }
    %>
  <table width="75%" border="1" bordercolor="#660099">
    <tr align="center"> 
      <td bgcolor="#FFFFCC"><font color="#0099FF"><b><font face="Comic Sans MS">Username</font></b></font></td>
      <td bgcolor="#FFFFCC">&nbsp;</td>
    </tr>
    <%
    java.util.Collection c = buyHome.findNewSell();
    java.util.Iterator i = c.iterator();
    while (i.hasNext()) {
      buy.Buy buy = (buy.Buy) i.next();
      String username = ((buy.BuyPK)buy.getPrimaryKey()).username;
      String receiptNo = ((buy.BuyPK)buy.getPrimaryKey()).receiptNo;
    %>
    <tr align="center"> 
      <td width="65%" bgcolor="#FFCCFF"><a href="<% out.print(response.encodeURL("ViewReceipt.jsp?receiptNo="+receiptNo)); %>"><%= username %></a></td>
      <td width="35%" bgcolor="#FFCCCC"><a href="<% out.print(response.encodeURL("ViewNewSell.jsp?receiptNo="+receiptNo+"&username="+username+"&Submit=remove")); %>">remove</a></td>
    </tr>
    <%
    }
    %>
  </table>
    <%
  }
}
%>
</FORM>
</BODY>
</HTML>
