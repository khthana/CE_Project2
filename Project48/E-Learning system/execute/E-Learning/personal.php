<?php require_once('Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_teacher = "SELECT * FROM teacher";
$teacher = mysql_query($query_teacher, $conn) or die(mysql_error());
$row_teacher = mysql_fetch_assoc($teacher);
$totalRows_teacher = mysql_num_rows($teacher);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Personal</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style2 {
	font-size: 24px;
	font-weight: bold;
	color: #FF6600;
}
a:link {
	color: #0066FF;
	text-decoration: none;
}
a:visited {
	text-decoration: none;
	color: #0066FF;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style></head>

<body>
<?php include("index_header.htm"); ?>
<?php $color="FFE1FF";?>
<table width="860" border="0" cellpadding="0" cellspacing="0" background="Images/bg.gif">
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><div align="center" class="style2"><img src="Images/&#3649;&#3626;&#3604;&#3591;&#3619;&#3634;&#3618;&#3594;&#3639;&#3656;&#3629;&#3629;&#3634;&#3592;&#3634;&#3619;&#3618;&#3660;.gif" width="356" height="49"></div></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td width="24"></td>
  <td width="836">    
  <table width="700" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#3399FF">
      <tr bgcolor="#66ccFF">
        <td ><div align="center">ชื่ออาจารย์</div></td>
        <td><div align="center">วิชาที่สอน</div></td>
        <td ><div align="center">เบอร์โทรศัพท์</div></td>
        <td ><div align="center">E-mail</div></td>
      </tr>
      <?php do { 
	  			//find subject that teacher teach
				$query = "SELECT DISTINCT subject_name FROM course left join subject on course.subject_ID=subject.subject_ID where teacher_ID='$row_teacher[teacher_ID]' ";
				$subject = mysql_query($query, $conn) or die(mysql_error());
				$row_subject = mysql_fetch_assoc($subject);
				$totalRows_subject = mysql_num_rows($subject);?>
 	   <tr bgcolor="<?php echo $color;?>">
        <td rowspan="<?php echo $totalRows_subject; ?>"><div align="center"><a href="teacher_show.php?id=<?php echo $row_teacher['teacher_ID'];?>"><?php echo "$row_teacher[title] $row_teacher[name] $row_teacher[surname]"; ?></a></div></td>
        <td><div align="center"><?php 	if($totalRows_subject>0){echo $row_subject[subject_name];} else echo"-";?></div></td>
        <td rowspan="<?php echo $totalRows_subject; ?>"><div align="center"><?php echo $row_teacher['telnum']; ?></div></td>
        <td rowspan="<?php echo $totalRows_subject; ?>"><div align="center"><?php echo $row_teacher['email']; ?></div></td>
      </tr>
		<?php while($row_subject = mysql_fetch_assoc($subject)){echo "<tr bgcolor='$color' border='1'><td ><div align ='center'>$row_subject[subject_name]</div></td></tr>";}
	  				 //color change
					  if ($color=="FFE1FF"){$color="B9E9FF";}else $color="FFE1FF";
		}
		while ($row_teacher = mysql_fetch_assoc($teacher)); ?>
      </table></td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($teacher);
mysql_free_result($subject);
?>
