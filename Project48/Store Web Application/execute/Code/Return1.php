<HTML>
<HEAD>
<TITLE> บันทึกค่าการคืนในตาราง </TITLE>

</HEAD>
<BODY bgcolor="#6633FF"  background='bg_table.jpg' tppabs='bg_table.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF" >
<?php
$ID = $HTTP_POST_VARS["ID"];
$Hard_ID = $HTTP_POST_VARS["Hard_ID"];

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
			}
		}
		return $year.$month.$day;
	}

	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql="SELECT * FROM userprofile WHERE User_ID = '$ID'";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	$record = mysql_fetch_row($result);

	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql1="SELECT * FROM borrow WHERE User_ID = '$ID' and Borrow_ID='$Hard_ID'";
	$result1=mysql_query($sql1);
	$number1=mysql_num_rows($result1);
	$record1= mysql_fetch_row($result1);
	
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql5="SELECT * FROM borrow WHERE User_ID = '$ID'";	
	$result5=mysql_query($sql5);
	$number5=mysql_num_rows($result5);			//check อุปกรณ์ว่ายืมกี่ชิ้น
	
	mysql_query("SET NAMES tis620");
	mysql_select_db("store");
	$sql2="SELECT * FROM hardware WHERE HW_ID = '$Hard_ID'";
	$result2=mysql_query($sql2);
	$number2=mysql_num_rows($result2);
	$record2= mysql_fetch_row($result2);

	
	if ( $number1 != 0 ) 
	{
		if(($record1[1] == $ID) & ($record1[0]==$Hard_ID)){		
			mysql_query("SET NAMES tis620");
			mysql_select_db("store");
			$update="UPDATE userprofile SET Status = '' WHERE User_ID ='$ID'"; 
			$update1= mysql_db_query("store",$update);
		
			if($number5 > 1 ){           //กรณีที่ยืม 2 ชิ้น
					mysql_query("SET NAMES tis620");
					$updateteacher="UPDATE userprofile SET Status = 'borrow' WHERE User_ID ='$ID'"; 
					$updateteacher1= mysql_db_query("store",$updateteacher);
			}
			mysql_query("SET NAMES tis620");
			$updateStatus="UPDATE hardware SET HW_Status = 'yes' WHERE HW_ID ='$Hard_ID'" ;
			$updateStatus1=mysql_db_query("store",$updateStatus);
			mysql_query("SET NAMES tis620");
			mysql_select_db("store");
			$sql="Delete from borrow where User_ID = '$ID' and borrow_ID =  '$Hard_ID'";
			$result=mysql_query($sql);

			mysql_query("SET NAMES tis620");
			mysql_select_db("store");
			$sql="Delete from return where User_ID = '$ID' and Return_ID =  '$Hard_ID'";
			$result=mysql_query($sql);

//check date
			$Today=date("Ymd");
			list($y1,$m1,$d1)=split("-",$Today);
			$Today1=$y1.$m1.$d1;		
			$temp= $record1[2];			//วันที่ยืม
			list($y,$m,$d)=split("-",$temp);
			$borrowday=$y.$m.$d;
			$returnday=$d+$record2[5];
			$reday=checkdd($returnday,$m,$y);
			$Thisday= $Today1[6].$Today1[7];
			$Thismonth= $Today1[4].$Today1[5];
			$retmonth=$reday[4].$reday[5];
			$retday=$reday[6].$reday[7];
			$resultdd=0;
			if( $retmonth <= $Thismonth){
				$resultdd=$Thisday-$retday;
			}
			if($record[6]=='student' & ($resultdd > 0)) {    
				echo "<div align='center'><b>รหัสอุปกรณ์</b> $record1[0]  <b>ชื่ออุปกรณ์</b> $record2[1] <font color=red> คุณยืมเกินกำหนด $resultdd  วัน</font></div><br>";
				$blacklist="UPDATE userprofile SET  Blacklist = 'Yes' WHERE User_ID =$ID";
				$updateblacklist=mysql_db_query("store",$blacklist);
			}else{
				echo "<div align='center'><b>รหัสอุปกรณ์</b> $record1[0]  <b>ชื่ออุปกรณ์</b> $record2[1] ได้ทำการคืนเรียบร้อยแล้ว.</div>  ";
				}
			}else{
				echo "<div align='center'>ใส่รหัส<font color=red> ผิด</font> โปรดใส่ใหม่.</div>";
				}
	}else{
		echo "<div align='center'>ใส่รหัส<font color=red>ผิด</font> โปรดใส่ใหม่.</div>";
	}
			echo " <Form Action='Return.php' method ='post' >
			<div align='center' ><input type='submit' value='กลับ' ></div>
			</form>";
?>
</BODY>
</HTML>