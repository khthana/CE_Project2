<HTML>
<HEAD>
<TITLE> บันทึกค่าการยืมอุปกรณ์ </TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">

</HEAD>
<BODY bgcolor="#6633FF"  background='bg_table.jpg' tppabs='bg_table.jpg'>
<br><br>
<table width="65%" height="80%" align="center" bordercolor="#66CCFF">
  <tr><td bgcolor="#66CCFF">

<?php

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

$Bill_ID = $HTTP_POST_VARS["Bill_ID"];
$ID = $HTTP_POST_VARS["ID"];
$Name = $HTTP_POST_VARS["Name"];

$Obj_ID[1]= $HTTP_POST_VARS["Obj_ID1"];
$Obj_Name[1]= $HTTP_POST_VARS["Obj_Name1"];
$Amount[1]= $HTTP_POST_VARS["Amount1"];

$Obj_ID[2]= $HTTP_POST_VARS["Obj_ID2"];
$Obj_Name[2]= $HTTP_POST_VARS["Obj_Name2"];
$Amount[2]= $HTTP_POST_VARS["Amount2"];

$Obj_ID[3]= $HTTP_POST_VARS["Obj_ID3"];
$Obj_Name[3]= $HTTP_POST_VARS["Obj_Name3"];
$Amount[3]= $HTTP_POST_VARS["Amount3"];

$Obj_ID[4]= $HTTP_POST_VARS["Obj_ID4"];
$Obj_Name[4]= $HTTP_POST_VARS["Obj_Name4"];
$Amount[4]= $HTTP_POST_VARS["Amount4"];

$Obj_ID[5]= $HTTP_POST_VARS["Obj_ID5"];
$Obj_Name[5]= $HTTP_POST_VARS["Obj_Name5"];
$Amount[5]= $HTTP_POST_VARS["Amount5"];

$Obj_ID[6]= $HTTP_POST_VARS["Obj_ID6"];
$Obj_Name[6]= $HTTP_POST_VARS["Obj_Name6"];
$Amount[6]= $HTTP_POST_VARS["Amount6"];

$Obj_ID[7]= $HTTP_POST_VARS["Obj_ID7"];
$Obj_Name[7]= $HTTP_POST_VARS["Obj_Name7"];
$Amount[7]= $HTTP_POST_VARS["Amount7"];

$Obj_ID[8]= $HTTP_POST_VARS["Obj_ID8"];
$Obj_Name[8]= $HTTP_POST_VARS["Obj_Name8"];
$Amount[8]= $HTTP_POST_VARS["Amount8"];

$Obj_ID[9]= $HTTP_POST_VARS["Obj_ID9"];
$Obj_Name[9]= $HTTP_POST_VARS["Obj_Name9"];
$Amount[9]= $HTTP_POST_VARS["Amount9"];

$Obj_ID[10]= $HTTP_POST_VARS["Obj_ID10"];
$Obj_Name[10]= $HTTP_POST_VARS["Obj_Name10"];
$Amount[10]= $HTTP_POST_VARS["Amount10"];


if (($ID=="") or ($Obj_ID[1]=="") or ($Bill_ID==""))
{
echo "<br><br><div align='center'>โปรดกรอกข้อมูลให้ครบ </font> </div>";
}
Else
{
	for($i=1;$i<11;$i++){
		mysql_query("SET NAMES tis620"); 
		mysql_select_db("store");
		$sql="SELECT a.*,b.HW_Name,b.HW_Status,c.Acces_Name  FROM userprofile a,hardware b,accessory c WHERE a.User_ID ='$ID' and 	b.HW_ID='$Obj_ID[$i]' ";
		$result=mysql_query($sql);
		$number=mysql_num_rows($result);
		$record = mysql_fetch_row($result);

		mysql_select_db("store");
		$sql1="SELECT a.*,b.User_ID FROM accessory a,userprofile b  WHERE a.Acces_ID ='$Obj_ID[$i]' and b.User_ID='$ID'";
		$result1=mysql_query($sql1);
		$number1=mysql_num_rows($result1);
		$record1= mysql_fetch_row($result1);

		mysql_select_db("store");
		$sqltype1="SELECT * FROM hardware  where HW_ID='$Obj_ID[$i]' ";
		$resulttype1=mysql_query($sqltype1);                      //check  type hardware borrow
		$numbertype1=mysql_num_rows($resulttype1);
		$recordtype1= mysql_fetch_row($resulttype1);

		mysql_select_db("store");
		$sqltype="SELECT * FROM borrow where User_ID='$ID' ";
		$resulttype=mysql_query($sqltype);
		$numbertype=mysql_num_rows($resulttype);

		while ($recordtype = mysql_fetch_row($resulttype)){
			if($recordtype1[7]==$recordtype[4]){
				$Obj_Borrow =	$i;
					}	
			}
if($setpassword != 'no'){
	if ( $number != 0 ) {
		if($name==''){
			echo "&nbsp;&nbsp;&nbsp;<b>ชื่อ $record[1]"." $record[2]"." </b>";
			echo "&nbsp; &nbsp; <b>รหัส $record[0] </b><br><br> ";
			$name = yes;
			$setpassword=yes;
		}
		if($record[12]=='Yes'){					//check  Black List 
			echo" &nbsp; &nbsp;ไม่สามารถยืมอุปกรณ์ได้ เนื่องจากมี <font color=red><b> Black List </b></font>อยู่. ";
			$setpassword=yes;
		}else if($Obj_Borrow == $i){
			echo "<font color=red>ไม่สามารถยืมอุปกรณ์</font><b> รหัสอุปกรณ์</b> $Obj_ID[$i] <b>ชื่ออุปกรณ์</b> $recordtype1[1] ตัวนี้ได้ เนื่องจากมีการยืมอุปกรณ์แบบนี้ไปก่อนแล้ว.<br> ";
			$setpassword=yes;
		}else if($record[14]== "yes"){
				$Today=date("Ymd");
				mysql_query("SET NAMES tis620"); 
				mysql_select_db("store");
				$ordersresult = "Insert into borrow(Borrow_ID,User_ID,Borrow_Day,Bill_ID,Type) values ('$Obj_ID[$i]','$ID','$Today','$Bill_ID','$recordtype1[7]')";
				$dbquery = mysql_db_query("store",$ordersresult);
				mysql_query("SET NAMES tis620"); 
				mysql_select_db("store");
				$update="UPDATE userprofile SET Status = 'borrow' WHERE User_ID ='$record[0]'"; 
				$update1= mysql_db_query("store",$update);
				$updateStatus="UPDATE hardware SET HW_Status = 'no' WHERE HW_ID ='$Obj_ID[$i]' " ;
				$updateStatus1=mysql_db_query("store",$updateStatus);
				echo " <font color=#FF6600><b>&nbsp;ยืมอุปกรณ์เรียบร้อย&nbsp; </b> </font> ";
				echo "&nbsp; &nbsp;<b>รหัสอุปกรณ์</b> $Obj_ID[$i]"." &nbsp;&nbsp; "."<b>ชื่ออุปกรณ์</b>&nbsp;&nbsp;".$record[13] ;
				echo"<br>";
				mysql_select_db("store");
				$sql="SELECT a.HW_ID,a.HW_Name,b.User_ID,b.Name,b.Sname,c.Borrow_Day,b.Level,a.Borrow_Day FROM hardware a, userprofile b, borrow c 
				WHERE a.HW_ID ='$Obj_ID[$i]' and b.User_ID = '$ID'";
				$result=mysql_query($sql);
				$number=mysql_num_rows($result);
				 $record = mysql_fetch_row($result);
				 $name1=$record[3]." ".$record[4];
				 $temp=$record[5];	
				 list($y,$m,$d)=split("-",$temp);
				$returnday=$d+$record[7];
				$reday=checkdd($returnday,$m,$y);
				 $ordersresult1 = "Insert into hisborrow(obj_ID,obj_Name,user_ID,user_Name,status,date) values ('$record[0]','$record[1]','$record[2]','$name1','$record[6]','$record[5]')";
				$dbquery1 = mysql_db_query("store",$ordersresult1);

				 $ordersresult2 = "Insert into return(Return_ID,User_ID,Return_Date) values ('$record[0]','$record[2]','$reday')";
				$dbquery2 = mysql_db_query("store",$ordersresult2);
				$setpassword=yes;
			}else{
				echo "<div align='center'><b>รหัสอุปกรณ์</b> $Obj_ID[$i] <b>ชื่ออุปกรณ์</b> $record[13]  <br>อุปกรณ์ตัวนี้ถูกยืมไปแล้ว<font color=red>ไม่สามารถยืมได้.</font></div>";
				$setpassword=yes;
				}
	}else if ( $number1 != 0 ){
		if($record1[3] != 0 ){
				$remain=$record1[3]-$Amount[$i];
				$updateAcces="UPDATE accessory SET Acces_Remain = '$remain' WHERE Acces_ID = '$Obj_ID[$i]'";
				$update1= mysql_db_query("store",$updateAcces);
				$Today=date("Y-m-d");
				mysql_select_db("store");
				$sql4="SELECT a.Acces_ID,a.Acces_Name,b.User_ID,b.Name,b.Sname,c.Borrow_Day,b.Level FROM accessory a, userprofile b, borrow c 
				WHERE a.Acces_ID ='$Obj_ID[$i]' and b.User_ID = '$ID'";
				$result4=mysql_query($sql4);
				$number4=mysql_num_rows($result4);
				 $record4= mysql_fetch_row($result4);
				 $name1=$record4[3]." ".$record4[4];
				 $ordersresult4 = "Insert into hisborrow(obj_ID,obj_Name,user_ID,user_Name,status,date) values ('$record4[0]','$record4[1]','$record4[2]','$name1','$record4[6]','$Today')";
				$dbquery4 = mysql_db_query("store",$ordersresult4);
				echo"<font color=#FF6600><b> &nbsp;ยืมอุปกรณ์เรียบร้อย </b> </font> &nbsp; &nbsp; <b>ชื่ออุปกรณ์</b> $record1[1] จำนวน $Amount[$i] ตัว.</div>";
				$setpassword=yes;
		}else{
			echo"<div align='center'>อุปกรณ์ $record1[1] ตัวที่ต้องการหมด</div>";
			$setpassword=yes;
		}
	}else{
			if($setpassword != 'yes'){
			echo"<div align='center'>ใส่รหัสอุปกรณ์หรือรหัสสมาชิก <font color=red>ผิด</font></div>";
			$setpassword = no;
			}
		}
	}
}
}
?>
<form action="tborrow.php" method="POST">
 <div align='center' ><input type="submit" value="กลับไปกรอกข้อมูลใหม่"></div>
</form>
</td>
</tr></table>

</BODY>
</HTML>
