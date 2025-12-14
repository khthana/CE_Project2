<?php
If (($topic=="") or ($detail==""))
	{

//		echo "โปรดกรอกข้อมูลให้ครบ (โดยเฉพาะฟิลด์ที่มี *)";
//		echo "<br><br><a href =formmember.htm>กรอกข้อมูลใหม่</a>";
			?>
			<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
			  <TBODY>
			  <TR>
				<TD>
				  <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
				  color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
			  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
				<TD bgColor=#ffffff><br>
			<center><b>กรุณากรอกข้อมูลนำเสนอให้ครบด้วยครับ</b> 
					<br>[ <A  href="formguestbook.htm" >กลับไปกรอกข้อมูลใหม่</A> ]</center>
			<BR><br>
				  </TD></TR></td><TR>
					  <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
			 </TBODY></TABLE>
			<?
	}


Else
	{

/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	


	// ป้องกันการกรอกแท็ก HTML จากผู้ใช้
		
		$topic= htmlspecialchars($topic);
		$detail = htmlspecialchars($detail);
		
		

	

	// เปลี่ยน \n ให้เป็น <br> เมื่อผู้ใช้ กด enter
		$detail = nl2br($detail);
		$topic = nl2br($topic);

	// ป้อนกันการเกิด error ของ sql เมื่อ user ป้อน เครื่องหมาย "-" และ '-'
		$detail = addslashes($detail);
		$topic= addslashes($topic);
		
@setlocale("LC_TIME","th");	//ใช้เวลาแบบไทย (ดูตัวอย่างในบทที่ 7)
	$a = date("j");	 // วันที่
	$b = strftime("%B");	 // เดือนเต็ม
	$c = strftime("%Y")+543;	 // ปี พ.ศ.
	$d = date("H:i:s");	 // เวลา

	

$datetime= "$a $b $c เมื่อเวลา: $d";
@$ip=getenv ("REMOTE_ADDR"); 

	# Include upload_pic
	


	@$sql = "insert into guestbook  (g_id, g_topic, g_detail, g_ip, g_datetime) values  (' ','$topic','$detail','$ip','$datetime')";

	$result = mysql_db_query($dbname, $sql);

	if (!$result)
		{ 
			echo("เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ " . mysql_error() ); 
			exit;
		}
	else
		{
		?>
		<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
			  <TBODY>
			  <TR>
				<TD>
				  <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
				  color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
			  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
				<TD bgColor=#ffffff><br>
			<center><b>ขณะนี้ทำการบันทึกข้อมูลเรียบร้อยแล้ว.............</b>
						[ <A  href="formguestbook.htm" >กลับไปกรอกข้อมูลเสนออีกครั้ง</A> ]</center>
			<BR><br>
				  </TD></TR></td><TR>
					  <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
			 </TBODY></TABLE>
	<?

		}
	}						
?>