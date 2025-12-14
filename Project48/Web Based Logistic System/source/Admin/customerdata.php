<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>

<body>
<br>
<?
include "connect.inc.php";
$sql="select  * from customers order by cusid DESC";
$result=mysql_db_query($dbname,$sql);
?>
<table width="98%" height="42" border="0" align="center" cellspacing="0" bgcolor="#CC0033">
  <tr>
    <td height="42" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#EFEFEF">
        <tr bgcolor="#CC0033"> 
          <td width="13%" height="20"><div align="center"><strong><font color="#FFFFFF">รหัสสมาชิก</font></strong></div></td>
          <td width="24%"><div align="center"><strong><font color="#FFFFFF">ชื่อ-นามสกุล</font></strong></div></td>
          <td width="34%"><div align="center"><strong><font color="#FFFFFF">ที่อยู่</font></strong></div></td>
          <td width="29%"><div align="center"><strong><font color="#FFFFFF">การจัดการ</font></strong></div></td>
        </tr>
        <? 
		$count_line=1;
		while($object=mysql_fetch_array($result))
{		
		$cusid=$object[cusid];
		$name=$object[name];
		$lname=$object[lname];
		//$address=$object[address];
		$att=$object[att];
		$moo=$object[moo];
		$district=$object[district];
		$amphur=$object[amphur];
		$province=$object[province];
		$zipcode=$object[zipcode];
		$addresscus=$att." ".$moo." ".$district. " ".$amphur." ".$province." ".$zipcode;
		$namecus=$name." ".$lname;
		if ($count_line%2==0){
		print "<tr bgcolor=#F4FFE6>\n";
		}else{
		print"<tr bgcolor=#FFFFCE>\n";
		}
		
		?>
          <td height="20" align="center"> 
            <?=$cusid?></td>
        <td align="center"> 
          <?=$namecus?>
        </td>
        <td> 
          <?=$addresscus?>
        </td>
          <td align="center"><img src="images/img/i_newtopic.gif" width="16" height="16" align="absmiddle"><? print"<a href=\"?file=updatecustomer.php&cusid=$cusid\"><font color=\"#0000FF\">แก้ไขข้อมูล</font></a>"; ?> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/img/icon_err.gif" width="16" height="16" align="absmiddle"> 
            <? print" <a href=\"deletecus.php?cusid=$cusid\" onclick=\"return confirm('ท่านต้องการลบข้อมูลสมาชิกใช่หรือไม่ ?')\"><font color='red'> ลบข้อมูล</font></a>"; ?> 
          </td>
        <?
		print"</tr>";
		$count_line++;
		}
		?>
      </table></td>
  </tr>
</table>
</body>
</html>
