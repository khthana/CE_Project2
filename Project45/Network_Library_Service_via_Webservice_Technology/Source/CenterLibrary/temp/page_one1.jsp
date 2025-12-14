<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*"%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
	
<table width="100%" border="0">
  <tr> 
    <td rowspan="2"> 
      <% Login_Impl proxy = new Login_Impl(); %>
      <% LoginSoap soapProxy = proxy.getloginSoap(); %>
      <%	
	  	String id=request.getParameter("username");
		byte temp[]=id.getBytes("UTF-8");
		id=toString(temp);
		String library=request.getParameter("library");	
		String name=new String();
		String passwd=request.getParameter("password"); 
	  	UserProfile user = soapProxy.check_id(id,passwd,library); 
		name=user.getName();
		%>
      <% 	
	if (name!= null )
	{ 
%>
      <!-- welcome  -->
      <% 
	out.println("<h3>     ขอตอนรับ คุณ  "+name+"</h3>" ); 
	Cookie cookie=new Cookie("id",id);
	cookie.setMaxAge(60);
	response.addCookie(cookie);
	cookie=new Cookie("library",library);
	cookie.setMaxAge(60);
	response.addCookie(cookie);
	cookie=new Cookie("name",name);
	cookie.setMaxAge(60);
	response.addCookie(cookie);
	cookie=new Cookie("passwd",passwd);
	cookie.setMaxAge(60);
	response.addCookie(cookie);
	} 
	else{ 
%>
      <!-- Login fail. -->
      <jsp:forward page="index.jsp"/> 
      <% 
	
	} 
%>
    </td>
    <td colspan="6" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="5%" height="50" >&nbsp;</td>
    <td width="15%" >&nbsp;</td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button6.swf">
        <param name="quality" value="high">
        <embed src="button6.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button5.swf">
        <param name="quality" value="high">
        <embed src="button5.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button7.swf">
        <param name="quality" value="high">
        <embed src="button7.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="10%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button9.swf">
        <param name="quality" value="high">
        <embed src="button9.swf" quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
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
      </table></td>
    <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="1">&nbsp;</td>
    <td colspan="5">&nbsp;</td>
  </tr>
</table>

</body>

</html>
