  <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select  * from externalbook where ID_BOOK='$idbook'";
				$dbquery = mysql_db_query($dbname,$sql);
				$result = mysql_fetch_array($dbquery);
							$re_category=$result[CATEGORY];
							$re_topic=$result[E_TOPIC];
							$re_to=$result[E_TO];
							$re_and=$result[E_AND];
							$re_data1=$result[E_DATA1];
							$re_data2=$result[E_DATA2];
							$re_data3=$result[E_DATA3];
							$re_username=$result[USER_NAME];
							$re_position=$result[POSITION];
							$re_file=$result[E_FILE];
							$re_typesent=$result[TYPE_SENT];
							$re_keys=$result[KEYS];
							echo "category is $re_category";
							switch($re_category)
							{
									case 'หนังสือภายใน':
									{
											
									}break;
									case 'หนังสือภายนอก':
									{
									
									}break;
									default:
									{
											echo "ขอ้มูลหนังสือไม่สมบูรณ์";
									}
							}
	 			mysql_close();
				
	 		?>