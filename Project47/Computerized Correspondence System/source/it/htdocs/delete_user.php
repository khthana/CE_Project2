<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="../PHP-Nuke/modules/nissan/nissan.css" type="text/css" media="screen">
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
<link href="../PHP-Nuke/modules/nissan/nissan.css" rel="stylesheet" type="text/css">
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
<form name="form1" method="post" action="">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="10">
    <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from users where POSITION='user'";
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
							$re_position  =$result[POSITION ];
							$re_position_user  =$result[POSITION_USER ];
							$re_level_user  =$result[LEVEL_USER];
							$re_department  =$result[DEPARTMENT];
							$re_kana  =$result[KANA ];
							$i++;
	 		?>
    <tr align="center" valign="top" bgcolor="#999999"> 
      <td width="83" height="20" align="right"> <span class="style3"><span class="style3"><span class="style3"><span class="style1"> 
        <?=$re_user;?>
        </span></span></span><span class="style1"> </span></span></td>
      <td width="72" align="right"><span class="style3"><span class="style3"><span class="style3"><span class="style1"> 
        <?=$re_position_user;?>
        </span></span></span></span></td>
      <td width="57" align="right"><span class="style3"><span class="style3"><span class="style3"><span class="style1"> 
        <?=$re_level_user;?>
        </span></span></span></span></td>
      <td width="127" align="right"><span class="style3"><span class="style3"><span class="style3"><span class="style1"> 
        <?=$re_department;?>
        </span></span></span></span></td>
      <td width="214"><span class="style3"><span class="style3"><span class="style3"><span class="style1"> 
        </span></span><span class="style3"><span class="style3"><span class="style3"><span class="style1">
        <?=$re_kana;?>
        </span></span></span></span><span class="style1"> </span></span></span></td>
      <td width="83"><span class="style3"><span class="style3"><span class="style3"><span class="style1">
        <?=$re_position;?>
        </span></span></span></span></td>
      <td width="86"><span class="style1"><a href="../htdocs/index2.php?data=deleteuser&username=<?=$username;?>&data1=<?=$re_user;?>&pwd=<?=$pwd;?>"> 
        ลบ </a></span></td>
    </tr>
    <?
				  			}
	 			mysql_close();
		?>
  </table>
</form>
</body>
</html>
