<?
require("config.php");
//$conn=mysql_connect($host,$username,$password);
//mysql_select_db($database,$conn);
?>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
 
<body>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r1_c1.gif" width="5" height="5"></td>
    <td width="963" valign="top" background="../npe/images/x_r1_c2.gif"><img src="../npe/images/x_r1_c2.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r1_c5.gif" width="5" height="5"></td>
  </tr>
  <tr> 
    <td width="5" valign="top" background="../npe/images/x_r2_c1.gif"><img src="../npe/images/x_r2_c1.gif" width="5" height="1"></td>
    <td valign="top"><font size="3" color="#006699"> <strong>ผลการค้นหาข้อมูล</strong> 
      </font><font size="3" color="#CC0000"><b>
      <?=$search?></b>
      &nbsp; </font></td>
    <td width="5" align="right" valign="top" background="../npe/images/x_r2_c5.gif"><img src="../npe/images/x_r2_c5.gif" width="5" height="1"></td>
  </tr>
  <tr> 
    <td width="5" valign="top"><img src="../npe/images/x_r4_c1.gif" width="5" height="5"></td>
    <td valign="top" background="../npe/images/x_r4_c4.gif"><img src="../npe/images/x_r4_c4.gif" width="1" height="5"></td>
    <td width="5" align="right" valign="top"><img src="../npe/images/x_r4_c5.gif" width="5" height="5"></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr> 
        <td width=7% height="39"><font size="2">เลขที่หนังสือ</font></td>
        <td width=7% align="center"><font size="2">วันที่</font></td>
        <td width=9% align="center"><font size="2">วันที่รับหนังสือ</font></td>
        <td width=20% align="center"><font size="2">เรื่อง</font></td>
        <td width=16% align="center"><font size="2">เรียน</font></td>
        <td width=12% align="center"><font size="2">ผู้ออกหนังสือ</font></td>
        <td width=7% align="center"><font size="2">คำสำคัญ</font></td>
        <td width=9% align="center"><font size="2">ชนิด</font></td>
        <td width=13% align="center"><font size="2">รายละเอียด</font></td>
      </tr>
	    
<?		
			if($search!=Null)
			{
				@$db=mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				$sql1 = "select POSITION from users where USER_NAME='$username'";
			$dbquery1 = mysql_db_query($dbname,$sql1);
			$result1 = mysql_fetch_array($dbquery1);
			$re_POSITION   = $result1[POSITION];
				switch ($re_POSITION)
				{		
								case 'user':
								{
										$db_list = mysql_list_fields("htdoc","book");
										//$num_f=mysql_num_fields($db_list);
										$x=0;
										while($x<mysql_num_fields($db_list))
										{
														$field_name=mysql_field_name($db_list,$x);
														//echo "fields name is $field_name<br>";
														//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
														$sql = "select * from book,use_book where book.$field_name like '%$search%' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
														$dbquery = mysql_db_query($dbname,$sql);
														//หาจำนวลเรกคอร์ดข้อมูลในตาราง
														$num_rows = mysql_num_rows($dbquery);
														//หาจำนวลฟิลด์ในตาราง
	 													$num_fields= mysql_num_fields($dbquery);
														$i=0;
	 													while($i<$num_rows)
	 													{
		 															$result = mysql_fetch_array($dbquery);
																	$re_ID_BOOKS   = $result[ID_BOOKS ];
																	$re_DATE  =$result[R_DATE ];
																	$re_TOPIC   =$result[R_TOPIC  ];
																	$re_TO  =$result[R_TO];
																	$re_SENDER   =$result[R_SENDER];
																	$re_DATE_RECEIVE  =$result[DATE_RECEIVE];
																	$re_KEYS  =$result[R_KEYS];
																	$re_TYPE   =$result[TYPE_BOOK];
														?>
														<tr>
																																	<td width=7% height="36"><font size="2"><span class="style3"><span class="style1"> 
																					  <?=$re_ID_BOOKS;?>
																					  </span></span></font></td>
																					<td width=7% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_DATE;?>
																					  </span></span></span></font></td>
																					<td align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_DATE_RECEIVE;?>
																					  </span></span></span></font></td>
																					<td width=20% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TOPIC;?>
																					  </span></span></span></font></td>
																					<td width=16% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TO;?>
																					  </span></span></span></font></td>
																					<td width=12% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_SENDER;?>
																					  </span></span></span></font></td>
																					<td width=7% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_KEYS;?>
																					  </span></span></span></font></td>
																					<td width=9% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TYPE;?>
																					  </span></span></span></font></td>
																					<td width=13% align="center"><span class="style1"><font size="2"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>">ดูรายละเอียด</a></font> 
																					  </span></td>
														</tr>
														<?
																				$i++;
				  													}
	 
														$x++;
										}
								}break;
								case 'secretary':
								{
											$db_list = mysql_list_fields("htdoc","book");
										//$num_f=mysql_num_fields($db_list);
										$x=0;
										while($x<mysql_num_fields($db_list))
										{
														$field_name=mysql_field_name($db_list,$x);
														//echo "fields name is $field_name<br>";
														//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
														$sql = "select * from book where book.$field_name like '%$search%'";
														$dbquery = mysql_db_query($dbname,$sql);
														//หาจำนวลเรกคอร์ดข้อมูลในตาราง
														$num_rows = mysql_num_rows($dbquery);
														//หาจำนวลฟิลด์ในตาราง
	 													$num_fields= mysql_num_fields($dbquery);
														$i=0;
	 													while($i<$num_rows)
	 													{
		 															$result = mysql_fetch_array($dbquery);
																	$re_ID_BOOKS   = $result[ID_BOOKS ];
																	$re_DATE  =$result[R_DATE ];
																	$re_TOPIC   =$result[R_TOPIC  ];
																	$re_TO  =$result[R_TO];
																	$re_SENDER   =$result[R_SENDER];
																	$re_DATE_RECEIVE  =$result[DATE_RECEIVE];
																	$re_KEYS  =$result[R_KEYS];
																	$re_TYPE   =$result[TYPE_BOOK];
														?>
														<tr>
																																	<td width=7% height="36"><font size="2"><span class="style3"><span class="style1"> 
																					  <?=$re_ID_BOOKS;?>
																					  </span></span></font></td>
																					<td width=7% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_DATE;?>
																					  </span></span></span></font></td>
																					<td align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_DATE_RECEIVE;?>
																					  </span></span></span></font></td>
																					<td width=20% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TOPIC;?>
																					  </span></span></span></font></td>
																					<td width=16% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TO;?>
																					  </span></span></span></font></td>
																					<td width=12% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_SENDER;?>
																					  </span></span></span></font></td>
																					<td width=7% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_KEYS;?>
																					  </span></span></span></font></td>
																					<td width=9% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TYPE;?>
																					  </span></span></span></font></td>
																					<td width=13% align="center"><span class="style1"><font size="2"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>">ดูรายละเอียด</a></font> 
																					  </span></td>
														</tr>
														<?
																				$i++;
				  													}
	 
														$x++;
										}	
								}break;
								case 'หัวหน้าภาควิชาวิศวกรรมคอมพิวเตอร์':
								{
											$db_list = mysql_list_fields("htdoc","book");
										//$num_f=mysql_num_fields($db_list);
										$x=0;
										while($x<mysql_num_fields($db_list))
										{
														$field_name=mysql_field_name($db_list,$x);
														//echo "fields name is $field_name<br>";
														//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
														$sql = "select * from book where book.$field_name like '%$search%'";
														$dbquery = mysql_db_query($dbname,$sql);
														//หาจำนวลเรกคอร์ดข้อมูลในตาราง
														$num_rows = mysql_num_rows($dbquery);
														//หาจำนวลฟิลด์ในตาราง
	 													$num_fields= mysql_num_fields($dbquery);
														$i=0;
	 													while($i<$num_rows)
	 													{
		 															$result = mysql_fetch_array($dbquery);
																	$re_ID_BOOKS   = $result[ID_BOOKS ];
																	$re_DATE  =$result[R_DATE ];
																	$re_TOPIC   =$result[R_TOPIC  ];
																	$re_TO  =$result[R_TO];
																	$re_SENDER   =$result[R_SENDER];
																	$re_DATE_RECEIVE  =$result[DATE_RECEIVE];
																	$re_KEYS  =$result[R_KEYS];
																	$re_TYPE   =$result[TYPE_BOOK];
														?>
														<tr>
																																	<td width=7% height="36"><font size="2"><span class="style3"><span class="style1"> 
																					  <?=$re_ID_BOOKS;?>
																					  </span></span></font></td>
																					<td width=7% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_DATE;?>
																					  </span></span></span></font></td>
																					<td align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_DATE_RECEIVE;?>
																					  </span></span></span></font></td>
																					<td width=20% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TOPIC;?>
																					  </span></span></span></font></td>
																					<td width=16% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TO;?>
																					  </span></span></span></font></td>
																					<td width=12% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_SENDER;?>
																					  </span></span></span></font></td>
																					<td width=7% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_KEYS;?>
																					  </span></span></span></font></td>
																					<td width=9% align="center"><font size="2"><span class="style3"><span class="style3"><span class="style1"> 
																					  <?=$re_TYPE;?>
																					  </span></span></span></font></td>
																					<td width=13% align="center"><span class="style1"><font size="2"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>">ดูรายละเอียด</a></font> 
																					  </span></td>
														</tr>
														<?
																				$i++;
				  													}
	 
														$x++;
										}	
								}break;
								default :
								{
									//คำสั่ง SQL ให้ทำการค้นหาข้อมูล ในตารางหนังสือ และ ต้องเป็นส่วน ที่เกี่ยวข้องกับ user เท่านั้น
									echo "user ไม่มีตำแหน่งการค้นหาข้อมูล";
									$sql = "select * from book,use_book where book.R_KEYS like '%$advance_search%' AND use_book.ID_BOOKS=book.ID_BOOKS AND use_book.USER_NAME='$username'";
								}break;
				}
	  			mysql_close();
	  			}
?>
    </table>
</body>
</html>