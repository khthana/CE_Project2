<%@ page contentType="text/html; charset=windows-874" language="java" %>


<html>
<head>
<title>ค้นหาด้วยหัวเรื่อง</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body  background="pageone.gif">
	
<table width="100%" border="0">
  <tr> 
    <td rowspan="2"> 

    </td>
    <td colspan="6" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="5%" height="50" >&nbsp;</td>
    <td width="15%" >&nbsp;</td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button22.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button22.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button18.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button18.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button21.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button21.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
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
                <input name="" type="submit" value=" ออกจากระบบ ">
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
    <td height="233" colspan="1">&nbsp;</td>
    <td colspan="5"><table width="92%" border="0">
        <tr> 
          <td width="3%">&nbsp;</td>
          <td colspan="2" ><div align="left"><font size="-1"><strong>ค้นหาโดย 
              หัวเรื่อง</strong></font></div></td>
          <td width="34%" >&nbsp;</td>
          <td width="6%">&nbsp;</td>
        </tr>
        <tr> 
          <td height="40">&nbsp;</td>
          <td colspan="3"><font size="-1">ใส่หัวเรื่องในกล่องข้อความด้านล่าง</font></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="3"><form name="form1" method="post" action="search_resualtxxx.jsp">
              <table width="100%" border="0">
                <tr>
                  <td><div align="center">
                      <input type="text" name="key">
		      <input name="start" type="hidden" value="0">
		      <input name="search_from" type="hidden" value="subject">
		      <input name="c" type="hidden" value="1">
											  <input name="library" type="hidden" value=<%=request.getParameter("library")%>>
                    </div></td>
                  <td><input type="submit" name="Submit" value=" ค้นหา "></td>
                </tr>
              </table>
            </form></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td rowspan="5">&nbsp;</td>
          <td colspan="3"><font size="-1">ท่านสามารถพิมพ์หัวเรื่องทั้งหมด หรือเพียงบางส่วนก็ได้</font></td>
          <td rowspan="5">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">ตัวอย่าง</td>
          <td rowspan="4">&nbsp;</td>
        </tr>
        <tr> 
          <td width="7%" rowspan="3">&nbsp;</td>
          <td width="50%">- Sports medicine</td>
        </tr>
        <tr> 
          <td>- Sports</td>
        </tr>
        <tr> 
          <td>- กีฬา</td>
        </tr>
      </table></td>
  </tr>
</table>

</body>

</html>

