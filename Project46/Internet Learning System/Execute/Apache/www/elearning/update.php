<?php
session_start();
if(!$update || !$status)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ผลการแก้ไขข้อมูลส่วนตัว</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">ผลการแก้ไขข้อมูลส่วนตัว</td>
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
if(isset($_SESSION['user']))
{	
if($status==1)
{
?>
        <tr>
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
	if(!$tname || strlen($tname)>50 || strlen($troom)>40 || strlen($ttel)>25)
	{
?>
              <tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
	}
	else
	{
		$tname = htmlspecialchars($tname);
		$troom = htmlspecialchars($troom);
		$ttel = htmlspecialchars($ttel);
		if(!$temail || strlen($temail)>30)
		{
?>
			<tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
		}
		else
		{
			$temail = htmlspecialchars($temail);
			if(!$pass1 || !$pass2 || strlen($pass1)>40 || strlen($pass2)>40)
			{
?>
              <tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
			}
			else
			{
				$pass1 = htmlspecialchars($pass1);
				$pass2 = htmlspecialchars($pass2);
				include "connectdb.php";
				mysql_query("use elearning;");
				$sql = "select * from userid where user='$user';";
				$result=mysql_query($sql);
				$rpass=mysql_result($result,0,"pass");
				$enpass1=md5($pass1);
				$enpass2=md5($pass2);
				if($enpass1 != $enpass2)
				{
?>
              <tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
					mysql_close($db);
				}
				else
				if($enpass1 != $rpass)
				{
?>
              <tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
					mysql_close($db);
				}
				else
				{					
					$sql = "select * from userid where user='$user';";
					$result=mysql_query($sql);
					$ruid=mysql_result($result,0,"uid");
					$sql = "update teacherid set tname='$tname', troom='$troom', ttel='$ttel', temail='$temail' where uid='$ruid';";
					$result = mysql_query($sql);
					mysql_close($db);
?>
              <tr> 
                <td class="defaultfont"><div align="center">คุณได้ทำการ update 
                    เรียบร้อยแล้ว </div></td>
              </tr>
              <?php
				}
			}
		}
	}
?>
            </table></td>
        </tr>
<?php
}
if($status==2)
{
?>
		<tr>
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
<?php
	if(!$fristname || strlen($fristname)>30)
	{
?>
              <tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
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
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
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
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
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
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
				}
				else
				{
					$email = htmlspecialchars($email);
					if(!$pass1 || !$pass2 || strlen($pass1)>40 || strlen($pass2)>40)
					{
?>
              <tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
					}
					else
					{
						$pass1 = htmlspecialchars($pass1);
						$pass2 = htmlspecialchars($pass2);
						include "connectdb.php";
						mysql_query("use elearning;");
						$sql = "select * from userid where user='$user';";
						$result=mysql_query($sql);
						$rpass=mysql_result($result,0,"pass");
						$enpass1=md5($pass1);
						$enpass2=md5($pass2);
						if($enpass1 != $enpass2)
						{
?>
              <tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
							mysql_close($db);
						}
						else
						if($enpass1 != $rpass)
						{
?>
              <tr> 
                <td class="warning"><div align="center"> 
                    <p>*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</p>
                    </div></td>
              </tr>
              <?php
							mysql_close($db);
						}
						else
						{					
							$sql = "select * from userid where user='$user';";
							$result=mysql_query($sql);
							$ruid=mysql_result($result,0,"uid");
							$sql = "update history set fristname='$fristname', lastname='$lastname', nickname='$nickname', email='$email' where uid='$ruid';";
							$result = mysql_query($sql);
							mysql_close($db);
?>
              <tr> 
                <td class="defaultfont"><div align="center">คุณได้ทำการ update 
                    เรียบร้อยแล้ว </div></td>
              </tr>
              <?php
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
                <td class="warning"><div align="center">คุณจะต้อง login ถึงจะเข้าใช้งานใน menu 
                    นี้ได้<br>
                    กรุณา login</div></td>
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