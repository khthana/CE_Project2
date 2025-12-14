<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
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
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" class="style4">
  <tr align="left" valign="top" class="style5"> 
    <td height="48" colspan="5" bgcolor="#990000"><p>&nbsp;<br>
        <img src="images/icon2/ico531.gif" width="16" height="14">&nbsp;<span class="style5">รายละเอียดหนังสือ</span><br>
      </p>
      </td>
  </tr>
  <tr align="center" valign="top" bgcolor="#CCCCCC" class="style5"> 
    <td width="20%" class="title"><font color="#990000">วันที่</font></td>
    <td width="15%" class="title"><font color="#990000">เลขที่หนังสือรับ</font></td>
    <td width="40%" class="title"><font color="#990000">เรื่อง</font></td>
    <td width="15%" class="title"><font color="#990000">รายละเอียด</font></td>
    <td width="10%" class="title"><font color="#990000">สั่งการ</font></td>
  </tr>
  <?
 require("config.php");
 	 include("datethai.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from externalbook  order by  E_DATE DESC";
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
							$re_id_book=$result[ID_BOOK];
							$re_DATE  =$result[E_DATE ];
							$re_year  =$result[E_YEAR ];
							$re_month  =$result[E_MONTH ];
							$re_TOPIC   =$result[E_TOPIC  ];
							$re_STATUS   =$result[STATUS];
							$re_yourname=$result[USER_NAME];
							$re_category   =$result[CATEGORY];
							if($re_STATUS=='NEWBOOK'){					
	?>
  <tr align="center" valign="top" bgcolor="#CC9900" class="style4"> 
    <td> <font color="#0066CC"> 
      <? 
	  $nowdate=datethai("$re_year $re_month$re_DATE");
	  echo "$nowdate";
	  ?>
      </font></td>
    <td><font color="#0066CC">ศธ 0524.02/ 
      <?=$re_id_book;?>
      </font> </td>
    <td><span class="style4"> <font color="#0066CC"> 
      <?=$re_TOPIC;?>
      </font></span></td>
    <td><span class="style4"><font size="2"><a href="index2.php?data=select_see&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>&yourname=<?=$re_yourname ;?>" target="_blank"><img src="images/icon2/ico419.gif" alt="ดูรายละเอียด" width="16" height="16" border="0"></a></font></span></td>
    <td><a href="index2.php?data=order3&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>"><font color="#FF0000" size="2"><img src="images/icon2/ico559.gif" width="15" height="16" border="0"></font></a></td>
  </tr>
  <?			}
  				else
				{
	?>
  <tr align="center" valign="top" bgcolor="#eeeeee" class="style4"> 
    <td><span class="style4"><font color="#0066CC">
      <? 
	  $nowdate=datethai("$re_year $re_month$re_DATE");
	  echo "$nowdate";
	  ?>
      </font></span></td>
    <td><span class="style4"><font color="#0066CC">ศธ 0524.02/ 
      <?=$re_id_book;?>
      </font> </span></td>
    <td><span class="style4"> <font color="#0066CC"> 
      <?=$re_TOPIC;?>
      </font></span></td>
    <td><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style3"><span class="style4"><font size="2"><a href="index2.php?data=select_see&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>&yourname=<?=$re_yourname ;?>" target="_blank"><img src="images/icon2/ico419.gif" alt="ดูรายละเอียด" width="16" height="16" border="0"></a></font></span></span></span></span></span></span></span></td>
    <td>&nbsp;</td>
  </tr>
  <? 
  				}
				$i++;
			}
?>
  <?
				$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from book order by  ID_BOOKS DESC";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 	?>
  <?php
			//วนลูปแสดงข้อมูล
	 			$i=0;
	 			while($i<$num_rows)
	 			{
		 				$result = mysql_fetch_array($dbquery);
							$re_ID_BOOKS   = $result[ID_BOOKS ];
							$re_DATE  =$result[R_DATE ];
							$re_R_MONTH  =$result[R_MONTH ];
							$re_R_YEAR  =$result[R_YEAR];
							$re_TOPIC   =$result[R_TOPIC  ];
							$re_STATUS   =$result[STATUS];
							if($re_STATUS=='NEWBOOK'){
	 		?>
  <tr align="center" valign="top" bgcolor="#CC9900" class="style4"> 
    <td><span class="style4"> <font color="#0066CC"><? echo "$re_DATE $re_R_MONTH $re_R_YEAR";?></font></span></td>
    <td><font color="#0066CC">ศธ 0524.02/ 
      <?=$re_ID_BOOKS;?>
      </font></td>
    <td> <span class="style4"> <font color="#0066CC"> 
      <?=$re_TOPIC;?>
      </font></span></td>
    <td><span class="style4"><font size="2"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>" target="_blank"><img src="images/icon2/ico419.gif" alt="ดูรายละเอียด" width="16" height="16" border="0"></a></font></span></td>
    <td><a href="index2.php?data=order&username=<?=$username;?>&pwd=<?=$pwd;?>&data1=<?=$re_ID_BOOKS;?>"><font color="#FF0000" size="2"><img src="images/icon2/ico559.gif" width="15" height="16" border="0"></font></a></td>
  </tr>
  <?			}
  				else
				{
	?>
  <tr align="center" valign="top" bgcolor="#eeeeee" class="style4"> 
    <td><span class="style4"> <font color="#0066CC"><? echo "$re_DATE $re_R_MONTH $re_R_YEAR";?> 
      </font></span></td>
    <td><span class="style4"><font color="#0066CC">ศธ 0524.02/ 
      <?=$re_ID_BOOKS;?>
      </font> </span></td>
    <td bgcolor="#eeeeee"><span class="style4"> <font color="#0066CC"> 
      <?=$re_TOPIC;?>
      </font></span></td>
    <td><span class="style4"> <font size="2"><a href="seefile.php?data=<?=$re_ID_BOOKS;?>" target="_blank"><img src="images/icon2/ico419.gif" alt="ดูรายละเอียด" width="16" height="16" border="0"></a></font></span></td>
    <td><a href="index2.php?data=order&username=<?=$username;?>&pwd=<?=$pwd;?>&data1=<?=$re_ID_BOOKS;?>"></a></td>
  </tr>
  <? 
  				}
				$i++;
			}
  mysql_close(); ?>
</table>
</body>
</html>