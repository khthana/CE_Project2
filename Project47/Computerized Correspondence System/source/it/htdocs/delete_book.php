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
<form name="form1" method="post" action="deletebook.php?data1=<?=$re_idbook; ?>">
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
      <td width="119" height="20" align="center"><span class="style3"><span class="style1">
        <?=$re_idbook;?>
        </span></span> </td>
      <td width="334"><span class="style3"><span class="style3"><span class="style3"><span class="style1">
        <?=$re_topic;?>
        </span></span></span><span class="style1"> </span></span></td>
      <td width="185"><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style1">
        <?=$re_type_book;?>
        </span></span></span></span><span class="style1"> </span></span></span></td>
      <td width="114"><span class="style1"><a href="index2.php?data=deletebook&username=<?=$username;?>&data1=<?=$re_idbook;?>&pwd=<?=$pwd;?>"> 
        ลบ </a></span></td>
    </tr>
    <?
				  			}
	 			mysql_close();
		?>
  </table>
</form>
<p>&nbsp;</p>
</body>
</html>
