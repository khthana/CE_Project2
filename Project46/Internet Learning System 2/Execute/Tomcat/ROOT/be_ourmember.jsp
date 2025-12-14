<%@ page contentType="text/html; charset=windows-874" %>
<html>
<head>
<title>signup</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<STYLE type=text/css>A:link {
	FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #ffffff; TEXT-DECORATION: none
}
A:visited {
	FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #ffffff; TEXT-DECORATION: none
}
A:active {
	FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #ffffff; TEXT-DECORATION: none
}
A:hover {
	FONT-WEIGHT: normal; FONT-SIZE: 10px; COLOR: #c1d6ea; TEXT-DECORATION: none
}
TD {
	FONT-WEIGHT: normal; FONT-SIZE: 10px; TEXT-DECORATION: none
}
</style>
</head>
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0"  border="0">
<!--     <tr> 
      <td height="73" colspan="3">&nbsp;</td>
    </tr>
	<tr>
		<td height="30" align="right" bgcolor="#00CC00"><A 
		 href="main.jsp"> หน้าหลัก </A> |<A 
		 href="be_ourmember.jsp"> สมัครสมาชิก </A>| <A 
		href="course.jsp"> หลักสูตร </A>| <A 
		href="boardlist.jsp"> เว็บบอร์ด </A>| <A 
		href="whoarewe.jsp"> Who are we ? </A> |<A 
		href="contactus.jsp" > Contact us </A>| <A 
		href="boardlist.jsp" > Help </A></td>
	</tr>
-->	<form action="checkerror.jsp" method="post" >
		<table width="700"   border="1" cellpadding="0" cellspacing="0"  >
		<tr class="black"> 
        <table  border="0" cellpadding="0" cellspacing="0" align="center">
          <tr> 
            <td width="593" height="800" valign="top"> <table width="591" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="591" bgcolor="#00CC00"><font color="#FFFFFF" size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>แบบฟอร์มสมัครสมาชิก</strong></font></td>
                </tr>
                <tr> 
                  <td width="591" >&nbsp;</td>
                </tr>
              </table>
              <table width="593" border="0" >
                <tr> 
                  <td width="188" bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*คำนำหน้า</strong></font></td>
                  <td width="96" ><input type="radio" name="title" value="Mr." checked >
                    <font size="2">นาย</font> </td>
                  <td width="95" ><input type="radio" name="title" value="Mrs.">
                    <font size="2">นาง</font> </td>
                  <td width="196" ><input type="radio" name="title" value="Miss" >
                    <font size="2">นางสาว</font></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ชื่อ</font></strong></td>
                  <td colspan="3"><input type="text" name="name" size="20" ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*นามสกุล</font></strong></td>
                  <td colspan="3"><input name="surname" type="text"  size="20"></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ชื่อ(ภาษาอังกฤษ)</font></strong></td>
                  <td colspan="3"><input type="text" name="nameeng" size="20" ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*นามสกุล(ภาษาอังกฤษ)</font></strong></td>
                  <td colspan="3"><input name="surnameeng" type="text"  size="20" >
                  </td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*วันเดือนปีเกิด</font></strong></td>
                  <td colspan="3"><input type="text" name="birthday" size="20">&nbsp;(e.g. 12/04/2524)</td>
                </tr>
				<tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*อายุ</font></strong></td>
                  <td colspan="3"><input type="text" name="age" size="20"></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ส่วนสูง</font></strong></td>
                  <td colspan="3"><input type="text" name="height" size="20"></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*น้ำหนัก</font></strong></td>
                  <td colspan="3"><input type="text" name="weight" size="20"></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ที่อยู่ที่สามารถติดต่อได้</font></strong></td>
                  <td colspan="3"><input type="text" name="houseid" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ถนน</font></strong></td>
                  <td colspan="3"><input type="text" name="road" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ตำบล/แขวง</font></strong></td>
                  <td colspan="3"><input type="text" name="town" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*อำเภอ/เขต</font></strong></td>
                  <td colspan="3"><input type="text" name="city" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*จังหวัด</strong></font></td>
                  <td colspan="3"><input type="text" name="province" size=20></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*รหัสไปรษณีย์</strong></font></td>
                  <td colspan="3"><input type="text" name="postalcode" size=10></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*โทรศัพท์บ้าน</strong></font></td>
                  <td colspan="3"><input type="text" name="homenumber" size=15 ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*โทรศัพท์มือถือ</strong></font></td>
                  <td colspan="3"><input type="text" name="mobilenumber" size=15></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999"><font color="#FFFFFF" size="2"><strong>*อีเมล์</strong></font></td>
                  <td colspan="3"><input type="text" name="email" size=20></td>
                </tr>
              </table>
              <br> <table width="100%" border="0">
                <tr> 
                  <td width="92%"  bgcolor="#00cc00"><font color="#FFFFFF" size="2"><strong>ประวัติการศึกษา</strong></font></td>
                </tr>
              </table>
              <table width="100%" border="0">
                <tr> 
                  <td  bgcolor="#FF9900" align="center"><div align="left"><font color="#FFFFFF" size="2"><strong>การศึกษา</strong></font></div></td>
                </tr>
              </table>
              <table width="100%" border="0">
                <tr> 
                  <td   align="left" bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*ระดับ</font></strong></td>
                  <td colspan="3"> <input name="level1" type="text"  ></td>
                  <td colspan="3"><input name="level2" type="text" ></td>
                </tr>
                <tr> 
                  <td bgcolor="#999999" align="left"><strong><font color="#FFFFFF" size="2">*วุฒิการศึกษา</font></strong></td>
                  <td colspan="3"> <input name="degree1" type="text"></td>
                  <td colspan="3"><input name="degree2" type="text" ></td>
                </tr>
   <!--             <tr> 
                  <td bgcolor="#FF9900" align="left"><strong><font color="#000000" size="2">จาก</font></strong></td>
                  <td bgcolor="#ffff99"  ><select name="fromdate1" size="1">
                      <option selected>วัน</option>
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
                    </select></td>
                  <td bgcolor="#ffff99" ><select name="frommonth1" size="1">
                      <option selected>เดือน</option>
                      <option value="มกราคม">มกราคม</option>
                      <option value="กุมภาพันธ์">กุมภาพันธ์</option>
					  <option value="มีนาคม">มีนาคม</option>
                      <option value="เมษายน">เมษายน</option>
                      <option value="พฤษภาคม">พฤษภาคม</option>
                      <option value="มิถุนายน">มิถุนายน</option>
                      <option value="กรกฏาคม">กรกฏาคม</option>
                      <option value="สิงหาคม">สิงหาคม</option>
                      <option value="กันยายน">กันยายน</option>
                      <option value="ตุลาคม">ตุลาคม</option>
                      <option value="พฤศจิกายน">พฤศจิกายน</option>
                      <option value="ธันวาคม">ธันวาคม</option>
                    </select></td>
                  <td bgcolor="#ffff99" ><select name="fromyear1" size="1">
                      <option selected>ปี</option>
                      <option value="2556">2556</option>
                      <option value="2555">2555</option>
                      <option value="2554">2554</option>
                      <option value="2553">2553</option>
                      <option value="2552">2552</option>
                      <option value="2551">2551</option>
                      <option value="2550">2550</option>
                      <option value="2549">2549</option>
                      <option value="2548">2548</option>
                      <option value="2547">2547</option>
                      <option value="2546">2546</option>
                      <option value="2545">2545</option>
                      <option value="2544">2544</option>
                      <option value="2543">2543</option>
                      <option value="2542">2542</option>
                      <option value="2541">2541</option>
                      <option value="2540">2540</option>
                      <option value="2539">2539</option>
                      <option value="2538">2538</option>
                      <option value="2537">2537</option>
                      <option value="2536">2536</option>
                      <option value="2535">2535</option>
                      <option value="2534">2534</option>
                      <option value="2533">2533</option>
                      <option value="2532">2532</option>
                      <option value="2531">2531</option>
                      <option value="2530">2530</option>
                      <option value="2529">2529</option>
                      <option value="2528">2528</option>
                      <option value="2527">2527</option>
                      <option value="2526">2526</option>
                      <option value="2525">2525</option>
                      <option value="2524">2524</option>
                      <option value="2523">2523</option>
                      <option value="2522">2522</option>
                      <option value="2521">2521</option>
                      <option value="2520">2520</option>
                    </select></td>
                  <td bgcolor="#ffff99" ><select name="fromdate2" size="1">
                      <option selected>วัน</option>
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
                    </select></td>
                  <td   bgcolor="#FFFF99"><select name="frommonth2" size="1">
                      <option selected>เดือน</option>
                      <option value="มกราคม">มกราคม</option>
                      <option value="กุมภาพันธ์">กุมภาพันธ์</option>
					  <option value="มีนาคม">มีนาคม</option>
                      <option value="เมษายน">เมษายน</option>
                      <option value="พฤษภาคม">พฤษภาคม</option>
                      <option value="มิถุนายน">มิถุนายน</option>
                      <option value="กรกฏาคม">กรกฏาคม</option>
                      <option value="สิงหาคม">สิงหาคม</option>
                      <option value="กันยายน">กันยายน</option>
                      <option value="ตุลาคม">ตุลาคม</option>
                      <option value="พฤศจิกายน">พฤศจิกายน</option>
                      <option value="ธันวาคม">ธันวาคม</option>
                    </select></td>
                  <td   bgcolor="#FFFF99"><select name="fromyear2" size="1">
                      <option selected>ปี</option>
                      <option value="2556">2556</option>
                      <option value="2555">2555</option>
                      <option value="2554">2554</option>
                      <option value="2553">2553</option>
                      <option value="2552">2552</option>
                      <option value="2551">2551</option>
                      <option value="2550">2550</option>
                      <option value="2549">2549</option>
                      <option value="2548">2548</option>
                      <option value="2547">2547</option>
                      <option value="2546">2546</option>
                      <option value="2545">2545</option>
                      <option value="2544">2544</option>
                      <option value="2543">2543</option>
                      <option value="2542">2542</option>
                      <option value="2541">2541</option>
                      <option value="2540">2540</option>
                      <option value="2539">2539</option>
                      <option value="2538">2538</option>
                      <option value="2537">2537</option>
                      <option value="2536">2536</option>
                      <option value="2535">2535</option>
                      <option value="2534">2534</option>
                      <option value="2533">2533</option>
                      <option value="2532">2532</option>
                      <option value="2531">2531</option>
                      <option value="2530">2530</option>
                      <option value="2529">2529</option>
                      <option value="2528">2528</option>
                      <option value="2527">2527</option>
                      <option value="2526">2526</option>
                      <option value="2525">2525</option>
                      <option value="2524">2524</option>
                      <option value="2523">2523</option>
                      <option value="2522">2522</option>
                      <option value="2521">2521</option>
                      <option value="2520">2520</option>
                    </select></td>
                </tr>
                <tr> 
                  <td bgcolor="#FF9900" align="left"><strong><font color="#000000" size="2">ถึง</font></strong></td>
                  <td bgcolor="#ffff99" ><select name="todate1" size="1">
                      <option selected>วัน</option>
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
                    </select></td>
                  <td bgcolor="#FFFF99"  ><select name="tomonth1" size="1">
                     <option selected>เดือน</option>
                      <option value="มกราคม">มกราคม</option>
                      <option value="กุมภาพันธ์">กุมภาพันธ์</option>
					  <option value="มีนาคม">มีนาคม</option>
                      <option value="เมษายน">เมษายน</option>
                      <option value="พฤษภาคม">พฤษภาคม</option>
                      <option value="มิถุนายน">มิถุนายน</option>
                      <option value="กรกฏาคม">กรกฏาคม</option>
                      <option value="สิงหาคม">สิงหาคม</option>
                      <option value="กันยายน">กันยายน</option>
                      <option value="ตุลาคม">ตุลาคม</option>
                      <option value="พฤศจิกายน">พฤศจิกายน</option>
                      <option value="ธันวาคม">ธันวาคม</option>
                    </select></td>
                  <td bgcolor="#ffff99" ><select name="toyear1" size="1">
                      <option selected>ปี</option>
                      <option value="2556">2556</option>
                      <option value="2555">2555</option>
                      <option value="2554">2554</option>
                      <option value="2553">2553</option>
                      <option value="2552">2552</option>
                      <option value="2551">2551</option>
                      <option value="2550">2550</option>
                      <option value="2549">2549</option>
                      <option value="2548">2548</option>
                      <option value="2547">2547</option>
                      <option value="2546">2546</option>
                      <option value="2545">2545</option>
                      <option value="2544">2544</option>
                      <option value="2543">2543</option>
                      <option value="2542">2542</option>
                      <option value="2541">2541</option>
                      <option value="2540">2540</option>
                      <option value="2539">2539</option>
                      <option value="2538">2538</option>
                      <option value="2537">2537</option>
                      <option value="2536">2536</option>
                      <option value="2535">2535</option>
                      <option value="2534">2534</option>
                      <option value="2533">2533</option>
                      <option value="2532">2532</option>
                      <option value="2531">2531</option>
                      <option value="2530">2530</option>
                      <option value="2529">2529</option>
                      <option value="2528">2528</option>
                      <option value="2527">2527</option>
                      <option value="2526">2526</option>
                      <option value="2525">2525</option>
                      <option value="2524">2524</option>
                      <option value="2523">2523</option>
                      <option value="2522">2522</option>
                      <option value="2521">2521</option>
                      <option value="2520">2520</option>
                    </select></td>
                  <td bgcolor="#ffff99"><select name="todate2" size="1">
                      <option selected>วัน</option>
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
                    </select></td>
                  <td bgcolor="#FFFF99"><select name="tomonth2" size="1">
                    <option selected>เดือน</option>
                      <option value="มกราคม">มกราคม</option>
                      <option value="กุมภาพันธ์">กุมภาพันธ์</option>
					  <option value="มีนาคม">มีนาคม</option>
                      <option value="เมษายน">เมษายน</option>
                      <option value="พฤษภาคม">พฤษภาคม</option>
                      <option value="มิถุนายน">มิถุนายน</option>
                      <option value="กรกฏาคม">กรกฏาคม</option>
                      <option value="สิงหาคม">สิงหาคม</option>
                      <option value="กันยายน">กันยายน</option>
                      <option value="ตุลาคม">ตุลาคม</option>
                      <option value="พฤศจิกายน">พฤศจิกายน</option>
                      <option value="ธันวาคม">ธันวาคม</option>
                    </select></td>
                  <td bgcolor="#FFFF99"><select name="toyear2" size="1">
                      <option selected>ปี</option>
                      <option value="2556">2556</option>
                      <option value="2555">2555</option>
                      <option value="2554">2554</option>
                      <option value="2553">2553</option>
                      <option value="2552">2552</option>
                      <option value="2551">2551</option>
                      <option value="2550">2550</option>
                      <option value="2549">2549</option>
                      <option value="2548">2548</option>
                      <option value="2547">2547</option>
                      <option value="2546">2546</option>
                      <option value="2545">2545</option>
                      <option value="2544">2544</option>
                      <option value="2543">2543</option>
                      <option value="2542">2542</option>
                      <option value="2541">2541</option>
                      <option value="2540">2540</option>
                      <option value="2539">2539</option>
                      <option value="2538">2538</option>
                      <option value="2537">2537</option>
                      <option value="2536">2536</option>
                      <option value="2535">2535</option>
                      <option value="2534">2534</option>
                      <option value="2533">2533</option>
                      <option value="2532">2532</option>
                      <option value="2531">2531</option>
                      <option value="2530">2530</option>
                      <option value="2529">2529</option>
                      <option value="2528">2528</option>
                      <option value="2527">2527</option>
                      <option value="2526">2526</option>
                      <option value="2525">2525</option>
                      <option value="2524">2524</option>
                      <option value="2523">2523</option>
                      <option value="2522">2522</option>
                      <option value="2521">2521</option>
                      <option value="2520">2520</option>
                    </select></td>
                </tr>-->
              </table>
              <table width="100%" border="0">
                <tr> 
                  <td width="19%" align="left" bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*สถาบัน</font></strong></td>
                  <td width="41%" > <input name="institute1" type="text"></td>
                  <td width="40%" ><input name="institute2" type="text"></td>
                </tr>
                <tr> 
                  <td width="19%" align="left" bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*สาขา</font></strong></td>
                  <td width="41%" > <input name="major1" type="text"></td>
                  <td width="40%" ><input name="major2" type="text"></td>
                </tr>
                <tr> 
                  <td width="19%" align="left" bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*เกรด</font></strong></td>
                  <td width="41%" > <input name="grade1" type="text"></td>
                  <td width="40%" ><input name="grade2" type="text"></td>
                </tr>
              </table>
              <br> <table width="100%" border="0">
                <tr> 
                  <td bgcolor="#00cc00"><font color="#FFFFFF" size="2"><strong>การล็อกอินเข้าระบบ</strong></font></td>
                </tr>
              </table>
             <table width="593" border="0" >
			 <tr>
			 		<td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*Username</font></strong></td>
                  <td colspan="3"><input type="text" name="username" size="20" ></td>
			 </tr>
			 <tr>
			 		<td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*Password</font></strong></td>
                  <td colspan="3"><input  type="password" name="password" size="20" ></td>
			 </tr>
			 <tr>
			 		<td bgcolor="#999999"><strong><font color="#FFFFFF" size="2">*Confirm password</font></strong></td>
                  <td colspan="3"><input  type="password" name="cpassword" size="20" ></td>
			 </tr>
			</table>
			<table width="100%" border="0">
                <tr> 
                  <td><div align="right"> 
                      <input type="submit" name="submit" value="submit">
                    </div></td>
                  <td><div align="left"> 
                      <input type="reset" name="reset" value="reset">
                    </div></td>
                </tr>
              </table></td>
          </tr>
        </table></td>
      <td align="left" valign="top" class="black">&nbsp; </td>
    </tr>
    <tr bgcolor="#000000" class="black"> 
      <td width="149" height="25" valign="top"></td>
      <td width="1" class="black"></td>
      <td width="513" class="black"></td>
      <td width="153" class="black"></td>
    </tr>
  </table>
</form>
</table>
</body>
</html>
