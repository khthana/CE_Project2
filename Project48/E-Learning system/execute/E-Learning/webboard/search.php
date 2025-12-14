<?
/* 
 * **********************************************
 * **     PHP - WebBoard : Search Question     **
 * **********************************************
 * *                                            *
 * * Developed By : Sansak Chairattanatrai      *
 * * E-mail :  sansak@engineer.com              *
 * * UIN : 5590582                              *
 * * License : SamChai Public Soft Group(tm).   *
 * *                                            *
 * **********************************************
 */  
?>	
	<html>
	<head>
	<title>PHP - Ultimate Webboard 2.00</title>
	<style type="text/css">
	<!-- 
	BODY {font-family:;font-size="10"}
	A:link {text-decoration: none; color: blue }
	A:visited {text-decoration: none; color: blue }
	A:hover {text-decoration: none; color: darkorange }
	A:active {text-decoration: none; color: blue }
	p, div, td, ul li, ol li { font-family:  MS Sans Serif, Microsoft Sans Serif;  font-size: 10pt }
	-->
	</style>
	</head>
	<body bgcolor=#FFFFE0>
	<table border=0 width=100%>
	<tr><td align=left valign=center>
	<font size=2 face="Arial,MS Sans Serif">
    <font size=5 color=blue><b>PHP - Ultimate Webboard <font color=red>2.00</font></b></font> 
	</td>
	<td align=right>
	[ <a href="../webboard/addmember.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">สมัครสมาชิก</a> |
	<a href="../webboard/memberlogin.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">แก้ไขข้อมูลสมาชิก</a> ]
	</td></tr>
	</table>
	<br>

	<center>
	<font face="Arial" size=3 color=#9400D3><b>สถานที่แลกเปลี่ยนความรู้สำหรับชาว PHP</b></font> 
	</font>
	<br><br><br>

	<table width=100% border=0>
	<tr><td>
	<img src="../webboard/img/arrow.gif"> 
	<a href="../webboard/webboard.php?Category=<? echo $Category; ?>">กลับหน้าแรก</a> |  
	<a href="../webboard/postq.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">ตั้งคำถามใหม่</a>
	</td></tr></table>

<?
	include("config.inc.php");
	$search_topic = $search;
	$search = strtolower(trim($search));
	$chk_date = date("j M Y",mktime( date("H")+$p_hour, date("i")+$p_min ));
	if (empty($page)){
		$page=1;
	}

	// ติดต่อ database เพื่ออ่านข้อมูล	
	// หาจำนวนหน้าทั้งหมด
	mysql_connect($host,$user,$passwd);
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

	echo "<font size=2 face='MS Sans Serif'>\n";
	echo "ผลจากการค้นหาคำว่า \" <b>$search_topic </b>\" เจอทั้งหมดจำนวน \" <b>$NRow</b> \" คำถาม\n";
	echo "</font><br><br>\n\n";

	// Query ข้อมูลตามจำนวนที่กำหนด
	$sql = "select * from webboard_data where Category='$Category' and Question like '%$search%' or Note like '%$search%' order by No DESC limit $goto,$list_page";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

	if($NRow==0) { 
		echo "<hr color=1E90FF>\n";
		echo "<font size=1 face='MS Sans Serif'>\n";
		echo "<b>Copy<font color=FF1493>LEFT</font> and Powered By : <a href=mailto:sansak@engineer.com>Dynamic Media Design</a></b>\n";
		echo "</font>\n";
		echo "</center>\n";
		echo "</body>\n";
		echo "</html>\n";
		exit();
	}
	// แสดงหัวข้อของบอร์ด
	else {
		echo "<table width=100% border=1 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr bgcolor= dodgerblue>\n";
		echo "\t<td align=center width=11%><font size=2 color=#FFF8DC><b>คำถามที่</b></font></td>\n";
		echo "\t<td align=center width=47%><font size=2 color=#FFF8DC><b>คำถาม</b></font></td>\n";
		echo "\t<td align=center width=24%><font size=2 color=#FFF8DC><b>ผู้ถาม[วันที่ถาม]</b></font></td>\n";
		echo "\t<td align=center width=18%><font size=2 color=#FFF8DC><b>จำนวนคำตอบ</b></font></td>\n";
		echo "</tr>\n\n";

		// วนลูปแสดงข้อมูลที่อ่านได้
		while ($row = mysql_fetch_array($result)) {
			
			// กำหนดสีของตาราง เพื่อให้มีการสลับสี
			$bgc = ($bgc=="lightcyan") ? "powderblue" : "lightcyan";

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
			    echo "\t<td align=center><img src='../webboard/img/openfd.gif'> $No</td>\n";
			}
			else {
			    if($Date==$chk_date) {
				    echo "\t<td align=center><img src='../webboard/img/newfd.gif'> $No</td>\n";
				} 
				else {
				    echo "\t<td align=center><img src='../webboard/img/closefd.gif'> $No</td>\n";
				}
			}

			echo "\t<td><a href='show.php?Category=$Category&No=$row[No]' target='$No'>$Question</a></td>\n";
			
			if($Member) {
				echo "\t<td>$Name <font size=1 color=red><b>M</b></font> [$Date]</td>\n";
			}
			else {
				echo "\t<td>$Name [$Date]</td>\n";
			}
						
			// ตรวจสอบว่ามีคนตอบคำถามหรือยัง
			if($ReplyDate!="") {
				echo "\t<td>$Reply <font color=blue>[$ReplyDate]</font></td>\n";
			}
			else {
				echo "\t<td>$Reply</td>\n";
			}
			echo "</tr>\n\n";
		}
		echo "</table>\n\n";

		// table อธิบายความหมายของรูป
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<img src='../webboard/img/newfd.gif'> - คำถามใหม่ \n";
		echo "\t<img src='../webboard/img/closefd.gif'> - คำถามเก่า \n";
		echo "\t<img src='../webboard/img/openfd.gif'> - คำถามที่ถูกตอบแล้ว\n";
		echo "\t<font size=1 color=red><b>M</b></font> - สมาชิกเว็บบอร์ด\n";
		echo "</td></tr>\n";
		echo "</table>\n\n";

		// table แสดงเลขหน้า
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<font size=2 color=#9400D3>\n";

		// สร้าง link เพื่อไปหน้าก่อน-หน้าถัดไป
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			echo "\t<a href='../webboard/search.php?Category=$Category&page=$prevpage&search=$search'>[หน้าก่อน = $prevpage]</a>\n";
		}

		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";

		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='../webboard/search.php?Category=$Category&page=$nextpage&search=$search'>[หน้าถัดไป = $nextpage]</a>\n";
		}

		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";
		echo "\t<font size=2 face='MS Sans Serif'>\n";

		// วนลูปแสดงเลขหน้าทั้งหมด
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='../webboard/search.php?Category=$Category&page=$i&search=$search'>$i</a> \n";
		}
		echo "\t<font size=2 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='../webboard/search.php?Category=$Category&page=$i&search=$search'>$i</a> \n";
		}
	
		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "</table>\n";
	}
?>

<font size=2 face="MS Sans Serif">
[ <a href="../webboard/postq.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">ตั้งคำถามใหม่</a> ]
<font>
<hr color=1E90FF>
<font size=1 face="MS Sans Serif">
	<b>Copy<font color=FF1493>LEFT</font> and Powered By : <a href=mailto:sansak@engineer.com>Sansak</a></b>
</font>
</center>
</body>
</html>