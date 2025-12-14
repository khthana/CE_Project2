<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>รายการประจำวัน</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>

<body>
	<?php
		  $hostname = "localhost";
		  $user = "root";
		  $password="sonypl2";
		  $dbname = "hospital";
		  $tblname = "testrecord";
		  
		  mysql_connect( $hostname,$user,$password) or die("ติดต่อฐานข้อมูลไม่ได้");
		  mysql_query("SET NAMES 'tis620'");
		  mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
		
		  $sql = "select tbltestrecord.Status, tbltestrecord.ListID,Name,RoomTypeName,RoomNo,Bed  from tbltestrecord,tblpatientbasicdata,tblroom where tbltestrecord.PatientID= tblpatientbasicdata.PatientID and tblroom.RoomTypeID = tbltestrecord.RoomTypeID  and tbltestrecord.status = 1";
		  $dbquery = mysql_query($sql);
		
		  echo"<table width=100%  border=0 align= center  bordercolor=000000 >
		  			<tr>
							<td bgcolor=00CC66><div align=center><font face=\"MS Sans Serif\" size =\"2\"><b>ลำดับที่</b></font></div></td>
							<td bgcolor=00CC66><div align=center><font face=\"MS Sans Serif\" size =\"2\"><b>ชื่อผู้ป่วย</b></font></div></td>
							<td bgcolor=00CC66><div align=center><font face=\"MS Sans Serif\" size =\"2\"><b>ห้อง</b></font></div></td>
							<td bgcolor=00CC66><div align=center><font face=\"MS Sans Serif\" size =\"2\"><b>เตียง</b></font></div></td>
							<td bgcolor=00CC66><div align=center><font face=\"MS Sans Serif\" size =\"2\"><b>สถานะ</b></font></div></td></tr>";
		  
		  
		  while( $result = mysql_fetch_array($dbquery) )
		  {	  
		  $ListID  = $result["ListID"];
		  $Name = $result["Name"];
		  $Room	= $result["RoomNo"];
		  $Bed	= 	$result["Bed"];
		  
		  $tmp = $result[Status];
		  switch ($tmp)
		  {
		  case 0 :   $Status  = "อ่านเเล้ว";		
		  break;
		  case 1 :   $Status  = "ยังไม่ได้อ่าน";
		  break;
		  }

	      echo"<tr>
		  					<td bgcolor=CCFF99><div align=center ><a href ='listday1.php?ListID=$ListID' target='list2'><font face=\"MS Sans Serif\" size =\"2\">$ListID</font></a> </div></td>
							<td bgcolor=CCFF99><div align=left ><font face=\"MS Sans Serif\" size =\"2\">$Name</font></div></td>
							<td bgcolor=CCFF99><div align=center ><font face=\"MS Sans Serif\" size =\"2\">$Room</font></div></td> 
							<td width=15% bgcolor=CCFF99><div align=center ><font face=\"MS Sans Serif\" size =\"2\">$Bed</font></div></td>
							<td bgcolor=CCFF99><div align=center ><font face=\"MS Sans Serif\" size =\"2\">$Status</font></div></td></tr>"; 
			     $i++;
		  }
		  echo"</table>";
		  mysql_close();  
		  ?>
</body>
</html>
