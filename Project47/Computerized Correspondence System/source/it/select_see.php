<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
				require("config.php");
				include("datethai.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from externalbook where ID_BOOK='$idbook'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 				$result = mysql_fetch_array($dbquery);
							$re_id_book=$result[ID_BOOK];
							$re_id=$result[ID];
							$re_DATE  =$result[E_DATE ];
							$re_year  =$result[E_YEAR ];
							$re_month  =$result[E_MONTH ];
							$re_TOPIC   =$result[E_TOPIC  ];
							$re_TO   =$result[E_TO];
							$re_AND  =$result[E_AND];
							$re_DATA1  =$result[E_DATA1];
							$re_DATA2  =$result[E_DATA2];
							$re_DATA3  =$result[E_DATA3];
							$re_END  =$result[E_END];
							$re_category   =$result[CATEGORY];
							$re_yourname=$result[USER_NAME];
							$re_DATA1=StripSlashes($re_DATA1);
							$re_DATA2=StripSlashes($re_DATA2);
							$re_DATA3=StripSlashes($re_DATA3);
							$sql = "select * from users where USER_NAME='$re_yourname'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 				$result = mysql_fetch_array($dbquery);
							$re_YOS=$result[YOS];
							$re_sername=$result[SERNAME];
							$re_position=$result[POSITION];
							if($re_position=='user')
									$re_position='อาจารย์';
							$reyourname="$re_YOS $re_yourname $re_sername";
							
												
				 mysql_close(); ?>
				  <? 
	  $data_date=datethai("$re_year $re_month$re_DATE");
	  echo "$nowdate";
	  ?>
	 <meta http-equiv="refresh" content="0;URL=/it/<? if($re_category=='หนังสือภายนอก') echo "externalbook.php"; else echo "internalbook.php";?>?data_date=<?=$data_date;?>&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>
	 &id=<?=$re_id;?>&data_date=<?=$data_date;?>&data4=<?=$re_TOPIC;?>&data5=<?=$re_TO;?>&data7=<?=$re_DATA1;?>&data11=<?=$re_DATA2;?>
	 &data8=<?=$re_DATA3;?>&menu2=<?=$reyourname;?>&menu4=<?=$re_position;?>">
</body>
</html>
