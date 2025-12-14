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

<body>

<table width="100%" border="0">
  <tr> 
    <td width="20%"> </td>
    <td colspan="7" >&nbsp;</td>
  </tr>
  <tr> 
    <td><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="147" height="34">
        <param name="movie" value="button2.swf">
        <param name="quality" value="high">
        <param name="base" value=".">
        <embed src="button2.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="147" height="34" ></embed> 
      </object></td>
                <td width="20%" height="50" colspan="2" >&nbsp;</td>
    <td width="27%" >&nbsp;</td>
    <td width="20%" >&nbsp;</td>
    <td width="20%">&nbsp;</td>
    <td width="20%" >&nbsp;</td>
    <td width="20%" >&nbsp;</td>
  </tr>
  <tr> 
    <td height="233" colspan="8" align="center"> 
      <p>&nbsp;</p>
      <table width="75%" border="1">
        <tr> 
          <td colspan="3"><strong><font size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รายละเอียดของหนังสือ</font></strong></td>
        </tr>
        <tr> 
          <td colspan="3" bgcolor="#009966"><div align="center"><strong><font color="#FFFFFF"><%="ห้องสมุด "+Library%></font></strong></div></td>
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
          <td colspan="2"> 
            <%
	  				if (subject1!=null){
						out.print(subject1);
						if (subject2!=null){
							out.print(", "+subject2);
							if (subject3!=null){
								out.print(", "+subject3);
							}
						}
					}
					%>
          </td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">ผู้แต่งร่วม</font></em></strong></td>
          <td colspan="2"> 
            <%
	  				if (alt_author1!=null) out.print(alt_author1);
					%>
          </td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">หมายเลข ISBN </font></em></strong></td>
          <td colspan="2"><%=ISBN%></td>
        </tr>
        <tr> 
          <td colspan="3"><form name="form2" method="post" action="reservation1.jsp">
              <table width="100%" border="1">
                <tr> 
                  <td width="32%"bgcolor="#009966"><div align="center"><strong><font color="#FFFFFF" size="-1">ที่ีอยู่</font></strong></div></td>
                  <td width="35%" bgcolor="#009966"><div align="center"><strong><font color="#FFFFFF" size="-1">เลขเรียกหนังสือ</font></strong></div></td>
                  <td width="33%" bgcolor="#009966"><div align="center"><strong><font color="#FFFFFF" size="-1">สถานะ</font></strong></div>
                    <div align="center"><strong></strong></div></td>
                </tr>
                <tr> 
                  <td><center>
                      <%=place%></center></td>
                  <td><center>
                      <%=callnum%></center></td>
                  <td><center>
                      <%=status%> 
                    </center>
                    <div align="center"> </div></td>
                </tr>
              </table>
            </form></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>

</html>
