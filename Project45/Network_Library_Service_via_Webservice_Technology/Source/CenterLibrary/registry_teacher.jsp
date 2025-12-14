<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="com.ora.jsp.util.*" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>
<% Registry_Impl proxy = new Registry_Impl(); %>
<% RegistrySoap soapProxy = proxy.getregistrySoap(); %>


<html>
<head>
<title>สมัครสมาชิก (สำหรับอาจารย์)</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
</head>

<body>
<table width="100%" border="0">
  <tr> 
    <td width="16%"><strong>สมัครสมาชิก</strong></td>
    <td width="34%"><font color="#9966CC" size="-2"><strong>step 2</strong></font></td>
    <td width="34%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="4"><table width="100%" border="0">
        <tr> 
          <td width="56%">&nbsp;</td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button12.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button12.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button13.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button13.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button14.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button14.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button16.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button16.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td colspan="2" rowspan="2"><form name="form1" method="post" action="registry_teacher1.jsp">
        <table width="100%" border="0" cellspacing="7"  background="fill_whi_M2.gif">
          <tr> 
            <td> 
	    <jsp:useBean id="errorMessages" scope="request" class="java.util.Vector"/>
	<%
	    if(errorMessages.size()>0){
	%><ul>
                <em><font color="red" size="" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                <j3pJSP:loop name="errorMessages" loopId="msg" className="String" >
          	<li> <%= msg %></li>
        	</j3pJSP:loop>
                </font></em>
	</ul>
              <% ;}
	%>
            </td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">Username 
              <input name="username" type="text" id="username">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">Password 
              <input name="password" type="password" id="password">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">Re-type Password 
              <input type="password" name="password2" id="password2" >
              </font></td>
          </tr>
          <tr> 
            <td><hr> </td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชื่อ 
              <input name="name" type="text" id="name">
              นามสกุล 
              <input name="last_name" type="text" id="last_name">
              เพศ 
              <input name="sex" type="radio" value="man" checked id="sex">
              ชาย 
              <input type="radio" name="sex" value="woman" >
              หญิง</font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">มีความประสงค์จะขึ้นทะเบียนเป็นสมาชิกห้องสมุด 
              <select name="library" size="1" id="select">
                <option value="ABC">ABC</option>
                <option value="XYZ">XYZ</option>
              </select>
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หมายเลขบัตรข้าราชการ 
              <input name="id" type="text" id="id">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> บัตรข้าราชการหมดอายุวันที่ 
              <select name="day" size="1" id="select2" >
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
              <select name="mouth" size="1" id="mouth">
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
              <select name="year" size="1" id="year">
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
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">สถานภาพ 
              <select name="status" size="1" id="select3">
                <option value="under_graduate">ปริญญาตรี</option>
                <option value="graduate">ปริญญาโท</option>
                <option value="graduate">ปริญญาเอก</option>
              </select>
              </font></td>
          </tr>
          <tr> 
            <td><font  face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>สถานที่ทำงาน</strong></font></td>
          </tr>
          <tr> 
            <td><font  face="AngsanaUPC, BrowalliaUPC, CordiaUPC">สังกัด คณะ/สำนัก/กอง 
              <select name="workadd1">
                <option value="วิศวกรรมศาสตร์">วิศวกรรมศาสตร์</option>
                <option value="วิทยาศาสตร์">วิทยาศาสตร์</option>
                <option value="คุรุศาสตร์">คุรุศาสตร์</option>
                <option value="อาคารสถานที่">อาคารสถานที่</option>
                <option value="วิจัยพัฒนา">วิจัยและพัฒนา</option>
              </select>
              </font> <font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> ภาควิชา/ฝ่าย 
              </font> <input name="workadd2" type="text" size="20" maxlength="30"> 
            </td>
          </tr>
          <tr> 
            <td><font  face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โทรศัพท์ที่ทำงาน 
              <input name="phone2" type="text" size="10" maxlength="10">
              ต่อ 
              <input name="phone3" type="text" size="5" maxlength="5">
              </font><font size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โทรสาร 
              <input name="phone4" type="text" size="12" maxlength="12">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>ที่อยู่ตามสำเนาทะเบียนบ้าน</strong></font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">บ้านเลขที่ 
              <input name="home_num" type="text" size="7" maxlength="7">
              <input name="address" type="radio" value="village" checked>
              หมู่บ้าน 
              <input type="radio" name="address" value="flat">
              แฟลต 
              <input type="radio" name="address" value="domitorial">
              หอพัก 
              <input name="village" type="text" id="village">
              หมู่ที่ 
              <input name="moo" type="text" size="2" maxlength="2">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ซอย 
              <input name="lane" type="text" id="lane">
              ถนน 
              <input name="road" type="text" id="road">
              ตำบล/แขวง 
              <input name="district" type="text" id="district">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">อำเภอ/เขต 
              <input name="amphur" type="text" id="amphur">
              จังหวัด 
              <select name="province" size="1" id="province">
                <option value="กรุงเทพมหานคร">กรุงเทพมหานคร</option>
                <option value="นนทบุรี">นนทบุรี</option>
                <option value="สมุทรปราการ">สมุทรปราการ</option>
                <option value="ชลบุรี">ชลบุรี</option>
              </select>
              รหัสไปรษณี 
              <input name="zip_code" type="text" id="zip_code" size="10" maxlength="10">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โทรศัพท์ 
              <input name="phone1" type="text" id="phone1" size="12" maxlength="12">
              ที่อยู่ e-mail 
              <input name="email" type="text" id="email">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>บริการแจ้งข่าวสารผ่านจดหมายอิเล็กทรอนิกส์ที่ต้องการ</strong></font></td>
          </tr>
          <tr> 
            <td><table width="100%" border="1" cellpadding="4" cellspacing="0" frame="below">
                <tr bgcolor="#3399CC"> 
                  <td width="7%" height="27">&nbsp;</td>
                  <td width="50%"><div align="center"><font color="#FFFFFF" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ข่าวสาร</font></div></td>
                  <td width="7%">&nbsp;</td>
                </tr>
                <tr>
                  <td rowspan="4">&nbsp;</td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="news_type1" value="1">
                    แจ้งสื่อสารนิเทศใหม่</font> <ul>
                      <font size="" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                      <input type="checkbox" name="category_a" value="a">
                      GENERAL WORKS (ทั่วไป) <br>
                      <input type="checkbox" name="category_b" value="b">
                      PHILOSOPHY, PSYCHOLOGY, RELIGION (ปรัชญา,จิตศาสตร์, ศาสนา) 
                      <br>
                      <input name="category_c" type="checkbox" value="c">
                      HISTORY (AUXILIARY SCIENCES: ARCHAEOLOGY, GENEALOGY, etc.) 
                      (ประวัติศาสตร์, โบราณคดี, พันธุศาสตร์) <br>
                      <input name="category_d" type="checkbox" value="d">
                      HISTORY (EXCEPT AMERICA) (ประวัติศาสตร์ ยกแว้นอเมริกา) <br>
                      <input name="category_e" type="checkbox" value="e">
                      AMERICA AND UNITED STATES (อเมริกา) <br>
                      <input name="category_g" type="checkbox" value="g">
                      GEOGRAPHY, ANTHROPOLOGY (ภูมิศาสตร์) <br>
                      <input name="category_h" type="checkbox" value="h">
                      SOCIAL SCIENCES (สังคมศาสตร์) <br>
                      <input name="category_j" type="checkbox" value="j">
                      POLITICAL SCIENCE (การเมืองการปกครอง) <br>
                      <input name="category_k" type="checkbox" value="k">
                      LAW (กฎหมาย) <br>
                      <input name="category_l" type="checkbox" value="l">
                      EDUCATION (การศึกษา) <br>
                      <input name="category_m" type="checkbox" value="m">
                      MUSIC (การดนตรี) <br>
                      <input name="category_n" type="checkbox" value="n">
                      FINE ARTS (ศิลป์ศาสตร์) <br>
                      <input name="category_p" type="checkbox" value="p">
                      LANGUAGE AND LITERATURE (ภาษาศาสตร์, อักขษรศาสตร์, วรรณคดี) 
                      <br>
                      <input name="category_q" type="checkbox" value="q">
                      SCIENCE (วิทยาศาสตร์) <br>
                      <input name="category_r" type="checkbox" value="r">
                      MEDICINE (แพทย์ศาสตร์) <br>
                      <input name="category_s" type="checkbox" value="s">
                      AGRICULTURE (เกษตรศาสตร์, กสิกรรม) <br>
                      <input name="category_t" type="checkbox" value="t">
                      TECHNOLOGY AND ENGINEERING (เทคโนโลยี, วิศวกรรมศาสตร์) <br>
                      <input name="category_u" type="checkbox" value="u">
                      MILITARY SCIENCE (การทหาร) <br>
                      <input name="category_v" type="checkbox" value="v">
                      NAVAL SCIENCE (ทหารเรือ) <br>
                      <input name="category_z" type="checkbox" value="z">
                      BIBLIOGRAPHY LIBRARY SCIENCE (ห้องสมุดศาสตร์) </font></ul></td>
                  <td rowspan="4">&nbsp;</td>
                </tr>
                <tr> 
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="news_type2" value="2">
                    แจ้งประกาศรการฉายภาพยนต์</font></td>
                </tr>
                <tr> 
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="news_type3" value="3">
                    แจ้งประกาศสัมนาของทางห้องสมุด</font></td>
                </tr>
                <tr> 
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="news_type4" value="4">
                    ประกาศทั่วไป</font></td>
                </tr>
                <tr bgcolor="#3399CC"> 
                  <td>&nbsp;</td>
                  <td bgcolor="">&nbsp;</td>
                  <td>&nbsp;</td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td><div align="center"> 
                <input type="submit" name="Submit" value="  next &gt;&gt; ">
		
              </div></td>
          </tr>
        </table>
      </form></td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>

</body>
</html>
