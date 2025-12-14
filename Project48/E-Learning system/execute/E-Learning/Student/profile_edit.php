<?php session_start();
require_once('../Connections/conn.php'); 
mysql_select_db($database_conn, $conn); 
?>
<script language="javascript" type="text/JavaScript">
function Check() {
	var name_form= document.getElementById("name_form");
	var surname_form = document.getElementById("surname_form");
	var username = document.getElementById("username");
	var password = document.getElementById("password");
	var obj_male = document.getElementById("male");
	var obj_female = document.getElementById("female");
	var day = document.getElementById("day");
	var month = document.getElementById("month");
	var year = document.getElementById("year");
	var address = document.getElementById("address");
	var telnum = document.getElementById("telnum");
	var email = document.getElementById("email");
	var workplace = document.getElementById("workplace");
	var occupation = document.getElementById("occupation");
	
	if (name_form.value == ""){
		alert("กรุณากรอก ชื่อ");
		name_form.focus();
		return false;
	}
	else if (surname_form.value == ""){
		alert("กรุณากรอก นามสกุล");
		surname_form.focus();
		return false;
	}
	else if (username.value.length < 6){
		alert("username ไม่ถูกต้อง");
		username.focus();
		return false;
	}
	else if (password.value.length < 6){
		alert("password ไม่ถูกต้อง");
		password.focus();
		return false;
	}
	else if (obj_male.checked == false && obj_female.checked == false){
		alert("กรุณาเลือก เพศ");
		obj_male.focus();
		return false;
	}
	else if (day.selectedIndex == 0 || day.selectedIndex == ""){
		alert("กรุณาเลือก วันเกิด");
		day.focus();
		return false;
	}
	else if (month.selectedIndex == 0 || month.selectedIndex == ""){
		alert("กรุณาเลือก เดือนเกิด");
		month.focus();
		return false;
	}
	else if (year.selectedIndex == 0 || year.selectedIndex == ""){
		alert("กรุณาเลือก ปีเกิด");
		year.focus();
		return false;
	}
	else if (address.value==""){
		alert("กรุณากรอก ที่อยู่");
		address.focus();
		return false;
	}
	else if (telnum.value==""){
		alert("กรุณากรอก เบอร์โทรศัพท์");
		telnum.focus();
		return false;
	}
	else if (email.value==""){
		alert("กรุณากรอก Email address");
		email.focus();
		return false;
	}
	else if (workplace.value==""){
		alert("กรุณากรอก สถานที่ทำงานหรือสถานศึกษา");
		workplace.focus();
		return false;
	}
	else if (occupation.selectedIndex == 0 || occupation.selectedIndex == ""){
		alert("กรุณาเลือก อาชีพ");
		occupation.focus();
		return false;
	}
	else if(isNaN(telnum.value)){
	alert("หมายเลขโทรศัพท ์ต้องเป็นตัวเลขค่ะ");
	telnum.focus();
	return false;
	}
	else {
	p=email.value.indexOf('@');
    		if (p<1 || p==(email.value.length-1)){
			alert("อีเมลผิด กรุณากรอกใหม่ค่ะ");
			email.focus();
			return false;
			}
	}
}
</script>
<html>
<head>
<?php //include('header_index.htm') ?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Edit Student</title>
<style type="text/css">
<!--
body {
	background-image: url(Images/bg.gif);
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style6 {color: #FF0000}
.style8 {font-size: 24px}
.style10 {
	color: #FF6633;
	font-size: 36px;
	font-weight: bold;
}
-->
</style>

</head>
<body>
<?php  //if submit update to users table and student table 
	if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="Submit"))
	{	
		//update to student table
		$birthday="$day/$month/$year";
		$query ="UPDATE student SET name='$name_form',surname='$surname_form',
		gender='$gender',birthday='$birthday',address='$address',telnum='$telnum',email='$email',workplace='$workplace',
		occupation='$occupation' where user_ID='$_SESSION[user_ID]' ";
		$result = mysql_query($query,$conn) or die(mysql_error());
		$_SESSION["name"]=$name_form;
		$_SESSION["surname"]=$surname_form;
		echo"<meta http-equiv='refresh' content='0;URL=student_index.php'>";
		}
?>
<?php  //show student profile
$query_student_rs = "SELECT * FROM student where user_ID ='$_SESSION[user_ID]' ";
$student_rs = mysql_query($query_student_rs, $conn) or die(mysql_error());
$row_student_rs = mysql_fetch_assoc($student_rs);
$totalRows_student_rs = mysql_num_rows($student_rs);

//find day month year from birth day
$day=substr($row_student_rs[birthday],0,2); 
$month=substr($row_student_rs[birthday],3,2); 
$year=substr($row_student_rs[birthday],6,4);
?>
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp;</td>
    <td><img src="../Images/profile_edit_form.gif" width="510" height="72"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="30">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td width="629"><form action="profile_edit.php" method="post" name="form1">
      <table width="511" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" background="Images/bg.gif" bgcolor="#FFFFFF">
        <tr>
          <td bgcolor="#66CCFF">&#3594;&#3639;&#3656;&#3629;</td>
          <td><input name="name_form" type="text" id="name_form" value="<?php echo $row_student_rs['name']; ?>" maxlength="30"></td>
        </tr>
        <tr>
          <td width="138" bgcolor="#66CCFF">&#3609;&#3634;&#3617;&#3626;&#3585;&#3640;&#3621;</td>
          <td width="367"><input name="surname_form" type="text" id="surname_form" value="<?php echo $row_student_rs['surname']; ?>" maxlength="30"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><p>&#3648;&#3614;&#3624;</p></td>
          <td>            
            <input <?php if (!(strcmp($row_student_rs['gender'],"male"))) {echo "CHECKED";} ?> name="gender" type="radio" id="male" value="male"> 
            <lable for ="male">ชาย</lable>
            <input <?php if (!(strcmp($row_student_rs['gender'],"female"))) {echo "CHECKED";} ?> name="gender" type="radio" value="female" id ="female">
            <label for="female">หญิง</label>
			</td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">&#3623;&#3633;&#3609;&#3648;&#3585;&#3636;&#3604;</td>
          <td><select name="day" id="day">
            <option selected value="" <?php if (!(strcmp("", $day))) {echo "SELECTED";} ?>>วัน</option>
            <option value="01" <?php if (!(strcmp("01", $day))) {echo "SELECTED";} ?>>1</option>
            <option value="02" <?php if (!(strcmp("02", $day))) {echo "SELECTED";} ?>>2</option>
            <option value="03" <?php if (!(strcmp("03", $day))) {echo "SELECTED";} ?>>3</option>
            <option value="04" <?php if (!(strcmp("04", $day))) {echo "SELECTED";} ?>>4</option>
            <option value="05" <?php if (!(strcmp("05", $day))) {echo "SELECTED";} ?>>5</option>
            <option value="06" <?php if (!(strcmp("06", $day))) {echo "SELECTED";} ?>>6</option>
            <option value="07" <?php if (!(strcmp("07", $day))) {echo "SELECTED";} ?>>7</option>
            <option value="08" <?php if (!(strcmp("08", $day))) {echo "SELECTED";} ?>>8</option>
            <option value="09" <?php if (!(strcmp("09", $day))) {echo "SELECTED";} ?>>9</option>
            <option value="10" <?php if (!(strcmp(10, $day))) {echo "SELECTED";} ?>>10</option>
            <option value="11" <?php if (!(strcmp(11, $day))) {echo "SELECTED";} ?>>11</option>
            <option value="12" <?php if (!(strcmp(12, $day))) {echo "SELECTED";} ?>>12</option>
            <option value="13" <?php if (!(strcmp(13, $day))) {echo "SELECTED";} ?>>13</option>
            <option value="14" <?php if (!(strcmp(14, $day))) {echo "SELECTED";} ?>>14</option>
            <option value="15" <?php if (!(strcmp(15, $day))) {echo "SELECTED";} ?>>15</option>
            <option value="16" <?php if (!(strcmp(16, $day))) {echo "SELECTED";} ?>>16</option>
            <option value="17" <?php if (!(strcmp(17, $day))) {echo "SELECTED";} ?>>17</option>
            <option value="18" <?php if (!(strcmp(18, $day))) {echo "SELECTED";} ?>>18</option>
            <option value="19" <?php if (!(strcmp(19, $day))) {echo "SELECTED";} ?>>19</option>
            <option value="20" <?php if (!(strcmp(20, $day))) {echo "SELECTED";} ?>>20</option>
            <option value="21" <?php if (!(strcmp(21, $day))) {echo "SELECTED";} ?>>21</option>
            <option value="22" <?php if (!(strcmp(22, $day))) {echo "SELECTED";} ?>>22</option>
            <option value="23" <?php if (!(strcmp(23, $day))) {echo "SELECTED";} ?>>23</option>
            <option value="24" <?php if (!(strcmp(24, $day))) {echo "SELECTED";} ?>>24</option>
            <option value="25" <?php if (!(strcmp(25, $day))) {echo "SELECTED";} ?>>25</option>
            <option value="26" <?php if (!(strcmp(26, $day))) {echo "SELECTED";} ?>>26</option>
            <option value="27" <?php if (!(strcmp(27, $day))) {echo "SELECTED";} ?>>27</option>
            <option value="28" <?php if (!(strcmp(28, $day))) {echo "SELECTED";} ?>>28</option>
            <option value="29" <?php if (!(strcmp(29, $day))) {echo "SELECTED";} ?>>29</option>
            <option value="30" <?php if (!(strcmp(30, $day))) {echo "SELECTED";} ?>>30</option>
            <option value="31" <?php if (!(strcmp(31, $day))) {echo "SELECTED";} ?>>31</option>
          </select>
            <select name="month" id="month" style="width:80px;">
              <option value="" selected <?php if (!(strcmp("", $month))) {echo "SELECTED";} ?>>เดือน</option>
              <option value="01" <?php if (!(strcmp("01", $month))) {echo "SELECTED";} ?>>มกราคม</option>
              <option value="02" <?php if (!(strcmp("02", $month))) {echo "SELECTED";} ?>>กุมภาพันธ์</option>
              <option value="03" <?php if (!(strcmp("03", $month))) {echo "SELECTED";} ?>>มีนาคม</option>
              <option value="04" <?php if (!(strcmp("04", $month))) {echo "SELECTED";} ?>>เมษายน</option>
              <option value="05" <?php if (!(strcmp("05", $month))) {echo "SELECTED";} ?>>พฤษภาคม</option>
              <option value="06" <?php if (!(strcmp("06", $month))) {echo "SELECTED";} ?>>มิถุนายน</option>
              <option value="07" <?php if (!(strcmp("07", $month))) {echo "SELECTED";} ?>>กรกฎาคม</option>
              <option value="08" <?php if (!(strcmp("08", $month))) {echo "SELECTED";} ?>>สิงหาคม</option>
              <option value="09" <?php if (!(strcmp("09", $month))) {echo "SELECTED";} ?>>กันยายน</option>
              <option value="10" <?php if (!(strcmp(10, $month))) {echo "SELECTED";} ?>>ตุลาคม</option>
              <option value="11" <?php if (!(strcmp(11, $month))) {echo "SELECTED";} ?>>พฤศจิกายน</option>
              <option value="12" <?php if (!(strcmp(12, $month))) {echo "SELECTED";} ?>>ธันวาคม</option>
              </select>
						<select name="year" id="year" style="width:50px;">
						  <option value="0" selected <?php if (!(strcmp(0, $year))) {echo "SELECTED";} ?>>ปี</option>
						  <option value="2005" <?php if (!(strcmp(2005, $year))) {echo "SELECTED";} ?>>2548</option>
						  <option value="2004" <?php if (!(strcmp(2004, $year))) {echo "SELECTED";} ?>>2547</option>
						  <option value="2003" <?php if (!(strcmp(2003, $year))) {echo "SELECTED";} ?>>2546</option>
						  <option value="2002" <?php if (!(strcmp(2002, $year))) {echo "SELECTED";} ?>>2545</option>
						  <option value="2001" <?php if (!(strcmp(2001, $year))) {echo "SELECTED";} ?>>2544</option>
						  <option value="2000" <?php if (!(strcmp(2000, $year))) {echo "SELECTED";} ?>>2543</option>
						  <option value="1999" <?php if (!(strcmp(1999, $year))) {echo "SELECTED";} ?>>2542</option>
						  <option value="1998" <?php if (!(strcmp(1998, $year))) {echo "SELECTED";} ?>>2541</option>
						  <option value="1997" <?php if (!(strcmp(1997, $year))) {echo "SELECTED";} ?>>2540</option>
						  <option value="1996" <?php if (!(strcmp(1996, $year))) {echo "SELECTED";} ?>>2539</option>
						  <option value="1995" <?php if (!(strcmp(1995, $year))) {echo "SELECTED";} ?>>2538</option>
						  <option value="1994" <?php if (!(strcmp(1994, $year))) {echo "SELECTED";} ?>>2537</option>
						  <option value="1993" <?php if (!(strcmp(1993, $year))) {echo "SELECTED";} ?>>2536</option>
						  <option value="1992" <?php if (!(strcmp(1992, $year))) {echo "SELECTED";} ?>>2535</option>
						  <option value="1991" <?php if (!(strcmp(1991, $year))) {echo "SELECTED";} ?>>2534</option>
						  <option value="1990" <?php if (!(strcmp(1990, $year))) {echo "SELECTED";} ?>>2533</option>
						  <option value="1989" <?php if (!(strcmp(1989, $year))) {echo "SELECTED";} ?>>2532</option>
						  <option value="1988" <?php if (!(strcmp(1988, $year))) {echo "SELECTED";} ?>>2531</option>
						  <option value="1987" <?php if (!(strcmp(1987, $year))) {echo "SELECTED";} ?>>2530</option>
						  <option value="1986" <?php if (!(strcmp(1986, $year))) {echo "SELECTED";} ?>>2529</option>
						  <option value="1985" <?php if (!(strcmp(1985, $year))) {echo "SELECTED";} ?>>2528</option>
						  <option value="1984" <?php if (!(strcmp(1984, $year))) {echo "SELECTED";} ?>>2527</option>
						  <option value="1983" <?php if (!(strcmp(1983, $year))) {echo "SELECTED";} ?>>2526</option>
						  <option value="1982" <?php if (!(strcmp(1982, $year))) {echo "SELECTED";} ?>>2525</option>
						  <option value="1981" <?php if (!(strcmp(1981, $year))) {echo "SELECTED";} ?>>2524</option>
						  <option value="1980" <?php if (!(strcmp(1980, $year))) {echo "SELECTED";} ?>>2523</option>
						  <option value="1979" <?php if (!(strcmp(1979, $year))) {echo "SELECTED";} ?>>2522</option>
						  <option value="1978" <?php if (!(strcmp(1978, $year))) {echo "SELECTED";} ?>>2521</option>
						  <option value="1977" <?php if (!(strcmp(1977, $year))) {echo "SELECTED";} ?>>2520</option>
						  <option value="1976" <?php if (!(strcmp(1976, $year))) {echo "SELECTED";} ?>>2519</option>
						  <option value="1975" <?php if (!(strcmp(1975, $year))) {echo "SELECTED";} ?>>2518</option>
						  <option value="1974" <?php if (!(strcmp(1974, $year))) {echo "SELECTED";} ?>>2517</option>
						  <option value="1973" <?php if (!(strcmp(1973, $year))) {echo "SELECTED";} ?>>2516</option>
						  <option value="1972" <?php if (!(strcmp(1972, $year))) {echo "SELECTED";} ?>>2515</option>
						  <option value="1971" <?php if (!(strcmp(1971, $year))) {echo "SELECTED";} ?>>2514</option>
						  <option value="1970" <?php if (!(strcmp(1970, $year))) {echo "SELECTED";} ?>>2513</option>
						  <option value="1969" <?php if (!(strcmp(1969, $year))) {echo "SELECTED";} ?>>2512</option>
						  <option value="1968" <?php if (!(strcmp(1968, $year))) {echo "SELECTED";} ?>>2511</option>
						  <option value="1967" <?php if (!(strcmp(1967, $year))) {echo "SELECTED";} ?>>2510</option>
						  <option value="1966" <?php if (!(strcmp(1966, $year))) {echo "SELECTED";} ?>>2509</option>
						  <option value="1965" <?php if (!(strcmp(1965, $year))) {echo "SELECTED";} ?>>2508</option>
						  <option value="1964" <?php if (!(strcmp(1964, $year))) {echo "SELECTED";} ?>>2507</option>
						  <option value="1963" <?php if (!(strcmp(1963, $year))) {echo "SELECTED";} ?>>2506</option>
						  <option value="1962" <?php if (!(strcmp(1962, $year))) {echo "SELECTED";} ?>>2505</option>
						  <option value="1961" <?php if (!(strcmp(1961, $year))) {echo "SELECTED";} ?>>2504</option>
						  <option value="1960" <?php if (!(strcmp(1960, $year))) {echo "SELECTED";} ?>>2503</option>
						  <option value="1959" <?php if (!(strcmp(1959, $year))) {echo "SELECTED";} ?>>2502</option>
						  <option value="1958" <?php if (!(strcmp(1958, $year))) {echo "SELECTED";} ?>>2501</option>
						  <option value="1957" <?php if (!(strcmp(1957, $year))) {echo "SELECTED";} ?>>2500</option>
						  <option value="1956" <?php if (!(strcmp(1956, $year))) {echo "SELECTED";} ?>>2499</option>
						  <option value="1955" <?php if (!(strcmp(1955, $year))) {echo "SELECTED";} ?>>2498</option>
						  <option value="1954" <?php if (!(strcmp(1954, $year))) {echo "SELECTED";} ?>>2497</option>
						  <option value="1953" <?php if (!(strcmp(1953, $year))) {echo "SELECTED";} ?>>2496</option>
						  <option value="1952" <?php if (!(strcmp(1952, $year))) {echo "SELECTED";} ?>>2495</option>
						  <option value="1951" <?php if (!(strcmp(1951, $year))) {echo "SELECTED";} ?>>2494</option>
						  <option value="1950" <?php if (!(strcmp(1950, $year))) {echo "SELECTED";} ?>>2493</option>
						  <option value="1949" <?php if (!(strcmp(1949, $year))) {echo "SELECTED";} ?>>2492</option>
						  <option value="1948" <?php if (!(strcmp(1948, $year))) {echo "SELECTED";} ?>>2491</option>
						  <option value="1947" <?php if (!(strcmp(1947, $year))) {echo "SELECTED";} ?>>2490</option>
						  <option value="1946" <?php if (!(strcmp(1946, $year))) {echo "SELECTED";} ?>>2489</option>
						  <option value="1945" <?php if (!(strcmp(1945, $year))) {echo "SELECTED";} ?>>2488</option>
						  <option value="1944" <?php if (!(strcmp(1944, $year))) {echo "SELECTED";} ?>>2487</option>
						  <option value="1943" <?php if (!(strcmp(1943, $year))) {echo "SELECTED";} ?>>2486</option>
						  <option value="1942" <?php if (!(strcmp(1942, $year))) {echo "SELECTED";} ?>>2485</option>
						  <option value="1941" <?php if (!(strcmp(1941, $year))) {echo "SELECTED";} ?>>2484</option>
						  <option value="1940" <?php if (!(strcmp(1940, $year))) {echo "SELECTED";} ?>>2483</option>
						  <option value="1939" <?php if (!(strcmp(1939, $year))) {echo "SELECTED";} ?>>2482</option>
						  <option value="1938" <?php if (!(strcmp(1938, $year))) {echo "SELECTED";} ?>>2481</option>
						  <option value="1937" <?php if (!(strcmp(1937, $year))) {echo "SELECTED";} ?>>2480</option>
						  <option value="1936" <?php if (!(strcmp(1936, $year))) {echo "SELECTED";} ?>>2479</option>
						  <option value="1935" <?php if (!(strcmp(1935, $year))) {echo "SELECTED";} ?>>2478</option>
						  <option value="1934" <?php if (!(strcmp(1934, $year))) {echo "SELECTED";} ?>>2477</option>
						  <option value="1933" <?php if (!(strcmp(1933, $year))) {echo "SELECTED";} ?>>2476</option>
						  <option value="1932" <?php if (!(strcmp(1932, $year))) {echo "SELECTED";} ?>>2475</option>
						  <option value="1931" <?php if (!(strcmp(1931, $year))) {echo "SELECTED";} ?>>2474</option>
						  <option value="1930" <?php if (!(strcmp(1930, $year))) {echo "SELECTED";} ?>>2473</option>
						  <option value="1929" <?php if (!(strcmp(1929, $year))) {echo "SELECTED";} ?>>2472</option>
						  <option value="1928" <?php if (!(strcmp(1928, $year))) {echo "SELECTED";} ?>>2471</option>
						  <option value="1927" <?php if (!(strcmp(1927, $year))) {echo "SELECTED";} ?>>2470</option>
						  <option value="1926" <?php if (!(strcmp(1926, $year))) {echo "SELECTED";} ?>>2469</option>
						  <option value="1925" <?php if (!(strcmp(1925, $year))) {echo "SELECTED";} ?>>2468</option>
						  <option value="1924" <?php if (!(strcmp(1924, $year))) {echo "SELECTED";} ?>>2467</option>
						  <option value="1923" <?php if (!(strcmp(1923, $year))) {echo "SELECTED";} ?>>2466</option>
						  <option value="1922" <?php if (!(strcmp(1922, $year))) {echo "SELECTED";} ?>>2465</option>
						  <option value="1921" <?php if (!(strcmp(1921, $year))) {echo "SELECTED";} ?>>2464</option>
						  <option value="1920" <?php if (!(strcmp(1920, $year))) {echo "SELECTED";} ?>>2463</option>
						  <option value="1919" <?php if (!(strcmp(1919, $year))) {echo "SELECTED";} ?>>2462</option>
						  <option value="1918" <?php if (!(strcmp(1918, $year))) {echo "SELECTED";} ?>>2461</option>
						  <option value="1917" <?php if (!(strcmp(1917, $year))) {echo "SELECTED";} ?>>2460</option>
						  <option value="1916" <?php if (!(strcmp(1916, $year))) {echo "SELECTED";} ?>>2459</option>
						  <option value="1915" <?php if (!(strcmp(1915, $year))) {echo "SELECTED";} ?>>2458</option>
						  <option value="1914" <?php if (!(strcmp(1914, $year))) {echo "SELECTED";} ?>>2457</option>
						  <option value="1913" <?php if (!(strcmp(1913, $year))) {echo "SELECTED";} ?>>2456</option>
						  <option value="1912" <?php if (!(strcmp(1912, $year))) {echo "SELECTED";} ?>>2455</option>
						  <option value="1911" <?php if (!(strcmp(1911, $year))) {echo "SELECTED";} ?>>2454</option>
						  <option value="1910" <?php if (!(strcmp(1910, $year))) {echo "SELECTED";} ?>>2453</option>
						  <option value="1909" <?php if (!(strcmp(1909, $year))) {echo "SELECTED";} ?>>2452</option>
						  <option value="1908" <?php if (!(strcmp(1908, $year))) {echo "SELECTED";} ?>>2451</option>
						  <option value="1907" <?php if (!(strcmp(1907, $year))) {echo "SELECTED";} ?>>2450</option>
						  <option value="1906" <?php if (!(strcmp(1906, $year))) {echo "SELECTED";} ?>>2449</option>

</select>
</td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">&#3607;&#3637;&#3656;&#3629;&#3618;&#3641;&#3656;</td>
          <td><textarea name="address" id="address"><?php echo $row_student_rs['address']; ?></textarea></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">เบอร์&#3650;&#3607;&#3619;&#3624;&#3633;&#3614;&#3607;&#3660;</td>
          <td><input name="telnum" type="text" id="telnum" value="<?php echo $row_student_rs['telnum']; ?>" maxlength="20"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Email</td>
          <td><input name="email" type="text" id="email" value="<?php echo $row_student_rs['email']; ?>" maxlength="100"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">&#3626;&#3606;&#3634;&#3609;&#3607;&#3637;&#3656;&#3607;&#3635;&#3591;&#3634;&#3609;/&#3626;&#3606;&#3634;&#3609;&#3624;&#3638;&#3585;&#3625;&#3634;</td>
          <td>
            <div align="left">
              <input name="workplace" type="text" id="workplace" value="<?php echo $row_student_rs['workplace']; ?>" maxlength="50">
            </div></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">&#3629;&#3634;&#3594;&#3637;&#3614;</td>
          <td><select name="occupation" id="occupation">
            <option selected value="" <?php if (!(strcmp("", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>--- กรุณาเลือก ---</option>
            <option value="นักเรียน" <?php if (!(strcmp("นักเรียน", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>นักเรียน</option>
            <option value="นักศึกษาปริญญาตรี" <?php if (!(strcmp("นักศึกษาปริญญาตรี", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>นักศึกษาปริญญาตรี</option>
            <option value="นักศึกษาปริญญาโท" <?php if (!(strcmp("นักศึกษาปริญญาโท", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>นักศึกษาปริญญาโท</option>
            <option value="วิศวกร" <?php if (!(strcmp("วิศวกร", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>วิศวกร</option>
            <option value="แพทย์" <?php if (!(strcmp("แพทย์", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>แพทย์</option>
            <option value="พยาบาล" <?php if (!(strcmp("พยาบาล", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>พยาบาล</option>
            <option value="กิจการส่วนตัว" <?php if (!(strcmp("กิจการส่วนตัว", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>กิจการส่วนตัว</option>
            <option value="โปรแกรมเมอร์" <?php if (!(strcmp("โปรแกรมเมอร์", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>โปรแกรมเมอร์</option>
            <option value="กราฟฟิค ดีไซเนอร์" <?php if (!(strcmp("กราฟฟิค ดีไซเนอร์", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>กราฟฟิค ดีไซเนอร์</option>
            <option value="นักพัฒนาเกม" <?php if (!(strcmp("นักพัฒนาเกม", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>นักพัฒนาเกม</option>
            <option value="นักดนตรี" <?php if (!(strcmp("นักดนตรี", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>นักดนตรี</option>
            <option value="แดนเซอร์" <?php if (!(strcmp("แดนเซอร์", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>แดนเซอร์</option>
            <option value="นิติกร" <?php if (!(strcmp("นิติกร", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>นิติกร</option>
            <option value="นักแสดง" <?php if (!(strcmp("นักแสดง", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>นักแสดง</option>
            <option value="ค้าขาย" <?php if (!(strcmp("ค้าขาย", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>ค้าขาย</option>
            <option value="นายแบบ-นางแบบ" <?php if (!(strcmp("นายแบบ-นางแบบ", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>นายแบบ-นางแบบ</option>
            <option value="ทหาร" <?php if (!(strcmp("ทหาร", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>ทหาร</option>
            <option value="ครู-อาจารย์" <?php if (!(strcmp("ครู-อาจารย์", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>ครู-อาจารย์</option>
            <option value="ตำรวจ" <?php if (!(strcmp("ตำรวจ", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>ตำรวจ</option>
            <option value="พนักงานบริษัท" <?php if (!(strcmp("พนักงานบริษัท", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>พนักงานบริษัท</option>
            <option value="ว่างงาน" <?php if (!(strcmp("ว่างงาน", $row_student_rs['occupation']))) {echo "SELECTED";} ?>>ว่างงาน</option>
          </select></td>
        </tr>
        <tr>
          <td height="28" colspan="2" bgcolor="#66CCFF"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input name="id" type="hidden" id="id" value="<?php echo $id; ?>">            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input name="Submit" type="submit" onClick=" return Check()" value="Submit">
&nbsp;&nbsp;&nbsp; &nbsp;
        <input name="Reset" type="reset" id="Reset" value="Reset">
          </div></td>
        </tr>
      </table>
      <p>หมายเหตุ :<span class="style6"> กรุณากรอกข้อมูลให้ครบทุกช่องครับ</span></p>
      </form></td>
    <td width="118">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($student_rs);
?>
