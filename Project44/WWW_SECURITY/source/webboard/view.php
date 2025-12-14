<?
// you must check if no ID pass in this page
include("db.php");
include ("interface.inc.php");
include("outputlib.php");
if($HTTP_POST_VARS["Submit"]=="Reply")
{
logo_noleftmenu("ISAG Webboard --> View Topic");
curve_open("<center>");
}

if(isset($HTTP_GET_VARS["ID"]))
{
	$ID=$HTTP_GET_VARS["ID"];
	$Name=$HTTP_POST_VARS["Name"];
	$Detail=$HTTP_POST_VARS["Detail"];
	$Email=$HTTP_POST_VARS["Email"];

	if (getenv(HTTP_X_FORWARDED_FOR)) $IPAddress=getenv(HTTP_X_FORWARDED_FOR); 
	else  $IPAddress=getenv(REMOTE_ADDR); 

	if (session_is_registered("uid"))  		 
		{
			$uid=$HTTP_SESSION_VARS["uid"];
			$sql = "select Username from accesslist where Username='$uid' and Level=1";
			$result=mysql_query($sql);
			if(mysql_num_rows($result)==1)
			{
				$authen=1;				
			}
		}

	$Name	= htmlspecialchars(stripslashes(trim($Name)));
	$Detail = htmlspecialchars(stripslashes(trim($Detail)));
	$Email = htmlspecialchars(stripslashes(trim($Email)));

//------------------------------------------------------------------------------------------------------------------------------------------------------------------->
if($HTTP_POST_VARS["Submit"]=="Reply") //ถ้าตอบแสดงความคิดเห็นของกระทู้นี้เข้ามา
{
		$Error=0;
		

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
				print "<CENTER><font color='$error_color'>&nbsp;ตรวจสอบเนื้อหาให้ถูกต้อง</font></CENTER>";
			}
	if ($Error==0)
	{	
		$now=date("Y-m-d H:i:s"); //จะได้เอาไปแทรกได้ตรงกัน ทั้งตารางคำถามและตารางคำตอบ
		$sql = "insert into board_ans values('','$ID','$Name','$Email','$Detail','$IPAddress','$now')";
		$result = mysql_query($sql);
			if(!$result) { print "<center>Cannot insert in database</center>"; exit; }
		$sql1 = "update board_ques set Ans=Ans+1,Lastpost='$now', Lastname='$Name' where ID=$ID";
		$result = mysql_query($sql1);
			if(!$result) { print "<center>Cannot insert in database</center>"; exit; }
	}
}
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------------

		$sql0 = "update board_ques set View=View+1 where ID=$ID";  //update แสดงจำนวนคนดู
		$result = mysql_query($sql0);
		
		$query = "select ID,Title,Name,Email,Detail,IPAddress,date_format(Datepost,'%e %b %Y') as datepost,date_format(Datepost,'%H:%i') as timepost,type from board_ques where ID=$ID";
		$result = mysql_query($query);    // select คำถามของกระทู้นี้จาก ID ที่ได้รับมาจากตารางคำถาม
		
		//เริ่ม print แสดงคำถาม
		if(mysql_num_rows($result)==1)
			{
				$row=mysql_fetch_array($result);
				$ID			=$row['ID'];
				$Title		=stripslashes($row['Title']);
				$Name1		=stripslashes($row['Name']);
				$Email1		=stripslashes($row['Email']);
				$Detail1		=stripslashes($row['Detail']);
				$IPAddress =$row['IPAddress'];
				$datepost	 =$row['datepost'];
				$timepost	 =$row['timepost'];
				$type = $row['type'];

				if($type==0)   // ถ้าเขาใส่  ID ที่เป็นของหมวด staff
					include "accesscontrol.php";
				if($HTTP_POST_VARS["Submit"]!="Reply")
				{
					logo_noleftmenu("ISAG Webboard --> View Topic");
					curve_open("<center>");
				}


?>		
		<table border=0 cellpadding=2 cellspacing=1 width=98%> 
		<tr <? if($type==0) print "ID=table3b"; else print "ID=table3"; ?>><td>&nbsp;<font color=white><b>Post by</b></font></td><td><font color=white><b><? print  " &nbsp;$Title"; ?></b></font></td></tr>
		<tr ID=table1>
			<td width=25% valign=top>
					<font face='verdana,arial,helvetica' size='1'>
					<B>&nbsp;Name</B> : <? print "$Name1"; ?><br>
					<B>&nbsp;Email </B>: <? print "$Email1"; ?><br>
					<B>&nbsp;IP</B> : <? print "$IPAddress"; ?><br>
					<B>&nbsp;Date</B> : <? print "$datepost"; ?><br>
					<B>&nbsp;Time</B> : <? print "$timepost"; ?><br><br>

					<? if($authen==1) 
							print "<b>&nbsp;<a href='".$adminsec."update_webboard.php?main=".$ID."&type=".$type."' onclick=\"return confirm('คุณต้องการที่จะลบกระทู้นี้ พร้อมคำตอบทั้งหมด?')\">ลบทั้งกระทู้</a></b>";  
						
						?>

					</font>
			</td>			
			<td width=73%>
					<table border=0 cellpadding=0 cellspacing=0 width=100%>
					<tr><td width=1>&nbsp;</td><td>
					<? print "<br>"; ?>
					<? print_output(mysplit($Detail1)); ?>
					</td></tr></table>
					
			</td>
		</tr>		
<?
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------		
		//select เพื่อแสดงคำตอบจากตารางคำตอบ ของคำถามที่มี ID ที่ได้รับเข้ามา
		$query="select IDans,Ques,Name,Email,Detail,IPAddress,date_format(Dateans,'%e %b %Y') as dateans,date_format(Dateans,'%H:%i') as timeans  from board_ans where Ques=$ID";
		$result2 = mysql_query($query);  
		if($result2)
		{	
			$num=1;
			while($row=mysql_fetch_array($result2))
			{
				$IDans			= $row['IDans'];
				$Ques			= $row['Ques'];
				$Name1		= stripslashes($row['Name']);
				$Email1		= stripslashes($row['Email']);
				$Detail1		= stripslashes($row['Detail']);
				$IPAddress = $row['IPAddress'];
				$dateans	=$row['dateans'];
				$timeans	=$row['timeans'];
			
				$alter = ($num % 2 == 0) ? "table1" : "w1";
			// print แสดงคำตอบทุกคำตอบ
			//onclick="return confirm('คุณต้องการที่จะลบ User ที่เลือกออกจากฐานข้อมูล?')"
?>
		
				<tr ID="<?=$alter?>"><td> 
						<font face='verdana,arial,helvetica' size='1'>
						<B>&nbsp;Name</B> : <? print "$Name1"; ?><br>
						<B>&nbsp;Email</B> : <? print "$Email1"; ?><br>
						<B>&nbsp;IP</B> : <? print "$IPAddress"; ?><br>
						<B>&nbsp;Date</B> <? print "$dateans"; ?><br>
						<B>&nbsp;Time</B> <? print "$timeans"; ?><br><br>

						<? if($authen==1) 
							print "<b>&nbsp;<a href='".$adminsec."update_webboard.php?sub=".$IDans."&main=".$ID."&type=".$type."' onclick=\"return confirm('คุณต้องการที่จะลบคำตอบของกระทู้นี้?')\">ลบคำตอบ</a></b>";  
						
						?>


						</font>
					</td>
					<td align=left>
						<table border=0 cellpadding=0 cellspacing=0 width=100%>
						<tr>
							<td width=1>&nbsp;</td>
							<td>
								<? print "<br>"; ?>
								<? print_output(mysplit($Detail1)); ?>
							</td>
						</tr>
						</table>

					</td>
				</tr>
			
				
<?			$num++;
				}
				print "</table>";
		}
		else { print "<center>Cannot Query Database</center>"; }
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
?>
			<SCRIPT language=JavaScript>
	function smile(what)
	{
		document.vbform.Detail.value += what+" "; 
		document.vbform.Detail.focus();
	}
	</SCRIPT>
			<br>   <!-- แสดงแบบฟอร์มให้คนที่ต้องการตอบกระทู้นี้  -->
			<form action="<?=$HTTP_SERVER_VARS['PHP_SELF']?>?ID=<? echo $ID; ?>" method="post" name=vbform>
			<table border=0 cellpadding=2 cellspacing=1 width=80%>
			<tr <? if($type==0) print "ID=table3b"; else print "ID=table3"; ?>><td colspan=2><CENTER><font color=white><b>Reply this Topic</b></font></CENTER></td></tr>
		
			<tr ID=table1><td>&nbsp;ชื่อผู้ตอบ </td><td><input type=text name="Name" value="<? if($Error!=0) echo $Name; ?>" size=30 maxlength=25></td></tr>
			<tr ID=table1><td>&nbsp;อีเมลล์ </td><td><input type=text name="Email" value="<? if($Error!=0) echo $Email; ?>" size=30 maxlength=30></td></tr>
			<tr ID=table1><td>&nbsp;คำตอบ </td><td>
				
<table border=0 cellpadding=0 cellspacing=0 width=100%>
	<tr><td>
<textarea name="Detail" cols=60 rows=10><? if($Error!=0) echo $Detail; ?></textarea>   
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
								onclick='exmp=window.open("smile.php","isag","toolbar=0, menubar=0, width=400, height= 450,  scrollbars=yes, resizable=yes"); return false;'> -->
									</td></tr>
			<tr ID=table1><td colspan=2><CENTER><input type=submit name="Submit" value="Reply">&nbsp;
										    <input type=Reset value="Cancel"></CENTER></td></tr>
			<tr ID=table1><td colspan=2>&nbsp;</td></tr>												
			</table>
			</form>

		
<?
		}
		else //if(mysql_num_rows($result)==1) ประมาณบรรทัด 78
		{
?>
		<script language="Javascript">
		window.location.replace("../webboard/boardlist.php");
		</script>
<?
		}
}
else  //if(isset($HTTP_GET_VARS["ID"]))
{
?>
	<script language="Javascript">
	window.location.replace("../webboard/boardlist.php");
	</script>
<?
}
//------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close("</center>");
empty_3();
?>
