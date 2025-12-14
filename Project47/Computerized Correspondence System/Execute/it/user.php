<html>
<head>
<title>user</title>
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
  <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from book,use_book where book.ID_BOOKS =use_book.ID_BOOKS and use_book.USER_NAME ='$username'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 	?>
  <tr align="left" valign="top" bgcolor="#990000"> 
    <td colspan="4">&nbsp;&nbsp;<img src="images/icon2/ico531.gif" width="16" height="14">&nbsp;<span class="style5">รายละเอียดหนังสือ</span></td>
  </tr>
  <tr align="center" valign="top" bgcolor="#CCCCCC"> 
    <td width="120" class="title">เลขที่หนังสือ</td>
    <td width="122" class="title">วันที่</td>
    <td width="467" class="title">เรื่อง</td>
    <td width="83" class="title">รายละเอียด</td>
  </tr>
  <?php
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_ID_BOOKS   = $result[ID_BOOKS ];
							$re_DATE  =$result[R_DATE ];
							$re_month  =$result[R_MONTH];
							$re_year  =$result[R_YEAR];
							$re_TOPIC   =$result[R_TOPIC  ];
							//$re_PICTURE  =$result[R_FILES ];
							$i++;
	 		?>
  <tr align="center" valign="top"> 
    <td align="left" bgcolor="#eeeeee" class="style4"><font color="#0066CC">ศธ 
      0524.02/ 
      <?=$re_ID_BOOKS;?>
      </font></td>
    <td align="center" bgcolor="#eeeeee"><span class="style4"><font color="#0066CC"><? echo "$re_DATE $re_month $re_year";?></font> 
      </span> </td>
    <td align="center" bgcolor="#eeeeee"><span class="style4">
      <font color="#0066CC"> 
      <?=$re_TOPIC;?>
      </font></span></td>
    <td bgcolor="#eeeeee"><span class="style4"><font size="2"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>" target="_blank"><img src="images/icon2/ico419.gif" alt="ดูรายละเอียด" width="16" height="16" border="0"></a></font> 
      </span> </td>
  </tr>
  <?
				  			}
	 			mysql_close();
		?>
</table>
</body>
</html>
