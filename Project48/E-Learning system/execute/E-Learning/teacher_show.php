<?php require_once('Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_teacher = "SELECT * FROM teacher where teacher_ID='$id' ";
$teacher = mysql_query($query_teacher, $conn) or die(mysql_error());
$row_teacher = mysql_fetch_assoc($teacher);
$totalRows_teacher = mysql_num_rows($teacher);
//decode from teach_degree
$bachelor=substr($row_teacher[teach_degree],0,1); 
$master=substr($row_teacher[teach_degree],1,1); 
$professor=substr($row_teacher[teach_degree],2,1);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Teacher Show</title>
</head>

<body>
<table width="588" border="1" cellpadding="2" cellspacing="0" bordercolor="#0099FF">
  <tr>
    <td colspan="3" bgcolor="#66CCFF"><div align="center">แสดงข้อมูลอาจารย์</div></td>
  </tr>
  <tr>
    <td width="119" bgcolor="#66CCFF"><div align="center">ชื่อ-นามสกุล</div></td>
    <td width="300"><?php echo"$row_teacher[title] $row_teacher[name] $row_teacher[surname]"; ?></td>
  <td width="161" rowspan="4"><div align="center"><img src="Images/teacher_pic/<?php echo $row_teacher['teacher_pic']; ?>" width="135" height="145"></div></td>
  </tr>
  <tr>
    <td bgcolor="#66CCFF"><div align="center">ตำแหน่งหน้าที่</div></td>
    <td><?php echo $row_teacher['position']; ?></td>
  </tr>
  <tr>
    <td bgcolor="#66CCFF"><div align="center">E-mail-Address </div></td>
    <td><?php echo $row_teacher['email']; ?></td>
  </tr>
  <tr>
    <td bgcolor="#66CCFF"><div align="center">เบอร์โทรศัพท์</div></td>
    <td><?php echo $row_teacher['telnum']; ?></td>
  </tr>
  <tr>
    <td bgcolor="#66CCFF"><div align="center">สอนในระดับ</div></td>
    <td colspan="2">
      <input <?php if (!(strcmp($bachelor,1))) {echo "checked";} ?> name="bachelor" type="checkbox" id="bachelor" value="1"> 
      ปริญญาตรี 
      <input <?php if (!(strcmp($master,1))) {echo "checked";} ?> name="master" type="checkbox" id="master" value="1"> 
      ปริญญาโท 
      <input <?php if (!(strcmp($professor,1))) {echo "checked";} ?> name="professor" type="checkbox" id="professor" value="1">
ปริญญาเอก
   </td>
  </tr>
  <?php if($row_teacher['personal_link']!=""){ ?>
  <tr>
    <td bgcolor="#66CCFF"><div align="center">ลิงก์ส่วนตัว</div></td>
    <td colspan="2"><?php echo $row_teacher['personal_link']; ?></td>
  </tr>
  <?php }?>
  <tr>
    <td bgcolor="#66CCFF"><div align="center">คุณวุฒิ สาขาวิชา สถานการศึกษา </div></td>
    <td colspan="2"><?php echo $row_teacher['education']; ?></td>
  </tr>
      <?php //find number of research and first research  
		$count=0;  $first=0;
		if ($row_teacher['research1']!=""){$count++; $first=1;}
		if ($row_teacher['research2']!=""){$count++;if ($first==0){$first=2;}}
		if ($row_teacher['research3']!=""){$count++;if ($first==0){$first=3;}}
		if ($row_teacher['research4']!=""){$count++;if ($first==0){$first=4;}}
		if ($row_teacher['research5']!=""){$count++;if ($first==0){$first=5;}}
		?>
    <?php  //create row research if found then print all
  	if ($count!=0){	echo "<tr><td rowspan='$count'  bgcolor='#66CCFF'><div align='center'>สาขาวิชาที่ชำนาญ</div></td>";
							   	if($first==1){echo"<td colspan='2'>$row_teacher[research1]</td>";}
								else if($first==2){echo"<td colspan='2'>$row_teacher[research2]</td>";}
								else if($first==3){echo"<td colspan='2'>$row_teacher[research3]</td>";}
								else if($first==4){echo"<td colspan='2'>$row_teacher[research4]</td>";}
								else{echo"<td colspan='2'>$row_teacher[research5]</td>";}
								echo"</tr>";
							}
	if ($row_teacher['research2']!=""&&$first!=2){echo "<tr><td colspan='2'>$row_teacher[research2]</td></tr>";}
	if ($row_teacher['research3']!=""&&$first!=3){echo "<tr><td colspan='2'>$row_teacher[research3]</td></tr>";}
	if ($row_teacher['research4']!=""&&$first!=4){echo "<tr><td colspan='2'>$row_teacher[research4]</td></tr>";}
	if ($row_teacher['research5']!=""&&$first!=5){echo "<tr><td colspan='2'>$row_teacher[research5]</td></tr>";}	  
 ?>
  <?php //find number of book and first book  
		$count=0;  $first=0;
		if ($row_teacher['book1']!=""){$count++; $first=1;}
		if ($row_teacher['book2']!=""){$count++;if ($first==0){$first=2;}}
		if ($row_teacher['book3']!=""){$count++;if ($first==0){$first=3;}}
		if ($row_teacher['book4']!=""){$count++;if ($first==0){$first=4;}}
		if ($row_teacher['book5']!=""){$count++;if ($first==0){$first=5;}}
		?>
    <?php //create row book if found then print all 
  	if ($count!=0){	echo "<tr><td rowspan='$count'  bgcolor='#66CCFF'><div align='center'>ตำรา</div></td>";
							   	if($first==1){echo"<td colspan='2'>$row_teacher[book1]</td>";}
								else if($first==2){echo"<td colspan='2'>$row_teacher[book2]</td>";}
								else if($first==3){echo"<td colspan='2'>$row_teacher[book3]</td>";}
								else if($first==4){echo"<td colspan='2'>$row_teacher[book4]</td>";}
								else{echo "<td colspan='2'>$row_teacher[book5]</td>";}
								echo"</tr>";
							}
	if ($row_teacher['book2']!=""&&$first!=2){echo "<tr><td colspan='2'>$row_teacher[book2]</td></tr>";}
	if ($row_teacher['book3']!=""&&$first!=3){echo "<tr><td colspan='2'>$row_teacher[book3]</td></tr>";}
	if ($row_teacher['book4']!=""&&$first!=4){echo "<tr><td colspan='2'>$row_teacher[book4]</td></tr>";}
	if ($row_teacher['book5']!=""&&$first!=5){echo "<tr><td colspan='2'>$row_teacher[book5]</td></tr>";}	  
 ?>
    <?php //find subject that teacher teach  
		$query = "SELECT subject_name FROM course left join subject on course.subject_ID=subject.subject_ID where teacher_ID='$row_teacher[teacher_ID]'";
		$subject = mysql_query($query, $conn) or die(mysql_error());
		$row_subject = mysql_fetch_assoc($subject);
		$totalRows_subject = mysql_num_rows($subject);
		?>
    <?php //create row teach_subject if found then print all 
  	if ($totalRows_subject!=0){	echo "<tr><td rowspan='$totalRows_subject'  bgcolor='#66CCFF'><div align='center'>วิชาที่สอน</div></td>";
							  							echo"<td colspan='2'>$row_subject[subject_name]</td>";
														while($row_subject=mysql_fetch_assoc($subject)){echo "<tr><td colspan='2'>$row_subject[subject_name]</td></tr>";}
													} ?>
</table>
</body>
</html>
<?php
mysql_free_result($teacher);
mysql_free_result($subject);
?>
