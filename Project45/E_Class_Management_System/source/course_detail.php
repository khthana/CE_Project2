<?php
	require('./libraries/grab_globals.lib.php');  
	include("./connectDB.php");
	session_start(); 
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><!-- InstanceBegin template="/Templates/teacher.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<!-- InstanceBeginEditable name="doctitle" -->
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<!-- InstanceEndEditable --> 
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
<!-- InstanceBeginEditable name="head" --><!-- InstanceEndEditable -->
</head>

<body leftmargin="0" rightmargin="0" topmargin="0">
<?php  if(session_is_registered("SESSION")){  ?>
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr> 
    <td width="100%" align="right"><img src="./Picture/logo.jpg" width="100%" height="81"></td>
  </tr>
  <tr> 
    <td><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="about.php" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="100%" width="780">
	<table border="0" cellpadding="0" cellspacing="8" height="100%" width="100%">
	<tr>
	<td width="14%" valign="top" >
	   <table border="0" cellpadding="5" cellspacing="0" >
	   <tr><td   bgcolor="#0099FF" width="136" valign="top">
	   		<table border="0" cellpadding="0" cellspacing="0" height="100" class="text">
	   		<tr>
			<td width="129" nowrap="nowrap"  bgcolor="#99CCCC" class="text" valign="top">
	   		<?php echo"<a href='FrmTea.php'>&nbsp;หน้าหลัก</a>";?>

	   		<hr>
	   		<b>&nbsp;สื่อการสอน</b><br>
	   		<?php echo"<a href='course_content.php?ID=$ID'>&nbsp;บทเรียน</a><br>";?>
	   		<hr>
	   		<b>&nbsp;ห้องเรียนจำลอง</b><br>
	   		<?php 
				   echo"<a href=\"JAVASCRIPT:%20void%20window.open('calendar.php','e','menubar=no,toolbar=no,location=no,scrollbars=no,status=no,width=600,height=400,top=100,left=100');\">&nbsp;ปฏิทิน</a><br>";
				   echo"<a href=\"JAVASCRIPT:%20void%20window.open('News.php','e','menubar=no,toolbar=no,location=no,scrollbars=no,status=no,width=500,height=400,top=50,left=150');\">&nbsp;ประกาศ</a><br>";
	   		       echo"<a href='Webboard.php?CID=$ID' target=_parent>&nbsp;กระดานสนทนา</a><br>";
	   		       //echo "<a href=# onclick=open('chatroom.php?HTTP_REFERER=1','','toolbar=no,scrollbar=yes,width=700,height=500')>&nbsp;ห้องสนทนา</a>";
			?>
	   		<hr>
	   		<b>&nbsp;ประเมินผล</b><br>
	   		<?php echo"<a href='questionlib.php?ID=$ID'>&nbsp;คลังข้อสอบ</a><br>";
	   			   echo"<a href='quiz.php?ID=$ID'>&nbsp;คำถามทดสอบความเข้าใจ</a><br>";
	   			   echo"<a href='homework.php?ID=$ID'> &nbsp;การบ้าน</a><br>"; 
	   			   //echo" <a href='test.php?'>&nbsp;ข้อสอบวัดผล</a>";
			?>	   
	   		<hr>
	   		<b>&nbsp;ข้อมูล</b><br>
	   		<?php 
				   echo"<a href='FrmTea_Update1.php?ID=$ID&TID=$SESSION[id]'>&nbsp;ข้อมูลส่วนตัว</a><br>";
	   			   echo"<a href='course_detail.php?ID=$ID&TID=$SESSION[id]'>&nbsp;รายละเอียดวิชา</a><br>";
	   		       //echo"<a href='stdmgr.php?'>&nbsp;จัดการข้อมูลนักเรียน</a><br>";
	   		       //echo"<a href='filemgr.php?'>&nbsp;จัดการแฟ้มข้อมูล</a><br>";
			?>	   
	   		<hr>
	   		<?php  echo"<a href='index.php?LogOut=yes'>&nbsp; ออกจากระบบ</a>";  ?>
			</td></tr></table>
	</td></tr></table>
</td>
          <td valign="top"><!-- InstanceBeginEditable name="data" -->
            <table border="0 "cellpadding="0 "cellspacing="0" width=100% height=100%>
              <tr> 
                <td valign="top"> 
                  <?php //show course detial
	connect_db();
	$sql="select * from courses where ID=$ID";
	$result=mysql_query($sql);
	$row=mysql_fetch_row($result);
	$row[4]=str_replace("\n","<br>",$row[4]);
	$row[5]=str_replace("\n","<br>",$row[5]);
	$row[9]=str_replace("\n","<br>",$row[9]);
	$row[10]=str_replace("\n","<br>",$row[10]);
	echo"<table border=0 cellpadding=1 cellspacing=1 width=96% class='text'  align=center>";
	echo"<tr bgcolor='#AA99DD' ><td align='center' colspan=2><b>ข้อมูลวิชา</b></td>";
	echo"<tr bgcolor='#EEEEEE'><td>รหัสวิชา </td><td>$row[0]</td></tr>";
	echo"<tr bgcolor='#EEEEEE'><td>คณะวิชา</td><td>$row[1]</td></tr>";
	echo"<tr bgcolor='#EEEEEE'><td>สาขาวิชา</td><td>$row[2]</td></tr>";
	echo"<tr bgcolor='#EEEEEE'><td>ชื่อวิชา </td><td>$row[3]</td></tr>";
	echo"<tr bgcolor='#EEEEEE'><td>วัตถุประสงค์</td><td>$row[4]</td></tr>";
	echo"<tr bgcolor='#EEEEEE'><td>เนื้อหาโดยย่อ</td><td>$row[5]</td></tr>";
	echo"<tr bgcolor='#AA99DD'><td align='center' colspan=2><b>ข้อมูลวิชาบังคับก่อนเรียน</b></td>";
	echo"<tr bgcolor='#EEEEEE'><td>รหัสวิชา</td><td>$row[6]</td></tr>";
	echo"<tr bgcolor='#EEEEEE'><td>ชื่อวิชา</td><td>$row[7]</td></tr>";
	echo"<tr bgcolor='#AA99DD'><td align='center' colspan=2><b>ข้อมูลอื่นๆ</b></td>";
	echo"<tr bgcolor='#EEEEEE'><td>หนังสือที่ใช้</td><td>$row[8]</td></tr>";
	echo"<tr bgcolor='#EEEEEE'><td>เกณฑ์การตัดคะแนน</td><td>$row[9]</td></tr>";
	echo"<tr bgcolor='#EEEEEE'><td>แหล่งข้อมูลอ้างอิง</td><td>$row[10]</td></tr>";
	echo"</table>";
	mysql_close();
	?>
                  <?php //date 
				  /*
	function datethai($date){
	 $day=substr("$date",6,2);
	 $month=substr("$date",4,2);
	 $month=(int)$month-1;
	 $year=substr("$date",0,4);
	 $year=$year+543;
	 $thaimonth=array("  มกราคม  ","  กุมภาพันธ์  ","  มีนาคม  ","  เมษายน  ","  พฤษภาคม  ","  มิถุนายน  ","  กรกฎาคม  ","  สิงหาคม  ","  กันยายน  ","  ตุลาคม  ","  พฤศจิกายน  ","  ธันวาคม  ");
	 $month=$thaimonth[$month];
	 return (int)$day."".$month."".$year;
	}
$FONT ="Verdana, Arial, Helvetica, sans-serif";
$FONTSIZE="8";
$FONTCOLOR="#000000";
$BorderColor="#99CCCC";
$BarColor="#000066";

function WriteMonth($StartDate,$Border_color,$Title_color){
	$WriteMonth="";
	$CurrentDate=date("m/1/y", strtotime ("$StartDate"));
	$setMonth=date("m",strtotime ($CurrentDate));
	$BeginWeek=date("m",strtotime ($CurrentDate));
	$EndWeek=date("m",strtotime ($CurrentDate));

	$WriteMonth="
		<table border=0 cellspacing=0 cellpadding=0 bgcolor='$Border_color' width=150 resize=none class='text'>
		<tr>
		<td>
			<table border=0 cellspacing=1 cellpadding=2 resize='none' width=100% style='border: 1pt solid $Border_color' class='text'>
			<tr>
			<td colspan=7 valign=top BGCOLOR='$Title_color' align=center >
			<a href='cal.php?GoToDay=".date("m/1/y", strtotime ("$StartDate -1 months"))."'>
			</a>
			<b><font color='white'>"
			.datethai(date(Ymd)).//.date("M",strtotime ($StartDate))." ".date("Y",strtotime ($StartDate)).
			"</font></b>
			<a href='cal.php?GoToDay=".date("m/1/y", strtotime ("$StartDate +1 months"))."'>
			</a>
			</td>
			</tr>
			<tr>
			<td align='center' valign=top bgcolor=white ><B>อา</B></td>
			<td align='center' bgcolor=white ><B>จ</B></td>
			<td align='center' bgcolor=white ><B>อ</B></td>
			<td align='center' bgcolor=white ><B>พ</B></td>
			<td align='center' bgcolor=white ><B>พฤ</B></td>
			<td align='center' bgcolor=white ><B>ศ</B></td>
			<td align='center' bgcolor=white ><B>ส</B></td>
			</tr>";

	for($j=1;$j<6;$j++){
		if($BeginWeek==$setMonth||$EndWeek==$setMonth){	
			switch(date("w",strtotime($CurrentDate))){
			case 0:
				$DaysToAd=array("","+1 days","+2 days","+3 days","+4 days","+5 days","+6 days");
				break;
			case 1:
				$DaysToAd=array("-1 days","","+1 days","+2 days","+3 days","+4 days","+5 days");
				break;
			case 2:
				$DaysToAd=array("-2 days","-1 days","","+1 days","+2 days","+3 days","+4 days");
				break;
			case 3:
				$DaysToAd=array("-3 days","-2 days","-1 days","","+1 days","+2 days","+3 days");
				break;
			case 4:
				$DaysToAd=array("-4 days","-3 days","-2 days","-1 days","","+1 days","+2 days");
				break;
			case 5:
				$DaysToAd=array("-5 days","-4 days","-3 days","-2 days","-1 days","","+1 days");
				break;
			case 6:
				$DaysToAd=array("-6 days","-5 days","-4 days","-3 days","-2 days","-1 days","");
				break;
			}	
			$WriteMonth.="<tr>";
			for($i=0;$i<7;$i++){
				$strTemp="";
				$BGcolor="white";
				$FontColor="#000000";
				$Style="";
				if(date("m",strtotime ("$CurrentDate $DaysToAd[$i]"))!=$setMonth){
					$FontColor="#999999";
				}
				if(date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))==date("m/d/y",strtotime($StartDate))){
					$Style="style='border: 1pt solid red'";
				}
				$WriteMonth.="
					<td align=center bgcolor='$BGcolor' $Style >
					<a href='cal.php?GoToDay=".date("m/d/y",strtotime ("$CurrentDate $DaysToAd[$i]"))."'>
					<font color='$FontColor'>".date("d",strtotime ("$CurrentDate $DaysToAd[$i]")).
					"</font></a></td>";
			}
			$WriteMonth.="</tr>";
			$CurrentDate=date("m/d/y",strtotime("$CurrentDate +1 week"));
			$StartDateofWeek=date("w",strtotime ($CurrentDate));
			$EndofWeek=6 - $StartDateofWeek;
			$BeginWeek=date("m",strtotime ("$CurrentDate -$StartDateofWeek days"));
			$EndWeek=date("m",strtotime ("$CurrentDate +$EndofWeek days"));
		}
	}
	$WriteMonth.="</table></td></tr></table>";
	return $WriteMonth;
}

	if(!empty($GoToDay)){
	$StartDate=date("m/d/y",strtotime ("$GoToDay"));
	}
	else{
		if(empty($StartDate)){
			$StartDate=date("m/d/y");
			}
	}
print WriteMonth($StartDate,$BorderColor,$BarColor,1);

@$db=mysql_connect("localhost","root","");//DB Connect
		if(!$db)
		{
			echo"<center>";
			echo"ไม่สามารถติดต่อฐานข้อมูลได้";
			echo"</center>";
			exit;
		}
		mysql_select_db("e_learning");
		$sql="select  *  from date where TID=$SESSION[id] and Day='".date("Y-m-d")."'";
		$result=mysql_query($sql);
		if($result)
		{
		while($row=mysql_fetch_row($result))
				if($row[3])
					print "<br><b><font color='#FF1100'>".$row[3]."</font></b>";
					//print "<input type='checkbox' name='del[ ]' value=".$row[0].">".$row[3];
		}*/
	?>
                </td>
              </tr>
            </table>
		  <!-- InstanceEndEditable --></td>
</tr>
</table>
</td>
</tr>
</table>

</td>
</tr> 
</table> 
<?php
	 }
	 else
	 {
	  print "<center><font color='#FF0000'><b>กรุณา LOGIN ก่อนเข้าใช้งานด้วยครับ</b></font></center><br>
	 			<center><a href='index.php'>LOGIN </a></center>";
	}
?>
</body>
<!-- InstanceEnd --></html>
