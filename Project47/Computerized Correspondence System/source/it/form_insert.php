<html>
<head>
<title>ลงทะเบียนหนังสือรับ</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link href="style.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
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
<form action="index2.php?data=save1&username=<?=$username;?>&pwd=<?=$pwd;?>" method="post" enctype="multipart/form-data" name="form1"  >
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="38" bgcolor="#990000">&nbsp;<img src="images/icon2/ico418.gif" width="16" height="16"> <span class="style8"><strong>ระบบทะเบียนหนังสือเ้ข้า</strong></span></td>
    </tr>
  </table>
  <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC">
    <tr bgcolor="#eeeeee"> 
      <td height="30" colspan="3" align="center"><span class="style9">ข้อมูลหนังสือ</span></td>
    </tr>
    <tr bordercolor="#FFFFFF"> 
      <td width="27%" align="right" class="style4"><p>วันที่(หนังสือ)</p></td>
      <td colspan="2" class="style4"><p><span class="style1"> 
          <select  
                        name=d1 size="0" id="select">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
            <option value="11">11</option>
            <option value="12" selected>12</option>
            <option value="13">13</option>
            <option value="14">14</option>
            <option value="15">15</option>
            <option value="16">16</option>
            <option value="17">17</option>
            <option value="18">18</option>
            <option value="19">19</option>
            <option value="20">20</option>
            <option value="21">21</option>
            <option value="22">22</option>
            <option value="23">23</option>
            <option value="24">24</option>
            <option value="25">25</option>
            <option value="26">26</option>
            <option value="27">27</option>
            <option value="28">28</option>
            <option value="29">29</option>
            <option value="30">30</option>
            <option value="31">31</option>
          </select>
          เดือน 
          <select 
                         name=d2 id="select5">
            <option value="มกราคม">มกราคม</option>
            <option value="กุมภาพันธ์">กุมภาพันธ์</option>
            <option value="มีนาคม" selected>มีนาคม</option>
            <option value="เมษายน">เมษายน</option>
            <option value="พฤษภาคม">พฤษภาคม</option>
            <option value="มิถุนายน">มิถุนายน</option>
            <option value="กรกฎาคม">กรกฎาคม</option>
            <option value="สิงหาคม">สิงหาคม</option>
            <option value="กันยายน">กันยายน</option>
            <option value="ตุลาคม">ตุลาคม</option>
            <option value="พฤศจิกายน">พฤศจิกายน</option>
            <option value="ธันวาคม">ธันวาคม</option>
          </select>
          พ.ศ. 
          <select 
                         name=d3 id="select6">
            <option value="2546">2546</option>
            <option value="2547">2547</option>
            <option value="2548">2548</option>
            <option value="2549">2549</option>
            <option value="2550">2550</option>
            <option value="2551">2551</option>
          </select>
      </span> </p></td>
    </tr>
    <tr bordercolor="#FFFFFF"> 
      <td height="24" align="right" class="style4"><p>เรื่อง</p></td>
      <td colspan="2" class="style4"><input name="ttopic"  type="text" id="ttopic" ></td>
    </tr>
    <tr bordercolor="#FFFFFF"> 
      <td align="right" class="style4"><p>เรียน</p></td>
      <td colspan="2" class="style4"><input name="too"  type="text" id="too" ></td>
    </tr>
    <tr bordercolor="#FFFFFF"> 
      <td align="right" valign="top" class="style4">หน่วยงาน/ผู้ออกหนังสือ&nbsp;&nbsp;&nbsp;</td>
      <td colspan="2" class="style4"><input name="sender" type="text" id="sender"></td>
    </tr>
    <tr align="center" bgcolor="#eeeeee"> 
      <td height="30" colspan="3"><span class="style9">วิธีการส่ง</span></td>
    </tr>
    <tr align="center" class="style4"> 
      <td align="right" valign="top" bordercolor="#FFFFFF">วิธีการส่ง&nbsp;&nbsp;</td>
      <td colspan="2" align="left" bordercolor="#FFFFFF"><input type="radio" name="type_sent" value="สมุดหนังสือส่ง">
        สมุดหนังสือส่ง 
        <input type="radio" name="type_sent" value="ฝากส่งหรือยื่นด้วยตัวเอง">
        ฝากส่ง/ ยื่นด้วยตัวเอง 
        <input type="radio" name="type_sent" value="จดหมาย">
        จดหมาย 
        <input type="radio" name="type_sent" value="fax">
      fax </td>
    </tr>
    <tr> 
      <td align="right" bordercolor="#FFFFFF" class="style4">แนบไฟล์ &nbsp;</td>
      <td colspan="2" bordercolor="#FFFFFF"><input  type="file" name="files"></td>
    </tr>
    <tr align="center"> 
      <td colspan="3" bordercolor="#FFFFFF">&nbsp;</td>
    </tr>
    <tr align="center" bgcolor="#eeeeee"> 
      <td height="30" colspan="3"><span class="style9">คำสำคัญสำหรับค้นหา(Keywords)</span></td>
    </tr>
    <tr bordercolor="#FFFFFF" class="style4"> 
      <td rowspan="4" align="right" valign="top">คำสำคัญเพื่อค้นหา</td>
      <td width="33%" bordercolor="#FFFFFF"><input name="k1" type="checkbox" id="k1" value="ทุนวิจัย">
      ทุนวิจัย</td>
      <td width="40%" bordercolor="#FFFFFF"><input name="k5" type="checkbox" id="k5" value="ระเบียบสถาบัน">
      ระเบียบสถาบัน</td>
    </tr>
    <tr> 
      <td bordercolor="#FFFFFF" class="style4"><input name="k2" type="checkbox" id="k2" value="ทุนเรียนต่อ">
      ทุนเรียนต่อ</td>
      <td bordercolor="#FFFFFF" class="style4"><input name="k6" type="checkbox" id="k6" value="กิจการนักศึกษา">
      กิจการนักศึกษา</td>
    </tr>
    <tr> 
      <td bordercolor="#FFFFFF" class="style4"><input name="k3" type="checkbox" id="k3" value="งบประมาณรายปี">
      งบประมาณรายปี</td>
      <td bordercolor="#FFFFFF" class="style4"><input name="k7" type="checkbox" id="k7" value="บุคลากร">
      บุคลากร</td>
    </tr>
    <tr> 
      <td bordercolor="#FFFFFF" class="style4"><input name="k4" type="checkbox" id="k4" value="งบวัสดุ">
      งบวัสดุ</td>
      <td bordercolor="#FFFFFF" class="style4"> <input name="k8" type="checkbox" id="k8" value="yes">
        อื่นๆ(กรอก)
      <input name="d4" type="text" id="d4"></td>
    </tr>
    <tr bordercolor="#FFFFFF"> 
      <td height="46">&nbsp;</td>
      <td colspan="2"><input type="submit" name="Submit" value="บันทึก"></td>
    </tr>
  </table>
</form>
</body>
</html>
