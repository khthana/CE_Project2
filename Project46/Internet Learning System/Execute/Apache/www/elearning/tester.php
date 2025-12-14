<?php
ob_start();
session_start();
if(!$subid)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=teslist.php\">";
	exit();
}
?>
<html>
<head>
<title>แบบทดสอบ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<link rel='stylesheet' type='text/css' href='style.css' />
<body>
<?php
include "connectdb.php";
mysql_query("use elearning;");
$sql = "select * from subject where subid='$subid';";
$result=mysql_query($sql);

$rsubcode=mysql_result($result,0,"subcode");
$renname=mysql_result($result,0,"enname");

/*
$rthname=mysql_result($result,0,"thname");
$rendescript=mysql_result($result,0,"endescript");
$rthdescript=mysql_result($result,0,"thdescript");
$rsubbook=mysql_result($result,0,"subbook");
$ruid=mysql_result($result,0,"uid");
$rpriority=mysql_result($result,0,"priority");
$rprioritylv=mysql_result($result,0,"prioritylv");
$rsublv=mysql_result($result,0,"sublv");
$sql = "select * from teacherid where uid='$ruid';";
$result=mysql_query($sql);
$rtname=mysql_result($result,0,"tname");
*/


?>
<table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="28" height="28" align="right"><div align="right"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
    <td width="533" bgcolor="#FF9900" class="headmenu">แบบทดสอบของวิชา <?php print $renname; ?></td>
    <td width="28" height="28" align="left"><div align="left"><img src="menu/trangle.gif" width="28" height="28" hspace="0" vspace="0"></div></td>
  </tr>
  <tr> 
    <td colspan="3"><table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#FF9900">
        <tr> 
          <td colspan="2"><table width="550" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="30">&nbsp;</td>
                <td>&nbsp;</td>
                <td width="30">&nbsp;</td>
              </tr>
              <?php
if(isset($_SESSION['user']))
{
$sql = "select * from userid where user='$user';";
$result=mysql_query($sql);
$ruid=mysql_result($result,0,"uid");
$rstatus=mysql_result($result,0,"status");
}
//if($_SESSION['user'])
if (isset($_SESSION['user']) && $rstatus==2)
//if(session_is_registered("user"))
{
//	include "ckaddtime.php";

	if(isset($_COOKIE["authen"]))//จะ authen แบบทดสอบ
	{
		if($_COOKIE["ctemp"] < 10)
		{
			$len = 2;
			$num = '';
//			$lchar = 1;
			$char = 0;
			while($num=='' || $num == 0)
			{
		 		for($i = 0; $i < $len; $i++)
				{
//					srand(date("s"));
					$char = rand(48, 57);
//					while(($char == 0)&&($lchar == 0))
//					{
//						$char = rand(48, 57);
//					}
					$num .= chr($char);
//					$lchar = $char;
				}
			}
//			print $num;
			$sql = "select * from userid where user='$user';";
			$result=mysql_query($sql);
			$ruid=mysql_result($result,0,"uid");
			$sql = "select * from userskill where uid='$ruid' and subid='$subid';";
			$result=mysql_query($sql);
			$rlvget=mysql_result($result,0,"lvget");
			if($rlvget<=2)
				$rlevel=1;
			if($rlvget==3 || $rlvget==4)
				$rlevel=2;
			if($rlvget==5 || $rlvget==6)
				$rlevel=3;
			if($rlvget==7 || $rlvget==8)
				$rlevel=4;
			if($rlvget>=9)
				$rlevel=5;
//			print $rlevel;

			$i=0;
			$ntext="";
			$_SESSION['text']="";
//			$text="";
			if($_COOKIE["ctemp"] != 0)
			{				
				for($i=0;$i<$_COOKIE["ctemp"];$i++)
				{					
					$past=$_COOKIE["$i"];
					$ntext=$ntext." and numid!='$past'";
//					$text=$text." and numid='$past'";
//					$_SESSION['text']=$_SESSION['text']." or numid='$past'";
				}
/*
				$past=$_COOKIE["0"];
				$_SESSION['text']=$_SESSION['text']." and numid='$past'";
				for($i=0;$i<=$_COOKIE["ctemp"];$i++)
				{					
					$past=$_COOKIE["$i"];
					$_SESSION['text']=$_SESSION['text']." or numid='$past'";
				}
*/
//				print $ntext;
			}
			else
			{
				$ntext = "";
//				$text="";
				$_SESSION['text']="";
			}
			$sql = "select * from testsubject where subid='$subid' $ntext and level='$rlevel';";
//			print $sql;
			$result=mysql_query($sql);
			$count=mysql_num_rows($result);
//			print "<br>";
//			print $count;

			while($num>$count)
			{
				$num = $num-$count;
			}
//			print "<br>";
			$num--;
//			print $num;
			//random ตัวเลข next random ข้อสอบ
			$rquestion=mysql_result($result,$num,"question");
			$rchoice1=mysql_result($result,$num,"choice1");
			$rchoice2=mysql_result($result,$num,"choice2");
			$rchoice3=mysql_result($result,$num,"choice3");
			$rchoice4=mysql_result($result,$num,"choice4");
			$rchoice5=mysql_result($result,$num,"choice5");
			$rnumid=mysql_result($result,$num,"numid");
			$rpicpart=mysql_result($result,$num,"picpart");
			
			setcookie("$i","$rnumid");
?>
              <tr> 
                <td>&nbsp;</td>
                <td> <form name="form1" method="post" action="checker.php">
                    <table width="450" border="0" align="center" cellpadding="1" cellspacing="1">
                      <tr> 
                        <td width="100" bgcolor="#FFEECC" class="headfont">คำถามที่ 
                          <?php print $_COOKIE["ctemp"]+1; ?></td>
                        <td width="400" bgcolor="#FFEECC" class="defaultfont"><?php print $rquestion; ?></td>
                      </tr>
	<?php
	if($rpicpart)
	{
	?>
                      <tr> 
                        <td colspan="2" class="headfont"><p align="center"> 
                            <label><img src="<?php print $rpicpart; ?>"></label>
                          </p></td>
                      </tr>
	<?php
	}
	?>
                      <tr> 
                        <td class="headfont"><p align="center"> 
                            <label> 
                            <input name="answer" type="radio" value="1" checked>
                            ก.</label>
                          </p></td>
                        <td class="defaultfont"><?php print $rchoice1; ?></td>
                      </tr>
                      <tr> 
                        <td class="headfont"><div align="center"> 
                            <label> 
                            <input type="radio" name="answer" value="2">
                            ข.</label>
                          </div></td>
                        <td class="defaultfont"><?php print $rchoice2; ?></td>
                      </tr>
                      <tr> 
                        <td class="headfont"><div align="center"> 
                            <label> 
                            <input type="radio" name="answer" value="3">
                            ค.</label>
                          </div></td>
                        <td class="defaultfont"><?php print $rchoice3; ?></td>
                      </tr>
                      <tr> 
                        <td class="headfont"><div align="center"> 
                            <label> 
                            <input type="radio" name="answer" value="4">
                            ง.</label>
                          </div></td>
                        <td class="defaultfont"><?php print $rchoice4; ?></td>
                      </tr>
                      <tr> 
                        <td class="headfont"><div align="center"> 
                            <label> 
                            <input type="radio" name="answer" value="5">
                            จ.</label>
                          </div></td>
                        <td class="defaultfont"><?php print $rchoice5; ?></td>
                      </tr>
                      <tr> 
                        <td colspan="2" class="defaultfont">&nbsp;</td>
                      </tr>
                      <tr> 
                        <td colspan="2" class="defaultfont"><div align="center"> 
                            <input name="send" type="submit" id="send" value="ส่งคำตอบ">
                          </div></td>
                      </tr>
                    </table>
					<input type="hidden" name="subid" value="<?php print $subid; ?>">
					<input type="hidden" name="numid" value="<?php print $rnumid; ?>">
                  </form></td>
                <td>&nbsp;</td>
              </tr>
<?php
		}
		else
		{
				$past=$_COOKIE["0"];
				$_SESSION['text']=$_SESSION['text']."numid='$past'";
				for($i=1;$i<$_COOKIE["ctemp"];$i++)
				{					
					$past=$_COOKIE["$i"];
					$_SESSION['text']=$_SESSION['text']." or numid='$past'";
				}
				
				$sql = "select * from userskill where subid='$subid' and uid='$ruid';";
				$result=mysql_query($sql);
				$rlvget = mysql_result($result,0,"lvget");
?>
				<tr>
                <td>&nbsp;</td>
                <td class="defaultfont"><div align="center"> 
                    <p>คุณได้ทำแบบทดสอบครบหมดทุกข้อ ตามกำหนดไว้แล้ว<br>
                      ขณะนี้คุณมี <font class="warning">lv.<? print $rlvget; ?></font> ในวิชานี้</p>
<?
			$text = $_SESSION['text'];

			$sql = "select * from testsubject where subid='$subid' and ($text);";
//			print $sql;
/*
select * 
from testsubject 
where subid=1
and (numid =1 or numid=2)
*/
			$result=mysql_query($sql);
			$count=mysql_num_rows($result);			
?>
                    <table width="100%" border="0" cellpadding="1" cellspacing="1">
<?
			for($i=0;$i<$count;$i++)
			{
				$rquestion=mysql_result($result,$i,"question");
				$ranswer=mysql_result($result,$i,"answer");
				$rchoice=mysql_result($result,$i,"choice".$ranswer);
?>
                      <tr>
                        <td width="5%" valign="top" class="defaultfont"><? print $i+1;?></td>
                        <td width="75%" valign="top" class="defaultfont"><? print $rquestion; ?></td>
                        <td width="20%" valign="top" class="warning"><? print $rchoice; ?></td>
                      </tr>
<?
			}
?>
                    </table>
                    <p>&nbsp;</p>
                  </div></td>
                <td>&nbsp;</td>
              </tr>
<?php
//			setcookie("authen");
//			setcookie("ctemp");
			$sql = "update userskill set tested=0 where uid='$ruid' and subid='$subid';";
			$result = mysql_query($sql);
			
			$sql = "select * from userskill where uid='$ruid' and subid='$subid';";
			$result=mysql_query($sql);
			$rlvget=mysql_result($result,0,"lvget");
			$sql = "select * from subject where subid='$subid';";
			$result=mysql_query($sql);
			$rprioritylv=mysql_result($result,0,"prioritylv");
			if($rlvget >= $rprioritylv)
			{
				$rsubcode=mysql_result($result,0,"subcode");
				$sql = "select * from subject where priority='$rsubcode';";
				$result=mysql_query($sql);
				$count=mysql_num_rows($result);
				for($i=0;$i<$count;$i++)
				{
					$rsubid=mysql_result($result,$i,"subid");
					$sql1 = "select * from userskill where uid='$ruid' and subid='$rsubid';";
					$result1 = mysql_query($sql1);
					if(!$result1)
					{
						$sql1 = "insert into userskill (uid, subid, lvget, tested) values ('$ruid', '$rsubid', 0, 0);";
						$result1 = mysql_query($sql1);
					}
				}
			}
		}
	}
	else
	{
?>
              <tr>
                <td>&nbsp;</td>
                <td class="warning"><div align="center">หมดเวลาในการทำแบบทดสอบแล้ว 
                    กรุณามาสอบใหม่เมื่อท่านพร้อม</div></td>
                <td>&nbsp;</td>
              </tr>
<?php
	}

}
else
{
?>
              <tr> 
                <td>&nbsp;</td>
                <td class="warning"><div align="center">คุณจะต้อง login ถึงจะเข้าใช้งานใน 
                    menu นี้ได้<br>
                    กรุณา login</div></td>
                <td>&nbsp;</td>
              </tr>
              <?php
}
mysql_close($db);
ob_end_flush();
?>
              <tr> 
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td width="28" height="28" align="right"><img src="menu/dlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td bgcolor="#FF9900">&nbsp;</td>
    <td width="28" height="28" align="left"><img src="menu/drangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
</table>
</body>
</html>
