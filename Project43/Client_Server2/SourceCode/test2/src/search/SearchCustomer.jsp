<HTML>
<HEAD>
<jsp:useBean id="SearchCustomerBeanId" scope="session" class="search.SearchCustomerBean" />
<jsp:setProperty name="SearchCustomerBeanId" property="*" />
<TITLE>
SearchCustomer
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>
<%!
  HttpSession session;
  quote.Quote quote;
%>
<body bgcolor="#FFFFFF" text="#000000">
<table width="100%" border="0">
  <tr bgcolor="#FFFFCC"> 
    <td> 
      <div align="center"><a href="http://161.246.6.111:8000/product/SearchProductJSP.jsp" target="_self"><font color="#0099FF" size="2" face="Comic Sans MS"><b>Search 
        Product</b></font></a></div>
    </td>
    <td bgcolor="#FFCCCC"> 
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
<form name="form1" method="post" action="SearchCustomerServletAlias">
  <%
  session = request.getSession(true);
  quote = (quote.Quote) session.getValue("quote");
  if (quote!=null) {
  String userType = quote.getUserType();
  if (userType.equals("Administrator") || userType.equals("Manager")) {
%>
  <p><font size="6"><b><font color="#0099FF" face="Comic Sans MS">Search Customer</font></b></font></p>
  <table width="100%" border="0" bgcolor="#FFCCFF">
    <tr>
      <td width="19%">
        <div align="right"><b>Username :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="username" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="username" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="username" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="username" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="usernameText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="username" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="usernameB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="usernameB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCCC">
    <tr>
      <td width="19%">
        <div align="right"><b>Name :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="name" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="name" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="name" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="name" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="nameText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="name" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="nameB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="nameB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFFFCC">
    <tr>
      <td width="19%">
        <div align="right"><b>No :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="no" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="no" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="no" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="no" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="noText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="no" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="noB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="noB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCFF">
    <tr>
      <td width="19%">
        <div align="right"><b>Soi :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="soi" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="soi" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="soi" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="soi" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="soiText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="soi" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="soiB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="soiB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCCC">
    <tr>
      <td width="19%">
        <div align="right"><b>Street :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="street" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="street" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="street" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="street" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="streetText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="street" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="streetB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="streetB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFFFCC">
    <tr>
      <td width="19%" height="33">
        <div align="right"><b>District :</b></div>
      </td>
      <td width="10%" height="33"> 
        <input type="radio" name="district" value="all" checked>
        All </td>
      <td width="10%" height="33"> 
        <input type="radio" name="district" value="equal">
        Equal </td>
      <td width="11%" align="center" height="33"> 
        <input type="radio" name="district" value="more">
        More </td>
      <td width="11%" height="33"> 
        <input type="radio" name="district" value="lower">
        Lower </td>
      <td width="30%" height="33"> 
        <input type="text" name="districtText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="district" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="districtB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="districtB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCFF">
    <tr>
      <td width="19%">
        <div align="right"><b>Province :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="province" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="province" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="province" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="province" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="provinceText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="province" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="provinceB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="provinceB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCCC">
    <tr>
      <td width="19%">
        <div align="right"><b>Country :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="country" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="country" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="country" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="country" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="countryText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="country" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="countryB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="countryB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFFFCC">
    <tr>
      <td width="19%">
        <div align="right"><b>Email :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="email" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="email" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="email" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="email" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="emailText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="email" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="emailB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="emailB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCFF">
    <tr>
      <td width="19%">
        <div align="right"><b>Tel :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="tel" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="tel" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="tel" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="tel" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="telText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="tel" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="telB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="telB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCCC">
    <tr>
      <td width="19%">
        <div align="right"><b>FAX :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="fax" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="fax" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="fax" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="fax" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="faxText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="fax" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="faxB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="faxB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFFFCC">
    <tr>
      <td width="19%">
        <div align="right"><b>Credit ID :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="credit_id" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="credit_id" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="credit_id" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="credit_id" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="credit_idText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="credit_id" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="credit_idB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="credit_idB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="100%" border="0" bgcolor="#FFCCFF">
    <tr>
      <td width="19%">
        <div align="right"><b>User Type :</b></div>
      </td>
      <td width="10%">
        <input type="radio" name="user_type" value="all" checked>
        All </td>
      <td width="10%">
        <input type="radio" name="user_type" value="equal">
        Equal </td>
      <td width="11%" align="center">
        <input type="radio" name="user_type" value="more">
        More </td>
      <td width="11%">
        <input type="radio" name="user_type" value="lower">
        Lower </td>
      <td width="30%"> 
        <input type="text" name="user_typeText" size="11">
      </td>
    </tr>
    <tr>
      <td width="19%" align="center">&nbsp;</td>
      <td colspan="2">
        <input type="radio" name="user_type" value="between">
        Between </td>
      <td width="11%">
        <input type="text" name="user_typeB1" size="11">
      </td>
      <td align="center" width="11%">to</td>
      <td width="30%"> 
        <input type="text" name="user_typeB2" size="11">
      </td>
    </tr>
  </table>
  <br>
  <table width="75%" border="0">
    <tr>
      <td align="right" width="38%">
        <input type="submit" name="Submit" value="Submit">
      </td>
      <td width="5%">&nbsp; </td>
      <td width="57%">
        <input type="reset" name="Submit2" value="Reset">
      </td>
    </tr>
  </table>
  <br>
  <p>&nbsp;</p>
<%
  }
  }
%>
</form>
</body>
</html>
