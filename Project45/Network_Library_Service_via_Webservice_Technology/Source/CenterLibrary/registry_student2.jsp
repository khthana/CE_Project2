<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="com.ora.jsp.util.*" %>
<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>


<% 
String username=new String(request.getParameter("username").getBytes("iso-8859-1"), "tis-620");
String password = new String(request.getParameter("password").getBytes("iso-8859-1"),"tis-620");
String name = new String(request.getParameter("name").getBytes("iso-8859-1"),"tis-620");
String last_name = new String(request.getParameter("last_name").getBytes("iso-8859-1"),"tis-620");
String sex = new String(request.getParameter("sex").getBytes("iso-8859-1"),"tis-620");
String sex1 = new String(); 
	if(sex.equals("male"))sex1="ชาย";
	else{sex1="หญิง";}
String library = new String(request.getParameter("library").getBytes("iso-8859-1"),"tis-620");
String id = new String(request.getParameter("id").getBytes("iso-8859-1"),"tis-620");
String day = new String(request.getParameter("day").getBytes("iso-8859-1"),"tis-620");
String month = new String(request.getParameter("mouth").getBytes("iso-8859-1"),"tis-620");
String year = new String(request.getParameter("year").getBytes("iso-8859-1"),"tis-620");
String status = new String(request.getParameter("status").getBytes("iso-8859-1"),"tis-620");
String work_adress = new String(request.getParameter("work_add1").getBytes("iso-8859-1"),"tis-620");
//String work_add2 = new String(request.getParameter("work_add2").getBytes("iso-8859-1"),"tis-620");
//String work_adress = work_add1+" "+work_add2; 																											
String home_num = new String(request.getParameter("home_num").getBytes("iso-8859-1"),"tis-620");
String address = new String(request.getParameter("address").getBytes("iso-8859-1"),"tis-620");																																		
String village = new String(request.getParameter("village").getBytes("iso-8859-1"),"tis-620");
String moo = new String(request.getParameter("moo").getBytes("iso-8859-1"),"tis-620");
String lane = new String(request.getParameter("lane").getBytes("iso-8859-1"),"tis-620");													
String road = new String(request.getParameter("road").getBytes("iso-8859-1"),"tis-620");
String district = new String(request.getParameter("district").getBytes("iso-8859-1"),"tis-620");
String amphur = new String(request.getParameter("amphur").getBytes("iso-8859-1"),"tis-620");
String province = new String(request.getParameter("province").getBytes("iso-8859-1"),"tis-620");
String zip_code = new String(request.getParameter("zip_code").getBytes("iso-8859-1"),"tis-620");
String phone1 = new String(request.getParameter("phone1").getBytes("iso-8859-1"),"tis-620");										
String email = new String(request.getParameter("email").getBytes("iso-8859-1"),"tis-620");
String news_type1 = "0";
String news_type2 = "0";
String news_type3 = "0";
String news_type4 = "0"; 
System.out.println("this is news_type");
//if (request.getParameter("news_type1")!= null)news_type1 = "1"; 
if (request.getParameter("news_type2")!= null)news_type2 = "1";
if (request.getParameter("news_type3")!= null)news_type3 = "1";
if (request.getParameter("news_type4")!= null)news_type4 = "1";
		
System.out.println("---------------------");
String text1 ="- แจ้งสื่อสารนิเทศใหม่";
String text2 ="- แจ้งกำหนดฉายภาพยนตื";
String text3 ="- แจ้งกำหนดการสัมนาของห้องสมุด";
String text4 ="- ประกาศทั่วไป";
//catagory//
String category_a = "0";
String category_b = "0";
String category_c = "0";
String category_d = "0"; 
String category_e = "0";
String category_g = "0";
String category_h = "0";
String category_j = "0"; 
String category_k = "0";
String category_l = "0";
String category_m = "0";
String category_n = "0"; 
String category_p = "0";
String category_q = "0";
String category_r = "0";
String category_s = "0";
String category_t = "0"; 
String category_u = "0";
String category_v = "0";
String category_z = "0";
String category = ""; 
System.out.println("this is category");

if (request.getParameter("category_a")!= null){category_a = "a"; 	category = category +category_a ;	news_type1 = "1";}	
if (request.getParameter("category_b")!= null){category_b = "b";	category = category +category_b ; 	news_type1 = "1";}
if (request.getParameter("category_c")!= null){category_c = "c";	category = category +category_c ;	news_type1 = "1";}
if (request.getParameter("category_d")!= null){category_d = "d";	category = category +category_d ; 	news_type1 = "1";}
if (request.getParameter("category_e")!= null){category_e = "e"; 	category = category +category_e ;	news_type1 = "1";}
if (request.getParameter("category_g")!= null){category_e = "g";	category = category +category_e ;	news_type1 = "1";}
if (request.getParameter("category_h")!= null){category_h = "h";	category = category +category_a ;	news_type1 = "1";}
if (request.getParameter("category_j")!= null){category_j = "j";		category = category +category_j ;	news_type1 = "1";}
if (request.getParameter("category_k")!= null){category_k = "k"; 	category = category +category_k ;	news_type1 = "1";}
if (request.getParameter("category_l")!= null){category_l = "l";		category = category +category_l ;	news_type1 = "1";}
if (request.getParameter("category_m")!= null){category_m = "m";	category = category +category_m ;	news_type1 = "1";}
if (request.getParameter("category_n")!= null){category_n = "n";	category = category +category_n ;	news_type1 = "1";}
if (request.getParameter("category_p")!= null){category_p = "p";	category = category +category_p;	news_type1 = "1";}
if (request.getParameter("category_q")!= null){category_q = "q"; 	category = category +category_q ;	news_type1 = "1";}
if (request.getParameter("category_r")!= null){category_r = "r";	category = category +category_r ;	news_type1 = "1";}
if (request.getParameter("category_s")!= null){category_s = "s";	category = category +category_s ;	news_type1 = "1";}
if (request.getParameter("category_t")!= null){category_t = "t";		category = category +category_t ;	news_type1 = "1";}
if (request.getParameter("category_u")!= null){category_u= "u"; 	category = category +category_u ;	news_type1 = "1";}
if (request.getParameter("category_v")!= null){category_v = "v";	category = category +category_v ;	news_type1 = "1";}
if (request.getParameter("category_z")!= null){category_z = "z";	category = category +category_z ;	news_type1 = "1";}
String email_way = news_type1+news_type2+news_type3+news_type4;  	System.out.println(email_way);
System.out.println(category);
%>										
										


<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-874">
</head>

<body background="registry.gif">
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
          <td colspan="2"> </td>
        </tr>
        <tr>
          <td colspan="2"><font color="#CC0000" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>โปรดตรวจสอบข้อมูลของท่านอีกครั้ง 
            แล้วกดปุ่ม Next &gt;&gt;</strong></font></td>
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
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">รหัสประจำตัวนักศึกษา 
            <input name="textfield" type="text" disabled value="<%=id %>" size="15" maxlength="15">
            บัตรนักศึกษาหมดอายุวันที่ 
            <input name="day" type="text" id="day2" size="2" maxlength="2" disabled value="<%=day %>">
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
            <input type="text" name="work_add1" disabled value="<%=work_adress %>">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ที่อยู่ตามสำเนาทะเบียนบ้าน 
            </font></td>
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
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> อำเภอ/เขต 
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
            <input name="email" type="text"disabled id="email" value="<%=email %>" size="25" maxlength="30">
            </font></td>
        </tr>
        <tr> 
          <td colspan="2"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"><strong>บริการแจ้งข่าวสารที่ต้องการ</strong></font></td>
        </tr>
        <tr> 
          <td colspan="2"><table width="100%" border="1" cellpadding="4" cellspacing="0" frame="below">
              <tr bgcolor="#3399CC"> 
                <td width="7%" height="27">&nbsp;</td>
                <td><div align="center"><font color="#FFFFFF" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">ข่าวสาร</font></div>
                  <div align="center"></div></td>
                <td width="7%">&nbsp;</td>
              </tr>
              <tr> 
                <td rowspan="2">&nbsp;</td>
                <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                  <%if (news_type1.equals("1"))out.println(text1+"<br>");%>
                  </font> <jsp:useBean id="errorMessages" scope="request" class="java.util.Vector"/> 
                  <%
	    if(errorMessages.size()>0){
	%>
                  <ul>
                    <font color="#336666" size="" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    <j3pJSP:loop name="errorMessages" loopId="msg" className="String" > 
                    <li> <%= msg %></li>
                    </j3pJSP:loop> </font> 
                  </ul>
                  <% ;}
	%>
                </td>
                <td rowspan="2">&nbsp;</td>
              </tr>
              <tr> 
                <td><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                  <%if (news_type2.equals("1"))out.println(text2+"<br>");%>
                  <%if (news_type3.equals("1"))out.println(text3+"<br>");%>
                  <%if (news_type4.equals("1"))out.println(text4+"<br>");%>
                  </font> </td>
              </tr>
              <tr bgcolor="#3399CC"> 
                <td>&nbsp;</td>
                <td bgcolor="">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td width="50%"><div align="center"> </div></td>
          <td width="50%"> <form name="form1" method="post" action="registry_student3.jsp">
              <div align="center"> 
                <input type="submit" name="Submit" value="  next &gt;&gt; ">
                <input name="username" type="hidden" value="<%=username %>">
                <input name="password" type="hidden" value="<%=password %>">
                <input name="name" type="hidden" value="<%=name %>">
                <input name="last_name" type="hidden" value="<%=last_name %>">
                <input name="sex" type="hidden" value="<%=sex %>">
                <input name="library" type="hidden" value="<%=library %>">
                <input name="id" type="hidden" value="<%=id %>">
                <input name="day" type="hidden" value="<%=day %>">
                <input name="month" type="hidden" value="<%=month %>">
                <input name="year" type="hidden" value="<%=year %>">
                <input name="status" type="hidden" value="<%=status %>">
                <input name="work_adress" type="hidden" value="<%=work_adress %>">
                <input name="home_num" type="hidden" value="<%=home_num %>">
                <input name="address" type="hidden" value="<%=address %>">
                <input name="village" type="hidden" value="<%=village %>">
                <input name="moo" type="hidden" value="<%=moo %>">
                <input name="lane" type="hidden" value="<%=lane %>">
                <input name="road" type="hidden" value="<%=road %>">
                <input name="district" type="hidden" value="<%=district %>">
                <input name="amphur" type="hidden" value="<%=amphur %>">
                <input name="province" type="hidden" value="<%=province %>">
                <input name="zip_code" type="hidden" value="<%=zip_code %>">
                <input name="phone1" type="hidden" value="<%=phone1 %>">
                <input name="email" type="hidden" value="<%=email %>">
		<input name="email_way" type="hidden" value="<%=email_way %>">
		<input name="category" type="hidden" value="<%=category %>">
              </div>
            </form></td>
        </tr>
      </table></td>
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
