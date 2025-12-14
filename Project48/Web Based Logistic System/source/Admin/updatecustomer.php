<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<?
include "connect.inc.php";
$sql="select * from customers where cusid='$cusid'";
$result=mysql_db_query($dbname,$sql);
$object=mysql_fetch_object($result);


?>
<br>
<table width="80%" border="0" align="center">
  <tr> 
    <td height="240" valign="top"> <form name="form1" method="post" action="?file=updatecustable.php">
        <table width="100%" border="0" bgcolor="#FFFFFF">
          <tr bgcolor="#CC3300"> 
            <td colspan="4"><div align="center"><font color="#FFFFFF"><strong>ข้อมูลสมาชิก</strong></font></div></td>
          </tr>
          <tr> 
            <td width="19%" height="24"><strong>รหัสสมาชิก : </strong></td>
            <td width="24%"><input type="text" name="id" value="<? print"$object->cusid";?>"></td>
            <td width="14%">&nbsp;</td>
            <td width="43%">&nbsp;</td>
          </tr>
          <tr> 
            <td><strong>บริษัท:</strong></td>
            <td colspan="3"><input name="busname" type="text" value="<? print"$object->busname"; ?>" size="30" ></td>
          </tr>
          <tr> 
            <td><strong>ชื่อ :</strong></td>
            <td><strong> 
              <input name="name" type="text" id="name" value="<? print"$object->name";?>">
              </strong></td>
            <td><strong>นามสกุล :</strong></td>
            <td><strong> 
              <input name="sername" type="text" id="sername" value="<? print"$object->lname";?>">
              </strong></td>
          </tr>
          <tr> 
            <td height="26"><strong>เลขที่ :</strong></td>
            <td><strong> 
              <input name="att" type="text" id="att" value="<? print"$object->att";?>" size="6" maxlength="6">
              </strong></td>
            <td><strong>หมู่ที่ :</strong></td>
            <td><strong> 
              <input name="moo" type="text" id="road" value="<? print"$object->moo";?>" size="6" maxlength="6">
              </strong></td>
          </tr>
          <tr> 
            <td><strong>ตำบล/แขวง :</strong></td>
            <td><strong> 
              <input name="district" type="text" id="district" value="<? print"$object->district";?>">
              </strong></td>
            <td><strong>อำเภอ/เขต :</strong></td>
            <td><strong> 
              <input name="amphur" type="text" id="amphur" value="<? print"$object->amphur";?>">
              </strong></td>
          </tr>
          <tr> 
            <td><strong>จังหวัด :</strong></td>
            <td> <strong> 
</strong>
  <? 
				print"<select name=\"province\">";
				print"<option value=\"0\" selected>------ เลือก -------</option>";
				$sql2="select * from station order by  id_station";
				$result1=mysql_db_query($dbname,$sql2);
				while($object2=mysql_fetch_object($result1)){
				if('$object->province'=='$object2->sta_province')
				{
				print"<option value=\"$object2->sta_province\" selected>$object->province</option>";
				}else{
				  print"<option value=\"$object2->sta_province\" >$object2->sta_province</option>";	  
				  }
				  }
               print" </select>";
              ?>
</td>
            <td><strong>รหัสไปรณีย์:</strong></td>
            <td><strong> 
              <input name="zipcode" type="text" id="zipcode" value="<? print"$object->zipcode";?>">
              </strong></td>
          </tr>
          <tr>
            <td height="24"><strong>โทรศัพท์ :</strong></td>
            <td><strong>
              <input name="telephone" type="text" id="telephone2" value="<? print"$object->telephone";?>">
            </strong></td>
            <td><strong>มือถือ:</strong></td>
            <td><strong>
              <input name="mobile" type="text" id="mobile2" value="<? print"$object->mobile";?>">
            </strong></td>
          </tr>
          <tr> 
            <td height="24"><strong>Email Address:</strong> </td>
            <td><strong>
              <input type="text" name="email" value="<? print"$object->email";?>"> 
              </strong></td>
            <td><strong> </strong></td>
            <td><strong> 
              </strong></td>
          </tr>
          <tr>
            <td height="22" colspan="4">&nbsp;</td>
          </tr>
          <tr> 
            <td height="22" colspan="4"><div align="center"> 
                <input type="submit" name="Submit" value="อัพเดทข้อมูล"><input name="id" type="hidden" value="<? print"$cusid";?>">
                &nbsp;&nbsp; </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr>
    <td height="22" valign="top"><div align="center"><img src="images/img/readymade2.gif" width="32" height="32" align="absmiddle"> <a href="?file=customerdata.php"><strong> 
        หน้าหลัก</strong></a></div></td>
  </tr>
</table>
</body>
</html>
