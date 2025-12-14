<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<jsp:useBean class="insert.regis" id="reg"  scope="session"/>
<% reg.init(); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<script language="javascript">
function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}
function no() {
	if (1) event.returnValue = false;
}

</script>
</HEAD>
<BODY leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0" >
<table width="100%"  height="100%" border="0"   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG" >
  <tr valign="top" >
    <td width="35%" height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="40">
    <td colspan="2" ><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr valign="top" height="30">
  	<td colspan="2">การเพิ่มวิชาเรียนเรียน</td>
  </tr>  
 <form action="addreg.jsp" method="post">
  <tr valign="top"  height="40">
	<td >รหัสนักศึกษา  : <input name="stdid" type="text" size="10" maxlength="8" onKeyPress="nochar()"> ปีการศึกษา : <input name="year" type="text" size="5" maxlength="4"  value="2547"  onKeyPress="no()"> | เทอม : <input name="term" type="text" size="2" maxlength="1"  value="1" onKeyPress="no()"></td>
  </tr>
  <tr valign="top" height="40">
  	<td align="right" > <input   type="submit" name="sub1" value="next"></td>
  </tr>	
  <tr>
  	<td></td>
  </tr>
</form>
  <tr valign="bottom">
    <td height="5%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
</BODY>
</HTML>
