<html>
<head>
<title>แก้ใขเบียนหนังสือรับ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select * from externalbook where ID_BOOK='$idbook'";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
				$result = mysql_fetch_array($dbquery);
				$re_DATE  =$result[E_DATE ];
				$re_month  =$result[E_MONTH];
				$re_year  =$result[E_YEAR];
				$re_TOPIC   =$result[E_TOPIC  ];
				$re_TO   =$result[E_TO  ];
				$re_SENDER   =$result[USER_NAME];
				$re_KEYS=$result[KEYS];
		 	?>
<form action="index2.php?data=save22&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$idbook;?>" method="post" enctype="multipart/form-data" name="form1"  >
  <table width="100%" border="0" cellpadding="0" cellspacing="2">
    <tr bgcolor="#CCCCCC"> 
      <td colspan="4" align="center"><font color="#006699">แก้ใขข้อมูลทะเบียนหนังสือส่ง</font></td>
    </tr>
    <tr bgcolor="#CCCCCC"> 
      <td colspan="4" align="center"><font color="#006699">ข้อมูลหนังสือ</font></td>
    </tr>
    <tr> 
      <td><p>วัน</p></td>
      <td colspan="3"><p> 
          <input name="date_book"  type="text" id="date_book" value="<? echo "$re_DATE";?>"  >
        </p></td>
    </tr>
    <tr> 
      <td height="26">เดือน</td>
      <td colspan="3"><input name="month" type="text" id="month" value="<? echo "$re_month ";?>"></td>
    </tr>
    <tr> 
      <td height="26">ปี</td>
      <td colspan="3"><input name="year" type="text" id="year" value="<? echo "$re_year";?>"></td>
    </tr>
    <tr> 
      <td height="26"><p>เรื่อง</p></td>
      <td colspan="3"><p> 
          <input name="ttopic"  type="text" id="ttopic" value="<?=$re_TOPIC;?>" >
        </p></td>
    </tr>
    <tr> 
      <td><p>เรียน</p></td>
      <td colspan="3"><p> 
          <input name="too"  type="text" id="too" value="<?=$re_TO;?>" >
        </p></td>
    </tr>
    <tr> 
      <td align="left" valign="top">ผู้ส่ง</td>
      <td colspan="3"><input name="sender" type="text" id="sender" value="<?=$re_SENDER;?>"></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td colspan="3"><p>Attach<br>
          <input  type="file" name="files">
        </p></td>
    </tr>
    <tr align="center" bgcolor="#CCCCCC"> 
      <td colspan="4"><font color="#006699">คำสำคัญสำหรับค้นหา(Keywords)</font></td>
    </tr>
    <tr> 
      <td align="right">คำสำคัญ</td>
      <td colspan="3"><input name="keys" type="text" id="keys" value="<?=$re_KEYS;?>"></td>
    </tr>
    <tr> 
      <td>&nbsp;</td>
      <td colspan="3"><blockquote> 
          <blockquote> 
            <p> 
              <input type="submit" name="Submit" value="Submit">
            </p>
          </blockquote>
        </blockquote></td>
    </tr>
  </table>
</form>
</body>
</html>
