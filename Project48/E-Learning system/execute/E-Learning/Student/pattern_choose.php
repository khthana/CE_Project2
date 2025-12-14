<?php session_start();?>
<?php require_once('../Connections/conn.php'); ?>
<?php
mysql_select_db($database_conn, $conn);
$query_config = "SELECT * FROM config";
$config = mysql_query($query_config, $conn) or die(mysql_error());
$row_config = mysql_fetch_assoc($config);
$totalRows_config = mysql_num_rows($config);
?>
<?php
  //php function
function print_day($pos){
if($pos==0){$x="จันทร์";}
else if($pos==1){$x="อังคาร";}
else if($pos==2){$x="พุธ";}
else if($pos==3){$x="พฤหัส";}
else if($pos==4){$x="ศุกร์";}
else if($pos==5){$x="เสาร์";}
else if($pos==6){$x="อาทิตย์";}
return $x;
}
function print_learn_time($learn_time){
$pos=0;
$FindTailMode =false;
$first=true;
while ($pos<7){
if(!$FindTailMode){
										if(substr($learn_time,$pos,1)==1){
											if($first){$x=print_day($pos); $first=false;}
											else{$y=print_day($pos); $x="$x,$y";} 
											if(substr($learn_time,$pos+1,1)==1)
											{$x="$x-"; $FindTailMode=true;}
										}
									}
else if (substr($learn_time,$pos+1,1)==0 ||  $pos==6){$y=print_day($pos); $x="$x$y"; $FindTailMode=false;}
$pos++;
}//while
return $x;
}//function
function decodeDay_month_Year($x){
	$month =substr($x,3,2);
	if($month=="01"){$replace="ม.ค.";}
	else if($month=="02"){$replace="ก.พ.";}
	else if($month=="03"){$replace="มี.ค.";}
	else if($month=="04"){$replace="เม.ษ.";}
	else if($month=="05"){$replace="พ.ค.";}
	else if($month=="06"){$replace="มิ.ย.";}
	else if($month=="07"){$replace="ก.ค.";}
	else if($month=="08"){$replace="ส.ค.";}
	else if($month=="09"){$replace="ก.ย.";}
	else if($month=="10"){$replace="ต.ค.";}
	else if($month=="11"){$replace="พ.ย.";}
	else if($month=="12"){$replace="ธ.ค.";}
	 $x=substr_replace($x,$replace,3,2);
	 $x=str_replace("/"," ",$x);
	 return $x;
}
?>
<?php
		//check course_ID ใหม่ไปซ้ำกับของเก่าที่เคยลงทะเบียนไว้แล้ว
	
if ($edit==1){
					//////////////////////////////////////////////เปลี่ยนวิชา	//////////////////////////////////////
					//เช็คกับฐานข้อมูลว่าคอร์สที่จะเปลี่ยนซ้ำกะคอร์สเดิมที่เคยลงทะเบียนไว้หรือไม่
					$sql="Select * from register where course_ID like '$course_ID' and student_ID='$_SESSION[student_ID]' ";
					$same =mysql_query($sql,$conn);
					$total_row=mysql_num_rows($same);
					if($total_row<>0){//กรณีเปลี่ยนซ้ำ
							echo"<script>alert('คอร์สใหม่ที่เลือกซ้ำกับคอร์สเดิมที่ลงทะเบียนไปแล้ว');</script>";
							if($pos=="1"){echo" <script>
						 	opener.document.form1.selectR1.selectedIndex='0';
							window.close();
 					 		</script>";
							}
							if($pos=="2"){echo" <script>
						 	opener.document.form1.selectR2.selectedIndex='0';
							window.close();
 					 		</script>";
							}if($pos=="3"){echo" <script>
						 	opener.document.form1.selectR3.selectedIndex='0';
							window.close();
 					 		</script>";
							}if($pos=="4"){echo" <script>
						 	opener.document.form1.selectR4.selectedIndex='0';
							window.close();
 					 		</script>";
							}if($pos=="5"){echo" <script>
						 	opener.document.form1.selectR5.selectedIndex='0';
							window.close();
 					 		</script>";
							}if($pos=="6"){echo" <script>
						 	opener.document.form1.selectR6.selectedIndex='0';
							window.close();
 					 		</script>";
							}if($pos=="7"){echo" <script>
						 	opener.document.form1.selectR7.selectedIndex='0';
							window.close();
 					 		</script>";
						}
					}//total_row <> 0
					else{//วิชาที่เปลี่ยนไม่ซ้ำ
							$sql= "SELECT * FROM subject left join course on subject.subject_ID=course.subject_ID WHERE course_ID = '$course_ID'";
							$course=mysql_query($sql,$conn);
							$row_course=mysql_fetch_assoc($course);
							$learn_start=decodeDay_month_Year($row_course['learn_start']);
							$learn_day=print_learn_time($row_course[learn_time]);
							$learn_time=substr($row_course['learn_time'],8,11);
							$register_value=$row_course['subject_point']*$row_config['register_value'];
							if($pos=="1"){ echo" <script>
					 		opener.document.form1.course_ID1.value='$course_ID';
				 			opener.document.form1.learn_start1.value='$learn_start';
				 			opener.document.form1.learn_day1.value='$learn_day';
							opener.document.form1.learn_time1.value='$learn_time';
		      				opener.document.form1.register_value1.value='$register_value';
							window.close();
 					 		</script>";}
					 		else if($pos=="2"){ echo" <script>
					 		opener.document.form1.course_ID2.value='$course_ID';
				 			opener.document.form1.learn_start2.value='$learn_start';
				 			opener.document.form1.learn_day2.value='$learn_day';
							opener.document.form1.learn_time2.value='$learn_time';
		      				opener.document.form1.register_value2.value='$register_value';
							window.close();
 					 		</script>";}
					 		else if($pos=="3"){ echo" <script>
					 		opener.document.form1.course_ID3.value='$course_ID';
				 			opener.document.form1.learn_start3.value='$learn_start';
				 			opener.document.form1.learn_day3.value='$learn_day';
							opener.document.form1.learn_time3.value='$learn_time';
		      				opener.document.form1.register_value3.value='$register_value';
							window.close();
 					 		</script>";}
					 		else if($pos=="4"){ echo" <script>
					 		opener.document.form1.course_ID4.value='$course_ID';
				 			opener.document.form1.learn_start4.value='$learn_start';
				 			opener.document.form1.learn_day4.value='$learn_day';
							opener.document.form1.learn_time4.value='$learn_time';
		      				opener.document.form1.register_value4.value='$register_value';
							window.close();
 					 		</script>";}
					 		else if($pos=="5"){ echo" <script>
					 		opener.document.form1.course_ID5.value='$course_ID';
				 			opener.document.form1.learn_start5.value='$learn_start';
				 			opener.document.form1.learn_day5.value='$learn_day';
							opener.document.form1.learn_time5.value='$learn_time';
		      				opener.document.form1.register_value5.value='$register_value';
							window.close();
 					 		</script>";}
					 		else if($pos=="6"){ echo" <script>
					 		opener.document.form1.course_ID6.value='$course_ID';
				 			opener.document.form1.learn_start6.value='$learn_start';
				 			opener.document.form1.learn_day6.value='$learn_day';
							opener.document.form1.learn_time6.value='$learn_time';
		      				opener.document.form1.register_value6.value='$register_value';
							window.close();
 					 		</script>";}
					 		else if($pos=="7"){ echo" <script>
					 		opener.document.form1.course_ID7.value='$course_ID';
				 			opener.document.form1.learn_start7.value='$learn_start';
				 			opener.document.form1.learn_day7.value='$learn_day';
							opener.document.form1.learn_time7.value='$learn_time';
		      				opener.document.form1.register_value7.value='$register_value';
							window.close();
 					 		</script>";}
						}//else
		}
		
else{
		//////////////////////////////////////////////ลงทะเบียนวิชา	//////////////////////////////////////
		//หา subject_ID ของคอร์สที่เลือกก่อน
		$sql="select subject_ID from course where course_ID='$course_ID'";
		$subject_ID=mysql_query($sql,$conn);
		$row_subject_ID=mysql_fetch_assoc($subject_ID);
		//เช็คกับฐานข้อมูลว่ามีคอร์สที่ลงไว้รหัสวิชาเดียวกันหรือไม่
		$sql="Select * from register left join course on register.course_ID =course.course_ID where subject_ID like '$row_subject_ID[subject_ID]' and student_ID='$_SESSION[student_ID]' ";
		$same =mysql_query($sql,$conn);
		$total_row=mysql_num_rows($same);
		//วิชาที่ลงทะเบียนเคยลงไปแล้ว
		if($total_row<>0){
		echo "<script>alert('วิชานี้เคยลงทะเบียนไปแล้ว')</script>"; 
		echo "<meta http-equiv='refresh' content='0 URL=../subject_show.php'";
		}
	  	else{//ลงทะเบียนได้
		echo"<meta http-equiv='refresh' content='0;URL=register_show.php?course_ID=$course_ID'>";}
}

?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Pattern Choose</title>
</head>

<body>

</body>
</html>
<?php
mysql_free_result($config);
?>
