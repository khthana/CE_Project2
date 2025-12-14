<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>

<table width="96%" border="0" align="center" cellspacing="2">
  <tr> 
    <td height="16" bgcolor="#FFCC00"><div align="center"><font size="2"><strong>คำนวณอัตราค่าขนส่ง</strong></font></div></td>
  </tr>
  <tr> 
    <td height="183" valign="top"><form name="form1" method="post" action="?file=alltool.php&file2=caltrans.php">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td height="20" colspan="3" valign="top" bgcolor="#CC3333">&nbsp;</td>
          </tr>
          <tr> 
            <td height="20" colspan="3" valign="top">&nbsp;</td>
          </tr>
          <tr> 
            <td width="11%" height="40" valign="top">&nbsp;</td>
            <td width="21%"><strong><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">ต้นทาง 
              :</font></strong></td>
            <td width="68%"> <font color="#000000" size="2"><strong><font face="MS Sans Serif, Tahoma, sans-serif"> 
              <select name="send">
                <option selected value="0">------- เลือก ------</option>
                <?
			   include "connect.php";
			   $sql="select * from station order by id_station ASC";
			   $result=mysql_db_query($dbname,$sql);
			   while($object=mysql_fetch_object($result))
			   {
			   ?>
                <option value="<? print"$object->sta_province";?>"><? print"$object->sta_province";?></option>
                <?
				}
				?>
              </select>
              &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;ปลายทาง :</font> <font face="MS Sans Serif, Tahoma, sans-serif"> 
              <select name="resive">
                <option selected value="0">------- เลือก ------</option>
                <?
			   $sql="select * from station order by id_station DESC";
			   $result=mysql_db_query($dbname,$sql);
			   while($object=mysql_fetch_object($result))
			   {
			   ?>
                <option value="<? print"$object->sta_province";?>"><? print"$object->sta_province";?></option>
                <?
				}
				?>
              </select>
              </font></strong></font></td>
          </tr>
          <tr> 
            <td height="37">&nbsp;</td>
            <td><strong><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">ประเภทสินค้า 
              :</font></strong></td>
            <td> <strong><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
              <select name="ratetype">
                <option selected value="0" >------ เลือก ------</option>
                <?
					$sql="select * from packtype order by packid ASC";
					$result=mysql_db_query($dbname,$sql);
					while($object=mysql_fetch_object($result))
					{				
				?>
                <option value="<? print"$object->packid"; ?>"><? print"$object->packtype";?></option>
                <?
				}
				?>
              </select>
              </font></strong></td>
          </tr>
          <tr> 
            <td height="40">&nbsp;</td>
            <td><strong><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif">น้ำหนักรวม 
              : </font></strong></td>
            <td> <strong><font color="#000000" size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
              <input name="kilogram" type="text" size="6"  onKeyPress='checknumber();'>
              กิโลกรัม</font> </strong></td>
          </tr>
          <tr> 
            <td>&nbsp;</td>
            <td><font size="2">&nbsp;</font></td>
            <td><p><font size="2"><strong><font face="MS Sans Serif, Tahoma, sans-serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                <input type="submit" name="Submit" value="คำนวณค่าขนส่ง">
                </font></strong></font></p><input type="hidden" name="flag" value="1"></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr> 
  <? if($flag=="1")  {
 if($send=="0" or $resive=="0" or $ratetype=="0" or $kilogram =="0")
 {
   	print("
  <td align=center>
  	<font color=\"#FF0000\" size=\"2\"><strong>ท่านกรอกข้อมูลไม่ถูกต้อง !</strong></font>
</td>");
}else{
  if($send==$resive)
  {
  	print("
  <td align=center>
  	<font color=\"#FF0000\" size=\"2\"><strong>ทางเราไม่รับส่งสินค้าภายในจังหวัดครับ !</strong></font>
</td>");
}else{
$sql="select place_rate from place where send_place='$send' and res_place='$resive'";
$result=mysql_db_query($dbname,$sql);
$object=mysql_fetch_object($result);
$rate=$object->place_rate;
//print"$ratetype";
$sql="select packtype from packtype where packid='$ratetype'";
  $result=mysql_db_query($dbname,$sql);
  $object=mysql_fetch_object($result);
  $typerate=$object->packtype;
if($kilogram>20){
$total=(($kilogram-20)*($ratetype))+$rate;
  }else{
  $total=$rate;
  }
  
  ?>
  
    <td height="22"><div align="center"><strong>ต้นทาง :</strong> <? print"$send";?> 
        <strong>ปลายทาง :</strong> <? print"$resive";?></div></td>
  </tr>
  <tr> 
    <td height="22"><div align="center"> <strong>ประเภทสินค้า :</strong> <? print"$typerate";?> 
        <strong>น้ำหนัก :</strong> <? print"$kilogram"; ?> </div></td>
  </tr>
  <tr>
    <td height="22"><div align="center"><strong>ราค่าขนส่ง : <? print"<font color=red>$total</font>";?> 
        บาท</strong></div></td>
		<?
		}
		} 
		}
		?>
  </tr>
</table>
</body>
</html>
