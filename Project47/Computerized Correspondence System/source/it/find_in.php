<?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select  * from internalbook where I_TOPIC='$topic'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 				$result = mysql_fetch_array($dbquery);
							$re_topic=$result[I_TOPIC];
							$re_to=$result[I_TO];
							$re_and=$result[I_AND];
							$re_data1=$result[I_DATA1];
							$re_data2=$result[I_DATA2];
							$re_data3=$result[I_DATA3];
							$re_username=$result[USER_NAME];
							$re_position=$result[POSITION];
							$re_file=$result[I_FILE];
							$re_typesent=$result[TYPE_SENT];
							$re_keys=$result[KEYS];
							//$re_r_to  =$result[];
							echo " topic is $re_topic";
								echo " key is $re_keys";
	 			mysql_close();
				if($re_position=='user')
						$re_position='อาจารย์';
	 		?>
			<meta http-equiv="refresh" content="5;URL=index2.php?data=registbookout&username=<?=$username;?>&pwd=<?=$pwd;?>&topic=<?=$re_topic ;?>&to=<?=$re_to ;?>&sender=<?= $re_username;?>&file=<?=$re_file ;?>&type_sent=<?=$re_typesent ;?>&keys=<?=$re_keys ;?>">

