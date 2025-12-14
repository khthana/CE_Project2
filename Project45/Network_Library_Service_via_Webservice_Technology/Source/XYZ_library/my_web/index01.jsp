<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html><head><title>Wellcome to Main Library</title><meta http-equiv="Content-Type" content="text/html; charset=utf-8"></head>
<body background="BG2 copy.jpg">
<%	
	String id=new String();
	String library=new String();
	String name=new String();
	String passwd=new String();
	int i=0;
	Cookie cookies[];
	Cookie cookie;
	cookies=request.getCookies();
	if(cookies!=null)
	{
		for (i=0;i<cookies.length;i++)
		{
			cookie=cookies[i];
			if ("id".equals(cookie.getName())) {id=cookie.getValue();}
			if ("library".equals(cookie.getName())) {library=cookie.getValue();}
			if ("name".equals(cookie.getName())) {name=cookie.getValue();}
			if ("passwd".equals(cookie.getName())) {passwd=cookie.getValue();}
		}
		
	}
%>
<table width="100%" border="0">
  <tr> 
    <td colspan="2"><div align="center"><font size="+3">A 's Main Library </font></div></td>
  </tr>
  <tr> 
    <td colspan="2"><table width="100%" border="0">
        <tr> 
          <td width="19%"><div align="center"><font size="-2"><strong><font color="#FFFF99" size="-1">Monday 
              3 February, 2003</font></strong></font></div></td>
          <td width="81%"><table width="100%" border="0">
              <tr> 
                <td width="40%">&nbsp;</td>
                <td width="11%">&nbsp;</td>
                <td width="14%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                    <param name="movie" value="button12.swf">
                    <param name="quality" value="high">
                    <param name="base" value=".">
                    <embed src="button12.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
                  </object></td>
                <td width="14%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                    <param name="movie" value="button13.swf">
                    <param name="quality" value="high">
                    <param name="base" value=".">
                    <embed src="button13.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
                  </object></td>
                <td width="14%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                    <param name="movie" value="button14.swf">
                    <param name="quality" value="high">
                    <param name="base" value=".">
                    <embed src="button14.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
                  </object></td>
                <td width="14%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                    <param name="movie" value="button16.swf">
                    <param name="quality" value="high">
                    <param name="base" value=".">
                    <embed src="button16.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
                  </object></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td width="30%" height="270" ><form name="form1" method="post" action="page_one.jsp">
        <table width="100%" border="0">
          <tr> 
            <td>username</td>
            <td> <input name="username" type="text" id="username" size="25" maxlength="20"> 
            </td>
          </tr>
          <tr> 
            <td>password</td>
            <td> <input name="password" type="password" id="password" size="25" maxlength="20"> 
            </td>
          </tr>
          <tr> 
            <td colspan="2"> <div align="center"> 
                <label>@Library</label>
                <select name="library">
                  <option value="ABC">ABC</option>
                  <option value="XYZ">XYZ</option>
                </select>
                <p> 
                  <input type="submit" name="Submit" value="Submit">
                </p>
              </div></td>
          </tr>
        </table>
        <p>&nbsp;</p>
      </form>
      <form name="form3" method="post" action="">
        <table width="100%" border="0">
          <tr> 
            <td><div align="center">Register for a new member</div></td>
          </tr>
          <tr> 
            <td> <div align="center"> 
                <input name="registry2" type="submit" id="registry3" value="     GO    ">
              </div></td>
          </tr>
        </table>
      </form>
      
    </td>
    <td width="70%" rowspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr> 
          <td width="70%">&nbsp;</td>
          <td width="30%"><form name="form2" method="post" action="find.jsp">
              <input name="search" type="submit" id="search" value="ค้นหาสื่อสารนิเทศ">
            </form></td>
        </tr>
        <tr> 
          <td> 
            <table width="80%" border="1" rules="none" bordercolor="#3399CC">
                <tr> 
                  <td colspan="3"><div align="center"><font color="#000000" size="-2"><strong>ประกาศจากส่วนกลางเครื่อข่ายห้องสมุด</strong></font></div></td>
                </tr>
                <tr> 
                  <td width="5%" rowspan="8">&nbsp;</td>
                  <td width="90%">&nbsp;</td>
                  <td width="5%" rowspan="8">&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td>&nbsp;</td>
                </tr>
                <tr> 
                  <td colspan="3">&nbsp;</td>
                </tr>
              </table>
            <p>&nbsp;</p>
            <table width="80%" border="1" rules="none" bordercolor="#3399FF">
              <tr> 
                <td colspan="3"><div align="center"><strong><font color="#000000" size="-2">ทรัพยากรณ์สารนิเทศ</font></strong></div></td>
              </tr>
              <tr> 
                <td width="5%" rowspan="4">&nbsp;</td>
                <td width="90%"><a href="สถิติทรัพยากรณ์.jsp" name="สถิติทรัพยากร์"  onMouseOver=""><font color="#336699" size="-2" >สถิติจำนวนทรัพยากรณ์สารนิเทศ</font></a></td>
                <td width="5%" rowspan="4">&nbsp;</td>
              </tr>
              <tr> 
                <td><a href="หนังสือลงทะเบียน.jsp" name="หนังสือลงทะเบียน"><font color="#336699" size="-2">หนังสือใหม่ที่ลงทะเบียน</font></a></td>
              </tr>
              <tr> 
                <td><a href="หนังสือใหม่์ที่ออกให้บริการ.jsp" name="หนังสือใหม่ที่ออกให้บริการ"><font color="#336699" size="-2">หนังสือใหม่ที่ออกให้บริการ</font></a></td>
              </tr>
              <tr> 
                <td height="24"><a href="แนะนำหนังสือ.jsp" name="แนะนำหนังสือใหม่"><font color="#336699" size="-2">แนะนำหนังสือใหม่</font></a></td>
              </tr>
              <tr> 
                <td colspan="3">&nbsp;</td>
              </tr>
            </table>
            <p>&nbsp;</p>
            </form></td>
          <td rowspan="2"><table width="101%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td colspan="3"><img src="head_blue.jpg" width="231" height="49"></td>
              </tr>
              <tr> 
                <td width="3%" rowspan="8">&nbsp;</td>
                <td width="89%"><font size="-2"><strong><font color="#000000">หน่วยงานที่เกี่ยวข้อง</font></strong></font></td>
                <td width="8%" rowspan="8"><img src="right_blue.jpg" width="15" height="298"></td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="3"><img src="bottom_blue.jpg" width="230" height="29"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="91" >&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>
