<?
if($Submit=='preview'){
include "externalbook.php";
}
else{
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
</style>
</head>

<body>
<?
		include  "datethai.php";
		
?>
<form action="index2.php?data=save6&username=<?=$username;?>&pwd=<?=$pwd;?>" method="post" enctype="multipart/form-data" name="form1"  >
  <table width="100%" border="0" cellpadding="5" cellspacing="0">
    <tr align="left" bgcolor="#990000"> 
      <td colspan="3">&nbsp;<br> &nbsp;<img src="images/icon2/ico472.gif" width="15" height="16" align="absmiddle">&nbsp;<span class="style8"><strong>ขอเลขที่หนังสือ<br><? echo "$data4 $data5";?>
        </strong></span></td>
    </tr>
    <tr align="center"> 
      <td colspan="3" bgcolor="#CCCCCC" class="style9">วิธีการส่ง</td>
    </tr>
    <tr align="center" bgcolor="eeeeee"> 
      <td width="9%" align="right" valign="top" class="style4">วิธีการส่ง</td>
      <td colspan="2" align="left"><input type="radio" name="type_sent" value="สมุดหนังสือส่ง">
        <span class="style4"> สมุดหนังสือส่ง </span>
<input type="radio" name="type_sent" value="ฝากส่งหรือยื่นด้วยตัวเอง">
        <span class="style4">ฝากส่ง/ ยื่นด้วยตัวเอง </span>
<input type="radio" name="type_sent" value="จดหมาย">
        <span class="style4">จดหมาย</span> 
        <input type="radio" name="type_sent" value="fax">
        <span class="style4">fax </span></td>
    </tr>
    <tr bgcolor="eeeeee"> 
      <td align="right" class="style4">แนบไฟล์</td>
      <td colspan="2"><p> 
          <input  type="file" name="files">
        </p></td>
    </tr>
    <tr align="center" bgcolor="eeeeee"> 
      <td colspan="3"> <input name="e_data1" type="hidden" value="<?=$data7;?>"> 
        <input name="e_data2" type="hidden" value="<?=$data11;?>"> <input name="e_data3" type="hidden" value="<?=$data8;?>"> 
        <input name="e_topic" type="hidden" value="<?=$data4;?>"> <input name="e_to" type="hidden" value="<?=$data5;?>"> 
        <input name="e_and" type="hidden" value="<?=$data6;?>"> <input name="e_end" type="hidden" value="<?=$menu1;?>"> 
      </td>
    </tr>
    <tr align="center"> 
      <td colspan="3" bgcolor="#CCCCCC" class="style9">คำสำคัญสำหรับค้นหา(Keywords)</td>
    </tr>
    <tr bgcolor="eeeeee" class="style4"> 
      <td rowspan="4" align="right" valign="top">คำสำคัญเพื่อค้นหา</td>
      <td width="25%"><input name="k1" type="checkbox" id="k1" value="ทุนวิจัย">
        <span class="style4"> ทุนวิจัย</span></td>
      <td width="28%"><input name="k5" type="checkbox" id="k5" value="ระเบียบสถาบัน">
        ระเบียบสถาบัน</td>
    </tr>
    <tr> 
      <td bgcolor="eeeeee" class="style4"><input name="k2" type="checkbox" id="k2" value="ทุนเรียนต่อ">
        ทุนเรียนต่อ</td>
      <td bgcolor="eeeeee"><input name="k6" type="checkbox" id="k6" value="กิจการนักศึกษา">
        <span class="style4">กิจการนักศึกษา</span></td>
    </tr>
    <tr> 
      <td bgcolor="eeeeee"><input name="k3" type="checkbox" id="k3" value="งบประมาณรายปี">
        <span class="style4">งบประมาณรายปี</span></td>
      <td bgcolor="eeeeee"><input name="k7" type="checkbox" id="k7" value="บุคลากร">
        <span class="style4"> บุคลากร</span></td>
    </tr>
    <tr> 
      <td bgcolor="eeeeee" class="style4"><input name="k4" type="checkbox" id="k4" value="งบวัสดุ">
        งบวัสดุ</td>
      <td bgcolor="eeeeee"> <input name="k8" type="checkbox" id="k8" value="yes"> <input name="d4" type="text" id="d4"></td>
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