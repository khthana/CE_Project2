<?php include("Javascript/signup_check.htm"); ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Member registration</title>
<style type="text/css">
<!--
body {
	background-image: url();
	margin-left: 0px;
	margin-top: 10px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style6 {color: #FF0000}
.style8 {font-size: 24px}
-->
</style>

<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>
<body>
<?php 
	if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="Submit"))
	{	
	 	require_once('Connections/conn.php');
		$birthday="$day/$month/$year";
		mysql_select_db($database_conn,$conn);
		//add to users table
		$query ="INSERT INTO users (username,password,status) VALUES ('$username','$password','$status')";
		$result = mysql_query($query,$conn) or die(mysql_error());
		//find user_ID
		$query ="select * from users order by user_ID desc";
		$user_ID=mysql_query($query,$conn) or die(mysql_error());
		$row_rsUser_ID=mysql_fetch_assoc($user_ID);
		$user_ID=$row_rsUser_ID['user_ID'];
		//add to table student
		$query ="INSERT INTO student (user_ID,name,surname,gender,birthday,address,telnum,email,
		workplace,occupation) VALUES ('$user_ID','$name','$surname','$gender','$birthday',
		'$address','$telnum','$email','$workplace','$occupation')";
		$result = mysql_query($query,$conn) or die(mysql_error());
		echo"<script>alert('การสมัครเรียนเสร็จเรียบร้อยค่ะ')</script>";
		echo"<meta http-equiv='refresh' content='0;URL=index.php'>";
		}
		?>
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
  <td><img src="Images/Member_registration.gif" width="510" height="72"></td>
    <td >&nbsp;</td>
  </tr>
  <tr>
    <td  colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="30"><p class="style8">&nbsp;</p>
    </td>
    <td width="631"><form action="signup.php" method="post" name="form1" onSubmit="return Check();">
      <table width="511" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" bgcolor="#FFFFFF">
        <tr>
          <td bgcolor="#66CCFF">&#3594;&#3639;&#3656;&#3629;</td>
          <td><input name="name" type="text" id="name" maxlength="30"></td>
        </tr>
        <tr>
          <td width="138" bgcolor="#66CCFF">&#3609;&#3634;&#3617;&#3626;&#3585;&#3640;&#3621;</td>
          <td width="367"><input name="surname" type="text" id="surname" maxlength="30"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Username</td>
          <td><input name="username" type="text" id="username" maxlength="12" readonly="">
            <input name="ตรวจสอบ" type="button" id="ตรวจสอบ" onClick="MM_openBrWindow('username_check.php','check','status=yes,top=250,left=350,width=320,height=210')" value="ตรวจสอบ"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Password</td>
          <td><input name="password" type="password" id="password" maxlength="12">            
          <span class="style6"> *&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Confirm Password</td>
          <td><input name="confirm_password" type="password" id="confirm_password" maxlength="12">
            <span class="style6">*&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><p>&#3648;&#3614;&#3624;</p></td>
          <td>            
            <input name="gender" type="radio" id="male" value="male"> 
            <lable for ="male">ชาย</lable>
            <input name="gender" type="radio" value="female" id ="female">
            <label for="female">หญิง</label>
			</td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">&#3623;&#3633;&#3609;&#3648;&#3585;&#3636;&#3604;</td>
          <td><select name="day" id="day">
            <option selected>วัน</option>
            <option value="01">1</option>
            <option value="02">2</option>
            <option value="03">3</option>
            <option value="04">4</option>
            <option value="05">5</option>
            <option value="06">6</option>
            <option value="07">7</option>
            <option value="08">8</option>
            <option value="09">9</option>
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
            <select name="month" id="month" style="width:80px;">
	<option value="" selected>เดือน</option>
	<option value="01">มกราคม</option>
	<option value="02">กุมภาพันธ์</option>
	<option value="03">มีนาคม</option>
	<option value="04">เมษายน</option>
	<option value="05">พฤษภาคม</option>
	<option value="06">มิถุนายน</option>
	<option value="07">กรกฎาคม</option>
	<option value="08">สิงหาคม</option>
	<option value="09">กันยายน</option>
	<option value="10">ตุลาคม</option>
	<option value="11">พฤศจิกายน</option>
	<option value="12">ธันวาคม</option>
              </select>
						<select name="year" id="year" style="width:50px;">
	<option value="0" selected>ปี</option>
	<option value="2006">2549</option>
	<option value="2005">2548</option>
	<option value="2004">2547</option>
	<option value="2003">2546</option>
	<option value="2002">2545</option>
	<option value="2001">2544</option>
	<option value="2000">2543</option>
	<option value="1999">2542</option>
	<option value="1998">2541</option>
	<option value="1997">2540</option>
	<option value="1996">2539</option>
	<option value="1995">2538</option>
	<option value="1994">2537</option>
	<option value="1993">2536</option>
	<option value="1992">2535</option>
	<option value="1991">2534</option>
	<option value="1990">2533</option>
	<option value="1989">2532</option>
	<option value="1988">2531</option>
	<option value="1987">2530</option>
	<option value="1986">2529</option>
	<option value="1985">2528</option>
	<option value="1984">2527</option>
	<option value="1983">2526</option>
	<option value="1982">2525</option>
	<option value="1981">2524</option>
	<option value="1980">2523</option>
	<option value="1979">2522</option>
	<option value="1978">2521</option>
	<option value="1977">2520</option>
	<option value="1976">2519</option>
	<option value="1975">2518</option>
	<option value="1974">2517</option>
	<option value="1973">2516</option>
	<option value="1972">2515</option>
	<option value="1971">2514</option>
	<option value="1970">2513</option>
	<option value="1969">2512</option>
	<option value="1968">2511</option>
	<option value="1967">2510</option>
	<option value="1966">2509</option>
	<option value="1965">2508</option>
	<option value="1964">2507</option>
	<option value="1963">2506</option>
	<option value="1962">2505</option>
	<option value="1961">2504</option>
	<option value="1960">2503</option>
	<option value="1959">2502</option>
	<option value="1958">2501</option>
	<option value="1957">2500</option>
	<option value="1956">2499</option>
	<option value="1955">2498</option>
	<option value="1954">2497</option>
	<option value="1953">2496</option>
	<option value="1952">2495</option>
	<option value="1951">2494</option>
	<option value="1950">2493</option>
	<option value="1949">2492</option>
	<option value="1948">2491</option>
	<option value="1947">2490</option>
	<option value="1946">2489</option>
	<option value="1945">2488</option>
	<option value="1944">2487</option>
	<option value="1943">2486</option>
	<option value="1942">2485</option>
	<option value="1941">2484</option>
	<option value="1940">2483</option>
	<option value="1939">2482</option>
	<option value="1938">2481</option>
	<option value="1937">2480</option>
	<option value="1936">2479</option>
	<option value="1935">2478</option>
	<option value="1934">2477</option>
	<option value="1933">2476</option>
	<option value="1932">2475</option>
	<option value="1931">2474</option>
	<option value="1930">2473</option>
	<option value="1929">2472</option>
	<option value="1928">2471</option>
	<option value="1927">2470</option>
	<option value="1926">2469</option>
	<option value="1925">2468</option>
	<option value="1924">2467</option>
	<option value="1923">2466</option>
	<option value="1922">2465</option>
	<option value="1921">2464</option>
	<option value="1920">2463</option>
	<option value="1919">2462</option>
	<option value="1918">2461</option>
	<option value="1917">2460</option>
	<option value="1916">2459</option>
	<option value="1915">2458</option>
	<option value="1914">2457</option>
	<option value="1913">2456</option>
	<option value="1912">2455</option>
	<option value="1911">2454</option>
	<option value="1910">2453</option>
	<option value="1909">2452</option>
	<option value="1908">2451</option>
	<option value="1907">2450</option>
	<option value="1906">2449</option>

                        </select>
</td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">&#3607;&#3637;&#3656;&#3629;&#3618;&#3641;&#3656;</td>
          <td><textarea name="address" id="address"></textarea></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">เบอร์&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660;</td>
          <td><input name="telnum" type="text" id="telnum" maxlength="20"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Email</td>
          <td><input name="email" type="text" id="email" maxlength="100"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">&#3626;&#3606;&#3634;&#3609;&#3607;&#3637;&#3656;&#3607;&#3635;&#3591;&#3634;&#3609;/&#3626;&#3606;&#3634;&#3609;&#3624;&#3638;&#3585;&#3625;&#3634;</td>
          <td>
            <div align="left">
              <input name="workplace" type="text" id="workplace" maxlength="50">
            </div></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">&#3629;&#3634;&#3594;&#3637;&#3614;</td>
          <td><select name="occupation" id="occupation">
            <option selected>--- กรุณาเลือก ---</option>
            <option value="นักเรียน">นักเรียน</option>
            <option value="นักศึกษาปริญญาตรี">นักศึกษาปริญญาตรี</option>
            <option value="นักศึกษาปริญญาโท">นักศึกษาปริญญาโท</option>
            <option value="วิศวกร">วิศวกร</option>
            <option value="แพทย์">แพทย์</option>
            <option value="พยาบาล">พยาบาล</option>
            <option value="กิจการส่วนตัว">กิจการส่วนตัว</option>
            <option value="โปรแกรมเมอร์">โปรแกรมเมอร์</option>
            <option value="กราฟฟิค ดีไซเนอร์">กราฟฟิค ดีไซเนอร์</option>
            <option value="นักพัฒนาเกม">นักพัฒนาเกม</option>
            <option value="นักดนตรี">นักดนตรี</option>
            <option value="แดนเซอร์">แดนเซอร์</option>
            <option value="นิติกร">นิติกร</option>
            <option value="นักแสดง">นักแสดง</option>
            <option value="ค้าขาย">ค้าขาย</option>
            <option value="นายแบบ-นางแบบ">นายแบบ-นางแบบ</option>
            <option value="ทหาร">ทหาร</option>
            <option value="ครู-อาจารย์">ครู-อาจารย์</option>
            <option value="ตำรวจ">ตำรวจ</option>
            <option value="พนักงานบริษัท">พนักงานบริษัท</option>
            <option value="ว่างงาน">ว่างงาน</option>
          </select>
            &nbsp;&nbsp;</td>
        </tr>
        <tr>
          <td height="28" colspan="2" bgcolor="#66CCFF">
            <div align="justify">
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <input name="Submit" type="submit" value="Submit">
&nbsp;&nbsp;  <input name="Reset" type="reset" id="Reset" value="Reset">
                <input name="status" type="hidden" id="status" value="student">
            </div></td></tr>
      </table>
      <div align="justify">
        <p>หมายเหตุ :<span class="style6"> กรุณากรอกข้อมูลให้ครบทุกช่องครับ</span></p>
        </div>
      </form></td>
    <td width="109">&nbsp;</td>
  </tr>
</table>

</body>
</html>