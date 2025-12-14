<HTML>
<HEAD>
<TITLE>
EditCategory
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
<form name="form1" method="post" action="EditCategory.jsp">
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
  buy.BuyHome buyHome;
  product.ProductHome productHome;
  personalcom.PersonalcomHome personalcomHome;
  notebook.NotebookHome notebookHome;
  boolean deleteCategory = true;
  String a[] = {"Type","Model","BUS","Interface","Chipset","Speed","Capacity"};
  String b[] = {"CPU","RAM","HDD","CD ROM","FDD","Display","FAX Modem"};
%>
<%--
    "BUS","Capacity","Chipset","Interface","Model","Speed","Type"
    "CD ROM","CPU","Display","FDD","FAX Modem","HDD","RAM"
--%>
<%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
%>
<%
  String category = request.getParameter("category");
  String form = "1";
  String buf[] = new String[7];
  for (int i=0; i<buf.length; i++) {
    buf[i] = new String();
  }
    try {
      javax.naming.Context ic = new javax.naming.InitialContext();
      java.lang.Object objref = ic.lookup("MyAttribute");
      attribHome = (attribute.AttribHome) javax.rmi.PortableRemoteObject.narrow(objref,
                attribute.AttribHome.class);
      objref = ic.lookup("MyBuy");
      buyHome = (buy.BuyHome) javax.rmi.PortableRemoteObject.narrow(objref,
                 buy.BuyHome.class);
      objref = ic.lookup("MyProduct");
      productHome = (product.ProductHome) javax.rmi.PortableRemoteObject.narrow(objref,
                     product.ProductHome.class);
      objref = ic.lookup("MyPersonalcom");
      personalcomHome = (personalcom.PersonalcomHome) javax.rmi.PortableRemoteObject.narrow(objref,
                         personalcom.PersonalcomHome.class);
      objref = ic.lookup("MyNotebook");
      notebookHome = (notebook.NotebookHome) javax.rmi.PortableRemoteObject.narrow(objref,
                      notebook.NotebookHome.class);
      System.out.println("obtained entityHome object");
    } catch (Exception re) {
      System.err.println ("Couldn't locate attribHome");
      re.printStackTrace();
    }
  if (category==null) category = "";
  if (!category.equals("")) {
    System.out.println("category ="+category);
    String firstAccess = request.getParameter("firstAccess");
  String submit = request.getParameter("Submit");
  if (submit!=null) {
  System.out.println("submit = "+submit);
  if (submit.equals("Update")) {
    String choose = request.getParameter("choose");
    System.out.println("choose = "+choose);
    if (choose.equals("form1")) {
      no = "1";
      for (int i=0; i<7; i++) {
        attribute = request.getParameter("checkone"+i);
        if (attribute==null) {
          attribute = a[i];
          use = "false";
        } else use = "true";
        try {
          System.out.println(category+" : "+attribute+" : "+use+" : "+no);
          attribute.Attrib attrib = attribHome.findByPrimaryKey(new attribute.AttribPK(category,attribute));
          attrib.setUse(use);
          attrib.setNo(no);
          baseAttribute = base.BaseAttribute.getBaseAttribute();
          baseAttribute.setChange(true);
          firstAccess = "true";
          createCate = "Update "+category+" ok";
        } catch (Exception ex) {ex.printStackTrace();}
      }
    }
    if (choose.equals("form2")) {
      no = "2";
      for (int i=0; i<7; i++) {
        attribute = request.getParameter("checktwo"+i);
        if (attribute==null) {
          attribute = b[i];
          use = "false";
        } else use = "true";
        try {
          System.out.println(category+" : "+attribute+" : "+use+" : "+no);
          attribute.Attrib attrib = attribHome.findByPrimaryKey(new attribute.AttribPK(category,attribute));
          attrib.setUse(use);
          attrib.setNo(no);
          baseAttribute = base.BaseAttribute.getBaseAttribute();
          baseAttribute.setChange(true);
          firstAccess = "true";
          createCate = "Update "+category+" ok";
        } catch (Exception ex) {ex.printStackTrace();}
      }
    }
  }
  if (submit.equals("yes")) {
  System.out.println("submit ==== yes");
    try {
      buy.Buy buy = buyHome.findByCategory(category);
      createCate = "Can not Delete this category. Because some product of category is bought";
      deleteCategory = false;
    } catch (Exception ex) {
      deleteCategory = true;
    }
    if (deleteCategory) {
    try {
      System.out.println("answer is yes for delete");
      attribute.Attrib attrib = attribHome.findByForm(category);
      form = attrib.getNo();
      String condition = " category = '"+category+"'";
      java.util.Collection col = productHome.findByCondition(condition,null,null);
      java.util.Iterator ite = col.iterator();
      while (ite.hasNext()) {
        product.Product product = (product.Product)ite.next();
        String productId = (String)product.getPrimaryKey();
        System.out.println("productIddddd d= "+productId+" form="+form);
        if (form.equals("1")) {
          personalcom.Personalcom personalcom = personalcomHome.findByPrimaryKey(productId);
          personalcom.deleteProduct(productId);
          System.out.println("delete personalcom ok "+productId);
          product.deleteProduct(productId);
          System.out.println("delete product ok "+productId);
        }
        if (form.equals("2")) {
        System.out.println("before findbyprimary noteboook");
          notebook.Notebook notebook = notebookHome.findByPrimaryKey(productId);
        System.out.println("before delete notebook");
          notebook.deleteProduct(productId);
          System.out.println("delete notebook ok "+productId);
          product.deleteProduct(productId);
          System.out.println("delete product ok "+productId);
        }
      }
      attrib.deleteCategory(category);
      baseAttribute = base.BaseAttribute.getBaseAttribute();
      baseAttribute.setChange(true);
      category = "";
      createCate = "Delete "+category+" success";
    } catch (Exception e) {
      e.printStackTrace();
    }
    }
  }
  if (submit.equals("no")) {
    response.sendRedirect(response.encodeURL("EditCategory.jsp?category="+category+"&firstAccess=true"));
  }
  }
    if (firstAccess.equals("true")) {
      System.out.println("before getform");
      attribute.Attrib attrib = attribHome.findByForm(category);
      form = attrib.getNo();
      System.out.println("form ===== "+form);
      java.util.Collection c = attribHome.findByCategory(category,"attribute");
      java.util.Iterator i = c.iterator();
      int count=0;
      while (i.hasNext()) {
        attrib = (attribute.Attrib) i.next();
        String a = ((attribute.AttribPK)attrib.getPrimaryKey()).attribute;
        if (!a.equals("More")) {
          buf[count] = attrib.getUse();
          count++;
        }
      }
    }

System.out.println("error : " + error);
%>
<%
  if (createCate!=null) {
  out.println(createCate);
  createCate = null;
  }
if (!category.equals("")) {
%>
  <p><font color="#0099FF"><b><font size="6" face="Comic Sans MS">Change Type</font></b></font></p>
  <table width="75%" border="0">
<% if (!error.equals("")) { %>
    <tr>
      <td width="28%"></td>
      <td width="72%">
        <% out.print(error);error=""; %>
      </td>
    </tr>
<% } %>
     <tr>
      <td width="28%">
        <div align="right"><b>Category Name :</b></div>
      </td>
      <td width="72%"><%= category %>
      </td>
    </tr>
  </table>
<%
    if (submit !=null && submit.equals("Delete")) {
%>
  <table width="75%" border="0">
    <tr> 
      <td align="right" width="80%"><b><font color="#FF0000">Do you want to delete 
        all product of category "<%= category %>"</font></b></td>
      <td width="20%"> 
        <input type="submit" name="Submit" value="yes">
        <input type="submit" name="Submit" value="no">
      </td>
    </tr>
  </table>
<%
    }
%>
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
<% if (form.equals("1")) { %>
          <input type="radio" name="choose" value="form1"
          <% if (form.equals("1")) out.print("checked"); %>
          >
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
        <input type="checkbox" name="checkone0" value="Type"
          <% if (buf[6].equals("true")&&form.equals("1")) out.print("checked"); %>
        > Type </td>
      <td width="21%"> 
        <input type="checkbox" name="checkone1" value="Model"
          <% if (buf[4].equals("true")&&form.equals("1")) out.print("checked"); %>
        > Model </td>
      <td width="24%"> 
        <input type="checkbox" name="checkone2" value="BUS"
          <% if (buf[0].equals("true")&&form.equals("1")) out.print("checked"); %>
        > BUS</td>
      <td width="27%"> 
        <input type="checkbox" name="checkone3" value="Interface"
          <% if (buf[3].equals("true")&&form.equals("1")) out.print("checked"); %>
        > Interface</td>
    </tr>
    <tr bgcolor="#FFCCFF"> 
      <td width="10%"> 
        <div align="right"></div>
      </td>
      <td width="18%"> 
        <input type="checkbox" name="checkone4" value="Chipset"
          <% if (buf[2].equals("true")&&form.equals("1")) out.print("checked"); %>
        > Chipset </td>
      <td width="21%"> 
        <input type="checkbox" name="checkone5" value="Speed"
          <% if (buf[5].equals("true")&&form.equals("1")) out.print("checked"); %>
        > Speed </td>
      <td width="24%"> 
        <input type="checkbox" name="checkone6" value="Capacity"
          <% if (buf[1].equals("true")&&form.equals("1")) out.print("checked"); %>
        > Capacity </td>
      <td width="27%">&nbsp; </td>
    </tr>
    <tr>
      <td width="10%">&nbsp;</td>
      <td width="18%">&nbsp;</td>
      <td width="21%">&nbsp;</td>
      <td width="24%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
<% }
  if (form.equals("2")) {
%>
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
          <input type="radio" name="choose" value="form2"
          <% if (form.equals("2")) out.print("checked"); %>
          >
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
        <input type="checkbox" name="checktwo0" value="CPU"
          <% if (buf[1].equals("true")&&form.equals("2")) out.print("checked"); %>
        > CPU</td>
      <td width="21%"> 
        <input type="checkbox" name="checktwo1" value="RAM"
          <% if (buf[6].equals("true")&&form.equals("2")) out.print("checked"); %>
        > RAM</td>
      <td width="24%"> 
        <input type="checkbox" name="checktwo2" value="HDD"
          <% if (buf[5].equals("true")&&form.equals("2")) out.print("checked"); %>
        > HDD</td>
      <td width="27%"> 
        <input type="checkbox" name="checktwo3" value="CD ROM"
          <% if (buf[0].equals("true")&&form.equals("2")) out.print("checked"); %>
        > CD ROM</td>
    </tr>
    <tr bgcolor="#FFCCCC"> 
      <td width="10%"> 
        <div align="right"></div>
      </td>
      <td width="18%"> 
        <input type="checkbox" name="checktwo4" value="FDD"
          <% if (buf[3].equals("true")&&form.equals("2")) out.print("checked"); %>
        > FDD</td>
      <td width="21%"> 
        <input type="checkbox" name="checktwo5" value="Display"
          <% if (buf[2].equals("true")&&form.equals("2")) out.print("checked"); %>
        > Display</td>
      <td width="24%"> 
        <input type="checkbox" name="checktwo6" value="Fax Modem"
          <% if (buf[4].equals("true")&&form.equals("2")) out.print("checked"); %>
        > FAX Modem</td>
      <td width="27%">&nbsp; </td>
    </tr>
    <tr>
      <td width="10%">&nbsp;</td>
      <td width="18%">&nbsp;</td>
      <td width="21%">&nbsp;</td>
      <td width="24%">&nbsp;</td>
      <td width="27%">&nbsp;</td>
    </tr>
<% } %>
    <tr>
      <td width="10%">&nbsp;</td>
      <td width="18%" align="right">
        <input type="submit" name="Submit" value="Update">
      </td>
      <td width="21%" align="right">
        <input type="reset" name="Submit2" value="Reset">
      </td>
      <td width="24%" align="right">
        <input type="submit" name="Submit" value="Delete">
      </td>
      <td width="27%">&nbsp; </td>
    </tr>
  </table>
  <input type="hidden" name="firstAccess" value="false">
  <input type="hidden" name="category" value= "<%= category %>">
<% }} %>
<%
  }
  }
%>
</form>
</body>
</html>
