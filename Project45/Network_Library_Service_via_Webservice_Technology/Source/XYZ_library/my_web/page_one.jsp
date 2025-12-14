<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="x10.x6.x246.x161.*"%>

<html>
<head><title>Welcome</title><meta http-equiv="Content-Type" content="text/html; charset=windows-874"></head>
<body background="BG2 for page1copy.jpg">

<table width="100%" border="0">
  <tr><td rowspan="2"> 

<%
      	Login_Impl proxy = new Login_Impl(); 
	LoginSoap soapProxy = proxy.getloginSoap(); 
	String temp=request.getParameter("username");
	String id;
	try{
		id=new String(temp.getBytes("UTF-8"),"UTF-8");
		String library=request.getParameter("library");	
		String passwd=request.getParameter("password"); 
		UserProfile user = soapProxy.check_id(id,passwd,library);
		if ((user.getName()).length()!=0){ 
			out.println("<h3>     ขอตอนรับ คุณ  "+user.getName()+"</h3>" ); 
			Cookie cookie=new Cookie("id",id);
			cookie.setMaxAge(60);
			response.addCookie(cookie);
			cookie=new Cookie("library",library);
			cookie.setMaxAge(60);
			response.addCookie(cookie);
			cookie=new Cookie("name",user.getName());
			cookie.setMaxAge(60);
			response.addCookie(cookie);
			cookie=new Cookie("passwd",passwd);
			cookie.setMaxAge(60);
			response.addCookie(cookie);
		} 
		else{ 
%>
<!-- Login fail. -->
      			<jsp:forward page="index01.jsp"/> 
<% 
			;
		} 
	}catch(Exception e){e.printStackTrace();}
%>
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
        <param name="movie" value="button20.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button20.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
  </tr>
  <tr> 
    <td width="30%" rowspan="2" align="center"><table rules="none" bgcolor="#99CCFF"  bordercolor="#FFCC99" width="85%" border="2">
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
      </table>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="1">&nbsp;</td>
    <td colspan="5"><table width="99%" border="0">
        <tr> 
          <td width="3%">&nbsp;</td>
          <td width="95%"><strong><font size="-1">ข้อมูลของท่าน</font></strong></td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>ชื่อ </td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>นามสกุล</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>สถานะ</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>สถานที่ทำงาน</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>หมายเลขประจำตัว</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>ที่อยู่</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>หมายเลขโทรศัพท์</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td>e-mail</td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td rowspan="4">&nbsp;</td>
          <td>ประเภทข่าวสารที่รับ</td>
          <td rowspan="4">&nbsp;</td>
        </tr>
        <tr> 
          <td>รูปแบบข่าวสารที่รับ</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><form name="form1" method="post" action="">
              <table width="100%" border="0">
                <tr>
                  <td width="20%">&nbsp;</td>
                  <td width="32%"><input type="submit" name="เปลี่ยนรหัสผ่าน" value="เปลี่ยนรหัสผ่าน"></td>
                  <td width="44%"><input type="submit" name="แก้ไขข้อมูล" value="  แก้ไขข้อมูล  "></td>
                  <td width="4%">&nbsp;</td>
                </tr>
              </table>
            </form></td>
        </tr>
      </table>
</td>
  </tr>
</table>

</body>

</html>
