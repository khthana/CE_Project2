<?php
	session_start();
	
	if(!$Category)
	{
		$Category="";
	}
	else
	{
		include "connectdb.php";
		mysql_query("use elearning;");
		$sql = "select * from subject where subid='$Category';";
		$result=mysql_query($sql);
		if($result)
		{
			$Category="";
			print "<meta http-equiv=\"refresh\" content=\"0;URL=webboard.php?Category=$Category&page=1\">";
			exit();
		}
	}

	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	include("config.inc.php");
	mysql_connect($host,$iduser,$passwd);
	mysql_query("use ".$dbname.";");
	$sql = "select No from webboard_data where Category='$Category'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	$rt = $NRow%$list_page;
	if($rt!=0) { 
		$totalpage = floor($NRow/$list_page)+1; 
	}
	else {
		$totalpage = floor($NRow/$list_page); 
	}
	if($totalpage==0)
	{
		$totalpage=1;
	}

	if(!$page || ($page>$totalpage))
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=webboard.php?Category=$Category&page=1\">";
		exit();
	}	
	if (isset($_SESSION['user']))
	{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$ruid=mysql_result($result,0,"uid");
	$rstatus=mysql_result($result,0,"status");
	if($rstatus==2)
	{
		$sql = "select * from userskill where uid='$ruid';";
		$result=mysql_query($sql);
		$count=mysql_num_rows($result);
		$within=0;
		for($i=0;$i<$count;$i++)
		{
			if($Category=="")
			{
				$within=1;
			}
			$rsubid=mysql_result($result,$i,"subid");
			if($rsubid==$Category)
			{
				$within=1;
				$i=$count;
			}
		}
	}
	mysql_close($db);
	}
?>
	<html>
	<head>
	<title>ผลการหากระทู้</title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
	</head>
	<link rel='stylesheet' type='text/css' href='style.css' />
	
	<body>
<center>
  <table width=100% border=0>
	<tr><td>
	<img src="img/arrow.gif"> 
	<a href="webboard.php?Category=<? echo $Category; ?>&page=1">กลับหน้าแรก</a>
<?
if ((isset($_SESSION['user'])) && (($rstatus==0 || $rstatus==1) || ($rstatus==2 && ($within==1))))
{
?>
	 |  
	<a href="postq.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">ตั้งคำถามใหม่</a>
<?
}
?>
	</td></tr></table>

  <?
	include("config.inc.php");
	mysql_query("use ".$dbname.";");
	$search_topic = $search;
	$search = strtolower(trim($search));
	$chk_date = date("j M Y",mktime( date("H")+$p_hour, date("i")+$p_min ));
	if (empty($page)){
		$page=1;
	}

	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$iduser,$passwd);
	$sql = "select No from webboard_data where Category='$Category' and Question like '%$search%' or Note like '%$search%'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	$rt = $NRow%$list_page;
	if($rt!=0) { 
		$totalpage = floor($NRow/$list_page)+1; 
	}
	else {
		$totalpage = floor($NRow/$list_page); 
	}
	$goto = ($page-1)*$list_page;
?>
  <p class="defaultfont">ผลจากการค้นหาคำว่า " <b class="warning"><? print $search_topic; ?> </b>" เจอทั้งหมดจำนวน " <b class="warning"><? print $NRow; ?></b> 
  " คำถาม</p> 
  <?
	// Query ข้อมูลตามจำนวนที่กำหนด
	$sql = "select * from webboard_data where Category='$Category' and Question like '%$search%' or Note like '%$search%' order by No DESC limit $goto,$list_page";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

	if($NRow==0) { 

  echo "\t<font size=1 face='MS Sans Serif'> </font> \n";
echo "\t</center>\n";
		echo "\t</body>\n";
		echo "\t</html>\n";

		exit();
	}
	// แสดงหัวข้อของบอร์ด
	else {
?>
		<table width=100% border=1 bordercolor=#FFCC99 cellspacing=0 cellpadding=2>
		<tr bgcolor= #FF9900>
		<td width=11% align=center class="headmenu">คำถามที่</td>
		<td width=47% align=center class="headmenu">คำถาม</td>
		<td width=24% align=center class="headmenu">ผู้ถาม[วันที่ถาม]</td>
		<td width=18% align=center class="headmenu">จำนวนคำตอบ</td>
		</tr>
<?
		// วนลูปแสดงข้อมูลที่อ่านได้
		$bgc = "#FFEECC";
		while ($row = mysql_fetch_array($result)) {
			
			// กำหนดสีของตาราง เพื่อให้มีการสลับสี
			$bgc = ($bgc=="#FFEECC") ? "#FFFFFF" : "#FFEECC";

			// กำหนดค่าตัวแปร
			$No = sprintf("%05d",$row["No"]);
			$Question = $row["Question"];
			$Name = $row["Name"];
			$Member = $row["Member"];
			$Date = substr($row["Date"],0,11); // แสดงเฉพาะวันที่ 
			$Reply = $row["Reply"];
			$ReplyDate = substr($row["ReplyDate"],0,11); // แสดงเฉพาะวันที่ 

			echo "<tr bgcolor=$bgc>\n";

			// แสดงรูป folder
			if($ReplyDate!="") {
			    echo "\t<td align=center class=\"defaultfont\"><img src='img/openfd.gif'> $No</td>\n";
			}
			else {
			    if($Date==$chk_date) {
				    echo "\t<td align=center class=\"defaultfont\"><img src='img/newfd.gif'> $No</td>\n";
				} 
				else {
				    echo "\t<td align=center class=\"defaultfont\"><img src='img/closefd.gif'> $No</td>\n";
				}
			}

			echo "\t<td><a href='show.php?Category=$Category&No=$row[No]' target='$No'>$Question</a></td>\n";
			
//			if($Member) {
//				echo "\t<td class=\"defaultfont\">$Name <font size=1 color=red><b>M</b></font> [$Date]</td>\n";
//			}
//			else {
				echo "\t<td class=\"defaultfont\">$Name [$Date]</td>\n";
//			}
						
			// ตรวจสอบว่ามีคนตอบคำถามหรือยัง
			if($ReplyDate!="") {
				echo "\t<td class=\"defaultfont\">$Reply <font color=blue>[$ReplyDate]</font></td>\n";
			}
			else {
				echo "\t<td class=\"defaultfont\">$Reply</td>\n";
			}
	?>
			</tr>
	<?
		}
	?>
		</table>


		<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>
		<tr><td align=left class="warning">
		<img src='../webboard/img/newfd.gif'> - คำถามใหม่ 
		<img src='../webboard/img/closefd.gif'> - คำถามเก่า 
		<img src='../webboard/img/openfd.gif'> - คำถามที่ถูกตอบแล้ว
		<font size=1 color=red><b>M</b></font> - สมาชิกเว็บบอร์ด
		</td></tr>
		</table>


		<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>
		<tr><td align=left class="defaultfont">
		
<?
		// สร้าง link เพื่อไปหน้าก่อน-หน้าถัดไป
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			echo "\t<a href='search.php?Category=$Category&page=$prevpage&search=$search'>[หน้าก่อน = $prevpage]</a>\n";
		}

		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";

		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='search.php?Category=$Category&page=$nextpage&search=$search'>[หน้าถัดไป = $nextpage]</a>\n";
		}
?>
		
		</td></tr>
		<tr><td>
		<font size=2 face='MS Sans Serif'>
<?
		// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='search.php?Category=$Category&page=$i&search=$search'>$i</a> \n";
		}
		echo "\t<font size=2 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='search.php?Category=$Category&page=$i&search=$search'>$i</a> \n";
		}
	?>
		</font>
		</td></tr>
		</table>
	
  <?
	}

if ((isset($_SESSION['user'])) && (($rstatus==0 || $rstatus==1) || ($rstatus==2 && ($within==1))))
{
?>
  [ <a href="postq.php?Category=<? print $Category; ?>&page=<? print $page; ?>">ตั้งคำถามใหม่</a> 
  ] 
  <?
  }
  ?>
</center>
</body>
</html>