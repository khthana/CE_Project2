<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>รายการประจำวัน</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>
<body>
	<?php

			function sub() {
					$sql = "update tbltestrecord set status = 0 where listid = $ListID";
					print $sql;
					mysql_query($sql);
			}
//เเสดงก่อนคลิก
			if(!isset($ListID)) {

				echo "<table width=100% border=0 align= center  bordercolor=000000 ><tr><td align=center bgcolor=00CC66><font face=\"MS Sans Serif\" size =\"2\"><b>ลำดับที่  :   </b></font></td>";
				echo"<table width=100%  border=1 align= left  bordercolor=00CC66 ><tr><td><table width=20% border=0 align=left bordercolor=000000>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">หมายเลขห้อง  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">หมายเลขเตียง  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">ประเภทห้อง  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">ชื่อผู้ป่วย  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">วันที่  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">เวลา  :</font></td></tr>
				<tr><td bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">ชื่อหมอ  :</font></td></tr>
				<tr><td bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">ยา/เวชภัณฑ์  :</font></td></tr>";
		        echo"</table>";
				exit;
			}
	
		  $hostname = "localhost";
		  $user = "root";
		  $password="sonypl2";
		  $dbname = "hospital";
		  $tblname = "testrecord";
		  
		  mysql_connect( $hostname,$user,$password) or die("ติดต่อฐานข้อมูลไม่ได้");
		  mysql_query("SET NAMES 'tis620'");		  
		  mysql_query("USE hospital");

		  

		  $sql = "select tbltestrecord.ListID,Name,RoomTypeName,RoomNo,Bed  from tbltestrecord,tblpatientbasicdata,tblroom where tbltestrecord.PatientID= tblpatientbasicdata.PatientID and tblroom.RoomTypeID = tbltestrecord.RoomTypeID  and tbltestrecord.status = 1";
		  $link = mysql_query($sql);
		  

		  $price_all = 0;
		  while($object = mysql_fetch_array($link)) {		  		  
				$room = $object ["RoomNo"];
				$bed = $object["Bed"];
		  }
	  		  
	      echo "<table width=100% border=0 align= center  bordercolor=000000 ><tr><td align=center bgcolor=00CC66><font face=\"MS Sans Serif\" size =\"2\"><b>ลำดับที่  :   $ListID</b></font></td></tr>";	 			
		  echo"</table>";

		  $sql = "select  *  from tbltestrecord,tblpatientbasicdata,tblroom where tbltestrecord.PatientID= tblpatientbasicdata.PatientID and tblroom.RoomTypeID = tbltestrecord.RoomTypeID  and tbltestrecord.status = 1 and ListID = ".$ListID." ";
		  $link2 = mysql_query($sql);
	
			echo"<td><table width=20%  border=0 align= left  bordercolor=00CC66 >
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">หมายเลขห้อง  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">หมายเลขเตียง  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">ประเภทห้อง  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">ชื่อผู้ป่วย  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">วันที่  :</font></td></tr>
				<tr><td  bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">เวลา  :</font></td></tr>
				<tr><td bgcolor=FFCC99><font face=\"MS Sans Serif\" size =\"2\">ชื่อหมอ  :</font></td></tr>
				<tr><td bgcolor=FFCC99 height=\"45\"><font face=\"MS Sans Serif\" size =\"2\">ยา/เวชภัณฑ์  :</font>
				</table>";
				

	while( $result = mysql_fetch_array($link2) )
		  {
		   $tmp = $result[Status];
		  switch ($tmp)
		  {
		  case 0 :   $Status  = "อ่านเเล้ว";		
		  break;
		  case 1 :   $Status  = "ยังไม่ได้อ่าน";
		  break;
		  }
		 $room = $result[RoomNo];
		 $bed = $result[Bed];
		 $name  = $result[Name ];
		 $date    = $result[Date];
	     $time    = $result[Time];
		 $doctorname = $result[DoctorName];
	     $m    = $result[MedicationRecord];
		 $roomtype = $result[RoomTypeName];

		 
		 		 
		echo "<td><table width=80%  border=0 align= left  bordercolor=000000 >
				<tr><td  bgcolor=CCFF99><font face=\"MS Sans Serif\" size =\"2\">: $room</font></td></tr>
				<tr><td  bgcolor=CCFF99><font face=\"MS Sans Serif\" size =\"2\">: $bed</font></td></tr>
				<tr><td  bgcolor=CCFF99><font face=\"MS Sans Serif\" size =\"2\">: $roomtype</font></td></tr>
				<tr><td  bgcolor=CCFF99><font face=\"MS Sans Serif\" size =\"2\">: $name</font></td></tr>
				<tr><td  bgcolor=CCFF99><font face=\"MS Sans Serif\" size =\"2\">: $date</font></td></tr>
				<tr><td  bgcolor=CCFF99><font face=\"MS Sans Serif\" size =\"2\">: $time</font></td></tr>
				<tr><td bgcolor=CCFF99><font face=\"MS Sans Serif\" size =\"2\">: $doctorname</font></td></tr>
				<tr><td bgcolor=CCFF99 height=\"45\"><font face=\"MS Sans Serif\" size =\"2\"><textarea cols=\"95\" row=\"4\" name=\"Address\" maxlength=\"100\">$m</textarea></font></td></tr>
				<tr><td>&nbsp;</td></tr>
</table>";
		  
		  $i++;
		  
		  }
		  
		 
		  echo"</table>";

		  $sql = "update tbltestrecord set status = 0 where listid = $ListID";
		  mysql_query($sql);
		  
		  mysql_close();
		  
		  ?>
</body>
</html>
