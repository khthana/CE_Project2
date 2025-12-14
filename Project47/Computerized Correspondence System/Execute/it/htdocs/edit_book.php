<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<form name="form1" method="post" action="editbook.php?data1=<?=$re_idbook; ?>">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="10">
    <?php
				require("config.php");
				$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select ID_BOOKS,R_TOPIC,TYPE_BOOK from $tbname";
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
							$re_idbook   = $result[ID_BOOKS];
							$re_topic  =$result[R_TOPIC];
							$re_type_book  =$result[TYPE_BOOK];
							$i++;
	 		?>
    <tr align="center" valign="top" bgcolor="#999999"> 
      <td width="116" height="20" align="center"><span class="style3"><span class="style1">
        <?=$re_idbook;?>
        </span></span> </td>
      <td width="414"><span class="style3"><span class="style3"><span class="style3"><span class="style1">
        <?=$re_topic;?>
        </span></span></span><span class="style1"> </span></span></td>
      <td width="94"><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style1">
        <?=$re_type_book;?>
        </span></span></span></span></span></span><span class="style1"> </span></span></span></td>
      <td width="112"><a href="index2.php?data=editbook&username=<?=$username;?>&data1=<?=$re_idbook;?>&data2=<?=$re_topic;?>&pwd=<?=$pwd;?>">แก้ใข</a></td>
    </tr>
    <?
				  			}
	 			mysql_close();
		?>
  </table>
</form>
</body>
</html>
