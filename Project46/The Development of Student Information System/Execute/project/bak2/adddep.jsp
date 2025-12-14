<%@ page contentType="text/html; charset=tis-620" language="java" import="java.sql.*" import="var.VarDB" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Subject</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<body>
<form name="form1" method="post" action="adddepre.jsp">
<table width="702" border="0" >
  <tr>
    <td height="55" bgcolor="#99FF99">ภาควิชา  <a href="viewdep.jsp">view </a></td>
  </tr>
  <tr>
    <td height="184" bgcolor="#CCFFCC"  valign="top"><table width="433" border="0">
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
  <td height="55" bgcolor="#CCFFCC" ><div align="right">
      <input type="submit" name="apply" value="add" align="right">
	  <input type="reset" name="apply" value="clear" align="right">
    </div></td>
</table>   
</form>
</body>
</html>
