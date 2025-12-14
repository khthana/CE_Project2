<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<jsp:useBean class="insert.regis" id="reg"  scope="session"/>
	<jsp:setProperty  name="reg" property="*" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<script language="javascript">
function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}
</script>
</HEAD>
<BODY leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0" >
<table width="100%"  height="100%" border="0"   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG" >
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="40">
    <td colspan="2" ><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr valign="top" height="30">
  	<td colspan="2">การลงทะเบียนเรียน ของ 
	<% 
		String tmp = reg.authen();
		if ( tmp.equals("1") ) response.sendRedirect("notreg.jsp");
		out.print(tmp);
	%>
	
	</td>
  </tr>  
  <tr valign="top">
  	<form action="regisre.jsp" method="post">
	<td colspan="2">
		<table width="100%" border="0">
			<tr>
				<td width="40"></td>
				<td width="110">รหัสวิชา</td>
				<td width="50">เซ็กชั่น</td>
				<td width="774"></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>						
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<td><input name="subid" type="text" size="10" maxlength="8" onKeyPress="onchar()"></td>
				<td><input name="sec" type="text" size="2" maxlength="2" onKeyPress="onchar()"></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3" align="right"><input type="submit" name="Submit" value="add"> <input type="reset" name="Submit2" value="clear"></td>
				<td colspan="2"></td>
			</tr>
		</table>
	</td>
	</form>
  </tr>
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
