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
<title>ผลการสร้างแบบทดสอบ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874" />
</head>
<link rel='stylesheet' type='text/css' href='style.css' />

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<p><img src="logo/head_r1.jpg" width="780" height="92"></p>
<table width="750" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td colspan="2">&nbsp;</td>
    <td width="28" height="28"><img src="menu/tlangle.gif" width="28" height="28" hspace="0" vspace="0"></td>
    <td width="550" bgcolor="#FF9900" class="headmenu">ผลการ Create แบบทดสอบ</td>
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
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
if(!$question || strlen($question)>150)
{
?>
              <tr> 
                <td class="warning"><div align="center">*คุณยังไม่ได้ตั้ง คำถาม 
                    กรุณาใส่ด้วย</div></td>
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
                <td class="warning"><div align="center">*คุณยังไม่ได้ตั้ง ตัวเลือก 
                    กรุณาใส่ให้ครบด้วย</div></td>
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
                <td class="warning"><div align="center">*คุณยังไม่ได้เลือก คำตอบที่ถูกต้อง 
                    กรุณาใส่ด้วย</div></td>
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
                <td class="warning"><div align="center">*คุณยังไม่ได้เลือก ระดับความยากของคำถาม 
                    กรุณาใส่ด้วย</div></td>
              </tr>
<?php
			}
			else
			{
				$level = htmlspecialchars($level);
				$sub="";
				if(!$picpart || strlen($picpart)>50)
				{
					$sql = "insert into testsubject (subid, question, choice1, choice2, choice3, choice4, choice5, answer, level) values ('$subid', '$question', '$choice1', '$choice2', '$choice3', '$choice4', '$choice5', '$answer', '$level');";
					$result = mysql_query($sql);
				}
				else
				{
					$picpart = htmlspecialchars($picpart);
					$path = "pictest";//start

//					$valid = "[\\]+";
//					$nstr = " ";
//					$temp = ereg_replace($valid, $nstr, $picpart);
//					print $temp;
//					$tem = preg_split("/[\s]+/", $temp);
//					$len = sizeof($tem);
//					$name = preg_split("/[\.]+/", $tem[$len-1]);
//					$len = sizeof($name);
//					print $name[$len-1];

					if ( $picpart_type == "image/gif" && $picpart_size<51200)
					{
//						$filename = $name[0].".gif";
//						copy ($picpart , "$path/" . $filename );
						copy ($picpart , "$path/" . $picpart_name );
						$picpart = "$path/".$filename;
						
						$sql = "insert into testsubject (subid, question, choice1, choice2, choice3, choice4, choice5, answer, level, picpart) values ('$subid', '$question', '$choice1', '$choice2', '$choice3', '$choice4', '$choice5', '$answer', '$level', '$picpart');";
						$result = mysql_query($sql);
					}
					if ( $picpart_type == "image/bmp" && $picpart_size<51200)
					{
						$filename = $name[0].".bmp";
						copy ($picpart , "$path/" . $filename );
						$picpart = "$path/".$filename;
						
						$sql = "insert into testsubject (subid, question, choice1, choice2, choice3, choice4, choice5, answer, level, picpart) values ('$subid', '$question', '$choice1', '$choice2', '$choice3', '$choice4', '$choice5', '$answer', '$level', '$picpart');";
						$result = mysql_query($sql);
					}
					elseif ((($picpart_type=="image/jpg")||($picpart_type=="image/jpeg")||($picpart_type=="image/pjpeg")) && $picpart_size<51200)
					{
						$filename = $name[0].".jpg";
						copy ($picpart , "$path/" . $filename );
						$picpart = "$path/".$filename;
						
						$sql = "insert into testsubject (subid, question, choice1, choice2, choice3, choice4, choice5, answer, level, picpart) values ('$subid', '$question', '$choice1', '$choice2', '$choice3', '$choice4', '$choice5', '$answer', '$level', '$picpart');";
						$result = mysql_query($sql);
					}
					else
					{
						$sub = 2;
					}				
				}
				if($sub == 2)
				{
	?>
					 <tr> 
                <td class="warning"><div align="center">รูปภาพคุณมีขนาดไม่ถูกต้อง</div></td>
              </tr>
	<?php
				}
				else
				{
?>
              <tr> 
                <td class="defaultfont"><div align="center">คุณได้ทำการ create 
                    คำถามใหม่เรียบร้อยแล้ว</div></td>
              </tr>
              <?php
			  	}
			 }
			mysql_close($db);
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