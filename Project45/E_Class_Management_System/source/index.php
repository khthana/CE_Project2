<?php
session_start();
if($LogOut)
	{
	session_unregister("SESSION");
	session_destroy();
	}
?>
<SCRIPT language=javascript>
/*
 * A JavaScript implementation of the RSA Data Security, Inc. MD5 Message
 * Digest Algorithm, as defined in RFC 1321.
 * Copyright (C) Paul Johnston 1999 - 2000.
 * Updated by Greg Holt 2000 - 2001.
 * See http://pajhome.org.uk/site/legal.html for details.
 */

/*
 * Convert a 32-bit number to a hex string with ls-byte first
 */
var hex_chr = "0123456789abcdefghijklmnopqrstuvwxyz";
function rhex(num)
{
  str = "";
  for(j = 0; j <= 3; j++)
    str += hex_chr.charAt((num >> (j * 8 + 4)) & 0x0F) +
           hex_chr.charAt((num >> (j * 8)) & 0x0F);
  return str;
}

/*
 * Convert a string to a sequence of 16-word blocks, stored as an array.
 * Append padding bits and the length, as described in the MD5 standard.
 */
function str2blks_MD5(str)
{
  nblk = ((str.length + 8) >> 6) + 1;
  blks = new Array(nblk * 16);
  for(i = 0; i < nblk * 16; i++) blks[i] = 0;
  for(i = 0; i < str.length; i++)
    blks[i >> 2] |= str.charCodeAt(i) << ((i % 4) * 8);
  blks[i >> 2] |= 0x80 << ((i % 4) * 8);
  blks[nblk * 16 - 2] = str.length * 8;
  return blks;
}

/*
 * Add integers, wrapping at 2^32. This uses 16-bit operations internally 
 * to work around bugs in some JS interpreters.
 */
function add(x, y)
{
  var lsw = (x & 0xFFFF) + (y & 0xFFFF);
  var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
  return (msw << 16) | (lsw & 0xFFFF);
}

/*
 * Bitwise rotate a 32-bit number to the left
 */
function rol(num, cnt)
{
  return (num << cnt) | (num >>> (32 - cnt));
}

/*
 * These functions implement the basic operation for each round of the
 * algorithm.
 */
function cmn(q, a, b, x, s, t)
{
  return add(rol(add(add(a, q), add(x, t)), s), b);
}
function ff(a, b, c, d, x, s, t)
{
  return cmn((b & c) | ((~b) & d), a, b, x, s, t);
}
function gg(a, b, c, d, x, s, t)
{
  return cmn((b & d) | (c & (~d)), a, b, x, s, t);
}
function hh(a, b, c, d, x, s, t)
{
  return cmn(b ^ c ^ d, a, b, x, s, t);
}
function ii(a, b, c, d, x, s, t)
{
  return cmn(c ^ (b | (~d)), a, b, x, s, t);
}

/*
 * Take a string and return the hex representation of its MD5.
 */
function MD5(str)
{
  x = str2blks_MD5(str);
  var a =  1732584193;
  var b = -271733879;
  var c = -1732584194;
  var d =  271733878;
 
  for(i = 0; i < x.length; i += 16)
  {
    var olda = a;
    var oldb = b;
    var oldc = c;
    var oldd = d;

    a = ff(a, b, c, d, x[i+ 0], 7 , -680876936);
    d = ff(d, a, b, c, x[i+ 1], 12, -389564586);
    c = ff(c, d, a, b, x[i+ 2], 17,  606105819);
    b = ff(b, c, d, a, x[i+ 3], 22, -1044525330);
    a = ff(a, b, c, d, x[i+ 4], 7 , -176418897);
    d = ff(d, a, b, c, x[i+ 5], 12,  1200080426);
    c = ff(c, d, a, b, x[i+ 6], 17, -1473231341);
    b = ff(b, c, d, a, x[i+ 7], 22, -45705983);
    a = ff(a, b, c, d, x[i+ 8], 7 ,  1770035416);
    d = ff(d, a, b, c, x[i+ 9], 12, -1958414417);
    c = ff(c, d, a, b, x[i+10], 17, -42063);
    b = ff(b, c, d, a, x[i+11], 22, -1990404162);
    a = ff(a, b, c, d, x[i+12], 7 ,  1804603682);
    d = ff(d, a, b, c, x[i+13], 12, -40341101);
    c = ff(c, d, a, b, x[i+14], 17, -1502002290);
    b = ff(b, c, d, a, x[i+15], 22,  1236535329);    

    a = gg(a, b, c, d, x[i+ 1], 5 , -165796510);
    d = gg(d, a, b, c, x[i+ 6], 9 , -1069501632);
    c = gg(c, d, a, b, x[i+11], 14,  643717713);
    b = gg(b, c, d, a, x[i+ 0], 20, -373897302);
    a = gg(a, b, c, d, x[i+ 5], 5 , -701558691);
    d = gg(d, a, b, c, x[i+10], 9 ,  38016083);
    c = gg(c, d, a, b, x[i+15], 14, -660478335);
    b = gg(b, c, d, a, x[i+ 4], 20, -405537848);
    a = gg(a, b, c, d, x[i+ 9], 5 ,  568446438);
    d = gg(d, a, b, c, x[i+14], 9 , -1019803690);
    c = gg(c, d, a, b, x[i+ 3], 14, -187363961);
    b = gg(b, c, d, a, x[i+ 8], 20,  1163531501);
    a = gg(a, b, c, d, x[i+13], 5 , -1444681467);
    d = gg(d, a, b, c, x[i+ 2], 9 , -51403784);
    c = gg(c, d, a, b, x[i+ 7], 14,  1735328473);
    b = gg(b, c, d, a, x[i+12], 20, -1926607734);
    
    a = hh(a, b, c, d, x[i+ 5], 4 , -378558);
    d = hh(d, a, b, c, x[i+ 8], 11, -2022574463);
    c = hh(c, d, a, b, x[i+11], 16,  1839030562);
    b = hh(b, c, d, a, x[i+14], 23, -35309556);
    a = hh(a, b, c, d, x[i+ 1], 4 , -1530992060);
    d = hh(d, a, b, c, x[i+ 4], 11,  1272893353);
    c = hh(c, d, a, b, x[i+ 7], 16, -155497632);
    b = hh(b, c, d, a, x[i+10], 23, -1094730640);
    a = hh(a, b, c, d, x[i+13], 4 ,  681279174);
    d = hh(d, a, b, c, x[i+ 0], 11, -358537222);
    c = hh(c, d, a, b, x[i+ 3], 16, -722521979);
    b = hh(b, c, d, a, x[i+ 6], 23,  76029189);
    a = hh(a, b, c, d, x[i+ 9], 4 , -640364487);
    d = hh(d, a, b, c, x[i+12], 11, -421815835);
    c = hh(c, d, a, b, x[i+15], 16,  530742520);
    b = hh(b, c, d, a, x[i+ 2], 23, -995338651);

    a = ii(a, b, c, d, x[i+ 0], 6 , -198630844);
    d = ii(d, a, b, c, x[i+ 7], 10,  1126891415);
    c = ii(c, d, a, b, x[i+14], 15, -1416354905);
    b = ii(b, c, d, a, x[i+ 5], 21, -57434055);
    a = ii(a, b, c, d, x[i+12], 6 ,  1700485571);
    d = ii(d, a, b, c, x[i+ 3], 10, -1894986606);
    c = ii(c, d, a, b, x[i+10], 15, -1051523);
    b = ii(b, c, d, a, x[i+ 1], 21, -2054922799);
    a = ii(a, b, c, d, x[i+ 8], 6 ,  1873313359);
    d = ii(d, a, b, c, x[i+15], 10, -30611744);
    c = ii(c, d, a, b, x[i+ 6], 15, -1560198380);
    b = ii(b, c, d, a, x[i+13], 21,  1309151649);
    a = ii(a, b, c, d, x[i+ 4], 6 , -145523070);
    d = ii(d, a, b, c, x[i+11], 10, -1120210379);
    c = ii(c, d, a, b, x[i+ 2], 15,  718787259);
    b = ii(b, c, d, a, x[i+ 9], 21, -343485551);

    a = add(a, olda);
    b = add(b, oldb);
    c = add(c, oldc);
    d = add(d, oldd);
  }
  return rhex(a) + rhex(b) + rhex(c) + rhex(d);
}

function valid_js() {
   // anything that claims NS 4 or higher functionality better work 
   if (navigator.userAgent.indexOf("Mozilla/") == 0) {
      return (parseInt(navigator.appVersion) >= 4);
   }
   return false;	
}
 
function hash(form,login_url) {
    // this is Javascript enabled browser
    //document.login_form[".js"].value=1;
    // rudimentary check for a 4.x brower. should catch IE4+ and NS4.*
    var url;

    if (arguments.length > 1 && login_url != "") { // in case login_url is not passed in
      url = login_url;
    } else {
      url = "";
    }
    url += "?";
      
    if (valid_js()) {
      var passwd = form.pwd.value;
      var random = form["random"].value;
      var hash2 = MD5(form.pwd.value) + random;
      var hash;
      if(form.pwd.value){
        hash=MD5(hash2);
//        hash=hash2;
      } else {
        hash="";
      }
      var js = 0;

      for(i=0; i<form.elements.length; i++){
        if(form.elements[i].name.length <=0) {
          continue;
        }
        if(i > 0){
          url += "&";
        }
        url += form.elements[i].name;
        url += "=";
        if(form.elements[i].name == "pwd"){
          url += hash;
        } else {
          url += escape(form.elements[i].value);
        }
      }
      // indicate the password is hashed.
    
      //alert("url=" + url);
      location.href=url;
      // prevent from running this again. Allow the server response to submit the form directly
      form.onsubmit=null;

      // abort normal form submission
      return false;
    }
    // allow normal form submission
    return true;
}
	function CheckBlank() {
		if(document.login.user.value==''){
			alert("  กรุณากรอก  username ก่อนการ login");
					document.login.user.focus();
			return false;
		 }
		 else if(document.login.pwd.value==''){
			alert("  กรุณากรอก  password ก่อนการ login");
					document.login.pwd.focus();
			return false;
		 }
    	else
           return hash(login,'Login.php')
		}		   	  
</SCRIPT>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"><html><!-- InstanceBegin template="/Templates/logo.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>การเรียนการสอนผ่านอินเตอร์เน็ท</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<link rel="stylesheet" href="style.css" >
</head>

<body leftmargin="0" topmargin="0" >
<table width="780" border="0" cellspacing="0" cellpadding="0"  align="center">
  <tr>
    <td width="100%" align="right" valign="top"><img src="./Picture/logo.jpg" width="100%" height="85" align="baseline"></td>
  </tr>
  <tr> 
    <td  valign="top"><table  width="100%" border="0" cellpadding="0" cellspacing="1"   bgcolor="#000000"  class="text">
        <tr bgcolor="#336699" class="text" valign="top"> 
          <td width = "14%" align="center"><strong><a href="index.php" class="nav">Home</a></strong></td>
          <td width = "14%" align="center"><strong><a href="Course1.php" target="_parent" class="nav">Course</a></strong></td>
          <td width = "13%" align="center"><strong><a href="Headline.php?status=all" target="_parent" class="nav">News</a></strong></td>
          <td width="14%" align="center"><strong><a href="FrmSearch.php" target="_parent" class="nav">Search</a></strong></td>
          <td width="16%" align="center"><strong><a href="MeansUse.php" target="_blank" class="nav">FAQ</a></strong></td>
          <td width = "12%" align="center"><strong><a href="about.php" class="nav">About</a></strong></td>
          <td width = "17%" align="center"><strong><a href="index.php?LogOut=yes" class="nav">Logout</a></strong></td>
        </tr>
      </table></td>
  </tr>
  <tr valign="top">
    <td width="100%"  valign="top" height="100%"><!-- InstanceBeginEditable name="data" -->
	<?php require('./libraries/grab_globals.lib.php'); ?>
<table width="100%" height="100%"   border="0" cellpadding="0" cellspacing="0"  bgcolor="#F8FAFF">
        <tr valign="top"> 
          <td width="206"  valign="top" height="100%" align="left"><table width="90%"  border="0" cellspacing="8" cellpadding="0" >
              <tr>
                <td><br><form name="login" method="post" action="Login.php" >
						<input name="random" type="hidden" value="771166743">
					<TABLE cellSpacing=0 cellPadding=0 width=170 border=0>
                    <TBODY>
                      <TR> 
                        <TD vAlign=top align=left><img src="Picture/cn_login1.gif" width="6" height="6"></TD>
                        <TD vAlign=top bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=0 width=168 border=0>
                            <TBODY>
                              <TR> 
                                <TD bgColor=#909090><img src="Picture/dot.gif"  height="1" width="1"></TD>
                              </TR>
                              <TR> 
                                <TD bgColor=#dedede><img src="Picture/dot.gif"  height="1" width="1"></TD>
                              </TR>
                            </TBODY>
                          </TABLE></TD>
                        <TD vAlign=top align=right><img src="Picture/cn_login2.gif" width="6" height="6"></TD>
                      </TR>
                      <TR> 
                        <TD colSpan=3> <TABLE cellSpacing=0 cellPadding=0 width=180 border=0>
                            <TBODY>
                              <TR> 
                                <TD width=1 bgColor=#909090><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                <TD width=5 bgColor=#dedede><img src="Picture/dot.gif"  height="2" width="5"></TD>
                                <TD bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=1 width="100%" 
border=0 class="text">
                                      <TBODY>
                                        <TR> 
                                          <TD align=right><FONT class=text 
                              face="MS Sans Serif, Thonburi" 
                              size=1>username:</FONT></TD>
                                          <TD><INPUT maxLength=12 size=12 name= user > 
                                          </TD>
                                        </TR>
                                        <TR> 
                                          <TD align=right><FONT class=text 
                              face="MS Sans Serif, Thonburi" 
                              size=1>password:</FONT></TD>
                                          <TD><INPUT type=password maxLength=12 size=12 
                              name=pwd> </TD>
                                        </TR>
                                        <TR> 
                                          <TD height="21" colSpan=2 align=right>
<input  value="ok" type="image"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','./Picture/login1.gif',1)" img src="./Picture/login.gif" name="Image1" width="45" height="16" border="0" onClick="return CheckBlank()">
                                            &nbsp; </TD>
                                        </TR>
                                        <TR> 
                                          <TD  align="left" colSpan=2  class="text"><img src="Picture/bullet.gif" width="9" height="9"> <a href= "FrmRePw.php"> 
                                            ลืมรหัสผ่าน</a></TD>
                                        </TR>
                                        <TR>
                                          <TD  align="left" colSpan=2  class="text"><img src="Picture/bullet.gif"  width="9" height="9"> <a href="javascript:%20void%20window.open('Frm_InsTea.php','ins_tea','scrollbars=1,width =650,height=500,top = 20,left=100')">สมัครสมาชิก: 
                                            อาจารย์</a></TD>
                                        </TR>
                                        <TR>
                                          <TD  align="left" colSpan=2  class="text"><img src="Picture/bullet.gif"  width="9" height="9"> <a href="javascript:%20void%20window.open('Frm_InsStu.php','ins_stu','scrollbars=1,width =650,height=500,top = 20,left=100')">สมัครสมาชิก: 
                                            นักเรียน</a> &nbsp;</TD>
                                        </TR>
                                      </TBODY>
                                    </TABLE></TD>
                                <TD width=5 bgColor=#dedede><img src="Picture/dot.gif"  height="9" width="8"></TD>
                                <TD width=1 bgColor=#909090><img src="Picture/dot.gif"  height="2" width="1"></TD>
                              </TR>
                            </TBODY>
                          </TABLE></TD>
                      </TR>
                      <TR> 
                        <TD vAlign=bottom align=left><img src="Picture/cn_login3.gif" width="6" height="6"></TD>
                        <TD vAlign=bottom bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=0 width=168 border=0>
                            <TBODY>
                              <TR> 
                                <TD bgColor=#dedede><img src="Picture/dot.gif"  height="1" width="1"></TD>
                              </TR>
                              <TR> 
                                <TD height="2" bgColor=#909090><img src="Picture/dot.gif"  height="1" width="1"></TD>
                              </TR>
                            </TBODY>
                          </TABLE></TD>
                        <TD vAlign=bottom align=right><img src="Picture/cn_login4.gif" width="6" height="6"></TD>
                      </TR>
                    </TBODY>
                  </TABLE></form></td>
				 </tr>
				 <tr>
				 	<td><form name="search" method="post" action="FrmSearch.php" >
                    <TABLE cellSpacing=0 cellPadding=0 width=180 border=0>
                      <TBODY>
                        <TR> 
                          <TD vAlign=top align=left><img src="Picture/cn_login1.gif" width="6" height="6"></TD>
                          <TD vAlign=top bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=0 width=168 border=0>
                              <TBODY>
                                <TR> 
                                  <TD bgColor=#909090><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                </TR>
                                <TR> 
                                  <TD bgColor=#dedede><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                </TR>
                              </TBODY>
                            </TABLE></TD>
                          <TD vAlign=top align=right><img src="Picture/cn_login2.gif" width="6" height="6"></TD>
                        </TR>
                        <TR> 
                          <TD colSpan=3> <TABLE cellSpacing=0 cellPadding=0 width=180 border=0>
                              <TBODY>
                                <TR> 
                                  <TD width=1 height="72" bgColor=#909090><img src="/Picture/dot.gif"  height="1" width="1"></TD>
                                  <TD width=5 bgColor=#dedede><img src="/Picture/dot.gif"  height="8" width="8"></TD>
                                  <TD bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=1 width="100%" 
border=0 class="text">
                                      <TBODY>
                                        <TR> 
                                          <TD align=center  class="text"><select name="select">
                                              <option value="default">choose one</option>
                                              <option value="CourseName">ชื่อวิชา</option>
                                              <option value="Teacher">ชื่ออาจารย์</option>
                                              <option value="Faculty">ชื่อคณะ</option>
                                              <option value="Department">ชื่อสาขา</option>
                                            </select> <font color="#FF0000">หัวข้อค้นหา</font></TD>
                                        </TR>
                                        <TR> 
                                          <TD align=center><input  size=22 name= SearchName value="" > 
                                          </TD>
                                        </TR>
                                        <TR> 
                                          <TD  align=right><input type="hidden" name="hidden" value="work"> 
                                         <input  value="ok" type="image"  onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','./Picture/search1.gif',1)" img src="./Picture/search.gif" name="Image2" width="45" height="16" border="0" >
                                            &nbsp; </TD>
                                        </TR>
                                        <TR> 
                                          <TD  align="left"  class="text"> </TD>
                                        </TR>
                                      </TBODY>
                                    </TABLE></TD>
                                  <TD width=5 bgColor=#dedede><img src="/Picture/dot.gif"  height="9" width="8"></TD>
                                  <TD width=1 bgColor=#909090><img src="/Picture/dot.gif"  height="2" width="1"></TD>
                                </TR>
                              </TBODY>
                            </TABLE></TD>
                        </TR>
                        <TR> 
                          <TD vAlign=bottom align=left><img src="Picture/cn_login3.gif" width="6" height="6"></TD>
                          <TD vAlign=bottom bgColor=#dedede> <TABLE cellSpacing=0 cellPadding=0 width=168 border=0>
                              <TBODY>
                                <TR> 
                                  <TD bgColor=#dedede><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                </TR>
                                <TR> 
                                  <TD bgColor=#909090><img src="Picture/dot.gif"  height="1" width="1"></TD>
                                </TR>
                              </TBODY>
                            </TABLE></TD>
                          <TD vAlign=bottom align=right><img src="Picture/cn_login4.gif" width="6" height="6"></TD>
                        </TR>
                      </TBODY>
                    </TABLE>
                  </form>
					</td>
				 </tr>
            </table>        
            
          </td>
          <td width="570" valign="top" height="100%">
		  <table width="100%" border="0" cellpadding="0" cellspacing="8" align="center" >
		  <tr>
		        <td align="center"><br>
		  <table width="96%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td width="11" class="text"><img src="Picture/cn_drk_lt.gif" width="11" height="20"></td>
                      <td width="117" class="normal"  bgcolor="#869DB9"><img src="Picture/icon_news1.gif" width="16" height="18" align="absmiddle" ><font color="#FFFFFF"><strong> 
                        ประกาศข่าว</strong></font></td>
                      <td width="259" class="text" bgcolor="#869DB9">&nbsp;</td>
                      <td width="108" class="text" bgcolor="#869DB9">&nbsp;</td>
                      <td width="11" class="text"><img src="Picture/cn_drk_rt.gif" width="11" height="20"></td>
                    </tr>
                    <tr> 
                      <td colspan="5"><?php  include("./Headline.php"); ?>
                      </td>
                    </tr>
                    <tr class="text"> 
                      <td><img src="Picture/cn_drk_llt.gif" width="11" height="19"></td>
                      <td bgcolor="#869DB9" >&nbsp;</td>
                      <td bgcolor="#869DB9">&nbsp;</td>
                      <td bgcolor="#869DB9">&nbsp;</td>
                      <td><img src="Picture/cn_drk_lrt.gif" width="11" height="19"></td>
                    </tr>
                    <tr> 
                      <td colspan="5"><hr  size="2"  width="80%"noshade></td>
                    </tr>
                    <tr> 
                      <td colspan="2" align"left" class="text"><a href="Headline.php?status=all"  target="_parent">ดูประกาศทั้งหมด</a></td>
                      <td class="text" align"left" width="259">&nbsp;</td>
                      <td colspan="2" align="right" class="text" colspna="2"><font color="#FF0000">ประกาศข่าว</font>&nbsp;<a href="javascript:%20void%20window.open('News.php','name','width=500,height=400,top=50,left=100');">คลิ๊ก 
                        &nbsp;&nbsp; </a></td>
                    </tr>
                  </table>
</td></tr></table>		
</td>
        </tr>
		<tr>
		  <td height="20" colspan="2" align="center" class="text">
		  <table width="100%" border="0" cellspacing="0" cellpadding="0" >
  <tr >
                <td align="center" class="text" > <font color="#0033FF">ส่งคำติได้ที่ 
                  <a href="mailto: i_num_pg@hotmail.com" >i_num_pg@hotmail.com</a></font></td>
  </tr>
</table>
</td>
        </tr>
      </table>
      <!-- InstanceEndEditable --></td>
  </tr>
 </table>
</body>
<!-- InstanceEnd --></html>
<script language="JavaScript">
	function MM_swapImgRestore() { //v3.0
	  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
	}
	
	function MM_preloadImages() { //v3.0
	  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
		var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
		if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
	}
	function MM_findObj(n, d) { //v4.01
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
		d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	 if(!x && d.getElementById) x=d.getElementById(n) ; return x;
	}
	
	function MM_swapImage() { //v3.0
	  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
	   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
	}
</script>