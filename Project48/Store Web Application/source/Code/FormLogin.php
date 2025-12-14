<html>
<head>
<title>:: ห้องสโตร์ ภาควิชาวิศวกรรมคอมพิวเตอร์ คณะวิศวกรรมศาสตร์ สจล. ::  </title>
<meta http-equiv='Content-Type' content='text/html; charset=windows-874'>
</head>

<body bgcolor='#99FFFF'  background='bg_table.jpg' tppabs='bg_table.jpg'>
<form name='FormLogin' method='post' action='formlogin.php'>
<?php
echo "<div align='center'><strong><font size=6 color=#669900> <b><p>ห้อง Store ภาควิชาวิศวกรรมคอมพิวเตอร์ </p></b></font></strong> </div> ";

function next_month($month, $year)
     {
               if ($month%12==0)
               {
               $month=$month-11;
               $year=$year+1;
               }
               else        
               {
               $month=$month+1;
               $year=$year;
               }
     return $month;
     return $year;
     }
function checkdd($day,$month,$year)
	{
		if($month == "4" or $month == "6" or $month == "9" or $month == "11" ){
			if($day >30){
				$day= $day-30;
				$month++;
			}
		}else if($month == "1" or $month == "3" or $month == "5" or $month == "7" or $month == "8" or $month == "10" or $month == "12"){
			if($day>31){
				$day=$day-31;
				$month++;
				if($month=="2"){
					$month="02";
				}else if($month=="4"){
					$month="04";
				}else if($month=="6"){
					$month="06";
				}else if($month=="8"){
					$month="08";
				}else if($month=="9"){
					$month="09";
				}
				if($month=="13"){
				    $month="01";
					$year=$year+1;
               }
			}
		} 
		else{
			if($day>28){
				$day=$day-28; 
				$month++;
				if($month=="3"){
					$month="03";
				}
				if($day=="1"){
					$day="01";
				}else if($day=="2"){
					$day="02";
				}else if($day=="3"){
					$day="03";
				}else if($day=="4"){
					$day="04";
				}else if($day=="5"){
					$day="05";
				}else if($day=="6"){
					$day="06";
				}else if($day=="7"){
					$day="07";
				}
			}
			
		}
		return $year.$month.$day;
	}
				
function datethai($date)
{
	$day=substr("$date",6,2);
	$month=substr("$date",4,2);
	$month=(int)$month -1;
	$year =substr("$date",0,4);
	$year=$year+543;
	$thaimonth=array("มกราคม","กุมภาพันธ์","มีนาคม","เมษายน","พฤษภาคม","มิถุนายน","กรกฏาคม","สิงหาคม","กันยายน","ตุลาคม","พฤศจิกายน","ธันวาคม");
	$month=$thaimonth[$month];
	return (int)$day." ". $month." ".$year;
}

 $btLogin = $HTTP_POST_VARS["btLogin"];
 $user_login  = $HTTP_POST_VARS["user_login"];
$md5pass = $HTTP_POST_VARS["pass_login"];
$md5pass=md5($pass_login);

if  ( $btLogin == "Log in" )
{
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="select Level,User_Name,Password,User_ID,Name,Sname from userprofile where User_Name='$user_login' and Password='$md5pass' ";
	$result=mysql_query($sql);
	$num=mysql_num_rows($result);
	$record=mysql_fetch_row($result);
	setcookie("xUser_ID",$record[3],time()+3600);

		if ($num != 0 )
		{
			$Today=date("Ymd");
			echo "<div align='right'><font color=#CC6666><b>วันที่ ";
			echo  datethai($Today);
			echo "</font></div>";
			$checkadmin=$record[0];
			if( $record[0] == "admin")
			{
				 echo "
				 <font color=#CC3333>สถานะ </font>
				 <font color=#CC00FF>ผู้ดูแลระบบ</font>
				<table width='100%' border='2' bordercolor='#3366FF'>
				 <tr>
				<td bgcolor=#C8FDCE width='16.6%'><div align='center'><a href='FormInsert.php' target='MainFrame'>การเพิ่ม</a></div></td>
				<td bgcolor=#C8FDCE width='16.6%'><div align='center'><a href='tborrow.php' target='_blank'> การยืม</a></div></td>
				<td bgcolor=#C8FDCE width='16.6%'><div align='center'> <a href='return.php' target='_blank'>การคืน </a></div></td>
				<td bgcolor=#C8FDCE width='16.6%'><div align='center'><a href='find_for_admin.php' target='_blank'> ค้นหา</a> </div></td>
				<td bgcolor=#C8FDCE width='16.6%'><div align='center'> <a href='data.php' target='_blank'>ข้อมูล </a></div></td>
				<td bgcolor=#C8FDCE width='16.6%'><div align='center'><a href='formlogin.php' >ออกจากระบบ</a></div></td>
				  </tr>
				</table> "; 
			 $setshowword=2;		
			}else if($record[0] == "teacher" ){
			 echo "<font color=#9900CC>สถานะ </font> <font color=#669933>อาจารย์</font>
			 <table width='100%' border='2' bordercolor='#3366FF'>
			  <tr>
			   	 <td bgcolor=#FFFFD7 width='25%'><div align='center'><a href='find_for_teacher.php'  target='_blank'> ค้นหา </a></div></td>
	    		 <td  bgcolor=#FFFFD7 width='25%'><div align='center'><a href='Edit_for_Teacher.php' target='NewFrame'''> แก้ไขข้อมูลส่วนตัว</a></div></td>
				 <td  bgcolor=#FFFFD7 width='25%'><div align='center'> <a href='data1.php' target='_blank'>ข้อมูล</a></div></td>
				 <td  bgcolor=#FFFFD7 width='25%'><div align='center'><a href='formlogin.php' >ออกจากระบบ</a></div></td>
			  </tr>
			</table> ";
			  $setshowword=2;
			 echo " <br><font color=#6633FF> $record[4]     $record[5]  ";
			}else if($record[0] == "staff" ){
			 echo "<font color=#9900CC>สถานะ </font> <font color=#996600>เจ้าหน้าที่</font>
			 <table width='100%' border='2' bordercolor='#3366FF'>
			  <tr>
			   	 <td bgcolor=#FFFFD7 width='25%'><div align='center'><a href='find_for_teacher.php'  target='_blank'> ค้นหา </a></div></td>
	    		 <td  bgcolor=#FFFFD7 width='25%'><div align='center'><a href='Edit_for_staff.php' target='NewFrame'''> แก้ไขข้อมูลส่วนตัว</a></div></td>
				 <td  bgcolor=#FFFFD7 width='25%'><div align='center'> <a href='data1.php' target='_blank'>ข้อมูล</a></div></td>
				 <td  bgcolor=#FFFFD7 width='25%'><div align='center'><a href='formlogin.php' >ออกจากระบบ</a></div></td>
			  </tr>
			</table> ";
			  $setshowword=2;
			 echo " <br><font color=#6633FF> $record[4]     $record[5]  ";
			}else if( $record[0] == "student" ){
				echo "<font color=#9900CC>สถานะ </font> <font color=#336633>นักศึกษา</font>
				<table width='100%' border='2' bordercolor='#3366FF'>
				  <tr>
					 <td bgcolor=#FFE8DD width='30%'><div align='center'><a href='Edit_for_Student' target='NewFrame'''> แก้ไขข้อมูล</a></div></td>
					<td bgcolor=#FFE8DD width='30%'><div align='center'><a href='find_for_student' target='NewFrame'''> ค้นหา </a></div></td>
					<td bgcolor=#FFE8DD width='30%'><div align='center'><a href='formlogin.php' >ออกจากระบบ</a></div></td>
				 </tr>
			</table> ";
			 $setshowword=2;
			  echo "<br><font color=#6633FF> $record[4]     $record[5]  รหัสนักศึกษา $record[3] </font>";
			}
		}else {
			echo "<br><font color=red>User Name หรือ Password  ของคุณผิด !  โปรดใส่ใหม่ </font>";
			$setshowword=1;
		}
	
	echo "<br><br>";

	mysql_query("SET NAMES tis620"); 
	mysql_select_db("store");	
	$sql1="SELECT b.User_ID, a.*,c.Borrow_Day  FROM hardware a, userprofile b, borrow c 
	WHERE b.User_Name ='$user_login' and b.Password = '$md5pass' and b.User_ID = c.User_ID and a.HW_ID = c.Borrow_ID";
	$result1=mysql_query($sql1);
	$number1=mysql_num_rows($result1);

	if ( $number1 != 0 ) 
	{ 
		echo "<br><font color=#FF0033 size=4>รายการที่คุณทำการยืม <br><br></font>";
		echo " <TABLE width='600' border='1' >
			<TR>
			<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>วันที่ทำการยืม</b></font></TD>
			<TD bgcolor=#FFCCFF><font color=#330066><b>วันที่กำหนดส่งคืน</b></font></TD>
			</TR> ";
		while ($record = mysql_fetch_row($result1))
		{
			$temp=$record[9];	
			list($y,$m,$d)=split("-",$temp);
			$borrowday=$y.$m.$d;
		    $borrowthaiday=datethai($borrowday);
			$returnday=$d+$record[6];
			$reday=checkdd($returnday,$m,$y);
			$returnthaiday=datethai($reday);
			$chkday=$returnthaiday[0].$returnthaiday[1];
			$chkmonth=$reday[4].$reday[5];
			$currentday=$Today[6].$Today[7];
			$currentmonth=$Today[4].$Today[5];
			echo " 
			<TR>
			<TD bgcolor=#CCFFCC><font color= blue>$record[1] </font></TD>
			<TD bgcolor=#FFCC99>$record[2]</TD>
			<TD bgcolor=#FFCC99>$borrowthaiday</TD>";

			if(($chkday < $currentday) or ($chkmonth < $currentmonth)){
					echo "<TD bgcolor=#FFCC99><font color= red>$returnthaiday <img src='pic1.gif '></font></TD>";
			}else{
					echo "<TD bgcolor=#FFCC99><font color= red>$returnthaiday</font></TD>";
			}			
		echo"</TR> ";		
		}
		
		echo "</TABLE>  ";
	}else
	{
		if($checkadmin!="admin" & $setshowword==2)
			echo "<font color=#6633FF><br><br>คุณไม่มีรายการยืม .</font>";
	}

	if($record[0] == "admin"){   //check บุคคลยืมเกินกำหนด
			$Today1=date("Ymd");
			list($y,$m,$d)=split("-",$Today1);
			$day1=$y.$m.$d;
			mysql_query("SET NAMES tis620"); 
			mysql_select_db("store");	
			$sqlreturn="SELECT * FROM return ";
			$resultreturn=mysql_query($sqlreturn);
			$numberreturn=mysql_num_rows($resultreturn);			

			while ($recordtype = mysql_fetch_row($resultreturn)){
					$resultday=$recordtype[2]-$day1;
					if($resultday < 0){				//check เกินกำหนด
						mysql_query("SET NAMES tis620"); 
						mysql_select_db("store");	
						$sql11="SELECT c.User_ID, a.*,c.Borrow_Day,b.Name,b.Sname  FROM hardware a, userprofile b, borrow c 
						WHERE c.User_ID ='$recordtype[1]' and  a.HW_ID = '$recordtype[0]' and c.Borrow_ID ='$recordtype[0]' and b.User_ID='$recordtype[1]'";
						$result11=mysql_query($sql11);
						$number11=mysql_num_rows($result11);
						$record = mysql_fetch_row($result11);
						
						if($setshow != 'yes'){
							echo"<font color=#666600>รายชื่อผู้ยืมเกินกำหนด</font>";
							echo"<TABLE width='800' border='1' >
							<TR>
							<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสอุปกรณ์</b></font></TD>
							<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่ออุปกรณ์</b></font></TD>
							<TD bgcolor=#FFCCFF><font color=#330066><b>รหัสผู้ยืม</b></font></TD>
							<TD bgcolor=#FFCCFF><font color=#330066><b>ชื่อผู้ยืม</b></font></TD>
							<TD bgcolor=#FFCCFF><font color=#330066><b>วันที่ทำการยืม</b></font></TD>
							<TD bgcolor=#FFCCFF><font color=#330066><b>วันที่กำหนดส่งคืน</b></font></TD>
							</TR>";	
								$setshow = yes ;
						}
							$temp=$record[9];	
							list($y,$m,$d)=split("-",$temp);
							$borrowday=$y.$m.$d;
							$borrowthaiday=datethai($borrowday);
							$returnday=$d+$record[6];
							$reday=checkdd($returnday,$m,$y);
							$returnthaiday=datethai($reday);
							echo " 
							<TR>
								<TD bgcolor=#CCFFCC><font color= blue>$record[1] </font></TD>
								<TD bgcolor=#FFCC99>$record[2]</TD>
								<TD bgcolor=#FFCC99>$record[0]</TD>
								<TD bgcolor=#FFCC99>$record[10]&nbsp;$record[11]</TD>
								<TD bgcolor=#FFCC99>$borrowthaiday</TD>
								<TD bgcolor=#FFCC99><font color= red>$returnthaiday <img src='pic1.gif '></font></TD>
							 </TR>";		
					}	
			}echo "</TABLE>  ";
	}
}
if($num == 0 )
{
	 echo "
	<br><br><br>
	<table width='300' border='1' align='center' bordercolor='#3366FF'>


	 <tr bgcolor='#99FFFF'>
	   <td width='70' background='bg_table.jpg' tppabs='bg_table.jpg'> </td>
		<td colspan='2' bgcolor='#99CCFF' ><font color='#6633FF'><div align='center' > กรุณา Login </div></font></td>
	
	 </tr>

	  <tr bgcolor='#99CCFF'>
	    <td width='70'><font color='#6633FF'><div align='center' > User </div></font></td>
	    <td colspan='2'><div align='center' > <input name='user_login' type='text' maxlength='20' ></div></td>
	  </tr>

	  <tr bgcolor='#99CCFF'>
	    <td width='70'><font color='#6633FF'><div align='center' > Password </div></font></td>
	    <td colspan='2'> <div align='center' > <input name='pass_login' type='password' maxlength='10'> </div></td>
	  </tr>

	  <tr>
	    <td width='70' bgcolor='#99FFFF' background='bg_table.jpg' tppabs='bg_table.jpg'> </td>
	    <td width='90' bgcolor='#99CCFF'> <div align='center'> <input name='btLogin' type='submit'  value='Log in'></div></td>
	    <td width='90' bgcolor='#99CCFF'> <div align='center'> <input name='btCancel' type='submit'  value='Logout'></div></td>
	  </tr>
  
	 <tr>
	     <td width='70' bgcolor='#99FFFF' background='bg_table.jpg' tppabs='bg_table.jpg'> </td>
	 	<td width='90' bgcolor='#99CCFF'> <div align='center'></td>
		<td width='90' bgcolor='#99CCFF'> <div align='center'> <a href ='forgetpw.php'> ลืมรหัสผ่าน </a></div></td>
	 </tr>

</table>";
}
?>
</form>
</body>
</html>
