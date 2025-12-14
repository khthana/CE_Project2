<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
include "connect.inc.php";
$sql="select u.id_user,u.name, u.sername, s.sta_province, t.name_type,t.id_type  from user u, typeofuser t, station s where u.id_type=t.id_type and u.id_station=s.id_station and u.id_user='$id'";
$result=mysql_db_query($dbname,$sql);
$object=mysql_fetch_object($result);
$id=$object->id_user;
$id2=$id;
//print"$object->sta_province";

?>
<br>
<table width="90%" height="70" border="0" align="center" cellpadding="0">
  <tr> 
    <td height="44" valign="top"> <form name="form1" method="post" action="?file=updateusertable.php">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr bgcolor="#CC0033"> 
            <td height="20" colspan="6"><div align="center"><font color="#FFFFFF"><strong>แก้ไขข้อมูลพนักงาน</strong></font></div></td>
          </tr>
          <tr bgcolor="#FF9933"> 
            <td width="16%" height="20"><div align="center"><font color="#000000"><strong>รหัสพนักงาน</strong></font></div></td>
            <td width="19%"><div align="center"><font color="#000000"><strong>ชื่อ</strong></font></div></td>
            <td width="18%"><div align="center"><font color="#000000"><strong>นามสกุล</strong></font></div></td>
            <td width="18%"><div align="center"><font color="#000000"><strong>ตำแหน่ง</strong></font></div></td>
            <td width="20%"><div align="center"><font color="#000000"><strong>สถานที่ปฏิบัติงาน</strong></font></div></td>
            <td width="9%"><div align="center"><font color="#000000"><strong>การจัดการ</strong></font></div></td>
          </tr>
          <tr> 
            <td  align="center"><input   name="usid" type="text" value="<?=$id?>" size="10"><input type="hidden" value="<?=$id2?>" name="id2"> 
            </td>
            <td align="center"><input name="name" type="text" id="name" value="<?=$object->name?>" size="10"></td>
            <td align="center"><input name="sername" type="text" id="sername" value="<?=$object->sername?>" size="10"> 
            </td>
            <td align="center"> 
              <? 
				print"<select name=\"position\">";
				$sql3="select * from typeofuser where id_type<>1  ";
				$result2=mysql_db_query($dbname,$sql3);
				while($object3=mysql_fetch_object($result2)){
                  if($object3->id_type==$object->id_type){
				  print"<option value=\"$object3->id_type\" selected>$object3->name_type</option>";
				  }else{
				  print"<option value=\"$object3->id_type\" >$object3->name_type</option>";	  
				  }
				  }
               print" </select>";
              ?>
            </td>
            <td><div align="center"> 
                <? 
				print"<select name=\"place\">";
				$sql2="select * from station ";
				$result1=mysql_db_query($dbname,$sql2);
				while($object2=mysql_fetch_object($result1)){
                  if($object2->sta_province==$object->sta_province){
				  print"<option value=\"$object2->id_station\" selected>$object2->sta_province</option>";
				  }else{
				  print"<option value=\"$object2->id_station\" >$object2->sta_province</option>";	  
				  }
				  }
               print" </select>";
              ?>
              </div></td>
            <td align="center"><input type="submit" name="Submit" value="อัพเดท"> 
            </td>
          <tr>
            <td  align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center">&nbsp;</td>
        </table>
      </form></td>
  </tr>
  <tr> 
    <td height="20" valign="top"><div align="center"><img src="images/img/readymade2.gif" width="32" height="32" align="absmiddle"><a href="admin.php?file=userdata.php"><strong>หน้าหลัก</strong></a></div></td>
  </tr>
</table>
</body>
</html>
