<HTML>
<HEAD>
<jsp:useBean id="ViewQuoteBeanId" scope="session" class="view.ViewQuoteBean" />
<jsp:setProperty name="ViewQuoteBeanId" property="*" />
<TITLE>
ViewQuote
</TITLE>
</HEAD>
<BODY>
<form name="form1" action="PurchaseServletAlias" method="get">
  <p><font color="#0099FF"><b><font size="6" face="Comic Sans MS">View Product</font></b></font></p>
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
  System.out.println("start view quote");
  totalPrice = 0;
    session = request.getSession(true);
    quote = (quote.Quote)session.getValue("quote");
    if (quote!=null) {
    if (quote.getNumberOfLineItem() != 0 ){
      ViewQuoteBeanId.setQuote(quote);
      baseAttribute = base.BaseAttribute.getBaseAttribute();
      customer = quote.getCustomer();
%>
  <table width="75%" border="0">
    <tr> 
      <td width="40%"> 
        <div align="right"><b><font size="4">customer name :</font></b></div>
      </td>
      <td width="35%"><b><font size="4"> 
        <% out.print(customer.getUsername()); %>
        </font></b></td>
      <td width="35%"><font size="4"></font></td>
    </tr>
    <tr> 
      <td width="40%"> 
        <div align="right"><b><font size="2">your credit ID is :</font></b></div>
      </td>
      <td width="35%"><font size="2"> 
        <% out.print(customer.getCreditId()); %>
        </font></td>
      <td width="35%"><font size="2"></font></td>
    </tr>
    <tr> 
      <td width="40%"> 
        <div align="right"><b><font size="2">password :</font></b></div>
      </td>
      <td width="35%"> <font size="2"><b> 
        <input type="password" name="password">
        </b></font></td>
      <td width="35%"> <font size="2"> 
        <input type="submit" name="Submit" value="buy">
        </font></td>
    </tr>
    <%
    String error = (String) session.getValue("err_cred");
    if (error!=null && !error.equals("")) {
%>
    <tr> 
      <td width="40%"> 
        <div align="right"><b><font size="2"></font></b></div>
      </td>
      <td width="35%" color="#FF0000"><font size="2"> 
        <% 
		    out.println("<b><font color=\"#FF0000\" size=\"2\">");
			out.print(error); 
		    out.println("</font></b>");
		%>
        </font></td>
      <td width="35%"><font size="2"></font></td>
    </tr>
    <%
    session.removeValue("err_cred");
    }
%>
  </table>
  <br><br>
<%
      lineItems = quote.getLineItems();
%>
  <table width="75%" border="1">
    <tr bgcolor="#FFFFCC"> 
      <td> 
        <div align="center"><font color="#0099FF"><b>Product Id</b></font></div>
      </td>
      <td> 
        <div align="center"><font color="#0099FF"><b>Category</b></font></div>
      </td>
      <td> 
        <div align="center"><font color="#0099FF"><b>Discription</b></font></div>
      </td>
      <td> 
        <div align="center"><font color="#0099FF"><b>Quantity</b></font></div>
      </td>
      <td> 
        <div align="center"><font color="#0099FF"><b>Price (/piece)</b></font></div>
      </td>
      <td> 
        <div align="center"><font color="#0099FF"><b>Total Price</b></font></div>
      </td>
      <td> 
        <div align="center"><b><font color="#0099FF"></font></b></div>
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
        out.println("<td> <input type=\"text\" name=\"quantity"+
            blueprint.getProductId()+"\" size=\"3\" value =\""+
            qli.getBuyQuantity()+"\" ></td>");
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
  <input type="hidden" name="action" value="Update">
  <p>&nbsp;</p>
  <table width="75%" border="0">
    <tr>
      <td width="4%">&nbsp;</td>
      <td width="26%">&nbsp;</td>
      <td width="24%">
        <input type="submit" name="Submit" value="Update">
      </td>
      <td width="38%">
        <input type="submit" name="Submit" value="Clear">
      </td>
      <td width="4%">&nbsp;</td>

      <td width="4%"> </td>
   </tr>
  </table>
<%
  } else { out.println("<b>"+"<font color=\"#FF0000\">"+"your quote is empty"+"</font>"+"</b>");
  }
  } else { out.println("You must Login before receive quote");
  }
%>
  <p>&nbsp;</p>
</form>



</BODY>
</HTML>
