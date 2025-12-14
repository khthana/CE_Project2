<?
include "interface.inc.php";
include "accesscontrol.php";
include "fn.php"; 
include "outputlib.php";
logo_noleftmenu("Information Security Advisory Group (ISAG)");
curve_open();
$uid=$HTTP_SESSION_VARS["uid"];
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if(($HTTP_POST_VARS["submit"]=="preview") or ($HTTP_POST_VARS["submit"]=="Add"))
{
		$error=0;

		$name_t = htmlspecialchars(trim($HTTP_POST_VARS["name_t"]));
		$name_e = htmlspecialchars(trim($HTTP_POST_VARS["name_e"]));
		$keyword = htmlspecialchars(trim($HTTP_POST_VARS["keyword"]));
		$abstract = htmlspecialchars(trim($HTTP_POST_VARS["abstract"]));
		//$filename = htmlspecialchars(trim($HTTP_POST_VARS["filename"]));

		if (is_uploaded_file($HTTP_POST_FILES["filename"]["tmp_name"]))
		{
			$filename=$HTTP_POST_FILES["filename"]["tmp_name"]; 			
			$filename_name=$HTTP_POST_FILES["filename"]["name"];
		}		
		if ($name_t=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่ชื่อบทความภาษาไทย<br></font></center>";
			}
		if ($name_e=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่ชื่อบทความภาษาอังกฤษ<br></font></center>";
			}
		if ($keyword=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่คีย์เวิร์ด<br></font></center>";
			}
		if ($abstract=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่ Review<br></font></center>";
			}
		if ($filename=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใสชื่อไฟล์<br></font></center>";
			}
		//-----------------------------------------------------------------------------
		if(($HTTP_POST_VARS["submit"]=="preview") and ($error==0))		   
		{
				print "<font size=3><CENTER><b>Preview Paper</b></CENTER></font>";
?>
				<center><br>
				<table cellpadding=0 cellspacing=0 width=98% border=0>								
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p1.gif"></td>
										<td width=100% background="<?=$path_web_img?>p2.gif" width=1 height=15></td>
										<td width=15 height=15><img src="<?=$path_web_img?>p3.gif"></td>
								</tr></table>
								
								<table cellpadding=0 cellspacing=0 width=98% border=0>
								<tr><td width=15 height=1 background="<?=$path_web_img?>p4.gif"><img src="<?=$path_web_img?>p4.gif"></td>
								<td width=100%  bgcolor="#EFEFEF"> 
								<table cellpadding=2 cellspacing=0 width=99% border=0>
<?										
								print "<tr><td><CENTER><b>".stripslashes($name_t)."</b></CENTER></td></tr>";
								print "<tr><td><CENTER><b>".stripslashes($name_e)."</b></CENTER></td></tr>";						
								print "<tr><td><b>บทคัดย่อ</b><br> ".stripslashes($abstract)." </td></tr>";
								print "<tr><td><b>ไฟล์บทความ</b>&nbsp;&nbsp;$filename_name <br>";
								print "<font color='red'>(เมื่อ Preview แล้ว ก่อน Add ให้เลือกไฟล์ใหม่อีกครั้ง)</font></td></tr>";
?>
								</table>
								</td>
								<td width=15 height=1 background="<?=$path_web_img?>p5.gif"><img src="<?=$path_web_img?>p5.gif"></td>
								</tr></table>

								<table cellpadding=0 cellspacing=0 width=98% border=0>
								<tr><td width=15 height=15><img src="<?=$path_web_img?>p6.gif"></td>
										<td width=100% background="<?=$path_web_img?>p7.gif" width=1 height=15>&nbsp;</td>
										<td width=15 height=15><img src="<?=$path_web_img?>p8.gif"></td>
								</tr>
								</table> 
			</center>
<? 
		}
		if(($HTTP_POST_VARS["submit"]=="Add") and ($error==0))
		{				
				$Filename = "paper_".md5(time()).".".file_ext($filename_name);         				
				if (!copy($filename,"$file_paper/$Filename")) 
				{
					print ("<center><font color='red'>ไม่สามารถ upload file ได้</font></center>"); 
				}
				$sql_update = "insert into paper values
			('','$uid','$name_t','$name_e','$keyword','$abstract','$Filename',now() ) ";					
			$result_update=mysql_query($sql_update);			
			if ($result_update)			
			redirect("../staff/isagstaff.php");
			exit;
		}
}
//----------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (($error==1) or ($HTTP_POST_VARS["submit"]=="preview") or (($HTTP_POST_VARS["submit"]!="preview") and ($HTTP_POST_VARS["submit"]!="Add")))
{
 ?>
<CENTER>
	<form enctype = "multipart/form-data" method=post action="<?=$HTTP_SERVER_VARS["PHP_SELF"]?>">
	<input type="hidden" name="MAX_FILE_SIZE" value="10000000">
	<table cellpadding=2 cellspacing=1 width=99% >	
		<TR>
				<TD colspan=6 ID=table3><CENTER>Review Paper</CENTER></TD></TR>
		<TR ID=table1>	
				<TD>&nbsp;ชื่อบทความ (Thai)</TD>
				<TD colspan=3>&nbsp;<input type=text size=50 name="name_t" value="<?=stripslashes($name_t)?>"> </TD></TR>
		<TR ID=table1>	
				<TD>&nbsp;ชื่อบทความ (Eng)</TD>
				<TD colspan=3>&nbsp;<input type=text size=50 name="name_e" value="<?=stripslashes($name_e)?>"> </TD></TR>
		<TR ID=table1>	
				<TD>&nbsp;keyword</TD>
				<TD colspan=3>&nbsp;<input type=text size=50 name="keyword" value="<?=stripslashes($keyword)?>"> (แต่ละคำ เว้น 1 space ไม่ต้องมี , ) </TD></TR>
		<TR ID=table1>
				<TD>&nbsp;Review </TD>
				<TD colspan=3>&nbsp;<TEXTAREA COLS=70 ROWS=8 name="abstract"><?=stripslashes($abstract)?></TEXTAREA></TD></TR>
		<TR ID=table1>
				<TD>&nbsp;ไฟล์ </TD>
				<TD colspan=3>&nbsp;<input type=file size=20 name="filename"></TD></TR>
		<TR ID=table1><TD colspan=4><CENTER>
					<input type="submit"  name="submit" value="preview">
					<input type="submit" name="submit" value="Add"></CENTER></TD></TR>
		<TR ID=table1><TD colspan=4>&nbsp;</TD></TR>
	</table>
	</form>
	</CENTER>
<?
}
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close();
staffmenu_4();
?>


