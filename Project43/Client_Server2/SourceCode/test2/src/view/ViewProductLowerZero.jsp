<HTML>
<HEAD>
<TITLE>
ViewProductLowerZero
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%!
    HttpSession session;
    quote.Quote quote;
    product.ProductHome productHome;
%>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="ViewNewSell.jsp">
<%
    try {
      javax.naming.Context ic = new javax.naming.InitialContext();
      java.lang.Object objref = ic.lookup("MyProduct");
      productHome = (product.ProductHome) javax.rmi.PortableRemoteObject.narrow(objref,
                     product.ProductHome.class);
      System.out.println("obtained productHome object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate productHome");
      re.printStackTrace();
    }
    session = request.getSession(true);
    quote = (quote.Quote)session.getValue("quote");
if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
    %>
  <table width="75%" border="1" bordercolor="#6666CC">
    <tr align="center" bgcolor="#FFFFCC"> 
      <td><font color="#0099FF" face="Comic Sans MS">Product ID</font></td>
      <td><font color="#0099FF" face="Comic Sans MS">Quantity</font></td>
    </tr>
    <%
    java.util.Collection c = productHome.findProductZero();
    java.util.Iterator i = c.iterator();
    while (i.hasNext()) {
      product.Product product = (product.Product) i.next();
      String productId = (String)product.getPrimaryKey();
      int quantity = product.getQuantity();
    %>
    <tr align="center"> 
      <td width="65%" bgcolor="#FFCCFF"><a href="<% out.print("ViewProduct2.jsp?productId="+productId+"&firstAccess=true"); %>"><%= productId %></a></td>
      <td width="35%" bgcolor="#FFCCCC"><%= quantity %></td>
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
