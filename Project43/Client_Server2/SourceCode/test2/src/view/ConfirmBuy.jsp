<HTML>
<HEAD>
<jsp:useBean id="ConfirmBuyBeanId" scope="session" class="view.ConfirmBuyBean" />
<jsp:setProperty name="ConfirmBuyBeanId" property="*" />
<TITLE>
ConfirmBuy
</TITLE>
</HEAD>
<BODY>
<form name="form1" action="PurchaseServletAlias" method="get">
  <p><b><font color="#0099FF" size="6" face="Comic Sans MS">Confirm Buy</font></b></p>
<%!
    HttpSession session;
    base.BaseAttribute baseAttribute;
    blueprint.Blueprint blueprint;
    Vector blueprintOfCategory;
    String category;
    Vector attributeOfProduct;
    customer.Customer customer;
    quote.Quote quote;
    Vector lineItems;
    quote.QuoteLineItem qli;
    String[][] sortResult;
    double totalPrice;
%>
<%
System.out.println("in confirm jsp");
  totalPrice = 0;
    session = request.getSession(true);
    quote = (quote.Quote)session.getValue("quote");
    if (quote!=null) {
    if (quote.getNumberOfLineItem() != 0 ){
      ConfirmBuyBeanId.setQuote(quote);
      baseAttribute = base.BaseAttribute.getBaseAttribute();
      customer = quote.getCustomer();
%>
  <table width="75%" border="0">
    <tr>
      <td width="35%"> 
        <div align="right"><b><font size="4">customer name :</font></b></div>
      </td>
      <td width="28%"><b><font size="4"><% out.print(customer.getUsername()); %></font></b></td>
      <td width="45%"><font size="4"></font></td>
    </tr>
    <tr>
      <td width="35%"> 
        <div align="right"><b><font size="2">your credit ID is :</font></b></div>
      </td>
      <td width="28%"><font size="2"><% out.print(customer.getCreditId()); %></font></td>
      <td width="45%"><font size="2"></font></td>
    </tr>
  </table>
<%
      lineItems = quote.getLineItems();
%>
  <table width="75%" border="1">
    <tr bgcolor="#FFFFCC"> 
      <td> 
        <div align="center"><b><font color="#0099FF">Product Id</font></b></div>
      </td>
      <td> 
        <div align="center"><b><font color="#0099FF">Category</font></b></div>
      </td>
      <td> 
        <div align="center"><b><font color="#0099FF">Discription</font></b></div>
      </td>
      <td> 
        <div align="center"><b><font color="#0099FF">Quantity</font></b></div>
      </td>
      <td> 
        <div align="center"><b><font color="#0099FF">Price (/piece)</font></b></div>
      </td>
      <td> 
        <div align="center"><b><font color="#0099FF">Total Price</font></b></div>
      </td>
      <td> 
        <div align="center"><font color="#0099FF"><b></b></font></div>
      </td>
    </tr>
    <%
      for (int i=0; i<lineItems.size(); i++) {
        qli = (quote.QuoteLineItem)lineItems.elementAt(i);
        String productId = qli.getProductId();
        blueprint = qli.getBlueprint();
        out.println("<tr>");
        out.println("<td>"+blueprint.getProductId()+"</td>");
        category = blueprint.getCategory();
        attributeOfProduct = baseAttribute.getAttribOfProduct(category);
        sortResult = blueprint.sortAttribute(attributeOfProduct);
        out.println("<td>"+sortResult[1][1]+"</td>");
        out.print("<td>");
          for (int j=2; j<=16; j++) {
            if (sortResult[j][2].equals("true")) out.print(sortResult[j][1]+" ");
          }
        out.println("</td>");
        out.println("<td>" +qli.getBuyQuantity()+"</td>");
        out.println("<td>"+blueprint.getSellPrice()+"</td>");
       double subTotal = qli.getBuyQuantity()*blueprint.getSellPrice();
        totalPrice = totalPrice + subTotal;
        out.println("<td>"+subTotal+"</td>");
        out.println("</tr>");
      }
      out.println("<tr></tr>");
      out.println("<tr><td></td><td></td><td>Total Price</td><td></td><td></td>"+
          "<td>"+totalPrice+"</td></tr>");
%>
  </table>
  <input type="hidden" name="action" value="">
  <p>&nbsp;</p>
  <table width="75%" border="0">
    <tr>
      <td width="32%">&nbsp;</td>
      <td width="7%">
        <input type="submit" name="Submit" value="OK">
      </td>
      <td width="10%">&nbsp;</td>
      <td width="43%">
        <input type="submit" name="Submit" value="Cancel">
      </td>
      <td width="4%">&nbsp;</td>

      <td width="4%"> </td>
   </tr>
  </table>
<%
  } else { out.println("your quote is empty");
  }
  } else { out.println("You must Login before receive quote");
  }
%>
  <p>&nbsp;</p>
</form>



</BODY>
</HTML>
