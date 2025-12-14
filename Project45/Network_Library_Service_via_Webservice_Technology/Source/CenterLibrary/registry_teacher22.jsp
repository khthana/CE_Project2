 <%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="com.ora.jsp.util.*" %>


<% System.out.println("step ///////////////");
String username=new String(request.getParameter("username").getBytes("iso-8859-1"), "tis-620");
String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"utf-8");
String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"utf-8");
String last_name = new String(request.getParameter("last_name").getBytes("iso-8859-1"),"utf-8");
String sex = new String(request.getParameter("sex").getBytes("iso-8859-1"),"utf-8");
String sex1 = new String(); 
	if(sex.equals("male"))sex1="ชาย";
	else{sex1="หญิง";}
String library = new String(request.getParameter("library").getBytes("iso-8859-1"),"utf-8");	System.out.println("step /////1/////");
String id = new String(request.getParameter("id").getBytes("iso-8859-1"),"utf-8");
String day = new String(request.getParameter("day").getBytes("iso-8859-1"),"utf-8");
String month = new String(request.getParameter("mouth").getBytes("iso-8859-1"),"utf-8");		System.out.println("step /////1.2/////");
String year = new String(request.getParameter("year").getBytes("iso-8859-1"),"utf-8");
String status = new String(request.getParameter("status").getBytes("iso-8859-1"),"utf-8");
String work_add1 = new String(request.getParameter("workadd1").getBytes("iso-8859-1"),"utf-8");		
String work_add2 = new String(request.getParameter("workadd2").getBytes("iso-8859-1"),"utf-8");		
String work_adress = work_add1+" "+work_add2; 																											
String home_num = new String(request.getParameter("home_num").getBytes("iso-8859-1"),"utf-8");
String address = new String(request.getParameter("address").getBytes("iso-8859-1"),"utf-8");	System.out.println("step /////2/////");																																		
String village = new String(request.getParameter("village").getBytes("iso-8859-1"),"utf-8");
String moo = new String(request.getParameter("moo").getBytes("iso-8859-1"),"utf-8");
String lane = new String(request.getParameter("lane").getBytes("iso-8859-1"),"utf-8");													
String road = new String(request.getParameter("road").getBytes("iso-8859-1"),"utf-8");	System.out.println("step /////2.1/////");
String district = new String(request.getParameter("district").getBytes("iso-8859-1"),"utf-8");
String amphur = new String(request.getParameter("amphur").getBytes("iso-8859-1"),"utf-8");
String province = new String(request.getParameter("province").getBytes("iso-8859-1"),"utf-8");	System.out.println("step /////2.2/////");
String zip_code = new String(request.getParameter("zip_code").getBytes("iso-8859-1"),"utf-8");
String phone1 = new String(request.getParameter("phone1").getBytes("iso-8859-1"),"utf-8");
String phone2 = new String(request.getParameter("phone2").getBytes("iso-8859-1"),"utf-8");										
String email = new String(request.getParameter("email").getBytes("iso-8859-1"),"utf-8");	System.out.println("step /////3/////");
String news_type1= request.getParameter("news_type1");
String news_type2= request.getParameter("news_type2");
String news_type3= request.getParameter("news_type3");
String news_type4= request.getParameter("news_type4");
//String news_type3= request.getParameter("news_type3");
//String news_type4= request.getParameter("news_type4");
//String category = new String(request.getParameter("category"));
%>										


<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
</head>

<body>
<table width="100%" border="0">
  <tr> 
    <td width="16%"><strong>สมัครสมาชิก</strong></td>
    <td width="34%"><font color="#9966CC" size="-2"><strong>step 3</strong></font></td>
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
    <td colspan="2" rowspan="2"> 
        <table width="100%" border="0" cellspacing="7"  background="fill_whi_M2.gif">
        <tr> 
          <td colspan="2"><font color="#CC0000" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>โปรดตรวจสอบข้อมูลของท่านอีกครั้ง 
            แล้วกดปุ่ม Next </strong></font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">Username 
            <input name="username" type="text" id="username2" disabled value="<%=username %>">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">Password 
            <input name="password" type="password" id="password3" disabled value="<%=password %>">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><hr> </td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ชื่อ 
            <input name="name" type="text" id="name2" disabled value="<%=name %>">
            นามสกุล 
            <input name="last_name" type="text" id="last_name2"  disabled value="<%=last_name %>">
            เพศ 
            <input name="sex" type="text" disabled value="<%=sex1%>" size="5">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">มีความประสงค์จะขึ้นทะเบียนเป็นสมาชิกห้องสมุด 
            <input type="text" name="library" disabled value="<%=library %>">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หมายเลขบัตรข้าราชการ 
            <input name="textfield" type="text" disabled value="<%=id %>" size="15" maxlength="15">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> บัตรข้าราชการหมดอายุวันที่ 
            <input name="day" type="text" id="day2" size="2" maxlength="2" disabled value="<%=day %>">
            เดือน 
            <input name="month" type="text" id="month" size="10" maxlength="15" disabled value="<%=month %>">
            ปี 
            <input name="year" type="text" id="year2" size="5" maxlength="4"disabled value="<%=year %>">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">สถานภาพ 
            <input name="status" type="text" size="15" maxlength="20" disabled value="<%=status %>">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font  face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>สถานที่ทำงาน</strong></font></td>
        </tr>
        <tr> 
          <td colspan="2"><font  face="AngsanaUPC, BrowalliaUPC, CordiaUPC">สังกัด 
            คณะ/สำนัก/กอง 
            <input type="text" name="work_add1" disabled value="<%=work_add1 %>">
            </font> <font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> ภาควิชา/ฝ่าย 
            </font> <font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
            <input type="text" name="work_add2" disabled value="<%=work_add2 %>">
            </font> </td>
        </tr>
        <tr> 
          <td colspan="2"><font  face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โทรศัพท์ที่ทำงาน 
            <input name="phone12" type="text" id="phone12" size="12" maxlength="12"disabled value="<%=phone2 %>">
            ต่อ 
            <input name="phone3" type="text" size="5" maxlength="5">
            </font><font size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โทรสาร 
            <input name="phone4" type="text" size="12" maxlength="12">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>ที่อยู่ตามสำเนาทะเบียนบ้าน</strong></font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">บ้านเลขที่ 
            <input name="home_num" type="text" size="7" maxlength="7" disabled value="<%=home_num %>">
            <!-- ******************************************************** -->
            <%=address+" "%> 
            <input name="address" type="text" size="20" maxlength="20" disabled value="<%=village %>">
            <%="    "%> 
            <!-- ******************************************************** -->
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
            <input name="province" type="text"  size="15" maxlength="15" disabled value="<%=province %>">
            รหัสไปรษณี 
            <input name="zip_code" type="text"disabled id="zip_code2" value="<%=zip_code %>" size="10" maxlength="10">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">โทรศัพท์ 
            <input name="phone1" type="text" id="phone13" size="12" maxlength="12"disabled value="<%=phone1 %>">
            ที่อยู่ e-mail 
            <input name="email" type="text"disabled id="email2" value="<%=email %>" size="25" maxlength="30">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>บริการแจ้งข่าวสารที่ต้องการ</strong></font></td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="1">
              <tr> 
                <td width="12%">&nbsp;</td>
                <td colspan="2"> 
                  <%	//String news1="แจ้งสื่อสารนิเทศใหม่";
			//String news1="แจ้งประกาศรการฉายภาพยนต์";
			//String news1="แจ้งประกาศสัมนาของทางห้องสมุด";
			//String news1="ประกาศทั่วไป";
		%>
                  <% 	if (news_type1.equals("1")) out.println("-  แจ้งสื่อสารนิเทศใหม่"+"\n");		
			%>
                  <% 	if (news_type2.equals("1")) out.println("-  แจ้งประกาศรการฉายภาพยนต์"+"\n");		
			%>
                  <% 	if (news_type3.equals("1")) out.println("-  แจ้งประกาศสัมนาของทางห้องสมุด"+"\n");		
			%>
                  <% 	if (news_type4.equals("1")) out.println("-  ประกาศทั่วไป"+"\n"); 		
			%>
                </td>
                <td width="12%">&nbsp;</td>
              </tr>
              <tr> 
                <td>&nbsp;</td>
                <td width="38%">&nbsp;</td>
                <td width="38%">&nbsp;</td>
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
        <tr> 
          <td width="50%"><div align="center"> </div></td>
          <td width="50%"><form name="form1" method="post" action="registry_teacher3.jsp">
              <div align="center">
                <input type="submit" name="Submit2" value="  next &gt;&gt; ">
                <input name="username2" type="hidden" value="<%=username %>">
                <input name="password2" type="hidden" value="<%=password %>">
                <input name="name2" type="hidden" value="<%=name %>">
                <input name="last_name2" type="hidden" value="<%=last_name %>">
                <input name="sex2" type="hidden" value="<%=sex %>">
                <input name="library2" type="hidden" value="<%=library %>">
                <input name="id" type="hidden" value="<%=id %>">
                <input name="day2" type="hidden" value="<%=day %>">
                <input name="month2" type="hidden" value="<%=month %>">
                <input name="year2" type="hidden" value="<%=year %>">
                <input name="status2" type="hidden" value="<%=status %>">
                <input name="work_adress" type="hidden" value="<%=work_adress %>">
                <input name="home_num2" type="hidden" value="<%=home_num %>">
                <input name="address2" type="hidden" value="<%=address %>">
                <input name="village" type="hidden" value="<%=village %>">
                <input name="moo2" type="hidden" value="<%=moo %>">
                <input name="lane2" type="hidden" value="<%=lane %>">
                <input name="road2" type="hidden" value="<%=road %>">
                <input name="district2" type="hidden" value="<%=district %>">
                <input name="amphur2" type="hidden" value="<%=amphur %>">
                <input name="province2" type="hidden" value="<%=province %>">
                <input name="zip_code2" type="hidden" value="<%=zip_code %>">
                <input name="phone13" type="hidden" value="<%=phone1 %>">
		<input name="phone14" type="hidden" value="<%=phone2 %>">
                <input name="email2" type="hidden" value="<%=email %>">
		
              </div>
            </form></td>
        </tr>
      </table>
      </td>
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
