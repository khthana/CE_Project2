<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>
<%@ page import="com.ora.jsp.util.*" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="borrow.abc.library.com.*" %>

<% String username = (String)session.getAttribute("s_username"); %>
<%// ประกาศเซอร์วิสตรวจสอบกายืม
	Use_Impl proxy = new Use_Impl(); 
	UseSoap soapProxy = proxy.getuseSoap(); 
	Book books[]=null;
	int i=0;
	 //String username=session.getAttribute("s_username");
	//String username=new String(request.getParameter("username").getBytes("iso-8859-1"), "tis-620");
	try{
		books=soapProxy.check_book(username);
	}catch(Exception e){System.out.println(e);}
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
    <td colspan="6" >&nbsp;</td>
  </tr>
  <tr> 
    <td width="5%" height="50" >&nbsp;</td>
    <td width="17%" >&nbsp;</td>
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
    <td width="15%" ><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="108" height="46">
        <param name="movie" value="button23.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button23.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="108" height="46" ></embed> 
      </object></td>
  </tr>
  <tr> 
    <td width="30%" rowspan="6" align="center">
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
      <p>&nbsp;</p></td>
    <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="1" rowspan="5">&nbsp;</td>
    <td colspan="5"> <p> 
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
	%></p>
    </td>
  </tr>
  <tr> 
    <td colspan="5"><table width="95%" border="1" align="center" rules="groups">
        <tr> 
          <td width="2%">&nbsp;</td>
          <td width="48%"><strong>รายการยืมสารนิเทศ</strong></td>
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
                <td width="16%"  bgcolor="#CCCCFF"><div align="center">วันที่ยืม</div></td>
                <td width="15%"  bgcolor="#CCCCFF"><div align="center">กำหนดคืน</div></td>
              </tr>
              <% 
	      		if (books.length>0) {
				for ( i=0; i<books.length; i++) {
				if (books[i].getTitle()!=null){
	      %>
              <tr> 
                <td><div align="center"><font size="-1"><%=i+1+"."%></font></div></td>
                <td><font size="-1"><%=books[i].getTitle()%></font></td>
                <td><font size="-1"><%=books[i].getAuthor()%></font></td>
                <td><div align="center"><font size="-1"><%=books[i].getBorrowDate()%></font></div></td>
                <td><div align="center"><font size="-1"><%=books[i].getReturnDate()%></font></div></td>
              </tr>
              <%
	      }		}}
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
    <td colspan="5"><div align="center"></div></td>
  </tr>
  <tr> 
    <td colspan="5"><form name="form1" method="post" action="your_list1.jsp">
        <div align="center"> 
          <input type="submit" name="Submit" value=" ตรวจสอบรายการจองหนังสือ ">
        </div>
      </form></td>
  </tr>
  <tr> 
    <td colspan="5">&nbsp;</td>
  </tr>
</table>

</body>

</html>

