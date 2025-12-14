<html>
<head>
<jsp:useBean id="registerCheckerId" scope="session" class="register.RegisterChecker" />
<% registerCheckerId.init(); %>
<jsp:setProperty name="registerCheckerId" property="*" />
<% registerCheckerId.putToDB();%>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<form name="registerFrom" method="post" action="registerJSP.jsp">
<%
  if (registerCheckerId.getCreateCustomer()) {
    out.println("create username "+registerCheckerId.getUsername()+" ok");
	response.sendRedirect("http://161.246.6.111:8000/product/program/detail/cong.htm");
    registerCheckerId.init();
    registerCheckerId.setFirstAccess(true);
  }
%>
  <p>&nbsp;</p>
  <p align="left"><font size="+3"><b><font size="6" color="#0099FF" face="Comic Sans MS">Register</font></b></font></p>
  <table width="100%" border="0">
    <tr> 
      <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.usernameNull()) { %>
    <tr> 
      <td width="5%"></td>
      <td width="22%"> 
        <div align="right"><b></b></div>
      </td>
      <td width="75%"><b><font size="2" color="#FF0000">Username is empty Please 
        put your Username</font></b></td>
    </tr>
    <%}%>
    <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.findUsername()&&!registerCheckerId.getCreateCustomer()) { %>
    <tr> 
      <td width="5%"></td>
      <td width="22%"> 
        <div align="right"><b></b></div>
      </td>
      <td width="75%"><b><font size="2" color="#FF0000">Username is used Please 
        put another Username</font></b></td>
    </tr>
    <%}%>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Username :</b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC"> 
        <input type="text" name="username"
        value = "<jsp:getProperty name="registerCheckerId" property="username" />" >
      </td>
    </tr>
    <tr> 
      <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.passwordNull()) {%>
    <tr> 
      <td width="5%"></td>
      <td width="22%"> 
        <div align="right"><b></b></div>
      </td>
      <td width="75%"><b><font size="2" color="#FF0000">Password is empty Please 
        put your Password</font></b></td>
    </tr>
    <%}%>
    <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.matchPassword()) {%>
    <tr> 
      <td width="5%"></td>
      <td width="22%"> 
        <div align="right"><b></b></div>
      </td>
      <td width="75%"><b><font size="2" color="#FF0000">Password and Confirm Password 
        is not match</font></b></td>
    </tr>
    <%}%>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Password :</b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC"> 
        <input type="password" name="password" >
      </td>
    </tr>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Confirm Password :</b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC"> 
        <input type="password" name="confirmPassword"  >
      </td>
    </tr>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%"> 
        <div align="right"><b></b></div>
      </td>
      <td width="75%">&nbsp;</td>
    </tr>
    <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.nameNull()) {%>
    <tr> 
      <td width="5%"></td>
      <td width="22%"> 
        <div align="right"><b></b></div>
      </td>
      <td width="75%"><b><font size="2" color="#FF0000">Name is empty Please put 
        your Name</font></b></td>
    </tr>
    <%}%>
    <tr> 
      <td width="5%">&nbsp;</td>
      <td width="22%" bgcolor="#FFCCFF"> 
        <div align="right"><b>Name :</b></div>
      </td>
      <td width="75%" bgcolor="#FFCCCC"> 
        <input type="text" name="name" size="50"
        value = "<jsp:getProperty name="registerCheckerId" property="name" />" >
      </td>
    </tr>
  </table>
  <p>&nbsp;</p>
  <p><font size="6" color="#0099FF"><b><font face="Comic Sans MS">Address</font></b></font></p>
  <div align="left">
    <table width="100%" border="0">
      <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.noNull()) {%>
      <tr> 
        <td width="5%"></td>
        <td width="22%"> 
          <div align="right"><b></b></div>
        </td>
        <td width="75%"><b><font size="2" color="#FF0000">No is empty Please put 
          your No</font></b></td>
      </tr>
      <%}%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>No :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="no" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="no" />" >
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Soi :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="soi" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="soi" />" >
        </td>
      </tr>
      <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.streetNull()) {%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%"> 
          <div align="right"><b></b></div>
        </td>
        <td width="75%"><b><font size="2" color="#FF0000">Street is empty Please 
          put your Street</font></b></td>
      </tr>
      <%}%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Street :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="street" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="street" />" >
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>District :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="district" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="district" />" >
        </td>
      </tr>
      <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.provinceNull()) {%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%"> 
          <div align="right"><b></b></div>
        </td>
        <td width="75%"><b><font size="2" color="#FF0000">Province is empty Please 
          put your Province</font></b></td>
      </tr>
      <%}%>
      <tr> 
        <td width="5%" height="22">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Province :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="province" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="province" />" >
        </td>
      </tr>
      <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.countryNull()) {%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%"> 
          <div align="right"><b></b></div>
        </td>
        <td width="75%"><b><font size="2" color="#FF0000">Country is empty Please 
          put your Country</font></b></td>
      </tr>
      <%}%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Country :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="country" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="country" />" >
        </td>
      </tr>
      <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.areaCodeNull()) {%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%"> 
          <div align="right"><b></b></div>
        </td>
        <td width="75%"><b><font size="2" color="#FF0000">Area Code is empty Please 
          put your Area Code</font></b></td>
      </tr>
      <%}%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>Area code :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="areaCode" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="areaCode" />" >
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>email :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="email" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="email" />" >
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>tel. </b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="tel" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="tel" />" >
        </td>
      </tr>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>FAX.</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="fax" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="fax" />" >
        </td>
      </tr>
      <% if ((!registerCheckerId.getFirstAccess())&&registerCheckerId.creditIdNull()) {%>
      <tr> 
        <td width="5%"></td>
        <td width="22%"> 
          <div align="right"><b></b></div>
        </td>
        <td width="75%"><b><font size="2" color="#FF0000">ID Credit is empty Please 
          put your Credit</font></b></td>
      </tr>
      <%}%>
      <tr> 
        <td width="5%">&nbsp;</td>
        <td width="22%" bgcolor="#FFCCFF"> 
          <div align="right"><b>ID Credit :</b></div>
        </td>
        <td width="75%" bgcolor="#FFCCCC"> 
          <input type="text" name="creditId" size="40"
        value = "<jsp:getProperty name="registerCheckerId" property="creditId" />" >
        </td>
      </tr>
    </table>
  </div>
  <p>&nbsp;</p>
  <table width="75%" border="0">
    <tr>
      <td width="22%">&nbsp;</td>
      <td width="20%">
        <input type="submit" name="Submit" value="Submit">
      </td>
      <td width="12%">&nbsp;</td>
      <td width="46%">
        <input type="reset" name="reset" value="Reset">
      </td>
    </tr>
  </table>
</form>
<% registerCheckerId.setFirstAccess(false); %>
</body>
</html>
