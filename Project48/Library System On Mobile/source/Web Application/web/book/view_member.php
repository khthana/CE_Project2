<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");
$login_name="";
$login_password="";

if(isset($Session[@login_name]))
	@$login_name=$Session[login_name];	

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
	
	$sql = "select * from member where login_name = '$login_name' ";
	$db_query = mysql_db_query ($dbname, $sql);
	
	$nums_rows = mysql_num_rows($db_query);
		
	if ($nums_rows < 1 )
		{
			print <<< EOT
<TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>กรุณาเข้าสู่ระบบก่อน ถึงจะสามารถดูข้อมูลได้ .............</b> </center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="list.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>

EOT;
			exit;
		}	// จบ if


	for ($i=0;$i<$nums_rows;$i++)	// เริ่มรับข้อมูลจากฟิลด์ต่าง ๆ ในตาราง question1
		{
			$result = mysql_fetch_array($db_query);
							@$name = $result[name];
							@$surname = $result[surname];
							@$sex = $result[sex];
							@$age = $result[age];
							@$address = $result[address];
							@$tell = $result[tell];
							@$login_name = $result[login_name];
							@$login_password = $result[login_password];
							@$email = $result[email];
						   	
							@$status = $result[status];
							@$status1 = $result[status1];
							@$status2 = $result[status2];
							@$status3 = $result[status3];
						
		}

	$image1 = "image1.gif";
	$image2 = "image2.gif";
	
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
echo "<td width=\"24%\" class=\"Tahoma11\"><b><font color=\"#CCFF00\">::ข้อมูลของ คุณ $login_name เป็นดังี้้ ::</font></b></td>\n";
echo "<td width=\"76%\" class=\"Tahoma11\"><b><font color=\"#CCFF00\">:: รายละเอียด ::</font></b></td>\n";
echo "</tr>\n";
echo "<tr bgcolor=\"#7172A8\" valign=\"top\">\n";
echo "<td width=\"24%\" class=\"Tahoma13\">\n";
echo "<p><b><font color=\"#FFFFCC\"><b></b></font></b><br>\n";

		echo "</p>\n";
		echo "<table width=\"98%\" border=\"0\" cellspacing=\"1\" cellpadding=\"2\">\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">ชื่อ:</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$name</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">นามสกุล:</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$surname</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">อายุ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$age</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">เพศ :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\"><b><font color=\"#990099\">$sex</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">Phone :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$tell</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">user :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$login_name</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#9999CC\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">password :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#9999CC\"><b><font color=\"#990099\">$login_password</font></b></td>\n";
		echo "</tr>\n";
		echo "<tr bgcolor=\"#8585C2\">\n";
		echo "<td class=\"Tahoma11\" align=\"right\" width=\"50%\"><b><font color=\"#990099\">email :</font></b></td>\n";
		echo "<td class=\"Tahoma11\" width=\"50%\" bgcolor=\"#8585C2\"><b><font color=\"#990099\">$email</font></b></td>\n";
		echo "</tr>\n";
		
		echo "</table>\n";
		
	
 
echo "<br>\n";

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
echo "<td valign=\"top\" class=\"Tahoma13\"><img src=\"viewpic_member.php?login_name=$login_name\" border=\"1\" hspace=\"1\"><font color=\"#fafafa\" size=\"4\"><br><br><b>$address</b><br>&nbsp;</font></td>";
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
echo "<td valign=\"top\" class=\"Tahoma11\" align=\"right\"><font color=\"#000000\">IP Address :</font><font color=\"#993366\"> </font></td>\n";
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
echo "<a href=\"edit_member.php?\">";
echo "<img src=\"webboard/write-icon.gif\" width=\"18\" height=\"13\" hspace=\"5\" border=\"0\"alt=\"แก้ไข\">";
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
