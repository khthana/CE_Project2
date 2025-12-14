<%@ page contentType="text/html; charset=windows-874" language="java"  errorPage="" %>
<%@ page import="weblogic.jws.proxies.*"%>
<%@ page import="abc.edit.library.com.*"%>
<%
GetMemberData_Impl proxy = new GetMemberData_Impl(); 
GetMemberDataSoap soapProxy = proxy.getGetMemberDataSoap();
UserProfile user = new UserProfile();
	int i=0;
	String search_from=request.getParameter("search_from");
	String key = new String(request.getParameter("key").getBytes("iso-8859-1"), "tis-620");
	System.out.println("search_from = "+search_from);
	System.out.println("key = "+key);
	String category =new String();
	String email_way=new String();
	int ID=0;
	System.out.println("----------");
	try{
	if(search_from.equals("id"))
		{	ID = Integer.parseInt(key);
			user= soapProxy.getMemberDataByID(ID);
			System.out.println(user.getUsername());
		}else user= soapProxy.getMemberDataByUsername(key);
		category = user.getCategory();
		email_way=user.getEmailWay();
	}catch(Exception e){System.out.print(e);} 
%>
<html>
<head>
<title>แก้ไขข้อมูล</title>
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
          <td width="56%"><strong>แก้ไขข้อมูลสมาชิก</strong></td>
          <td width="11%">&nbsp;</td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button39.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button39.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
            </object></td>
          <td width="11%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
              <param name="movie" value="button45.swf">
              <param name="quality" value="high">
              <param name="base" value=".">
              <embed src="button45.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
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
    <td colspan="2"> 
      <div align="center"> 
        <form name="form1" method="post" action="member_edit3.jsp">
          <table width="100%" border="0" cellspacing="7"  background="">
            <tr> 
              <td><strong><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รายละเอียดสมาชิก</font></strong></td>
            </tr>
             
	     <%
	     if (search_from.equals("username")){System.out.println("-user-"+user.getUsername());
	     %>
	     <tr>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">Username      
                <input type="text" name="username" disabled value="<%=user.getUsername()%>">
                </font></td>
	  	</tr>
	     <%;}else{%><tr><td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">Username 
                <input type="text" name="username" value="<%=user.getUsername()%>">
                </font></td>  </tr>
		
	     <%;}
	     %>
             <%
	     if (search_from.equals("id")){
	     %>
            <tr>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รหัสประจำตัวนักศึกษา 
                <input type="text" name="id" disabled value="<%=user.getId()%>">
                </font></td>
            </tr>
	    <%;} else{ %>
	    <tr>
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รหัสประจำตัวนักศึกษา 
                <input type="text" name="id"value="<%=user.getId()%>">
                </font></td>
            </tr>
	    <% ;} %>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชื่อ 
                <input name="name" type="text" id="name" value="<%=user.getName()%>">
                นามสกุล 
                <input name="last_name" type="text" id="last_name" value="<%=user.getLastname()%>">
                เพศ 
		<% if(user.getSex().equals("male")){
		%>
                <input name="sex" type="radio" value="male" checked>
		<% ;}else{ %><input name="sex" type="radio" value="male">
                <%;}%>
                ชาย </font>
                <% if(user.getSex().equals("female")){
		%>
                <input type="radio" name="sex" value="female" checked>
		<% ;}else{ %><input name="sex" type="radio" value="female" >
                <%;}%>
                <font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หญิง</font></td>
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
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> บัตรนักศึกษาหมดอายุปี  
                <select name="select2" size="1">
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
                                                                <select name="status" size="1">
                                                                        <option value="<%=user.getStatus()%>"selected><%=user.getStatus()%></option>
                                                                  <option value="under_graduate">ปริญญาตรี</option>
                						<option value="graduate">ปริญญาโท</option>
               							 <option value="graduate">ปริญญาเอก</option>
             							 </select>
                                                     
                                                                &nbsp; &nbsp;สังกัดคณะ 
                                                                <select name="work_address">
                                                                        <option value="<%=user.getWorkAddress()%>"selected><%=user.getWorkAddress()%></option>
                                                                        <option value="วิศวกรรมศาสตร์" >วิศวกรรมศาสตร์</option>
                                                                        <option value="วิทยาศาสตร์">วิทยาศาสตร์</option>
                                                                        <option value="เกษตรศาสร์">เกษตรศาสร์</option>
                                                                </select>
                                                                &nbsp;&nbsp;ระดับผู้ใช้&nbsp; 
                                                                <select name="level">
                                                                        <option value="<%=user.getLevel()%>"selected><%=user.getLevel()%></option>
                                                                        <option value="0" >0</option>
                                                                        <option value="1">1</option>
                                                                        <option value="2">2</option>
                                                                        <option value="3">3</option>
                                                                        <option value="4">4</option>
                                                                </select>
                                                                </font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ที่อยู่ตามสำเนาทะเบียนบ้าน</font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">บ้านเลขที่ 
                <input name="home_number" type="text" size="7" maxlength="7"value="<%=user.getHomeNumber()%>">
                &nbsp; &nbsp; 
                <input name="radiobutton2" type="radio" value="radiobutton" checked>
                หมู่บ้าน 
                <input type="radio" name="radiobutton2" value="radiobutton">
                แฟลต 
                <input type="radio" name="radiobutton2" value="radiobutton">
                หอพัก 
                <input type="text" name="village" value="<%=user.getVillage()%>">
                &nbsp; &nbsp;หมู่ที่ &nbsp;
                <input name="moo" type="text" size="2" maxlength="2"value="<%=user.getMoo()%>">
                </font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ซอย 
                <input type="text" name="lane" value="<%=user.getLane()%>">
                ถนน 
                <input type="text" name="road" value="<%=user.getRoad()%>">
                ตำบล/แขวง 
                <input type="text" name="district"value="<%=user.getDistrict()%>">
                </font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">อำเภอ/เขต 
                <input type="text" name="amphur" value="<%=user.getAmphur()%>">
                จังหวัด 
                <select name="province" size="1">
		<option value="<%=user.getProvince()%>" selected><%=user.getProvince()%></option>
                  <option value="กรุงเทพมหานคร">กรุงเทพมหานคร</option>
                  <option value="นนทบุรี">นนทบุรี</option>
                  <option value="สมุทีปราการ">สมุทรปราการ</option>
                  <option value="ชลบุรี">ชลบุรี</option>
                </select>
                รหัสไปรษณี 
                <input name="zip_code" type="text" size="10" maxlength="10" value="<%=user.getZipCode()%>">
                </font></td>
            </tr>
            <tr> 
              <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โทรศัพท์ 
                <input name="phone" type="text" size="12" maxlength="12" value="<%=user.getPhone1()%>">
                ที่อยู่ e-mail 
                <input name="email" type="text" value="<%=user.getEmail()%>" size="35">
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
                    <td width="7%">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td rowspan="4">&nbsp;</td>
                    <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                      แจ้งสื่อสารนิเทศใหม่</font> <ul>
                        <font size="" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                        <input type="checkbox" name="category_a" value="a" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='a') {out.print("checked");System.out.println("A");	}}%>>
                        GENERAL WORKS (ทั่วไป) <br>
                        <input type="checkbox" name="category_b" value="b" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='b') {out.print("checked");System.out.println("A");	}}%>>
                        PHILOSOPHY, PSYCHOLOGY, RELIGION (ปรัชญา,จิตศาสตร์, ศาสนา) 
                        <br>
                        <input name="category_c" type="checkbox" value="c" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='c') {out.print("checked");System.out.println("A");	}}%>>
                        HISTORY (AUXILIARY SCIENCES: ARCHAEOLOGY, GENEALOGY, etc.) 
                        (ประวัติศาสตร์, โบราณคดี, พันธุศาสตร์) <br>
                        <input name="category_d" type="checkbox" value="d" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='d') {out.print("checked");System.out.println("A");	}}%>>
                        HISTORY (EXCEPT AMERICA) (ประวัติศาสตร์ ยกเว้นอเมริกา) 
                        <br>
                        <input name="category_e" type="checkbox" value="e" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='e') {out.print("checked");System.out.println("A");	}}%>>
                        AMERICA AND UNITED STATES (อเมริกา) <br>
                        <input name="category_g" type="checkbox" value="g" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='g') {out.print("checked");System.out.println("A");	}}%>>
                        GEOGRAPHY, ANTHROPOLOGY (ภูมิศาสตร์) <br>
                        <input name="category_h" type="checkbox" value="h" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='h') {out.print("checked");System.out.println("A");	}}%>>
                        SOCIAL SCIENCES (สังคมศาสตร์) <br>
                        <input name="category_j" type="checkbox" value="j" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='j') {out.print("checked");System.out.println("A");	}}%>>
                        POLITICAL SCIENCE (การเมืองการปกครอง) <br>
                        <input name="category_k" type="checkbox" value="k" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='k') {out.print("checked");System.out.println("A");	}}%>>
                        LAW (กฎหมาย) <br>
                        <input name="category_l" type="checkbox" value="l" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='l') {out.print("checked");System.out.println("A");	}}%>>
                        EDUCATION (การศึกษา) <br>
                        <input name="category_m" type="checkbox" value="m" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='m') {out.print("checked");System.out.println("A");	}}%>>
                        MUSIC (การดนตรี) <br>
                        <input name="category_n" type="checkbox" value="n" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='n') {out.print("checked");System.out.println("A");	}}%>>
                        FINE ARTS (ศิลป์ศาสตร์) <br>
                        <input name="category_p" type="checkbox" value="p" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='p') {out.print("checked");System.out.println("A");	}}%>>
                        LANGUAGE AND LITERATURE (ภาษาศาสตร์, อักขษรศาสตร์, วรรณคดี) 
                        <br>
                        <input name="category_q" type="checkbox" value="q" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='q') {out.print("checked");System.out.println("A");	}}%>>
                        SCIENCE (วิทยาศาสตร์) <br>
                        <input name="category_r" type="checkbox" value="r" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='r') {out.print("checked");System.out.println("A");	}}%>>
                        MEDICINE (แพทย์ศาสตร์) <br>
                        <input name="category_s" type="checkbox" value="s" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='s') {out.print("checked");System.out.println("A");	}}%>>
                        AGRICULTURE (เกษตรศาสตร์, กสิกรรม) <br>
                        <input name="category_t" type="checkbox" value="t" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='t') {out.print("checked");System.out.println("A");	}}%>>
                        TECHNOLOGY AND ENGINEERING (เทคโนโลยี, วิศวกรรมศาสตร์) 
                        <br>
                        <input name="category_u" type="checkbox" value="u" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='u') {out.print("checked");System.out.println("A");	}}%>>
                        MILITARY SCIENCE (การทหาร) <br>
                        <input name="category_v" type="checkbox" value="v" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='v') {out.print("checked");System.out.println("A");	}}%>>
                        NAVAL SCIENCE (ทหารเรือ) <br>
                        <input name="category_z" type="checkbox" value="z" <% 	for (i=0; i<category.length(); i++){ if (category.charAt(i)=='z') {out.print("checked");System.out.println("A");	}}%>>
                        BIBLIOGRAPHY LIBRARY SCIENCE (ห้องสมุดศาสตร์) </font></ul></td>
                    <td rowspan="4">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                      <input type="checkbox" name="news_type2" value="2" <% if (email_way.charAt(1)=='1') out.print("checked");%>>
                      แจ้งประกาศรการฉายภาพยนต์</font></td>
                  </tr>
                  <tr> 
                    <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                      <input type="checkbox" name="news_type3" value="3" <% if (email_way.charAt(2)=='1') out.print("checked");%>>
                      แจ้งประกาศสัมนาของทางห้องสมุด</font></td>
                  </tr>
                  <tr> 
                    <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                      <input type="checkbox" name="news_type4" value="4" <% if (email_way.charAt(3)=='1') out.print("checked");%>>
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
                                                                        <input type="submit" name="Submit" value=" บันทึก ">
                                                                </div></td>
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
