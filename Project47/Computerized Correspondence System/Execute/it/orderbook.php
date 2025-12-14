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
</head>

<body bgcolor="#CCCCCC">
<table width="100%" border="1" bgcolor="#0099CC">
			<?
				include "datethai.php";
					$now_date=$data_date;
			?>
  <tr>
    <td align="left" valign="top"><form  method="post" action="/htdocs/test.php?data_date=<?=$data_date;?>">
        <table width="100%" border="0" align="center" cellspacing="0">
          <tr align="center" bgcolor="#FFFFFF"> 
            <td colspan="2"> 
              <?
					echo "$data_date";
			?>
            </td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td align="center">ประเภทหนังสือ</td>
            <td align="left"> หนังสือสั่งการ 
              <select name="type_book" id="type_book" >
                <option value="external_book" selected>หนังสือภายนอก</option>
                <option value="internal_book">หนังสือภายใน</option>
                <option value="tab_book">หนังสือประทับตรา</option>
                <option value="order_book">หนังสือสั่งการ</option>
                <option value="infromation_book">หนังสือประชาสัมพันธ์</option>
                <option value="acc_book">หนังสือรับรอง</option>
              </select></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>เรื่อง</td>
            <td align="left"><input name="data4" type="text" id="data4" size="70"></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>เรียน</td>
            <td align="left"><input name="data5" type="text" id="data5" size="70"></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>สิ่งที่ส่งมาด้วย</td>
            <td align="left"><input name="data6" type="text" id="data6" size="60">
              *ถ้าไม่มีไม่ต้องใส่ข้อมูล</td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>ข้อความ<br>
              วรรคแรก</td>
            <td valign="top"><textarea name="data7" cols="100" rows="7" wrap="VIRTUAL" id="textarea"><?=$username;?></textarea></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>ข้อความ<br>
              วรรคสอง</td>
            <td valign="top"><textarea name="data11" cols="100" rows="7" wrap="VIRTUAL" ></textarea></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>ข้อความ<br>
              วรรคสาม</td>
            <td valign="top"><textarea name="data8" cols="100" rows="7" wrap="VIRTUAL" id="textarea4"></textarea></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>คำลงท้าย</td>
            <td align="left"><select name="menu1" >
                <option value="ขอแสดงความนับถือ">ขอแสดงความนับถือ</option>
                <option value="ขอแสดงความนับถือ อย่างสูง">ขอแสดงความนับถือ อย่างสูง</option>
              </select></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td>ผู้ออกหนังสือ</td>
            <td align="left"> <input name="menu2" type="text" id="menu2" value="(<?=$username;?>)" size="30"></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF">
            <td height="26">ตำแหน่ง</td>
            <td align="left" valign="top"><input name="menu4" type="text" id="menu4" value="<? if($username='หัวหน้าภาค')	$username='หัวหน้าภาควิชาวิศวกรรมคอมพิวเตอร์'	;
			echo "$username";	
			?>" size="70"></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td height="26">ส่วนราชการเจ้าของเรื่อง</td>
            <td align="left"><select name="menu3" size="0" id="menu3">
                <option value="ภาควิชาวิศวกรรมคอมพิวเตอร์                         โทร.02-7392400-02                                           โทรสาร. 02-7392404">ภาควิชาวิศวกรรมคอมพิวเตอร์ 
                </option>
              </select> </td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td colspan="2"><input type="submit" name="Submit" value="Submit"></td>
          </tr>
          <tr align="center" bgcolor="#FFFFFF"> 
            <td colspan="2">&nbsp; </td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
</body>
</html>
