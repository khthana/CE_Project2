<HTML>
<HEAD>
<jsp:useBean id="editProductBeanId" scope="session" class="edit.EditProductBean" />
<jsp:setProperty name="editProductBeanId" property="*" />
<TITLE>
EditProduct
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body bgcolor="#FFFFFF" text="#000000">
<%!
  HttpSession session;
  quote.Quote quote;
  base.BaseAttribute baseAttribute;
  blueprint.Blueprint blueprint;
  String[][] sortResult;
  String[][] attributeRef;
  Vector attribOfCat;
  String message;
  String submit;
  String productId;
  String error;
  public boolean checkAttribute() {
  try {
    Integer.valueOf(sortResult[18][1]).intValue();
  } catch (Exception e) {
    message = "quantity must be whole number";
    return false;
  }
  try {
    Double.valueOf(sortResult[19][1]).doubleValue();
  } catch (Exception e) {
    message = "Import Price must be number";
    return false;
  }
  try {
    Double.valueOf(sortResult[20][1]).doubleValue();
  } catch (Exception e) {
    message = "Sell Price must be number";
    return false;
  }
      try {
        int lowQuan = Integer.valueOf(sortResult[22][1]).intValue();
        if (lowQuan>0) {
          message = "Low Sell Quantity must lower or equal zero";
          return false;
        }
      } catch (Exception ex) {
        message = "Low Sell Quantity must be whole number";
        return false;
      }
    String s = sortResult[21][1];
    int a = s.indexOf('/',0);
    int b = s.indexOf('/',a+1);
      try {
        int d = Integer.valueOf(s.substring(0,a)).intValue();
        if (d>31) {
          message = "Date must lower or equal 31";
          return false;
        }
      } catch (Exception ex) {
        message = "Date must be whole number";
        return false;
      }
      try {
        int m = Integer.valueOf(s.substring(a+1,b)).intValue();
        if (m>12) {
          message = "Month must lower or equal 12";
          return false;
        }
      } catch (Exception ex) {
        message = "Month must be whole number";
        return false;
      }
      try {
        int y = Integer.valueOf(s.substring(b+1)).intValue();
        if (y<1900) {
          message = "Year must larger 1900";
          return false;
        }
      } catch (Exception ex) {
        message = "Year must be whole number";
        return false;
      }
  return true;
  }
%>
<%
  session = request.getSession(true);
  quote.Quote quote = (quote.Quote)session.getValue("quote");
  if (quote!=null) {
  customer.Customer customer = quote.getCustomer();
  String userType = customer.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
System.out.println("firstAccess = true");
  if (editProductBeanId.getFirstAccess()) {
    productId = request.getParameter("productId");
System.out.println("productId = "+productId);
    baseAttribute = base.BaseAttribute.getBaseAttribute();
    blueprint = editProductBeanId.getBlueprint(productId);
    String category = blueprint.getCategory();
    attribOfCat = baseAttribute.getAttribOfProduct(category);
    sortResult = blueprint.sortAttribute(attribOfCat);
System.out.println("1111111111");
  }
    submit = request.getParameter("Submit");
    if (submit !=null) {
      if (submit.equals("Delete")) {
        response.sendRedirect(response.encodeURL("/product/ViewProduct2.jsp?productId="+productId+"&firstAccess=true&Submit=Delete"));
      } else
      if (submit.equals("Search")) {
        String s = request.getParameter("searchProductId");
        if (editProductBeanId.findProductId(s)) {
        response.sendRedirect(response.encodeURL("/product/EditProduct.jsp?productId="+s+"&firstAccess=true"));
        } else error = "productId is not exist";
      } else
      if (submit.equals("Update")) {
  java.util.Enumeration enum = request.getParameterNames();
  if (!editProductBeanId.getFirstAccess()) {
  while (enum.hasMoreElements()) {
    String parameterName = (String)enum.nextElement();
    for (int i=0; i<sortResult.length; i++) {
    if (sortResult[i][0].equals(parameterName)) {
      String value = request.getParameter(parameterName);
      sortResult[i][1] = value;
    }
    }
  }
  if (checkAttribute()) {
    blueprint.updateBlueprint(sortResult);
    blueprint.updateProduct();
    message = "update product ok";
  }
  }
      }
    }

%>
    <form name="form1" method="post" action="EditProduct.jsp" >
<%
  if (message!=null && !message.equals("")) {
    out.println(message);
    message = null;
  }
%>
  <p>&nbsp;</p>
  <p align="left"><font size="+3"><b><font size="6" color="#0099FF" face="Comic Sans MS">Edit 
    Product</font></b></font></p>
  <table width="75%" border="0">
    <tr>
      <td align="right" width="36%"><b>Product ID :</b></td>
      <td width="64%">
        <input type="text" name="searchProductId">
        <input type="submit" name="Submit" value="Search">
      </td>
    </tr>
<% if (error!=null && !error.equals("")) { %>
    <tr>
      <td align="right" width="36%"></td>
      <td width="64%">
      <%= error %>
      </td>
    </tr>
<% error = null;
   }
%>
    </table>
    <br>
<%
    out.println("<table width=\"75%\" border=\"0\">");
      out.println("<tr>");
      out.println("<td bgcolor=\"#FFCCFF\">"+sortResult[0][0]+"</td>");
      out.println("<td bgcolor=\"#FFCCCC\">"+sortResult[0][1]+"</td>");
      out.println("</tr>");
      out.println("<tr>");
      out.println("<td bgcolor=\"#FFCCFF\">"+sortResult[1][0]+"</td>");
      out.println("<td bgcolor=\"#FFCCCC\">"+sortResult[1][1]+"</td>");
      out.println("</tr>");
    for (int i=2; i<sortResult.length; i++) {
      if (sortResult[i][2].equals("true")) {
      out.println("<tr>");
      out.println("<td bgcolor=\"#FFCCFF\">"+sortResult[i][0]+"</td>");
      out.print("<td bgcolor=\"#FFCCCC\"> <input type=\"text\" name=\"");
      out.print(sortResult[i][0]);
      out.println("\" size=\"40\" value=\""+sortResult[i][1]+"\" > </td>");
      out.println("</tr>");
      }
    }
    out.println("</table>");
  }
%>
  <p>&nbsp;</p>
  <table width="75%" border="0">
    <tr>
      <td width="22%">&nbsp;</td>
      <td width="20%">
        <input type="submit" name="Submit" value="Update">
      </td>
      <td width="12%">&nbsp;</td>
      <td width="46%">
        <input type="reset" name="reset" value="Reset">
      </td>
      <td width="20%">
        <input type="submit" name="Submit" value="Delete">
      </td>
    </tr>
  </table>
</form>
<%
  }
%>
 <br>
   <p>&nbsp;</p>
<% editProductBeanId.setFirstAccess(false); %>
</body>
</html>
