<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*" %>

<% String username = (String)session.getAttribute("s_username"); %>
<% String library = (String)session.getAttribute("s_library"); %>
<%// ประกาศเซอร์วิสตรวจสอบการจอง
	
	Reservation_Impl proxy = new Reservation_Impl(); 
	ReservationSoap soapProxy = proxy.getreservationSoap(); 
	ReservationShowData show_data[] = null;
	int i=0;
	try{
		show_data=soapProxy.user_check(library,username);
	}catch(Exception e){System.out.println(e); System.out.println("----------1---------------");}
%>

<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body  background="pageone.gif">
	
<table width="100%" border="0">
  <tr> 
    <td rowspan="2"> </td>
    <td colspan="7" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="8%" height="50" >&nbsp;</td>
    <td width="7%" >&nbsp;</td>
    <td width="6%" >&nbsp;</td>
    <td width="11%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button53.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button53.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
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
    <td width="17%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button23.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button23.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
  </tr>
  <tr> 
    <td width="29%" rowspan="6" align="center">
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
      <p>&nbsp;</p>
      <p>&nbsp;</p></td>
    <td height="22" colspan="7">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="1" rowspan="5">&nbsp;</td>
    <td colspan="6"><p> 
        <jsp:useBean id="errorMessages" scope="request" class="java.util.Vector"/>
        <%
	    if(errorMessages.size()>0){
	%>
      <ul>
        <em><font color="red" size="+2" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
        <strong><j3pJSP:loop name="errorMessages" loopId="msg" className="String" > 
        </j3pJSP:loop></strong><j3pJSP:loop name="errorMessages" loopId="msg" className="String" > 
        <li> <strong><%= msg %></strong></li>
        </j3pJSP:loop> </font></em> 
      </ul>
      <% ;}
	%></p     
>
    </td>
  </tr>
  <tr> 
    <td colspan="6"><table width="100%" border="1" rules="groups">
        <tr> 
          <td width="2%">&nbsp;</td>
          <td width="48%"><strong>รายการจองสารนิเทศ</strong></td>
          <td width="48%">&nbsp;</td>
          <td width="2%">&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
          <td colspan="2"><table width="100%" border="1">
              <tr> 
                <td width="8%"  bgcolor="#CCCCFF"><div align="center" >ลำดับ</div></td>
                <td width="35%"  bgcolor="#CCCCFF"><div align="center">หนังสือ</div></td>
                <td width="26%"  bgcolor="#CCCCFF"><div align="center">ผู้แต่ง</div></td>
                <td width="16%"  bgcolor="#CCCCFF"><div align="center">วันที่จอง</div></td>
                <td width="15%"  bgcolor="#CCCCFF"><div align="center">กำหนดรับ</div></td>
              </tr>
              <% 
	      		if (show_data.length>1) { 
			System.out.println(username);
			//System.out.println(show_data);
			System.out.println(show_data.length);
			for ( i=0; i<show_data.length; i++) {
			if (show_data[i]!=null){
		String author= show_data[i].getAuthor(); System.out.println(author);
		String reseive_date= show_data[i].getReceiveDate();
		String reservation_date= show_data[i].getReservationDate();
		String title= show_data[i].getTitle();
		String lastname= show_data[i].getUserLastname();
		String name= show_data[i].getUserName();
	      %>
              <tr> 
                <td><div align="center"><%=i+1%></div></td>
                <td><font size="-1"><%=title%></font></td>
                <td><font size="-1"><%=author%></font></td>
                <td><div align="center"><font size="-1"><%=reservation_date%></font></font></div></td>
                <td><div align="center"><font size="-1"><%=reseive_date%></font></font></div></td>
              </tr>
              <%
	      }
	      		}}
 %>
              <tr> 
                <td colspan="5" bgcolor="#CCCCFF">&nbsp;</td>
              </tr>
            </table></td>
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td height="24">&nbsp;</td>
          <td colspan="2">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="6"><div align="center"> 
        <form name="form1" method="post" action="your_list.jsp">
          <input type="submit" name="Submit" value=" ตรวจสอบรายการยืมหนังสือ ">
        </form>
      </div></td>
  </tr>
  <tr> 
    <td colspan="6">&nbsp;</td>
  </tr>
</table>

</body>

</html>

