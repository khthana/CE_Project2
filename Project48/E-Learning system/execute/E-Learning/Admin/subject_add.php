<?php include("../javascript/subject_check.htm"); ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>เพิ่มวิชา</title>
<style type="text/css">
<!--
.style1 {
	font-size: 36px;
	color: #0099FF;
}
-->
</style>
</head>

<body>
<?php 
	if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="Submit"))
	{	
	 	require_once('../Connections/conn.php');
		$learn_time="$day1/$time";
		$exam_day="$day/$month/$year";
		mysql_select_db($database_conn,$conn);
		//add to table subject
		$query ="INSERT INTO subject (subject_ID,subject_name,short_description,description,subject_point) 
		VALUES ('$subject_ID','$subject_name','$short_description','$description','$subject_point')";
		$result = mysql_query($query,$conn) or die(mysql_error());
		$filename = "$subject_name.php";
		$fp =@fopen("../subject/subject_show_pattern.php","rb");
		$fpnew =@fopen("../subject/$filename","wb");
		while ($ln=@fread($fp,1024)){
		fwrite($fpnew,$ln); 
		}
		@fclose($fp) or die("Cannot close old file");
		@fclose($fpnew) or die("Cannot close new file");
		echo"<meta http-equiv='refresh' content='0;URL=subjectlists.php'>";
		}
		?>
<p class="style1"><img src="../Images/subject_add_form.gif" width="510" height="72"></p>
<form name="form1" method="post" action="subject_add.php">
  <table border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF">
    <tr>
      <td width="118" bgcolor="#66CCFF">รหัสวิชา</td>
      <td width="205"><input name="subject_ID" type="text" id="subject_ID"></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">ชื่อวิชา</td>
      <td><textarea name="subject_name" cols="30" rows="2" id="subject_name"></textarea></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">คำบรรยายภาพรวม(สั้นๆกระชับ)</td>
      <td><textarea name="short_description" cols="30" rows="2" id="short_description"></textarea></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">คำบรรยาย(โดยละเอียด)</td>
      <td><textarea name="description" cols="30" rows="4" id="description"></textarea></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">หน่วยกิต</td>
    <td bgcolor="#66CCFF"><select name="subject_point" id="subject_point">
      <option value="0">กรุณาเลือก</option>
      <option value="1">1</option>
      <option value="2">2</option>
      <option value="3">3</option>
      <option value="4">4</option>
    </select></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="#66CCFF"><div align="center">
        <input name="Submit" type="submit" onClick="return Check()" value="Submit">
        <input type="reset" name="Reset" value="Reset">
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>
