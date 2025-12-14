<?php
session_start();
session_register("SessionMember");
//กำหนดตัวแปรเพื่อนำไปใช้งาน
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");
$tblname = "member";	//ชื่อตาราง

$auth = false; // สมมุติว่าผู้ที่ล็อกอินเข้ามายังไม่ใช่สมาชิก 

if (isset($login_name ) and isset($login_password)) 
	{ 
	    // ติดต่อเซิร์ฟเวอร์ MySQL 
	    mysql_connect( "$hostname", "$user", "$password" ) or die ("ติดต่อเซิร์ฟเวอร์ไม่ได้" ); 

			mysql_query("SET NAMES 'tis620'");

		// เลือกฐานข้อมูลบนเซิร์ฟเวอร์ MySQL
	    mysql_select_db( "$dbname" ) or die ("เลือกฐานข้อมูลไม่ได้"); 

		// คำสั่ง SQL เพื่อเลือกข้อมูล
		$sql = "SELECT * FROM member WHERE 
            login_name = '$login_name' AND 
            login_password = '$login_password'"; 

		// สั่งเอ็กซิคิวต์ SQL  แล้วใส่ค่าลงในตัวแปร $result 
	    $result = mysql_query( $sql ) or die ("เอ็กซิคิวต์คิวรีไม่ได้"); 
		$rs=mysql_fetch_array($result);

		// หาจำนวนเรกคอร์ดในตัวแปร $result
	    $num = mysql_numrows( $result ); 
		@$password = $rs[login_password];
		$SessionMember = $rs[login_name];
		$logname="admin";
		
	  $sql_status = "select * from member  where login_name='$logname'";
	$db_query_status= mysql_db_query ($dbname, $sql_status);
	
			$result_status = mysql_fetch_array($db_query_status);
							@$status_old = $result_status[status2];
		
		
		if ( $num != 0 ) 
			{ 
				// ถ้ามีเรกคอร์ดใดมีชื่อล็อกอินตรงกับที่กรอกเข้ามา 
				$auth = true; 
			} 
	} 

if ( ! $auth ) 
	{ 
		
//		echo "ชื่อหรือรหัสผ่านไม่ถูกต้อง...กรุณากลับไปแก้ไข<br>"; 
//		echo "<br><a href=login.htm>ใส่ชื่อและรหัสผ่านอีกครั้ง</a>"; 
//		exit; 
	?>
	<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
	  <TBODY>
	  <TR>
	    <TD>
	      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
	      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
	  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
	    <TD bgColor=#ffffff><br>
	<center><b>ชื่อหรือรหัสผ่านไม่ถูกต้อง...กรุณากลับไปแก้ไข</b><br> 
			[ <A  href="login.htm" >กลับไปกรอกข้อมูลใหม่</A> ]</center>
	<BR><br>
	      </TD></TR></td><TR>
		  <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
	 </TBODY></TABLE>
	<?
	} 
else 
	{ 
			if(($login_name=="") or ($login_password==""))
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
				<center><b>กรุณาใส่ username กับ password ด้วยครับ</b><br> 
						[ <A  href="login.htm" >กลับไปกรอกข้อมูลใหม่</A> ]</center>
				<BR><br>
				      </TD></TR></td><TR>
					  <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
				 </TBODY></TABLE>
				<?
			}
	  		else if(($login_name=="admin")&&($login_password=="$password") )
			{
	  		  
	  		@setcookie(" Session[login_name]",$rs[login_name],time()+3600*3);
			@setcookie(" Session[login_password]",$rs[login_password],time()+3600*3);
		
		
		$sql_online = "update member  set status2 = $status_old+1 where login_name='$logname'";
		$db_query = mysql_db_query ($dbname, $sql_online);
		//echo"<meta http-equiv= refresh content= 0;URL=list_addmin.php?login_name=$login_name&login_password=$login_password>\n";
		echo"<meta http-equiv= refresh content= 0;URL=list_addmin.php?login_name=$login_name&login_password=$login_password>\n";
}		

else
			{
	  		  
	  		@setcookie(" Session[login_name]",$rs[login_name],time()+3600*3);
			@setcookie(" Session[login_password]",$rs[login_password],time()+3600*3);
			$sql_online = "update member  set status2 = $status_old+1 where login_name='$logname'";
		$db_query = mysql_db_query ($dbname, $sql_online);
		echo"<meta http-equiv= refresh content= 0;URL=list.php?login_name=$login_name&login_password=$login_password>\n";
		
		
}	


	} 

?>