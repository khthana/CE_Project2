<%@ page contentType="text/html; charset=utf-8" language="java" %>

<html>
<head>
<title>ค้นหา</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body background="pageone.gif">
	
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
                                <param name="movie" value="button53.swf">
                                <param name="quality" value="high">
                                <param name="base" value=".">
                                <embed src="button53.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
                        </object></td>
    <td width="10%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button18.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button18.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button54.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button54.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
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
                                        <td><font color="#000000" size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>! 
                                                เพื่อความปลอดภัยของข้อมูลของท่าน 
                                                กรุณาเลือกออกจากระบบก่อนปิดหน้าต่างทุกครั้ง</strong></font></td>
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
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
                <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td height="233" colspan="1">&nbsp;</td>
    <td colspan="5"><table width="82%" border="0"><form name="form1" method="post" action="search2.jsp">
        <tr> 
          <td width="4%">&nbsp;</td>
          <td width="49%" ><div align="center"><font size="-1"><strong>กำหนดขอบเขตในการค้นหา</strong></font></div></td>
          <td width="44%" >
              <select name="library">
                <option value="all">ห้องสมุดทังหมดในเครื่อข่าย</option>
                <option value="abc">ห้องสมุด ABC</option>
                <option value="xyz">ห้องสมุด XYZ</option>
              </select>
            </td>
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
          <td><div align="center"><strong><font size="-1">สืบค้นโดย</font></strong></div></td>
          <td>
              <select name="search_from">
                <option value="author">ชื่อผู้แต่ง</option>
                <option value="title">ชื่อเรื่อง</option>
                <option value="subject">หัวเรื่อง</option>
                <option value="words">คำสำคัญ</option>
                <option value="call_num">เลขเรียกหนังสือ</option>
              </select>
       </td>
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
          <td>
	  
              <input type="submit" name="Submit" value="  Next &gt;&gt;">
            
	    </td>
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
        </tr></form>
      </table></td>
  </tr>
</table>

</body>

</html>
