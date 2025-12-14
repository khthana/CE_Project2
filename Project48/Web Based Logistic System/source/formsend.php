<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body >
<form name="form1" method="post" action="sendtable.php">
  <table width="100%"  border="0" cellpadding="2" cellspacing="0" bgcolor="#FFCC66" >
    <tr bgcolor="#F3F3F3"> 
      <td width="20%"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"> 
          <span class="style9"><font color="#FF0000">*</font> </span>ชื่อ : </span></font></div></td>
      <td width="27%"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="namesend" type="text" id="namesend" size="25" >
        </font></td>
      <td width="20%"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">* 
          </font></span>นามสกุล<span class="style5"> : </span></font></div></td>
      <td width="33%"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="sursend" type="text" id="sursend" size="20" >
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td bgcolor="#F3F3F3"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9"><font color="#FF0000">*</font> 
          </span>ที่อยู่ : </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="addrsend" type="text" id="addrsend" size="25">
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">* 
        </font></span>ถนน : </font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="sroad" type="text" id="road" size="20">
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">*</font></span>ตำบล 
        / แขวง : </font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="sdistrict" type="text" id="district" size="20">
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">*</font> 
        </span>อำเภอ / เขต :</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="samphur" type="text" id="amphur" size="20">
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9"><font color="#FF0000">*</font> 
          </span>จังหวัด : </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <select name="sprovince" size="1" id="select4">
          <option value="เลือก" selected>----- เลือก -----</option>
          <option value="กระบี่">กระบี่ </option>
          <option value="กรุงเทพ ">กรุงเทพ </option>
          <option value="กาญจนบุรี ">กาญจนบุรี </option>
          <option value="กาฬสินธุ์ ">กาฬสินธุ์ </option>
          <option value="กำแพงเพชร ">กำแพงเพชร </option>
          <option value="ขอนแก่น ">ขอนแก่น </option>
          <option value="จันทบุรี ">จันทบุรี </option>
          <option value="ฉะเชิงเทรา ">ฉะเชิงเทรา </option>
          <option value="ชลบุรี ">ชลบุรี </option>
          <option value="ชัยนาท ">ชัยนาท </option>
          <option value="ชัยภูมิ ">ชัยภูมิ </option>
          <option value="ชุมพร ">ชุมพร </option>
          <option value="เชียงราย ">เชียงราย </option>
          <option value="เชียงใหม่ ">เชียงใหม่ </option>
          <option value="ตรัง ">ตรัง </option>
          <option value="ตราด ">ตราด </option>
          <option value="ตาก ">ตาก </option>
          <option value="นครนายก ">นครนายก </option>
          <option value="นครปฐม ">นครปฐม </option>
          <option value="นครพนม ">นครพนม </option>
          <option value="นครราชสีมา ">นครราชสีมา </option>
          <option value="นครศรีธรรมราช ">นครศรีธรรมราช </option>
          <option value="นครสวรรค์ ">นครสวรรค์ </option>
          <option value="นนทบุรี ">นนทบุรี </option>
          <option value="นราธิวาส ">นราธิวาส </option>
          <option value="น่าน ">น่าน </option>
          <option value="บุรีรัมย์ ">บุรีรัมย์ </option>
          <option value="ปทุมธานี ">ปทุมธานี </option>
          <option value="ประจวบคีรีขันธ์ ">ประจวบคีรีขันธ์ </option>
          <option value="ปราจีนบุรี ">ปราจีนบุรี </option>
          <option value="ปัตตานี ">ปัตตานี </option>
          <option value="พะเยา ">พะเยา </option>
          <option value="พังงา ">พังงา </option>
          <option value="พัทลุง ">พัทลุง </option>
          <option value="พิจิตร ">พิจิตร </option>
          <option value="พิษณุโลก ">พิษณุโลก </option>
          <option value="เพชรบุรี ">เพชรบุรี </option>
          <option value="เพชรบูรณ์ ">เพชรบูรณ์ </option>
          <option value="แพร่ ">แพร่ </option>
          <option value="ภูเก็ต ">ภูเก็ต </option>
          <option value="มหาสารคาม ">มหาสารคาม </option>
          <option value="มุกดาหาร ">มุกดาหาร </option>
          <option value="แม่ฮ่องสอน ">แม่ฮ่องสอน </option>
          <option value="ยโสธร ">ยโสธร </option>
          <option value="ยะลา ">ยะลา </option>
          <option value="ร้อยเอ็ด ">ร้อยเอ็ด </option>
          <option value="ระนอง ">ระนอง </option>
          <option value="ระยอง ">ระยอง </option>
          <option value="ราชบุรี ">ราชบุรี </option>
          <option value="ลพบุรี ">ลพบุรี </option>
          <option value="ลำปาง ">ลำปาง </option>
          <option value="ลำพูน ">ลำพูน </option>
          <option value="เลย ">เลย </option>
          <option value="ศรีสะเกษ ">ศรีสะเกษ </option>
          <option value="สกลนคร ">สกลนคร </option>
          <option value="สงขลา ">สงขลา </option>
          <option value="สตูล ">สตูล </option>
          <option value="สมุทรปราการ ">สมุทรปราการ </option>
          <option value="สมุทรสงคราม ">สมุทรสงคราม </option>
          <option value="สมุทรสาคร ">สมุทรสาคร </option>
          <option value="สระแก้ว ">สระแก้ว </option>
          <option value="สระบุรี ">สระบุรี </option>
          <option value="สิงห์บุรี ">สิงห์บุรี </option>
          <option value="สุโขทัย ">สุโขทัย </option>
          <option value="สุพรรณบุรี ">สุพรรณบุรี </option>
          <option value="สุราษฎร์ธานี ">สุราษฎร์ธานี </option>
          <option value="สุรินทร์ ">สุรินทร์ </option>
          <option value="หนองคาย ">หนองคาย </option>
          <option value="หนองบัวลำภู ">หนองบัวลำภู </option>
          <option value="อยุธยา ">อยุธยา </option>
          <option value="อ่างทอง ">อ่างทอง </option>
          <option value="อำนาจเจริญ ">อำนาจเจริญ </option>
          <option value="อุดรธานี ">อุดรธานี </option>
          <option value="อุตรดิตถ์ ">อุตรดิตถ์ </option>
          <option value="อุทัยธานี ">อุทัยธานี </option>
          <option value="อุบลราชธานี ">อุบลราชธานี </option>
        </select>
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">* 
        </font></span>รหัสไปรษณีย์ : </font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="szipcode" type="text" id="post" size="10" maxlength="5" onKeyPress="checknumber();">
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
    </tr>
    <tr bgcolor="#FFCC66"> 
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><strong>รายละเอียดผู้รับ:</strong></font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9"><font color="#FF0000">* 
          </font></span>ชื่อ : </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="nameres" type="text" id="namesend2" size="25" >
        </font></td>
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">*</font> 
          </span>นามสกุล<span class="style5"> : </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="surres" type="text" id="sursend2" size="20" >
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9"><font color="#FF0000">* 
          </font></span>ที่อยู่: </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="raddr" type="text" id="addrsend2" size="25">
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">*</font> 
        </span>ถนน : </font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="rroad" type="text" id="road" size="20">
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">*</font> 
        </span>ตำบล / แขวง : </font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="rdistrict" type="text" id="district" size="20">
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36"><span class="style36 style9"><font color="#FF0000">*</font> 
        </span> </span>อำเภอ / เขต :</font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="ramphur" type="text" id="amphur" size="20">
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9"><font color="#FF0000">*</font>จังหวัด</span> 
          : </span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <select name="rprovince" size="1" id="select">
          <option value="เลือก" selected>----- เลือก -----</option>
          <option value="กระบี่">กระบี่ </option>
          <option value="กรุงเทพ ">กรุงเทพ </option>
          <option value="กาญจนบุรี ">กาญจนบุรี </option>
          <option value="กาฬสินธุ์ ">กาฬสินธุ์ </option>
          <option value="กำแพงเพชร ">กำแพงเพชร </option>
          <option value="ขอนแก่น ">ขอนแก่น </option>
          <option value="จันทบุรี ">จันทบุรี </option>
          <option value="ฉะเชิงเทรา ">ฉะเชิงเทรา </option>
          <option value="ชลบุรี ">ชลบุรี </option>
          <option value="ชัยนาท ">ชัยนาท </option>
          <option value="ชัยภูมิ ">ชัยภูมิ </option>
          <option value="ชุมพร ">ชุมพร </option>
          <option value="เชียงราย ">เชียงราย </option>
          <option value="เชียงใหม่ ">เชียงใหม่ </option>
          <option value="ตรัง ">ตรัง </option>
          <option value="ตราด ">ตราด </option>
          <option value="ตาก ">ตาก </option>
          <option value="นครนายก ">นครนายก </option>
          <option value="นครปฐม ">นครปฐม </option>
          <option value="นครพนม ">นครพนม </option>
          <option value="นครราชสีมา ">นครราชสีมา </option>
          <option value="นครศรีธรรมราช ">นครศรีธรรมราช </option>
          <option value="นครสวรรค์ ">นครสวรรค์ </option>
          <option value="นนทบุรี ">นนทบุรี </option>
          <option value="นราธิวาส ">นราธิวาส </option>
          <option value="น่าน ">น่าน </option>
          <option value="บุรีรัมย์ ">บุรีรัมย์ </option>
          <option value="ปทุมธานี ">ปทุมธานี </option>
          <option value="ประจวบคีรีขันธ์ ">ประจวบคีรีขันธ์ </option>
          <option value="ปราจีนบุรี ">ปราจีนบุรี </option>
          <option value="ปัตตานี ">ปัตตานี </option>
          <option value="พะเยา ">พะเยา </option>
          <option value="พังงา ">พังงา </option>
          <option value="พัทลุง ">พัทลุง </option>
          <option value="พิจิตร ">พิจิตร </option>
          <option value="พิษณุโลก ">พิษณุโลก </option>
          <option value="เพชรบุรี ">เพชรบุรี </option>
          <option value="เพชรบูรณ์ ">เพชรบูรณ์ </option>
          <option value="แพร่ ">แพร่ </option>
          <option value="ภูเก็ต ">ภูเก็ต </option>
          <option value="มหาสารคาม ">มหาสารคาม </option>
          <option value="มุกดาหาร ">มุกดาหาร </option>
          <option value="แม่ฮ่องสอน ">แม่ฮ่องสอน </option>
          <option value="ยโสธร ">ยโสธร </option>
          <option value="ยะลา ">ยะลา </option>
          <option value="ร้อยเอ็ด ">ร้อยเอ็ด </option>
          <option value="ระนอง ">ระนอง </option>
          <option value="ระยอง ">ระยอง </option>
          <option value="ราชบุรี ">ราชบุรี </option>
          <option value="ลพบุรี ">ลพบุรี </option>
          <option value="ลำปาง ">ลำปาง </option>
          <option value="ลำพูน ">ลำพูน </option>
          <option value="เลย ">เลย </option>
          <option value="ศรีสะเกษ ">ศรีสะเกษ </option>
          <option value="สกลนคร ">สกลนคร </option>
          <option value="สงขลา ">สงขลา </option>
          <option value="สตูล ">สตูล </option>
          <option value="สมุทรปราการ ">สมุทรปราการ </option>
          <option value="สมุทรสงคราม ">สมุทรสงคราม </option>
          <option value="สมุทรสาคร ">สมุทรสาคร </option>
          <option value="สระแก้ว ">สระแก้ว </option>
          <option value="สระบุรี ">สระบุรี </option>
          <option value="สิงห์บุรี ">สิงห์บุรี </option>
          <option value="สุโขทัย ">สุโขทัย </option>
          <option value="สุพรรณบุรี ">สุพรรณบุรี </option>
          <option value="สุราษฎร์ธานี ">สุราษฎร์ธานี </option>
          <option value="สุรินทร์ ">สุรินทร์ </option>
          <option value="หนองคาย ">หนองคาย </option>
          <option value="หนองบัวลำภู ">หนองบัวลำภู </option>
          <option value="อยุธยา ">อยุธยา </option>
          <option value="อ่างทอง ">อ่างทอง </option>
          <option value="อำนาจเจริญ ">อำนาจเจริญ </option>
          <option value="อุดรธานี ">อุดรธานี </option>
          <option value="อุตรดิตถ์ ">อุตรดิตถ์ </option>
          <option value="อุทัยธานี ">อุทัยธานี </option>
          <option value="อุบลราชธานี ">อุบลราชธานี </option>
        </select>
        </font></td>
      <td align="right" valign="middle"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style36 style9"><font color="#FF0000">* 
        </font></span>รหัสไปรษณีย์ : </font></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="rzipcode" type="text" id="post" size="10" maxlength="5" onKeyPress="checknumber();">
        </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#FFCC66"> 
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style7"><strong>รายการสินค้า:</strong></span></font></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td height="26"><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9"><font color="#FF0000">* 
          </font></span>รายละอียดสินค้า :</span></font></div></td>
      <td><p>&nbsp;<select name="packid">
                  <?
				  include "connect.php";
				$sql="select  * from packtype";
				$result=mysql_db_query($dbname,$sql);
				while($object2=mysql_fetch_object($result))
				{
			print"<option  value=\"$object2->packid\">$object2->packtype</option>";
				}			
			?>
                </select>
        &nbsp;</p></td>
      <td><div align="right"><font size="2" face="MS Sans Serif, Tahoma, sans-serif"><span class="style5"><span class="style36 style9"><font color="#FF0000">*</font>จำนวนสินค้า</span> 
          :</span></font></div></td>
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
        <input name="total" type="text" id="number2" size="6" onKeyPress="checknumber();">
        ชิ้น </font></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><div align="right"><font color="#FF0000" size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">*</font><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">น้ำหนักรวม:</font></div></td>
      <td colspan="2"><input name="weigth" type="text" size="10" onKeyPress="checknumber();"> <font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">กิโลกรัม</font></td>
      <td>&nbsp;</td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font></td>
      <td colspan="3"><div align="center"> <font size="2" face="MS Sans Serif, Tahoma, sans-serif"> 
          </font></div></td>
    </tr>
    <tr bgcolor="#F3F3F3"> 
      <td colspan="4"><div align="center"><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp;</font><font size="2" face="MS Sans Serif, Tahoma, sans-serif">&nbsp; 
          <input name="senddata" type="submit" id="senddata3" value="ส่งรายการสินค้า">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
          <input name="reset" type="reset" id="reset3" value="ลบข้อมูล">
          </font></div></td>
    </tr>
  </table>
</form>
</body>
</html>
