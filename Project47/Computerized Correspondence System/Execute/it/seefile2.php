<?php
				require("config.php");
				$tbname = "externalbook";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				$sql = "select E_TOPIC,E_FILE from $tbname where E_TOPIC='$data'"; // หากต้องการดึงเฉพาะ Reccord ใด Record หนึ่ง ให้ใช้คำสั่ง where id='$ตัวแปร'
				$result = mysql_query($sql) or die("ไม่สามารถ query ข้อมูลได้");
				$images = mysql_fetch_array($result);
				$re_books=$result[E_TOPIC];
				$re_FILES=$images['E_FILE'];
				StripSlashes($re_FILES);
				header("Content-type: application/pdf");
				header("Content-Disposition: attachment; filename=$re_books");
				echo "$re_FILES";
?>