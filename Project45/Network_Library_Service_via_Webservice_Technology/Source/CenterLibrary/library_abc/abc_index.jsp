<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.ora.jsp.util.*" %>
<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>

<html>
<head>
<title>ยินดีต้อนรับสู่ระบบห้องสมุด ABC</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body  background="ABC_library.gif">
<table width="100%" border="0">
  <tr> 
    <td>&nbsp;</td>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="147" height="34">
        <param name="movie" value="button2.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button2.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="147" height="34" ></embed> 
      </object></td>
                <td >&nbsp;</td>
    <td>&nbsp;</td>
    <td rowspan="2"><div align="left"><font size="+2"><strong>บริการห้องสมุด ABC</strong></font></div></td>
    <td rowspan="2">&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td >&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td width="15%">&nbsp;</td>
    <td width="18%" bgcolor="#3366CC"><div align="center"><font color="#FFFFFF" size="+2" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>เข้าสู่ระบบ</strong></font></div></td>
    <td width="20%"><p> 
        <jsp:useBean id="errorMessages" scope="request" class="java.util.Vector"/>
        <%
	    if(errorMessages.size()>0){
	%>
      <ul>
        <em><font color="red" size="+2" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
        <strong><j3pJSP:loop name="errorMessages" loopId="msg" className="String" > 
        </j3pJSP:loop></strong><j3pJSP:loop name="errorMessages" loopId="msg" className="String" > 
        <li> <strong><%= msg %></strong></li>
        </j3pJSP:loop> </font></em> 
      </ul>
      <% ;}
	%></p>
      </td>
    <td width="39%">&nbsp; </td>
    <td width="8%">&nbsp;</td>
  </tr>
  <tr> 
    <td rowspan="7">&nbsp;</td>
    <td rowspan="7"><div align="center"> 
        <form name="form1" method="post" action="abc_pageone.jsp" >
          <table width="100%" border="1" bgcolor="#6699FF">
            <tr> 
              <td height="20"><font color="#FFFF99" size="-1"><strong>ชื่อล็อกอิน</strong></font></td>
            </tr>
            <tr> 
              <td><input type="text" name="useranme"></td>
            </tr>
            <tr> 
              <td><font color="#FFFF99" size="-1"><strong>รหัสผ่าน</strong></font></td>
            </tr>
            <tr> 
              <td><input type="password" name="password"></td>
            </tr>
            <tr> 
              <td><div align="center"> 
                  <input type="submit" name="Submit" value=" เข้าสู่ระบบ ">
                </div></td>
            </tr>
          </table>
        </form>
        <font color="#FFFF99" size="-1"></font></div></td>
    <td rowspan="7">&nbsp;</td>
    <td>ี้</td>
    <td rowspan="7">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr bgcolor="#6699FF"> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td><div align="center"> 
        <form name="form2" method="post" action="abc_search1.jsp">
          <input type="submit" name="Submit2" value=" ค้นหาสือสารนิเทศ ">
        </form>
      </div></td>
  </tr>
  <tr bgcolor="#6699FF"> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>ทำการค้นหาสือสารนิเทศภายฐานข้อมูลในห้องสมุดแห่งนี้</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td colspan="3">&nbsp;</td>
  </tr>
</table>
</body>
</html>