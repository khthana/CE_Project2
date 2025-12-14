<HTML>
<HEAD>
<jsp:useBean id="ViewReceiptBeanId" scope="session" class="view.ViewReceiptBean" />
<jsp:setProperty name="ViewReceiptBeanId" property="*" />
<TITLE>
ViewReceipt
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<body bgcolor="#FFFFFF" text="#000000">
<form name="form1" method="post" action="">
  <table width="100%" border="0">
    <tr>
      <td align="center" bgcolor="#FFFFCC"><b>Computer Delivery Co,.</b></td>
    </tr>
  </table>
  <p>&nbsp;</p>
<%!
  buy.BuyHome buyHome;
  customer.CustomerHome customerHome;
  blueprint.BlueprintHome blueprintHome;
  base.BaseAttribute baseAttribute;
  String username = "";
  String name =  "";
  String address1 = "";
  String address2 = "";
  String no = "";
  String soi = "";
  String street = "";
  String district = "";
  String province = "";
  String country = "";
  String tel = "";
  String email = "";
  String productId = "";
  String description = "";
  int d=0, m=0, y=0, hour=0, min=0;
  String time = "";
  int buyQuan = 0;
  double sellPrice=0, subTotal=0, totalPrice=0;
  boolean printTotalPrice = false;
  boolean printHead = true;
  String[][] sortResult;
%>
<%
  String receiptNo = request.getParameter("receiptNo");
  totalPrice = 0;
  subTotal = 0;
if (receiptNo!=null && !receiptNo.equals("")) {
  String form = "1";
  baseAttribute = base.BaseAttribute.getBaseAttribute();
    try {
      javax.naming.Context ic = new javax.naming.InitialContext();
      java.lang.Object objref = ic.lookup("MyBuy");
      buyHome = (buy.BuyHome) javax.rmi.PortableRemoteObject.narrow(objref,
                 buy.BuyHome.class);
      objref = ic.lookup("MyBlueprint");
      blueprintHome = (blueprint.BlueprintHome) javax.rmi.PortableRemoteObject.narrow(objref,
                       blueprint.BlueprintHome.class);
      objref = ic.lookup("MyCustomer");
      customerHome = (customer.CustomerHome) javax.rmi.PortableRemoteObject.narrow(objref,
                        customer.CustomerHome.class);
      System.out.println("obtained buyHome object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate attribHome");
      re.printStackTrace();
    }
  String condition = " where receipt_no = '"+receiptNo+"'";
  java.util.Collection c = buyHome.findByCondition(condition,null,null);
  java.util.Iterator i = c.iterator();
  printHead = true;
  while (i.hasNext()) {
    buy.Buy buy = (buy.Buy) i.next();
    if (printHead) {
      printHead = false;
      username = ((buy.BuyPK)buy.getPrimaryKey()).username;
      customer.Customer customer = customerHome.findByPrimaryKey(username);
      name = customer.getName();
      no = customer.getNo();
      if (no==null || no.equals("")) no = "";
      soi = customer.getSoi();
      if (soi==null || soi.equals("")) soi = "";
      street = customer.getStreet();
      district = customer.getDistrict();
      if (district==null || district.equals("")) district = "";
      province = customer.getProvince();
      country = customer.getProvince();
      tel = customer.getTel();
      if (tel==null || tel.equals("")) tel = "";
      address1 = no+" "+soi+" "+street+" "+district+" "+province+" "+country+" "+tel;
      email = customer.getEmail();

      time = buy.getSellTime();
      java.util.Date date = buy.getSellDate();
      d = date.getDate();
      m = date.getMonth()+1;
      y = date.getYear()+1900;
    %>
  <table width="100%" border="0">
    <tr>
      <td width="16%">
        <div align="right"><b></b></div>
      </td>
      <td colspan="3">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF">
        <div align="right"><b>Receipt NO :</b></div>
      </td>
      <td width="12%"><a href="<% out.print(response.encodeURL("ViewReceipt.jsp?receiptNo="+receiptNo)); %>"><%= receiptNo %></a></td>
    </tr>
    <tr>
      <td width="16%" bgcolor="#FFCCFF">
        <div align="right"><b>Username :</b></div>
      </td>
      <td colspan="3"><a href="<% out.print(response.encodeURL("ViewCustomer2.jsp?username="+username+"&firstAccess=true")); %>"><%= username %></a></td>
      <td width="22%">&nbsp;</td>
      <td width="12%">&nbsp;</td>
    </tr>
    <tr>
      <td width="16%" bgcolor="#FFCCFF">
        <div align="right"><b>Name :</b></div>
      </td>
      <td colspan="5"><%= name %></td>
    </tr>
    <tr>
      <td width="16%" bgcolor="#FFCCFF">
        <div align="right"><b>Address :</b></div>
      </td>
      <td colspan="5"><%= address1 %></td>
    </tr>
    <tr>
      <td width="16%" bgcolor="#FFCCFF">
        <div align="right"><b>Email :</b></div>
      </td>
      <td colspan="5"><%= email %></td>
    </tr>
    <tr>
      <td width="16%">
        <div align="right"><b></b></div>
      </td>
      <td width="18%">&nbsp;</td>
      <td width="14%" bgcolor="#FFCCFF">
        <div align="right"><b>Date :</b></div>
      </td>
      <td width="18%">
        <% out.print(d+"/"+m+"/"+y); %>
      </td>
      <td width="22%" bgcolor="#FFCCFF">
        <div align="right"><b>Time :</b></div>
      </td>
      <td width="12%"><%= time %></td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <table width="100%" border="1" bordercolor="#993300">
    <tr align="center" bgcolor="#FFFFCC">
      <td align="center"><b>Product ID</b></td>
      <td align="center"><b>Category</b></td>
      <td align="center"><b>Description</b></td>
      <td align="center"><b>Sell Quantity</b></td>
      <td align="center"><b>Price (per piece)</b></td>
      <td align="center"><b>Subtotal Price</b></td>
    </tr>
    <%
    }
    productId = ((buy.BuyPK)buy.getPrimaryKey()).productId;
    blueprint.Blueprint blueprint = blueprintHome.create(productId);
    String category = blueprint.getCategory();
    Vector attributeOfCategory = baseAttribute.getAttribOfProduct(category);
    sortResult = blueprint.sortAttribute(attributeOfCategory);
    for (int j=2; j<17; j++) {
    if (sortResult[j][2].equals("true")){
    description = description+sortResult[j][1]+" ";
    }
    }
    buyQuan = buy.getSellQuantity();
    subTotal = buy.getTotalPrice();
    sellPrice = subTotal/buyQuan;
    totalPrice = totalPrice + subTotal;
    %>
    <tr align="center" bgcolor="#FFCCFF">
      <td> <a href="<% out.print(response.encodeURL("/product/ViewProduct2.jsp?productId="+productId+"&firstAccess=true")); %>">
        <%= productId %></a> </td>
      <td><%= category %></td>
      <td><%= description %></td>
      <td><%= buyQuan %></td>
      <td><%= sellPrice %></td>
      <td><%= subTotal %></td>
    </tr>
    <%
  }
  %>
    <tr align="center">
      <td>&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td>&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="right" bgcolor="#FFCCCC"><b>Total Price :</b></td>
      <td bgcolor="#FFCCCC"><b><%= totalPrice %></b></td>
    </tr>
  </table>
  <%
}
%>
<p>&nbsp;</p></form>
</body>
</html>
