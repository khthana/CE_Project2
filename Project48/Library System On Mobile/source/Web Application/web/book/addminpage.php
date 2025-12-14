<?php
//กำหนดตัวแปรเพื่อนำไปใช้งาน
/*เรียกแฟ้มข้อมูล phpConfig.php*/
include("phpConfig.php");
$tblname = "book";	//ชื่อตาราง
$adminpass = "addmin";

// เริ่มติดต่อฐานข้อมูล
mysql_connect($hostname, $user, $password) or die("ติดต่อฐานข้อมูลไม่ได้");

	mysql_query("SET NAMES 'tis620'");

// เลือกฐานข้อมูล
mysql_select_db($dbname) or die("เลือกฐานข้อมูลไม่ได้");

if ($inputpass == $adminpass)
	{
		$sql = "select * from $tblname order by id desc";
		$db_query = mysql_db_query($dbname, $sql);
			if (!$db_query)
				{ 
					echo("<b><font size=3>เอ็กซิคิวต์คำสั่ง SQL ไม่ได้ </b></font>" . mysql_error() ); 
					exit;
				}
			else	 
				{
					$nums_rows = mysql_num_rows($db_query);	 // จำนวนเรกคอร์ดของกระทู้ทั้งหมด

					echo "<B>ถ้าต้องการลบกระทู้ให้คลิกที่ <Font color=red>Delete</Font> ด้านหน้ากระทู้</B> <Hr>";

					// เริ่มวนรอบแสดงข้อมูล
						echo "<ul>\n";
						for ($i=0;$i<$nums_rows;$i++)	// อ่านข้อมูลแต่ละเรกคอร์ด
							{
							$result = mysql_fetch_array($db_query);
										@$catalog = $result[catalog];
										@$code = $result[code];
										@$name_book = $result[name_book];
										@$writer = $result[writer];
										@$company = $result[company];
										@$year_print = $result[year_print];
										@$isbn = $result[isbn];
										@$price = $result[price];
										@$name_borrow = $result[name_borrow];
									   @$return_book = $result[return_book];
										@$datetime = $result[datetime];
										@$pic = $result[pic];
										@$name_borrow = $result[total_borrow];
										@$datetime = $result[datetime];
										@$id = $result[id];
										@$status = $result[status];
										@$status1 = $result[status];
										@$status2 = $result[status];

								echo "<a href=\"del.php?id=$id\">Delete</a>&nbsp &nbsp<img src=\"webboard/icon_mini_post.gif\" width=10 height=11> $catalog - $code - <a href= view.php?id=$id  target =_blank > <font color=red>$catalog-$code- $name_book </font> <br>\n";
							}	// จบ for
						echo "<a href = delall.php>ลบทั้งหมด</a>";
						echo "</ul>\n";

					}
		// ปิดการติดต่อฐานข้อมูล
		mysql_close();
	}
else	 // ในกรณีรหัสผ่านไม่ถูกต้อง
	{
		echo "<b><font size=3>รหัสผ่านไม่ถูกต้อง</b></font>";
	}
?>