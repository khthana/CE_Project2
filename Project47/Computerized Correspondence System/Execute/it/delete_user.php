<html>
<head>
<title>user</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript">
<!--
function  Conf(object){
if (confirm("ยืนยันการลบข้อมูล?")== true) {
return true;
}
return false;
}
//-->
</SCRIPT>
</head>

<body>
<form name="form1" method="post" action="">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="38" valign="middle" bgcolor="#990000">&nbsp;<img src="images/icon2/ico215.gif" width="16" height="16" align="absmiddle">&nbsp;<span class="style8"><strong>ลบผู้ใช้งานระบบ</strong></span></td>
    </tr>
  </table>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="2">
    <tr align="center" valign="middle" bgcolor="#CCCCCC" class="title"> 
      <td width="45%" height="20">ชื่อผู้ใช้งาน</td>
      <td width="40%" >ตำแหน่ง</td>
      <td width="10%">ระดับ</td>
      <td width="5%">ลบ</td>
    </tr>
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
							$re_yos  = $result[YOS];
							$re_user   = $result[USER_NAME];
							$re_SERNAME   = $result[SERNAME];
							$re_position  =$result[POSITION ];
							$re_position_user  =$result[POSITION_USER];
							$re_level_user  =$result[LEVEL_USER];
							$re_department  =$result[DEPARTMENT];
							$re_fac  =$result[FAC ];
							$i++;
	 		?>

    <tr align="center" valign="middle" bgcolor="#CCCCCC">
      <td height="20" align="left"><span class="style3"><span class="style1"><font color="#006699">
        &nbsp;
        <?=$re_yos.$re_user.  $re_SERNAME;?>
      </font></span></span></td>
      <td><span class="style3"><span class="style1"><font color="#006699">
        <?=$re_position_user;?>
      </font></span></span></td>
      <td><span class="style3"><span class="style1"><font color="#006699">
        <?=$re_level_user;?>
      </font></span></span></td>
      <td><span class="style1"><a  onClick="return Conf(this)" href="../it/index2.php?data=deleteuser&username=<?=$username;?>&data1=<?=$re_user;?>&data2=<?=$re_SERNAME;?>&pwd=<?=$pwd;?>"><img src="images/icon2/ico548.gif" width="14" height="12" border="0"></a></span></td>
    </tr>
    <?
				  			}
	 			mysql_close();
		?>
  </table>
</form>
</body>
</html>
