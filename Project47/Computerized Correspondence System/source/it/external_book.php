<html>
<head>
<title>create pdf </title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>

<body >
<table width="102%" border="0">
   <?php
				require("config.php");
				//$tbname = "book";
				mysql_connect("$hostname","$user","$password") or die ("can't connect data base server");//ติดต่อ data base
				mysql_select_db("$dbname")or die("can't conected database");//เลือกฐานข้อมูล
				//คำสั่ง SQL และสั่งให้ทำงาน
				$sql = "select  * from users where USER_NAME='$username'";
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
							$re_yos=$result[YOS];
							$re_username   = $result[USER_NAME];
							$re_sername  =$result[SERNAME];
							$re_position=$result[POSITION];
							//$re_r_to  =$result[];
							$i++;
				}
				
	 			mysql_close();
	 		?>
			<?
				include "datethai.php";
					$now_date=$data_date;
			?>
			<?
				switch($re_position)
				{
					case 'user':{
						$re_position='อาจารย์';
					}break;
					case 'secretary':{
						$re_position='หัวหน้าภาควิชาวิศวกรรมคอมพิวเตอร์';
						$re_yos='ดร.';
						$re_username   = 'วัชระ';
						$re_sername  ='ฉัตรวิริยะ';
					}break;
				}
		?>
  <tr>
    <td height="686" align="left" valign="top"><form action="/it/form_request.php?data_date=<?=$data_date;?>&username=<?=$re_username;?>"  method="post" target="_blank">
	<input type="hidden" name="type_book" value="หนังสือภายนอก">
        <table width="100%" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="eeeeee">
          <tr align="left" bgcolor="#990000"> 
            <td height="38" colspan="3"> 
&nbsp;<img src="images/icon2/ico549.gif" width="16" height="16">&nbsp;<span class="style8"><strong>ระบบหนังสือภายนอก</strong></span></td>
          </tr>
          <tr align="center" class="style4"> 
            <td width="24%" align="right" valign="top">ประเภทหนังสือ&nbsp;</td>
            <td colspan="2" align="left">หนังสือภายนอก</td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">เรื่อง&nbsp;</td>
            <td colspan="2" align="left"><input name="data4" type="text" id="data4" size="40"></td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">เรียน&nbsp;</td>
            <td colspan="2" align="left"><input name="data5" type="text" id="data5" size="40"></td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">สิ่งที่ส่งมาด้วย&nbsp;</td>
            <td colspan="2" align="left"><input name="data6" type="text" id="data6" size="40">
              *ถ้าไม่มีไม่ต้องใส่ข้อมูล</td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">อรัมพบท&nbsp;</td>
            <td colspan="2" align="left" valign="top"><textarea name="data7" cols="60" rows="7" wrap="VIRTUAL" id="textarea"></textarea></td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">วัตถุประส่งค์/รายละเอียด&nbsp; </td>
            <td colspan="2" align="left" valign="top"><textarea name="data11" cols="60" rows="7" wrap="VIRTUAL" ></textarea></td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">ขอให้ดำเนินการ&nbsp;</td>
            <td colspan="2" align="left" valign="top"><textarea name="data8" cols="60" rows="7" wrap="VIRTUAL" id="textarea4"></textarea></td>
          </tr>
          <tr align="center" class="style4"> 
            <td align="right" valign="top">คำลงท้าย&nbsp;</td>
            <td colspan="2" align="left"><select name="menu1" >
                <option value="ขอแสดงความนับถือ">ขอแสดงความนับถือ</option>
                <option value="ขอแสดงความนับถือ อย่างสูง">ขอแสดงความนับถือ อย่างสูง</option>
              </select>
              <input name="re_name1" type="hidden" id="re_name1" value="<?=$re_username;?>">
            </td>
          </tr>
          <tr align="center"> 
            <td height="27">&nbsp;</td>
            <td width="35%" height="27" align="left"><input type="submit" name="Submit" value="preview">
              <font color="#FF0000">&nbsp;</font></td>
            <td width="41%" align="left"><input type="submit" name="Submit" value="ขอเลขที่หนังสือ"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>
