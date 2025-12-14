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
		$journal = htmlspecialchars(trim($HTTP_POST_VARS["journal"]));
		$page = htmlspecialchars(trim($HTTP_POST_VARS["page"]));
		$num = htmlspecialchars(trim($HTTP_POST_VARS["num"]));
		$name1 = htmlspecialchars(trim($HTTP_POST_VARS["name1"]));
		$from1 = htmlspecialchars(trim($HTTP_POST_VARS["from1"]));
		$name2 = htmlspecialchars(trim($HTTP_POST_VARS["name2"]));
		$from2 = htmlspecialchars(trim($HTTP_POST_VARS["from2"]));
		$name3 = htmlspecialchars(trim($HTTP_POST_VARS["name3"]));
		$from3 = htmlspecialchars(trim($HTTP_POST_VARS["from3"]));
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
		if ($journal=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่ชื่อวารสาร<br></font></center>";
			}
		if (!ereg("^[0-9]{1,4}$",$page))
			{
				$Error=1;			
				print "<center><font color='red'>ยังไม่ได้ใส่หมายเลขหน้าของบทความนี้<br></font></center>";
			}
		if (!ereg("^[0-9]{1,4}$",$num))
			{
				$Error=1;			
				print "<center><font color='red'>ยังไม่ได้ใส่เล่มที่ของวารสารนี้<br></font></center>";
			}
		if ($name1=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่ชื่อของผู้แต่ง1<br></font></center>";
			}
		if ($from1=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่ที่อยู่ของผู้แต่ง1<br></font></center>";
			}
		if ($name2!="" and $from2=="")  //ใส่ชื่อคนที่สองแต่ไม่ใส่ที่อยู่
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่ที่อยู่ของผู้แต่ง2<br></font></center>";
			}
		if ($name3!="" and $from3=="") //ใส่ชื่อคนที่สามแต่ไม่ใส่ที่อยู่
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่ที่อยู่ของผู้แต่ง3<br></font></center>";
			}
		if ($abstract=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใส่บทคัดย่อ<br></font></center>";
			}
		if ($filename=="")
			{
				$error=1;				
				print "<center><font color='red'>ยังไม่ได้ใสชื่อไฟล์<br></font></center>";
			}
		//-----------------------------------------------------------------------------
		if(($HTTP_POST_VARS["submit"]=="preview") and ($error==0))		   
		{
				print "<font size=3><CENTER><b>Preview Publication</b></CENTER></font>";
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
								print "<tr><td><br><B>จากวารสาร</B> ".stripslashes($journal)." <B>เล่มที่</B> ".stripslashes($num)." <B>หน้าที่</B> ".stripslashes($page)."</td></tr>";
								print "<tr><td><B>โดย</B><br>".stripslashes($name1).", ".stripslashes($from1)."</td></tr>";
								if ($name2!="") print "<tr><td>".stripslashes($name2).", ".stripslashes($from2)."</td></tr>";
								if ($name3!="") print "<tr><td>".stripslashes($name3).", ".stripslashes($from3)."</td></tr>";
								print "<tr><td><b>บทคัดย่อ</b><br>".stripslashes($abstract)."</td></tr>";
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
				$Filename = "publication_".time().".".file_ext($filename_name);         				
				if (!copy($filename,"$file_public/$Filename")) 
				{
					print ("<center><font color='red'>ไม่สามารถ upload file ได้</font></center>"); 
				}
				$sql_update = "insert into public values
			('','$uid','$name_t','$name_e','$keyword','$journal','$page','$num','$name1','$from1',			
			'$name2','$from2','$name3','$from3','$abstract','$Filename',now() ) ";					
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
				<TD colspan=6 ID=table3><CENTER>Add Publication</CENTER></TD></TR>
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
				<TD>&nbsp;จากวารสาร</TD>
				<TD>&nbsp;<input type=text size=30 name="journal" value="<?=stripslashes($journal)?>"></TD>
				<TD>&nbsp; หน้า</TD>
				<TD>&nbsp;<input type=text size=4 name="page" maxlength=4 value="<?=stripslashes($page)?>">&nbsp;
				เล่มที่ <input type=text size=4 name="num" maxlength=4 value="<?=stripslashes($num)?>"></TD></TR>

		<TR ID=table1>
				<TD>&nbsp;ผู้วิจัย 1 </TD>
				<TD>&nbsp;<input type=text size=30 name="name1" value="<?=stripslashes($name1)?>"></TD>
				<TD>&nbsp;จาก </TD>
				<TD>&nbsp;<input type=text size=42 name="from1" value="<?=stripslashes($from1)?>"></TD></TR>
		<TR ID=table1>
				<TD>&nbsp;ผู้วิจัย 2 </TD>
				<TD>&nbsp;<input type=text size=30 name="name2" value="<?=stripslashes($name2)?>"></TD>
				<TD>&nbsp;จาก </TD>
				<TD>&nbsp;<input type=text size=42 name="from2" value="<?=stripslashes($from2)?>"></TD></TR>
		<TR ID=table1>
				<TD>&nbsp;ผู้วิจัย 3 </TD>
				<TD>&nbsp;<input type=text size=30 name="name3" value="<?=stripslashes($name3)?>"></TD>
				<TD>&nbsp;จาก </TD>
				<TD>&nbsp;<input type=text size=42 name="from3" value="<?=stripslashes($from3)?>"></TD></TR>
		<TR ID=table1>
				<TD>&nbsp;บทคัดย่อ </TD>
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


