<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style8 {
	color: #FFFFFF;
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
				$sql = "select * from book,use_book where (book.ID_BOOKS=use_book.ID_BOOKS) AND (use_book.USER_NAME='order_and_sent')";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 	?>
  <tr valign="middle" bgcolor="#990000"> 
    <td height="38" colspan="4">&nbsp;<img src="images/icon2/ico479.gif" width="16" height="15" align="absmiddle">&nbsp;<span class="style5 style8 style8"><strong>ป</strong></span><span class="style8"><strong>ระกาศ</strong></span></td>
  </tr>
  <?php
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_ID_BOOKS   = $result[ID_BOOKS ];
							$re_DATE  =$result[R_DATE ];
							$re_R_MONTH   =$result[R_MONTH ];
							$re_R_YEAR  =$result[R_YEAR];
							$re_TOPIC   =$result[R_TOPIC  ];
							$i++;
	 		?>
  <tr align="center" valign="top"> 
    <td width="134" align="left" bgcolor="#eeeeee"><font color="#0066CC">&nbsp;<span class="style4">ศธ 0524.02/
      <?=$re_ID_BOOKS;?>
       </span></span></font><span class="style4"></span></span></td>
    <td width="140" valign="middle" bgcolor="#eeeeee" class="style6"> 
      </span> </span> </span> 
      <font color="#0066CC"> 
      <span class="style4"><? echo "$re_DATE $re_R_MONTH $re_R_YEAR ";?>
      </span></font><span class="style4"></span></span></td>
    <td width="364" valign="middle" bgcolor="#eeeeee" class="style4"> 
      <font color="#0066CC"> 
      <?=$re_TOPIC;?>
      </font></span></td>
    <td width="114" valign="middle" bgcolor="#eeeeee" class="style4"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>"><font color="black">ดูรายละเอียด</font></a>
      </span></td>
  </tr>
  <?
				  			}
	 			mysql_close();
		?>
</table>
</body>
</html>
