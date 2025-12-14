<?php
session_start();
if(!$update && !$subid)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ผลการ edit รายวิชา</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">ผลการ Edit รายวิชา</td>
    <td width="28" height="28"><img src="menu/trangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr> 
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="150" height="28" bgcolor="#FF9900" class="headmenu">MENU</td>
    <td width="28" height="28"><img src="menu/tlreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td>&nbsp;</td>
    <td width="28" height="28"><img src="menu/trreangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
  </tr>
  <tr> 
    <td colspan="2" valign="top"><table width="100%" border="1" cellpadding="2" cellspacing="0" bordercolor="#FF9900">
        <tr> 
          <td bgcolor="#FFEECC"> 
            <?php
	  include "log.php"; 
	  ?>
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
    <td><table width="100%" border="0" cellpadding="0" cellspacing="0">
        <?php
if (isset($_SESSION['user']))
{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$rstatus=mysql_result($result,0,"status");
	$ruid=mysql_result($result,0,"uid");
}
if(isset($_SESSION['user']) && ($rstatus==0))
{
	if($rstatus==1)
	{
		$sql = "select * from subject where subid='$subid';";
		$result=mysql_query($sql);
		$ruid2=mysql_result($result,0,"uid");
		if($ruid!=$ruid2)
		{
			print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
			mysql_close($db);
			exit();
		}
	}
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
//print strlen($subcode);
if(!$subcode || !$enname || !$thname || strlen($subcode)>8 || strlen($enname)>50 || strlen($thname)>50 || strlen($subbook)>50 || strlen($endescript)>600 ||strlen($thdescript)>600)// now here
{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
}
else
{
	$subcode = htmlspecialchars($subcode);
	$enname = htmlspecialchars($enname);
	$thname = htmlspecialchars($thname);
	$subbook = htmlspecialchars($subbook);
	$endescript = htmlspecialchars($endescript);
	$thdescript = htmlspecialchars($thdescript);
	if(!$priority || strlen($priority)>8)
	{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
	}
	else
	{
		$priority = htmlspecialchars($priority);
		if(!$prioritylv || strlen($prioritylv)>2)
		{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
		}
		else
		{
			$prioritylv = htmlspecialchars($prioritylv);
	
			if(!$adpass || strlen($adpass)>40)
			{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
			}
			else
			{
				$adpass = htmlspecialchars($adpass);
				include "connectdb.php";
				mysql_query("use elearning;");
				$sql = "select * from userid where user='$user';";
				$result=mysql_query($sql);
				$apass=mysql_result($result,0,"pass");
				if(md5($adpass) != $apass)
				{
?>
             <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
 <?php
				}
				else
				{
					$sql = "select * from subject where subid='$subid';";
					$result = mysql_query($sql);
					$rsublv=mysql_result($result,0,"sublv");
					if($rstatus==1)
						$priority=mysql_result($result,0,"priority");
					if($priority=='none')
					{
						$sublv=1;
					}
					else
					{
						$sql = "select * from subject where subcode='$priority';";
						$result = mysql_query($sql);
						$sublv=mysql_result($result,0,"sublv");
						$sublv += 1;
					}
					if($rstatus==0)
						$sql = "update subject set subcode='$subcode', enname='$enname', thname='$thname', endescript='$endescript', thdescript='$thdescript', subbook='$subbook', uid='$uid', priority='$priority', prioritylv='$prioritylv', sublv='$sublv' where subid='$subid';";
					if($rstatus==1)
						$sql = "update subject set endescript='$endescript', thdescript='$thdescript', subbook='$subbook', prioritylv='$prioritylv' where subid='$subid';";

					$result = mysql_query($sql);
					
					//edit relationship of user about subject
					if($priority=='none')
					{
						$sql = "select * from subject where subcode='$subcode';";
						$result = mysql_query($sql);
						$rsubid=mysql_result($result,0,"subid");
						$sql = "select * from userid where status='2';";
						$result = mysql_query($sql);
						$count=mysql_num_rows($result);
						for($i=0; $i<$count; $i++)
						{
							$ruid=mysql_result($result,$i,"uid");
							$sql1 = "select * from userskill where uid='$ruid';";
							$result1 = mysql_query($sql1);
							$count1=mysql_num_rows($result1);
							for($j=0; $j<$count1; $j++)
							{
								$rsubido=mysql_result($result1,$j,"subid");
								if($rsubido==$rsubid)
								{
									$find=1;
									$count1=$j;
								}
								else
								{
									$find=0;
								}
							}
							if($find==0)
							{
								$sql1 = "insert into userskill (uid, subid, lvget) values ('$ruid', '$rsubid', 0);";
								$result1 = mysql_query($sql1);
							}
						}
					}
					else
					{
					/*edit subject มีคนเรียนวิชานี้มาก่อนแล้วแต่ upgarde วิชาสูงมาก ๆ จำเป็นต้องลบ user นั้นออก
						$sql = "select * from userskill where subid='$rsubid';";
						$result0 = mysql_query($sql);
					*/				
					
						$sql = "select * from subject where subcode='$priority';";//วิชาที่ต้องผ่านก่อน
						$result = mysql_query($sql);
						$rsubid=mysql_result($result,0,"subid");//หาsubid
						$rprioritylv=mysql_result($result,0,"prioritylv");//หา lvถึงจะผ่าน
						$sql = "select * from userskill where subid='$rsubid';";//หาคนที่มีวิชานี้
						$result = mysql_query($sql);
						$count=mysql_num_rows($result);
						$sql1 = "select * from subject where subcode='$subcode';";
						$result1 = mysql_query($sql1);
						$rsubid1=mysql_result($result1,0,"subid");
						for($i=0; $i<$count; $i++)
						{
							$rlvget=mysql_result($result,$i,"lvget");
							if($rlvget>=$rprioritylv)
							{
								$ruid=mysql_result($result,$i,"uid");
								$sql2 = "select * from userskill where uid='$ruid';";
								$result2 = mysql_query($sql2);
								$count2=mysql_num_rows($result2);
								for($j=0; $j<$count2; $j++)
								{
									$rsubido=mysql_result($result2,$j,"subid");
									if($rsubido==$rsubid1)
									{
										$find=1;
										$count2=$j;
									}
									else
									{
										$find=0;
									}
								}
								if($find==0)
								{
									$sql2 = "insert into userskill (uid, subid, lvget) values ('$ruid', '$rsubid1', 0);";
									$result2 = mysql_query($sql2);
								}
							}
							else//subject it a upgrade
							{
								$ruid=mysql_result($result,$i,"uid");
								$sql2 = "select * from userskill where uid='$ruid';";
								$result2 = mysql_query($sql2);
								$count2=mysql_num_rows($result2);
								for($j=0; $j<$count2; $j++)
								{
									$rsubido=mysql_result($result2,$j,"subid");
									if($rsubido==$rsubid1)
									{
										$find=1;
										$count2=$j;
									}
									else
									{
										$find=0;
									}
								}
								if($find==1)
								{
									$sql2 = "delete from userskill where uid='$ruid' and subid='$rsubid1';";
									$result2 = mysql_query($sql2);
								}
							}
						}
					}
				}
?>
              <tr> 
                <td class="defaultfont"><div align="center">คุณได้ทำการ update 
                    วิชาใหม่เรียบร้อยแล้ว</div></td>
              </tr>
			  <?
				mysql_close($db);
			}
		}
	}
}
?>
            </table></td>
        </tr>
        <?php
}
else
{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr> 
                <td class="warning"><div align="center">หน้านี้สำหรับ ผู้บริหารเท่านั้น</div></td>
              </tr>
            </table></td>
        </tr>
        <?php
}
?>
      </table></td>
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