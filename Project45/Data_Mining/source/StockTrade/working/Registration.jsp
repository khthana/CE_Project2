<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
</head>

<body>
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr> 
    <td valign="top"> <form name='registration' method='post' action='S01_RegistrationTrialConfirm.jsp?txtBrokerId=IPO' onsubmit='return validate();'>
        <table width='600' border='0' cellspacing='0' cellpadding='0'>
          <tr> 
            <td valign='top' align='center' height='733'> <br> <table width='96%' border='0' cellspacing='0' cellpadding='0'>
                <tr> 
                  <td width='28%'><img src='PIC/point.gif' width='102' height='25'> 
                  </td>
                  <td width='40%'><img src='PIC/menu2_off.gif' width='178' height='25'></td>
                  <td width='32%'>&nbsp; </td>
                </tr>
              </table>
              <br> 
              <table width='96%' border='0' cellspacing='0' cellpadding='2'>
                <tr>
                  <td height='28' colspan="3"><b><font size='3' color='#999999'>กรุณาเลือกรหัสผ่าน</font></b></td>
                </tr>
				<tr valign='middle'> 
                  <td colspan='4' height='2' bgcolor='#CBE7A5'></td>
                </tr>
                <tr> 
                  <td width='26%' height='64'><font color='#000000'>ชื่อผู้ใช้ 
                    (Login Name)</font></td>
                  <td width='25%' height='64'><font color='#000000'> 
                    <input type='text' name='loginName' size='15' class='text_box' maxlength='15' value=''>
                    </font></td>
                  <td width='49%' height='64'><font color='#999999'>ตัวอักษรภาษาอังกฤษ 
                    มีความยาวไม่เกิน 15 ตัวอักษร<br>
                    และไม่มีเว้นวรรค</font></td>
                </tr>
                <tr> 
                  <td width='26%' height='30'><font color='#000000'>รหัสผ่าน (Password)</font></td>
                  <td width='25%' height='30'><font color='#000000'> 
                    <input type='password' name='passwd' size='15' class='text_box' maxlength='10'>
                    </font></td>
                  <td width='49%' height='30' valign='bottom'><font color='#999999'>ไม่ซ้ำกับชื่อผู้ใช้, 
                    เป็นตัวอักษรภาษาอังกฤษ 6-10 ตัวอักษร<br>
                    และไม่มีเว้นวรรค</font></td>
                </tr>
                <tr> 
                  <td width='26%' height='30'><font color='#000000'>ใส่รหัสผ่านอีกครั้งหนึ่ง 
                    </font></td>
                  <td width='25%' height='30'><font color='#000000'> 
                    <input type='password' name='rePasswd' size='15' class='text_box' maxlength='10'>
                    </font></td>
                  <td width='49%' height='30'><font color='#000000'>&nbsp;</font></td>
                </tr>
              </table>
              <br> <table width='96%' border='0' cellspacing='0' cellpadding='0'>
                <tr valign='middle'> 
                  <td colspan='4' height='26'><font color='#000000'><b><font size='3' color='#999999'>ข้อมูลส่วนบุคคล</font></b> 
                    <font color='#999999'>(กรุณากรอกข้อมูลเป็นภาษาไทย)</font></font></td>
                </tr>
                <tr valign='middle'> 
                  <td colspan='4' height='2' bgcolor='#CBE7A5'></td>
                </tr>
                <tr> 
                  <td width='21%' height='35'><font color='#000000'>คำนำหน้าชื่อ</font></td>
                  <td width='25%' height='35'><font color='#000000'> 
                    <select name='title' class='text_box' onchange='definedSex();'>
                      <option value='-'>- - - - -</option>
                      <option value='101'>เด็กชาย</option>
                      <option value='102'>เด็กหญิง</option>
                      <option value='103'>นาย</option>
                      <option value='104'>นาง</option>
                      <option value='105'>นางสาว</option>
                    </select>
                    </font></td>
                  <td width='21%' height='35' align='right'><font color='#000000'>เพศ&nbsp;&nbsp;</font></td>
                  <td width='33%' height='35'><font color='#000000'> 
                    <input type='text' name='sex' size='13' class='text_box' disabled value=''>
                    </font></td>
                </tr>
                <tr> 
                  <td width='21%' height='35'><font color='#000000'>ชื่อ</font></td>
                  <td width='25%' height='35'><font color='#000000'> 
                    <input type='text' name='name' maxlength='40' value='' class='text_box'>
                    </font></td>
                  <td width='21%' height='35' align='right'><font color='#000000'>นามสกุล&nbsp;&nbsp;</font></td>
                  <td width='33%' height='35'><font color='#000000'> 
                    <input type='text' name='surname' maxlength='110' value='' class='text_box'>
                    </font></td>
                </tr>
                <tr> 
                  <td width='21%' height='35'><font color='#000000'>ที่อยู่</font></td>
                  <td colspan='3' height='35'><font color='#000000'>&nbsp;</font><font color='#000000'>&nbsp;</font><font color='#000000'> 
                    <input type='text' name='address1' size='64' class='text_box' value='' maxlength='70' align="left"><br>
                    <input type='text' name='address2' size='64' class='text_box' value='' maxlength='70' align="left">
                    </font></td>
                </tr>
                <tr> 
                  <td width='21%' height='35'><font color='#000000'>รหัสไปรษณีย์</font></td>
                  <td width='25%' height='35'><font color='#000000'> 
                    <input type='text' name='postCode' size='9' class='text_box' value='' maxlength='5'>
                    </font></td>
                  <td width='21%' height='35'><font color='#000000'>&nbsp;</font></td>
                  <td width='33%' height='35'><font color='#000000'>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td width='21%' height='35'><font color='#000000'>หมายเลขโทรศัพท์ 
                    (บ้าน)</font></td>
                  <td width='25%' height='35'><font color='#000000'> 
                    <input type='text' name='telHome' value='' size='10' class='text_box' maxlength='30'>
                    </font></td>
                  <td width='21%' height='35'><font color='#000000'>&nbsp;</font></td>
                  <td width='33%' height='35'><font color='#000000'>&nbsp;</font></td>
                </tr>
                <tr> 
                  <td width='21%' height='35'><font color='#000000'>ประเทศตามที่อยู่</font></td>
                  <td width='25%' height='35'><font color='#000000'> 
                    <input type='text' name='country' value='ไทย' size='15' class='text_box' disabled>
                    </font></td>
                  <td width='21%' height='35' align='right'><font color='#000000'>สัญชาติ&nbsp;&nbsp;</font></td>
                  <td width='33%' height='35'><font color='#000000'> 
                    <input type='text' name='nationality' value='ไทย' size='15' class='text_box' disabled>
                    </font></td>
                </tr>
                <tr> 
                  <td width='21%' height='35'><font color='#000000'>วันเกิด</font></td>
                  <td colspan='3' height='35' valign='top'><font color='#000000'>&nbsp;</font><font color='#000000'>&nbsp;</font> 
                    <table width='100%' border='0' cellspacing='0' cellpadding='0' height='30'>
                      <tr> 
                        <td width='13%'> <select name='birthDate' class='text_box'>
                            <option value=''>- -</option>
                            <option value='01'>01</option>
                            <option value='02'>02</option>
                            <option value='03'>03</option>
                            <option value='04'>04</option>
                            <option value='05'>05</option>
                            <option value='06'>06</option>
                            <option value='07'>07</option>
                            <option value='08'>08</option>
                            <option value='09'>09</option>
                            <option value='10'>10</option>
                            <option value='11'>11</option>
                            <option value='12'>12</option>
                            <option value='13'>13</option>
                            <option value='14'>14</option>
                            <option value='15'>15</option>
                            <option value='16'>16</option>
                            <option value='17'>17</option>
                            <option value='18'>18</option>
                            <option value='19'>19</option>
                            <option value='20'>20</option>
                            <option value='21'>21</option>
                            <option value='22'>22</option>
                            <option value='23'>23</option>
                            <option value='24'>24</option>
                            <option value='25'>25</option>
                            <option value='26'>26</option>
                            <option value='27'>27</option>
                            <option value='28'>28</option>
                            <option value='29'>29</option>
                            <option value='30'>30</option>
                            <option value='31'>31</option>
                          </select> </td>
                        <td width='6%'><font color='#000000'>เดือน</font></td>
                        <td width='21%'> <select name='birthMonth' class='text_box'>
                            <option value=''>- - - - - - </option>
                            <option value='01'>มกราคม</option>
                            <option value='02'>กุมภาพันธ์</option>
                            <option value='03'>มีนาคม</option>
                            <option value='04'>เมษายน</option>
                            <option value='05'>พฤษภาคม</option>
                            <option value='06'>มิถุนายน</option>
                            <option value='07'>กรกฎาคม</option>
                            <option value='08'>สิงหาคม</option>
                            <option value='09'>กันยายน</option>
                            <option value='10'>ตุลาคม</option>
                            <option value='11'>พฤศจิกายน</option>
                            <option value='12'>ธันวาคม</option>
                          </select> </td>
                        <td width='10%'><font color='#000000'>ปี (พ.ศ.)</font></td>
                        <td width='50%'> <input type='text' name='birthYear' size='4' class='text_box' value='' maxlength='4'>	
                        </td>
                      </tr>
                    </table></td>
                </tr>
              </table>
              <br> <br> <table width='96%' border='0' cellspacing='0' cellpadding='0'>
                <tr> 
                  <td colspan='3' height='25'><font color='#999999'><b><font size='3'>ข้อมูลติดต่อกับท่าน</font> 
                    </b> </font></td>
                </tr>
                <tr> 
                  <td colspan='3' height='2' bgcolor='#CBE7A5'></td>
                </tr>
                <tr valign='middle'> 
                  <td width='26%' height='35'><font color='#000000'>อีเมล์แอดเดรส</font></td>
                  <td width='26%' height='35'><font color='#000000'> 
                    <input type='text' name='eMail' class='text_box' value='' maxlength='50'>
                    </font></td>
                  <td width='48%' height='35'><font color='#999999'>เช่น (abc@yahoo.com) 
                    </font></td>
                  <input type='hidden' name='telMobile' value=''>
                  <input type='hidden' name='mobileAlert' value=''>
                </tr>
                <tr align='center'> 
                  <td colspan='3' height='35'> <input type='image' border='0' name='imageField2' src='PIC/btn_ok.gif' width='51' height='23'>	
                    &nbsp; <a href='#' onClick='document.registration.reset();'>	
                    <img src='PIC/btn_clearT.gif' width='54' height='26' border='0'></a>	
                  </td>
                </tr>
              </table>
              <br> </td>
          </tr>
        </table>
      </form>
      <table width='600' border='0' cellspacing='0' cellpadding='0'>
        <tr> 
          <td bgcolor='#5483E0' height='1'><img src='brokerpage/IPO/images/pic/1pixel.gif' width='1' height='1'></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
