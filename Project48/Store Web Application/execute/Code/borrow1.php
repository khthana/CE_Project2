<HTML>
<HEAD>
<TITLE> บันทึกค่าการเพิ่มสมาชิกในตาราง </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<BODY bgcolor="#6633FF"  background='bg_table.jpg' tppabs='bg_table.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF">

<?php
$ID = $HTTP_POST_VARS["ID"];
$Name = $HTTP_POST_VARS["Name"];
$Amount = $HTTP_POST_VARS["Amount"];


if (($ID=="") or ($Name=="") or ($Amount=="") )
{
echo " <br><br><div align='center'> โปรดกรอกข้อมูลให้ครบ </font> </div>";
}
Else
{
	mysql_select_db("store");
	$sql="SELECT a.*,b.HW_Name,b.HW_Status,c.Acces_Name  FROM userprofile a,hardware b,accessory c WHERE a.User_ID ='$Name' and b.HW_ID='$ID' ";
	$result=mysql_query($sql);
	$number=mysql_num_rows($result);
	$record = mysql_fetch_row($result);

	mysql_select_db("store");
	$sql1="SELECT a.*,b.User_ID FROM accessory a,userprofile b  WHERE a.Acces_ID ='$ID' and b.User_ID='$Name'";
	$result1=mysql_query($sql1);
	$number1=mysql_num_rows($result1);
	$record1= mysql_fetch_row($result1);


if ( $number != 0 ) {
		if($record[6] == "student" and $record[7] =="borrow"){
				echo "<div align='center'>ไม่สามารถยืมอุปกรณ์ได้ เนื่องจากยังไม่ได้คืนอุปกรณ์ตัวเก่า.</div>";
		}else if($record[14]== "yes"){
			$Today=date("Ymd");
			mysql_select_db("store");
			$ordersresult = "Insert into borrow(Borrow_ID,User_ID,Borrow_Day) values ('$ID','$Name','$Today')";
			$dbquery = mysql_db_query("store",$ordersresult);
			mysql_select_db("store");
			$update="UPDATE userprofile SET Status = 'borrow' WHERE User_ID ='$record[0]'"; 
			$update1= mysql_db_query("store",$update);
			$updateStatus="UPDATE hardware SET HW_Status = 'no' WHERE HW_ID ='$ID' " ;
			$updateStatus1=mysql_db_query("store",$updateStatus);
			echo "<div align='center'> ยืมอุปกรณ์เรียบร้อย <br> </div> ";
			echo "<br>&nbsp; &nbsp; รหัสอุปกรณ์ $ID"." &nbsp;&nbsp; "."ชื่ออุปกรณ์&nbsp;&nbsp;".$record[12];
			echo "<br>&nbsp; &nbsp; ชื่อ $record[1]"." ".$record[2];
			echo "&nbsp; &nbsp; รหัส $record[0] ";

			mysql_select_db("store");
			$sql="SELECT a.HW_ID,a.HW_Name,b.User_ID,b.Name,b.Sname,c.Borrow_Day,b.Level FROM hardware a, userprofile b, borrow c 
			WHERE a.HW_ID ='$ID' and b.User_ID = '$Name'";
			$result=mysql_query($sql);
			$number=mysql_num_rows($result);
			 $record = mysql_fetch_row($result);
			 $name1=$record[3]." ".$record[4];
			 $ordersresult1 = "Insert into hisborrow(obj_ID,obj_Name,user_ID,user_Name,status,date) values ('$record[0]','$record[1]','$record[2]','$name1','$record[6]','$record[5]')";
			$dbquery1 = mysql_db_query("store",$ordersresult1);
			}else{
				echo "<div align='center'>อุปกรณ์ตัวนี้ถูกยืมไปแล้ว ไม่สามารถยืมได้.</div>";
			}
	}else if ( $number1 != 0 ){
		if($record1[3] != 0 ){
				$remain=$record1[3]-$Amount;
				$updateAcces="UPDATE accessory SET Acces_Remain = '$remain' WHERE Acces_ID = '$ID'";
				$update1= mysql_db_query("store",$updateAcces);
				$Today=date("Y-m-d");
				mysql_select_db("store");
				$sql4="SELECT a.Acces_ID,a.Acces_Name,b.User_ID,b.Name,b.Sname,c.Borrow_Day,b.Level FROM accessory a, userprofile b, borrow c 
				WHERE a.Acces_ID ='$ID' and b.User_ID = '$Name'";
				$result4=mysql_query($sql4);
				$number4=mysql_num_rows($result4);
				 $record4= mysql_fetch_row($result4);
				 $name1=$record4[3]." ".$record4[4];
				 $ordersresult4 = "Insert into hisborrow(obj_ID,obj_Name,user_ID,user_Name,status,date) values ('$record4[0]','$record4[1]','$record4[2]','$name1','$record4[6]','$Today')";
				$dbquery4 = mysql_db_query("store",$ordersresult4);
				echo"<div align='center'>ยืมอุปกรณ์ $record1[1] จำนวน $Amount ตัวเรียบร้อยแล้ว.</div>";
		}else{
			echo"<div align='center'>อุปกรณ์ตัวที่ต้องการหมด</div>";
		}
	}else{
		echo"<div align='center'>ใส่รหัสอุปกรณ์หรือรหัสสมาชิก <font color=red>ผิด</font></div>";
	}
}
?>
<form action="borrow.php" method="POST">
 <div align='center' ><input type="submit" value="กลับไปกรอกข้อมูลใหม่"></div>
</form>
</td>
</tr></table>

</BODY>
</HTML>
