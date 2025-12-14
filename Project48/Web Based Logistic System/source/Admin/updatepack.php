<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>
<?
include"connect.inc.php";
$sql="select  * from  packtype where packid=$packid";
$result=mysql_db_query($dbname,$sql);
$object=mysql_fetch_object($result);
?>
<body>
<br>
<table width="75%" border="0" align="center">
  <tr> 
    <td height="76"><form name="form1" method="post" action="?file=updatepacktable.php">
        <table width="100%" border="0" cellspacing="1">
          <tr bgcolor="#CC0033"> 
            <td height="21" colspan="3"><font color="#FFFFFF">&nbsp;<strong>แก้ไขค่าบริการแบ่งตามชนิดสินค้า</strong></font></td>
          </tr>
          <tr bgcolor="#FF9933"> 
            <td height="21"><div align="center"><strong>ชนิดสินค้า</strong></div></td>
            <td><div align="center"><strong>อัตราราคา</strong></div></td>
            <td width="34%"><div align="center"><strong>การจัดการ</strong></div></td>
          </tr>
          <tr bgcolor="#FFFFFF"> 
            <td width="27%" height="22"  align="center"> 
              <?=$object->packtype?>
              <input type="hidden" name="packid" value="<?=$object->packid?>"> 
            <td width="39%" align="center"><input name="packrate" type="text" id="packrate3" size="5" value="<?=$object->packrate?>"> 
            </td>
            <td><div align="center"> 
                <input type="submit" name="Submit" value="อัพเดท">
              </div></td>
          </tr>
        </table>
      </form></td>
  </tr>
  <tr> 
    <td height="22" align="center"><img src="images/img/readymade2.gif" width="32" height="32" align="absmiddle"> <strong><a href="?file=packdata.php"> หน้าหลัก</a></strong></td>
  </tr>
</table>
</body>
</html>
