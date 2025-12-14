<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0062)http://olala05.ce.kmitl.ac.th/magazines/testphp/tempwhite.html -->
<HTML><HEAD><TITLE>Calendar</TITLE>
<style type="text/css">

<!--

body {  margin: 0px  0px; padding: 0px  0px}

a:link { color: #ccffcc; text-decoration: none}

a:visited { color: #CCFFCC; text-decoration: none}

a:active { color: #CCFFCC; text-decoration: underline}

a:hover { color: #CCFFCC; text-decoration: underline}

-->

</style>
<META http-equiv=Content-Type content="text/html; charset=Windows-874">
<META content="MSHTML 5.50.4134.600" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff 
onload="MM_preloadImages('../backup/carblue.gif','../backup/sendpink.gif','../backup/detailblue.gif','../backup/logoutorg.gif','../backup/docyellow.gif','../backup/addresspink.gif')">
<TABLE width="120%" border=0 cellpadding="0" cellspacing="0">
  <TBODY> 
  <TR>
    <TD height=39>&nbsp;</TD></TR>
  <TR>
    <TD height=8> <img src="../images/label1.gif" width="126" height="54" border="0"> 
      <IMG 
      height=33 src="../images/home.gif" width=90 border=0 
      name=Image1><img name="Image15" border="0" src="../images/document.gif" width="90" height="33"><IMG 
      height=33 src="../images/carlendar.gif" width=90 border=0 
      name=Image2><IMG 
      height=33 src="../images/send.gif" width=90 border=0 
      name=Image4><img name="Image14" border="0" src="../images/address.gif" width="90" height="33"><IMG 
      height=33 src="../images/detail.gif" width=90 border=0 
      name=Image5><IMG 
      height=33 src="../images/logout.gif" width=90 border=0 
      name=Image6></TD>
  </TR>
  <TR> 
    <TD height="18"><img src="../images/bolder2.gif" width="130" height="18"><img src="../images/bolder1.gif" width="630" height="18"></TD>
  </TR>

  <TR vAlign=top align=left>
    <TD>
      <TABLE height=464 width="100%" border=0>
        <TBODY>
        <TR>
          <TD vAlign=top align=left width="15%"> </TD>
          <TD width="79%"> 
            <div align="left">
<form method="post" action="mem_register2.php">
                <table width="60%" border="1" cellspacing="0" cellpadding="0" bordercolorlight="#CCCCCC" bordercolordark="#FF6600">
					<tr><td>
                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr> 
                    <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                          <td colspan="2"> 
                            <div align="center"><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#FF9900">สมัครสมาชิก</font></div>
                    </td>
                    <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                  </tr>
                  <tr> 
                          <td width="5%">&nbsp;</td>
                          <td colspan="2">
                            <div align="center"><img src="../images/login_line.gif" width="300" height="5"> 
                            </div>
                          </td>      <td width="5%">&nbsp;</td>
                  </tr>
                  <tr> 
                          <td width="5%" height="20">&nbsp;</td>
                    <td colspan="2"> 
                      <div align="center"><b><font face="MS Sans Serif, Microsoft Sans Serif" size="3" color="#CC0000"><?
		if ($err=="1")
		{
			echo   "   ชื่อผู้ใช้ นี้มีการใช้แล้วกรุณาเลือกชื่อผู้ใช้ใหม่  ";
		}elseif ($err=="2")
		{
			echo "กรุณาตรวจสอบรหัสผ่าน ที่ใส่อีกครั้ง";
		}elseif($err=="5")
		{
			echo "จำนวนความยาวรหัสผ่านน้อยกว่า 4 ตัวอักษรกรุณาใส่อีกครั้ง";
		}elseif($err=="6")
		{
			echo "จำนวนความยาวชื่อผู้ใช้น้อยกว่า 3 ตัวอักษรกรุณาใส่อีกครั้ง";
		}elseif($err=="7")
		{
			echo "กรุณาแก้ไขชื่อผู้ใช้เนื่องจากมีตัวอักขระ<br>ที่ไม่เหมาะสมอยู่";
		}elseif($err=="8")
		{
			echo "กรุณาแก้ไขรหัสผ่านเนื่องจากมีตัวอักขระ<br> ที่ไม่เหมาะสมอยู่";
		}
?> </font></b> </div>
								</td>
                          <td width="5%" height="20">&nbsp;</td>
                  </tr>
                  <tr> 
                          <td width="5%" height="31">&nbsp;</td>
                          <td width="45%" height="31"> 
                            <div align="center"><b><font color="#FF9900" size="2" face="MS Sans Serif, Microsoft Sans Serif">ชื่อผู้ใช</font><font color="#FF6633" size="2" face="MS Sans Serif, Microsoft Sans Serif">้</font><font color="#FF9900" size="2" face="MS Sans Serif, Microsoft Sans Serif"> 
                              </font></b><font color="#FF9900" size="1" face="MS Sans Serif, Microsoft Sans Serif">(ไม่เกิน 
                              20 ตัวอักษร)</font></div>
                    </td>
                          <td width="45%" height="31"> 
                            <input type="text" name="user" size="20" maxlength="20"
<?
if($user<>"")
{ echo " value=",$user;}
?>
				>
                    </td>
                          <td width="5%" height="31">&nbsp;</td>
                  </tr>
                  <tr> 
                          <td width="5%" height="34">&nbsp;</td>
                    <td width="45%" height="34"> 
                            <div align="center"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#FF9900">รหัสผ่าน</font><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#669966"> 
                              </font></b><font size="1" face="MS Sans Serif, Microsoft Sans Serif" color="#FF9900">(ไม่เกิน 
                              25 ตัวอักษร)</font></div>
                    </td>
                    <td width="45%" height="34"> 
                            <input type="password" name="pass" size="25" maxlength="25">
                    </td>
                          <td width="5%" height="34">&nbsp;</td>
                  </tr>
                  <tr> 
                          <td width="5%">&nbsp;</td>
                    <td width="45%"> 
                            <div align="center"><b><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#FF9900">พิมพ์รหัสผ่านอีกครั้ง 
                              </font><font size="2" face="MS Sans Serif, Microsoft Sans Serif" color="#FF6633"> 
                              </font></b></div>
                    </td>
                    <td width="45%"> 
                            <input type="password" name="pass2" size="25" maxlength="25">
                    </td>
                          <td width="5%">&nbsp;</td>
                  </tr>
                  <tr> 
                          <td width="5%">&nbsp;</td>
                    <td width="45%">&nbsp;</td>
                    <td width="45%">&nbsp;</td>
                          <td width="5%">&nbsp;</td>
                  </tr>
                  <tr> 
                          <td width="5%">&nbsp;</td>
                    <td width="45%">&nbsp;</td>
                    <td width="45%"> 
                      <input type="hidden" name="num_work" value=1>
                      <input type="submit" name="Submit" value="ตกลง">
                    </td>
                          <td width="5%">&nbsp;</td>
                  </tr>
                  <tr> 
                    <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                          <td width="45%">&nbsp;</td>
                          <td width="45%">&nbsp;</td>
                    <td width="5%" bgcolor="#FF9900">&nbsp;</td>
                  </tr>
                </table>
					</td></tr>
					</table>
      </form>

              <table width="95%" height="100%" cellspacing="0" cellpadding="0" >
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
            </div>
          </TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
</BODY>
</HTML>
