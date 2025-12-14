<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="login.library.com.*"%>
<% System.out.println("***************----------2----------*****************");  %>

<% String username = (String)session.getAttribute("s_username"); %>
<% String category = (String)session.getAttribute("s_category");%>
<% String test = (String)session.getAttribute("s_name"); %>
<%	
	if(test == null){ System.out.println("this is from pageone2: name=null");
System.out.println("***************----------3----------*****************"); 
%><jsp:forward page="index01.jsp"/> 
<%;}%>

<html>
<head>
<title>ข้อมูลผู้ใช้ระบบ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body  background="pageone.gif">
<table width="100%" border="0"><tr><td rowspan="2"> 
    </td>
    <td colspan="6" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="5%" height="50" >&nbsp;</td>
    <td width="19%" >&nbsp;</td>
    <td width="11%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button38.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button38.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button18.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button18.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="11%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button54.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button54.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
    <td width="13%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
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
          <td colspan="2"><p><strong><font size="-1">ข้อมูลของท่าน</font></strong></p>
            <p>&nbsp;</p></td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td width="24%"><font color="#003366">ชื่อ </font></td>
          <td width="71%"> <font color="#666699"> 
            <%=session.getAttribute("s_name")%>
            </font> </td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><font color="#003366">นามสกุล</font><font color="#666699">&nbsp; 
            </font></td>
          <td> <font color="#666699"> 
            <%=session.getAttribute("s_last_name")%>
            </font></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><font color="#003366">สถานะ</font><font color="#666699">&nbsp; </font></td>
          <td> <font color="#666699"> 
            <%=session.getAttribute("s_status")%>
            </font></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><font color="#003366">สถานที่ทำงาน</font><font color="#666699">&nbsp; 
            </font></td>
          <td> <font color="#666699"> 
            <%=session.getAttribute("s_work_add")%>
            </font></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><font color="#003366">หมายเลขประจำตัว </font></td>
          <td> <font color="#666699"> 
            <%=session.getAttribute("s_id")%>
            </font></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td rowspan="2">&nbsp;</td>
          <td><font color="#003366">ที่อยู่ </font></td>
          <td rowspan="2"> <font color="#666699"> 
            <%=session.getAttribute("s_address")%>
            </font></td>
          <td rowspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><font color="#003366">หมายเลขโทรศัพท์ </font></td>
          <td> <font color="#666699"> 
            <%=session.getAttribute("s_phone")%>
            </font></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td><font color="#003366">e-mail </font></td>
          <td> <font color="#666699"> 
            <%=session.getAttribute("s_email")%>
            </font></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td rowspan="4">&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td rowspan="4">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td colspan="2">
              <table width="100%" border="0">
                <tr> 
                  <td width="20%">&nbsp;</td>
                  <td width="32%"><form name="form1" method="post" action="change_password.jsp">
		  	<input type="submit" name="เปลี่ยนรหัสผ่าน" value="เปลี่ยนรหัสผ่าน">
				 </form></td>
                  <td width="44%"><form name="form2" method="post" action="change_userdata.jsp">
                                                                        </form></td>
                  <td width="4%">&nbsp;</td>
                </tr>
              </table>
           </td>
        </tr>
      </table>
</td>
  </tr>
</table>

</body>

</html>
