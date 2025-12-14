<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=tis-620">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
</head>

<body>
<table width="100%" border="0" align="center" bgcolor="#F0F0F0">
  <tr> 
    <td height="280"  valign="top"><form name="form2" method="post" action="?file=checkpregister.php">
        <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#F0F0F0">
          <tr bgcolor="#CC0033"> 
            <td height="16" colspan="4"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><strong> 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFFFFF">&nbsp;ข้อมูลส่วน 
              Login </font></strong></font></td>
          </tr>
          <tr> 
            <td width="20%" align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              สถานะของท่าน : </font></td>
            <td width="35%"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <select name="status" id="select2" onChange="MM_jumpMenu('parent',this,0)">
                <option value="?file=formpersonal_type.php" selected>ประเภทส่วนบุคคล</option>
                <option value="?file=formbussiness_type.html">ประเภทธุรกิจ</option>
              </select>
              </font></td>
            <td width="18%" align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
            <td width="27%"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
          </tr>
          <tr bgcolor="#CC3300"> 
            <td height="16" colspan="4" align="right" valign="middle"><div align="left"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="#FFFFFF">&nbsp;&nbsp;ข้อมูลส่วนบุคคล</font></strong></font></div></td>
          </tr>
          <tr> 
            <td height="22" align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><span class="style36"><font color="#FF0000">*</font> 
              </span>ชื่อ : </font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="name_reg" type="text"  size="20">
              <input  type="hidden" name="status_reg" value="บุคคล">
              </font></td>
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><span class="style36"><font color="#FF0000">* 
              </font></span>นามสกุล : </font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="lname_reg" type="text" id="lname_reg" size="20">
              </font></td>
          </tr>
          <tr> 
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><span class="style36"><font color="#FF0000">* 
              </font></span>เลขที่ : </font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="att_reg" type="text" id="address_reg" size="8" maxlength="8">
              <span class="style36"><font color="#FF0000">* </font></span>หมู่ที่ 
              : 
              <input name="moo_reg" type="text" size="5" maxlength="5" onKeyPress='checknumber();'>
              </font></td>
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <span class="style36"><font color="#FF0000">*</font> </span>ตำบล 
              / แขวง :: </font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="district_reg" type="text" id="district_reg2" size="20">
              </font></td>
          </tr>
          <tr> 
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><span class="style36"><font color="#FF0000">*</font> 
              </span>อำเภอ / เขต :</font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="amphur_reg" type="text" id="amphur_reg2" size="20">
              </font></td>
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><span class="style36"><font color="#FF0000">*</font> 
              </span>จังหวัด : </font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <select name="province_reg">
                <option value="เลือก" selected>------ เลือก -------</option>
                <option value="กรุงเทพมหานคร">กรุงเทพมหานคร</option>
                <option value="ระยอง">ระยอง</option>
                <option value="ขอนแก่น">ขอนแก่น</option>
                <option value="เชียงใหม่">เชียงใหม่</option>
                <option value="สงขลา">สงขลา</option>
              </select>
              </font></td>
          </tr>
          <tr> 
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"><span class="style36"><font color="#FF0000">*</font> 
              </span>รหัสไปรษณีย์ : </font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="zipcode_reg" type="text" id="zipcode_reg2" size="5" maxlength="5" onKeyPress='checknumber();'>
              </font></td>
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">Email 
              : </font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="email_reg" type="text" id="email_reg3" size="20">
              </font></td>
          </tr>
          <tr> 
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">โทรศัพท์ 
              : </font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="telephone_reg" type="text" id="telephone_reg" size="15" maxlength="20">
              </font></td>
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">มือถือ 
              &nbsp;</font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input name="mobile_reg" type="text"  size="15" maxlength="20">
              </font></td>
          </tr>
          <tr> 
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
          </tr>
          <tr> 
            <td colspan="4" align="center" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif"> 
              <input type="submit" name="Submit" value="สมัครสมาชิก">
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
              <input name="reset" type="reset" id="reset" value="ลบทั้งหมด">
              </font></td>
          </tr>
          <tr> 
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
            <td align="right" valign="middle"><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
            <td><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;</font></td>
          </tr>
          <tr> 
            <td colspan="4" align="right" valign="middle"><div align="center"></div>
              <div align="center"><strong><font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;<a href="index.php?file=servicetool.php&file2=detail2.php">กลับหน้าหลัก</a></font></strong></div>
              <font size="2" face="Microsoft Sans Serif, MS Sans Serif, sans-serif">&nbsp;&nbsp;</font></td>
          </tr>
        </table>
      </form></tr>
</table>
<p>&nbsp;</p>
</body>
</html>
