<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
        <form name="form1" method="post" action="member_edit2.jsp">
          <table width="75%" border="1" rules="none">
            <tr> 
              <td width="5%"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>ค้นหาข้อมูลสมาชิก</strong></font><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td width="4%"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td width="45%"><font size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp; 
                </font><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                <input type="radio" name="search_from" value="id" checked>
                รหัสประจำตัว(นักศึกษา/ข้าราชการ) </font></td>
              <td width="46%"><font size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                <input type="radio" name="search_from" value="username">
                username</font><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp; 
                </font></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><div align="center"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                  <input type="text" name="key">
                  </font></div></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp; 
                </font></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><div align="center"> <font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                  <input type="submit" name="Submit" value="  ค้นหา  ">
                  </font></div></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
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
