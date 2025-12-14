<HTML>
<HEAD>
<jsp:useBean id="ViewBuyBeanId" scope="session" class="view.ViewBuyBean" />
<jsp:setProperty name="ViewBuyBeanId" property="*" />
<TITLE>
ViewBuy
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="">
<%!
  HttpSession session;
  buy.Buy buy;
  Vector v;
  quote.Quote quote;
%>
<%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
  java.util.Collection c = (java.util.Collection) session.getValue("buy");
  v = new Vector();
  if (c!=null) {
    java.util.Iterator i = c.iterator();
    while (i.hasNext()) {
      v.addElement(i.next());
    }
  }
  String oldReceiptNo = "";
  String username = "";
  String productId = "";
  int d=0, m=0, y=0, hour=0, min=0;
  double totalPrice=0,totalImportPrice=0;
  boolean printTotalPrice = false;
%>
<%
  for (int i=0; i<v.size(); i++) {
    buy = (buy.Buy)v.elementAt(i);
    buy.BuyPK buyPK = (buy.BuyPK)buy.getPrimaryKey();
    String receiptNo = buyPK.receiptNo;
    System.out.println("receiptNo="+receiptNo+" , oldReceiptNo="+oldReceiptNo);
    if (!receiptNo.equals(oldReceiptNo)) {
        totalPrice = 0;
        totalImportPrice = 0;
        printTotalPrice = false;
        oldReceiptNo = receiptNo;
        username = buyPK.username;
        java.util.Date date = new java.util.Date(buy.getSellDate().getTime());
        System.out.println("time from db="+date.getTime());
        d = date.getDate();
        m = date.getMonth()+1;
        y = date.getYear()+1900;
        String time = buy.getSellTime();
    System.out.println(username+" "+d+" "+m+" "+y+" "+time);
    %>
  <table width="75%" border="1">
    <tr bgcolor="#BBBBBB"> 
      <td width="20%"><b><font size="4">Username :</font></b></td>
      <td colspan="4"><a href="<% out.println(response.encodeURL("ViewCustomer2.jsp?username="+username+"&firstAccess=true")); %>"><%= username %></a></td>
      <td align="right" colspan="2"><b>Receipt No :</b></td>
      <td width="16%"><a href="<% out.print(response.encodeURL("ViewReceipt.jsp?receiptNo="+receiptNo)); %>"><%= receiptNo %></a></td>
    </tr>
    <tr> 
      <td bgcolor="#00FF99" align="right" colspan="2" valign="middle"><b>Buy Date 
        <i><font size="1">(dd/mm/yy)</font></i> :</b></td>
      <td width="14%" bgcolor="#00FF99"> 
        <% out.print(d+"/"+m+"/"+y); %>
      </td>
      <td align="right" bgcolor="#99FFCC" colspan="2"><b>Buy Time :</b></td>
      <td colspan="3" bgcolor="#99FFCC"> 
        <% out.print(time); %>
      </td>
    </tr>
    <tr align="center"> 
      <td bgcolor="#66CCFF"><b>Product ID</b></td>
      <td bgcolor="#66CCFF" colspan="2"><b>Sell Quantity</b></td>
      <td bgcolor="#66CCFF" colspan="3"><b>Total Import Price</b></td>
      <td bgcolor="#66CCFF" colspan="2"><b>Total Sell Price</b></td>
    </tr>
    <%
    }
    productId = buyPK.productId;
    int sellQuantity = buy.getSellQuantity();
    double subTotal = buy.getTotalPrice();
    double subTotalImport = buy.getTotalImportPrice();
    totalImportPrice = totalImportPrice+subTotalImport;
    totalPrice = totalPrice+subTotal;
    System.out.println(productId+" "+sellQuantity+" "+subTotal+" "+totalPrice);
  %>
    <tr align="center" bgcolor="#99FFFF"> 
      <td><a href="<% out.println(response.encodeURL("ViewProduct2.jsp?productId="+productId+"&firstAccess=true")); %>"><%= productId %></a></td>
      <td colspan="2"><%= sellQuantity %></td>
      <td colspan="3"><%= subTotalImport %></td>
      <td colspan="2"><%= subTotal %></td>
    </tr>
    <%
    if (i==(v.size()-1)) { printTotalPrice=true;}
    else {
      String r = ((buy.BuyPK)((buy.Buy)v.elementAt(i+1)).getPrimaryKey()).receiptNo;
      System.out.println("r="+r);
      if (!r.equals(receiptNo)) { printTotalPrice = true; }
    }
    if (printTotalPrice) {
  %>
    <tr> 
      <td bgcolor="#FFFFCC" colspan="3" align="right"><b>Total Price :</b></td>
      <td bgcolor="#FFFFCC" colspan="3" align="right"><%= totalImportPrice %></td>
      <td colspan="3" align="center" bgcolor="#FFFFCC"><%= totalPrice %></td>
    </tr>
  </table>
  <br>
<%
      printTotalPrice = false;
    }
  }
%>
<%
  }
  }
%>
</form>
</body>
</html>
