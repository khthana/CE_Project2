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
<table border="0" align="center" cellpadding="0" cellspacing="1">
  <?php
 			 include("datethai.php");
	?>
  <tr valign="top" bgcolor="#990000"> 
    <td height="38" colspan="5"><font color="#006666" size="5">&nbsp;<img src="images/icon2/ico532.gif" width="15" height="16" align="absmiddle"></font>&nbsp;<span class="style5">ขออนุมัติเลขที่หนังสือ</span></td>
  </tr>
  <tr align="center" valign="middle" bgcolor="#CCCCCC">
    <td width="116" align="center" bgcolor="#CCCCCC" class="title">วันที่</td>
    <td align="center" bgcolor="#CCCCCC" class="title">หัวเรื่อง</td>
    <td width="77" align="center" bgcolor="#CCCCCC" class="title">ดูรายละเอียด</td>
    <td width="85" align="center" bgcolor="#CCCCCC" class="title">แก้ไขรายละเอียด</td>
    <td width="136" bgcolor="#CCCCCC" class="title">อนุมัติเลขที่หนังสือ</td>
  </tr>
  <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from externalbook where STATUS='ร้องขอ' or STATUS='pass' order by  E_DATE DESC limit 0,30";
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
							$re_id=$result[ID];
							$re_DATE  =$result[E_DATE ];
							$re_year  =$result[E_YEAR ];
							$re_month  =$result[E_MONTH ];
							$re_TOPIC   =$result[E_TOPIC  ];
							$re_category   =$result[CATEGORY];
							$re_yourname=$result[USER_NAME];
							$re_status=$result[STATUS];
							if($re_status=='ร้องขอ'){					
	?>
  <tr align="center" valign="top" bgcolor="#CC9900"> 
    <td width="116" bgcolor="#CC9900"> <font color="#0066CC"><span class="style4"><? 
	  $nowdate=datethai("$re_year $re_month$re_DATE");
	  echo "$nowdate";
	  ?></span>
      </font></td>
    <td width="386"><font color="#0066CC"> <span class="style4"> 
      <?=$re_TOPIC;?>
      </span> </font></td>
    <td width="77" valign="middle" bgcolor="#CC9900"><font size="2"><a href="index2.php?data=select_see&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>&yourname=<?=$re_yourname ;?>" target="_blank"><img src="images/icon2/ico419.gif" alt="ดูรายละเอียด" width="16" height="16" border="0"></a></font> 
    </td>
    <td width="85"><font size="2"><a href="index2.php?data=<? if($re_category=='หนังสือภายนอก') echo "edit_external_book"; else echo "edit_internalbook";?>&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>&yourname=<?=$re_yourname;?>"><img src="images/icon2/ico617.gif" width="16" height="15" border="0"></a></font></td>
    <td width="136"><a href="index2.php?data=find_out&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>&yourname=<?=$re_yourname ;?>"><font color="#FF0000" size="2"><img src="images/icon2/ico559.gif" width="15" height="16" border="0"></font></a></td>
  </tr>
  <?		}
  			if($re_status=='pass')
			{
  ?>
  <tr align="center" valign="top" bgcolor="#EEEEEE">
    <td width="116"><font color="#0066CC"> <span class="style4"> 
      <? 
	  $nowdate=datethai("$re_year $re_month$re_DATE");
	  echo "$nowdate";
	  ?>
      </span> </font></td>
    <td width="386"> <span class="style4"><font color="#0066CC"> 
      <?=$re_TOPIC;?>
      </font></span> </td>
    <td width="77" valign="middle" bgcolor="#EEEEEE"><font size="2"><a href="index2.php?data=select_see&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>&yourname=<?=$re_yourname ;?>" target="_blank"><img src="images/icon2/ico419.gif" alt="ดูรายละเอียด" width="16" height="16" border="0"></a></font></td>
    <td width="85">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <? }
				$i++;
			}
?>
  <? mysql_close(); ?>
</table>
</body>
</html>