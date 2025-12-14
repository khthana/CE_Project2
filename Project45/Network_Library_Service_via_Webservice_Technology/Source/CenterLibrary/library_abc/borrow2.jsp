<%@ page contentType="text/html; charset=windows-874" language="java" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="borrow.abc.library.com.*" %>

<%   //ประกาศ service
	Use_Impl proxy = new Use_Impl(); 
	UseSoap soapProxy = proxy.getuseSoap(); 
	String id=request.getParameter("id");  //เลขประจำตัว
	int number=0;  //จำนวนที่ยืมได้
	UserProfile user=null;  //ข้อมูลผู้ใช้
	Book books[]=null;  //รายการหนังสือที่ยืม
	String book_status=request.getParameter("book_status");
	if (book_status.equalsIgnoreCase("in use")) 	book_status="หนังสือนี้ถูกยืมอยู่";
	if (book_status.equalsIgnoreCase("Library use only")) book_status="หนังสือนี้ไม่สามารถยืมออกนอกห้องสมุดได้";
	if (book_status.equalsIgnoreCase("reservation")) book_status="หนังสือนี้ถูกจองอยู่";
	if (book_status.equalsIgnoreCase("complete")) book_status="การยืมเสร็จสมบูรณ์";
	int i=0;
	try{
		user=soapProxy.check_id(id);
	}catch(Exception e){System.out.println(e);}
	if (user!=null) {
		try{
			number=soapProxy.check_number_book(user.getUsername(), user.getStatus());
		}catch(Exception e){System.out.println(e);}
%>
<html>
<head>
<title>ข้อมูลผู้ใช้บริการ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="100%" border="0">
  <tr> 
    <td width="13%">&nbsp;</td>
    <td width="37%">&nbsp;</td>
    <td width="37%">&nbsp;</td>
    <td width="13%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="4"><table width="100%" border="0">
        <tr> 
          <td width="56%"><div align="right"><em></em></div></td>
          <td width="11%">&nbsp;</td>
          <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button7.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button7.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button5.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button5.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
                                        <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2"><div align="center"><em><font color="#FF0000"><%=book_status%></font></em></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2"> <div align="center"> 
        <form action="borrow3.jsp" method="post">
          <table width="100%" border="0" rules="none">
            <tr> 
              <td width="15%" height="11">&nbsp;</td>
              <td colspan="2" bgcolor="#9999FF"><div align="center"><font color="#FFFF66"><strong>บันทึกรายการยืมหนังสือ</strong></font></div></td>
              <td width="15%" rowspan="2">&nbsp;</td>
            </tr>
            <tr> 
              <td height="12">&nbsp;</td>
              <td>ชื่อผู้ใช้ : </td>
              <td><%=user.getName()%> <%=user.getLastname()%></td>
            </tr>
            <tr> 
              <td>&nbsp;</td>
              <td width="28%" > <div align="left">รหัสประจำตัว :</div></td>
              <td width="42%"><%=user.getId()%> <div align="left"></div></td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td rowspan="4">&nbsp;</td>
              <td> <div align="left">คณะ : </div></td>
                                                        <td> <%=user.getWorkAddress()%>
                                                                <%
	try{
		books=soapProxy.check_book(user.getUsername());
	}catch(Exception e){System.out.println(e);}
	if (books.length>0) {
%>
                                                        </td>
              <td rowspan="4">&nbsp;</td>
            </tr>
            <tr> 
              <td>รายการยืมหนังสือ</td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td colspan="2"><table width="100%" border="0">
                  <tr> 
                    <td width="13%">&nbsp;</td>
                    <td width="72%"> 
                      <%
		for ( i=0; i<books.length; i++){
			if (books[i].getTitle()!=null) out.print(i+1+". "+books[i].getTitle()+"<br><br>");
		}
	}
	if (number>0) {
%>
                      <input name="book" type="text" size="20" maxlength="20"> 
                      <br> <br>
<%
	}
%>
                    </td>
                    <td width="15%">&nbsp;</td>
                  </tr>
                </table></td>
            </tr>
            <tr> 
              <td colspan="2"> <div align="center"> 
                  <input name="status" type="hidden" value="<%=user.getStatus()%>">
                  <input name="username" type="hidden" value="<%=user.getUsername()%>">
		  <input name="id" type="hidden" value="<%=id%>">
                  <input name="" type="submit" value="   บันทึก   ">        </form>
                                                                        <form action="borrow1.jsp" method="post"><input type="submit" name="Submit" value="&nbsp;&nbsp;&nbsp;&nbsp;กลับ&nbsp;&nbsp;&nbsp;&nbsp;"></form>
                                                                </div></td>
            </tr>
            <tr> 
              <td>&nbsp;</td>
              <td colspan="2"bgcolor="#9999FF">&nbsp;</td>
              <td>&nbsp;</td>
            </tr>
          </table>

      </div></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td><div align="center"> </div></td>
    <td><div align="center"></div></td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
<%
	}
%>