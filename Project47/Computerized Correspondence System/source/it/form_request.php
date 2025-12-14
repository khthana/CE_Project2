<?
if($preview=="preview"){
include("internalbook.php");
}if($Submit=="preview"){
include("externalbook.php");
}else {
?>
<html>
<head>
<title>ลงทะเบียนหนังสือรับ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style9 {
	color: #990000;
	font-weight: bold;
}
-->
</style></head>

<body>
<?
		include  "datethai.php";
		
?>
<form action="index2.php?data=save5&username=<?=$username;?>&pwd=<?=$pwd;?>" method="post" enctype="multipart/form-data" name="form1"  >
  <table width="100%" border="0" cellpadding="5" cellspacing="0">
    <tr align="left" bgcolor="#990000"> 
      <td height="38" colspan="3">&nbsp;<img src="images/icon2/ico472.gif" width="15" height="16" align="absmiddle">&nbsp;<span class="style8"><strong>ขอเลขที่หนังสือ</strong></span></td>
    </tr>
    <tr align="center"> 
      <td colspan="3" bgcolor="#CCCCCC"><span class="style9">วิธีการส่ง</span></td>
    </tr>
    <tr align="center" bgcolor="eeeeee" class="style4"> 
      <td width="9%" align="right" valign="top">วิธีการส่ง&nbsp;</td>
      <td colspan="2" align="left"><input type="radio" name="type_sent" value="สมุดหนังสือส่ง">
        สมุดหนังสือส่ง 
        <input type="radio" name="type_sent" value="ฝากส่งหรือยื่นด้วยตัวเอง">
        ฝากส่ง/ ยื่นด้วยตัวเอง 
        <input type="radio" name="type_sent" value="จดหมาย">
        จดหมาย 
        <input type="radio" name="type_sent" value="fax">
      fax </td>
    </tr>
    <tr bgcolor="eeeeee" class="style4"> 
      <td align="right">แนบไฟล์&nbsp;</td>
      <td colspan="2"><p> 
          <input  type="file" name="files">
      </p></td>
    </tr>
    <tr align="center" bgcolor="eeeeee"> 
      <td colspan="3">
	  		<input name="i_data1" type="hidden" value="<?=$data7;?>">
			<input name="i_data2" type="hidden" value="<?=$data11;?>">
			<input name="i_data3" type="hidden" value="<?=$data8;?>">
			<input name="i_topic" type="hidden" value="<?=$data4;?>">
			<input name="i_to" type="hidden" value="<?=$data5;?>">
			<input name="i_and" type="hidden" value="<?=$data6;?>">
        <input name="type_book" type="hidden" id="type_book" value="<?=$type_book;?>">
        <input name="yourname" type="hidden" id="yourname" value="<?=$re_name1;?>">
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="3" bgcolor="#CCCCCC"><span class="style9">คำสำคัญสำหรับค้นหา(Keywords)</span></td>
    </tr>
    <tr bgcolor="eeeeee" class="style4"> 
      <td rowspan="4" align="right" valign="top">คำสำคัญเพื่อค้นหา&nbsp;</td>
      <td width="25%"><input name="k1" type="checkbox" id="k1" value="ทุนวิจัย">
      ทุนวิจัย</td>
      <td width="28%"><input name="k5" type="checkbox" id="k5" value="ระเบียบสถาบัน">
      ระเบียบสถาบัน</td>
    </tr>
    <tr> 
      <td bgcolor="eeeeee" class="style4"><input name="k2" type="checkbox" id="k2" value="ทุนเรียนต่อ">
      ทุนเรียนต่อ</td>
      <td bgcolor="eeeeee" class="style4"><input name="k6" type="checkbox" id="k6" value="กิจการนักศึกษา">
      กิจการนักศึกษา</td>
    </tr>
    <tr> 
      <td bgcolor="eeeeee" class="style4"><input name="k3" type="checkbox" id="k3" value="งบประมาณรายปี">
      งบประมาณรายปี</td>
      <td bgcolor="eeeeee" class="style4"><input name="k7" type="checkbox" id="k7" value="บุคลากร">
      บุคลากร</td>
    </tr>
    <tr> 
      <td bgcolor="eeeeee" class="style4"><input name="k4" type="checkbox" id="k4" value="งบวัสดุ">
      งบวัสดุ</td>
      <td bgcolor="eeeeee" class="style4"> <input name="k8" type="checkbox" id="k8" value="yes"> <input name="d4" type="text" id="d4"></td>
    </tr>
    <tr bgcolor="eeeeee"> 
      <td></td>
      <td colspan="2"><blockquote> 
          <blockquote> 
            <p> 
              <input type="submit" name="Submit" value="Submit">
            </p>
          </blockquote>
        </blockquote></td>
    </tr>
  </table>
</form>
</body>
</html>
<?
}
?>