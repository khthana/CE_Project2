  <?php
				require("config.php");
				$tbname = "externalbook";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "SELECT ID_BOOK
FROM externalbook
WHERE ID_BOOK IS NOT NULL 
ORDER BY ID DESC  LIMIT 0 , 30";
				$dbquery = mysql_db_query($dbname,$sql);
				$result = mysql_fetch_array($dbquery);
							$re_id_book=$result[ID_BOOK];
							//$re_id_book++;
$sql = "UPDATE `externalbook` SET `ID` = '$re_id_book',
`STATUS` = 'NEWBOOK'
 WHERE `ID_BOOK` = '$idbook' LIMIT 1";
$db_query=mysql_db_query($dbname,$sql);
echo "ออกเลขที่หนังสือเสร็จเรียบร้อยแล้ว ";
$sql = "SELECT * 
FROM `externalbook`  WHERE ID='$idbook' LIMIT 1";
$db_query=mysql_db_query($dbname,$sql);
				$result = mysql_fetch_array($dbquery);
							$re_id_book=$result[ID_BOOK];
							$re_DATE  =$result[E_DATE ];
							$re_year  =$result[E_YEAR ];
							$re_month  =$result[E_MONTH ];
							$i_data1 =$result[E_DATA1 ];
							$i_data2  =$result[E_DATA2 ];
							$i_data3 =$result[E_DATA3 ];
							$re_TOPIC   =$result[E_TOPIC  ];
							$re_category   =$result[CATEGORY];
							$re_yourname=$result[USER_NAME];
							$re_status=$result[STATUS];
	 			mysql_close();
				
	 		?>
			
						<?php 
$file_name="$d4";
$output="เรื่อง $d4  วันที่ $mday$re_month $re_year ถึง $i_to สิ่งที่ส่งมาด้วย$i_and  ข้อมูล $i_data1 $i_data2   $i_data3 ผู้ส่ง $re_yourname  ส่งโดยวิธี $type_sent  คำสำคัญ $keys ";
$filename="..\file\$idbook.txt";
$fp = fopen($filename, "w");
fwrite($fp, $output);
fclose($fp);
?> 

			
