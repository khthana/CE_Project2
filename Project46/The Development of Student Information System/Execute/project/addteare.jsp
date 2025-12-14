<%@ page contentType="text/html; charset=tis-620" language="java" pageEncoding="tis-620" %>
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
  	<td colspan="2"> ข้อมูลอาจารย์ผู้สอน </td>
  </tr>  
  <tr valign="top">
  	<td colspan="2">
          <table  border="0">
            <tr align="left">
              <td width="40">ชื่อ(ท)</td>
              <td width="80" align="right">
				  <select name="tpren">
					<option value="นาย">นาย</option>
					<option value="นาง">นาง</option>
					<option value="นางสาว" >นางสาว</option>
			    </select>			  
			  </td>			  
              <td width="300"><input name="tfname" type="text" size="15" maxlength="40"> <input name="tlname" type="text" size="25" maxlength="40"></td>
            </tr>
            <tr>
              <td>ชื่อ(อ)</td>
              <td align="right">
				<select name="epren">
					<option value="Mr">Mr.</option>
					<option value="Ms">Ms.</option>
					<option value="Miss">Miss</option>										
				</select>				  
			  </td>
              <td><input name="efname" type="text" size="15" maxlength="40"> <input name="elname" type="text" size="25" maxlength="40"></td>
            </tr>
			<tr valign="top">
				<td colspan="3">ภาควิชา : 
					<select name="depid">
<%
		int i; String str;
		VarDB v = new VarDB();
		try {
			Class.forName(v.JDBCNAME).newInstance();
		}
		catch (Exception ex) {
			out.println("not complete");
		}
		try {
			Connection con = DriverManager.getConnection(v.DBHOST, v.DBUSER,  v.DBPASSWD);
			String SQL = "select DEPID,TNAME from department;"; //find max  facid
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next()) { //http://161.246.6.47:808/project/test.jsp?textfield=asd&Submit=Submit
				out.print("<tr>" + "\n");
				str = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				i = rs.getInt("DEPID");
				out.print("<td width=\"100%\"><div align=\"left\"><a onClick=\"edit("+i+")\">"+ i + ".    " + str +"</a></div></td>" + "\n"); 
				out.print("</tr>" + "\n");
			}
			out.print("</table>");
			con.close();
		}
		catch (SQLException ex) {
			out.println("not complete");
		}
		%>						
					</select>
				</td>
			</tr>
          </table>
		  <table border="0">
		  	<tr valign="top">
				<td width="250">เลขบัตรประชาชน : 
				  <input name="personalid" type="text" size="20" maxlength="13">
				</td>
				<td width="300">e - mail : <input name="email" type="text" size="30" maxlength="50">
				</td>
			</tr>
		  </table>
          <table border="0">
            <tr valign="top">
              <td width="150">ประเภทอาจารย์ :<br>
			  <input name="type" type="checkbox" value="1">สอน
			  <input name="type" type="checkbox" value="1">สอบ
			  <input name="type" type="checkbox" value="1">คุม
			  </td>
              <td width="150">เป็นอาจารย์<br>
                  <label><input type="radio" name="kind" value="a">ประจำ</label>
                  <label><input type="radio" name="kind" value="b">พิเศษ</label>
              </td>
              <td width="220">สถานภาพ<br>
                  <label>
                  <input type="radio" name="status" value="a">
                  เป็นอ. บัณฑิต</label>
                  <label>
                  <input type="radio" name="status" value="b">
                  เป็นอ. ทั่วไป</label>
              </td>
            </tr>
          </table>
		  <table border="0">
		  	<tr>
				<td>จบสถาบัน <input name="tlname" type="text" size="25" maxlength="40"></td>
				<td>จบสาขา <input name="tlname" type="text" size="25" maxlength="40"></td>
				<td>จบพศ. <input name="tlname" type="text" size="4" maxlength="4"></td>
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
</BODY>
</HTML>
<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>

</body>
</html>
