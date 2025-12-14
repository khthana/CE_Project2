<html>
<head>
<title>สั่งการ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style5 {
	color: #FFFFFF;
	font-weight: bold;
	font-size: 12px;
	font-family: Tahoma, Verdana, Arial;
}
-->
</style>
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
				$re_r_month   = $result[R_MONTH];
				$re_r_year   = $result[R_YEAR];
				$re_r_topic  =$result[R_TOPIC];
				$re_r_to  =$result[R_TO];
				$re_id_book   = $result[ID_BOOKS];
	 		?>
<br>
<form name="form1" method="post" action="save3.php?re_id_book=<?=$re_id_book;?>&data3=<?=$data3;?>&st_date=<?=$st_date ;?>&st_month=<?=$st_month;?>& st_year=<?=$st_year;?>&end_date=<?=$end_date;?>& end_month=<?=$end_month;?>& end_year=<?=$end_year;?>&order=<?=$order;?>">
  <table width="100%" border="0" cellpadding="5" cellspacing="1">
    <tr bgcolor="#990000"> 
      <td colspan="2"><font color="#FF0000" size="2"><img src="images/icon2/ico559.gif" width="15" height="16" border="0"></font><span class="style5">&nbsp;ผลการสั่งการ</span></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCCCC"><span class="title">เลขที่หนังสือ</span><font color="#FF0000">&nbsp; </font></td>
      <td bgcolor="#eeeeee" class="style4"><font color="#000000"> ศธ 0524.02/ 
        <? if($num_rows==0){
						echo "ไม่มีเลขทะเบียนหนังสือรับหมายเลขนี้";
				}
		  		echo "$re_id_book";
		?>
        </font></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCCCC"><span class="title">วันที่</span> <font color="#FF0000">&nbsp; </font></td>
      <td bgcolor="#eeeeee" class="style4"><font color="#000000"><? echo "$re_r_date $re_r_month $re_r_year";?></font></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCCCC"><span class="title">เรื่ื่อง</span> <font color="#FF0000">&nbsp; </font></p></td>
      <td bgcolor="#eeeeee"><span class="style4"><font color="#FF0000"> <font color="#333333"> 
        <?=$re_r_topic;?>
        </font></font></span></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCCCC"><span class="title">เรียน</span> <font color="#FF0000">&nbsp; </font></td>
      <td bgcolor="#eeeeee"><font color="#FF0000"> <span class="style4"> 
        <?=$re_r_to;?>
        </span></font></td>
    </tr>
    <tr> 
      <td bgcolor="#CCCCCC"><span class="title">ระยะเวลาประกาศ</span> <font color="#FF0000">&nbsp; </font></td>
      <td bgcolor="#eeeeee"><font color="#FF0000"> <span class="style4"> 
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
        </span></font></td>
    </tr>
    <tr bgcolor="cccccc"> 
      <td colspan="2" class="title">บุคคลที่ต้องการประกาศ คือ</td>
    </tr>
    <tr> 
      <td height="24" colspan="2"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr align="center" valign="top" bgcolor="#999999"> 
            <td height="19" align="left" bgcolor="eeeeeee"> <span class="style4"><font color="#0066CC" size="4"> 
              <? 
	switch ($type_order)
	{
		/*	case 'order': {
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
			}break;*/
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
							$d20= addslashes($d20);							
							$date_end= addslashes($date_end);
							$sql = "INSERT INTO `use_book` ( `ID_BOOKS` , `USER_NAME` , `DATE_START` , `DATE_END` , `R_ORDER` , `RESULT` ) 
												VALUES ('$re_id_book', 'order_and_sent', '$date_start', '$date_end', '$d20', 'NEWBOOK')";
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
									$sql = "INSERT INTO `use_book` ( `ID_BOOKS` , `USER_NAME` , `DATE_START` , `DATE_END` , `R_ORDER` , `RESULT` ) 
												VALUES ('$re_id_book', '$re_user', '$date_start', '$date_end', '$d20', 'NEWBOOK')";
									$db_query=mysql_db_query($dbname,$sql);
									$i++;
							}
							$sql2 = "UPDATE `book` SET `STATUS` = 'OLD_BOOK' WHERE `ID_BOOKS` = '$re_id_book' LIMIT 1 ";
							$db_query=mysql_db_query($dbname,$sql2);
			}break;
			/*case 'sent_all': {
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
			}break;*/
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
							$d20= addslashes($d20);
							$date_end= addslashes($date_end);
							$sql = "INSERT INTO `use_book` ( `ID_BOOKS` , `USER_NAME` , `DATE_START` , `DATE_END` , `R_ORDER` , `RESULT` ) 
												VALUES ('$re_id_book', '$re_name', '$date_start', '$date_end', '$d20', 'NEWBOOK')";
							$db_query=mysql_db_query($dbname,$sql);
							echo "ประกาศข้อมูลเสร็จเรียบร้อยแล้ว ";
							$i++;
							echo "ลำดับที่$i  $re_name";
							echo "<br>";		
					}
					$sql2 = "UPDATE `book` SET `STATUS` = 'OLD_BOOK' WHERE `ID_BOOKS` = '$re_id_book' LIMIT 1 ";
					$db_query=mysql_db_query($dbname,$sql2);

			}	break;
			default : echo "ยังไม่ได้ระบประเภทการประกาศ";
		}
	?>
              </font></span></td>
          </tr>
          <?
	 			mysql_close();
		?>
        </table></td>
    </tr>
    <tr> 
      <td width="151" height="26" align="left">&nbsp; </td>
      <td width="615" align="right">&nbsp;</td>
    </tr>
  </table>
</form>
</body>
</html>


		





