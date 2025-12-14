<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Register Confirm</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
a:link {
	color: #0000FF;
}
a:visited {
	color: #0000FF;
}
a:active {
	color: #0000FF;
}
-->
</style>
</head>

<body>
<table width="860" border="0">
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="222">&nbsp;</td>
    <td width="628"><table border="1" cellspacing="0" bordercolor="#FF0099">
      <tr>
        <td colspan="3" bgcolor="ff9999"><div align="center"><strong>สรุปค่าใช้จ่าย</strong></div></td>
      </tr>
      <tr>
        <td bgcolor="#FF9999">รวมคอร์สวิชา</td>
        <td><div align="center"><?php echo $counter; ?></div></td>
        <td bgcolor="#FF9999">คอร์ส</td>
      </tr>
      <tr>
        <td bgcolor="#FF9999">รวมหน่วยกิต</td>
        <td width="163"><div align="center"><?php echo $subject_point; ?></div></td>
        <td width="77" bgcolor="#FF9999">หน่วย</td>
      </tr>
      <tr>
        <td bgcolor="#FF9999">หน่วยกิตละ</td>
        <td><div align="center"><?php echo $register_value;?></div></td>
        <td bgcolor="#FF9999">บาท</td>
      </tr>
      <tr>
        <td bgcolor="#FF9999">รวมเป็นเงินทั้งสิ้น</td>
        <td><div align="center"><font color="ff3399"><?php echo $subject_point*$register_value;?></font></div></td>
        <td bgcolor="#FF9999">บาท</td>
      </tr>
      <tr>
        <td colspan="3" bgcolor="#FF9999"><form name="form1" method="post" action="register.php">
            <div align="center">
              <input type="submit" name="Submit" value="ยืนยันการลงทะเบียนเรียน">
            </div>
            <input name="same" type="hidden" id="same" value="<?php echo $same; ?>">
        </form></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><?php if($same){echo"<font color='FF0000'>คำเตือน มีวิชาที่เลือกไว้ซ้ำกัน</font>";}?></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><strong>การชำระเงิน :</strong> <br>
      1. ชำระเงินด้วยตนเองที่สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง <br>
      โดยชำระเงินที่สำนักทะเบียนภาควิชาวิศวกรรมคอมพิวเตอร์ <br>
      2. โอนเงินเข้าบัญชีของสถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง <br>
      ธนาคาร กสิกรไทย จำกัด &nbsp;สาขาใดก็ได้ <br>
      ประเภท บัญชีออมทรัพย์<br>
      เลขที่บัญชี xxx-x-xxxxx-x </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><a href="../Download/dap71.exe">Download ใบชำระเงินค่าลงทะเบียนเรียนธนาคารกรุงไทย</a></td>
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
    <td>&nbsp;</td>
    <td><div align="left"><a href="register_show.php">&gt;&gt;กลับไปยังหน้าวิชาที่เลือกไว้</a></div></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</body>
</html>
