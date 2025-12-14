<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="../nissan/nissan.css" type="text/css" media="screen">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>
<link href="../nissan/nissan.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #990000;
	font-weight: bold;
}
.style3 {
	color: #666666;
}
.style4 {color: #666666}
.style6 {color: #666666; font-weight: bold; }
.style7 {color: #333333}
-->
</style>
</head>

<body>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="10">
  <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from book where book.STATUS='NEWBOOK'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 	?>
  <tr align="center" valign="top" bgcolor="#999999"> 
    <td width="131">วันที่</td>
    <td width="107">เลขที่หนังสือรับ</td>
    <td width="344">เรื่อง</td>
    <td width="110">รายละเอียด</td>
    <td width="50">สั่งการ</td>
  </tr>
  <?php
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_ID_BOOKS   = $result[ID_BOOKS ];
							$re_DATE  =$result[R_DATE ];
							$re_TOPIC   =$result[R_TOPIC  ];
							$i++;
	 		?>
  <tr align="center" valign="top"> 
    <td bgcolor="#eeeeee"><span class="style4"></span><span class="style3"><span class="style1"> 
      <?=$re_DATE;?>
      </span></span><span class="style1"> </span></td>
    <td bgcolor="#eeeeee"><span class="style3"><span class="style1"> </span><span class="style1"> 
      <?=$re_ID_BOOKS;?>
      </span><span class="style6"> </span></span></td>
    <td bgcolor="#eeeeee"><span class="style3"><span class="style1"> </span><span class="style3"><span class="style1"> 
      <?=$re_TOPIC;?>
      </span></span><span class="style6"> </span></span></td>
    <td bgcolor="#eeeeee"><span class="style1"> <font size="2"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>">ดูรายละเอียด</a></font> 
      </span></td>
    <td bgcolor="#eeeeee"><a href="index2.php?data=order&username=<?=$username;?>&pwd=<?=$pwd;?>&data1=<?=$re_ID_BOOKS;?>"><font color="#FF0000" size="2">สั่งการ</font></a></td>
  </tr>
  <?
				  			}
	 			mysql_close();
		?>
</table>
</body>
</html>
