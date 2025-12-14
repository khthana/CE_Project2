<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="com.ora.jsp.util.*" %>

<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body background="pageone.gif">
<table width="100%" border="0"><tr><td rowspan="2"> 
    </td>
    <td colspan="6" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="5%" height="50" >&nbsp;</td>
    <td width="15%" >&nbsp;</td>
    <td width="12%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
                                <param name="movie" value="button46.swf">
                                <param name="quality" value="high">
                                <param name="base" value=".">
                                <embed src="button46.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
                        </object></td>
    <td width="12%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button18.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button18.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="12%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button21.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button21.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="14%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button23.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button23.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
  </tr>
  <tr> 
    <td width="30%" rowspan="2" align="center">
<table rules="none" bgcolor="#99CCFF"  bordercolor="#FFCC99" width="85%" border="2">
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td><font color="#000000" size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>&nbsp;! 
            เพื่อความปลอดภัยของข้อมูลของท่าน กรุณาเลือกออกจากระบบก่อนปิดหน้าต่างทุกครั้ง</strong></font></td>
        </tr>
        <tr> 
          <td><div align="center"> 
              <form name="form3" method="post" action="logout.jsp">
                <input name="Input" type="submit" value=" ออกจากระบบ ">
              </form>
            </div></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="1">&nbsp;</td>
    <td colspan="5"><form name="form1" method="post" action="change_password2.jsp">
        <table width="99%" border="0">
          <!--DWLayoutTable-->
          <tr> 
            <td width="14">&nbsp;</td>
            <td colspan="3"><p><strong>
	    <jsp:useBean id="errorMessages" scope="request" class="java.util.Vector"/>
	<%
	    if(errorMessages.size()>0){
	%><ul>
                <em><font color="red" size="" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                <j3pJSP:loop name="errorMessages" loopId="msg" className="String" >
          	<li> <%= msg %></li>
        	</j3pJSP:loop>
                </font></em>
</ul>
	<% ;}
	%></strong></p>
              <p>&nbsp;</p></td>
            <td width="10">&nbsp;</td>
          </tr>
          <tr> 
            <td height="24">&nbsp;</td>
            <td width="161"><strong><font size="-1">รหัสเก่า</font></strong></td>
            <td width="45">&nbsp;</td>
            <td width="380" valign="top"><input type="password" name="old_pw"></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td height="21">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td height="24">&nbsp;</td>
            <td><strong><font size="-1">รหัสใหม่</font></strong></td>
            <td>&nbsp;</td>
            <td valign="top"><input type="password" name="new_pw1"></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td height="24">&nbsp;</td>
            <td><strong><font size="-1">พิมพ์รหัสใหม่อีกครั้ง</font></strong>&nbsp;</td>
            <td>&nbsp;</td>
            <td valign="top"><input type="password" name="new_pw2"></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td height="67">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td></td>
            <td colspan="3"> <table width="100%" border="0">
                <tr> 
                  <td><div align="center"> 
                      <input type="submit" name="เปลี่ยนรหัสผ่าน" value="เปลี่ยนรหัสผ่าน">
                    </div></td>
                  <td width="4%">&nbsp;</td>
                </tr>
              </table></td>
            <td></td>
          </tr>
        </table>
      </form>
</td>
  </tr>
</table>

</body>

</html>
