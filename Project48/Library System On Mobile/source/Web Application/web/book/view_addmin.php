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
							@$return_book = $result[return_book];
							@$datetime = $result[datetime];
							@$picture = $result[pic];
							@$detail = $result[detail];
							@$total_borrow = $result[total_borrow];
							@$datetime = $result[datetime];
							@$id = $result[id];
							@$status = $result[status];
							@$status1 = $result[status];
							@$status2 = $result[status];
							@$subject = $result[subject];
							@$id_student = $result[id_student];
		}

	
	
?>


<html>
<head>
<title>:: ระบบห้องสมุดบนมือถือ ::</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="discuss.css" type="text/css">
<script language="JavaScript">
<!-- 
function OpenNewWindow(url,winwidth,winheight) 
{
	NewWindow=window.open(url,'descr','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbar=no,scrollbars=auto,resizable=no,copyhistory=no,width='+winwidth+',height='+winheight)
}
-->
</script>
</head>
<body bgcolor="#10549E" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<!-- ส่วนของคำถาม -->
<?php


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
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">Subject</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$subject</font></b></td>\n";
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
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$total_borrow</font></b></td>\n";
		echo "</tr>\n";
		echo "</table>\n";
		echo "<br>\n";
		echo "<table width=\"98%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n";
		echo "<form method=\"post\" action=\"phpAssignMark.php\">\n";
		echo "<input type=\"hidden\" name=\"FlagType\" value=\"question\">\n";
		echo "<input type=\"hidden\" name=\"qID\" value=\"$id\">\n";
		echo "<tr>\n";
		echo "<td align=\"center\" bgcolor=\"#8585C2\" class=\"Tahoma13\"><span class=\"Tahoma13\"><b>:: ให้คะแนนหนังสือเล่มนี้ ::</b></span></td>\n";
		echo "</tr>\n";
		echo "<tr>\n";
		echo "<td align=\"center\" class=\"Tahoma13\" bgcolor=\"#9999CC\">\n";
		echo "<select size=\"1\" name=\"qMark\" style=\"FONT-SIZE: 10pt; FONT-FAMILY: Arial;\">\n";
		echo "<option value=\"1\" selected>1</option>\n";
		echo "<option value=\"2\">2</option>\n";
		echo "<option value=\"3\">3</option>\n";
		echo "<option value=\"4\">4</option>\n";
		echo "<option value=\"5\">5</option>\n";
		echo "</select>\n";
		echo "<input type=\"image\" border=\"0\" name=\"submit\" src=\"webboard/cmdGo2.gif\" width=\"29\" height=\"17\">\n";
		echo "</td>\n";
		echo "</tr>\n";
		echo "</form>\n";
		echo "</table>\n";
	
  
 
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
echo "<td width=\"76%\" class=\"Tahoma13\"><b><span class=\"Tahoma17\"><center></center></span></b><br>\n";
echo "<br>\n";
echo "<table width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\">\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\" bgcolor=\"#000000\"><img src=\"webboard/blank.gif\" width=\"1\" height=\"1\"></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><img src=\"webboard/blank.gif\" width=\"1\" height=\"2\"></td>\n";
echo "</tr>\n";
echo "<tr>\n";
   

if($picture !==""){
echo "<td valign=\"top\" class=\"Tahoma13\"><img src=\"viewpic.php?id=$id\" border=\"1\" hspace=\"1\"><br><font color=\"#fafafa\" size=\"4\"><b>$detail</b><br>&nbsp;</font></td>";
}
else{
echo "<td valign=\"top\" class=\"Tahoma13\"><img src=\"picture/BookFinal.jpg\" border=\"1\" hspace=\"1\"><br><font color=\"#fafafa\" size=\"4\"><b>$detail</b><br>&nbsp;</font></td>";
}


echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma13\" align=\"center\"></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\" bgcolor=\"#000000\"><img src=\"img/blank.gif\" width=\"1\" height=\"1\"></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><img src=\"img/blank.gif\" width=\"1\" height=\"5\"><br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;</td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\"></td>\n";
echo "</tr>\n";
echo "<tr>\n";
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><font color=\"#000000\">IP Address :</font><font color=\"#993366\"> ใส่หมายเลย IP</font></td>\n";
echo "</tr>\n";
echo "</table>\n";
echo "</td>\n";
echo "</tr>\n";
echo "<tr bgcolor=\"#333366\">\n";
echo "<td width=\"24%\" class=\"Tahoma13\" align=\"center\" bgcolor=\"#000000\"><font color=\"#FFFFFF\"><DIV align=right><b>Today :<b>\n";
echo"$a_date";
echo"<b> เวลา:</>$d<b>น.</b></DIV><BR></font></td>\n";
echo "<td width=\"76%\" class=\"Tahoma13\">";
echo "<a href=\"list_addmin.php\">";
echo "<img src=\"webboard/home_small.gif\" width=\"16\" height=\"16\" hspace=\"5\" border=\"0\"alt=\"หน้าแรก\">";
echo "</a>";
echo "<a href=\"edit.php?id=$id\">";
echo "<img src=\"webboard/icon_edit.gif\" width=\"18\" height=\"13\" hspace=\"5\" border=\"0\"alt=\"แก้ไข\">";
echo "</a>";
echo "<a href=\"borrow_addmin.php?catalog=$catalog&code=$code\">";
echo "<img src=\"webboard/write-icon.gif\" width=\"18\" height=\"13\" hspace=\"5\" border=\"0\"alt=\"ยืมหนังสือ\">";
echo "</a>";
echo "<a href=\"addreturn.php?catalog=$catalog&code=$code\">";
echo "<img src=\"webboard/vote.gif\" width=\"16\" height=\"16\" hspace=\"5\" border=\"0\"alt=\"คืนหนังสือ\">";
echo "</a>";
echo "<a href=\"JavaScript:OpenNewWindow('phpFrmTalkTo.php?id='$id','450','210')\">";
echo "<img src=\"webboard/hotfolder.gif\" width=\"16\" height=\"16\" hspace=\"5\" border=\"0\"alt=\"ส่งข่าวสาร\">";
echo "</a>";
echo "<a href=\"JavaScript:OpenNewWindow('del.php?id=$id','450','210')\">";
echo "<img src=\"webboard/del.gif\" width=\"13\" height=\"13\" hspace=\"5\" border=\"0\"alt=\"ลบ\">";
echo "</a>";
echo "<a href=\"phpPrint_addmin.php?id=$id\">";
echo "<img src=\"webboard/UTIL_print.gif\" width=\"17\" height=\"15\" hspace=\"5\" border=\"0\"alt=\"ดูก่อนพิมพ์\">";
echo "</a>";
echo "</td>\n";
echo "</tr>\n";
echo "</table>\n";
?>
<!-- จบส่วนของคำถาม -->
<!-- ส่วนของคำตอบ -->


    </td>
  </tr>
  <tr> 
    <td bgcolor="#0954BB"><img src="webboard/blank.gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td><img src="img/blank.gif" width="1" height="1"></td>
  </tr>
  <tr> 
    <td bgcolor="#000000"><img src="webboard/blank.gif" width="1" height="1"></td>
  </tr>
</table>

</body>
</html>
