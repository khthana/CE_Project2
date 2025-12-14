<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="x10.x6.x246.x161.*"%>
<%@ page import="java.sql.*"%>

<%
      	Login_Impl proxy = new Login_Impl(); 
	LoginSoap soapProxy = proxy.getloginSoap(); 
	String username=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");
	String passwd=request.getParameter("password");
	String library=request.getParameter("library");
	System.out.println(request.getParameter("session").length());
	UserProfile user=new UserProfile();	
	try{
		user = soapProxy.check_id(username,passwd,library);
	}catch(Exception e){e.printStackTrace();out.print(e);}
		if (user.getUsername()!=null&&request.getParameter("session").length()>70){
			try{
			Connection connection;
			Class.forName("com.mysql.jdbc.Driver");
			connection=DriverManager.getConnection("jdbc:mysql://161.246.6.10:3306/center?user=root&password=library&useUnicode=true&characterEncoding=windows-874");
			Statement statement;
			statement=connection.createStatement();
			String sql="select * from logon_status where username = '"+username+"' and library = '"+library+"'";
			//sql="INSERT INTO logon_status (username, session, library) VALUES ('"+username+"', '"+session.getId()+"', '"+library+"')";
			//System.out.println(sql);
			ResultSet resultset=statement.executeQuery(sql);
			String temp_username=new String(), temp_library=new String();
			while(resultset.next()){
				//System.out.println("************************");
				//System.out.println(resultset.getString("username"));
				//System.out.println(resultset.getString("library"));
				temp_username=resultset.getString("username");
				temp_library=resultset.getString("library");
			}
			//System.out.println(temp_username);
			//System.out.println(temp_library);
			//System.out.println(username);
			//System.out.println(library);
			if (temp_username.equals(username)&&temp_library.equals(library)){
				sql="UPDATE logon_status SET session= '"+session.getId()+"' WHERE username='"+username+"' AND library='"+library+"'";
				//System.out.println(sql);
				statement.executeUpdate(sql);
			}else{
				sql="INSERT INTO logon_status (username, session, library) VALUES ('"+username+"', '"+session.getId()+"', '"+library+"')";
				statement.executeUpdate(sql);
				//System.out.println("false");
			}
			statement.close();
			connection.close();
			}catch(Exception e){e.printStackTrace();out.print(e);}
			out.println("<h3> ขอต้อนรับคุณ "+user.getName()+"</h3>" );
			Cookie cookie=new Cookie("username",username);
			cookie.setMaxAge(60);
			response.addCookie(cookie);
			cookie=new Cookie("library",library);
			cookie.setMaxAge(60);
			response.addCookie(cookie);
			cookie=new Cookie("name",user.getName());
			cookie.setMaxAge(60);
			response.addCookie(cookie);
			cookie=new Cookie("session_id", session.getId());
			cookie.setMaxAge(60);
			response.addCookie(cookie);
%>
<html>
<head><title>Welcome</title><meta http-equiv="Content-Type" content="text/html; charset=windows-874"></head>
<body background="BG2 for page1copy.jpg">
<table width="100%" border="0"><tr><td rowspan="2"> 
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
<%}else{%><jsp:forward page="index01.jsp"/><%}%>
</body>

</html>
