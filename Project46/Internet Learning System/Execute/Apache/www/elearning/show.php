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
		if($result)
		{
			$Category="";
			print "<meta http-equiv=\"refresh\" content=\"0;URL=webboard.php?Category=$Category&page=1\">";
			exit();
		}
	}

	if(!$No)
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

	include("config.inc.php");
?>
	<html>
	<head>
	<title>แสดงเนื้อหาของกระทู้</title>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
	</head>
	<link rel='stylesheet' type='text/css' href='style.css' />

	<body>
<?

	// ติดต่อ database เพื่ออ่านข้อมูล
	mysql_connect($host,$iduser,$passwd);
	$sql = "select * from webboard_data where No='$No'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);
	
	if($NRow==0) { echo "Error"; exit(); }

	$row = mysql_fetch_array($result);
	// กำหนดค่าตัวแปร เพื่อนำไปแสดง
	$Question = $row["Question"];
	$Note = $row["Note"];
	$Name = $row["Name"];
	$Member = $row["Member"];
	$Email = $row["Email"];
	$Date = $row["Date"];
	$Image = $row["Image"];

	// ตรวจสอบรูปแบบการแสดง IP Address 
	switch ($showIP) {
		case "ALL" : $IP = "(".$row["IP"].")"; break;
		case "BAN" : $IP = "(".substr($row["IP"],0,strrpos($row["IP"],".")).".*)"; break;
		case "NONE": $IP = ""; break;
		default : $IP = $row["IP"];
	}
/*
	if($Member) {
		$sql = "select * from webboard_member where User='$Name'";
		$result = mysql_db_query($dbname,$sql);
		$NRow = mysql_num_rows($result);
	
		if($NRow==0) { echo "Error"; exit(); }

		$row = mysql_fetch_array($result);
		// กำหนดค่าตัวแปร เพื่อนำไปแสดง
		$ICQ = $row["ICQ"]; 
		$WebName = $row["WebName"];
		$URL = $row["URL"];
	}
*/
	// แสดงข้อมูลของคำถาม(กระทู้)
?>
<p align="center"><font color="#CC0000" size="5">&lt;&lt;&lt; <? print $renname; ?> 
  &gt;&gt;&gt;</font></p>
<table align="center" border=1 width=600 bordercolor=#FFCC99 cellspacing=0 cellpadding=4>
	<tr><td align=center bgcolor=#FF9900 class="headmenu">
	<b><? print $Question; ?></b>
	</td></tr>

	<tr><td>
	<br>
		<table border=0 width=590 align=center>
		<tr><td class="defaultfont">
<?
		// ตรวจสอบว่ามีรูปหรือไม่
		if($Image) {

//			<img src="showimage.php?table=data&No=$No">;

		$sql = "select image from webboard_data where No='$No'";
		$result = mysql_db_query($dbname,$sql);
		$row = mysql_fetch_row($result);
		echo "<img src=\"$row[0]\">;";
		}
?>
		<br>
		<font size=2><? print $Note; ?></font>
		</td></tr>
		</table>
		<br>
		</td></tr>

	<tr><td>
		<table border=0 align=center width=100%>
		<tr><td align=left class="headfont">
<?
		if($Member){
?>
			<a href="profile.php?Name=<? print $Name; ?>" target="<? print $Name; ?>"><img src="img/profile.gif" border=0 alt="<? print $Name; ?>'s Profile"></a>
<?
			if($URL!="http://") {
	?>
				<a href='$URL' target='$URL'><img src=\"img/home.gif\" alt='$WebName' border=0></a>
	<?
			}
			if($ICQ) {
?>
				<img src=<? print "\"http://online.mirabilis.com/scripts/online.dll?icq=$ICQ&img=$ICQ_Image_Type"."online.gif\"" ?> alt='ICQ - <? print $ICQ; ?>'>
<?
			}
		}

?>
		</td>
		<td align=right class="headfont">
<?

		// ตรวจสอบการแสดงรูปกราฟฟิกซองจดหมาย
		if($Email!="") {
			// เลือกระบบการส่งอีเมล์
			switch ($s_mail) {
				case "1" : 	echo "\t\tโดยคุณ <a href=\"mail2me.php?wemail=$Email&name=$Name&question=$Question\" target=\"mail2me$No\">$Name <img src='../webboard/img/email.gif' border=0 alt='Mail to $Name'></a> \n"; break;
				case "2" : echo "\t\tโดยคุณ <a href=mailto:$Email>$Name <img src='../webboard/img/email.gif' border=0 alt='Mail to $Name'></a> \n"; break;
				default : echo "\t\tโดยคุณ <a href=\"mail2me.php?wemail=$Email&name=$Name&question=$Question\" target=\"mail2me\">$Name <img src='../webboard/img/email.gif' border=0 alt='Mail to $Name'></a> \n";
			}
		}
		else {
?>
			โดยคุณ <? print $Name; ?>
<?
		}

		echo "\t\t$IP\n";
		echo "\t\t[$Date]\n";
?>
		</td></tr>
		</table>

	</td></tr>
	</table>
<div align="left"></div>
<div align="center"></div>
<center>
  <br>

<?
	// ส่วนแสดงคำตอบของคำถาม(กระทู้)
	$sql = "select * from webboard_ans where QuestionNo='$No' order by No ". $order; 
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

	if($order=="ASC") $i = 1; else $i = $NRow; 

	if($result==0) { 
		echo "<b>Error</b>"; 
		exit();
	} 

	// วนลูปแสดงข้อมูลที่อ่านได้
	while ($row = mysql_fetch_array($result)) {
//	while ($NRow>=$i) {
//		$row = mysql_fetch_array($result)
		// กำหนดค่าตัวแปร เพื่อนำไปแสดง
		$QuestionNo = $row["No"];
		$Name = $row["Name"];
		$Member = $row["Member"];
		$Email = $row["Email"];
		$Msg = $row["Msg"];
		$Date = $row["Date"];
		$Image = $row["Image"];
		
		// ตรวจสอบรูปแบบการแสดง IP Address 
		switch ($showIP) {
		case "ALL" : $IP = "(".$row["IP"].")"; break;
		case "BAN" : $IP = "(".substr($row["IP"],0,strrpos($row["IP"],".")).".*)"; break;
		case "NONE": $IP = ""; break;
		default : $IP = $row["IP"];
		}
/*
		if($Member) {
			$sql2 = "select * from webboard_member where User='$Name'";
			$result2 = mysql_db_query($dbname,$sql2);
			$NRow2 = mysql_num_rows($result2);
	
			if($NRow2==0) { echo "Error"; exit(); }

			$qrow = mysql_fetch_array($result2);
			// กำหนดค่าตัวแปร เพื่อนำไปแสดง
			$ICQ = $qrow["ICQ"];
			$WebName = $qrow["WebName"];
			$URL = $qrow["URL"];
		}
*/
?>
		<table border=1 width=600 bordercolor=#FFCCBB cellpadding=2 cellspacing=0>
		<tr><td>

			<table border=0 width=590 align=center>
			<tr><td align=left class="headfont">
			
<?
			// ตรวจสอบการแสดงรูปกราฟฟิกซองจดหมาย
			if($Email!="") {
				// เลือกระบบการส่งอีเมล์
				switch ($s_mail) {
					case "1" : 	echo "\t\tโดยคุณ <a href=\"mail2me.php?wemail=$Email&name=$Name&question=$Question\" target=\"mail2me$No\">$Name <img src='../webboard/img/email.gif' border=0 alt='Mail to $Name'></a> \n"; break;
					case "2" : echo "\t\tโดยคุณ <a href=mailto:$Email>$Name <img src='../webboard/img/email.gif' border=0 alt='Mail to $Name'></a> \n"; break;
					default : echo "\t\tโดยคุณ <a href=\"mail2me.php?wemail=$Email&name=$Name&question=$Question\" target=\"mail2me\">$Name <img src='../webboard/img/email.gif' border=0 alt='Mail to $Name'></a> \n";
				}
			}
			else {
				echo "\t\tโดยคุณ $Name \n";
			}
			echo "\t\t$IP\n";
			echo "\t\t[$Date] #$QuestionNo ($i/$NRow)\n";
?>
			
			</td>

			<td align=right class="headfont">
<?
/*
			if($Member){
				echo "\t\t<a href=\"profile.php?Name=$Name\" target=\"$Name\"><img src=\"img/profile.gif\" border=0 alt=\"$Name's Profile\"></a>\n";
				if($URL!="http://") {
					echo "\t\t<a href='$URL' target='$URL'><img src=\"img/home.gif\" alt='$WebName' border=0></a>\n";
				}
				if($ICQ) {
					echo "\t\t<img src=\"http://online.mirabilis.com/scripts/online.dll?icq=$ICQ&img=$ICQ_Image_Type"."online.gif\" alt='ICQ - $ICQ'>\n";
				}
			}
*/
?>
			</td>
			</tr></table>

			<table border=0 width=590 align=center>
			<tr><td class="defaultfont">
<?
			// ตรวจสอบว่ามีรูปหรือไม่
			if($Image) {
//				echo "\t\t<img src=\"showimage.php?table=ans&No=$QuestionNo\"><br>\n";

				$sql1 = "select image from webboard_ans where No='$QuestionNo'";
				$result1 = mysql_db_query($dbname,$sql1);
				$row1 = mysql_fetch_row($result1);
				echo "<img src=\"$row1[0]\">;";
			}
?>
			<br>
			<font size=2 face='MS Sans Serif'><? print $Msg; ?></font>
			</td></tr>
			</table>

		</td></tr>
		</table>
		
  <br>
<?
		if($order=="ASC") $i++; else $i--;
	}
if ((isset($_SESSION['user'])) && (($rstatus==0 || $rstatus==1) || ($rstatus==2 && ($within==1))))
{
?>

<? // ฟอร์มรับข้อมูลของคำตอบ ?>
<form method=post action="reply.php?Category=<? echo $Category;?>&No=<? echo $No ?>" name="webForm" onsubmit="return check()" ENCTYPE="multipart/form-data"> 
<table border=1 bordercolor=#FFCC99 bgcolor=#FFDEAD cellpadding=2 cellspacing=0>
<tr bgcolor=000000><td align=center bgcolor="#FF9900" class="headmenu">
  ขอเชิญร่วมตอบคำถามครับ
</td></tr>
<tr><td><table border=0>
<tr>
  <td align=right valign=top class="headfont">ความคิดเห็น</td>
  <td><textarea name="Msg" cols=50 rows= 5></textarea></td>
</tr>
<tr>
  <td align=right class="headfont">โดย</td>
  <td><input size=50 type=text name="MsgBy" maxlength=50></td>
</tr>
<tr>
  <td align=right class="headfont">Email</td>
  <td><input size=35 type=text name="Email" maxlength=50>
              </td>
</tr>
</table>
</td></tr>
<tr>
  <td align=center class="defaultfont">
  <a href="javascript:setsmile(':smile:')"><img src="pic/smile.gif" border=0></a>
	<a href="javascript:setsmile(':sad:')"><img src="pic/frown.gif" border=0></a>
	<a href="javascript:setsmile(':red:')"><img src="pic/redface.gif" border=0></a>
	<a href="javascript:setsmile(':big:')"><img src="pic/biggrin.gif" border=0></a>
	<a href="javascript:setsmile(':ent:')"><img src="pic/blue.gif" border=0></a>
	<a href="javascript:setsmile(':shy:')"><img src="pic/shy.gif" border=0></a>
	<a href="javascript:setsmile(':sleepy:')"><img src="pic/sleepy.gif" border=0></a>
	<a href="javascript:setsmile(':sun:')"><img src="pic/sunglasses.gif" border=0></a>
	<a href="javascript:setsmile(':sg:')"><img src="pic/supergrin.gif" border=0></a>
	<a href="javascript:setsmile(':embarass:')"><img src="pic/embarass.gif" 	border=0></a>
	<a href="javascript:setsmile(':dead:')"><img src="pic/dead.gif" border=0></a>
	<a href="javascript:setsmile(':cool:')"><img src="pic/cool.gif" border=0></a>
	<a href="javascript:setsmile(':clown:')"><img src="pic/clown.gif" border=0></a>
	<a href="javascript:setsmile(':pukey:')"><img src="pic/pukey.gif" border=0></a><br>
	<a href="javascript:setsmile(':eek:')"><img src="pic/eek.gif" border=0></a>
	<a href="javascript:setsmile(':roll:')"><img src="pic/sarcblink.gif" border=0></a>
	<a href="javascript:setsmile(':smoke:')"><img src="pic/smokin.gif" border=0></a>
	<a href="javascript:setsmile(':angry:')"><img src="pic/reallymad.gif" border=0></a>
	<a href="javascript:setsmile(':confused:')"><img src="pic/confused.gif" 	border=0></a>
	<a href="javascript:setsmile(':cry:')"><img src="pic/crying.gif" border=0></a>
	<a href="javascript:setsmile(':lol:')"><img src="pic/lol.gif" border=0></a>
	<a href="javascript:setsmile(':yawn:')"><img src="pic/yawn.gif" border=0></a>
	<a href="javascript:setsmile(':devil:')"><img src="pic/devil.gif" border=0></a>
	<a href="javascript:setsmile(':tongue:')"><img src="pic/tongue.gif" border=0></a>
	<a href="javascript:setsmile(':alien:')"><img src="pic/aysmile.gif" border=0></a>
	<a href="javascript:setsmile(':tasty:')"><img src="pic/tasty.gif" border=0></a>
	<a href="javascript:setsmile(':crazy:')"><img src="pic/grazy.gif" border=0></a><br>
	คลิกที่รูป เพื่อแทรกรูปลงในข้อความ
  </td>
</tr>
<tr>
  <td>
  <table border=0>
            <tr> 
              <td width="441" align=right class="headfont">เลือกรูป 
                <input type="file" name="QPic"></td>
            </tr>
          </table>
</tr>
</table>
<br>
<input type=submit value="Post message" name="submit">
<input type=reset value="Clear" name="reset">
</form>
<?
}
?>

  <font size=2 face="MS Sans Serif"> [ <a href="javascript:window.close()">ปิดหน้าต่างนี้</a> 
  ] </font> <font size=1 face="MS Sans Serif"> </font> 
</center>

<script language="JavaScript">
<!--
function check()
{
      var v1 = document.webForm.Msg.value;
      var v2 = document.webForm.MsgBy.value;
        if ( v1.length==0)
           {
           alert("กรุณาป้อนรายละเอียด");
           document.webForm.Msg.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณาป้อนชื่อ");
           document.webForm.MsgBy.focus();           
		   return false;
           }
        else
           return true;
}

function setsmile(what)
{
	document.webForm.Msg.value = document.webForm.elements.Msg.value+" "+what;
	document.webForm.Msg.focus();
}
//-->
</script>

</body>
</html>