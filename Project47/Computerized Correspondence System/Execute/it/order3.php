<html>
<head>
<title>Untitled Document</title>
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
<form name="form1" method="post" action="index2.php?data=order2&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$idbook;?>">
  <table width="100%" border="0">
    <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select  * from externalbook where ID_BOOK='$idbook'";
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
							//$re_r_date   = $result[R_DATE];
							$re_r_topic  =$result[E_TOPIC];
							$re_r_to  =$result[E_TO];
							$i++;
				}
	 			mysql_close();
	 		?>
    <tr> 
      <td colspan="3" bgcolor="#990000"><p><font color="#FF0000" size="2"><img src="images/icon2/ico559.gif" width="15" height="16" border="0">&nbsp;&nbsp;<span class="style5">&nbsp;</span></font><span class="style5">สั่งการ&nbsp;<font color="#FF0000" size="2">&nbsp;&nbsp;</font></span></p>
        </td>
    </tr>
    <tr> 
      <td width="8%" class="title">เรื่อง</td>
      <td class="style4"> <font color="#0066CC"> 
        <?=$re_r_topic;?>
        </font></td>
      <td width="43%">&nbsp;</td>
    </tr>
    <tr> 
      <td class="title">เรียน</td>
      <td class="style4"> <font color="#0066CC"> 
        <?=$re_r_to;?>
        </font></td>
      <td>&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="3" align="center" class="style4"><input type="radio" name="order2" value="pass">
        <font color="#0066CC"> ผ่าน 
        <input type="radio" name="order2" value="repair">
        แก้ใข </font></td>
    </tr>
    <tr> 
      <td colspan="3" align="center"> <input type="submit" name="Submit" value="Submit" ></td>
    </tr>
  </table>
</form>
</body>
</html>
