<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<style type="text/css">
<!--
.style1 {
	color: #FF6600;
	font-weight: bold;
}
-->
</style>
</head>
<%@ include file="../WEB-INF/checksession.jsp"%>
<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div align="center"><img src="images/head_r1.jpg" width="780" height="92"></div></td>
  </tr>
</table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><div align="center">
      <hr noshade>
      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="5%">&nbsp;</td>
          <td width="95%"><div align="left"><span class="style1">Hello <%=(String)session.getAttribute("username")%>, Your status is <%=(String)session.getAttribute("type")%>. </span></div></td>
        </tr>
      </table>
      <hr noshade>
    </div></td>
  </tr>
</table>
</body>
</html>
