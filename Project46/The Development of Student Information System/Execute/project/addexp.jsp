<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"  import="java.sql.*" import ="sql_code.sqlCom" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<jsp:useBean class="insert.add_cur" id="addc" scope="session"></jsp:useBean>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
<style type="text/css" >
	DIV.DMenu {
	visibility:hidden; position:absolute;
	}
</style>
<script language="javascript">
function nochar() {
	if (event.keyCode < 45 || event.keyCode > 57) event.returnValue = false;
}
function writec() {
	document.write(opener.form1.tname.value);
}
function showd(d) {
	exp1.style.visibility="hidden"; exp1.style.position="absolute";
	exp2.style.visibility="hidden";exp2.style.position="absolute";
	d.style.visibility="visible"; d.style.position="static";
}
function adde(m) {
	//self.close();
}
</script>
</HEAD>
<BODY leftMargin="0" topMargin="0" off autocompleted marginwidth="0"  marginheight="0" onLoad="showd(exp1)">
<table width="640"  height="100%" border="0"   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG" >
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top" height="30">
  	<td colspan="2">ค่าใช้จ่ายของหลักสูตร <script language="javascript">writec();</script></td>
  </tr>  
  <tr valign="top">
  	<td colspan="2"> 
      <form name="form1" method="post" action="addexpre.jsp">
       	<table  border="0">
			<tr valign="top">
				<td><a href="javascript:void(0)" onClick="showd(exp1)">นักศึกษาไทย</a> | <a href="javascript:void(0)" onClick="showd(exp2)">นักศึกษาต่างชาติ</a></td>
			</tr>
			<tr>
				<td>
					<table border="0">
						<tr valign="top">
							<td width="150">ค่าใช้จ่าย</td>
							<td width="100">ปีที่เริ่มใช้</td>
							<td width="100">จำนวน</td>
						</tr>
					</table>
							<div class="DMenu" id="exp1">
							<%
								sqlCom SQLC = new sqlCom();
								String SQL = "select * from expensename";
								ResultSet rs = SQLC.select(SQL); 
								out.print("<table border=\"0\">");
								while(rs.next()) {
									String tmp = new String(rs.getString("EXPENSE").getBytes("ISO8859_1"), "TIS-620");
									out.print("<tr valign=\"top\">");
									out.print("<td width=\"150\">" + tmp); 	tmp = rs.getString("code"); 
									out.print("<input type=\"hidden\" name=\"code1\" value=\""+ tmp + "\"></td>"); 
									out.print("<td width=\"100\"><input name=\"yearapplied1\" type=\"text\" size=\"5\" maxlength=\"4\" onKeyPress=\"nochar()\"></td>" );
									out.print("<td width=\"100\"><input name=\"amt1\" type=\"text\" size=\"6\" value=\"0\" maxlength=\"5\" onKeyPress=\"nochar()\"></td> " );
									out.print("</tr>");
								}
								out.print("</table>");
							%>
							</div>
							<div class="DMenu" id="exp2">
							<%
								SQL = "select * from expensename";
								rs = SQLC.select(SQL); 
								out.print("<table border=\"0\">");								
								while(rs.next()) {
									String tmp = new String(rs.getString("EXPENSE").getBytes("ISO8859_1"), "TIS-620");
									out.print("<tr valign=\"top\">");
									out.print("<td width=\"150\">" + tmp); 	tmp = rs.getString("code"); 
									out.print("<input type=\"hidden\" name=\"code2\" value=\""+ tmp + "\"></td>"); 
									out.print("<td width=\"100\"><input name=\"yearapplied2\" type=\"text\" size=\"5\" maxlength=\"4\" onKeyPress=\"nochar()\"></td>" );
									out.print("<td width=\"100\"><input name=\"amt2\" type=\"text\" size=\"6\"  value=\"0\" maxlength=\"5\" onKeyPress=\"nochar()\"></td> " );
									out.print("</tr>");
								}
								out.print("</table>");								
							%>
							</div>
				</td>
			</tr>
			<tr>
				<td width="550" align="right"><input type="submit" name="Submit" value="add" > <input type="reset" name="re" value="clear"></td>
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
