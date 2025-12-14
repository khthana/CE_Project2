<?php require_once('../Connections/conn.php'); 
		   mysql_select_db($database_conn, $conn);
?>
<?php if(isset($HTTP_POST_VARS['Submit'])&&($HTTP_POST_VARS['Submit']=="แก้ไข"))
{
		$sql="update config set money_require=$money_require,register_value=$register_value,fee=$fee where config_ID=1";
		mysql_query($sql,$conn);
		echo "<meta http-equiv='refresh' content='0; URL=registerlists.php'>";
}
?>
<?php
$query_config = "SELECT * FROM config";
$config = mysql_query($query_config, $conn) or die(mysql_error());
$row_config = mysql_fetch_assoc($config);
$totalRows_config = mysql_num_rows($config);
?>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<title>Register Config</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style1 {
	color: #FF6633;
	font-size: 24px;
	font-weight: bold;
}
-->
</style></head>

<body>

<table width="860" border="0" cellpadding="2" cellspacing="0">
  <tr>
    <td width="56">&nbsp;</td>
    <td width="452">&nbsp;</td>
    <td width="340">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><div align="center" class="style1">แก้ไขข้อมูลเกี่ยวกับการลงทะเบียน</div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2" rowspan="2"><form name="form1" method="post" action="">
      <table border="0" cellspacing="0" cellpadding="2">
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td width="311">การลงทะเบียนคอร์สจะสมบูรณ์ต่อเมื่อมีการจ่ายเงิน</td>
          <td width="477"><input <?php if (!(strcmp($row_config['money_require'],"1"))) {echo "CHECKED";} ?> name="money_require" type="radio" value="1">
            Yes
              <input <?php if (!(strcmp($row_config['money_require'],"0"))) {echo "CHECKED";} ?> name="money_require" type="radio" value="0">
              No</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        
        <tr>
          <td>อัตราค่าลงทะเบียนหน่วยกิตละ</td>
          <td><input name="register_value" type="text" id="register_value" value="<?php echo $row_config['register_value']; ?>" size="10">
            บาท</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>อัตราค่าธรรมเนียมการเปลี่ยนวิชา วิชาละ </td>
          <td><input name="fee" type="text" id="fee" value="<?php echo $row_config['fee']; ?>" size="10"> 
            บาท </td>
        </tr>
        <tr>
          <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
          <td><div align="center">
          </div></td>
          <td><input type="submit" name="Submit" value="แก้ไข"></td>
        </tr>
        <tr>
          <td>&nbsp;            </td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td colspan="2"><div align="center"><a href="registerlists.php">กลับไปหน้าแสดงการลงทะเบียน</a> &nbsp;&nbsp;&nbsp;<a href="admin_index.php">กลับไปหน้าเมนูผู้ดูแลระบบ</a>&nbsp;&nbsp;&nbsp;<a href="../index.php">กลับไปหน้า home page</a></div></td>
          </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
    </form></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
<?php
mysql_free_result($config);
?>
