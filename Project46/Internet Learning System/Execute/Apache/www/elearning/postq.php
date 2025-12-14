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
			print "<meta http-equiv=\"refresh\" content=\"0;URL=postq.php?Category=$Category&page=1\">";
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
		print "<meta http-equiv=\"refresh\" content=\"0;URL=postq.php?Category=$Category&page=1\">";
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
	
if (!((isset($_SESSION['user'])) && (($rstatus==0 || $rstatus==1) || ($rstatus==2 && ($within==1)))))
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ตั้งคำถาม</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
	<link rel='stylesheet' type='text/css' href='style.css' />
	
<body>
<center>
  <form method=post action="post.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>" name="webForm" onsubmit="return check()" ENCTYPE="multipart/form-data">
    <p><font color="#CC0000" size="5">&lt;&lt;&lt; <? print $renname; ?> &gt;&gt;&gt;</font></p>
    <table border=1 bordercolor=#FF9900 bgcolor=#FFEECC cellpadding=2 cellspacing=0>
	<tr><td align=center class="headfont">คำถาม</td><td><input type=text name="QTitle" size=50 maxlength=100></td></tr>
	<tr><td align=center valign=top class="headfont">รายละเอียด</td><td><textarea rows="7" cols="50" name="QNote"></textarea></td></tr>
	<tr><td align=center class="headfont">โดย</td><td><input type=text name="QName" size=50 maxlength=50></td></tr>
	<tr><td align=center class="headfont">E-mail</td><td><input type=text name="QEmail" size=35 maxlength=50>
        </td>
      </tr>
	<tr><td align=center colspan=2 class="defaultfont">
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
	</td></tr>
	<tr><td align=center colspan=2>
		<table border=0>
            <tr> 
              <td width="396" align=center class="headfont">  เลือกรูป 
                <input type="file" name="QPic"> </td>
            </tr>
          </table>
	</td></tr>
	</table>
	<br>
	<input type=submit value="ส่งคำถาม"> 
    <input type=reset value="ยกเลิก">
	</form>

	
   [ <a href="webboard.php?Category=<? echo $Category; ?>&page=<? echo $page; ?>">แสดงคำถาม</a> 
  ] 
</center>


<script language="JavaScript">
<!--
function check()
{
      var v1 = document.webForm.QTitle.value;
      var v2 = document.webForm.QNote.value;
      var v3 = document.webForm.QName.value;
        if ( v1.length==0)
           {
           alert("กรุณาป้อนคำถามครับ");
           document.webForm.QTitle.focus();           
           return false;
           }
        else if (v2.length==0)
           {
           alert("กรุณาป้อนรายละเอียด");
           document.webForm.QNote.focus();           
		   return false;
           }
        else if (v3.length==0)
           {
           alert("กรุณาป้อนชื่อผู้ถาม");
           document.webForm.QName.focus();           
		   return false;
           }
        else
           return true;
}

function setsmile(what)
{
	document.webForm.QNote.value = document.webForm.elements.QNote.value+" "+what;
	document.webForm.QNote.focus();
}

//-->
</script>
</body>
</html>
