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
	
	$sql = "select * from subject where subid='$subid';";
	$result=mysql_query($sql);
	$rsubcode=mysql_result($result,0,"subcode");
}
if(isset($_SESSION['user']) && ($rstatus==0 || $rstatus==1))
{
?>
        <tr> 
          <td><table width="100%" border="0" cellpadding="1" cellspacing="1">
              <?php
if(!$ebookname || strlen($ebookname)>50)
{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
}
else
{
	$ebookname = htmlspecialchars($ebookname);
	if(!$ebookpart || strlen($ebookpart)>50)
	{
?>
              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
    <?php
	}
	else
	{
		$ebookpart = htmlspecialchars($ebookpart);
		
		$DirOK = 0;
		$DIR = opendir("./ebook/");
		while ($text = readdir($DIR)){
			if($text == $rsubcode) $DirOK = 1;
		}
		if(!$DirOK) mkdir("./ebook/$rsubcode/",0777);
		
		$path = "ebook";//start

//		$valid = "[\\]+";
//		$nstr = " ";
//		$temp = ereg_replace($valid, $nstr, $subpart);
//		print $temp;
//		$tem = preg_split("/[\s]+/", $temp);
//		$len = sizeof($tem);
//		$name = preg_split("/[\.]+/", $tem[$len-1]);
//		$len = sizeof($name);
//		print $name[$len-1];
//		print $ebookpart_type;
		if ( ($ebookpart_type == "application/zip" || $ebookpart_type == "application/x-zip-compressed" || 
					$ebookpart_type == "application/octet-stream" || $ebookpart_type == "application/vnd.ms-powerpoint")
					&& $ebookpart_size < 10240000 )
		{
//			$filename = $name[0].".zip";
//			copy ($subpart , "$path/" . $filename );//stop
			copy ($ebookpart , "$path/"."$rsubcode/".$ebookpart_name);
//			$filename = "index.html";
			$filename = preg_split("/[\.]+/",$ebookpart_name);
			$ebookpart = "$path/"."$rsubcode/".$filename[0].".htm";//stop
//			print $ebookpart;
			
			$sql = "insert into ebooksubject (subid, ebookname ,ebookpart) values ('$subid', '$ebookname', '$ebookpart');";
			$result = mysql_query($sql);
	?>
              <tr> 
                <td class="defaultfont"><div align="center">คุณได้ทำการ create 
                    คำถามใหม่เรียบร้อยแล้ว</div></td>
              </tr>
              <?php
		}			
		else
		{
	?>

              <tr> 
                <td class="warning"><div align="center">*ข้อมูลไม่ถูกต้อง กรุณาใส่ใหม่</div></td>
              </tr>
              <?php
		}
	}
mysql_close($db);
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