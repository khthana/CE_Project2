<%@ page contentType="text/html; charset=windows-874" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>ตรวจเลขประจำตัว</title>
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
                                        <td width="11%">&nbsp;</td>
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
        <form action="borrow2.jsp" method="post">
          <table width="100%" border="0" rules="none">
            <tr> 
              <td width="15%" height="11">&nbsp;</td>
              <td colspan="2" bgcolor="#9999FF"><div align="center"><font color="#FFFF66"><strong>บันทึกรายการยืมหนังสือ</strong></font></div></td>
              <td width="15%" rowspan="2">&nbsp;</td>
            </tr>
            <tr> 
              <td height="12">&nbsp;</td>
              <td colspan="2"><font size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td>&nbsp;</td>
              <td width="35%" > <div align="center">หมายเลขประจำตัว </div></td>
              <td width="35%"><div align="center"> 
                  <input name="id" type="text" size="20" maxlength="20">
                </div></td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td rowspan="2">&nbsp;</td>
              <td colspan="2"><div align="center"> </div>
                <div align="center"> &nbsp; </div></td>
              <td rowspan="2">&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="2"><div align="center"> 
                  <input name="Input" type="submit" value="ตรวจเลขประจำตัว">
		  <input name="book_status" type="hidden" value="">
                </div></td>
            </tr>
            <tr> 
              <td>&nbsp;</td>
              <td colspan="2"bgcolor="#9999FF">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>
        </form>
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
