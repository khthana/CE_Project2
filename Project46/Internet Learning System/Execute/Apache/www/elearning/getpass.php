<?php
session_start();
if(!$send)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ผลการ register เข้าเป็นสมาชิก</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">ผลการสมัครเป็นสมาชิก</td>
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

        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
	if(!$user || !$email || strlen($user)>20 || strlen($email)>30)
	{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่ 
                  </div></td>
              </tr>
<?php
	}
	else
	{
		include "connectdb.php";
		mysql_query("use elearning;");
		$sql = "select * from userid where user='$user';";
		$result=mysql_query($sql);
		$ok=0;
		if($result)
		{
			$ruid=mysql_result($result,0,"uid");
//			$rpass=mysql_result($result,0,"pass");//how to reverse pass?
			$rstatus=mysql_result($result,0,"status");
			if($rstatus==1 || $rstatus==0)
			{
				$sql = "select * from teacherid where uid='$ruid';";
				$result=mysql_query($sql);
				$remail=mysql_result($result,0,"temail");
			}
			if($rstatus==2)
			{
				$sql = "select * from history where uid='$ruid';";
				$result=mysql_query($sql);
				$remail=mysql_result($result,0,"email");
			}
			if($remail==$email)
			{
				$ok=1;
			}
		}
		if($ok==0)
		{		
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่ 
                  </div></td>
              </tr>
              <?php
		}
		else
		{//how to send auto email?

			$len = 8;
			$pass = '';
			$lchar = 0;
			$char = 0;
			 for($i = 0; $i < $len; $i++)
			{
				while($char == $lchar)
				{
					$char = rand(48, 109);
					if($char > 57) $char += 7;
					if($char > 90) $char += 6;
				}
				$pass .= chr($char);
				$lchar = $char;
			}

			$enpass=md5($pass);
			$sql = "update userid set pass='$enpass' where uid='$ruid';";
			$result = mysql_query($sql);

			$emailto =$remail; 
			$subject ="Forgot  password?"; 
			$message ="This is message from Administator from Web E-learning\n"."\tNew Password : $pass\n"; 

			mail($emailto,$subject,$message); 					
?>

			<tr> 
                <td class="defaultfont"><div align="center"> 
                    <p>password ของคุณได้ถูกส่งไปยัง email ของคุณแล้ว<br>
                      กรุณาเช็ค เพื่อทำการ login</p>
                  </div></td>
              </tr>
  <?php
  		}
		mysql_close($db);
	}
?>
            </table></td>
        </tr>
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