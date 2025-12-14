<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	//if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	//else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<script language="javascript">
function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}
function adds() {
}
</script>
</HEAD>
<BODY leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0" >
<table width="640"  height="100%" border="0"   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG" >
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="30">
  	<td colspan="2">เซ็กชั่น (กลุ่มการสอน)</td>
  </tr>  
  <tr valign="top">
  	<td colspan="2"> 
      <form name="form1">
       	<table  border="0">
  <tr>
    <td colspan="2">เซ็กชั่น : <input type="text" name="sec" size="3" maxlength="2"> | จำนวนนักศึกษาที่ต้องการรับ<input type="text" name="maxstd" size="4" maxlength="3"></td>
  </tr>
  <tr>
    <td colspan="2">หมายเหตุ 1 :  <input type="text" name="note2" size="80" maxlength="100"></td>
  </tr>
  <tr>
    <td colspan="2">หมายเหตุ 2 :  <input type="text" name="note1" size="80" maxlength="100"></td>
  </tr>
  <tr>
    <td width="550" align="right"><input type="button" name="Submit" value="add" onclick="adds()"> <input type="reset" name="re" value="clear"></td>
    <td ></td>
  </tr>
</table>
	  </form>
	</td>
  </tr>
  <tr valign="bottom">
    <td width="640"height="5%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
</BODY>
</HTML>
