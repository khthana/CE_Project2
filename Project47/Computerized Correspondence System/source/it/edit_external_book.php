<html>
<head>
<title>create pdf </title>
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
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>

<table width="100%" border="0" cellpadding="5" cellspacing="1">
  <?php
				require("config.php");
				$tbname = "externalbook";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select  * from externalbook,users where ((externalbook.ID_BOOK='$idbook') AND (externalbook.USER_NAME=users.USER_NAME) AND (users.USER_NAME='$yourname'))";
				$dbquery = mysql_db_query($dbname,$sql);
				//หาจำนวลเรกคอร์ดข้อมูลในตาราง
				$num_rows = mysql_num_rows($dbquery);
				//หาจำนวลฟิลด์ในตาราง
	 			$num_fields= mysql_num_fields($dbquery);
		 				$result = mysql_fetch_array($dbquery);
							$re_topic=$result[E_TOPIC];
							$re_to=$result[E_TO];
							$re_and=$result[E_AND];
							$re_data1=$result[E_DATA1];
							$re_data2=$result[E_DATA2];
							$re_data3=$result[E_DATA3];
							$re_yos=$result[YOS];
							$re_username=$result[USER_NAME];
							$re_sername=$result[SERNAME];
							$re_position=$result[POSITION];
							//$re_r_to  =$result[];
	 			mysql_close();
				if($re_position=='user')
						$re_position='อาจารย์';
	 		?>
			<?
				include "datethai.php";
					$now_date=$data_date;
			?>
  <tr>
    <td align="left" valign="top"><form  method="post" action="index2.php?data=editexternalbook&username=<?=$username;?>&pwd=<?=$pwd;?>&idbook=<?=$re_id_book;?>">
        <table width="100%" border="0" align="center" cellspacing="0">
		<input type="hidden" value="<?=$re_username;?>" name="yourname">
          <tr align="left" bgcolor="#990000"> 
            <td colspan="2"><font size="2">&nbsp;<br>
              &nbsp;<img src="images/icon2/ico617.gif" width="16" height="15" border="0"></font><span class="style5">&nbsp;&nbsp;ระบบแก้ใขหนังสือภายนอก</span></td>
          </tr>
          <tr align="center"> 
            <td colspan="2" align="center" bgcolor="cccccc">&nbsp;</td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td align="center" class="style4">ประเภทหนังสือ</td>
            <td align="left" class="style4">หนังสือภายนอก</td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td class="style4">เรื่อง</td>
            <td align="left"><input name="data4" type="text" id="data4" value="<?=$re_topic;?>" size="40"></td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td class="style4">เรียน</td>
            <td align="left"><input name="data5" type="text" id="data5" value="<?=$re_to;?>" size="40"></td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td class="style4">สิ่งที่ส่งมาด้วย</td>
            <td align="left"><input name="data6" type="text" id="data6" value="<?=$re_and;?>" size="40">
              <span class="style4">*ถ้าไม่มีไม่ต้องใส่ข้อมูล</span> 
              <input type="hidden" name="idbook" value="<?=$idbook;?>"></td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td align="right" valign="top" class="style4">อรัมพบท</td>
            <td align="left" valign="top"><textarea name="data7" cols="60" rows="7" wrap="VIRTUAL" id="textarea"><?=$re_data1;?></textarea></td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td align="right" valign="top" class="style4">วัตถุประส่งค์/<br>
              รายละเอียด </td>
            <td align="left" valign="top"><textarea name="data11" cols="60" rows="7" wrap="VIRTUAL" ><?=$re_data2;?></textarea></td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td align="right" valign="top" class="style4">ขอให้ดำเนินการ</td>
            <td align="left" valign="top"><textarea name="data8" cols="60" rows="7" wrap="VIRTUAL" id="textarea4"><?=$re_data3;?></textarea></td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td align="right" valign="top" class="style4">คำลงท้าย</td>
            <td align="left"><select name="menu1" >
                <option value="ขอแสดงความนับถือ">ขอแสดงความนับถือ</option>
                <option value="ขอแสดงความนับถือ อย่างสูง">ขอแสดงความนับถือ อย่างสูง</option>
              </select></td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td colspan="2"><input type="submit" name="Submit" value="แก้ใข"></td>
          </tr>
          <tr align="center" bgcolor="eeeeee"> 
            <td colspan="2">&nbsp; </td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>
