<HTML>
<HEAD>
<jsp:useBean id="TellerJSPBeanId" scope="session" class="teller.TellerJSPBean" />
<jsp:setProperty name="TellerJSPBeanId" property="*" />
<TITLE>
TellerJSP
</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body bgcolor="#FFFFFF" text="#000000">
<p><b><font color="#0099FF" size="6" face="Comic Sans MS">Bank</font></b></p>
<form name="form1" method="get" action="TellerJSP.jsp">
<%!
  javax.servlet.http.HttpSession session;
  String money;
  double funds=0;
%>
<%

  session = request.getSession(true);
  String submit = request.getParameter("Submit");
  if (submit == null) submit="";
  if (submit.equals("Logout")) {
    session.removeValue("creditId");
    response.sendRedirect(response.encodeURL("TellerJSP.jsp"));
  }
  if (submit.equals("Delete Account")) {
    if (TellerJSPBeanId.removeCreditId()) {
    session.removeValue("creditId");
    response.sendRedirect(response.encodeURL("TellerJSP.jsp"));
    } else out.println(TellerJSPBeanId.getError());
  }
  String login = (String)session.getValue("creditId");
  if (login == null) {
    String action ="";
    action = request.getParameter("select");
System.out.println("action :"+action);
    String creditId = request.getParameter("creditId");
    String password = request.getParameter("password");
    if (action==null) action = "";
    if (action.equals("register")) {
      TellerJSPBeanId.createAccount(creditId,password);
        out.println(TellerJSPBeanId.getError());

    } else
    if (action.equals("login")) {
    System.out.println("before login creditId ="+creditId+" : "+password);
      if (!TellerJSPBeanId.login(creditId,password)) {
        out.println(TellerJSPBeanId.getError());
      } else {
      System.out.println("login ok");
        TellerJSPBeanId.setCreditId(creditId);
        TellerJSPBeanId.setPassword(password);
        session.putValue("creditId",creditId);
        response.sendRedirect(response.encodeURL("TellerJSP.jsp"));
      }
    }
%>
  <table width="75%" border="0">
    <tr>
      <td width="16%">&nbsp; </td>
      <td width="18%">&nbsp;</td>
      <td width="19%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
      <td width="25%">&nbsp;</td>
    </tr>
    <tr>
      <td width="16%">&nbsp; </td>
      <td width="18%">&nbsp;</td>
      <td width="19%">
        <input type="radio" name="select" value="register">
        register </td>
      <td width="22%">
        <input type="radio" name="select" value="login" checked>
        login</td>
      <td width="25%">&nbsp;</td>
    </tr>
    <tr>
      <td width="16%">&nbsp; </td>
      <td width="18%">&nbsp;</td>
      <td width="19%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
      <td width="25%">&nbsp;</td>
    </tr>
    <tr>
      <td width="16%">&nbsp;</td>
      <td width="18%"> 
        <div align="center">Credit ID</div>
      </td>
      <td width="19%">
        <input type="text" name="creditId">
      </td>
      <td width="22%"> 
        <div align="center">Password</div>
      </td>
      <td width="25%">
        <input type="password" name="password">
      </td>
    </tr>
    <tr>
      <td width="16%">&nbsp;</td>
      <td width="18%">&nbsp;</td>
      <td width="19%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
      <td width="25%">&nbsp;</td>
    </tr>
    <tr>
      <td width="16%">&nbsp;</td>
      <td width="18%" align="right">&nbsp;</td>
      <td width="18%" align="right">
        <div align="left">
          <input type="submit" name="Submit3" value="Submit">
        </div>
      </td>
      <td width="19%">
        <input type="reset" name="Submit4" value="Reset">
      </td>
      <td width="25%">&nbsp;</td>
    </tr>
  </table>
  <%
  } else {
  String action = request.getParameter("select");
System.out.println("action is "+action);
  if (action == null) action = "";
  String creditId = (String)session.getValue("creditId");
  String password = TellerJSPBeanId.getPassword();
System.out.println("creditId and password is "+creditId+" : "+password);
  TellerJSPBeanId.setCreditId(creditId);
  TellerJSPBeanId.setPassword(password);
  if (action.equals("deposit")) {
    money = request.getParameter("depositText");
    try {
    funds = Double.valueOf(money).doubleValue();
    } catch (Exception ex) {funds = 0; }
    System.out.println("before deposit: funds = "+funds);
    if (!TellerJSPBeanId.deposit(funds)) {
      out.println(TellerJSPBeanId.getError());
    }
  } else
  if (action.equals("withdraw")) {
    money = request.getParameter("withdrawText");
    try {
    funds = Double.valueOf(money).doubleValue();
    } catch (Exception ex) {funds = 0; }
    if (!TellerJSPBeanId.withdraw(funds)) {
      out.println(TellerJSPBeanId.getError());
    }
  } else
  if (action.equals("transfer")) {
    money = request.getParameter("transferText1");
    try {
    funds = Double.valueOf(money).doubleValue();
    } catch (Exception ex) { funds = 0; }
    String toCreditId = request.getParameter("transferText2");
    if (!TellerJSPBeanId.transfer(funds,toCreditId)) {
      out.println(TellerJSPBeanId.getError());
    }
  }
%>
  <p>&nbsp;</p>
  <table width="75%" border="0">
    <tr> 
      <td width="18%"> 
        <div align="right"><b>Credit ID :</b></div>
      </td>
      <td width="82%"> 
        <% out.print(creditId); %>
      </td>
    </tr>
    <tr> 
      <td width="18%"> 
        <div align="right"><b>Balance :</b></div>
      </td>
      <td width="82%"> 
        <% out.print(TellerJSPBeanId.getTotalPrice()); %>
      </td>
    </tr>
  </table>
  <table width="80%" border="0">
    <tr> 
      <td width="17%">&nbsp;</td>
      <td width="19%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
      <td width="20%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%">&nbsp;</td>
      <td width="19%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
      <td width="20%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%">&nbsp;</td>
      <td width="19%"> 
        <input type="radio" name="select" value="deposit" checked>
        deposit </td>
      <td width="22%"> 
        <input type="text" name="depositText">
      </td>
      <td width="20%">&nbsp; </td>
      <td width="22%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%">&nbsp;</td>
      <td width="19%"> 
        <input type="radio" name="select" value="withdraw">
        withdraw</td>
      <td width="22%"> 
        <input type="text" name="withdrawText">
      </td>
      <td width="20%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%">&nbsp;</td>
      <td width="19%"> 
        <input type="radio" name="select" value="transfer">
        transfer </td>
      <td width="22%"> 
        <input type="text" name="transferText1">
      </td>
      <td width="20%">
        <div align="center">to Credit ID</div>
      </td>
      <td width="22%"> 
        <input type="text" name="transferText2">
      </td>
    </tr>
    <tr> 
      <td width="17%">&nbsp;</td>
      <td width="19%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
      <td width="20%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
    </tr>
    <tr> 
      <td width="17%">&nbsp;</td>
      <td align="right" width="19%"> 
        <div align="left"> 
          <input type="submit" name="Submit" value="Submit">
        </div>
      </td>
      <td width="22%"> 
        <input type="submit" name="Submit" value="Delete Account">
      </td>
      <td width="20%"> 
        <input type="reset" name="Submit2" value="Reset">
      </td>
      <td width="22%"> 
        <input type="submit" name="Submit" value="Logout">
      </td>
    </tr>
    <tr> 
      <td width="17%">&nbsp;</td>
      <td align="right" width="19%">&nbsp;</td>
      <td align="right" width="22%">&nbsp;</td>
      <td width="20%">&nbsp;</td>
      <td width="22%">&nbsp;</td>
    </tr>
  </table>
  <br>
<%
  }
%>
  <p>&nbsp;</p>
</form>
<p>&nbsp;</p>
<p>&nbsp;</p>
</body>
</html>
