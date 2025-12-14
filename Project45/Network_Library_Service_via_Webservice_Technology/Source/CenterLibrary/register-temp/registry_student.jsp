<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="com.ora.jsp.util.*" %>
<%@ page import="weblogic.jws.proxies.*" %>
<%@ page import="org.openuri.www.*"%>
<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>
<% Registry_Impl proxy = new Registry_Impl(); %>
<% RegistrySoap soapProxy = proxy.getregistrySoap(); %>


<html>
<head>
<title>Untitled Document</title>
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
    <td colspan="2" rowspan="2"><form name="form1" method="post" action="registry_student1.jsp">
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
              <input name="sex" type="radio" value="male" checked id="sex">
              ชาย 
              <input type="radio" name="sex" value="female" >
              หญิง</font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">มีความประสงค์จะขึ้นทะเบียนเป็นสมาชิกห้องสมุด 
              <select name="library" size="1" id="library">
                <option value="ABC">ABC</option>
                <option value="XYZ">XYZ</option>
              </select>
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รหัสประจำตัวนักศึกษา 
              <input name="id" type="text" id="id">
              บัตรนักศึกษาหมดอายุวันที่ 
              <select name="day" size="1" id="day" >
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
              <select name="status" size="1" id="status">
                <option value="under_graduate">ปริญญาตรี</option>
                <option value="graduate">ปริญญาโท</option>
                <option value="graduate">ปริญญาเอก</option>
              </select>
              สังกัดคณะ 
              <select name="work_add1" id="work_add1">
                <option value="วิศวกรรมศาสตร์">วิศวกรรมศาสตร์</option>
                <option value="วิทยาศาสตร์">วิทยาศาสตร์</option>
                <option value="เกษตรศาสร์">เกษตรศาสร์</option>
              </select>
              สาขาวิชา 
              <input type="text" name="work_add2" id="work_add2">
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ที่อยู่ตามสำเนาทะเบียนบ้าน 
              </font></td>
          </tr>
          <tr> 
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">บ้านเลขที่ 
              <input name="home_num" type="text" size="7" maxlength="7" id="home_num">
              <input name="address" type="radio" value="หมู่บ้าน" checked id="address">
              หมู่บ้าน 
              <input name="address" type="radio" value="แฟลต">
              แฟลต 
              <input type="radio" name="address" value="หอพัก">
              หอพัก 
              <input name="village" type="text" id="village">
              หมู่ที่ 
              <input name="moo" type="text" id="moo" size="2" maxlength="2">
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
            <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>บริการแจ้งข่าวสารที่ต้องการ</strong></font></td>
          </tr>
          <tr> 
            <td><table width="100%" border="1" cellpadding="4" cellspacing="0" frame="below">
                <tr bgcolor="#3399CC"> 
                  <td width="7%" height="27">&nbsp;</td>
                  <td width="50%"><div align="center"><font color="#FFFFFF" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ข่าวสาร</font></div></td>
                  <td width="36%"><div align="center"><font color="#FFFFFF" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รูปแบบการแจ้ง</font></div></td>
                  <td width="7%">&nbsp;</td>
                </tr>
                <tr> 
                  <td rowspan="3">&nbsp;</td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input name="checkbox" type="checkbox" value="checkbox" checked>
                    แจ้งเตือนกำหนดคืนสื่อสารนิเทศ</font></td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input name="checkbox2" type="checkbox" value="checkbox" checked>
                    จดหมายอิเล็กทรอนิกส์ <br>
                    <input type="checkbox" name="checkbox4" value="checkbox">
                    โปรแกรม</font></td>
                  <td rowspan="3">&nbsp;</td>
                </tr>
                <tr> 
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="checkbox22" value="checkbox">
                    แจ้งสื่อสารนิเทศใหม่</font> <ul>
                      <font size="" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                      <input type="checkbox" name="checkbox5" value="checkbox">
                      GENERAL WORKS (ทั่วไป) 
		      <br>
                      <input type="checkbox" name="checkbox6" value="checkbox">
                      PHILOSOPHY, PSYCHOLOGY, RELIGION (ปรัชญา,จิตศาสตร์, ศาสนา)
		      <br>
                      <input name="" type="checkbox" value="">
		      HISTORY (AUXILIARY SCIENCES: ARCHAEOLOGY, GENEALOGY, 
                        etc.) (ประวัติศาสตร์, โบราณคดี, พันธุศาสตร์)
                      <br>
                      <input name="" type="checkbox" value="">
		      HISTORY (EXCEPT AMERICA) (ประวัติศาสตร์ ยกแว้นอเมริกา)
                      <br>
                      <input name="" type="checkbox" value="">
		       AMERICA AND UNITED STATES (อเมริกา)
		      <br>
                      <input name="" type="checkbox" value="">
		      GEOGRAPHY, ANTHROPOLOGY (ภูมิศาสตร์)
		      <br>
                      <input name="" type="checkbox" value="">
		      SOCIAL SCIENCES (สังคมศาสตร์)
                      <br>
                      <input name="" type="checkbox" value="">
		      POLITICAL SCIENCE (การเมืองการปกครอง)
                      <br>
                      <input name="" type="checkbox" value="">
		      LAW (กฎหมาย)
                      <br>
                      <input name="" type="checkbox" value="">
		      EDUCATION (การศึกษา)
                      <br>
                      <input name="" type="checkbox" value="">
		      MUSIC (การดนตรี)
                      <br>
                      <input name="" type="checkbox" value="">
		      FINE ARTS (ศิลป์ศาสตร์)
                      <br>
                      <input name="" type="checkbox" value="">
		      LANGUAGE AND LITERATURE (ภาษาศาสตร์, อักขษรศาสตร์, วรรณคดี)
                      <br>
                      <input name="" type="checkbox" value="">
		      SCIENCE (วิทยาศาสตร์)
                      <br>
                      <input name="" type="checkbox" value="">
		      MEDICINE (แพทย์ศาสตร์)
                      <br>
                      <input name="" type="checkbox" value="">
		      AGRICULTURE (เกษตรศาสตร์, กสิกรรม)
                      <br>
                      <input name="" type="checkbox" value="">
		      TECHNOLOGY AND ENGINEERING (เทคโนโลยี, วิศวกรรมศาสตร์)
                      <br>
                      <input name="" type="checkbox" value="">
		      MILITARY SCIENCE (การทหาร)
                      <br>
                      <input name="" type="checkbox" value="">
		      NAVAL SCIENCE (ทหารเรือ)
                      <br>
                      <input name="" type="checkbox" value="">
		      BIBLIOGRAPHY LIBRARY SCIENCE (ห้องสมุดศาสตร์)
                      </font> </ul></td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="checkbox23" value="checkbox">
                    จดหมายอิเล็กทรอนิกส์ <br>
                    <input type="checkbox" name="checkbox42" value="checkbox">
                    โปรแกรม</font></td>
                </tr>
                <tr> 
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="checkbox3" value="checkbox">
                    แจ้งกำหนดรับสื่อสารนิเทศที่จองไว้</font></td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="checkbox24" value="checkbox">
                    จดหมายอิเล็กทรอนิกส์ <br>
                    <input type="checkbox" name="checkbox43" value="checkbox">
                    โปรแกรม</font></td>
                </tr>
                <tr bgcolor="#3399CC"> 
                  <td>&nbsp;</td>
                  <td colspan="2" bgcolor="">&nbsp;</td>
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
