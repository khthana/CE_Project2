<HTML>
<HEAD>
<jsp:useBean id="viewCustomer2BeanId" scope="session" class="view.ViewCustomer2Bean" />
<jsp:setProperty name="viewCustomer2BeanId" property="*" />
<TITLE>
ViewCustomer2
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<%!
  javax.servlet.http.HttpSession session;
  quote.Quote quote;
  String userType;
  String username;
  String error;
  String submit;
%>
<%
  session = request.getSession(true);
  quote = (quote.Quote)session.getValue("quote");
  if (quote!=null ) {
  if (viewCustomer2BeanId.getFirstAccess()) {
    customer.Customer customer = quote.getCustomer();
    userType = quote.getUserType();
    if (userType.equals("Customer")) {
      try {
      username = (String)customer.getPrimaryKey();
      } catch (Exception ex) {ex.printStackTrace();}
    } else {
      username = request.getParameter("username");
    }
    if (username != null)
    viewCustomer2BeanId.init(username);
  }
    submit = request.getParameter("Submit");
    if (submit !=null) {
      if (submit.equals("Edit")) {
        response.sendRedirect(response.encodeURL("/product/EditCustomer.jsp?username="+username+"&firstAccess=true"));
      } else
      if (submit.equals("Search")) {
        String s = request.getParameter("searchUsername");
        if (viewCustomer2BeanId.findUsername(s)) {
        response.sendRedirect(response.encodeURL("/product/ViewCustomer2.jsp?username="+s+"&firstAccess=true"));
        } else error = "username is not exist";
      } else
      if (submit.equals("yes")) {
        if (viewCustomer2BeanId.deleteUsername(username)) {
          error = "delete this username success";
          username = null;
        } else { error = "username is used to buy my product. Cann't delete this username"; }
      } else
      if (submit.equals("no")) {
        response.sendRedirect(response.encodeURL("/product/ViewCustomer2.jsp?username="+username+"&firstAccess=true"));
      }
    }
  String tmpType = viewCustomer2BeanId.getUserType();
  System.out.println("userType : "+userType);
  System.out.println("tmpType : "+tmpType);
%>
<form name="changeFrom" method="post" action="ViewCustomer2.jsp">
  <p>&nbsp;</p>
  <p align="left"><font size="+3"><b><font size="6" color="#0099FF" face="Comic Sans MS">View</font></b></font></p>
  <table width="75%" border="0">
    <tr>
      <td align="right" width="36%"><b>Product ID :</b></td>
      <td width="64%">
        <input type="text" name="searchUsername">
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


<%       if ( username != null) {               %>
<%
    if (submit !=null && submit.equals("Delete") && (!tmpType.equals("Manager"))) {
%>
  <table width="75%" border="0">
    <tr>
      <td align="right" width="68%"><b><font color="#FF0000">Do you want to delete 
        username "<%= username %>"</font></b></td>
      <td width="32%">
        <input type="submit" name="Submit" value="yes">
        <input type="submit" name="Submit" value="no">
      </td>
    </tr>
  </table>
<%
    }
%>
  <table width="100%" border="0">
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Username :</b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC"> 
        <jsp:getProperty name="viewCustomer2BeanId" property="username" />
      </td>
    </tr>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Password :</b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC"> 
        <% if ( (tmpType.equals("Manager")&&userType.equals("Manager")) ||
        (!tmpType.equals("Manager")) ) {
%>
        <jsp:getProperty name="viewCustomer2BeanId" property="password" />
        <%
  } else out.println("No authorization");
%>
      </td>
    </tr>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Confirm Password :</b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC"> 
        <% if ( (tmpType.equals("Manager")&&userType.equals("Manager")) ||
        (!tmpType.equals("Manager")) ) {
%>
        <jsp:getProperty name="viewCustomer2BeanId" property="confirmPassword" />
        <%
  } else out.println("No authorization");
%>
      </td>
    </tr>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b></b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC">&nbsp;</td>
    </tr>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Name :</b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC"> 
        <jsp:getProperty name="viewCustomer2BeanId" property="name" />
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p><font size="5"><b><font color="#0099FF" face="Comic Sans MS">Address</font></b></font></p>
  <div align="left">
    <table width="100%" border="0">
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>No :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="no" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Soi :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="soi" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Street :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="street" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>District :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="district" />
        </td>
      </tr>
      <tr> 
        <td width="5%" height="22">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Province :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="province" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Country :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="country" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Area code :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="areaCode" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>email :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="email" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>tel. </b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="tel" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>FAX.</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="fax" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>ID Credit :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="creditId" />
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>User Type :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <jsp:getProperty name="viewCustomer2BeanId" property="userType" />
        </td>
      </tr>
    </table>
  </div>
  <p>&nbsp;</p>
  <table width="75%" border="0">
    <tr>
      <td width="22%">&nbsp;</td>
      <td width="20%">
        <input type="submit" name="Submit" value="Edit">
      </td>
      <td width="12%">&nbsp;</td>
      <% if (userType!=null && !userType.equals("Customer")) { %>
      <td width="46%">
        <input type="submit" name="Submit" value="Delete">
      </td>
      <% } %>
    </tr>
  </table>
<%       }               %>

</form>
<% } %>
<% viewCustomer2BeanId.setFirstAccess(false); %>
</body>
</html>
