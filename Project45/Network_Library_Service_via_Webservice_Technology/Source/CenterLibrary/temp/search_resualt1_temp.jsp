<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*"%>
<% Search_all_Impl proxy = new Search_all_Impl(); %>
<% Search_allSoap soapProxy = proxy.getsearch_allSoap(); %>
<%! int Book_record ;%>
<%! String temp = new String();%>
<%! String Library = new String();%>

<%! String title = new String(); %>
<% title = "test";%>
<%! String lib = new String(); %>
<%! String author = new String(); %>
<%! String alt_author1 = new String();%>
<%! String alt_author2 = new String();%>
<%! String callnum = new String();%>
<%! String printting = new String();%>
<%! String subject1 = new String();%>
<%! String subject2 = new String();%>
<%! String subject3 = new String();%>
<%! int page_ ;%>
<%! int ISBN; %>
<%! String status = new String();%>
<%! String place = new String();%>

<html>
<head>
<title>Untitled Document</title> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body background="BG for page1copy.jpg">
<%temp=request.getParameter("book_record");%>
<% Book_record=Integer.parseInt(temp);%>
<%System.out.println("book_record = "+Book_record);%>
<%Library=request.getParameter("library");%>
<% try{
	  		Book book=soapProxy.selectBookByBook_record(Book_record,Library);
			title=book.getTitle();
			author=book.getAuthor();
			alt_author1=book.getAltAuthor1();
			alt_author2=book.getAltAuthor2();
			callnum=book.getCallNumber();
			page_=book.getPage();
			subject1=book.getSubject1();
			subject2=book.getSubject2();
			subject3=book.getSubject3();
			ISBN=book.getIsbn();
			place=book.getPlace();
			status=book.getBookStatus();
			System.out.println(title);
		}catch(Exception e){System.out.print(e);} 
	  %>
<table width="100%" border="0">
  <tr> 
    <td rowspan="2"> </td>
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
    <td height="233" colspan="1">&nbsp;</td>
    <td colspan="5"><table width="100%" border="1">
        <tr> 
          <td colspan="3"><form name="form1" method="post" action="">
              <table width="100%" border="0">
                <tr> 
                  <td>&nbsp;</td>
                  <td><select name="select2">
                      <option value="author">ชื่อผู้แต่ง</option>
                      <option value="title">ชื่อเรื่อง</option>
                      <option value="subject">หัวเรื่อง</option>
                      <option value="words">คำสำคัญ</option>
                      <option value="call_on">เลขเรียกหนังสือ</option>
                    </select></td>
                  <td><input name="textfield" type="text" size="40"></td>
                  <td><input type="submit" name="Submit" value="Search"></td>
                </tr>
              </table>
            </form></td>
        </tr>
        <tr> 
          <td colspan="3" bgcolor="#3399FF">&nbsp;</td>
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
          <td colspan="2"><%=Library%>&nbsp;</td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">รายละเอียด</font></em></strong></td>
          <td colspan="2"><%=page_+" หน้า"%></td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">หัวเรื่อง</font></em></strong></td>
          <td colspan="2"><%=subject1+", "+subject1+", "+subject1%></td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">ผู้แต่งร่วม</font></em></strong></td>
          <td colspan="2"><%=alt_author1%></td>
        </tr>
        <tr> 
          <td><strong><em><font size="-1">หมายเลข ISBN </font></em></strong></td>
          <td colspan="2"><%=ISBN%></td>
        </tr>
        <tr> 
          <td colspan="3"><table width="100%" border="1">
              <tr> 
                <td width="27%" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF" size="-1">ที่ีอยู่</font></strong></div></td>
                <td width="23%" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF" size="-1">เลขเรียกหนังสือ</font></strong></div></td>
                <td width="23%" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF" size="-1">สถานะ</font></strong></div></td>
                <td width="27%" bgcolor="#3399FF"><div align="center"><strong><font color="#FFFFFF" size="-1">ทำการจอง</font></strong></div></td>
              </tr>
              <tr> 
                <td><%=place%></td>
                <td><%=callnum%></td>
                <td><%=status%></td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>

</html>
