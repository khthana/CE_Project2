<table width="150" border="0" align="center" cellpadding="0" cellspacing="2">
<?php
//session_start();
if(isset($_SESSION['user']))
{
	include "connectdb.php";
	mysql_query("use elearning;");
	$sql = "select * from userid where user='$user';";
	$result=mysql_query($sql);
	$rstatus=mysql_result($result,0,"status");
}
//if (isset($suser))
//if($_SESSION['user'])
if(isset($_SESSION['user']) && $rstatus==2)
//if(isset($HTTP_SESSION_VARS['user']))
//if(session_is_registered("user"))
{
?>
        <tr> 
          <td class="normal"><div align="right"><a href="status.php" target="_self">Status</a></div></td>
        </tr>
<?php
}
if(isset($_SESSION['user']) && ($rstatus==1 || $rstatus==2))
{
?>
        <tr> 
          <td class="normal"><div align="right"><a href="edit.php" target="_self">แก้ไขข้อมูลส่วนตัว</a></div></td>
        </tr>
<?php
}
if(!isset($_SESSION['user']))
{
?>
        <tr> 
          <td class="normal"><div align="right"><a href="register.php" target="_self">สมัครสมาชิก</a></div></td>
        </tr>
<?php
}
if(isset($_SESSION['user']) && $rstatus==0)
{
?>
		<tr> 
          <td class="normal"><div align="right"><a href="edituser.php" target="_self">บริหาร user</a></div></td>
        </tr>
		<tr> 
          <td class="normal"><div align="right"><a href="editsubject.php?sort=1" target="_self">บริหารรายวิชา</a></div></td>
        </tr>
<?php
}
if(isset($_SESSION['user']) && ($rstatus==0 || $rstatus==1))
{
?>
		<tr> 
          <td class="normal"><div align="right"><a href="editebook.php?sort=1" target="_self">บริหารแบบเรียน</a></div></td>
        </tr>
        <tr> 
          <td class="normal"><div align="right"><a href="edittest.php?sort=1" target="_self">บริหารแบบทดสอบ</a></div></td>
        </tr>
<?php
}
if(isset($_SESSION['user']) && ($rstatus==0 || $rstatus==1))
{
?>
        <tr> 
          <td class="normal"><div align="right"><a href="edittest.php?sort=1" target="_self">ดูผลการเรียน</a></div></td>
        </tr>
<?php
}
?>
		<tr> 
			<td class="normal"><div align="right"><a href="list.php?sort=1" target="_self">รายวิชา</a></div></td>
		</tr>
<?php
//if (isset($suser))
//if($_SESSION['user'])
if(isset($_SESSION['user']) && $rstatus==2)
//if(isset($HTTP_SESSION_VARS['user']))
//if(session_is_registered("user"))
{
?>
        <tr> 
          <td class="normal"><div align="right"><a href="conlist.php" target="_self">แบบเรียน</a></div></td>
        </tr>
        <tr> 
          <td class="normal"><div align="right"><a href="teslist.php" target="_self">แบบทดสอบ</a></div></td>
        </tr>
<?php
}
if(isset($_SESSION['user']) && $rstatus==0)
{
?>
		<tr> 
          <td class="normal"><div align="right"><a href="delboard.php" target="_self">ลบ Webboard</a></div></td>
        </tr>
<?
}
?>
        <tr> 
          <td class="normal"><div align="right"><a href="board.php" target="_self">Webboard</a></div></td>
        </tr>
        <tr> 
          <td class="normal"><div align="right"><a href="index.php" target="_self">วิธีใช้งาน</a></div></td>
        </tr>
		<tr> 
          <td class="normal"><div align="right"><a href="download.php" target="_self">Download</a></div></td>
        </tr>
        <tr> 
          <td class="normal"><div align="right"><a href="contact.php" target="_self">ติดต่อ</a></div></td>
        </tr>
      </table>
<?php
if(isset($_SESSION['user']))
{
	mysql_close($db);
}
?>