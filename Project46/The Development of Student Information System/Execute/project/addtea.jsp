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
  	<td colspan="2"> ข้อมูลอาจารย์ผู้สอน </td>
  </tr>  
  <tr valign="top">
  	<td colspan="2">
		<form name="form1" method="post" action="addteare.jsp"> 
          <table  border="0">
            <tr align="left">
              <td width="40">ชื่อ(ท)</td>
              <td width="80" align="right">
				  <select name="tpren">
					<option value="1">นาย</option>
					<option value="2">นาง</option>
					<option value="3" >นางสาว</option>
			    </select>			  
			  </td>			  
              <td width="300"><input name="tfname" type="text" size="15" maxlength="40"> <input name="tlname" type="text" size="25" maxlength="40"></td>
            </tr>
            <tr>
              <td>ชื่อ(อ)</td>
              <td align="right">
				<select name="epren">
					<option value="1">Mr.</option>
					<option value="2">Ms.</option>
					<option value="3">Miss</option>										
				</select>				  
			  </td>
              <td><input name="efname" type="text" size="15" maxlength="40"> <input name="elname" type="text" size="25" maxlength="40"></td>
            </tr>
			<tr valign="top">
				<td colspan="3">ภาควิชา : 
							<select name="dep">
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
			String SQL = "select  DEPID,TNAME from department;";
			Statement stmt = con.createStatement();
			 ResultSet rs = stmt.executeQuery(SQL);
			while(rs.next()) {
				str = new String(rs.getString("TNAME").getBytes("ISO8859_1"), "TIS-620");
				id = rs.getInt("DEPID");
				out.print("<option value=\""+ id+"\">"+str+"</option>" + "\n");
			}
		}
		catch (SQLException ex) {
			out.println("not complete");
		}
		%>
      </select> : แต่งตั้งเป็นเมื่อ  <input name="promotedate" type="text" size="10" maxlength="8" onKeyPress="nochar()">
				</td>
			</tr>
          </table>
		  <table border="0">
		  	<tr valign="top">
				<td width="250">เลขบัตรประชาชน : 
				  <input name="personalid" type="text" size="20" maxlength="13" onKeyPress="nochar()">
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
                  <input type="radio" name="kind" value="a">
                  เป็นอ. บัณฑิต</label>
                  <label>
                  <input type="radio" name="kind" value="b">
                  เป็นอ. ทั่วไป</label>
              </td>
            </tr>
          </table>
		  <table border="0">
		  	<tr>
				<td>จบสถาบัน <input name="tlname" type="text" size="30" maxlength="40"> : จบสาขา <input name="tlname" type="text" size="30" maxlength="40"></td>
			</tr>
			<tr>
				<td>จบพศ. <input name="tlname" type="text" size="4" maxlength="4" onKeyPress="nochar()"> : ระดับ<label><input type="radio" name="degree" value="a">ป. ตรี</label><label><input type="radio" name="degree" value="b">ป. โท</label><label><input type="radio" name="degree" value="c">ป. เอก</label><label><input type="radio" name="degree" value="d">ป. บัณฑิต</label></td>
			</tr>
		  </table>
		  <table border="0">
		  	<tr>
				<td>ผลงานเพิ่มเติม 
                  <label><input type="radio" name="supplement" value="1">มี</label>
                  <label><input type="radio" name="supplement" value="0">ไม่มี</label> : รายละเอียด <input name="supplementnote" type="text" size="50" maxlength="200">
				</td>
			</tr>
		  </table>
		  <table border="0">
		  	<tr><td width="600"align="right"><input type="submit" name="Submit" value="add"> <input type="reset" name="Submit2" value="clear"></td></tr>
		  </table></form>
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
