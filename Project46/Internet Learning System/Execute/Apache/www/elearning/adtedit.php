<?php
session_start();
if(!$update && !$subid && !$numid)
{
	print "<meta http-equiv=\"refresh\" content=\"0;URL=index.php\">";
	exit();
}
?>
<html>
<head>
<title>ผลการ Edit คำถาม</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">ผลการ Edit คำถาม</td>
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
if(isset($_SESSION['user']) && ($rstatus==0 || $rstatus==1))
{
	if($rstatus==1)
	{
		$sql = "select * from subject where subid='$subid';";
		$result=mysql_query($sql);
		$ruid2=mysql_result($result,0,"uid");
		if($ruid1!=$ruid2)
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
if(!$question || strlen($question)>150)
{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
}
else
{
	$question = htmlspecialchars($question);
	if(!$choice1 || !$choice2 || !$choice3 || !$choice4 || !$choice5 || strlen($choice1)>50 || strlen($choice2)>50 || strlen($choice3)>50 || strlen($choice4)>50 || strlen($choice5)>50)
	{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
	}
	else
	{
		$choice1 = htmlspecialchars($choice1);
		$choice2 = htmlspecialchars($choice2);
		$choice3 = htmlspecialchars($choice3);
		$choice4 = htmlspecialchars($choice4);
		$choice5 = htmlspecialchars($choice5);
		if(!$answer || strlen($answer)>1)
		{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
		}
		else
		{
			$answer = htmlspecialchars($answer);
			if(!$level || strlen($level)>2)
			{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
			}
			else
			{
				$level = htmlspecialchars($level);
				if(!$pass || strlen($pass)>40)
				{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
              <?php
				}
				else
				{
					$pass = htmlspecialchars($pass);
					include "connectdb.php";
					mysql_query("use elearning;");
					$sql = "select * from userid where user='$user';";
					$result=mysql_query($sql);
					$apass=mysql_result($result,0,"pass");
					$sub=0;
					if(md5($pass) != $apass)
					{
?>
             <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
 <?php
					}
					else
					{
						if(!$picpart || strlen($picpart)>50)
						{
							$sql = "update testsubject set question='$question', choice1='$choice1', choice2='$choice2', choice3='$choice3', choice4='$choice4', choice5='$choice5', answer='$answer', level='$level', picpart='' where subid='$subid' and numid='$numid';";
							$result = mysql_query($sql);
						}
						else
						{
							$picpart = htmlspecialchars($picpart);
							$path = "pictest";//start

//							$valid = "[\\]+";
//							$nstr = " ";
//							$temp = ereg_replace($valid, $nstr, $picpart);
//							print $temp;
//							$tem = preg_split("/[\s]+/", $temp);
//							$len = sizeof($tem);
//							$name = preg_split("/[\.]+/", $tem[$len-1]);
//							$len = sizeof($name);
//							print $name[$len-1];

//							$picpart_name=$picpart;//want name pic from file
							if ( $picpart_type == "image/gif" && $picpart_size<51200 )
							{
//								$filename = $name[0].".gif";
//								copy ($picpart , "$path/" . $filename );
								copy ($picpart , "$path/" . $picpart_name );
								$picpart = "$path/".$picpart_name;
								
								$sql = "update testsubject set question='$question', choice1='$choice1', choice2='$choice2', choice3='$choice3', choice4='$choice4', choice5='$choice5', answer='$answer', level='$level', picpart='$picpart' where subid='$subid' and numid='$numid';";
								$result = mysql_query($sql);
							}
							elseif ( $picpart_type == "image/bmp" && $picpart_size<51200 )
							{
								$filename = $name[0].".bmp";
								copy ($picpart , "$path/" . $filename );
								$picpart = "$path/".$filename;
								
								$sql = "update testsubject set question='$question', choice1='$choice1', choice2='$choice2', choice3='$choice3', choice4='$choice4', choice5='$choice5', answer='$answer', level='$level', picpart='$picpart' where subid='$subid' and numid='$numid';";
								$result = mysql_query($sql);
							}
							elseif ((($picpart_type=="image/jpg")||($picpart_type=="image/jpeg")||($picpart_type=="image/pjpeg")) && $picpart_size<51200)
							{
								$filename = $name[0].".jpg";
								copy ($picpart , "$path/" . $filename );
								$picpart = "$path/".$filename;
								
								$sql = "update testsubject set question='$question', choice1='$choice1', choice2='$choice2', choice3='$choice3', choice4='$choice4', choice5='$choice5', answer='$answer', level='$level', picpart='$picpart' where subid='$subid' and numid='$numid';";
								$result = mysql_query($sql);
							}
							else
							{
								$sub = 2;
							}							
						}
					}
					if($sub == 2)
					{
	?>
					 <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ให้ถูกต้อง</div></td>
              </tr>
	<?php
					}
					else
					{
?>
              <tr> 
                <td class="defaultfont"><div align="center">คุณได้ทำการ update 
                    คำถามใหม่เรียบร้อยแล้ว</div></td>
              </tr>
              <?php
			  		}
				}
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
                <td class="warning"><div align="center">หน้านี้สำหรับ ผู้บริหาร 
                    เท่านั้น</div></td>
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