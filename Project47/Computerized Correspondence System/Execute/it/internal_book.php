<html>
<head>
<title>create pdf</title>
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
</head>

<body>
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
<table width="102%" border="0" align="center" cellpadding="5" cellspacing="0" bgcolor="#eeeeee">
		<form action="form_request.php?username=<?=$username;?>&pwd=<?=$pwd;?>"  method="post" target="_blank">
          <tr align="left" bgcolor="#990000"> 
            <td height="38" colspan="3">&nbsp;<img src="images/icon2/ico584.gif" width="12" height="16">&nbsp;<span class="style8"><strong>ระบบสร้างหนังสือภายใน</strong></span></td>
          </tr>
          <tr align="center"> 
            <td width="25%" align="right" class="style4">ประเภทหนังสือ&nbsp;</td>
            <td colspan="2" align="left" class="style4"><strong>หนังสือภายใน</strong></td>
          </tr>
          <tr align="center"> 
            <td align="right" class="style4">เรื่อง&nbsp;</td>
            <td colspan="2" align="left" class="style4"><input name="data4" type="text" id="data4" size="40"></td>
          </tr>
          <tr align="center"> 
            <td align="right" class="style4">เรียน&nbsp;</td>
            <td colspan="2" align="left" class="style4"><input name="data5" type="text" id="data5" size="40"></td>
          </tr>
          <tr align="center"> 
            <td align="right" class="style4">สิ่งที่ส่งมาด้วย&nbsp;</td>
            <td colspan="2" align="left" class="style4"><input name="data6" type="text" id="data6" size="40">
              *ถ้าไม่มีไม่ต้องใส่ข้อมูล</td>
          </tr>
          <tr align="center"> 
            <td align="right" valign="top" class="style4">อรัมพบท&nbsp;</td>
            <td colspan="2" align="left" valign="top" class="style4"><textarea name="data7" cols="60" rows="7" wrap="VIRTUAL" id="textarea"></textarea></td>
          </tr>
          <tr align="center"> 
            <td align="right" valign="top" class="style4">วัตถุประส่งค์/รายละเอียด&nbsp; </td>
            <td colspan="2" align="left" valign="top" class="style4"><textarea name="data11" cols="60" rows="7" wrap="VIRTUAL" ></textarea></td>
          </tr>
          <tr align="center"> 
            <td align="right" valign="top" class="style4">ขอให้ดำเนินการ&nbsp;</td>
            <td colspan="2" align="left" valign="top" class="style4"><textarea name="data8" cols="60" rows="7" wrap="VIRTUAL" id="textarea4"></textarea></td>
          </tr>
          <tr align="center"> 
            <td align="right" class="style4">ผู้ออกหนังสือ&nbsp;</td>
            <td colspan="2" align="left" class="style4"> <input name="menu2" type="text" id="menu2" value="(<? echo "$re_YOS $re_username $re_sername";?>)" size="40">
        <input name="re_name1" type="hidden" id="re_name1" value="<?=$re_username;?>"></td>
          </tr>
          <tr align="center"> 
            <td height="26" align="right" class="style4">ตำแหน่ง&nbsp;</td>
            <td colspan="2" align="left" valign="top" class="style4"><input name="menu4" type="text" id="menu4" value="<? echo "$re_position";?>" size="40"></td>
          </tr>
          <tr align="center"> 
            <td class="style4">&nbsp;</td>
            
      <td width="31%" align="center" class="style4"><input type="submit" name="preview" value="preview"></td>
            <td width="44%" align="center"><font color="#FF0000"><a href="index2.php?data=form_request&username=<?=$username;?>&pwd=<?=$pwd;?>&data4=<?=$data4;?>&data5=<?=$data5;?>&data6=<?=$data6;?>&data7=<?=$data7;?>&data11=<?=$data11;?>&data8=<?=$data8;?>">
              <input type="submit" name="next" value="ขอเลขทะเบียน" >
            </a></font></td>
          </tr>
		  </form>
</table>

</body>
</html>
