<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*" %>
<%	
AddBook_Impl proxy = new AddBook_Impl(); 
AddBookSoap soapProxy = proxy.getaddBookSoap();
%>

<%
String book_record=new String(request.getParameter("key").getBytes("iso-8859-1"), "tis-620");
	Book book = soapProxy.getbook_by_bookrecord(book_record);
String returndate= book.getReturnDate();
%>

<html>
<head>
<title>แก้ไขข้อมูลหนังสือ</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
          <td width="56%">&nbsp;</td>
          <td width="11%">&nbsp;</td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button7.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button7.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button5.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button5.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
                                        <td width="11%">&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2"> <div align="center"> 
        <form action="catalog_edit4.jsp" method="get">
          <table width="90%" border="1" rules="none">
            <tr> 
              <td width="11%"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td width="13%"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td colspan="4"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>รายการหนังสือหมายเลขที่ 
                <%=book_record%>
                </strong> </font></td>
            </tr>
            <tr> 
              <td rowspan="2">&nbsp;</td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">เลขเรียกหนังสือ 
                <input name="call_number" type="text" size="20" value ="<%=book.getCallNumber()%>";>
                </font></td>
              <td rowspan="2"><fon face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หมายเลข 
                ISBN 
                <input name="isbn" type="text" size="20" value="<%=book.getIsbn()%>";>
                </font></td>
            </tr>
            <tr> 
              <td>&nbsp;</td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หมายเลขบาร์โค๊ด 
                <input name="barcode" type="text"  value="<%=book.getBarcode()%>">
                </font></td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ผู้แต่งลำดับที่ 
                1 
                <input type="text" name="author" value="<%=book.getAuthor()%>">
                </font></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ผู้แต่งลำดับที่ 
                2 
                <input type="text" name="alt_author1" value="<%=book.getAltAuthor1()%>">
                </font></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ผู้แต่งลำดับที่ 
                3 
                <input type="text" name="alt_author2" value="<%=book.getAltAuthor2()%>";>
                </font></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชื่อเรื่อง 
                <input type="text" name="title" value ="<%=book.getTitle()%>">
                ชื่อเรื่องเทียบเคียง 
                <input type="text" name="alt_title" value="<%=book.getAltTitle()%>">
                </font></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ลงทะเบียน 
                เมื่อ(ปี-เดือน-วันที่) 
                <input type="text" name="textfield15" value="<%=book.getIncomeDate()%>" disabled>
                </font></td>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td rowspan="9"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โรงพิมพ์ 
                <input type="text" name="printing"value="<%=book.getPrinting()%>">
                ปีที่พิมพ์ 
                <input name="years" type="text" size="5" maxlength="4" value="<%=book.getPrintingYear()%>">
                จำนวนหน้า 
                <input name="book_page" type="text" size="5" maxlength="5">
                </font></td>
              <td rowspan="9"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หัวเรื่องที่ 
                1 
                <input type="text" name="subject1"value="<%=book.getSubject1()%>">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หัวเรื่องที่ 
                2 
                <input type="text" name="subject2"value="<%=book.getSubject2()%>">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หัวเรื่องที่ 
                3 
                <input type="text" name="subject3"value="<%=book.getSubject3()%>">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชุด 
                Series 
                <input type="text" name="series"value="<%=book.getSeries()%>">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">สถานที่เก็บ 
                <input name="place" type="text" size="15" maxlength="15" value="<%=book.getPlace()%>">
                สถานะหนังสือ <select name="status" <option value="<%=book.getBookStatus()%>">
                <%=book.getBookStatus()%>
                </option>
                <option value="Shelve" >อยู่บนชั้นหนังสือ</option>
                <option value="Library use only">ใช่ในห้องสมุดเท่านั้น</option>
                <option value="In use">มีผู้ยืมอยู่</option>
                <option value="Missing">หาย</option>
                <option value="cataloging">กำลังลงทะเบียน</option></select>
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชื่อสมาชิกที่ยืมหนังสือ
	       <input name="username_use" type="text" value="<%=book.getUsernameUse()%>"></font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">
	      วันที่ยืม <input name="borrow_date" type="text" value="<%=book.getBorrowDate()%>">
	   กำหนดคืน  <input name="return_date" type="text" value="<%=book.getReturnDate()%>">
	      </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รายละเอียดเพิ่มเติม 
                <input name="detail" type="text" size="65" maxlength="200" value="<%=book.getDiscription()%>">
                </font></td>
            </tr>
            <tr> 
              <td height="27" colspan="4"> 
	      <input name="book_record" type="hidden" value="<%=book_record%>">
	      <input name="key" type="hidden" value="<%=book_record%>">
	  
	      </td>
            </tr>
            <tr> 
              <td rowspan="2">&nbsp;</td>
              <td width="34%" rowspan="2"><div align="center"> 
                  <input type="reset" name="clear" value="   Clear All   ">
                </div></td>
              <td width="42%" rowspan="2"><div align="center"> 
                  <input type="submit" name="next_record" value="  Confirm  ">
                </div></td>
              <td>&nbsp;</td>
            </tr>
            <tr> 
              <td>&nbsp;</td>
            </tr>
          </table>
        </form>
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
