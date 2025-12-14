<?
/* 
 * **********************************************
 * **    PHP - WebBoard : Show All Question    **
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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
	<tr>
	  <td align=left valign=center>
	<strong><FONT face="Arial,MS Sans Serif" size=2><FONT color=blue size=5><B>PHP - Ultimate Webboard <FONT color=red>2.00</FONT></B></FONT></FONT></strong></td>
	<td align=right>
	[ <a href="../webboard/addmember.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">สมัครสมาชิก</a> |
	<a href="../webboard/memberlogin.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">แก้ไขข้อมูลสมาชิก</a> ]
	</td></tr>
	</table>
	<br>

	<center>
	<font face="Arial" size=3 color=#9400D3><strong>สถานที่แลกเปลี่ยนความรู้ของชาว E-Learning</strong></font><br>

	<form method=post action="../webboard/search.php?Category=<? echo $Category; ?>" name="SearchForm" onsubmit="return check()">
	<table width=100% border=0>
	<tr><td align=left>
	<img src="../webboard/img/arrow.gif"> 
	<a href="../webboard/webboard.php?Category=<? echo $Category; ?>">กลับหน้าแรก</a> |  
	<a href="../webboard/postq.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">ตั้งคำถามใหม่</a>
	</td>
	<td align=right>
	ค้นหาคำถาม
	  <input type=text name="search" size=25 maxlength=100>
	<input type=submit value="Search"> 
	</td></tr></table>
	</form>

<?
	include("config.inc.php");
	$chk_date = date("j M Y",mktime( date("H")+$p_hour, date("i")+$p_min ));
	if (empty($page)){
		$page=1;
	}

	//ค้นหาข้อมูลจาก Database 	
	// ตาม Category
	mysql_connect($host,$user,$passwd);
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

	// Query ??????????????????????
	$sql = "select * from webboard_data where Category='$Category' order by No DESC limit $goto,$list_page";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

	if($NRow==0) { 
		echo "<font size=2 face='MS Sans Serif'>ไม่มีคำถามค่ะ</font><br><br>\n";
	}
	// ????????????????
	else {
		echo "<table width=100% border=1 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr bgcolor= dodgerblue>\n";
		echo "\t<td align=center width=11%><font size=2 color=#FFF8DC><b>คำถามที่</b></font></td>\n";
		echo "\t<td align=center width=47%><font size=2 color=#FFF8DC><b>คำถาม</b></font></td>\n";
		echo "\t<td align=center width=24%><font size=2 color=#FFF8DC><b>ผู้ถาม[วันที่ถาม]</b></font></td>\n";
		echo "\t<td align=center width=18%><font size=2 color=#FFF8DC><b>จำนวนคำตอบ</b></font></td>\n";
		echo "</tr>\n\n";

		// ????????????????????????
		while ($row = mysql_fetch_array($result)) {
			
			// ????????????? ???????????????????
			$bgc = ($bgc=="lightcyan") ? "powderblue" : "lightcyan";

			// ??????????????
			$No = sprintf("%05d",$row["No"]);
			$Question = $row["Question"];
			$Name = $row["Name"];
			$Member = $row["Member"];
			$Date = trim(substr($row["Date"],0,11)); // ??????????????
			$Reply = $row["Reply"];
			$ReplyDate = substr($row["ReplyDate"],0,11); // ??????????????

			echo "<tr bgcolor=$bgc>\n";

			// ?????? folder
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
			
			// ???????????????????????????
			if($ReplyDate!="") {
				echo "\t<td>$Reply <font color=blue>[$ReplyDate]</font></td>\n";
			}
			else {
				echo "\t<td>$Reply</td>\n";
			}
			echo "</tr>\n\n";
		}
		echo "</table>\n\n";

		// table ???????????????????
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<img src='../webboard/img/newfd.gif'> - คำถามใหม่ \n";
		echo "\t<img src='../webboard/img/closefd.gif'> - คำถามเก่า \n";
		echo "\t<img src='../webboard/img/openfd.gif'> - คำถามที่ถูกตอบแล้ว\n";
		echo "\t<font size=1 color=red><b>M</b></font> - สมาชิก\n";
		echo "</td></tr>\n";
		echo "</table>\n\n";

		// table ??????????
		echo "<table width=100% border=0 bordercolor=black cellspacing=0 cellpadding=2>\n";
		echo "<tr><td align=left>\n";
		echo "\t<font size=2 color=#9400D3>\n";

		// ???? link ???????????????-????????
		if($page>1 && $page<=$totalpage) {
			$prevpage = $page-1;
			echo "\t<a href='../webboard/webboard.php?Category=$Category&page=$prevpage'>[หน้าก่อน = $prevpage]</a>\n";
		}

		echo "\t กำลังแสดงหน้าที่ $page/$totalpage \n";

		if($page!=$totalpage) {
			$nextpage = $page+1;
			echo "\t<a href='../webboard/webboard.php?Category=$Category&page=$nextpage'>[หน้าถัดไป = $nextpage]</a>\n";
		}

		echo "\t</font>\n";
		echo "</td></tr>\n";
		echo "<tr><td>\n";

		// ?????????????????????
		for($i=1 ; $i<$page ; $i++) {
			echo "\t<a href='../webboard/webboard.php?Category=$Category&page=$i'>$i</a> \n";
		}
		echo "\t<font size=2 color=red><b>$page</b></font> \n";
		for($i=$page+1 ; $i<=$totalpage ; $i++) {
			echo "\t<a href='../webboard/webboard.php?Category=$Category&page=$i'>$i</a> \n";
		}
	
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

<script language="JavaScript">
<!--
function check()
{
      var v1 = document.SearchForm.search.value;
        if ( v1.length==0)
           {
           alert("?????????????????????????");
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