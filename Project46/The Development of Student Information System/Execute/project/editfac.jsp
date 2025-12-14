<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<jsp:useBean id="viewf" class="insert.add_fac" />
 	<jsp:setProperty name="viewf" property="fac" />
	<jsp:getProperty name="viewf" property="view" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<script language="javascript">
function del() {
	document.form2.del.click();
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
  <tr valign="middle" height="30">
  	<td colspan="2">ข้อมูลหน่วยงาน/คณะ <a href="addfac.jsp">add</a> | <a href="viewfac.jsp">view</a></td>
  </tr>
  <tr valign="top">
  	<td colspan="2">
		<table width="100%"  border="0">
  			<tr>
    			<td><form name="form1"  method="post"  action="editfacre.jsp" > 
					<table border="0">
					
					<input name="fac" type="hidden" value="<%=viewf.getFac()%>">
						<tr>
							<td colspan="4">หน่วยงาน/คณะ</td>
						</tr>
						<tr>
							<td width="100" >ชื่อ(ไทย)</td>
   					        <td width="300" align="left"><input name="tname" type="text" size="40" maxlength="50"value="<%=viewf.getTname()%>"></td>
        					<td width="100" >ชื่อย่อ(ไทย)</td>
   						    <td width="150" align="left"><input name="tabb" type="text" size="17" maxlength="15"value="<%=viewf.getTabb()%>"></td>
						</tr>						
						<tr>
							<td>ชื่อ(อังกฤษ)</td>
   					        <td align="left"><input name="ename" type="text" size="40" maxlength="50"value="<%=viewf.getEname()%>"></td>
        					<td>ชื่อย่อ(อังกฤษ)</td>
   						    <td align="left"><input name="eabb" type="text" size="17" maxlength="15"value="<%=viewf.getEabb()%>"></td>
						</tr>
					</table>
					<table border="0">
						<tr>
							<td colspan="2">คณบดี</td>
							<td colspan="2">นายทะเบียน</td>
						</tr>
						<tr>
							<td width="100" >ชื่อ(ไทย)</td>
   					        <td width="200" align="left"><input name="tdean" type="text" size="30" maxlength="50"value="<%=viewf.getTdean()%>"></td>
        					<td width="100" >ชื่อ(ไทย)</td>
   						    <td width="200" align="left"><input name="tregis" type="text" size="30" maxlength="15"value="<%=viewf.getTregis()%>"></td>
						</tr>																		
						<tr>
							<td>ชื่อ(อังกฤษ)</td>
   					        <td align="left"><input name="edean" type="text" size="30" maxlength="50"value="<%=viewf.getEdean()%>"></td>
        					<td>ชื่อ(อังกฤษ)</td>
   						    <td align="left"><input name="eregis" type="text" size="30" maxlength="15" value="<%=viewf.getEregis()%>"></td>
						</tr>
						<tr>
							<td colspan="4">ผู้เซ็นทรานสคริปท์</td>
						</tr>
						<tr>
							<td>ชื่อ(ไทย)</td>
   					        <td align="left"><input name="tauth" type="text" size="30" maxlength="50"value="<%=viewf.getTauth()%>"></td>
        					<td>ตำแหน่ง(ไทย)</td>
   						    <td align="left"><input name="tauthrank" type="text" size="30" maxlength="15"value="<%=viewf.getTauthrank()%>"></td>
						</tr>						
						<tr>
							<td>ชื่อ(อังกฤษ)</td>
   					        <td align="left"><input name="eauth" type="text" size="30" maxlength="50"value="<%=viewf.getEauth()%>"></td>
        					<td>ตำแหน่ง(อังกฤษ)</td>
   						    <td align="left"><input name="eauthrank" type="text" size="30" maxlength="15"value="<%=viewf.getEauthrank()%>"></td>
						</tr>
						<tr>
							<td align="left" valign="middle"><input type="button" name="del2" value="delete" onClick="del()"></td>
							<td colspan="3" align="right" valign="middle"><input name="applyb" value="apply" type="submit"> <input type="reset" value="clear" name="clrb"></td>
						</tr>
					</table>
					</form>
				</td>
  			</tr>
			
		</table>
	</td>
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
<form name="form2" method="post" action="delfacre.jsp">
 <input type="hidden" name="fac" value="<%=viewf.getFac()%>">
 <div  style="{visibility:hidden;}"> 
 <input type="submit" name="del" >
 </div>
 </form>
</BODY>
</HTML>
