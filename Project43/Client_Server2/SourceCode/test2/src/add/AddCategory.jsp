<HTML>
<HEAD>
<TITLE>
AddCategory
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%!
  HttpSession session;
  quote.Quote quote;
  String no;
  String use;
  String error = "";
  String attribute;
  String createCate = null;
  base.BaseAttribute baseAttribute;
  attribute.AttribHome attribHome;
  String a[] = {"Type","Model","BUS","Interface","Chipset","Speed","Capacity"};
  String b[] = {"CPU","RAM","HDD","CD ROM","FDD","Display","FAX Modem"};

  public boolean checkCategory(String category) {
  try {
    java.util.Collection c = attribHome.findByCategory();
    java.util.Iterator i = c.iterator();
    while (i.hasNext()) {
      attribute.Attrib attrib = (attribute.Attrib) i.next();
      String cat = ((attribute.AttribPK)attrib.getPrimaryKey()).category;
      if (cat.equals(category)) return false;
    }
    System.out.println("return true");
    return true;
  } catch (Exception ex) {ex.printStackTrace();}
  System.out.println("return false");
  return false;
  }
%>
<%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
%>
<%
  String category = request.getParameter("category");
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
  if (category==null) category = "";
  if (!category.equals("")) {
  System.out.println("category ="+category);
  if (checkCategory(category)) {
  String form = request.getParameter("choose");
  System.out.println("form = "+form);
  if (form.equals("form1")) {
    no = "1";
    for (int i=0; i<7; i++) {
      attribute = request.getParameter("checkone"+i);
      if (attribute==null) {
        attribute = a[i];
        use = "false";
      } else use = "true";
      try {
System.out.println(category+" : "+attribute+" : "+use+" : "+no);
      attribute.Attrib attrib = attribHome.create(category,attribute,use,no);
      baseAttribute = base.BaseAttribute.getBaseAttribute();
      baseAttribute.setChange(true);
      createCate = "Create "+category+" ok";
      } catch (Exception ex) {ex.printStackTrace();}
    }
      try {
      attribute.Attrib attrib = attribHome.create(category,"More","true",no);
      } catch (Exception ex) {ex.printStackTrace();}
  }
  if (form.equals("form2")) {
    no = "2";
    for (int i=0; i<7; i++) {
      attribute = request.getParameter("checktwo"+i);
      if (attribute==null) {
        attribute = b[i];
        use = "false";
      } else use = "true";
      try {
      attribute.Attrib attrib = attribHome.create(category,attribute,use,no);
      baseAttribute = base.BaseAttribute.getBaseAttribute();
      baseAttribute.setChange(true);
      } catch (Exception ex) {ex.printStackTrace();}
    }
      try {
      attribute.Attrib attrib = attribHome.create(category,"More","true",no);
      } catch (Exception ex) {ex.printStackTrace();}
  }
  }  else error = "error this category have already exit";
  }
System.out.println("error : " + error);
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
    <td bgcolor="#FFCCCC"> 
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
<form name="form1" method="post" action="AddCategory.jsp">
  <p><font color="#0099FF"><b><font size="6" face="Comic Sans MS">ADD TYPE</font></b></font></p>
<%
  if (createCate!=null) {
  out.println(createCate);
  createCate = null;
  }
%>
  <table width="75%" border="0">
<% if (!error.equals("")) { %>
    <tr>
      <td width="28%"></td>
      <td width="72%">
        <% out.print(error); error=""; %>
      </td>
    </tr>
<% } %>
     <tr>
      <td width="28%">
        <div align="right"><b>Category Name :</b></div>
      </td>
      <td width="72%">
        <input type="text" name="category">
      </td>
    </tr>
  </table>
  <table width="75%" border="0">
    <tr>
      <td width="10%">
        <div align="right"></div>
      </td>
      <td width="18%">&nbsp;</td>
      <td width="21%">&nbsp;</td>
      <td width="24%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFCCFF"> 
      <td width="10%"> 
        <div align="right">
          <input type="radio" name="choose" value="form1" checked>
        </div>
      </td>
      <td width="18%">form 1</td>
      <td width="21%"><font size="2">(Ex Mainboard)</font></td>
      <td width="24%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFCCFF"> 
      <td width="10%"> 
        <div align="right"></div>
      </td>
      <td width="18%"> 
        <input type="checkbox" name="checkone0" value="Type">
        Type </td>
      <td width="21%"> 
        <input type="checkbox" name="checkone1" value="Model">
        Model </td>
      <td width="24%"> 
        <input type="checkbox" name="checkone2" value="BUS">
        BUS</td>
      <td width="27%"> 
        <input type="checkbox" name="checkone3" value="Interface">
        Interface</td>
    </tr>
    <tr bgcolor="#FFCCFF"> 
      <td width="10%"> 
        <div align="right"></div>
      </td>
      <td width="18%"> 
        <input type="checkbox" name="checkone4" value="Chipset">
        Chipset </td>
      <td width="21%"> 
        <input type="checkbox" name="checkone5" value="Speed">
        Speed </td>
      <td width="24%"> 
        <input type="checkbox" name="checkone6" value="Capacity">
        Capacity </td>
      <td width="27%">&nbsp; </td>
    </tr>
    <tr>
      <td width="10%">&nbsp;</td>
      <td width="18%">&nbsp;</td>
      <td width="21%">&nbsp;</td>
      <td width="24%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr>
      <td width="10%">&nbsp;</td>
      <td width="18%">&nbsp;</td>
      <td width="21%">&nbsp;</td>
      <td width="24%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFCCCC"> 
      <td width="10%"> 
        <div align="right">
          <input type="radio" name="choose" value="form2">
        </div>
      </td>
      <td width="18%">form 2</td>
      <td width="21%"><font size="2">(Ex Notebook)</font></td>
      <td width="24%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr bgcolor="#FFCCCC"> 
      <td width="10%"> 
        <div align="right"></div>
      </td>
      <td width="18%"> 
        <input type="checkbox" name="checktwo0" value="CPU">
        CPU</td>
      <td width="21%"> 
        <input type="checkbox" name="checktwo1" value="RAM">
        RAM</td>
      <td width="24%"> 
        <input type="checkbox" name="checktwo2" value="HDD">
        HDD</td>
      <td width="27%"> 
        <input type="checkbox" name="checktwo3" value="CD ROM">
        CD ROM</td>
    </tr>
    <tr bgcolor="#FFCCCC"> 
      <td width="10%"> 
        <div align="right"></div>
      </td>
      <td width="18%"> 
        <input type="checkbox" name="checktwo4" value="FDD">
        FDD</td>
      <td width="21%"> 
        <input type="checkbox" name="checktwo5" value="Display">
        Display</td>
      <td width="24%"> 
        <input type="checkbox" name="checktwo6" value="Fax Modem">
        FAX Modem</td>
      <td width="27%">&nbsp; </td>
    </tr>
    <tr>
      <td width="10%">&nbsp;</td>
      <td width="18%">&nbsp;</td>
      <td width="21%">&nbsp;</td>
      <td width="24%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
    <tr>
      <td width="10%">&nbsp;</td>
      <td width="18%">&nbsp;</td>
      <td width="21%">
        <input type="submit" name="Submit" value="Submit">
      </td>
      <td width="24%">
        <input type="reset" name="Submit2" value="Reset">
      </td>
      <td width="27%">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
<%
  }
  }
%>
</html>
