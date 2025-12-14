<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*" %>
<% String s_username = (String)session.getAttribute("s_username"); %>
<% if (s_username == null){
%>		<%--สร้าง errorMessage--%>
			<jsp:useBean id="errorMessages" scope="request" class="java.util.Vector" />
			<% errorMessages.addElement(" !! กรุณาทำการสมัครสมาชิกก่อน !!"); %>	
		<%--ทำการส่งกลับไปหน้าแรก--%>
	<jsp:forward page="index01.jsp"/> 
<% ;}%>
<%
String library = new String(request.getParameter("library2").getBytes("iso-8859-1"), "tis-620");
String username = new String(request.getParameter("username2").getBytes("iso-8859-1"), "tis-620");
String book_record = new String(request.getParameter("book_record2").getBytes("iso-8859-1"), "tis-620");
String comment = new String(request.getParameter("comment").getBytes("iso-8859-1"), "tis-620");
ReservationShowData show_data = new ReservationShowData();
%>
<%// ประกาศเซอร์วิส	
	Reservation_Impl proxy = new Reservation_Impl(); 
	ReservationSoap soapProxy = proxy.getreservationSoap(); 
%>
<%// เรียกใช้เซอร์วิส
	show_data = soapProxy.check_reservation(library, username, book_record, comment);
%>
<%// รับค่าตัวแปรจากเซอร์วิส
	String author= show_data.getAuthor();
	String call_number= show_data.getCallNumber();
	String reseive_date= show_data.getReceiveDate();
	String reservation_date= show_data.getReservationDate();
	String title= show_data.getTitle();
	String lastname= show_data.getUserLastname();
	String name= show_data.getUserName();
%>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body   background="pageone.gif">
<table width="100%" border="0">
  <tr> 
    <td rowspan="2"> </td>
    <td colspan="6" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="11%" height="50" >&nbsp;</td>
    <td width="8%" >&nbsp;</td>
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
    <td width="23%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button23.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button23.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
  </tr>
  <tr> 
    <td width="25%" rowspan="2" align="center">
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
      <p>&nbsp;</p></td>
    <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="1">&nbsp;</td>
    <td colspan="5"><table width="85%" border="0">
        <tr> 
          <td colspan="4"  bgcolor="#3399FF"><font color="#FFFFFF" size="-1"><strong>รายละเอียดการจองหนังสือ</strong></font></td>
        </tr>
        <tr> 
          <td width="11%" rowspan="8"><font size="-1">&nbsp;</font><font size="-1">&nbsp;</font></td>
          <td width="34%"><font size="-1">ชื่อผู้จอง</font></td>
          <td width="43%"> <font size="-1"> 
            <%=name%>
            </font></td>
          <td width="12%" rowspan="8"><font size="-1">&nbsp;</font><font size="-1">&nbsp;</font></td>
        </tr>
        <tr> 
          <td><font size="-1">นามสกุล</font></td>
          <td> <font size="-1"> 
            <%=lastname%>
            </font></td>
        </tr>
        <tr> 
          <td><font size="-1">ชื่อหนังสือ</font></td>
          <td> <font size="-1"> 
            <%=title%>
            </font></td>
        </tr>
        <tr> 
          <td><font size="-1">ชื่อผู้แต่ง</font></td>
          <td> <font size="-1"> 
            <%=author%>
            </font></td>
        </tr>
        <tr> 
          <td><font size="-1">วันที่ทำการจอง</font></td>
          <td> <font size="-1"> 
            <%=reservation_date%>
            </font></td>
        </tr>
        <tr> 
          <td><font size="-1">กำหนดวันรับหนังสือ</font></td>
          <td> <font size="-1"> 
            <%=reseive_date%>
            </font></td>
        </tr>
        <tr> 
          <td><font size="-1">หมายเหตุ</font></td>
          <td><font size="-1"> 
            <textarea name="comment" cols="30" rows="3" ><%=comment%></textarea>
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font size="-1">&nbsp;</font> <table width="100%" border="0">
              <tr> 
                <td width="44%"> <div align="center"> 
                    <input type="submit" name="Submit" value=" ยกเลิก ">
                  </div></td>
                <td width="56%"><form action="reservation2.jsp" method="post"><div align="center"> 
                    <input type="submit" name="Submit2" value=" ยืนยัน ">
                    <input name="username" type="hidden" value="<%=username %>">
		    <input name="library" type="hidden" value="<%=library %>">
		    <input name="reseive_date" type="hidden" value="<%=reseive_date %>">
		    <input name="book_record" type="hidden" value="<%=book_record %>">
		    <input name="comment" type="hidden" value="<%=comment%>">
                    </div></form></td>
              </tr>
            </table>
            <font size="-1">&nbsp;</font></td>
        </tr>
        <tr> 
          <td colspan="4" bgcolor="#3399FF">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
</table>
</body>

</html>
