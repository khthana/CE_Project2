<HTML>
<HEAD>
<jsp:useBean id="viewProduct2BeanId" scope="session" class="view.ViewProduct2Bean" />
<jsp:setProperty name="viewProduct2BeanId" property="*" />
<TITLE>
ViewProduct2
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
  base.BaseAttribute baseAttribute;
  blueprint.Blueprint blueprint;
  String[][] sortResult;
  String[][] attributeRef;
  Vector attribOfCat;
  String productId;
  String message;
  String error;
  String submit;
  boolean showDetail;
  String userType;
%>
<%
  session = request.getSession(true);
  quote.Quote quote = (quote.Quote)session.getValue("quote");
  if (quote!=null) {
    customer.Customer customer = quote.getCustomer();
    userType = customer.getUserType();
  }
  if (viewProduct2BeanId.getFirstAccess()) {
    productId = request.getParameter("productId");
    baseAttribute = base.BaseAttribute.getBaseAttribute();
    blueprint = viewProduct2BeanId.getBlueprint(productId);
    String category = blueprint.getCategory();
    attribOfCat = baseAttribute.getAttribOfProduct(category);
    sortResult = blueprint.sortAttribute(attribOfCat);
	viewProduct2BeanId.setFilePic1(null);
	viewProduct2BeanId.setFilePic2(null);
    viewProduct2BeanId.loadFilePic(productId);
  }
    submit = request.getParameter("Submit");
    if (submit !=null) {
      if (submit.equals("Search")) {
        String s = request.getParameter("searchProductId");
        if (viewProduct2BeanId.findProductId(s)) {
        response.sendRedirect(response.encodeURL("/product/EditProduct.jsp?productId="+s+"&firstAccess=true"));
        } else error = "product ID is not exist";
      } else
      if (submit.equals("Edit Detail")) {
        response.sendRedirect(response.encodeURL("/product/EditProduct.jsp?productId="+productId+"&firstAccess=true"));
      } else
      if (submit.equals("Edit Advertise")) {
        response.sendRedirect(response.encodeURL("/product/UploadFile.jsp?productId="+productId+"&firstAccess=true"));
      } else
      if (submit.equals("Add Advertise")) {
        if (viewProduct2BeanId.findProductId(productId)) {
        response.sendRedirect(response.encodeURL("/product/UploadFile.jsp?productId="+productId+"&firstAccess=true"));
        } else error = "product ID is not exist,Can not add advertise";
      } else
      if (submit.equals("Yes")) {
        if (viewProduct2BeanId.checkDeleteProductId(productId)) {
        try {
          viewProduct2BeanId.deleteAdvertise(productId);
          blueprint.deleteProduct();
          error = "delete this productId success";
          productId = null;
        } catch (Exception ex) { ex.printStackTrace(); }
        } else { error = "productID is used to buy my product. Cann't delete this productID"; }
      } else
      if (submit.equals("No")) {
        response.sendRedirect(response.encodeURL("/product/ViewProduct2.jsp?productId="+productId+"&firstAccess=true"));
      } else
      if (submit.equals("yes")) {
        try {
          viewProduct2BeanId.deleteAdvertise(productId);
          error = "delete this advertise of product ID success";
          productId = null;
        } catch (Exception ex) { ex.printStackTrace(); }
      } else
      if (submit.equals("no")) {
        response.sendRedirect(response.encodeURL("/product/ViewProduct2.jsp?productId="+productId+"&firstAccess=true"));
      }
    }
%>
    <form name="form1" method="post" action="ViewProduct2.jsp" >
  <p>&nbsp;</p>
  <p align="left"><font size="+3"><b><font size="6" color="#0099FF" face="Comic Sans MS">View</font></b></font></p>
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


<%       if ( productId != null) {               %>
<%
  if (submit !=null && (submit.equals("Delete All") || submit.equals("Delete"))) {
  %>
  <table width="75%" border="0" height="1%">
    <tr>
      <td align="right" width="68%"><b>Do you want to delete Product_ID "<%= productId %>"</b></td>
      <td width="32%">
        <input type="submit" name="Submit" value="Yes">
        <input type="submit" name="Submit" value="No">
      </td>
    </tr>
  </table>
  <%
  }
%>
<%
  if (submit !=null && submit.equals("Delete Advertise")) {
  viewProduct2BeanId.setShowDetail(false);
  %>
  <table width="75%" border="0" height="1%">
    <tr>
      <td align="right" width="77%"><b>Do you want to delete advertise of this
        Product_ID "<%= productId %>"</b></td>
      <td width="23%">
        <input type="submit" name="Submit" value="yes">
        <input type="submit" name="Submit" value="no">
      </td>
    </tr>
  </table>
  <%
  }
%>

<%
  String head = viewProduct2BeanId.getHead();
  System.out.println("head = "+head);
  if (head!=null && !head.equals("")) {
  %>
  <table width="75%" border="0">
  <tr align="center">
    <td>
    <font size="4"><b><%= head%></b></font>
    </td>
  </tr>
  </table>
  <%
  }
%>
<%
  String filePic1 = viewProduct2BeanId.getFilePic1();
  System.out.println("filePic1 = "+filePic1);
  if (filePic1!=null && !filePic1.equals("")) {
  %>
    <table width="75%" border="0">
    <tr align="center">
      <td>
      <img src="<%= filePic1 %>" width="350" height="300">
      </td>
    </tr>
    </table>
  <%
  }
%>

<% if (viewProduct2BeanId.getShowDetail()) {  %>

  <table width="75%" border="0" height="1">
    <%
    for (int i=0; i<sortResult.length; i++) {
      if (sortResult[i][2].equals("true")) {
        if (quote==null || (userType!=null && userType.equals("Customer"))) {
        if (i>17 && i!=20) continue;
        }
      %>
    <tr>
      <td width="22%">&nbsp;</td>
      <td width="30%"><b><font size="1"><%= sortResult[i][0] %> </font></b></td>
      <td width="48%"><font size="1"> <%= sortResult[i][1] %> </font></td>
    </tr>
    <%
      }
    }
    %>
  </table>
<% } %>

<%
  String abstracts = viewProduct2BeanId.getAbstracts();
  if (abstracts!=null && !abstracts.equals("")) {
  %>
  <table width="75%" border="0">
  <tr align="center">
    <td>
    <p><font size="3"><%= abstracts%></font></p>
    </td>
  </tr>
  </table>
  <%
  }
%>
<%
  String filePic2 = viewProduct2BeanId.getFilePic2();
  System.out.println("filePic2 = "+filePic2);
  if (filePic2!=null && !filePic2.equals("")) {
  %>
    <table width="75%" border="0">
    <tr align="center">
      <td>
      <img src="<%= filePic2 %>" width="350" height="300">
      </td>
    </tr>
    </table>
  <%
  }
%>
<%
  String textfield = viewProduct2BeanId.getTextfield();
  if (textfield!=null && !textfield.equals("")) {
  %>
  <br>
  <table width="75%" border="0">
  <tr align="center">
    <td>
    <p><font size="3"><%= textfield%></font></p>
    </td>
  </tr>
  </table>
  <%
  }
%>
<% if (userType!=null && (userType.equals("Administrator")||userType.equals("Manager"))) { %>
  <p>&nbsp;</p>
  <table width="75%" border="0" >
    <tr>
<%
  if (viewProduct2BeanId.getHavePic()) {
  %>
      <td width="26%" align="right">
        <input type="submit" name="Submit" value="Edit Advertise">
      </td>
  <% } else {
  %>
      <td width="26%" align="right">
        <input type="submit" name="Submit" value="Add Advertise">
      </td>
  <% }
%>
      <td width="16%">
        <input type="submit" name="Submit" value="Edit Detail">
      </td>
<%
  if (viewProduct2BeanId.getHavePic()) {
  %>
      <td width="33%" align="right">
        <input type="submit" name="Submit" value="Delete Advertise">
      </td>
  <% }
%>
<%
  if (viewProduct2BeanId.getHavePic()) {
  %>
      <td width="25%">
        <input type="submit" name="Submit" value="Delete All">
      </td>
  <% } else {
  %>
      <td width="25%">
        <input type="submit" name="Submit" value="Delete">
      </td>
  <% }
%>
    </tr>
  </table>
<% } %>
<% } %>
</form>
 <br>
   <p>&nbsp;</p>
<% viewProduct2BeanId.setFirstAccess(false);
  viewProduct2BeanId.setShowDetail(true);
%>
</body>
</html>
