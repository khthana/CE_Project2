<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<br>
<table width="85%" height="101" border="0" align="center" cellpadding="0">
  <tr> 
    <td height="63" valign="top"> <form name="form1" method="post" action="">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
          <tr bgcolor="#CC0033"> 
            <td height="20" colspan="6"><font color="#FFFFFF"><strong>เพิ่มข้อมูลพนักงาน</strong></font></td>
          </tr>
          <tr bgcolor="#FF9900"> 
            <td width="12%" height="20"><div align="center"><font color="#000000"><strong>รหัสพนักงาน</strong></font></div></td>
            <td width="16%"><div align="center"><font color="#000000"><strong>ชื่อ</strong></font></div></td>
            <td width="15%"><div align="center"><font color="#000000"><strong>นามสกุล</strong></font></div></td>
            <td width="16%"><div align="center"><font color="#000000"><strong><strong>ตำแหน่ง</strong></strong></font></div></td>
            <td width="19%"><div align="center"><font color="#000000"><strong>สถานที่ปฏิบัติงาน</strong></font></div></td>
            <td width="22%" align="center"><strong><font color="#000000">การจัดการ</font></strong></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td height="20" align="center"><input name="cusid" type="text" size="10"> 
            </td>
            <td align="center"><input name="name" type="text" size="10"> </td>
            <td align="center"><input name="sername" type="text" size="10"> </td>
            <td><div align="center"> 
                <? 
				include "connect.inc.php";
				print"<select name=\"position\">";
				 print"<option value=\"0\" selected> ------ เลือก ------ </option>";
				$sql="select * from typeofuser where id_type<>1  ";
				$result=mysql_db_query($dbname,$sql);
				while($object=mysql_fetch_object($result)){
				  print"<option value=\"$object->id_type\" >$object->name_type</option>";	 
				  }
               print" </select>";
              ?>
              </div></td>
            <td align="center"> 
              <? 
				print"<select name=\"place\">";
				print"<option value=\"0\" selected>------ เลือก -------</option>";
				$sql2="select * from station order by  id_station";
				$result1=mysql_db_query($dbname,$sql2);
				while($object2=mysql_fetch_object($result1)){
				  print"<option value=\"$object2->id_station\" >$object2->sta_province</option>";	  
				  }
               print" </select>";
              ?>
            </td>
            <td align="center"><input type="submit" name="Submit" value="เพิ่มข้อมูล"></td>
          <tr bgcolor="#FFFFFF"> 
            <td height="20" align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td>&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
        </table>
      </form></td>
  </tr>
  <tr>
    <td height="32" valign="top"><div align="center"><img src="images/img/readymade2.gif" align="absmiddle"><a href="?file=userdata.php"><strong>หน้าหลัก</strong></a></div></td>
  </tr>
</table>
</body>
</html>
