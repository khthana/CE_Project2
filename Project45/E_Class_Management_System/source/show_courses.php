	<?php
		require('./libraries/grab_globals.lib.php');
		session_start(); 
		if(session_is_registered("SESSION"))//check SESSION set sure
				{
					function find_dir($root,$path){
							$dir=opendir($root);
									while($file=readdir($dir))
										 { 
										 	if($file==$path)
												{ 
												  return true;
												}
										}
										return false;
							closedir($dir);
							}
							
							
//--------------------------------------------------------------------------------------Body Program ------------------------------------------------------------------//
							$TID = $SESSION[id];
							$Path = "Teacher";
							if(!find_dir("./",$Path))
							 		mkdir("./Teacher",0755);
									
							$Path = "./Teacher";
							if(!find_dir($Path,$TID))
							 		mkdir("$Path/$TID",0755);
									
							$Path .= "/".$TID;
							if(!find_dir($Path,"Courses"))
									mkdir("$Path/Courses",0755);
							 							
							/*@$db=mysql_connect("localhost","root","");
							if(!$db)
							{
														echo"ไม่สามารถติดต่อฐานข้อมูลได้";
														exit;
							}
							mysql_select_db("e_learning");*/
							//include("./config.inc.php");
							$sql="select ID,Name from courses where TID=$TID order by ID"	;
							$result=mysql_query($sql);
							//echo gettype($result);
							?>
							<form action="del_course.php" method="get" name="course_form">
							<?php
							echo"<table align=center border=0 width=100% class='text' >";
							echo"<tr bgcolor=AA99DD>";
							echo"<td width=5%><input name='select' type='button' value='select all'></td>";
							echo"<td width=15% align=center>รหัสวิชา </td>";
							echo"<td width=50% align=center>ชื่อวิชา </td>";
							echo"</tr>";
							while($row=mysql_fetch_row($result))
								{	
												$c_id=intval($row[0]);
												echo"<tr bgcolor=EEEEEE>";
												echo"<td  align=center width=5%><input name='course[ ]' type='checkbox' value=$c_id></td>";
												echo"<td  align=center width=15%>".stripslashes($row[0])."</td>";
												echo"<td  align=center width=50%><a href='course_detail.php?ID=$row[0]&TID=$TID'>".stripslashes($row[1])."</a></td>";
												echo"</tr>";
								}
							echo"<tr bgcolor=EEEEEE>";
							echo"<input name='TID' type='hidden' value=$TID>";
							echo"<td align='center'><input name='delete' type='submit' value='&nbsp;ลบ&nbsp;' onclick=\"if (!window.confirm('คุณแน่ใจว่าจะลบวิชาที่เลือกหรือไม่ ?')) return false;\">";
							echo"<input name='reset' type='reset' value='ยกเลิก'></td>";
							echo"<td>&nbsp;</td>";
							echo"<td>&nbsp;</td>";
							echo"</tr>";
							echo"</table>";
							?>
							</form>
							<?php
							mysql_close();
	?>
	<table align="center" border="0" cellpadding="0" cellspacing="0" class="text" >
	<tr>
	<td align="center">
	<form action="insert_form.php" method="post" name="menu">
	<input name="open" type="submit" value="สร้างวิชา" >
	<?php
	echo"<input name='TID'  type='hidden'value=$TID>";
	?>
	</form>
	</td>
	<td align="center">
	<form action="" method="post" name="chang_info">
	&nbsp;&nbsp;&nbsp;<input name="chang" type="button" value="แก้ไขข้อมูลส่วนตัว" onClick="url('<?php echo $SESSION[id]; ?>')"><?php echo"<input name='TID'  type='hidden'value=$TID>"; ?>
	</form>
	</td>
	<!--<td align="center">
	<form action="" method="post" name="mail_form">
	&nbsp;&nbsp;&nbsp;<input name="mail" type="submit" value="E-mail" onClick=open('e_mail.php3?HTTP_REFERER=1','','toolbar=no,scrollbar=yes,width=700,height=500')>
	</form>
	</td>-->
	</tr>
	</table>
	<?php
	 }
	 else
	 {
	 print "<center><font color='#FF0000'><b>กรุณา LOGIN ก่อนเข้าใช้งานด้วยครับ</b></font></center><br>
	 			<center><a href='index.php'>LOGIN </a></center>";
	 } 
	?>
<script language="JavaScript">
	function url(TID) {
		window.open('FrmTea_Update.php?TID='+TID,'Update_tea','scrollbars=1,width =650,height=500,top = 20,left=100');
	}
</script>
