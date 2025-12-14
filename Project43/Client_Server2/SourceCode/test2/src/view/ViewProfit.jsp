<HTML>
<HEAD>
<jsp:useBean id="ViewProfitBeanId" scope="session" class="view.ViewProfitBean" />
<jsp:setProperty name="ViewProfitBeanId" property="*" />
<TITLE>
ViewProfit
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%!
  HttpSession session;
  quote.Quote quote;
  buy.BuyHome buyHome;
  int d=0,m=0,y=0;

  public Long getLongDate(String s) {
    int a = s.indexOf('/',0);
    int b = s.indexOf('/',a+1);
    int d = Integer.valueOf(s.substring(0,a)).intValue();
    int m = Integer.valueOf(s.substring(a+1,b)).intValue();
    int y = Integer.valueOf(s.substring(b+1)).intValue();
    long longDate = (new java.util.Date(y-1900,m-1,d)).getTime();
    return new Long(longDate);
  }
%>
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
      String tmpSql = "";
      if (userType.equals("Administrator") || userType.equals("Manager")) {
%>
<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0">
  <tr bgcolor="#FFFFCC"> 
      <td> 
        <div align="center"><a href="http://161.246.6.111:8000/product/SearchProductJSP.jsp" target="_self"><font color="#0099FF" size="2" face="Comic Sans MS"><b>Search 
          Product</b></font></a></div>
      </td>
      <td> 
        <div align="center"><a href="http://161.246.6.111:8000/product/SearchCustomer.jsp" target="_self"><font color="#0099FF" size="2" face="Comic Sans MS"><b>Search 
          Customer</b></font></a></div>
      </td>
      <td> 
        <div align="center"><a href="http://161.246.6.111:8000/product/SearchBuyJSP.jsp"><font color="#0099FF" size="2" face="Comic Sans MS"><b>Search 
          Buy</b></font></a></div>
      </td>
      <td> 
        <div align="center"><a href="http://161.246.6.111:8000/product/ViewFirstPage.jsp" target="_self"><font color="#0099FF" size="2" face="Comic Sans MS"><b>View 
          Buy Detail</b></font></a></div>
      </td>
      <td> 
        <div align="center"><a href="http://161.246.6.111:8000/product/ViewCategory.jsp" target="_self"><font color="#0099FF" size="2" face="Comic Sans MS"><b>View 
          Category</b></font></a></div>
      </td>
    </tr>
    <tr> 
      <td bgcolor="#FFFFCC"> 
        <div align="center"><a href="http://161.246.6.111:8000/product/AddProduct.jsp" target="_self"><font color="#0099FF" size="2" face="Comic Sans MS"><b>Add 
          Product</b></font></a></div>
      </td>
      <td bgcolor="#FFFFCC"> 
        <div align="center"><a href="http://161.246.6.111:8000/product/AddCategory.jsp" target="_self"><font color="#0099FF" size="2" face="Comic Sans MS"><b>Add 
          Category</b></font></a></div>
      </td>
      
    <td bgcolor="#FFCCCC"> 
      <div align="center"><a href="http://161.246.6.111:8000/product/ViewProfit.jsp" target="_self"><b><font color="#0099FF" size="2" face="Comic Sans MS">View 
          Profit </font></b></a></div>
      </td>
      <td> 
        <div align="center"><b><font color="#0099FF"><font color="#0099FF"><font size="2"><font size="2"><font face="Comic Sans MS"></font></font></font></font></font></b></div>
      </td>
      <td> 
        <div align="center"><b><font color="#0099FF"><font color="#0099FF"><font size="2"><font size="2"><font face="Comic Sans MS"></font></font></font></font></font></b></div>
      </td>
    </tr>
  </table>
<form name="form1" method="post" action="ViewProfit.jsp">
  <p><font size="6" color="#0099FF"><b><font face="Comic Sans MS">View Profit</font></b></font></p>
<%
    String submit = request.getParameter("Submit");
    if (submit==null) {
%>
  <table width="75%" border="0" bgcolor="#DDDDDD">
    <tr>
      <td width="19%"><b>Sell Date :</b></td>
      <td width="12%">
        <input type="radio" name="sell_date" value="all" checked>
        All </td>
      <td width="13%">
        <input type="radio" name="sell_date" value="equal">
        Equal </td>
      <td width="15%" align="center">
        <input type="radio" name="sell_date" value="more">
        More </td>
      <td width="16%">
        <input type="radio" name="sell_date" value="lower">
        Lower </td>
      <td width="25%">
        <p>
          <input type="text" name="sell_dateText" size="11">
          <br>
          <i><font size="1">(Ex 19/5/2543)</font></i></p>
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="sell_date" value="between">
        Between </td>
      <td width="15%">
        <input type="text" name="sell_dateB1" size="11">
      </td>
      <td align="center" width="16%">to</td>
      <td width="25%">
        <input type="text" name="sell_dateB2" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%">&nbsp;</td>
      <td colspan="2">&nbsp; </td>
      <td width="15%">
        <input type="submit" name="Submit" value="Search">
      </td>
      <td width="16%">&nbsp;</td>
      <td width="25%">&nbsp;</td>
    </tr>
  </table>
  <p>&nbsp;</p>
<% } else { %>
  <table width="75%" border="1">
    <tr bgcolor="#FFFFCC" align="center"> 
      <td><b>Receipt No</b></td>
      <td><b>Username</b></td>
      <td><b>Sell Date</b></td>
      <td><b>SubTotal Import Price</b></td>
      <td><b>SubTotal Sell Price</b></td>
    </tr>
<%
        String sell_date = request.getParameter("sell_date");
        String sell_dateValue;
        Long longTime1 = null;
        Long longTime2 = null;
        if (sell_date!=null) {
        if (sell_date.equals("all")) {
        } else {
        if (tmpSql!=null && !tmpSql.equals("")) { tmpSql=tmpSql+" and "; }
        if (sell_date.equals("between")) {
          tmpSql = tmpSql + "sell_date between ? and ?";
          sell_dateValue = request.getParameter("sell_dateB1").trim();
          longTime1 = getLongDate(sell_dateValue);
          sell_dateValue = request.getParameter("sell_dateB2").trim();
          longTime2 = getLongDate(sell_dateValue);
        } else {
        if (sell_date.equals("equal"))  { tmpSql = tmpSql + "sell_date = ?"; }
        else if (sell_date.equals("more")) { tmpSql = tmpSql + "sell_date >= ?"; }
        else if (sell_date.equals("lower")) { tmpSql = tmpSql + "sell_date <= ?"; }
          sell_dateValue = request.getParameter("sell_dateText").trim();
          longTime1 = getLongDate(sell_dateValue);
        }
        }
        }
    if (tmpSql!=null && !tmpSql.equals("")) {tmpSql = " where "+tmpSql;}
    java.util.Collection c = buyHome.findByCondition(tmpSql,longTime1,longTime2);
    java.util.Iterator i = c.iterator();
    double totalImport = 0;
    double totalSell = 0;
    String oldReceiptNo = "";
    while (i.hasNext()) {
      buy.Buy buy = (buy.Buy)i.next();
      String receiptNo = buy.getReceiptNo();
      String username = buy.getUsername();
      if (receiptNo.equals(oldReceiptNo)) {continue;}
      if (!receiptNo.equals(oldReceiptNo)) {
        oldReceiptNo = receiptNo;
      }
      java.util.Date date = new java.util.Date(buy.getSellDate().getTime());
      d = date.getDate();
      m = date.getMonth()+1;
      y = date.getYear()+1900;
      double subTotalImport = buy.getSumTotalImportPrice(receiptNo,username);
      double subTotalSell = buy.getSumTotalSellPrice(receiptNo,username);
      totalImport = totalImport + subTotalImport;
      totalSell = totalSell + subTotalSell;
%>
    <tr align="center">
      <td><a href="<% out.println(response.encodeURL("ViewReceipt.jsp?receiptNo="+receiptNo)); %>"><%= receiptNo %></a></td>
      <td><a href="<% out.println(response.encodeURL("ViewCustomer2.jsp?username="+username+"&firstAccess=true")); %>"><%= username %></a></td>
      <td><% out.print(d+"/"+m+"/"+y); %></td>
      <td><%= subTotalImport %></td>
      <td><%= subTotalSell %></td>
    </tr>
<% } %>
    <tr align="center">
      <td colspan="3" align="right"><b>Total :</b></td>
      <td><%= totalImport %></td>
      <td><%= totalSell %></td>
    </tr>
    <tr align="center">
      <td colspan="3" align="right"><b>Profit :</b></td>
      <td colspan="2"><% out.println(totalSell-totalImport); %></td>
    </tr>
  </table>
<% } %>
</form>
</body>
<%
  }
  }
%>
</html>
