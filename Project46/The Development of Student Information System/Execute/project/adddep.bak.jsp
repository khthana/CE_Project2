<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620"  import="java.sql.*" import="var.VarDB" %>
<%
	if( session.isNew() )  {  session.setAttribute("auth","0"); response.sendRedirect("auth.jsp");  }
	else if( !session.getAttribute("auth").equals("1") )  response.sendRedirect("auth.jsp");  
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<LINK href="css/sitestyle.css"  type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1400" name=GENERATOR>
</HEAD>
<BODY leftMargin=0 topMargin=0 off autocompleted marginwidth="0"  marginheight="0">
<table width="100%"  height="100%" border=0   cellspacing="0" cellpadding="0"  background="pic/shadow.JPG">
  <tr valign="top" >
    <td height="35"><IMG  height="100%"alt="สถาบันเทคโนโลยีพระจอมเกล้าฯ ลาดกระบัง" src="pic/header.gif" /></td>
    <td width="100%" background="pic/pad.gif">&nbsp;</td>
  </tr>
  <tr valign="top">
    <td colspan="2">
		<table width="100%"  border="0" cellspacing="0" cellpadding="0" >
  <tr valign="top">
    <td><jsp:include page="popup.jsp" flush="false"></jsp:include></td>
  </tr>
  <tr>
    <td><table width="702" border="0" >
<td width="434"><form name="form1" method="post" action="adddepre.jsp">
  <tr>
    <td height="30">ภาควิชา  <a href="viewdep.jsp">view </a></td>
  </tr>
  <tr>
    <td height="184"  valign="top"><table width="433" border="0">
  <tr>
    <td width="128" height="35">ภาควิชา</td>
    <td width="295" height="35"><div align="right">
    </div></td>
  </tr>
  <tr>
    <td height="35">ชื่อ(ไทย)</td>
    <td height="35">
      <div align="right">
        <input name="tname" type="text" size="40" maxlength="50">
      </div></td>
  </tr>
  <tr>
    <td height="35">ชื่อ(อังกฤษ)</td>
    <td height="35"><div align="right">
      <input name="ename" type="text" size="40" maxlength="50">
    </div></td>
  </tr>
  <tr>
    <td height="35">สังกัดหน่วยงาน</td>
    <td height="35"><div align="right">
      <select name="fac">
		<%
		String str; int id;
		VarDB v = new VarDB();
		try {
			Class.forName(v.JDBCNAME).newInstance();
		}
		catch (Exception ex) {
			out.println("not complete");
		}
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "select  FACID,TNAME from faculty;";
			Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				str = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				id = rs.getInt("FACID");
				out.print("<option value=\""+ id+"\">"+str+"</option>" + "\n");
			}
		}
		catch (SQLException ex) {
			out.println("not complete");
		}
		%>
      </select>
    </div></td>
  </tr>
</table></td>
  </tr>
  <td height="30" ><div align="right">
      <input type="submit" name="apply" value="add" align="right">
	  <input type="reset" name="apply" value="clear" align="right">
    </div></td>
	<td width="258"></form>
</table>   
	 </td>
  </tr>
</table>
	</td>
  </tr>
  <tr valign="bottom">
    <td height="10%" colspan="2" align="right">
	<SPAN class=copyright>
		Copyrighted by Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. 2003<BR>
		&copy; Division of System&nbsp;&amp;&nbsp;Programming. CRSC, KMITL. All rights reserved.
	</SPAN>
	</td>
  </tr>
</table>
</BODY>
</HTML>
