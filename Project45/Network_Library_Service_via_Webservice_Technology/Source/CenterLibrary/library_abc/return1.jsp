<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<%
	int baht=Integer.parseInt(request.getParameter("baht"));
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="100%" border="0">
  <tr> 
    <td width="13%">&nbsp;</td>
    <td width="37%">&nbsp;</td>
    <td width="37%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="4"><table width="100%" border="0">
        <tr> 
          <td width="56%">&nbsp;</td>
          <td width="11%">&nbsp;</td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button7.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button7.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button5.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button5.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button40.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button40.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2"> <div align="center"> 
 
          
        <table width="100%" border="0" rules="none">
          <tr> 
            <td height="11">&nbsp;</td>
            <td colspan="2" bgcolor="#99FF66"><div align="center"><font color="#000000"><strong>บันทึกรายการคืนหนังสือ</strong></font></div></td>
            <td width="15%" rowspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td width="15%" height="11">&nbsp;</td>
            <td colspan="2"><div align="center"><font color="#000000"></font></div></td>
          </tr>
          <tr> 
            <td height="12" rowspan="2">&nbsp;</td>
            <td width="28%">ค่าปรับ <%=baht%> บาท</td>
            <td width="42%" rowspan="2"><form action="return1.jsp" method="post">
                <input name="baht2" type="hidden" value="0">
                <input name="Input3" type="submit" value=" ลบค่าปรับ ">
              </form></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td colspan="2" > <div align="center"> 
                <form action="return2.jsp" method="post">
                  <input name="book_record" type="text" size="20" maxlength="20">
                  <input name="baht" type="hidden" value="<%=baht%>">
                  <input name="Input2" type="submit" value="   บันทึก   ">
                </form>
              </div></td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td colspan="2"bgcolor="#99FF66">&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>
 
      </div></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td><div align="center"> </div></td>
    <td><div align="center"></div></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
