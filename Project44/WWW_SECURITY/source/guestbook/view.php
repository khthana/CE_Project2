<?
include "interface.inc.php"; 
include "outputlib.php"; 
include "db.php"; 
logo_leftmenu("Information Security Advisory Group (ISAG)");
curve_open();
//--------------------------------------------------------------------------------------------------------------------------------------------------------------------->
	$sql = "SELECT * FROM guestbook";
	$sql_result = mysql_query($sql) or die ("เอ็กซิคิวต์คำสั่ง SELECT ไม่ได้");

	$num_rows = mysql_num_rows($sql_result);
	if ($num_rows == 0) {
		echo "ขออภัยไม่พบข้อมูลดังกล่าว";
	}
	else {
			$foundfloat = false;					// ตัวแปรที่ใช้แสดงว่าตัวแปร pg นั้นเป็น float หรือไม่

			$Gopage = $HTTP_GET_VARS["Page"];		// Page เป็นตัวแปรที่ถูกส่งมาทาง address bar

			$pg = $Gopage;		// ตัวแปร pg เป็นตัวแปรที่ไม่เปลี่ยนค่า ไม่เหมือนตัวแปร Gopage

			if ($pg != "") {				// มีการคลิกหน้าที่จะดู
					$position = strpos($pg, ".");			// หาตำแหน่งของจุดทศนิยม
			}

		if ($position != "") {      // เลขหน้าที่ใส่มานั้นเป็นเลขทศนิยม
			$foundfloat = true;
		}
		if ( ($pg >= 1 && ($foundfloat == false)) || ($pg == "") ) {
			if ($Gopage == "") {
					$Gopage = 1;
			}
			
			$Page_no = $Gopage;   // $Page_no คือ เลขหน้าที่จะดู

			$Pagesize = 10;			// กำหนดจำนวนเรกคอร์ดใน 1 หน้า
			$Maxcount = ceil($num_rows/$Pagesize);		// ตัวแปรหาจำนวนหน้าทั้งหมด

			if ($Page_no <= $Maxcount) {		// $Page_no คือ เลขหน้าที่จะดู   ส่วน $Maxcount คือ จำนวนหน้าที่มีทั้งหมด

				$Gopage = ( ($Gopage - 1)*$Pagesize );		// ตัวแปรกำหนดหน้าที่จะไป เพื่อกำหนดเรกคอร์ดที่จะดึงข้อมูลมาแสดง 
				$Recs = 1;
			
				$Checkpage = ($Gopage/$Pagesize) + 1;

				if ($Checkpage == $Maxcount) {			// ตรวจสอบถ้าเป็นหน้าสุดท้าย จำนวนเรกคอร์ดที่จะแสดงมีค่าเท่ากับ
																						// เศษของจำนวนเรกคอร์ดทั้งหมด หารด้วย จำนวนเรกคอร์ดต่อหน้า
						$Newsize = $num_rows % $Pagesize;
						if ($Newsize != 0) {
							$Pagesize = $Newsize;
						}
				}

				// กำหนดการแสดงเรกคอร์ดตั้งแต่เรกคอร์ด $Gopage ไปจำนวน $Pagesize เรกคอร์ด
				$sql2 = "SELECT name, email_addr, suggest, date_format(date, '%e %b %Y, %H:%i') as date2
						FROM guestbook ORDER BY date DESC LIMIT $Gopage, $Pagesize";	  
						// หมายเลข row จะเริ่มที่ 0 ถ้าจะเอา row แรก $Gopage ต้องเป็น 0  ส่วน $Pagesize เป็นจำนวน row ที่จะ select

				$sql2_result = mysql_query($sql2) or die ("เอ็กซิคิวต์คำสั่ง SELECT ไม่ได้");

				while ($Recs <= $Pagesize) {		// แสดงเรกคอร์ดจำนวนไม่เกินจำนวนเรกคอร์ดต่อหน้า
						$number = $Gopage + $Recs;				// ตัวแปรแสดงเรกคอร์ดที่เท่าไร
						$row = mysql_fetch_array($sql2_result);

						$name = $row[name];
						$email_addr = $row[email_addr];
						$suggest = $row[suggest];
						$date2 = $row[date2];

						echo "<table  border=0 cellpadding=2 cellspacing=1 width=70% align=center>";  //echo $number;
						echo "<tr id=w3><td  width=25%><b>&nbsp;ชื่อ</b></td><td  width=80%>&nbsp;$name</td></tr>";
						echo "<tr id=w2><td><b>&nbsp;อีเมลล์</b></td><td><a href='mailto:$email_addr'>&nbsp;$email_addr</a></td></tr>";
						echo "<tr id=w2><td><b>&nbsp;วันที่</b></td><td>&nbsp;$date2</td></tr>";
						echo "<tr id=w3><td><b>&nbsp;ข้อเสนอแนะ</b></td><td>&nbsp;$suggest</td></tr>";
						echo "</table>";
						$Recs = $Recs + 1;

						echo "<p>";
					
				}  //  end while
			}  // end if ($Page_no <= $Maxcount)
		}  // end if ( ($pg >= 1 && ($foundfloat == false)) || ($pg == "") )
	}  // end else

	if ( ($pg == "") || ( ($pg >= 1) && ($Page_no <= $Maxcount) && ($foundfloat == false) ) ) {		// ถ้าเปิดหน้านี้และยังไม่ได้คลิกหน้าที่จะดู empty($pg)  $Page_no คือ เลขหน้าที่จะดู   ส่วน $Maxcount คือ จำนวนหน้าที่มีทั้งหมด
		echo "Page ".$Checkpage." / " .$Maxcount;
		echo "<br><br>";

		if ($Checkpage >1) {		// ถ้าแสดงหน้าที่มากกว่า 1 จะมี Previous
			echo "[ <a href=".$Scriptname."?Page=".($Checkpage - 1).">Previous</a> ]";
		}
		if ($Checkpage < $Maxcount) {		// ถ้าแสดงหน้าที่น้อยกว่าหน้าสูงสุด จะมี Next
			echo "[ <a href=".$Scriptname."?Page=".($Checkpage + 1).">Next</a> ]";
		}
	
		echo "[";

		// รับค่าชื่อสคริปต์เพื่อนำมาใช้เป็นส่วนหนึ่งของการอ้างอิง
		$Scriptname = "view.php";
		for ($N=1; $N<=$Maxcount; $N=$N+1) {

				// กำหนดหมายเลขหน้าเพื่ออ้างอิงต่อไป
				$Ref = "<a href=".$Scriptname."?Page=".$N.">".$N."</a>";
				echo " ".$Ref." ";
		}

		echo "]<p>";
		mysql_free_result($sql_result);

		echo "<a href=\"guestbook.php\">Sign Guestbook</a><br>";

	}  // end if ($Gopage <= $Maxcount)
//---------------------------------------------------------------------------------------------------------------------------------------------------------------------->
curve_close();
empty_4();
?>
