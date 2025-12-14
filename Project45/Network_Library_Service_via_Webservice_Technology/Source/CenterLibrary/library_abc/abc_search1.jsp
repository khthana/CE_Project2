<%@ page contentType="text/html; charset=utf-8" language="java" %>

<html>
<head>
<title>ค้นหา</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
<table width="100%" border="0">
  <tr> 
    <td> </td>
    <td colspan="6" >&nbsp;</td>
  </tr>
  <tr>
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="147" height="34">
        <param name="movie" value="button2.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button2.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="147" height="34" ></embed> 
      </object></td>
                <td width="4%" height="50" >&nbsp;</td>
    <td width="35%" >&nbsp;</td>
    <td width="11%" >&nbsp;</td>
    <td width="11%">&nbsp;</td>
    <td width="11%" >&nbsp;</td>
    <td width="18%" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="10%" rowspan="2" align="center"> <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td height="233" colspan="1">&nbsp;</td>
    <td colspan="5"><table width="56%" border="0">
        <form name="form1" method="post" action="abc_search2.jsp">
          <tr> 
            <td width="4%">&nbsp;</td>
            <td width="40%" ><div align="center"><font size="-1"><strong><font size="-1">สืบค้นโดย</font></strong></font></div></td>
            <td width="53%" ><select name="search_from">
                <option value="author">ชื่อผู้แต่ง</option>
                <option value="title">ชื่อเรื่อง</option>
                <option value="subject">หัวเรื่อง</option>
                <option value="words">คำสำคัญ</option>
                <option value="call_num">เลขเรียกหนังสือ</option>
              </select> </td>
            <td width="3%">&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td><div align="center"><strong><font size="-1">คำค้น</font></strong></div></td>
            <td><input type="text" name="key"> </td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td> <input type="submit" name="Submit" value="  Next &gt;&gt;"> <input name="start" type="hidden" value="0"> 
              <input name="c" type="hidden" value="1"> <input name="search_from2" type="hidden" value="author"> 
              <input name="library" type="hidden" value="abc"> </td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </form>
      </table></td>
  </tr>
</table>

</body>

</html>
