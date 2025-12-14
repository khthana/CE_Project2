<HTML>
<HEAD>
<TITLE>
ViewCategory
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%!
  HttpSession session;
  quote.Quote quote;
  attribute.AttribHome attribHome;
  String category = "";
  boolean printCategory = true;
  boolean firstPrint = true;
  public String sign(String s) {
    if (s.equals("true")) { return "/"; }
    else if (s.equals("false")) { return "-"; }
    return "";
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
    <td> 
      <div align="center"><a href="http://161.246.6.111:8000/product/SearchBuyJSP.jsp"><font color="#0099FF" size="2" face="Comic Sans MS"><b>Search 
        Buy</b></font></a></div>
    </td>
    <td> 
      <div align="center"><a href="http://161.246.6.111:8000/product/ViewFirstPage.jsp" target="_self"><font color="#0099FF" size="2" face="Comic Sans MS"><b>View 
        Buy Detail</b></font></a></div>
    </td>
    <td bgcolor="#FFCCCC"> 
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
  </tr>
</table>
<form name="form1" method="post" action="">
<%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
  String buf[] = new String[7];
  for (int i=0; i<buf.length; i++) {
    buf[i] = new String();
  }

    try {
      javax.naming.Context ic = new javax.naming.InitialContext();
      java.lang.Object objref = ic.lookup("MyAttribute");
      attribHome = (attribute.AttribHome) javax.rmi.PortableRemoteObject.narrow(objref,
                attribute.AttribHome.class);
      System.out.println("obtained attribHome object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate attribHome");
      re.printStackTrace();
    }
%>
<%
    String condition = " where no = '1' order by category,attribute";
    java.util.Collection c = attribHome.findByCondition(condition);
    java.util.Iterator i = c.iterator();
    firstPrint = true;
    while (i.hasNext()) {
      if (firstPrint) {
        firstPrint = false;
      %>
      
  <p><b><font color="#0099FF" face="Comic Sans MS">form1</font></b></p>
  <table width="100%" border="1">
    <tr align="center" bgcolor="#FFFFCC"> 
      <td>Category</td>
            
      <td>BUS</td>
            
      <td>Capacity</td>
            
      <td>Chipset</td>
            
      <td>Interface</td>
            
      <td>Model</td>
            
      <td>Speed</td>
            
      <td>Type</td>
            
      <td>&nbsp;</td>
            
      <td>&nbsp;</td>
          </tr>
      <%
      }
      %>
      <tr align="center">
        <%
        printCategory = true;
        for (int j=0; j<8; j++) {
          attribute.Attrib attrib = (attribute.Attrib) i.next();
          category = ((attribute.AttribPK)attrib.getPrimaryKey()).category;
          if (printCategory) {
          printCategory = false;
          %>
          <td><%= category %></td>
          <%
          }
        String a = ((attribute.AttribPK)attrib.getPrimaryKey()).attribute;
          if (!a.equals("More")) {
          %>
          <td><% out.print(sign(attrib.getUse())); %></td>
          <%
          }
        }
        %>
        <td><a href="<% out.print(response.encodeURL("/product/EditCategory.jsp?category="+category+"&firstAccess=true")); %>">edit</a></td>
        <td><a href="<% out.print(response.encodeURL("/product/EditCategory.jsp?category="+category+"&firstAccess=true&Submit=Delete")); %>">delete</a></td>
      </tr>
    <%
    }
%>
  </table>
  <br>
<%--
    "BUS","Capacity","Chipset","Interface","Model","Speed","Type"
    "CD ROM","CPU","Display","FDD","FAX Modem","HDD","RAM"
--%>
<%
    condition = " where no = '2' order by category,attribute";
    c = attribHome.findByCondition(condition);
    i = c.iterator();
    firstPrint = true;
    while (i.hasNext()) {
      if (firstPrint) {
        firstPrint = false;
      %>
      
  <p><font face="Comic Sans MS" color="#0099FF"><b>form2</b></font></p>
        
  <table width="100%" border="1">
    <tr align="center" bgcolor="#FFFFCC"> 
      <td>Category</td>
            
      <td>CD ROM</td>
            
      <td>CPU</td>
            
      <td>Display</td>
            
      <td>FDD</td>
            
      <td>FAX Modem</td>
            
      <td>HDD</td>
            
      <td>RAM</td>
            
      <td>&nbsp;</td>
            
      <td>&nbsp;</td>
          </tr>
      <%
      }
      %>
      <tr align="center">
        <%
        printCategory = true;
        for (int j=0; j<8; j++) {
          attribute.Attrib attrib = (attribute.Attrib) i.next();
          category = ((attribute.AttribPK)attrib.getPrimaryKey()).category;
          if (printCategory) {
          printCategory = false;
          %>
          <td><%= category %></td>
          <%
          }
        String a = ((attribute.AttribPK)attrib.getPrimaryKey()).attribute;
          if (!a.equals("More")) {
          %>
          <td><% out.print(sign(attrib.getUse())); %></td>
          <%
          }
        }
        %>
        <td><a href="<% out.print(response.encodeURL("/product/EditCategory.jsp?category="+category+"&firstAccess=true")); %>">edit</a></td>
        <td><a href="<% out.print(response.encodeURL("/product/EditCategory.jsp?category="+category+"&firstAccess=true&Submit=Delete")); %>">delete</a></td>
      </tr>
    <%
    }
%>
  </table>
  <p>&nbsp;</p><table width="75%" border="0">
    <tr>
      <td width="33%">&nbsp;</td>
      <td width="25%">
        <input type="submit" name="Submit" value="Submit">
      </td>
      <td width="42%">
        <input type="reset" name="Submit2" value="Reset">
      </td>
    </tr>
  </table>
<%
  }
  }
%>
  </form>
</body>
</html>

