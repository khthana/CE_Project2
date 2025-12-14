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
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
 <%	try{
	    %>
	    
<% String username=new String(request.getParameter("username").getBytes("iso-8859-1"),"utf-8");%>
<% String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");%>
<% String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");%>
<% String last_name = new String(request.getParameter("last_name").getBytes("iso-8859-1"),"utf-8");%>
<% String sex = new String(request.getParameter("sex").getBytes("iso-8859-1"),"utf-8");%>
<% String sex1 = new String(); %>
<% if(sex.equals("male")){sex1 = "ชาย";}
	else sex1 = "หญิง"; %>
<% String library = new String(request.getParameter("library").getBytes("iso-8859-1"),"utf-8");%>
<% String id = new String(request.getParameter("id").getBytes("iso-8859-1"),"utf-8");%>
<% int ID = Integer.parseInt(id);%>
<% String day = new String(request.getParameter("day").getBytes("iso-8859-1"),"utf-8");%>
<% String month = new String(request.getParameter("mouth").getBytes("iso-8859-1"),"utf-8");%>
<% String year = new String(request.getParameter("year").getBytes("iso-8859-1"),"utf-8");%>
<% String status = new String(request.getParameter("status").getBytes("iso-8859-1"),"utf-8");%>
<% String work_add1 = new String(request.getParameter("work_add1").getBytes("iso-8859-1"),"utf-8");%> 		<% System.out.println("This is test1"); %>
<% String work_add2 = new String(request.getParameter("work_add2").getBytes("iso-8859-1"),"utf-8");%>
<% String work_adress = work_add1+" "+work_add2; %>																											<% System.out.println("This is test2"); %>
<% String home_num = new String(request.getParameter("home_num").getBytes("iso-8859-1"),"utf-8");%>
<% String address = new String(request.getParameter("address").getBytes("iso-8859-1"),"utf-8");%>
<% String address1 = new String(); %>																																		<% System.out.println("This is test3"); %>
<% if(address.equals("หมู่บ้าน")){address1 = "หมู่บ้าน";}
	else if(address.equals("แฟลต")){address1 = "แฟลต";}
	else address1 = "หอพัก"; %>
<% String village = new String(request.getParameter("village").getBytes("iso-8859-1"),"utf-8");%>										<% System.out.println("This is test4"); %>
<%String p_village=address1+" "+village;%>
<% String moo = new String(request.getParameter("moo").getBytes("iso-8859-1"),"utf-8");%>
<% int p_moo;
		if(moo.length()==0)	 p_moo=0;
else{
		p_moo = Integer.parseInt(moo);}
 %>
<% String lane = new String(request.getParameter("lane").getBytes("iso-8859-1"),"utf-8");%>													<% System.out.println("This is test5"); %>
<% String road = new String(request.getParameter("road").getBytes("iso-8859-1"),"utf-8");%>
<% String district = new String(request.getParameter("district").getBytes("iso-8859-1"),"utf-8");%>
<% String amphur = new String(request.getParameter("amphur").getBytes("iso-8859-1"),"utf-8");%>									<% System.out.println("This is test6"); %>
<% String province = new String(request.getParameter("province").getBytes("iso-8859-1"),"utf-8");%>
<% String zip_code = new String(request.getParameter("zip_code").getBytes("iso-8859-1"),"utf-8");%>
<% int p_zipCode = Integer.parseInt(zip_code);%>
<% String phone1 = new String(request.getParameter("phone1").getBytes("iso-8859-1"),"utf-8");%>										<% System.out.println("This is test7"); %>
<% int p_phone1 = Integer.parseInt(phone1);%>
<% String email = new String(request.getParameter("email").getBytes("iso-8859-1"),"utf-8");%>										<% System.out.println("This is test8"); %>

<% int phone3 = 29245342;%>																						
<% int phone4 = 27373000;%>																																									<% System.out.println("This is test9"); %>
<% String category = "00000000000000000000";	
	String e_mail_way = "000";
	String application_way ="000";
	int  level = 4;																																					
%>
	<% System.out.println("this is name : "+name); %>
%>
<% soapProxy.add_member(
	library,    username,     password
	,     name,     last_name,     sex
	,     status,     work_adress,     ID,     year
	,     home_num,     lane,     p_village,     p_moo,     road,     district,     amphur,     province,     p_zipCode,     p_phone1,     phone3
	,     email,     category,      e_mail_way,     application_way,     level);  %>
<body>
<table width="100%" border="0">
  <tr> 
    <td width="16%"><strong>สมัครสมาชิก</strong></td>
    <td width="34%"><font color="#FF9900" size="-2"><strong>step 3</strong></font></td>
    <td width="34%">&nbsp;</td>
    <td width="16%">&nbsp;</td>
  </tr>
  <tr> 
    <td colspan="4"><table width="100%" border="0">
        <tr> 
          <td width="56%">&nbsp;</td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="file:///F|/Users/Nut/samples/my_web/button12.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="file:///F|/Users/Nut/samples/my_web/button12.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="file:///F|/Users/Nut/samples/my_web/button13.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="file:///F|/Users/Nut/samples/my_web/button13.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="file:///F|/Users/Nut/samples/my_web/button14.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="file:///F|/Users/Nut/samples/my_web/button14.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="file:///F|/Users/Nut/samples/my_web/button16.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="file:///F|/Users/Nut/samples/my_web/button16.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    
    <td colspan="2" rowspan="2"><form name="form1" method="post" action="">
        <table width="100%" border="0" cellspacing="7"  background="file:///F|/Users/Nut/samples/my_web/fill_whi_M2.gif">
          <tr> 
            <td colspan="2"><font color="#CC0000" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>โปรดตรวจสอบข้อมูลของท่านอีกครั้ง 
              แล้วกดปุ่ม Next &gt;&gt;</strong></font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">Username 
              <input type="text" name="username" disabled value="<%=username %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
              Password 
              <input type="password" name="password" disabled value="<%=password %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><hr> </td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชื่อ 
              <input name="name" type="text" id="name" disabled value="<%=name %>">
              นามสกุล 
              <input name="last_name" type="text" id="last_name" disabled value="<%=last_name %>">
              เพศ
              <input name="sex" type="text" size="4" maxlength="4" id="sex" disabled value="<%=sex1 %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">มีความประสงค์จะขึ้นทะเบียนเป็นสมาชิกห้องสมุด 
              <input type="text" name="library" disabled value="<%=library %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รหัสประจำตัวนักศึกษา 
              <input name="textfield" type="text" disabled value="<%=id %>" size="15" maxlength="15">
              บัตรนักศึกษาหมดอายุวันที่ 
              <input name="day" type="text" id="day" size="2" maxlength="2" disabled value="<%=day %>">
              เดือน 
              <input name="month" type="text" id="month" size="10" maxlength="15" disabled value="<%=month %>">
              ปี 
              <input name="year" type="text" id="year" size="5" maxlength="4"disabled value="<%=year %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">สถานภาพ 
              <input name="status" type="text" size="15" maxlength="20" disabled value="<%=status %>">
              สังกัดคณะ 
              <input type="text" name="work_add1" disabled value="<%=work_add1 %>">
              สาขาวิชา 
              <input type="text" name="work_add2" disabled value="<%=work_add2 %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ที่อยู่ตามสำเนาทะเบียนบ้าน</font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">
	  บ้านเลขที่ 
              <input name="home_num" type="text" size="7" maxlength="7" disabled value="<%=home_num %>">
           <% out.println("  "+address1+"  "); %>
              <input type="text" name="village"disabled value="<%= village %>">
              หมู่ที่ 
              <input name="moo" type="text" size="2" maxlength="2" disabled value="<%=moo %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ซอย 
              <input type="text" name="lane" disabled value="<%=lane %>">
              ถนน 
              <input type="text" name="road"disabled value="<%=road %>">
              ตำบล/แขวง 
              <input type="text" name="district"disabled value="<%=district %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">อำเภอ/เขต 
              <input type="text" name="amphur"disabled value="<%=amphur %>">
              จังหวัด 
              <input name="province" type="text" id="province" size="15" maxlength="15" disabled value="<%=province %>">
              รหัสไปรษณี 
              <input name="zip_code" type="text"disabled id="zip_code" value="<%=zip_code %>" size="10" maxlength="10">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โทรศัพท์ 
              <input name="phone1" type="text" id="phone1" size="12" maxlength="12"disabled value="<%=phone1 %>">
              ที่อยู่ e-mail 
              <input name="email" type="text"disabled id="email" value="<%=email %>">
              </font></td>
          </tr>
          <tr> 
            <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>บริการแจ้งข่าวสารที่ต้องการ</strong></font></td>
          </tr>
          <tr> 
            <td colspan="2"><table width="100%" border="1" cellpadding="4" cellspacing="0" frame="below">
                <tr bgcolor="#3399CC"> 
                  <td width="10%" height="27">&nbsp;</td>
                  <td width="39%"><div align="center"><font color="#FFFFFF" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ข่าวสาร</font></div></td>
                  <td width="41%"><div align="center"><font color="#FFFFFF" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รูปแบบการแจ้ง</font></div></td>
                  <td width="10%">&nbsp;</td>
                </tr>
                <tr> 
                  <td rowspan="3">&nbsp;</td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input name="checkbox" type="checkbox" value="checkbox" checked>
                    แจ้งเตือนกำหนดคืนสื่อสารนิเทศ</font></td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input name="checkbox2" type="checkbox" value="checkbox" checked>
                    จดหมายอิเล็กทรอนิกส์ 
                    <input type="checkbox" name="checkbox4" value="checkbox">
                    โปรแกรม</font></td>
                  <td rowspan="3">&nbsp;</td>
                </tr>
                <tr> 
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="checkbox22" value="checkbox">
                    แจ้งสื่อสารนิเทศใหม่</font> <ul>
                      <li><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><font size="-1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                        GENERAL WORKS (ทั่วไป)</font></li>
                      <li><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> PHILOSOPHY, 
                        PSYCHOLOGY, RELIGION (ปรัชญา,จิตศาสตร์, ศาสนา)</font></li>
                      <font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> <br>
                      <li>HISTORY (AUXILIARY SCIENCES: ARCHAEOLOGY, GENEALOGY, 
                        etc.) (ประวัตศาสตร์, โบราณคดี, พันธุศาสตร์)</li>
                      <br>
                      <li>HISTORY (EXCEPT AMERICA) (ประวัติศาสตร์ ยกแว้นอเมริกา)</li>
                      <br>
                      <li> AMERICA AND UNITED STATES (อเมริกา)</li>
                      <li>GEOGRAPHY, ANTHROPOLOGY (ภูมิศาสตร์)</li>
                      <br>
                      <li>SOCIAL SCIENCES (สังคมศาสตร์)</li>
                      <br>
                      <li>POLITICAL SCIENCE (การเมืองการปกครอง)</li>
                      <br>
                      <li>LAW (กฎหมาย)</li>
                      <br>
                      <li>EDUCATION (การศึกษา)</li>
                      <br>
                      <li>MUSIC (การดนตรี)</li>
                      <br>
                      <li>FINE ARTS (ศิลป์ศาสตร์)</li>
                      <br>
                      <li>LANGUAGE AND LITERATURE (ภาษาศาสตร์, อักขษรศาสตร์, วรรณคดี)</li>
                      <br>
                      <li>SCIENCE (วิทยาศาสตร์)</li>
                      <br>
                      <li>MEDICINE (แพทย์ศาสตร์)</li>
                      <br>
                      <li>AGRICULTURE (เกษตรศาสตร์, กสิกรรม)</li>
                      <br>
                      <li>TECHNOLOGY AND ENGINEERING (เทคโนโลยี, วิศวกรรมศาสตร์)</li>
                      <br>
                      <li>MILITARY SCIENCE (การทหาร)</li>
                      <br>
                      <li>NAVAL SCIENCE (ทหารเรือ)</li>
                      <br>
                      <li> BIBLIOGRAPHY LIBRARY SCIENCE (ห้องสมุดศาสตร์)</li>
                      </font> </font> </ul></td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="checkbox23" value="checkbox">
                    จดหมายอิเล็กทรอนิกส์ 
                    <input type="checkbox" name="checkbox42" value="checkbox">
                    โปรแกรม</font></td>
                </tr>
                <tr> 
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="checkbox3" value="checkbox">
                    แจ้งกำหนดรับสื่อสารนิเทศที่จองไว้</font></td>
                  <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <input type="checkbox" name="checkbox24" value="checkbox">
                    จดหมายอิเล็กทรอนิกส์ 
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
                <input name="back" type="submit" id="back" value=" &lt;&lt; Back " src="registry_student.jsp">
              </div></td>
            <td><div align="center"> 
               <!--  <form action="page_one.jsp" method="post" name="next" target="_self"> -->
		<input name="next" type="submit" id="next" value="  next &gt;&gt; ">

                
			 <!-- </form> -->
              </div></td>
          </tr>
        </table>
	 <% }catch(Exception e){System.out.println(e);} 
	    %> </form>
     </td>
    <td> </td>
  </tr>
  <tr> 
    <td> </td>
    <td> </td>
  </tr>
  <tr> 
    <td> </td>
    <td> </td>
    <td> </td>
    <td> </td>
  </tr>
</table>

</body>
</html>

</body>
</html>
