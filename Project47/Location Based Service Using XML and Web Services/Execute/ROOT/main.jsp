<%@ page contentType="text/html; charset=TIS-620" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Web Map Service</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-size: x-small;
}
.style2 {color: #FFFFFF}
-->
</style>
</head>
<body bgcolor="#F8F8F8" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/biz_03.gif">
      <tr>
        <td><table width="795" border="0" cellpadding="0" cellspacing="0">
          <tr valign="top">
            <td width="519"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td valign="top"><a href="index.htm"><img src="images/biz_01.gif" width="519" height="93" border="0"></a></td>
              </tr>
              <tr>
                <td valign="top"><img src="images/biz_12.gif" width="519" height="19"></td>
              </tr>
            </table></td>
            <td width="276"><table width="276" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="276"><img src="images/biz_02.gif" width="276" height="42"></td>
              </tr>
              <tr>
                <td><table width="276" border="0" cellpadding="0" cellspacing="0">
                    <tr valign="top">
                      <td width="54"><a href="#"><img src="images/sbut_home.gif" alt="Home" width="54" height="51" border="0"></a></td>
                      <td width="10"><img src="images/biz_05.gif" width="10" height="51"></td>
                      <td width="54"><a href="#"><img src="images/sbut_search.gif" alt="Site Search" width="54" height="51" border="0"></a></td>
                      <td width="10"><img src="images/biz_07.gif" width="10" height="51"></td>
                      <td width="54"><a href="#"><img src="images/sbut_contact.gif" alt="Contact us" width="54" height="51" border="0"></a></td>
                      <td width="10"><img src="images/biz_09.gif" width="10" height="51"></td>
                      <td width="54"><a href="#"><img src="images/sbut_faq.gif" alt="Faq" width="54" height="51" border="0"></a></td>
                      <td width="30"><img src="images/biz_11.gif" width="30" height="51"></td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr>
                <td><img src="images/biz_13.gif" width="276" height="19"></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/biz_20.gif">
      <tr>
        <td valign="top">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="700" height="400"  border="0" align="center" bgcolor="#33CCFF">
      <tr>
        <td width="500"><table width="420" height="400"  border="0" align="center">
          <tr>
            <td height="260"><img src="images/thailand.gif" width="402" height="254"></td>
          </tr>
          <tr>
            <td><p>Web Map Service เป็นบริการที่ช่วยในการระบุตำแหน่งของผู้ใช้งาน โดยคุณสามารถค้นหาข้อมูลสถานที่, ข้อมูลบุคคล, จัดเก็บข้อมูลส่วนตัว และสามารถแสดงแผนที่ใน format ต่างๆ ได้เช่น gml, svg, jpg</p>
              <p align="center"><a href="signup.jsp">คลิ๊กที่นี่เพื่อทำการสมัครสมาชิก</a><br>
                </p></td>
          </tr>
        </table></td>
        <td>
		  <form method="post" action="check-signin.jsp">
		  <table width="200" height="400"  border="0" align="center" bgcolor="#0862F7">
          <tr>
            <td align="right" valign="top"><p class="style2">กรุณาทำการ sign in เพื่อเข้าใช้บริการครับ </p>
              <hr>
              <p class="style1">Plese enter your ID and Password</p>              <table width="100%"  border="0">
                <tr>
                  <td width="48%"><div align="right"><span class="style1">User ID</span></div></td>
                  <td width="52%"><div align="right">
                    <input name="user" type="text" size="10" maxlength="10">
                  </div></td>
                </tr>
                <tr>
                  <td><div align="right"><span class="style1">Password</span></div></td>
                  <td><div align="right">
                    <input name="password" type="password" size="10" maxlength="10">
                  </div></td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td align="right"><span class="style1">
                    <input name="submit" type="submit" id="submit" value="Sign In">
                  </span></td>
                </tr>
              </table>
			  </form
              <p>&nbsp;</p>
              <hr></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0" background="images/biz_33.gif">
      <tr>
        <td><img src="images/biz_32.gif" width="795" height="41" border="0" usemap="#navbar"></td>
      </tr>
    </table></td>
  </tr>
</table>
<map name="navbar">
<area shape="rect" coords="10,15,41,28" href="#" alt="Home">
<area shape="rect" coords="48,15,82,27" href="#" alt="About">
<area shape="rect" coords="91,16,139,26" href="#" alt="Services">
<area shape="rect" coords="149,15,192,27" href="#" alt="Contact">
<area shape="rect" coords="201,16,247,26" href="#" alt="Support">
</map>
</body>
</html>		