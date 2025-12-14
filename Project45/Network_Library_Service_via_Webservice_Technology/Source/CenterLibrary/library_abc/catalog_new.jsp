<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%	
AddBook_Impl proxy = new AddBook_Impl(); 
AddBookSoap soapProxy = proxy.getaddBookSoap(); 
%>
<%
	String max_bookrecord=soapProxy.max_bookrecord();
%>
<html>
<head>
<title>Untitled Document</title>
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
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button40.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button40.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
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
        <form action="catalog_new2.jsp" method="post">
          <table width="90%" border="0" rules="none">
            <tr> 
              <td colspan="4" bgcolor="#FF99FF"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font>
            <tr> 
              <td colspan="4"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>รายการหนังสือหมายเลขที่ 
                <%=max_bookrecord%>
                </strong> </font></td>
            </tr>
            <tr> 
              <td width="12%" rowspan="14"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">เลขเรียกหนังสือ 
                <input type="text" name="call_number">
                หมายเลข ISBN 
                <input type="text" name="isbn">
                </font></td>
              <td width="7%" rowspan="14"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หมายเลขบาร์โค๊ด
	       <input name="barcode" type="text"></font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ผู้แต่งลำดับที่ 
                1 
                <input type="text" name="author">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ผู้แต่งลำดับที่ 
                2 
                <input type="text" name="alt_author1">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ผู้แต่งลำดับที่ 
                3 
                <input type="text" name="alt_author2">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชื่อเรื่อง 
                <input type="text" name="title">
                ชื่อเรื่องเทียบเคียง 
                <input type="text" name="alt_title">
                </font></td>
            </tr>
            <tr> 
              <!-- <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ลงทะเบียน 
                วันที่ 
                <select name="day" size="1" id="day" lang="be">
                  <option value="1">1</option>
                  <option value="2">2</option>
                  <option value="3">3</option>
                  <option value="4">4</option>
                  <option value="5">5</option>
                  <option value="6">6</option>
                  <option value="7">7</option>
                  <option value="8">8</option>
                  <option value="9">9</option>
                  <option value="10">10</option>
                  <option value="11">11</option>
                  <option value="12">12</option>
                  <option value="13">13</option>
                  <option value="14">14</option>
                  <option value="15">15</option>
                  <option value="16">16</option>
                  <option value="17">17</option>
                  <option value="18">18</option>
                  <option value="19">19</option>
                  <option value="20">20</option>
                  <option value="21">21</option>
                  <option value="22">22</option>
                  <option value="23">23</option>
                  <option value="24">24</option>
                  <option value="25">25</option>
                  <option value="26">26</option>
                  <option value="27">27</option>
                  <option value="28">28</option>
                  <option value="29">29</option>
                  <option value="30">30</option>
                  <option value="31">31</option>
                </select>
                เดือน 
                <select name="month" size="1">
                  <option value="มกราคม">มกราคม</option>
                  <option value="กุมภาพันธ์">กุมภาพันธ์</option>
                  <option value="มีนาคม">มีนาคม</option>
                  <option value="เมษายน">เมษายน</option>
                  <option value="พฤษภาคม">พฤษภาคม</option>
                  <option value="มิถุนายน">มิถุนายน</option>
                  <option value="กรกฎาคม">กรกฎาคม</option>
                  <option value="สิงหาคม">สิงหาคม</option>
                  <option value="กันยายน">กันยายน</option>
                  <option value="ตุลาคม">ตุลาคม</option>
                  <option value="พศจิกายน">พศจิกายน</option>
                  <option value="ธันวาคม">ธันวาคม</option>
                </select>
                ปี 
                <select name="years" size="1">
                  <option value="1998">1998</option>
                  <option value="1999">1999</option>
                  <option value="2000">2000</option>
                  <option value="2001">2001</option>
                  <option value="2002">2002</option>
                  <option value="2003">2003</option>
                  <option value="2004">2004</option>
                  <option value="2005">2005</option>
                  <option value="2006">2006</option>
                  <option value="2007">2007</option>
                  <option value="2008">2008</option>
                  <option value="2009">2009</option>
                  <option value="2010">2010</option>
                  <option value="2011">2011</option>
                  <option value="2012">2012</option>
                </select>
                </font></td> -->
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โรงพิมพ์ 
                <input type="text" name="printing">
                ปีที่พิมพ์ 
                <input name="years" type="text" size="5" maxlength="4">
                จำนวนหน้า 
                <input name="book_page" type="text" size="5" maxlength="5">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หัวเรื่องที่ 
                1 
                <input type="text" name="subject1">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หัวเรื่องที่ 
                2 
                <input type="text" name="subject2">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หัวเรื่องที่ 
                3 
                <input type="text" name="subject3">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชุด 
                Series 
                <input type="text" name="series">
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">สถานที่เก็บ 
                <input name="place" type="text" size="15" maxlength="25">
                สถานะหนังสือ 
                <select name="status">
                  <option value="Shelve">อยู่บนชั้นหนังสือ</option>
                  <option value="Library use only">ใช่ในห้องสมุดเท่านั้น</option>
                  <option value="In use">มีผู้ยืมอยู่</option>
                  <option value="Missing">หาย</option>
                  <option value="cataloging">กำลังลงทะเบียน</option>
                </select>
                </font></td>
            </tr>
            <tr> 
              <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รายละเอียดเพิ่มเติม 
                <input name="detail" type="text" size="65" maxlength="200">
                </font></td>
            </tr>
            <tr> 
              <td height="27" colspan="4" bgcolor="#FF99FF"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">&nbsp;</font></td>
            </tr>
            <tr> 
              <td rowspan="2">&nbsp;</td>
              <td width="31%" rowspan="2"><div align="center"> 
                  <input type="reset" name="clear" value="   Clear All   ">
                </div></td>
              <td width="50%" rowspan="2"><div align="center"> 
                  <input type="submit" name="next_record" value="Next record ">
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
