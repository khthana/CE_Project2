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
	$sql = "select * from userskill where uid='$ruid' and subid='$subid';";
//	print $sql;
	$result=mysql_query($sql);
	$rtested=mysql_result($result,0,"tested");
	if($rtested==0)
	{
		if($ok==1)
		{
//			$_COOKIE['authen'] = $user;
			setcookie("authen","0",time()+610);
			setcookie("ctemp","0");
			$sql = "update userskill set tested=1 where uid='$ruid' and subid='$subid';";
//			print $sql;
			$result = mysql_query($sql);
			mysql_close($db);
			print "<meta http-equiv=\"refresh\" content=\"0;URL=frame.php?subid=".$subid."\">";
			exit();
		}
?>
              <tr> 
                <td>&nbsp;</td>
                <td><table width="404" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr> 
                      <td bgcolor="#FFEECC" class="warning"><div align="center"><font size="3"><strong>คำเตือน</strong></font></div></td>
                    </tr>
                    <tr> 
                      <td class="defaultfont"><div align="left"> 
                          <p>แบบทดสอบมีทั้งหมด <font class="warning">10 ข้อ ให้ทำทุกข้อ 
                            ในเวลา 10 นาทีโดยประมาณ</font> หากทำไม่ครบทุกข้อ, 
                            หมดเวลาก่อนทำหมดทุกข้อ หรือปิดไประหว่างการทำแบบทดสอบ 
                            ทางเราจะลงโทษ โดยลด level ของท่านลงครึ่งหนึ่งจากที่ท่านทำได้ 
                            โปรดเคร่งครัดในการทำแบบทดสอบด้วย หากท่านยังไม่พร้อมที่จะทำแบบทดสอบ 
                            กรุณาปิดหน้าต่างนี้ลง </p>
                        </div></td>
                    </tr>
                    <tr> 
                      <td class="defaultfont"><div align="center"><a href="prompt.php?subid=<? print $subid; ?>&ok=1">เริ่มทำแบบทดสอบ</a></div></td>
                    </tr>
                    <tr> 
                      <td class="defaultfont">&nbsp;</td>
                    </tr>
                  </table></td>
                <td>&nbsp;</td>
              </tr>
<?php
	}
	else if($rtested==1)
	{
		$sql = "select * from userskill where uid='$ruid' and subid='$subid';";
		$result = mysql_query($sql);
		$rlvget = mysql_result($result,0,"lvget");
		if(($rlvget%2)==1)
			$rlvget = $rlvget+1;
		$rlvget = $rlvget/2;
		if($rlvget<0)
			$rlvget=0;		
		$sql = "update userskill set lvget='$rlvget' where uid='$ruid' and subid='$subid';";
		$result = mysql_query($sql);
		$sql = "update userskill set tested=0 where uid='$ruid' and subid='$subid';";
		$result = mysql_query($sql);
?>
              <tr>
                <td>&nbsp;</td>
                <td class="warning"><div align="center">
                    <table width="404" border="0" align="center" cellpadding="1" cellspacing="1">
                      <tr> 
                        <td bgcolor="#FFEECC" class="warning"><div align="center"><font size="3"><strong>คำเตือน</strong></font></div></td>
                      </tr>
                      <tr> 
                        <td class="defaultfont"><div align="left"> 
                            <p>เนื่องจาก ข้อสอบมีทั้งหมด 10 ข้อและต้องทำทุกข้อ 
                              แต่ท่านได้ละเมิด โดยการปิดไป, ทำไม่ทัน หรือการณ์ใดก็ตาม 
                              ทางเราจึงต้องลงโทษท่านตามข้อตกลงที่ได้กล่าวไว้ ก่อนเริ่มทำแบบทดสอบ</p>
                          </div></td>
                      </tr>
                      <tr> 
                        <td class="defaultfont"><div align="center"><a href="prompt.php?subid=<? print $subid; ?>&ok=1">เริ่มทำแบบทดสอบ</a></div></td>
                      </tr>
                      <tr> 
                        <td class="defaultfont">&nbsp;</td>
                      </tr>
                    </table>
                  </div></td>
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
