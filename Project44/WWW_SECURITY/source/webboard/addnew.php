<?
include("db.php"); //$lastin=mysql_insert_id();
include ("interface.inc.php");
include("outputlib.php");
if(!isset($HTTP_GET_VARS["type"]))  // ถ้าไม่มีหมวดของเวบบอร์ดพ่วงมาให้กำหนดไว้เป็นบอร์ดบุคคลภายนอก
{
	$type=1;
}
else
{
	$type=$HTTP_GET_VARS["type"];  // ถ้ามีหมวดพ่วงมา แต่ไม่อยู่ในที่กำหนดไว้ ก็กำหนดเป็นบอร์ดของบุคคลภายนอก
	if (($type!=0) and ($type!=1)) { $type=1; }
	if ($type==0 ) { include "accesscontrol.php"; } // ถ้าหมวดที่เลือกมาเป็น staff ก็เช็ค login ทันที
	//ถึงขั้นนี้จะมีแต่ type=0 and 1 only
}
logo_noleftmenu("ISAG Webboard --> Post New Topic");
curve_open("<center>");
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
	$Title=$HTTP_POST_VARS["Title"];
	$Name=$HTTP_POST_VARS["Name"];
	$Email=$HTTP_POST_VARS["Email"];
	$Detail=$HTTP_POST_VARS["Detail"];

	$Title = htmlspecialchars(trim(stripslashes($Title)));
	$Name = htmlspecialchars(trim(stripslashes($Name)));
	$Email = htmlspecialchars(trim(stripslashes($Email)));
	$Detail = htmlspecialchars(trim(stripslashes($Detail)));
//-------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"]=="Submit")
{
	$Error=0;		
	if (!ereg("^.{4,}$",$Title))
			{
				$Error=1;
				print "<CENTER><font color='$error_color'> &nbsp;ตรวจสอบหัวข้อให้ถูกต้อง</font></CENTER>";
			}
	if (!ereg("^.{1,}$",$Name)) 
			{
				$Error=1;
				print "<CENTER><font color='$error_color'>&nbsp;ตรวจสอบชื่อให้ถูกต้อง</font></CENTER>";
			}
	if ((!ereg("^.+@.+\..+$",$Email)) and ($Email!=""))
			{
				$Error=1;			
				print "<CENTER><font color='$error_color'>&nbsp; ตรวจสอบอีเมลล์ให้ถูกต้อง</font></CENTER>";
			}
	if (!ereg("^.{1,}$",$Detail))
			{
				$Error=1;
				print "<CENTER><font color='$error_color'>&nbsp;ตรวจสอบรายละเอียดให้ถูกต้อง</font></CENTER>";
			}
	if ($Error==0)
	{	
		if (getenv(HTTP_X_FORWARDED_FOR)){ 
			$IPAddress=getenv(HTTP_X_FORWARDED_FOR); 
		} 
		else { 
			$IPAddress=getenv(REMOTE_ADDR); 
		} 

		$sql1 = "insert into board_ques values('','$Title','$Name','$Email','$Detail','$IPAddress',now(),now(),'$Name',0,0,'$type') ";
		$result = mysql_query($sql1);
		if($result)
		{
			redirect("../webboard/boardlist.php?type=".$type."");
			exit;
		}
		else print "<font size=3><b>ไม่สามารถเพิ่มข้อมูลในฐานข้อมูลได้</b></font>";
	}
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
if ($HTTP_POST_VARS["submit"]=="Preview")
{
?>
	<table border=0 cellpadding=2 cellspacing=1 width=80%>
		<tr ID=table3><td>&nbsp;<?=mysplit($Title);?></td></tr>
		<tr ID=table1>
			<td>
					<table border=0 cellpadding=0 cellspacing=0 width=100%>
					<tr><td width=1>&nbsp;</td><td>
					<? print "<br>"; ?>
					<? print_output(mysplit($Detail)); ?>
					</td></tr></table>
	
			</td></tr>
	</table>
<?
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
if (($HTTP_POST_VARS["submit"]!="Submit") or ($Error==1))
{
?>
	<SCRIPT language=JavaScript>
	function smile(what)
	{
		document.vbform.Detail.value += what+" "; 
		document.vbform.Detail.focus();
	}
	</SCRIPT>
	<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>?type=<?=$type?>" method="post" name="vbform">

	<table border=0 cellpadding=2 cellspacing=1 width=80%>
	<tr ID=table3><td colspan=2><CENTER><font color=white><b>ตั้งหัวข้อใหม่
		<?
			if ($type==0) print " (Staff Webboard)";
			//if ($type==1) print " (General Webboard)";
		?>
			
	</b></font></CENTER></td></tr>
	<tr ID=table1><td width=15%>&nbsp;หัวข้อ</td>
							   <td width=85%> <input type="text" name="Title" value="<? echo $Title; ?>" size=50 maxlength=80></td></tr>
	<tr ID=table1><td>&nbsp;ชื่อ</td>
							   <td><input type="text" name="Name" value="<? echo $Name; ?>" size=30 maxlength=25></td></tr>
	<tr ID=table1><td>&nbsp;อีเมลล์</td>
							   <td> <input type="text" name="Email" value="<? echo $Email; ?>" size=30 maxlength=30></td></tr>
	<tr ID=table1><td>&nbsp;รายละเอียด</td>
							   <td>
		
<table border=0 cellpadding=0 cellspacing=0 width=100%>
	<tr><td>
<textarea name="Detail" cols=60 rows=10><? echo $Detail; ?></textarea>   
	</td><td>&nbsp;&nbsp;</td><td>
<center><B>insert smilies</B><br><br>
<A href="javascript:smile(':)')"><img src="smile_files/smile.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':(')"><img src="smile_files/frown.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':o')"><img src="smile_files/redface.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':D')"><img src="smile_files/biggrin.gif" border=0></A> <br>
<A href="javascript:smile(';)')"><img src="smile_files/wink.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':p')"><img src="smile_files/tongue.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':cool:')"><img src="smile_files/cool.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':rolleyes:')"><img src="smile_files/rolleyes.gif" border=0></A> <br>
<A href="javascript:smile(':mad:')"><img src="smile_files/mad.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':eek:')"><img src="smile_files/eek.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':confused:')"><img src="smile_files/confused.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':bawling:')"><img src="smile_files/bawling.gif" border=0></A><br>
<A href="javascript:smile(':devil:')"><img src="smile_files/devil.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':dodgy:')"><img src="smile_files/dodgy.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':eek2:')"><img src="smile_files/eek2.gif" border=0></A>&nbsp;&nbsp;&nbsp;
<A href="javascript:smile(':EL:')"><img src="smile_files/embarassedlaugh.gif" border=0></A> </center>
	</td></tr>
</table>

								<!-- <input type=image src='emotion.gif'
								onclick='exmp=window.open("smile.php","isag","toolbar=0, menubar=0,  width=400, height= 450, scrollbars=yes, resizable=yes"); return false;'> -->

						</td></tr>
	<tr ID=table1><td colspan=2><CENTER><input type="submit" name="submit" value="Submit">&nbsp;&nbsp;<input type="submit" name="submit" value="Preview">&nbsp;
								<input type="reset" value="Reset"></CENTER></td></tr>
	</table>
	</form>
<?
} 
//------------------------------------------------------------------------------------------------------------------------------------------------------------------
curve_close("</center>");
empty_3();
?>

