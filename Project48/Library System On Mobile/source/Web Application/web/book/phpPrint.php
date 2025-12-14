<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");


@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	$a_date = "$a $b $c";

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
	
	$sql = "select * from book where id = '$id'";
	$db_query = mysql_db_query ($dbname, $sql);
?>
<html>
<head>
<title>:: ระบบห้องสมุดบนมือถือ ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="discuss.css" type="text/css">
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<table width="95%" border="0" cellspacing="0" cellpadding="2" align="center">
  <tr> 
    <td><span class="Tahoma25"><b>:: ดูก่อนพิมพ์ ::</b></span></td>
  </tr>
</table>
<br>
<?php
$nums_rows = mysql_num_rows($db_query);
		
	if ($nums_rows < 1 )
		{
			echo ("<font color=\"red\">ไม่มีข้อมูลแสดง1</font>");
			exit;
		}	// จบ if


	for ($i=0;$i<$nums_rows;$i++)	// เริ่มรับข้อมูลจากฟิลด์ต่าง ๆ ในตาราง question1
		{
			$result = mysql_fetch_array($db_query);
							@$catalog = $result[catalog];
							@$code = $result[code];
							@$name_book = $result[name_book];
							@$writer = $result[writer];
							@$company = $result[company];
							@$year_print = $result[year_print];
							@$isbn = $result[isbn];
							@$price = $result[price];
							@$name_borrow = $result[name_borrow];
						   @ $return_book = $result[return_book];
							@$datetime = $result[datetime];
							@$detail = $result[detail];
							@$pic = $result[pic];
							@$name_borrow = $result[total_borrow];
							@$datetime = $result[datetime];
							@$id = $result[id];
							@$status = $result[status];
							@$status1 = $result[status];
							@$status2 = $result[status];
		}

echo "<table width=\"95%\" border=\"0\" cellspacing=\"1\" cellpadding=\"3\" align=\"center\">\n";
echo "<tr bgcolor=\"#333366\">\n";
echo "<td width=\"24%\" class=\"Tahoma11\"><b><font color=\"#CCFF00\">::ชื่อหนังสือ ::</font></b></td>\n";
echo "<td width=\"76%\" class=\"Tahoma11\"><b><font color=\"#CCFF00\">:: รายละเอียด ::</font></b></td>\n";
echo "</tr>\n";
echo "<tr bgcolor=\"#7172A8\" valign=\"top\">\n";
echo "<td width=\"24%\" class=\"Tahoma13\">\n";
echo "<p><b><font color=\"#FFFFCC\"><b>$name_book</b></font></b><br>\n";

		echo "</p>\n";
		echo "<table width=\"98%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">หมู่ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$catalog</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">รหัส :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$code</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ผู้แต่ง :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$writer</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">สำนักพิมพ์ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$company</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ปีที่พิมพ์ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$year_print</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ISBN :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$isbn</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ราคา :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$price</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">คนที่ยืม :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$name_borrow</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">กำหนดส่งคืน :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$return_book</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ถูกยืมมาแล้ว :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$status1</font></b></td>\n";
		echo "</tr>\n";
		echo "</table>\n";
		echo "<br>\n";
		
	

echo "<br>\n";
echo "<table width=\"98%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n";
echo "<tr>\n";
echo "<td align=\"center\" bgcolor=\"#8585C2\" class=\"Tahoma13\"><span class=\"Tahoma13\"><b>:: คะแนนโหวต ::</b></span></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td align=\"center\" class=\"Tahoma13\" bgcolor=\"#9999CC\">$status</td>\n";
echo "</tr>\n";
echo "</table>\n";
echo "<br>\n";
echo "</td>\n";
echo "<td width=\"76%\" class=\"Tahoma13\"><br>\n";
echo "<br>\n";
echo "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n";
echo "<tr>";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\" bgcolor=\"#000000\"><img src=\"webboard/blank.gif\" width=\"1\" height=\"1\"></td>\n";
echo "</tr>\n";

echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><img src=\"webboard/blank.gif\" width=\"1\" height=\"2\"></td>\n";

echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma13\"><font color=\"#fafafa\" size=\"4\"><b>$detail</b><br>&nbsp;</font></td>";
echo "</tr>\n";

echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\" bgcolor=\"#000000\"><img src=\"webboard/blank.gif\" width=\"1\" height=\"1\"></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><img src=\"img/blank.gif\" width=\"1\" height=\"5\"><br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;</td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\"></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><font color=\"#000000\"></font><font color=\"#993366\"> </font></td>\n";
echo "</tr>\n";
echo "</table>\n";
echo "</td>\n";
echo "</tr>\n";
echo "<tr bgcolor=\"#333366\">\n";
echo "<td width=\"24%\" class=\"Tahoma13\" align=\"center\" bgcolor=\"#000000\"><font color=\"#FFFFFF\"><DIV align=right><b>Today :<b>\n";
echo"$a_date";
echo"<b> เวลา:</>$d<b>น.</b></DIV><BR></font></td>\n";
echo "<td width=\"76%\" class=\"Tahoma13\">";
echo "<a href=\"list.php\">";
echo "<img src=\"webboard/home_small.gif\" width=\"16\" height=\"16\" hspace=\"5\" border=\"0\"alt=\"หน้าแรก\">";
echo "</a>";

echo "</td>\n";
echo "</tr>\n";
echo "</table>\n";


		

?>
<br>
</body>
</html>
