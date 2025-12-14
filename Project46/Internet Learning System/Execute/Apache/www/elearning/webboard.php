<?php
	session_start();
	if(!$Category)
	{
		$Category="";
		$renname="Other";
	}
	else
	{
		include "connectdb.php";
		mysql_query("use elearning;");
		$sql = "select * from subject where subid='$Category';";
		$result=mysql_query($sql);
		$renname=mysql_result($result,0,"enname");
		if(!$result)
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
	<title>E-learning Webboard</title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
	</head>
	<link rel='stylesheet' type='text/css' href='style.css' />

	<body bgcolor=#FFFFFF>
<center>
  <p><font color="#CC0000" size="5">&lt;&lt;&lt; <? print $renname; ?> &gt;&gt;&gt;</font></p>
  <form method=post action="search.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>" name="SearchForm" onsubmit="return check()">
	<table width=100% border=0>
	<tr>
        <td align=left> <img src="../webboard/img/arrow.gif"> <a href="webboard.php?Category=<? echo $Category; ?>&page=1">กลับหน้าแรก</a> 
<?
if ((isset($_SESSION['user'])) && (($rstatus==0 || $rstatus==1) || ($rstatus==2 && ($within==1))))
{
?>
		  | <a href="postq.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">ตั้งคำถามใหม่</a> 
<?
}
?>
        </td>
	<td align=right class="defaultfont">
	ค้นหาคำถาม <input type=text name="search" size=25 maxlength=100>
	<input type=submit value="Search"> 
	</td></tr></table>
	</form>

<?
	include("config.inc.php");
	$chk_date = date("j M Y",mktime( date("H")+$p_hour, date("i")+$p_min ));
	if (empty($page)){
		$page=1;
	}

	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
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
	$goto = ($page-1)*$list_page;

	// Query ข้อมูลตามจำนวนที่กำหนด
	$sql = "select * from webboard_data where Category='$Category' order by No DESC limit $goto,$list_page";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

	if($NRow==0) { 
	?>
		<font size=2 face='MS Sans Serif' class="warning">ยังไม่มีคำถาม</font><br><br>
	<?
	}
	// แสดงหัวข้อของบอร์ด
	else {
	?>
		<table width=100% border=1 bordercolor=#FFCC99 cellspacing=0 cellpadding=2>
		<tr bgcolor= dodgerblue>
		
      <td width=11% align=center bgcolor="#FF9900" class="headmenu">คำถามที่</td>
		<td width=47% align=center bgcolor="#FF9900" class="headmenu">คำถาม</td>
		<td width=24% align=center bgcolor="#FF9900" class="headmenu">ผู้ถาม[วันที่ถาม]</td>
		<td width=18% align=center bgcolor="#FF9900" class="headmenu">จำนวนคำตอบ</td>
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
			$Date = trim(substr($row["Date"],0,11)); // แสดงเฉพาะวันที่
			$Reply = $row["Reply"];
			$ReplyDate = substr($row["ReplyDate"],0,11); // แสดงเฉพาะวันที่
?>
			<tr bgcolor=<? print $bgc; ?>>
<?
			// แสดงรูป folder
			if($ReplyDate!="") {
			?>
			    <td align=center class="defaultfont"><img src='img/openfd.gif'> <? print $No; ?></td>
				<?
			}
			else {
			    if($Date==$chk_date) {
				?>
				    <td align=center class="defaultfont"><img src='img/newfd.gif'> <? print $No; ?></td>
					<?
				} 
				else {
				?>
				    <td align=center class="defaultfont"><img src='img/closefd.gif'> <? print $No; ?></td>
					<?
				}
			}
?>
			<td><a href='show.php?Category=<? print $Category; ?>&No=<? print $No; ?>' target='<? print $No; ?>'><? print $Question; ?></a></td>
			<?

			if($Member) {
			?>
				<td class="defaultfont"><? print $Name; ?> <font size=1 color=red><b>M</b></font> [<? print $Date; ?>]</td>
				<?
			}
			else {
			?>
				<td class="defaultfont"><? print "$Name [$Date]"; ?></td>
			<?
			}
			
			// ตรวจสอบว่ามีคนตอบคำถามหรือยัง
			if($ReplyDate!="") {
			?>
				<td class="defaultfont"><? print $Reply; ?> <font color=blue>[<? print $ReplyDate; ?>]</font></td>
			<?
			}
			else {
			?>
				<td class="defaultfont"><? print $Reply; ?></td>
			<?
			}
			?>
			</tr>
		<?
		}
		?>
		</table>

		<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>
		<tr><td align=left class="warning">
		<img src='img/newfd.gif'> - คำถามใหม่ 
		<img src='img/closefd.gif'> - คำถามเก่า 
		<img src='img/openfd.gif'> - คำถามที่ถูกตอบแล้ว
		<font size=1 color=red><b>M</b></font> - สมาชิกเว็บบอร์ด
		</td></tr>
		</table>


		<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>
		<tr><td align=left class="defaultfont">
		
<?
		// สร้าง link เพื่อไปหน้าก่อน-หน้าถัดไป
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			?>
			<a href='webboard.php?Category=<? print $Category; ?>&page=<? print $prevpage; ?>'>[หน้าก่อน = <? print $prevpage; ?>]</a>
			<?
		}
?>
		 กำลังแสดงหน้าที่ <? print "$page/$totalpage "; ?>
		<?

		if($page!=$totalpage) {
			$nextpage = $page+1;
		?>
			<a href='webboard.php?Category=<? print $Category; ?>&page=<? print $nextpage; ?>'>[หน้าถัดไป = <? print $nextpage; ?>]</a>
		<?
		}
?>
		
		</td></tr>
		<tr><td>
<?
		// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
		?>
			<a href='webboard.php?Category=<? print $Category; ?>&page=<? print $i; ?>'><? print $i; ?></a>
		<?
		}
		?>
		<font size=2 color=red><b><? print $page; ?></b></font>
		<?
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
		?>
			<a href='webboard.php?Category=<? print $Category; ?>&page=<? print $i; ?>'><? print $i; ?></a>
		<?
		}
	?>
		</td></tr>
		</table>
		
  <?
	}
if ((isset($_SESSION['user'])) && (($rstatus==0 || $rstatus==1) || ($rstatus==2 && ($within==1))))
{
?>
  [ <a href="postq.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">ตั้งคำถามใหม่</a> 
  ] 
  <?
  }
  ?>
</center>

<script language="JavaScript">
<!--
function check()
{
      var v1 = document.SearchForm.search.value;
        if ( v1.length==0)
           {
           alert("กรุณาป้อนคำที่ต้องการค้นหา");
           document.SearchForm.search.focus();
           return false;
           }
		 else
           return true;
}
//-->
</script>
</body>
</html>