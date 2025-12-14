<?php
session_start();
if(!$create)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ผลการสร้าง user เข้าเป็นสมาชิกใหม่</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">ผลการ Create user</td>
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
}
if(isset($_SESSION['user']) && $rstatus==0)
{
	if($status==1)
	{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
if(!$tname || strlen($tname)>50 || strlen($troom)>40 || strlen($ttel)>25 || strlen($temail)>30)
{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
}
else
{
	$tname = htmlspecialchars($tname);
	$troom = htmlspecialchars($troom);
	$ttel = htmlspecialchars($ttel);
	$temail = htmlspecialchars($temail);
	if(!$user || strlen($user)>20)
	{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
	}
	else
	{
		$user = htmlspecialchars($user);
		if(!$pass1 || !$pass2 || strlen($pass1)>40 || strlen($pass2)>40)
		{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
		}
		else
		{
			$pass1 = htmlspecialchars($pass1);
			$pass2 = htmlspecialchars($pass2);
			if($pass1 != $pass2)
			{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
<?php
			}
			else
			{
				if(!$adpass || strlen($adpass)>40)
				{
?>
				<tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
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
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
<?php
					}
					else
					{
						$sql = "select * from userid where user='$cuser';";
						$result=mysql_query($sql);
						$count=mysql_num_rows($result);
						if($count!=0)
//						$ruser=mysql_result($result,0,"user");
//						$cuser = strcmp($user, $ruser);
//						if ($cuser ==0 )
						{
?>
              
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
						}
						else
						{
							$enpass=md5($pass1);
							$sql = "insert into userid (user, pass, status) values ('$cuser', '$enpass', 1);";
							$result = mysql_query($sql);
							$sql = "select * from userid where user='$cuser';";
							$result=mysql_query($sql);
							$ruid=mysql_result($result,0,"uid");
							$sql = "insert into teacherid (uid, tname, troom, ttel, temail) values ('$ruid', '$tname', '$troom', '$ttel', '$temail');";
							$result = mysql_query($sql);
?>
              <tr> 
                <td class="defaultfont"><div align="center">คุณได้ทำการ create บุคลากรภาควิชา 
                    เรียบร้อยแล้ว</div></td>
              </tr>
              <?php
						}
						mysql_close($db);
					}
				}
			}
		}
	}
}
?>
            </table></td>
        </tr>
<?php
	}
	if ($status==2)
	{
?>
        <tr>
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
if(!$fristname || strlen($fristname)>30)
{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
}
else
{
	$fristname = htmlspecialchars($fristname);
	if(!$lastname || strlen($lastname)>30)
	{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
	}
	else
	{
		$lastname = htmlspecialchars($lastname);
		if(!$nickname || strlen($nickname)>30)
		{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
		}
		else
		{
			$nickname = htmlspecialchars($nickname);
			if(!$email || strlen($email)>30)
			{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
			}
			else
			{
				$email = htmlspecialchars($email);
				if(!$user || strlen($user)>20)
				{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
				}
				else
				{
					$user = htmlspecialchars($user);
					if(!$pass1 || !$pass2 || strlen($pass1)>40 || strlen($pass2)>40)
					{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
					}
					else
					{
						$pass1 = htmlspecialchars($pass1);
						$pass2 = htmlspecialchars($pass2);
						if($pass1 != $pass2)
						{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
						}
						else
						{
							if(!$adpass || strlen($adpass)>40)
							{
?>
				<tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
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
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
<?php
								}
								else
								{
									include "connectdb.php";
									mysql_query("use elearning;");
									$sql = "select * from userid where user='$cuser';";
									$result=mysql_query($sql);
									$count=mysql_num_rows($result);
									if($count!=0)
//									$ruser=mysql_result($result,0,"user");
//									$cuser = strcmp($user, $ruser);
//									if ($cuser ==0 )
									{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
									}
									else
									{
										$enpass=md5($pass1);
										$sql = "insert into userid (user, pass, status) values ('$cuser', '$enpass', 2);";
										$result = mysql_query($sql);
										$sql = "select * from userid where user='$cuser';";
										$result=mysql_query($sql);
										$ruid=mysql_result($result,0,"uid");
										$sql = "insert into history (uid, fristname, lastname, nickname, email) values ('$ruid', '$fristname', '$lastname', '$nickname', '$email');";
										$result = mysql_query($sql);
										$sql = "select * from subject where priority='none';";
										$result = mysql_query($sql);
										$count = mysql_num_rows($result);
										for($i=0; $i<$count; $i++)
										{
											$rsubid=mysql_result($result,$i,"subid");
											$sql = "insert into userskill (uid, subid, lvget) values ('$ruid', '$rsubid', 0);";
											$res = mysql_query($sql);
										}
?>
              <tr> 
                <td class="defaultfont"><div align="center">คุณได้ทำการ create user 
                    เรียบร้อยแล้ว</div></td>
              </tr>
              <?php
			  						}
									mysql_close($db);
								}								
							}							
						}
					}
				}
			}
		}
	}
}
?>
            </table></td>
        </tr>
<?php
	}
}
else
{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <tr>
                <td class="warning"><div align="center">หน้านี้สำหรับ Administator เท่านั้น</div></td>
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