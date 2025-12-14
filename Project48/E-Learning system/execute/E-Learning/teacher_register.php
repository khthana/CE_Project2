<?php include("Javascript/teacher_check.htm"); ?>
<?php require_once('Connections/conn.php'); ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Teacher Registration</title>
<style type="text/css">
<!--
body {
	background-image: url();
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style6 {color: #FF0000}
.style8 {font-size: 24px}
.style11 {font-size: 36px; font-weight: bold; color: #FF3300;}
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
	 $path1="C:/Inetpub/wwwroot/E-Learning/Images/teacher_pic/";
	 //collect teacher picture
	$TempName1 = $HTTP_POST_FILES['file1']['tmp_name'];
  	$Name1=$HTTP_POST_FILES['file1']['name'];
	if(@opendir("$path1"))
	{
	copy($HTTP_POST_FILES['file1']['tmp_name'],"$path1$Name1");
	}
	else
	{
	mkdir("$path1");
	copy($HTTP_POST_FILES['file1']['tmp_name'],"$path1$Name1");
	}
		mysql_select_db($database_conn,$conn);
		//add to users table
		$query ="INSERT INTO users (username,password,status) VALUES ('$username','$password','$status')";
		$result = mysql_query($query,$conn) or die(mysql_error());
		//find user_ID
		$query ="select * from users order by user_ID desc";
		$user_ID=mysql_query($query,$conn) or die(mysql_error());
		$row_rsUser_ID=mysql_fetch_assoc($user_ID);
		$user_ID=$row_rsUser_ID['user_ID'];
		//tranform teach_degree
		$teach_degree = "$bachelor$master$professor";
		//order reseach
		if($research1==""&&$research2!=""){$research1=$research2; $research2="";}
		else if ($research1==""&&$research3!=""){$research1=$research3; $research3="";}
		else if ($research1==""&&$research4!=""){$research1=$research4; $research4="";}
		else if ($research1==""&&$research5!=""){$research1=$research5; $research5="";}
		if($research2==""&&$research3!=""){$research2=$research3; $research3="";}
		else if ($research2==""&&$research4!=""){$research2=$research4; $research4="";}
		else if ($research2==""&&$research5!=""){$research2=$research5; $research5="";}
		if($research3==""&&$research4!=""){$research3=$research4; $research4="";}
		else if ($research3==""&&$research5!=""){$research3=$research5; $research5="";}
		if($research4==""&&$research5!=""){$research4=$research5; $research5="";}
		//order book
		if($book1==""&&$book2!=""){$book1=$book2; $book2="";}
		else if ($book1==""&&$book3!=""){$book1=$book3; $book3="";}
		else if ($book1==""&&$book4!=""){$book1=$book4; $book4="";}
		else if ($book1==""&&$book5!=""){$book1=$book5; $book5="";}
		if($book2==""&&$book3!=""){$book2=$book3; $book3="";}
		else if ($book2==""&&$book4!=""){$book2=$book4; $book4="";}
		else if ($book2==""&&$book5!=""){$book2=$book5; $book5="";}
		if($book3==""&&$book4!=""){$book3=$book4; $book4="";}
		else if ($book3==""&&$book5!=""){$book3=$book5; $book5="";}
		if($book4==""&&$book5!=""){$book4=$book5; $book5="";}
		//add to table teacher
		$query ="INSERT INTO teacher (user_ID,title,name,surname,position,email,telnum,teach_degree,personal_link,education,
		research1,research2,research3,research4,research5,book1,book2,book3,book4,book5,teacher_pic) VALUES 
		('$user_ID','$title','$name','$surname','$position','$email','$telnum','$teach_degree','$personal_link','$education',
		'$research1','$research2','$research3','$research4','$research5','$book1','$book2','$book3','$book4','$book5','$Name1') ";
		$result = mysql_query($query,$conn) or die(mysql_error());
		echo"<meta http-equiv='refresh' content='0;URL=index.php'>";
		}
		?>
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td><img src="Images/Teacher_registration.gif" width="510" height="72"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="28"><p class="style8">&nbsp;</p>
    </td>
    <td width="633"><form action="teacher_register.php" method="post" enctype="multipart/form-data" name="form1">
      <table width="511" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" bgcolor="#FFFFFF">
        <tr>
          <td bgcolor="#66CCFF"><div align="left">คำนำหน้า(อักษรย่อ)<span class="style6">*</span></div></td>
          <td><input name="title" type="text" id="title" maxlength="30">
            </td>
        </tr>
        <tr>
          <td width="145" bgcolor="#66CCFF"><div align="left">ชื่อ<span class="style6">*</span></div></td>
          <td width="360"><input name="name" type="text" id="name" maxlength="30">
            <span class="style6">            </span></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><div align="left">นามสกุล<span class="style6">*</span></div></td>
          <td><input name="surname" type="text" id="surname" maxlength="30">            </td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><div align="left">Username<span class="style6">*</span></div></td>
          <td><input name="username" type="text" id="username" maxlength="12" readonly="">
            <input name="ตรวจสอบ" type="button" id="ตรวจสอบ" onClick="MM_openBrWindow('username_check.php','check','status=yes,top=250,left=350,width=320,height=210')" value="ตรวจสอบ">
            </td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><div align="left">Password            
              <span class="style6"> *</span></div></td>
          <td><input name="password" type="password" id="password" maxlength="12">
            <span class="style6">*&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><div align="left">Confirm Password<span class="style6">*</span></div></td>
          <td><input name="confirm_password" type="password" id="confirm_password" maxlength="12">
            <span class="style6">*&#3629;&#3618;&#3641;&#3656;&#3619;&#3632;&#3627;&#3623;&#3656;&#3634;&#3591; 6-12 &#3605;&#3633;&#3623;&#3629;&#3633;&#3585;&#3625;&#3619;</span></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><p align="left">ตำแหน่ง<span class="style6">*</span></p></td>
          <td>            
            <lable for ="male">
            <input name="position" type="text" id="position" size="40">
            </lable></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><div align="left">Email<span class="style6">*</span></div></td>
          <td><input name="email" type="text" id="email" maxlength="30"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">เบอร์โทรศัพท์<span class="style6">*</span></td>
          <td><input name="telnum" type="text" id="telnum"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">สอนในระดัีบ<span class="style6">*</span></td>
          <td><input name="bachelor" type="checkbox" id="bachelor" value="1">
            <label>ปริญญาตรี 
            <input name="master" type="checkbox" id="master" value="1">
<label>ปริญญาโท 
<input name="professor" type="checkbox" id="professor" value="1">
</label>            </label><label>ปริญญาเอก </label></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">ลิงก์ส่วนตัว</td>
          <td><input name="personal_link" type="text" id="personal_link" size="40"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">คุณวุฒิ สาขาวิชา<br>สถานการศึกษา<span class="style6">*</span></td>
          <td>
            <div align="left">
              <textarea name="education" cols="40" rows="3" id="education"></textarea>
</div></td>
        </tr>
        <tr>
          <td rowspan="5" bgcolor="#66CCFF"><div align="left">
            <p>สาขาวิชาที่มีความชำนาญ<span class="style6">*</span>
                </p>
                </p>
            </div></td>
          <td>&nbsp;&nbsp;1.
            <input name="research1" type="text" id="research1" size="40"></td>
        </tr>
        <tr>
          <td>&nbsp;&nbsp;2.
            <input name="research2" type="text" id="research2" size="40"></td>
        </tr>
        <tr>
          <td>&nbsp;&nbsp;3.
            <input name="research3" type="text" id="research3" size="40"></td>
        </tr>
        <tr>
          <td> &nbsp;&nbsp;4.
            <input name="research4" type="text" id="research4" size="40"></td>
        </tr>
        <tr>
          <td>&nbsp;&nbsp;5.
            <input name="research5" type="text" id="research5" size="40"></td>
        </tr>
        <tr>
          <td rowspan="5" bgcolor="#66CCFF"><div align="left">ตำรา</div></td>
          <td>&nbsp;&nbsp;1.
            <input name="book1" type="text" id="book1" size="40"></td>
        </tr>
        <tr>
          <td> &nbsp;&nbsp;2.
            <input name="book2" type="text" id="book2" size="40"></td>
        </tr>
        <tr>
          <td>&nbsp;&nbsp;3.
            <input name="book3" type="text" id="book3" size="40"></td>
        </tr>
        <tr>
          <td>&nbsp;&nbsp;4.
            <input name="book4" type="text" id="book4" size="40"></td>
        </tr>
        <tr>
          <td>&nbsp;&nbsp;5.
            <input name="book5" type="text" id="book5" size="40"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><div align="left">รูปถ่าย<span class="style6">*</span></div></td>
          <td><input name="file1" type="file" id="file1"></td>
        </tr>
        <tr>
          <td height="28" colspan="2" bgcolor="#66CCFF"><div align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <input name="Submit" type="submit" value="Submit" onClick="return Check()">
&nbsp;&nbsp;
<input name="Reset" type="reset" id="Reset" value="Reset">
            <input name="status" type="hidden" id="status" value="teacher">
          </div></td>
        </tr>
      </table>
      <p>หมายเหตุ :<SPAN class=style6> กรุณากรอกข้อมูลในช่องที่มีเครื่องหมาย * ให้ครบครับ </SPAN></p>
      </form></td>
    <td width="109"><p>&nbsp;</p>
    <p>&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
