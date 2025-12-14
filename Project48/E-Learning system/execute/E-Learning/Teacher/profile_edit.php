<?php session_start(); ?>
<?php include("../javascript/teacher_profile_edit_check.htm"); ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Profile edit form</title>
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
<?php require_once('../Connections/conn.php'); ?>
<?php //if submit teacher table
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
		//tranfrom to teach_degree
		if($bachelor==""){$bachelor="0";}
		if($master==""){$master="0";}
		if($professor==""){$professor="0";}
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
		//update to table teacher
		if($file1!=""){
		$query ="UPDATE teacher SET title='$title',name='$form_name',surname='$form_surname',
		position='$position',email='$email',telnum='$telnum',teach_degree='$teach_degree',personal_link='$personal_link',education='$education',
		research1='$research1',research2='$research2',research3='$research3',research4='$research4',research5='$research5',
		book1='$book1',book2='$book2',book3='$book3',book4='$book4',book5='$book5',
		teacher_pic='$Name1' where user_ID='$_SESSION[user_ID]' ";
		}else{
		$query ="UPDATE teacher SET title='$title',name='$form_name',surname='$form_surname',
		position='$position',email='$email',telnum='$telnum',teach_degree='$teach_degree',personal_link='$personal_link',education='$education',
		research1='$research1',research2='$research2',research3='$research3',research4='$research4',research5='$research5',
		book1='$book1',book2='$book2',book3='$book3',book4='$book4',book5='$book5'
		where user_ID='$_SESSION[user_ID]' ";
		}
		$result = mysql_query($query,$conn) or die(mysql_error());
		$_SESSION["name"]=$form_name;
		$_SESSION["surname"]=$form_surname;
		echo"<meta http-equiv='refresh' content='0;URL=teacher_index.php'>";
		}
		?>
<?php // show teacher profile
mysql_select_db($database_conn, $conn);
$query_subject_rs = "SELECT * FROM subject ";
$subject_rs = mysql_query($query_subject_rs, $conn) or die(mysql_error());
$row_subject_rs = mysql_fetch_assoc($subject_rs);
$totalRows_subject_rs = mysql_num_rows($subject_rs);

mysql_select_db($database_conn, $conn);
$query_teacher_rs = "SELECT * FROM teacher where user_ID='$_SESSION[user_ID]' ";
$teacher_rs = mysql_query($query_teacher_rs, $conn) or die(mysql_error());
$row_teacher_rs = mysql_fetch_assoc($teacher_rs);
$totalRows_teacher_rs = mysql_num_rows($teacher_rs);

//decode from teach_degree
$bachelor=substr($row_teacher_rs[teach_degree],0,1); 
$master=substr($row_teacher_rs[teach_degree],1,1); 
$professor=substr($row_teacher_rs[teach_degree],2,1);
?>
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td>&nbsp; </td>
  <td><img src="../Images/teacher_edit_form.gif" width="510" height="72"></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="30">&nbsp;</td>
    <td width="668"><form action="profile_edit.php" method="post" enctype="multipart/form-data" name="form1">
      <table width="650" border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF" background="Images/bg.gif" bgcolor="#FFFFFF">
        <tr>
          <td bgcolor="#66CCFF">คำนำหน้า(อักษรย่อ)<span class="style6">*</span></td>
          <td width="290"><input name="title" type="text" id="title" value="<?php echo $row_teacher_rs['title']; ?>" maxlength="30"></td>
          <td width="60" rowspan="3"><img src="../Images/teacher_pic/<?php echo $row_teacher_rs['teacher_pic']; ?>" width="135" height="145"></td>
        </tr>
        <tr>
          <td width="153" bgcolor="#66CCFF">ชื่อ<span class="style6">*</span></td>
          <td><input name="form_name" type="text" id="form_name" value="<?php echo $row_teacher_rs['name']; ?>" maxlength="30"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">นามสกุล<span class="style6">*</span></td>
          <td><input name="form_surname" type="text" id="form_surname" value="<?php echo $row_teacher_rs['surname']; ?>" maxlength="30"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><p>ตำแหน่ง<span class="style6">*</span></p></td>
          <td colspan="2"><lable for ="male">
            <input name="position" type="text" id="position" value="<?php echo $row_teacher_rs['position']; ?>" size="40">
          </lable></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">Email<span class="style6">*</span></td>
          <td colspan="2"><input name="email" type="text" id="email" value="<?php echo $row_teacher_rs['email']; ?>" maxlength="30"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">เบอร์โทรศัพท์<span class="style6">*</span></td>
          <td colspan="2"><input name="telnum" type="text" id="telnum" value="<?php echo $row_teacher_rs['telnum']; ?>"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">สอนในระดัีบ<span class="style6">*</span></td>
          <td colspan="2"><input <?php if (!(strcmp($bachelor,1))) {echo "checked";} ?> name="bachelor" type="checkbox" id="bachelor" value="1">
              <label>ปริญญาตรี
              <input <?php if (!(strcmp($master,1))) {echo "checked";} ?> name="master" type="checkbox" id="master" value="1">
              </label>
              <label>ปริญญาโท
              <input <?php if (!(strcmp($professor,1))) {echo "checked";} ?> name="professor" type="checkbox" id="professor" value="1">
              </label>
              <label>ปริญญาเอก </label></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">ลิงก์ส่วนตัว</td>
          <td colspan="2"><input name="personal_link" type="text" id="personal_link" value="<?php echo $row_teacher_rs['personal_link']; ?>" size="40"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF">คุณวุฒิ สาขาวิชา สถานการศึกษา<span class="style6">*</span></td>
          <td colspan="2"><div align="left">
              <textarea name="education" cols="40" rows="3" id="education"><?php echo $row_teacher_rs['education']; ?></textarea>
          </div></td>
        </tr>
        <tr>
          <td rowspan="5" bgcolor="#66CCFF"><div align="left">สาขาวิชาที่มีความชำนาญ<span class="style6">*</span></div></td>
          <td colspan="2">&nbsp;&nbsp;1.
              <input name="research1" type="text" id="research1" value="<?php echo $row_teacher_rs['research1']; ?>" size="40"></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;&nbsp;2.
              <input name="research2" type="text" id="research2" value="<?php echo $row_teacher_rs['research2']; ?>" size="40"></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;&nbsp;3.
              <input name="research3" type="text" id="research3" value="<?php echo $row_teacher_rs['research3']; ?>" size="40"></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;&nbsp;4.
              <input name="research4" type="text" id="research4" value="<?php echo $row_teacher_rs['research4']; ?>" size="40"></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;&nbsp;5.
              <input name="research5" type="text" id="research5" value="<?php echo $row_teacher_rs['research5']; ?>" size="40"></td>
        </tr>
        <tr>
          <td rowspan="5" bgcolor="#66CCFF"><div align="left">ตำรา</div></td>
          <td colspan="2">&nbsp;&nbsp;1.
              <input name="book1" type="text" id="book1" value="<?php echo $row_teacher_rs['book1']; ?>" size="40"></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;&nbsp;2.
              <input name="book2" type="text" id="book2" value="<?php echo $row_teacher_rs['book2']; ?>" size="40"></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;&nbsp;3.
              <input name="book3" type="text" id="book3" value="<?php echo $row_teacher_rs['book3']; ?>" size="40"></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;&nbsp;4.
              <input name="book4" type="text" id="book4" value="<?php echo $row_teacher_rs['book4']; ?>" size="40"></td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;&nbsp;5.
              <input name="book5" type="text" id="book5" value="<?php echo $row_teacher_rs['book5']; ?>" size="40"></td>
        </tr>
        <tr>
          <td bgcolor="#66CCFF"><div align="left">รูปถ่าย<span class="style6">*</span>(ว่างไว้ถ้าไม่แก้ไข)</div></td>
          <td colspan="2"><input name="file1" type="file" id="file1"></td>
        </tr>
        <tr>
          <td height="28" colspan="3" bgcolor="#66CCFF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="submit" name="Submit" value="Submit" onClick="return Check()">
&nbsp;&nbsp;              &nbsp;
<input type="reset" name="Reset" value="Reset">
</td>
        </tr>
      </table>
      <p>หมายเหตุ :<SPAN class=style6> กรุณากรอกข้อมูลในช่องที่มีเครื่องหมาย * ให้ครบครับ</SPAN></p>
    </form></td>
    <td width="69">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($subject_rs);

mysql_free_result($teacher_rs);
?>
