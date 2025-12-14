<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
</head>

<body>
<br>
<?
include "connect.inc.php";
$sql ="select p.id_user, p.name, p.sername, s.sta_province, t.name_type from user p, typeofuser t,station s where p.id_type>1 and p.id_type=t.id_type and p.id_station=s.id_station order by t.id_type";
$result=mysql_db_query($dbname,$sql);
?>
<table width="98%" border="0" align="center">
  <tr>
    <td><table width="100%" height="44" border="0" align="center" cellpadding="0" bgcolor="#CC0033">
        <tr> 
          <td height="40" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
              <tr bgcolor="#CC0033"> 
                <td width="10%" height="20"><div align="center"><strong><font color="#FFFFFF">รหัสพนักงาน</font></strong></div></td>
                <td width="19%"><div align="center"><strong><font color="#FFFFFF">ชื่อ-นามสกุล</font></strong></div></td>
                <td width="15%"><div align="center"><font color="#FFFFFF"><strong>ตำแหน่ง</strong></font></div></td>
                <td width="23%"><div align="center"><strong><font color="#FFFFFF">สถานที่ปฏิบัติงาน</font></strong></div></td>
                <td width="33%"><div align="center"><strong><font color="#FFFFFF">การจัดการ</font></strong></div></td>
              </tr>
              <? 
		$count_line=1;
		while($object=mysql_fetch_array($result))
{		
		$userid=$object[id_user];
		$name=$object[name];
		$lname=$object[sername];
		$position=$object[name_type];
		$address=$object[sta_province];
		$nameuser=$name." ".$lname;
		if ($count_line%2==0){
		print "<tr bgcolor=#FFE7D7>\n";
		}else{
		print"<tr bgcolor=#FFF7D7>\n";
		}
		
		?>
              <td height="20" align="center"> 
                <?=$userid?>
              </td>
              <td align="center"> 
                <?=$nameuser?>
              </td>
              <td align="center"> 
                <?=$position?>
              </td>
              <td align="center"> 
                <?=$address?>
              </td>
                <td align="center"><img src="images/img/i_newtopic.gif" width="16" height="16" align="absmiddle"><? print"<a href=\"?file=updateuser.php&id=$userid\"> 
                 <font color=\"#0000FF\"> แก้ไขข้อมูล</font></a>"; ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/img/icon_err.gif" width="16" height="16" align="absmiddle"> 
                  <? print" <a href=\"deleteuser.php\" onclick=\"return confirm('ท่านต้องการลบข้อมูลพนักงานท่านนี้ใช่หรือไม่ ?')\"><font color='red'> ลบข้อมูล</font></a>"; ?> 
                </td>
              <?
		print"</tr>";
		$count_line++;
		}
		?>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td height="22"><div align="right"><img src="images/img/wwebB.gif" width="16" height="16" align="absbottom"><a href="?file=adduser.php"><strong>เพิ่มข้อมูลพนักงาน 
        </strong></a> </div></td>
  </tr>
</table>
<div align="right"></div>
</body>
</html>
