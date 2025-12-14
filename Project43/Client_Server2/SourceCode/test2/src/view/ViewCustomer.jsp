<HTML>
<HEAD>
<TITLE>
ViewCustomer
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="">
<%!
  HttpSession session;
  customer.Customer customer;
  quote.Quote quote;
%>
<%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
  java.util.Collection c = (java.util.Collection) session.getValue("customer");
  if (c!=null) {
%>
  <table width="100%" border="1" bgcolor="#DDDDDD">
    <tr bgcolor="#FFFFCC"> 
      <td><b>Username</b></td>
      <td><b>Name</b></td>
      <td><b>No.</b></td>
      <td><b>Soi</b></td>
      <td><b>Street</b></td>
      <td><b>District</b></td>
      <td><b>Province</b></td>
      <td><b>Country</b></td>
      <td><b>Email</b></td>
      <td><b>Tel</b></td>
      <td><b>FAX</b></td>
      <td><b>ID Credit</b></td>
      <td><b>User type</b></td>
      <td><b>edit</b></td>
      <td><b>delete</b></td>
    </tr>
<%
    java.util.Iterator i = c.iterator();
    while (i.hasNext()) {
      customer = (customer.Customer) i.next();
      String username = (String)customer.getPrimaryKey();
%>
    <tr bgcolor="#FFFFFF">
      <td><%= username %></td>
      <td><%= customer.getName() %></td>
      <td><%= customer.getNo() %></td>
      <td><%= customer.getSoi() %></td>
      <td><%= customer.getStreet() %></td>
      <td><%= customer.getDistrict() %></td>
      <td><%= customer.getProvince() %></td>
      <td><%= customer.getCountry() %></td>
      <td><%= customer.getEmail() %></td>
      <td><%= customer.getTel() %></td>
      <td><%= customer.getFax() %></td>
      <td><%= customer.getCreditId() %></td>
      <td><%= customer.getUserType() %></td>
      <td><a href="<% out.print(response.encodeURL("/product/EditCustomer.jsp?username="+username+"&firstAccess=true")); %>">edit</a></td>
      <td><a href="<% out.print(response.encodeURL("/product/ViewCustomer2.jsp?username="+username+"&firstAccess=true&Submit=Delete")); %>">delete</a></td>
    </tr>
<% } %>
  </table>
<%  } %>
<%
  }
  }
%>
</form>
</body>
</html>
