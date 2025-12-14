<?php include("../javascript/subject_check.htm"); ?>
<?php require_once('../Connections/conn.php'); ?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>แก้ไขวิชา</title>
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
		//update to subject table
		$query ="UPDATE subject SET subject_ID='$subject_ID' 
		,subject_name='$subject_name' ,short_description='$short_description',description='$description'
		,subject_point='$subject_point' where subject_ID='$id' ";
		$result = mysql_query($query,$conn) or die(mysql_error());
		echo"<meta http-equiv='refresh' content='0;URL=subjectlists.php'>";
		}
		?>
		<?php //find subject detail
		mysql_select_db($database_conn, $conn);
		$query_subject = "SELECT * FROM subject where subject_ID='$id' ";
		$subject = mysql_query($query_subject, $conn) or die(mysql_error());
		$row_subject = mysql_fetch_assoc($subject);
		$totalRows_subject = mysql_num_rows($subject);
		 //decode learn_time
		$day1=substr($row_subject[learn_time],0,1); 
		$time=substr($row_subject[learn_time],2,11);
		//decode exam_day
		$day=substr($row_subject[exam_day],0,2); 
		$month=substr($row_subject[exam_day],3,2); 
		$year=substr($row_subject[exam_day],6,4);
		?>
<p class="style1"><img src="../Images/subject_edit_form.gif" width="510" height="72"></p>
<form name="form1" method="post" action="subject_edit.php">
  <table border="1" cellpadding="0" cellspacing="0" bordercolor="#0099FF">
    <tr>
      <td width="118" bgcolor="#66CCFF">รหัสวิชา</td>
      <td width="205"><input name="subject_ID" type="text" id="subject_ID" value="<?php echo $row_subject['subject_ID']; ?>"></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">ชื่อวิชา</td>
      <td><textarea name="subject_name" cols="30" rows="2" id="subject_name"><?php echo $row_subject['subject_name']; ?></textarea></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">คำบรรยายภาพรวม(สั้นๆกระชับ)</td>
      <td><textarea name="short_description" cols="30" rows="2" id="short_description"><?php echo $row_subject['short_description']; ?></textarea></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">คำบรรยาย(โดยละเอียด)</td>
      <td><textarea name="description" cols="30" rows="4" id="description"><?php echo $row_subject['description']; ?></textarea></td>
    </tr>
    <tr>
      <td bgcolor="#66CCFF">หน่วยกิต</td>
      <td bgcolor="#66CCFF"><select name="subject_point" id="subject_point">
        <option value="0" <?php if (!(strcmp(0, $row_subject['subject_point']))) {echo "SELECTED";} ?>>กรุณาเลือก</option>
        <option value="1" <?php if (!(strcmp(1, $row_subject['subject_point']))) {echo "SELECTED";} ?>>1</option>
        <option value="2" <?php if (!(strcmp(2, $row_subject['subject_point']))) {echo "SELECTED";} ?>>2</option>
        <option value="3" <?php if (!(strcmp(3, $row_subject['subject_point']))) {echo "SELECTED";} ?>>3</option>
        <option value="4" <?php if (!(strcmp(4, $row_subject['subject_point']))) {echo "SELECTED";} ?>>4</option>
      </select></td>
    </tr>
    <tr>
      <td colspan="2" bgcolor="#66CCFF"><div align="center">
        <input name="id" type="hidden" id="id" value="<?php echo $row_subject['subject_ID']; ?>">
        <input type="submit" name="Submit" onClick="return Check()" value="Submit" >
        <input type="reset" name="Reset" value="Reset">
      </div></td>
    </tr>
  </table>
</form>
</body>
</html>
<?php
mysql_free_result($subject);
?>
