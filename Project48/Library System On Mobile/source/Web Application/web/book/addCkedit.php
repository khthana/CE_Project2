<?php
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");

	// เริ่มติดต่อฐานข้อมูล
	mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

		mysql_query("SET NAMES 'tis620'");

	// เลือกฐานข้อมูล
	mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

	
 $_POST['code'];   //จะรับค่าเฉพาะที่มีข้อมูลเท่านั้น
 $_POST['catalog']; 
 $_POST['name_book']; 
 $_POST['writer']; 
 $_POST['name_borrow']; 
 $_POST['id']; 
 $_POST['company']; 
 $_POST['isbn']; 
 $_POST['price']; 


	for($i=0;$i< count($code);$i++){
	@$sql="update book set catalog='$catalog[$i]',code='$code[$i]',name_book='$name_book[$i]',company='$company[$i]', writer='$writer[$i]',year_print='$year_print[$i]',isbn='$isbn[$i]', price='$price[$i]',name_borrow='$name_borrow[$i]'  where id='$id[$i]'";
	//@$sql="update book set code='$code[$i]'  where id='$id[$i]'";
	//@$sql="update book set name_book='$name_book[$i]'  where id='$id[$i]'";
	//@$sql="update book set company='$company[$i]'  where id='$id[$i]'";
	//@$sql="update book set writer='$writer[$i]'  where id='$id[$i]'";
	//@$sql="update book set year_print='$year_print[$i]'  where id='$id[$i]'";
	//@$sql="update book set isbn='$isbn[$i]'  where id='$id[$i]'";
	//@$sql="update book set price='$price[$i]'  where id='$id[$i]'";
	//@$sql="update book set name_borrow='$name_borrow[$i]'  where id='$id[$i]'";
	$result = mysql_db_query($dbname, $sql);
	
	echo "<Font color=blue> แสดงผลการแก้ไขข้อมูลที่คุณได้ทำการเลือกไว้ดังนี้     หัวข้อที่  [$i ] มี id=$id[$i] <br></Font>"; 
	echo" code = $code[$i] <br>";
	//echo"$value<br>";
	echo" หมู่ = $catalog[$i]<br>";
	echo" ชื่อหนังสือ = $name_book[$i]<br>";
	echo" ชื่อผู้แต่ง = $writer[$i]<br>";
	echo"ปีที่พิมพ์ = $year_print[$i]<br>";
	echo"ISBN= $isbn[$i]<br>";
	echo"ราคา = $price[$i]<br>";
	echo"ชื่อผู้ยืม = $name_borrow[$i]<br>";
	
	}

	
			echo"<br><br> [ <A  href= clearStatus3.php >กลับไปหน้าแรก</A>] ";
		
						
?>