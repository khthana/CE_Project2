<?php
session_start();

if(!$delete)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ลบกระทู้ที่ไม่เหมาะสม</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">ลบกระทู้ที่ไม่เหมาะสม</td>
    <td width="28" height="28"><img src="menu/trangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr> 
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="150" height="28" bgcolor="#FF9900" class="headmenu">เมนูหลัก</td>
    <td width="28" height="28"><img src="menu/tlreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td>&nbsp;</td>
    <td width="28" height="28"><img src="menu/trreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr> 
    <td colspan="2" valign="top"><table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FF9900">
        <tr> 
          <td bgcolor="#FFEECC"> 
            <?php include "log.php"; ?>
          </td>
        </tr>
        <tr> 
          <td bgcolor="#FFEECC"> 
            <?php include "menu.php"; ?>
          </td>
        </tr>
      </table>
    </td>
    <td>&nbsp;</td>
    <td>

	  <table width="100%" border="0" cellpadding="0" cellspacing="0">
<?php
if (isset($_SESSION['user']))
{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$rstatus=mysql_result($result,0,"status");
	mysql_close($db);
}
if(isset($_SESSION['user']) && $rstatus==0)
{
	if(!$qno || strlen($qno)>5)
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
		exit();
	}
	else if(!$ano || strlen($ano)>5)
	{
		print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
		exit();
	}
	if($delete) 
	{

		echo "<tr>";
			echo "<td>";

		del_QA($mode,$qno,$ano);

			echo "</td>";
		echo "</tr>";
	}
}
else
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
		</table>
    </td>
    <td width="28">&nbsp;</td>
  </tr>
  <tr> 
    <td width="28" height="28"><img src="menu/dlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td height="28" bgcolor="#FF9900">&nbsp;</td>
    <td width="28" height="28"><img src="menu/dlreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td>&nbsp;</td>
    <td width="28" height="28"><img src="menu/drreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr>
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/dlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td bgcolor="#FF9900">&nbsp;</td>
    <td width="28" height="28"><img src="menu/drangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td>&nbsp;</td>
    <td><div align="center"><font size="1" face="MS Sans Serif, Tahoma, sans-serif"><a href="http://www.kmitl.ac.th/" target="_blank">Copyright 
        &copy;2003 Computer online. All rights reserved<br />
        &copy;2003 Computer online, King Mongkud Institude of Technology Ladkrabang.</a></font></div></td>
    <td width="28">&nbsp;</td>
  </tr>
</table>
<p>&nbsp;</p>
</body>
</html>
<?
	// function ที่ใช้ในการลบ คำถาม-คำตอบ
function del_QA($mode,$qno,$ano) {
	require("config.inc.php");
		
	// ตรวจสอบขั้นตอนและค่าที่ส่งมาว่าถูกต้องหรือไม่
	if(!$mode) {
		err_msg("Error : Method","กรุณาเลือกวิธีลบด้วย","");
	}
	if($mode=="question" && !$qno) {
		err_msg("Error : Method","กรุณาใส่หมายเลขคำถาม(กระทู้)ด้วย","");
	}
	if($mode=="answer" && !$ano) {
		err_msg("Error : Method","กรุณาใส่หมายเลขคำตอบด้วย","");
	}

	$num = ($mode=="question") ? $qno : $ano;
	$table = ($mode=="question") ? "webboard_data" : "webboard_ans";
	$msg = ($mode=="question") ? "คำถาม(กระทู้)" : "คำตอบ";

	// ตรวจสอบว่ามคำถาม(กระทู้) และคำตอบีนี้หรือไม่
	mysql_connect($host,$iduser,$passwd);
	$sql = "select * from $table where No='$num'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

	if($NRow==0) {
		err_msg("ไม่พบ$msg หมายเลข $num ในฐานข้อมูล","กรุณาตรวจสอบหมายเลขอีกครั้ง","");
	}

	if($mode=="question") {
		// sql string ที่ใช้ในการลบ คำถาม(กระทู้) และคำตอบของกระทู้นั้นๆ
		$del_question = "DELETE FROM webboard_data WHERE No='$num'";
		$del_answer = "DELETE FROM webboard_ans WHERE QuestionNo='$num'";
		$result1 = mysql_db_query($dbname,$del_question);
		$result2 = mysql_db_query($dbname,$del_answer);

		if(!$result1 && !$result2) {
			err_msg("มีข้อผิดพลาดที่ระบบ","กรุณาแจ้ง admin ให้ตรวจสอบด้วยครับ","");
		}
		else {
			echo "<center>";
			echo "<table width=60% border=1 bordercolor=#FF9900 bgcolor=#FFEECC cellpadding=1 cellspacing=0>";
			echo "<tr><td align=center class=\"defaultfont\">";
			echo "<font size=4 class=\"warning\"><b>ลบข้อมูลเรียบร้อยแล้ว</b></font><br><br>";
			echo "$msg หมายเลข <b class=\"warning\">$num</b> และคำตอบทั้งหมด ได้ถูกลบออกจากฐานข้อมูลแล้วครับ";
			echo "</td></tr></table>";
			echo "[<a href='javascript:history.back(1)'>Back</a>]";
			echo "</center>";

		echo "</table>";
    echo "</td>";
    echo "<td width=\"28\">&nbsp;</td>";
  echo "</tr>";
  echo "<tr> ";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td height=\"28\" bgcolor=\"#FF9900\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlreangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td>&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/drreangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td colspan=\"2\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td bgcolor=\"#FF9900\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/drangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
  echo "</tr>";
  echo "<tr> ";
    echo "<td colspan=\"2\">&nbsp;</td>";
    echo "<td>&nbsp;</td>";
    echo "<td><div align=\"center\"><font size=\"1\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href=\"http://www.kmitl.ac.th/\" target=\"_blank\">Copyright&copy;2003 Computer online. All rights reserved<br />";
        echo "&copy;2003 Computer online, King Mongkud Institude of Technology Ladkrabang.</a></font></div></td>";
    echo "<td width=\"28\">&nbsp;</td>";
  echo "</tr>";
echo "</table>";
echo "<p>&nbsp;</p>";
echo "</body>";
echo "</html>";

			exit();
		}
	} 

	else {
		$del_sql = "DELETE FROM webboard_ans WHERE No='$num'";
		$result = mysql_db_query($dbname,$del_sql);

		if(!$result) {
			err_msg("มีข้อผิดพลาดที่ระบบ","กรุณาแจ้ง admin ให้ตรวจสอบด้วยครับ","");
		}
		else {
			echo "<center>";
			echo "<table width=60% border=1 bordercolor=#FF9900 bgcolor=#FFEECC cellpadding=1 cellspacing=0>";
			echo "<tr><td align=center class=\"defaultfont\">";
			echo "<font size=4 class=\"warning\"><b>ลบข้อมูลเรียบร้อยแล้ว</b></font><br><br>";
			echo "$msg หมายเลข <b class=\"warning\">$num</b></font> ได้ถูกลบออกจากฐานข้อมูลแล้วครับ";
			echo "</td></tr></table>";
			echo "[<a href='javascript:history.back(1)'>Back</a>]";
			echo "</center>";

		echo "</table>";
    echo "</td>";
    echo "<td width=\"28\">&nbsp;</td>";
  echo "</tr>";
  echo "<tr> ";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td height=\"28\" bgcolor=\"#FF9900\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlreangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td>&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/drreangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td colspan=\"2\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td bgcolor=\"#FF9900\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/drangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
  echo "</tr>";
  echo "<tr> ";
    echo "<td colspan=\"2\">&nbsp;</td>";
    echo "<td>&nbsp;</td>";
    echo "<td><div align=\"center\"><font size=\"1\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href=\"http://www.kmitl.ac.th/\" target=\"_blank\">Copyright&copy;2003 Computer online. All rights reserved<br />";
        echo "&copy;2003 Computer online, King Mongkud Institude of Technology Ladkrabang.</a></font></div></td>";
    echo "<td width=\"28\">&nbsp;</td>";
  echo "</tr>";
echo "</table>";
echo "<p>&nbsp;</p>";
echo "</body>";
echo "</html>";

			exit();
		}
	}
}

function err_msg($topic,$detial,$url) {
	echo "<center>";
	echo "<table width=60% border=1 bordercolor=#FF9900 bgcolor=#FFEECC cellpadding=1 cellspacing=0>";
	echo "<tr><td align=center class=\"defaultfont\">";
	echo "<font size=4 class=\"warning\"><b>$topic</b></font><br><br>";
	echo $detial;
	echo "</td></tr></table>";
	echo "<br>";
	if(!$url) {
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
	} 
	else {
		echo "[<a href='$url'>Back</a>]";
	}
	echo "<br><br>";
	echo "</center>";

		echo "</table>";
    echo "</td>";
    echo "<td width=\"28\">&nbsp;</td>";
  echo "</tr>";
  echo "<tr> ";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td height=\"28\" bgcolor=\"#FF9900\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlreangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td>&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/drreangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
  echo "</tr>";
  echo "<tr>";
    echo "<td colspan=\"2\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/dlangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
    echo "<td bgcolor=\"#FF9900\">&nbsp;</td>";
    echo "<td width=\"28\" height=\"28\"><img src=\"menu/drangle.gif\" width=\"28\" height=\"28\" hspace=\"0\" vspace=\"0\"></td>";
  echo "</tr>";
  echo "<tr> ";
    echo "<td colspan=\"2\">&nbsp;</td>";
    echo "<td>&nbsp;</td>";
    echo "<td><div align=\"center\"><font size=\"1\" face=\"MS Sans Serif, Tahoma, sans-serif\"><a href=\"http://www.kmitl.ac.th/\" target=\"_blank\">Copyright&copy;2003 Computer online. All rights reserved<br />";
        echo "&copy;2003 Computer online, King Mongkud Institude of Technology Ladkrabang.</a></font></div></td>";
    echo "<td width=\"28\">&nbsp;</td>";
  echo "</tr>";
echo "</table>";
echo "<p>&nbsp;</p>";
echo "</body>";
echo "</html>";

	exit();
}
?>