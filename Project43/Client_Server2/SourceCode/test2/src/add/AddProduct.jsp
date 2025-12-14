<html>
<head>
<jsp:useBean id="addProductBeanId" scope="session" class="add.AddProductBean" />
<jsp:setProperty name="addProductBeanId" property="*" />
<% addProductBeanId.initial();%>
<TITLE>
addProductJSP
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
<%!
  HttpSession session;
  quote.Quote quote;
%>
<%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  if (quote!=null) {
  String userType = quote.getUserType();
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
    <td bgcolor="#FFCCCC"> 
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
<form name="form1" method="post" action="AddProduct.jsp" >
<%
  if (addProductBeanId.getCreateProduct()) {
    out.println(addProductBeanId.getProductId()+" is created");
    out.println("<a href=\"UploadFile.jsp?productId=\"+productId+\"&firstAccess=true\">"+"<font color=\"#0099FF\" size=\"4\" face=\"Comic Sans MS\">"+"<b>"+"Upload File"+"</b>"+"</font>"+"</a>");
    addProductBeanId.initial();
  }
%>
<br>
  <p><font size="6" color="#0099FF"><b><font face="Comic Sans MS">ADD PRODUCT</font></b></font></p>
  <p>
  <br>
<select name="caterogy" onChange="MM_jumpMenu('parent',this,0)" >
 <%!
  base.BaseAttribute baseAttribute;
  Vector categoryRecord;
  Vector attributeOfProduct;
  String s;
  String attributeRef[][];
  String tmp;
  String c;
%>
<%

  baseAttribute = base.BaseAttribute.getBaseAttribute();
  categoryRecord = baseAttribute.getCategory();
  String c = addProductBeanId.getCategory();
  if (c==null || c.equals("")) {
    c = (String)categoryRecord.elementAt(0);
    addProductBeanId.setCategory(c);
  }
  for(int i=0;i < categoryRecord.size();i++){
    out.println("<option value=\"program/index.jsp?mainPage=/product/AddProduct.jsp&m_category="+
        (String)categoryRecord.elementAt(i)+"&m_firstAccess=true\"");
    s = (String)categoryRecord.elementAt(i);
    if (c.equals(s)) {out.println(" selected");}
    out.println(" >"+(String)categoryRecord.elementAt(i)+"</option>");
  }
%>
</select>
    Please select Type</p>
  <table width="100%" border="0">
    <%
    if ((!addProductBeanId.getFirstAccess())&&addProductBeanId.productIdNull()){
    out.println("<tr>");
      out.println("<td>");
      out.println("</td>");
      out.println("<td valign=\"bottom\"><b><font color=\"#FF0000\" size=\"2\">");
      out.println("Product ID is null plase put value it again");
      out.println("</font></b></td>");
    out.println("</tr>");
    }
    if ((!addProductBeanId.getFirstAccess())&&addProductBeanId.findProductId()){
    out.println("<tr>");
      out.println("<td>");
      out.println("</td>");
      out.println("<td valign=\"bottom\"><b><font color=\"#FF0000\" size=\"2\">");
      out.println("Product ID is used plase put another value");
      out.println("</font></b></td>");
    out.println("</tr>");
    }
%>
    <tr> 
      <td width="25%" bgcolor="#FFCCFF"> 
        <div align="right"><b>ProductId :</b></div>
      </td>
      <td bgcolor="#FFCCCC"> 
        <input type="text" name="productId" size="50"
        value = "<jsp:getProperty name="addProductBeanId" property="productId" />" >
      </td>
    </tr>
    <tr> 
      <td width="25%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Brand :</b></div>
      </td>
      <td bgcolor="#FFCCCC"> 
        <input type="text" name="brand" size="50"
        value = "<jsp:getProperty name="addProductBeanId" property="brand" />" >
      </td>
    </tr>
    <%
  attributeOfProduct = baseAttribute.getAttribOfProduct(c);
  attributeRef = baseAttribute.getAttributeRef();
  System.out.println("print attribute of Product");
  for(int i=0; i<attributeOfProduct.size(); i++) {
    String s = (String)attributeOfProduct.elementAt(i);
    for (int j=0; j<attributeRef.length; j++) {
      if (attributeRef[j][2].equals((String)attributeOfProduct.elementAt(i))) {
        tmp = attributeRef[j][0]; break;
      }
    }
    out.println("<tr>");
    out.println("<td width=\"25%\" bgcolor=\"#FFCCFF\">");
	out.println("<div align=\"right\">");
	out.println("<b>");
    out.println(s);
	out.println(" :");
	out.println("</b>");
	out.println("</div>");
    out.println("</td>");
    out.println("<td bgcolor=\"#FFCCCC\">");
    out.println("<input type=\"text\" name=\""+tmp+"\" size=\"50\"");
    out.println("value=\""+
    addProductBeanId.getFollowAttribute((String)attributeOfProduct.elementAt(i))
    +"\" >");
    out.println("</td>");
    out.println("</tr>");
  }
%>
    <% if ((!addProductBeanId.getFirstAccess())&&(!addProductBeanId.quantityInt())) { %>
    <tr> 
      <td width="25%"> 
        <div align="right"></div>
      </td>
      <td valign="bottom"><b><font color="#FF0000" size="2">quantity not be whole 
        number</font></b></td>
    </tr>
    <% } %>
    <tr> 
      <td width="25%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Quantity :</b></div>
      </td>
      <td bgcolor="#FFCCCC"> 
        <input type="text" name="quantity" size="50"
        value = "<jsp:getProperty name="addProductBeanId" property="quantity" />" >
      </td>
    </tr>
    <% if ((!addProductBeanId.getFirstAccess())&&(!addProductBeanId.importPriceDouble())) { %>
    <tr> 
      <td width="25%"> 
        <div align="right"></div>
      </td>
      <td><b><font color="#FF0000" size="2">Import Price not be number</font></b></td>
    </tr>
    <% } %>
    <tr> 
      <td width="25%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Import Price :</b></div>
      </td>
      <td bgcolor="#FFCCCC"> 
        <input type="text" name="importPrice" size="50"
        value = "<jsp:getProperty name="addProductBeanId" property="importPrice" />" >
      </td>
    </tr>
    <% if ((!addProductBeanId.getFirstAccess())&&(!addProductBeanId.sellPriceDouble())) { %>
    <tr> 
      <td width="25%"> 
        <div align="right"></div>
      </td>
      <td><font color="#FF0000" size="2"><b>Sell Price not be number</b></font></td>
    </tr>
    <% } %>
    <tr> 
      <td width="25%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Sell Price :</b></div>
      </td>
      <td bgcolor="#FFCCCC"> 
        <input type="text" name="sellPrice" size="50"
        value = "<jsp:getProperty name="addProductBeanId" property="sellPrice" />" >
      </td>
    </tr>
    <% if ((!addProductBeanId.getFirstAccess())&&(!addProductBeanId.ddInt())) { %>
    <tr> 
      <td width="25%"> 
        <div align="right"></div>
      </td>
      <td><b><font color="#FF0000" size="2">date not be number or value must lower 
        31</font></b></td>
    </tr>
    <% } else %>
    <% if ((!addProductBeanId.getFirstAccess())&&(!addProductBeanId.mmInt())) { %>
    <tr> 
      <td width="25%" height="22"> 
        <div align="right"></div>
      </td>
      <td height="22"><b><font color="#FF0000" size="2">month not be number or 
        value must lower 12</font></b></td>
    </tr>
    <% } else %>
    <% if ((!addProductBeanId.getFirstAccess())&&(!addProductBeanId.yyInt())) { %>
    <tr> 
      <td width="25%"> 
        <div align="right"></div>
      </td>
      <td><b><font color="#FF0000" size="2">year not be number or value must more 
        1980</font></b></td>
    </tr>
    <% } %>
    <tr> 
      <td width="25%" bgcolor="#FFCCFF"> 
        <p align="right"><b>Last Receive Date :<font size="-3"><i> </i></font></b></p>
      </td>
      <td bgcolor="#FFCCCC">dd 
        <input type="text" name="dd" size="4" maxlength="2"
        value = "<jsp:getProperty name="addProductBeanId" property="dd" />" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mm 
        <input type="text" name="mm" size="4" maxlength="2"
        value = "<jsp:getProperty name="addProductBeanId" property="mm" />" >
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yy 
        <input type="text" name="yy" size="8" maxlength="4"
        value = "<jsp:getProperty name="addProductBeanId" property="yy" />" >
        &nbsp;&nbsp; <b><font size="-3"><i>( Ex. 31/12/2000) </i></font></b> </td>
    </tr>
    <% if ((!addProductBeanId.getFirstAccess())&&(!addProductBeanId.lowSellQuantityInt())) { %>
    <tr> 
      <td width="25%"> 
        <div align="right"></div>
      </td>
      <td><font color="#FF0000"><b><font size="2">Low Sell Quantity not be number 
        and lower than or equal 0</font></b></font></td>
    </tr>
    <% } %>
    <tr> 
      <td width="25%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Low Sell Quantity :</b></div>
      </td>
      <td bgcolor="#FFCCCC"> 
        <input type="text" name="lowSellQuantity" size="40"
        value = "<jsp:getProperty name="addProductBeanId" property="lowSellQuantity" />" >
        <i><font size="-1"> <font size="-3">( Ex. -5,-8,-20 )</font></font></i></td>
    </tr>
    <tr> 
      <td width="25%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Sell Now :</b></div>
      </td>
      <td bgcolor="#FFCCCC"> 
        <select name="sellNow">
          <option value="yes" selected>Yes</option>
          <option value="no">No</option>
        </select>
      </td>
    </tr>
    <tr> 
      <td width="25%"> 
        <div align="right"> 
          <input type="submit" name="Submit" value="Submit">
        </div>
      </td>
      <td> 
        <input type="reset" name="reset" value="Reset">
      </td>
    </tr>
  </table>
 <br>
   <p>&nbsp;</p>
</form>
<% addProductBeanId.setFirstAccess(false); %>
</body>
<%
  }
  }
%>
</html>
