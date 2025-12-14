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
<table width="720" border="1" cellpadding="0" cellspacing="0">
  <?php
				require("config.php");
				$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from $tbname";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 	?>
  <tr align="center" valign="top" bgcolor="#999999"> 
    <td width="110">เลทที่หนังสือ</td>
    <td width="131">ส่วนราชาการ<br>
      เจ้าของหนังสือ </td>
    <td width="95">วัน เดีอน ปี</td>
    <td width="41">เรื่อง</td>
    <td width="44">เรียน</td>
    <td width="118">ข้อความโยย่อ</td>
    <td width="64">ผู้ลงนาม</td>
    <td>แฟ้มภาพ</td>
  </tr>
  <?php
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_ID_BOOKS   = $result[ID_BOOKS ];
							$re_SECTION_SEND=$result[SECTION_SEND];
							$re_DATE  =$result[DATE ];
							$re_TOPIC   =$result[TOPIC  ];
							$re_TO   =$result[TO ];
							$re_DATA1   =$result[DATA1];
							$re_NAME    =$result[NAME ];
							$re_PICTURE  =$result[PICTURE ];
							$i++;
	 		?>
  <tr align="center" valign="top"> 
    <td bgcolor="#eeeeee"><span class="style4"></span><span class="style1"> 
      <?=$re_ID_BOOKS;?>
      </span></td>
    <td bgcolor="#eeeeee"><span class="style3"><span class="style1"> 
      <?=$re_SECTION_SEND;?>
      </span><span class="style6"> </span></span></td>
    <td bgcolor="#eeeeee"><span class="style3"><span class="style1"> 
      <?=$re_DATE;?>
      </span><span class="style6"> </span></span></td>
    <td bgcolor="#eeeeee"><span class="style3"><span class="style1"> 
      <?=$re_TOPIC;?>
      </span><span class="style6"> </span></span></td>
    <td bgcolor="#eeeeee"><span class="style3"><span class="style1"> </span><span class="style3"><span class="style1"> 
      <?=$re_TO;?>
      </span></span><span class="style6"> </span></span></td>
    <td bgcolor="#eeeeee"><span class="style3"><span class="style1"> 
      <?=$re_DATA1;?>
      </span><span class="style6"> </span></span></td>
    <td bgcolor="#eeeeee"><span class="style3"><span class="style1"> 
      <?=$re_NAME;?>
      </span><span class="style6"> </span></span></td>
    <td bgcolor="#eeeeee"><span class="style1"> <a href="pdf_file/<?=$re_PICTURE;?>.pdf"> 
      <?=$re_PICTURE;?></a></span></td>
  </tr>
  <?
				  			}
	 			mysql_close();
		?>
</table>
</body>
</html>
