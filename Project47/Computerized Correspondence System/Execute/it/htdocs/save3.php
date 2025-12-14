<html>
<head>
<title>สั่งการ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from book where ID_BOOKS='$data1'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
		 		$result = mysql_fetch_array($dbquery);
				$re_r_date   = $result[R_DATE];
				$re_r_topic  =$result[R_TOPIC];
				$re_r_to  =$result[R_TO];
				$re_id_book   = $result[ID_BOOKS];
	 		?>
<br>
<form name="form1" method="post" action="save3.php?re_id_book=<?=$re_id_book;?>&data3=<?=$data3;?>&st_date=<?=$st_date ;?>&st_month=<?=$st_month;?>& st_year=<?=$st_year;?>&end_date=<?=$end_date;?>& end_month=<?=$end_month;?>& end_year=<?=$end_year;?>&order=<?=$order;?>">
  <table width="100%" border="0">
    <tr> 
      <td colspan="2">เลขที่หนังสือ<font color="#FF0000"> 
        <? if($num_rows==0){
						echo "ไม่มีเลขทะเบียนหนังสือรับหมายเลขนี้";
				}
		  		echo "$re_id_book";
		?>
        </font></td>
    </tr>
    <tr>
      <td colspan="2">วันที่ <font color="#FF0000">
        <?=$re_r_date;?>
        </font></td>
    </tr>
    <tr> 
      <td colspan="2"><p> เรื่อง <font color="#FF0000"> 
          <?=$re_r_topic;?>
          </font></p></td>
    </tr>
    <tr> 
      <td colspan="2">เรียน <font color="#FF0000"> 
        <?=$re_r_to;?>
        </font></td>
    </tr>
    <tr> 
      <td colspan="2">ระยะเวลาประกาศ <font color="#FFFFFF"> 
        <? 
	switch ($order)
	{
			case 'order_alltime': {
					echo "ประการตลอด";
			}break;
			case '30day': {
					echo "ประการ 30 วัน";
			}break;
			case 'order_intime' : {
					echo "ประกาศเป็นช่วงเวลา ตั้งแต่  $st_date $st_month $st_year ถึง $end_date $end_month $end_year";		
			}	break;
			default : echo "ไม่ได้ระบุเวลา";
		}
	?>
        </font></td>
    </tr>
    <tr> 
      <td colspan="2">บุคคลที่ต้องการประกาศ คือ</td>
    </tr>
    <tr> 
      <td height="24" colspan="2"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center" valign="top" bgcolor="#999999"> 
            <td height="20" align="left"> <span class="style3"><span class="style1"> 
              </span></span><span class="style3"><span class="style3"><span class="style1"> 
              </span></span></span><span class="style1"><a href="index.php?data=deleteuser&username=<?=$username;?>&data1=<?=$re_user;?>"> 
              </a> <span class="style3"><span class="style3"><span class="style1"> 
              <font color="#3300FF" size="4"> 
                  <? 
	switch ($type_order)
	{
			case 'order': {
					echo "ประการ";
					//$sql = "select USER_NAME from user where POSITION='user'";
					//$dbquery = mysql_db_query($dbname,$sql);
					//หาจำนวลเรกคอร์ดข้อมูลในตาราง
					//$num_rows = mysql_num_rows($dbquery);
					//หาจำนวลฟิลด์ในตาราง
	 //				$num_fields= mysql_num_fields($dbquery);
					//$i=0;
					//while($i<$num_rows)
					//{
					//		$re_name = $num_rows[USER_NAME];
					//		$re_name= addslashes($re_name);
						//	$time_receive= addslashes($re_id_book);
							switch ($order)
							{
									case 'order_alltime': {
										$date_start="-";
										$date_end="order_alltime";
									}break;
									case '30day': {
										$date_start="-";
										$date_end="30day";
									}break;
									case 'order_intime' : {
											$date_start=$st_date . $st_month . $st_year;
   											$date_end=$end_date . $end_month . $end_year;		
									}	break;
									default : echo "ไม่ได้ระบุเวลา";
							}
							$date_start= addslashes($date_start);
							$date_end= addslashes($date_end);
							$sql = "INSERT INTO `use_book` ( `ID_BOOKS` , `USER_NAME` , `DATE_START` , `DATE_END`) 
											VALUES ('$re_id_book', '$type_order', '$date_start', '$date_end')";
							$db_query=mysql_db_query($dbname,$sql);
							echo "ประกาศข้อมูลเสร็จเรียบร้อยแล้ว ";
					  		echo "ลำดับที่$i  $re_name";
							echo "<br>";
						//	$i++;		
				//	}
					$sql2 = "UPDATE `book` SET `STATUS` = 'OLD_BOOK' WHERE `ID_BOOKS` = '$re_id_book' LIMIT 1 ";
					$db_query=mysql_db_query($dbname,$sql2);
			}break;
			case 'order_and_sent': {
					echo "ประการ และแจ้งทุกคน";
					//ประกาศ
					switch ($order)
							{
									case 'order_alltime': {
										$date_start="-";
										$date_end="order_alltime";
									}break;
									case '30day': {
										$date_start="-";
										$date_end="30day";
									}break;
									case 'order_intime' : {
											$date_start=$st_date . $st_month . $st_year;
   											$date_end=$end_date . $end_month . $end_year;		
									}	break;
									default : echo "ไม่ได้ระบุเวลา";
							}
							$date_start= addslashes($date_start);
							$date_end= addslashes($date_end);
							$sql = "INSERT INTO `use_book` ( `ID_BOOKS` , `USER_NAME` , `DATE_START` , `DATE_END`) 
											VALUES ('$re_id_book', '$type_order', '$date_start', '$date_end')";
							$db_query=mysql_db_query($dbname,$sql);
							//แจ้งทุกคน
							$sql = "select USER_NAME from users where POSITION='user'";
							$dbquery = mysql_db_query($dbname,$sql);
							//หาจำนวลเรกคอร์ดข้อมูลในตาราง
							$num_rows = mysql_num_rows($dbquery);
							//หาจำนวลฟิลด์ในตาราง
	 						$num_fields= mysql_num_fields($dbquery);
							//วนลูปแสดงข้อมูล
	 						$i=0;
	 						while($i<$num_rows)
	 						{
		 							$result = mysql_fetch_array($dbquery);
									$re_user   = $result[USER_NAME];
									$sql = "INSERT INTO `use_book` ( `ID_BOOKS` , `USER_NAME` , `DATE_START` , `DATE_END`) 
													VALUES ('$re_id_book', '$re_user', '$date_start', '$date_end')";
									$db_query=mysql_db_query($dbname,$sql);
									$i++;
							}
							$sql2 = "UPDATE `book` SET `STATUS` = 'OLD_BOOK' WHERE `ID_BOOKS` = '$re_id_book' LIMIT 1 ";
							$db_query=mysql_db_query($dbname,$sql2);
			}break;
			case 'sent_all': {
					echo "แจ้งทุกคน";
					switch ($order)
							{
									case 'order_alltime': {
										$date_start="-";
										$date_end="order_alltime";
									}break;
									case '30day': {
										$date_start="-";
										$date_end="30day";
									}break;
									case 'order_intime' : {
											$date_start=$st_date . $st_month . $st_year;
   											$date_end=$end_date . $end_month . $end_year;		
									}	break;
									default : echo "ไม่ได้ระบุเวลา";
							}
							$date_start= addslashes($date_start);
							$date_end= addslashes($date_end);
							//แจ้งทุกคน
							$sql = "select USER_NAME from users where POSITION='user'";
							$dbquery = mysql_db_query($dbname,$sql);
							//หาจำนวลเรกคอร์ดข้อมูลในตาราง
							$num_rows = mysql_num_rows($dbquery);
							//หาจำนวลฟิลด์ในตาราง
	 						$num_fields= mysql_num_fields($dbquery);
							//วนลูปแสดงข้อมูล
	 						$i=0;
	 						while($i<$num_rows)
	 						{
		 							$result = mysql_fetch_array($dbquery);
									$re_user   = $result[USER_NAME];
									$sql = "INSERT INTO `use_book` ( `ID_BOOKS` , `USER_NAME` , `DATE_START` , `DATE_END`) 
													VALUES ('$re_id_book', '$re_user', '$date_start', '$date_end')";
									$db_query=mysql_db_query($dbname,$sql);
									$i++;
							}
							$sql2 = "UPDATE `book` SET `STATUS` = 'OLD_BOOK' WHERE `ID_BOOKS` = '$re_id_book' LIMIT 1 ";
							$db_query=mysql_db_query($dbname,$sql2);
			}break;
			case 'order_to' : {
					echo "ประกาศระบุคน<br>";
					if(empty($checkbox))
						echo "กรุณาเลือกบุคคลเพื่อแจ้งหนังสือ";
					$i=0;
					while($i<count($checkbox))
					{
						$re_name = $checkbox[$i];
							$re_name= addslashes($re_name);
							$time_receive= addslashes($re_id_book);
							switch ($order)
							{
									case 'order_alltime': {
										$date_start="-";
										$date_end="order_alltime";
									}break;
									case '30day': {
										$date_start="-";
										$date_end="30day";
									}break;
									case 'order_intime' : {
											$date_start=$st_date . $st_month . $st_year;
   											$date_end=$end_date . $end_month . $end_year;		
									}	break;
									default : echo "ไม่ได้ระบุเวลา";
							}
							$date_start= addslashes($date_start);
							$date_end= addslashes($date_end);
							$sql = "INSERT INTO `use_book` ( `ID_BOOKS` , `USER_NAME` , `DATE_START` , `DATE_END`) 
											VALUES ('$re_id_book', '$re_name', '$date_start', '$date_end')";
							$db_query=mysql_db_query($dbname,$sql);
							echo "ประกาศข้อมูลเสร็จเรียบร้อยแล้ว ";
					  		echo "ลำดับที่$i  $re_name";
							echo "<br>";
							$i++;		
					}
					$sql2 = "UPDATE `book` SET `STATUS` = 'OLD_BOOK' WHERE `ID_BOOKS` = '$re_id_book' LIMIT 1 ";
					$db_query=mysql_db_query($dbname,$sql2);

			}	break;
			default : echo "ยังไม่ได้ระบประเภทการประกาศ";
		}
	?>              </font></span></span></span></span></td>
          </tr>
          <?
	 			mysql_close();
		?>
        </table></td>
    </tr>
    <tr> 
      <td width="252" height="26" align="left">&nbsp; </td>
      <td width="300" align="right">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>


		





