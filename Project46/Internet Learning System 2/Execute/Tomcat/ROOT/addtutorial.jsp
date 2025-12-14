<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*"%>
<html>
<head>
<title>Remove Member</title>
<LINK href="css/default.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</head>
<body background="images/bg.gif">
<%
	if (session.getAttribute("admin")==null)
	{
		response.sendRedirect("main.jsp");
		return;
	}
	%>
<form action="showaddtutorial.jsp"   method="post" >
		<table width="700"   border="1" cellpadding="0" cellspacing="0"  >
		<tr class="black"> 
        <table  border="0" cellpadding="0" cellspacing="0" align="center">
          <tr> 
            <td width="593" height="800" valign="top"> <table width="591" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="591" bgcolor="#00CC00"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>แบบฟอร์มเพิ่มรายวิชา</strong></font></td>
                </tr>
                <tr> 
                  <td width="591" >&nbsp;</td>
                </tr>
              </table>
              <table width="763" border="0" >
                <tr> 
                  <td bgcolor="#999999" width="250"><strong><font color="#FFFFFF" size="2">*รหัสวิชา</font></strong></td>
                  <td colspan="3"><input type="text" name="subjectid" size="40" ></td>
                </tr>
                 <tr> 
                  <td bgcolor="#999999" width="250"><strong><font color="#FFFFFF" size="2">*ชื่อรายวิชา</font></strong></td>
                  <td colspan="3"><input type="text" name="subjectname" size="40" ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"  width="250"><strong><font color="#FFFFFF" size="2">*เนื้อหาส่วน1</font></strong></td>
                  <td colspan="3"><input type="text" name="detail" size="100" ></td>
                </tr>
				<tr> 
                  <td bgcolor="#999999"  width="250"><strong><font color="#FFFFFF" size="2">*เนื้อหาส่วน2</font></strong></td>
                  <td colspan="3"><input type="text" name="detail1" size="100" ></td>
                </tr>
				<tr> 
                  <td bgcolor="#999999"  width="250"><strong><font color="#FFFFFF" size="2">*เนื้อหาส่วน3</font></strong></td>
                  <td colspan="3"><input type="text" name="detail2" size="100" ></td>
                </tr><tr> 
                  <td bgcolor="#999999" width="250"><strong><font color="#FFFFFF" size="2">*เนื้อหาส่วน4</font></strong></td>
                  <td colspan="3"><input type="text" name="detail3" size="100" ></td>
                </tr>  
				<tr> 
                  <td bgcolor="#999999" width="250"><strong><font color="#FFFFFF" size="2">*เวลาเรียน</font></strong></td>
                  <td colspan="3"><input type="text" name="time" size="40"></td>
                </tr>
				<tr> 
                  <td bgcolor="#999999" width="250"><strong><font color="#FFFFFF" size="2">*อาจารย์รายวิชา</font></strong></td>
                  <td colspan="3"><input type="text" name="teacher" size="40"></td>
                </tr>
			    <tr> 
                  <td bgcolor="#999999" width="250"><font color="#FFFFFF" size="2"><strong>*ผู้ช่วยอาจารย์</strong></font></td>
                  <td colspan="3"><input type="text" name="coteacher" size=40></td>
                </tr>
              </table>
              <br>
			<table width="100%" border="0">
                <tr> 
                  <td><div align="right"> 
                      <input type="submit" name="submit"  value="submit">
                    </div></td>
                  <td><div align="left"> 
                      <input type="reset" name="reset" value="reset">
                    </div></td>
                </tr>
              </table>
    </tr>
  </table>
</form>
</body>
</html>