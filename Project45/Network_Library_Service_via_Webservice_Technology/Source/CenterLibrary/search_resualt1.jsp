<%@ page contentType="text/html; charset=windows-874" language="java" %>

<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="search.library.com.*" %>

<% 
	Search_all_Impl proxy = new Search_all_Impl(); 
	Search_allSoap soapProxy = proxy.getsearch_allSoap(); 
	
	String Book_record ;
	String temp = new String();
	String Library = new String();
	String title = new String(); 
 	String lib = new String(); 
 	String author = new String(); 
 	String alt_author1 = new String();
 	String alt_author2 = new String();
 	String callnum = new String();
 	String printing = new String();
 	String subject1 = new String();
 	String subject2 = new String();
 	String subject3 = new String();
 	String page_book=new String();
 	String ISBN=new String();
 	String status = new String();
 	String place = new String();
	Book_record=request.getParameter("book_record");
	Library=request.getParameter("library");
	 try{
	  		Book book=soapProxy.selectBookByBook_record(Book_record,Library);
			title=book.getTitle();
			printing=book.getPrinting();
			author=book.getAuthor();
			alt_author1=book.getAltAuthor1();
			alt_author2=book.getAltAuthor2();
			callnum=book.getCallNumber();
			page_book=book.getPage();
			subject1=book.getSubject1();
			subject2=book.getSubject2();
			subject3=book.getSubject3();
			ISBN=book.getIsbn();
			place=book.getPlace();
			status=book.getBookStatus();
			
	}catch(Exception e){System.out.print(e);} 
	  
%>

<html>
<head>
<title><%= title%></title> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body background="pageone.gif">

<table width="100%" border="0">
  <tr> 
    <td rowspan="2"> </td>
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
      <p>&nbsp;</p></td>
                <td height="22" colspan="6">&nbsp;</td>
  </tr>
  <tr> 
    <td height="233" colspan="1">&nbsp;</td>
    <td colspan="5"><table width="100%" border="1">
        <tr> 
          <td colspan="3"><strong><font size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รายละเอียดของหนังสือ</font></strong></td>
        </tr>
        <tr> 
          <td colspan="3" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF"><%="ห้องสมุด "+Library%></font></strong></div></td>
        </tr>
        <tr> 
          <td width="27%"><strong><em><font size="-1">ผู้แต่ง</font></em></strong></td>
          <td width="73%" colspan="2"><%=author%>&nbsp;</td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">ชื่อเรื่อง</font></em></strong></td>
          <td colspan="2"><%=title%>&nbsp;</td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">สำนักพิมพ์</font></em></strong></td>
          <td colspan="2"><%=printing%>&nbsp;</td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">รายละเอียด</font></em></strong></td>
          <td colspan="2"><%=page_book+" หน้า"%></td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">หัวเรื่อง</font></em></strong></td>
          <td colspan="2"><%
	  				if (subject1!=null){
						out.print(subject1);
						if (subject2!=null){
							out.print(", "+subject2);
							if (subject3!=null){
								out.print(", "+subject3);
							}
						}
					}
					%></td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">ผู้แต่งร่วม</font></em></strong></td>
          <td colspan="2"><%
	  				if (alt_author1!=null) out.print(alt_author1);
					%></td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">หมายเลข ISBN </font></em></strong></td>
          <td colspan="2"><%=ISBN%></td>
        </tr>
        <tr> 
          <td colspan="3"><form name="form2" method="post" action="reservation1.jsp">
	  <table width="100%" border="1">
              <tr> 
                <td width="27%" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF" size="-1">ที่ีอยู่</font></strong></div></td>
                <td width="23%" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF" size="-1">เลขเรียกหนังสือ</font></strong></div></td>
                <td width="23%" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF" size="-1">สถานะ</font></strong></div></td>
                <td width="27%" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF" size="-1">ทำการจอง</font></strong></div></td>
              </tr>
              <tr> 
                <td><center>
                    <%=place%></center></td>
                <td><center>
                    <%=callnum%></center></td>
                <td><center>
                    <%=status%></center></td>
                <td>
                    <div align="center"> 
                      <input name="reservation " type="submit" value="Submit">
                      <input name="username2" type="hidden" value="<%=session.getAttribute("s_username")%>">
		      <input name="library2" type="hidden" value="<%=Library%>">
		      <input name="book_record2" type="hidden" value="<%=Book_record%>">
                    </div>
                 </td>
              </tr>
              <tr> 
                  <td colspan="4">หมายเหตุในการจอง 
                    <input name="comment" type="text" size="50" maxlength="100"></td>
              </tr>
            </table> </form></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>

</html>
