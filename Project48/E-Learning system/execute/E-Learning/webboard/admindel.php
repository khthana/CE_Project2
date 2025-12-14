<?
/* 
 * **********************************************
 * **     PHP - WebBoard : Delete Question     **
 * **********************************************
 * *                                            *
 * * Developed By : Sansak Chairattanatrai      *
 * * E-mail :  sansak@engineer.com              *
 * * UIN : 5590582                              *
 * * License : SamChai Public Soft Group(tm).   *
 * *                                            *
 * **********************************************
 */  

	require("config.inc.php");
	
?>

<html>
<head>
<title>PHP Uiltemate Webboard 2.10</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style type="text/css">
<!--
.style1 {font-size: 18px}
-->
</style>
</head>

<style type="text/css">
<!-- 
BODY {font-family:;font-size="10"}
A:link {text-decoration: none; color: blue }
A:visited {text-decoration: none; color: blue }
A:hover {text-decoration: none; color: darkorange }
A:active {text-decoration: none; color: blue }
p, div, td, ul li, ol li { font-family:  MS Sans Serif, Microsoft Sans Serif;  font-size: 10pt }
.style3 {font-size: 22px}
-->
</style>

<body background="../webboard/img/whpaper.gif">
	<font size=2 face="Arial,MS Sans Serif">
    </font>
	<h2 class="style1"> <font color=blue face="Arial,MS Sans Serif"><span class="style3">ระบบลบข้อมูลของ</span> PHP - Ultimate Webboard <font color=red>2.10</font> </font></h2>
	

    <?
	
	
	// µÃÇ¨ÊÍº¡ÒÃÅº
	 if($action=="delete") {
		del_QA($mode,$qno,$ano);
		exit();
	}

?>
<br>
<center>
	  <form method=post action="admindel.php?action=delete">
	<table border=0>
	<tr><td>
		<table border=1 width=280 bordercolor=#1E90FF bgcolor=E0FFFF cellpadding=2 cellspacing=0>
			<tr><td>
			      <input type="radio" name="mode" value="question">
			หมายเลขคำถาม<br>
			    <div align="center">(กระทู้)</div></td>
			<td><input type="text" name="qno" size=20 maxlength=20></td></tr>
		</table>
		<br>
		<table border=1 width=280 bordercolor=#1E90FF bgcolor=E0FFFF cellpadding=2 cellspacing=0>
			<tr><td><input type="radio" name="mode" value="answer">
			หมายเลขคำตอบ</td>
			<td><input type="text" name="ano" size=20 maxlength=20></td></tr>
		</table>
	</td></tr>
	</table>
	<br>
	<input type="submit" value=">ลบ<">
	<input type="reset" value="ยกเลิก">
	</form>

	<? footer(); ?>

</center>
</body>
</html>

<?
	// function ·Õèãªéã¹¡ÒÃÅº ¤Ó¶ÒÁ-¤ÓµÍº
function del_QA($mode,$qno,$ano) {
	require("config.inc.php");
		
	// µÃÇ¨ÊÍº¢Ñé¹µÍ¹áÅĞ¤èÒ·ÕèÊè§ÁÒÇèÒ¶Ù¡µéÍ§ËÃ×ÍäÁè
	if(!$mode) {
		err_msg("Error : Method","¡ÃØ³ÒàÅ×Í¡ÇÔ¸ÕÅº´éÇÂ","");
	}
	if($mode=="question" && !$qno) {
		err_msg("Error : Method","¡ÃØ³ÒãÊèËÁÒÂàÅ¢¤Ó¶ÒÁ(¡ÃĞ·Ùé)´éÇÂ","");
	}
	if($mode=="answer" && !$ano) {
		err_msg("Error : Method","¡ÃØ³ÒãÊèËÁÒÂàÅ¢¤ÓµÍº´éÇÂ","");
	}

	$num = ($mode=="question") ? $qno : $ano;
	$table = ($mode=="question") ? "webboard_data" : "webboard_ans";
	$msg = ($mode=="question") ? "¤Ó¶ÒÁ(¡ÃĞ·Ùé)" : "¤ÓµÍº";

	// µÃÇ¨ÊÍºÇèÒÁ¤Ó¶ÒÁ(¡ÃĞ·Ùé) áÅĞ¤ÓµÍºÕ¹ÕéËÃ×ÍäÁè
	mysql_connect($host,$user,$passwd);
	$sql = "select * from $table where No='$num'";
	$result = mysql_db_query($dbname,$sql);
	$NRow = mysql_num_rows($result);

	if($NRow==0) {
		err_msg("äÁè¾º$msg ËÁÒÂàÅ¢ $num ã¹°Ò¹¢éÍÁÙÅ","¡ÃØ³ÒµÃÇ¨ÊÍºËÁÒÂàÅ¢ÍÕ¡¤ÃÑé§","");
	}

	if($mode=="question") {
		// sql string ·Õèãªéã¹¡ÒÃÅº ¤Ó¶ÒÁ(¡ÃĞ·Ùé) áÅĞ¤ÓµÍº¢Í§¡ÃĞ·Ùé¹Ñé¹æ
		$del_question = "DELETE FROM webboard_data WHERE No='$num'";
		$del_answer = "DELETE FROM webboard_ans WHERE QuestionNo='$num'";
		$result1 = mysql_db_query($dbname,$del_question);
		$result2 = mysql_db_query($dbname,$del_answer);

		if(!$result1 && !$result2) {
			err_msg("ÁÕ¢éÍ¼Ô´¾ÅÒ´·ÕèÃĞºº","¡ÃØ³Òá¨é§ admin ãËéµÃÇ¨ÊÍº´éÇÂ¤ÃÑº","");
		}
		else {
			echo "<center>";
			echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
			echo "<tr><td align=center>";
			echo "<font size=2 face='MS Sans Serif'>";
			echo "<font size=3 color=red><b>Åº¢éÍÁÙÅàÃÕÂºÃéÍÂáÅéÇ</b></font><br><br>";
			echo "$msg ËÁÒÂàÅ¢ <font color=blue><b>$num</b></font> áÅĞ¤ÓµÍº·Ñé§ËÁ´ ä´é¶Ù¡ÅºÍÍ¡¨Ò¡°Ò¹¢éÍÁÙÅáÅéÇ¤ÃÑº";
			echo "</font></td></tr></table>";
			echo "<br><hr width=500 color=blue>";
			echo "<font size=2 face='MS Sans Serif'>";
			echo "[<a href='javascript:history.back(1)'>Back</a>]";
			echo "</font>";
			echo "</center>";
			exit();
		}
	} 

	else {
		$del_sql = "DELETE FROM webboard_ans WHERE No='$num'";
		$result = mysql_db_query($dbname,$del_sql);

		if(!$result) {
			err_msg("ÁÕ¢éÍ¼Ô´¾ÅÒ´·ÕèÃĞºº","¡ÃØ³Òá¨é§ admin ãËéµÃÇ¨ÊÍº´éÇÂ¤ÃÑº","");
		}
		else {
			echo "<center>";
			echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
			echo "<tr><td align=center>";
			echo "<font size=2 face='MS Sans Serif'>";
			echo "<font size=3 color=red><b>Åº¢éÍÁÙÅàÃÕÂºÃéÍÂáÅéÇ</b></font><br><br>";
			echo "$msg ËÁÒÂàÅ¢ <font color=blue><b>$num</b></font> ä´é¶Ù¡ÅºÍÍ¡¨Ò¡°Ò¹¢éÍÁÙÅáÅéÇ¤ÃÑº";
			echo "</font></td></tr></table>";
			echo "<br><hr width=500 color=blue>";
			echo "<font size=2 face='MS Sans Serif'>";
			echo "[<a href='javascript:history.back(1)'>Back</a>]";
			echo "</font>";
			echo "</center>";
			exit();
		}
	}
}

function err_msg($topic,$detial,$url) {
	echo "<center>";
	echo "<table width=60% border=1 bordercolor=#ff69b4 bgcolor=#f0ffff cellpadding=2 cellspacing=0>";
	echo "<tr><td align=center>";
	echo "<font size=2 face='MS Sans Serif'>";
	echo "<font size=3 color=red><b>$topic</b></font><br><br>";
	echo $detial;
	echo "</font></td></tr></table>";
	echo "<br>";
	echo "<font size=2 face='MS Sans Serif'>";
	if(!$url) {
		echo "[<a href='javascript:history.back(1)'>Back</a>]";
	} 
	else {
		echo "[<a href='$url'>Back</a>]";
	}
	echo "</font><br><br>";
	footer();
	echo "</center>";
	exit();
}

function footer() {
	echo "<hr color=1E90FF>";
	echo "<font size=1 face='MS Sans Serif'>";
	echo "<b>Copy<font color=FF1493>LEFT</font> and Powered By : <a href=mailto:sansak@engineer.com>Sansak</a></b>";
	echo "</font>";
}
?>