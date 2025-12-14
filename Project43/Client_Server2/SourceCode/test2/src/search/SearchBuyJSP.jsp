<HTML>
<HEAD>
<jsp:useBean id="SearchBuyJSPBeanId" scope="session" class="search.SearchBuyJSPBean" />
<jsp:setProperty name="SearchBuyJSPBeanId" property="*" />
<TITLE>
SearchBuyJSP
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%!
  HttpSession session;
  quote.Quote quote;
  String message = "";
  public boolean checkAttribute(HttpServletRequest request) {
  System.out.println("in checkAttribute");
    String b1Value;
    String b2Value;
    String textValue;
    String sell_quantity = request.getParameter("sell_quantity");
  System.out.println("sell_quantity  = "+sell_quantity);
  if (sell_quantity==null) {return false;}
    if (sell_quantity!=null) {
    if (sell_quantity.equals("all")) {
    } else {
    if (sell_quantity.equals("between")) {
      b1Value = request.getParameter("sell_quantityB1");
      b2Value = request.getParameter("sell_quantityB2");
      try {
        Integer.valueOf(b1Value.trim()).intValue();
        Integer.valueOf(b2Value.trim()).intValue();
      } catch (Exception e) {
        message = "Sell Quantity for search must be whole number";
        return false;
      }
    } else {
    if (sell_quantity.equals("equal")||sell_quantity.equals("more")||sell_quantity.equals("lower")) {
      textValue = request.getParameter("sell_quantityText");
      try {
        Integer.valueOf(textValue.trim()).intValue();
      } catch (Exception e) {
        message = "Sell Quantity for search must be whole number";
        return false;
      }
    }}}
    }

    String totalQuanSell = request.getParameter("totalQuanSell");
    if (totalQuanSell!=null) {
    if (totalQuanSell.equals("all")) {
    } else {
    if (totalQuanSell.equals("between")) {
      b1Value = request.getParameter("totalQuanSellB1");
      b2Value = request.getParameter("totalQuanSellB2");
      try {
        Integer.valueOf(b1Value.trim()).intValue();
        Integer.valueOf(b2Value.trim()).intValue();
      } catch (Exception e) {
        message = "Total Quantity Sell for search must be whole number";
        return false;
      }
    } else {
    if (totalQuanSell.equals("equal")||totalQuanSell.equals("more")||totalQuanSell.equals("lower")) {
      textValue = request.getParameter("totalQuanSellText");
      try {
        Integer.valueOf(textValue.trim()).intValue();
      } catch (Exception e) {
        message = "Total Quantity Sell for search must be whole number";
        return false;
      }
    }}}
    }

    String total_price = request.getParameter("total_price");
    if (total_price!=null) {
    if (total_price.equals("all")) {
    } else {
    if (total_price.equals("between")) {
      b1Value = request.getParameter("total_priceB1");
      b2Value = request.getParameter("total_priceB2");
      try {
        Double.valueOf(b1Value.trim()).doubleValue();
        Double.valueOf(b2Value.trim()).doubleValue();
      } catch (Exception e) {
        message = "SubTotal Price for search must be number";
        return false;
      }
    } else {
    if (total_price.equals("equal")||total_price.equals("more")||total_price.equals("lower")) {
      textValue = request.getParameter("total_priceText");
      try {
        Double.valueOf(textValue.trim()).doubleValue();
      } catch (Exception e) {
        message = "SubTotal Price for search must be number";
        return false;
      }
    }}}
    }

    String totalPrice = request.getParameter("totalPrice");
    if (totalPrice!=null) {
    if (totalPrice.equals("all")) {
    } else {
    if (totalPrice.equals("between")) {
      b1Value = request.getParameter("totalPriceB1");
      b2Value = request.getParameter("totalPriceB2");
      try {
        Double.valueOf(b1Value.trim()).doubleValue();
        Double.valueOf(b2Value.trim()).doubleValue();
      } catch (Exception e) {
        message = "Total Price for search must be number";
        return false;
      }
    } else {
    if (totalPrice.equals("equal")||totalPrice.equals("more")||totalPrice.equals("lower")) {
      textValue = request.getParameter("totalPriceText");
      try {
        Double.valueOf(textValue.trim()).doubleValue();
      } catch (Exception e) {
        message = "Total Price for search must be number";
        return false;
      }
    }}}
    }

    String sell_date = request.getParameter("sell_date");
    if (sell_date!=null) {
    if (sell_date.equals("all")) {
    } else {
    if (sell_date.equals("between")) {
      b1Value = request.getParameter("sell_dateB1");
      String s = b1Value;
      int a = s.indexOf('/',0);
      int b = s.indexOf('/',a+1);
      try {
        int d = Integer.valueOf(s.substring(0,a)).intValue();
        if (d>31) {
          message = "Date for search must lower or equal 31";
          return false;
        }
      } catch (Exception ex) {
        message = "Date for search must be whole number";
        return false;
      }
      try {
        int m = Integer.valueOf(s.substring(a+1,b)).intValue();
        if (m>12) {
          message = "Month for search must lower or equal 12";
          return false;
        }
      } catch (Exception ex) {
        message = "Month for search must be whole number";
        return false;
      }
      try {
        int y = Integer.valueOf(s.substring(b+1)).intValue();
        if (y<1900) {
          message = "Year for search must larger 1900";
          return false;
        }
      } catch (Exception ex) {
        message = "Year for search must be whole number";
        return false;
      }
      b2Value = request.getParameter("sell_dateB2");
      s = b2Value;
      a = s.indexOf('/',0);
      b = s.indexOf('/',a+1);
      try {
        int d = Integer.valueOf(s.substring(0,a)).intValue();
        if (d>31) {
          message = "Date for search must lower or equal 31";
          return false;
        }
      } catch (Exception ex) {
        message = "Date for search must be whole number";
        return false;
      }
      try {
        int m = Integer.valueOf(s.substring(a+1,b)).intValue();
        if (m>12) {
          message = "Month for search must lower or equal 12";
          return false;
        }
      } catch (Exception ex) {
        message = "Month for search must be whole number";
        return false;
      }
      try {
        int y = Integer.valueOf(s.substring(b+1)).intValue();
        if (y<1900) {
          message = "Year for search must larger 1900";
          return false;
        }
      } catch (Exception ex) {
        message = "Year for search must be whole number";
        return false;
      }

    } else {
    if (sell_date.equals("equal")||sell_date.equals("more")||sell_date.equals("lower")) {
      textValue = request.getParameter("sell_dateText");
      String s = textValue;
      int a = s.indexOf('/',0);
      int b = s.indexOf('/',a+1);
      try {
        int d = Integer.valueOf(s.substring(0,a)).intValue();
        if (d>31) {
          message = "Date for search must lower or equal 31";
          return false;
        }
      } catch (Exception ex) {
        message = "Date for search must be whole number";
        return false;
      }
      try {
        int m = Integer.valueOf(s.substring(a+1,b)).intValue();
        if (m>12) {
          message = "Month for search must lower or equal 12";
          return false;
        }
      } catch (Exception ex) {
        message = "Month for search must be whole number";
        return false;
      }
      try {
        int y = Integer.valueOf(s.substring(b+1)).intValue();
        if (y<1900) {
          message = "Year for search must larger 1900";
          return false;
        }
      } catch (Exception ex) {
        message = "Year for search must be whole number";
        return false;
      }
    }}}
    }
  return true;
  }
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
    <td bgcolor="#FFCCCC"> 
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
    <td bgcolor="#FFFFCC"> 
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
<form name="form1" method="post" action="SearchBuyJSP.jsp">
<%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
%>
<%
  if (checkAttribute(request)) {
    getServletConfig().getServletContext().getRequestDispatcher("/SearchBuyServletAlias").forward(request,response);
  } else {
    out.println(message);
  }
%>
  <p><font size="6" color="#0099FF"><b><font face="Comic Sans MS">Search</font></b></font></p>
  <table width="100%" border="0" bgcolor="#FFCCFF">
    <tr>
      <td width="19%">
        <div align="right"><b>Username :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="username" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="username" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="username" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="username" value="lower">
        Lower </td>
      <td width="25%"> 
        <input type="text" name="usernameText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="username" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="usernameB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="25%"> 
        <input type="text" name="usernameB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCCC">
    <tr>
      <td width="19%">
        <div align="right"><b>Product ID :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="product_id" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="product_id" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="product_id" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="product_id" value="lower">
        Lower </td>
      <td width="25%"> 
        <input type="text" name="product_idText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="product_id" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="product_idB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="25%"> 
        <input type="text" name="product_idB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFFFCC">
    <tr>
      <td width="19%" height="33">
        <div align="right"><b>Receipt No :</b></div>
      </td>
      <td width="10%" height="33"> 
        <input type="radio" name="receipt_no" value="all" checked>
        All </td>
      <td width="10%" height="33"> 
        <input type="radio" name="receipt_no" value="equal">
        Equal </td>
      <td width="11%" align="center" height="33"> 
        <input type="radio" name="receipt_no" value="more">
        More </td>
      <td width="11%" height="33"> 
        <input type="radio" name="receipt_no" value="lower">
        Lower </td>
      <td width="25%" height="33"> 
        <input type="text" name="receipt_noText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="receipt_no" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="receipt_noB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="25%"> 
        <input type="text" name="receipt_noB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCFF">
    <tr>
      <td width="19%">
        <div align="right"><b>Sub Quantity Sell :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="sell_quantity" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="sell_quantity" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="sell_quantity" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="sell_quantity" value="lower">
        Lower </td>
      <td width="25%"> 
        <input type="text" name="sell_quantityText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="sell_quantity" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="sell_quantityB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="25%"> 
        <input type="text" name="sell_quantityB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCCC">
    <tr>
      <td width="19%">
        <div align="right"><b>Total Quantity Sell :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="totalQuanSell" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="totalQuanSell" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="totalQuanSell" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="totalQuanSell" value="lower">
        Lower </td>
      <td width="25%"> 
        <input type="text" name="totalQuanSellText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="totalQuanSell" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="totalQuanSellB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="25%"> 
        <input type="text" name="totalQuanSellB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFFFCC">
    <tr>
      <td width="19%">
        <div align="right"><b>SubTotal Price :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="total_price" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="total_price" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="total_price" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="total_price" value="lower">
        Lower </td>
      <td width="25%"> 
        <input type="text" name="total_priceText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="total_price" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="total_priceB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="25%"> 
        <input type="text" name="total_priceB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCFF">
    <tr>
      <td width="19%">
        <div align="right"><b>Total Price :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="totalPrice" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="totalPrice" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="totalPrice" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="totalPrice" value="lower">
        Lower </td>
      <td width="25%"> 
        <input type="text" name="totalPriceText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="totalPrice" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="totalPriceB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="25%"> 
        <input type="text" name="totalPriceB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCCC">
    <tr>
      <td width="19%">
        <div align="right"><b>Sell Date :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="sell_date" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="sell_date" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="sell_date" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="sell_date" value="lower">
        Lower </td>
      <td width="25%"> 
        <input type="text" name="sell_dateText" size="11">
        <i><font size="1">(Ex 19/5/2000)</font></i></td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="sell_date" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="sell_dateB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="25%"> 
        <input type="text" name="sell_dateB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="75%" border="0">
    <tr>
      <td align="right" width="38%">
        <input type="submit" name="Submit" value="Submit">
      </td>
      <td width="5%">&nbsp; </td>
      <td width="57%">
        <input type="reset" name="Submit2" value="Reset">
      </td>
    </tr>
  </table>
  <br>
  <p>&nbsp;</p>
<%
  }
  }
%>
</form>
</body>
</html>
