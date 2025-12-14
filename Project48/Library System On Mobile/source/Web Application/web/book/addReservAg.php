<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");
include("dateT.php");
$a = 7;
$dat=ThaiDate($a);

  $_POST['code'];   //จะรับค่าเฉพาะที่มีข้อมูลเท่านั้น
  $_POST['catalog']; 
 $_POST['name_book']; 
 $_POST['writer']; 
 $_POST['name_borrow']; 
 $_POST['id']; 
 $_POST['company']; 
 $_POST['return_book']; 
 $_POST['price'];   


	for($i=0;$i< count($code);$i++){
	@$sql="update book set return_book='$dat',status5=2 where id='$id[$i]'";
	//@$sql="update book set code='$code[$i]'  where id='$id[$i]'";
	//@$sql="update book set name_book='$name_book[$i]'  where id='$id[$i]'";
	//@$sql="update book set company='$company[$i]'  where id='$id[$i]'";
	//@$sql="update book set writer='$writer[$i]'  where id='$id[$i]'";
	//@$sql="update book set year_print='$year_print[$i]'  where id='$id[$i]'";
	//@$sql="update book set isbn='$isbn[$i]'  where id='$id[$i]'";
	//@$sql="update book set price='$price[$i]'  where id='$id[$i]'";
	//@$sql="update book set name_borrow='$name_borrow[$i]'  where id='$id[$i]'";
	$result = mysql_db_query($dbname, $sql);
	

	
	}
?>
	
		<br><br><br><br><br><br><br><br><TABLE borderColor=#999999 width="50%" align=center bgColor=#999999>
  <TBODY>
  <TR>
    <TD>
      <DIV align=center><FONT face="Verdana, Arial, Helvetica, sans-serif" 
      color=#ffffff size=4><B>สวัดดีครับ :</B></FONT></DIV></TD></TR>
  <TR><td><center><IMG  src="picture/images.jpg"> - </center></td>
    <TD bgColor=#ffffff><br>
<center><b>ได้ทำการบันทึกข้อมูลเรียบร้อยแล้ว .............</b> </center>
<BR><br>
      </TD></TR></td><TR>
          <TD><center> [ <A  href="index.php" >กลับไปหน้าแรก</A> ]<BR></center></TD></TR></TBODY></TABLE></TD></TR>
 </TBODY></TABLE>
	</TR> 
						
