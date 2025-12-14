<%@ page contentType="text/html; charset=windows-874" language="java" %>
<%@ page import="java.sql.*"%>
<%@ page import="com.ora.jsp.util.*" %>
<%@ taglib uri="/j3ptaglib" prefix="j3pJSP" %>

<html><head><title>ยินดีต้อนรับสู่ ห้องสมุดส่วนกลาง</title><meta http-equiv="Content-Type" content="text/html; charset=windows-874"></head>
<script language="JavaScript1.2">


if (document.all||document.getElementById){
var thetitle=document.title
document.title=''
}


var data="สวัสดีค่ะ ยินดีต้อนรับทุกๆท่านสู่ thaijava43 , ขอบคุณที่มาเยี่ยมเรา , C U AGAIN";

var done=1;
function statusIn(text){
	decrypt(text,2,1);
}

function statusOut(){
self.status='';
done=1;
}

//-------------------------\\
//decrypt(string, int, int)\\
//-------------------------\\
//
//text(string): the text to be decrypted on 
//the status bar.
//
//max(int): the number of times a random string
//is displayed before the next character is
//'decrypted'.
//
//delay(int): the number of milliseconds between
//each display of a random string
//
//Example:
//decrypt('Enter my site.',10,10);
//
//text = 'Enter my site.' :: 'Enter my site.' is 
//eventually decrypted
//
//max = 10 :: a different random string is dis-
//played 10 times before a new character is
//decrypted

function decrypt(text, max, delay){
	if (done){
		done = 0;
		decrypt_helper(text, max, delay,  0, max);
		}
	
}

function decrypt_helper(text, runs_left, delay, charvar, max){
	if (!done){
	runs_left = runs_left - 1;
	var status = text.substring(0,charvar);
	for(var current_char = charvar; current_char < text.length; current_char++){
		status += data.charAt(Math.round(Math.random()*data.length));
		}
	document.title = status;
	var rerun = "decrypt_helper('" + text + "'," + runs_left + "," + delay + "," + charvar + "," + max + ");"
	var new_char = charvar + 1;
	var next_char = "decrypt_helper('" + text + "'," + max + "," + delay + "," + new_char + "," + max + ");"
	if(runs_left > 0){
		setTimeout(rerun, delay);
		}
	else{
		if (charvar < text.length){
			setTimeout(next_char, Math.round(delay*(charvar+3)/(charvar+1)));
			}
		else
			{
			done = 1;
			}
		}
	}
}

//if IE 4+ or NS 6+
if (document.all||document.getElementById)
statusIn(thetitle)
</script>
<script>
<!-- START HIDE

// Set all needed variables
var curmes = 0
var a = 0
var counter = 0
var message = new Array()
message[0] = "สวัสดีค่ะ "
message[1] = "ยินดีต้อนรับสู่ ระบบบริการเครือข่ายห้องสมุดโดยใช้เทคโนโลยีเว็บเซอร์วิส"
message[2] = "ขอบคุณที่เยี่ยมชม , แนะนำ หรือติชม "
var temp = ""
function typew()
{
a = a + 1
check()
window.status = message[curmes].substring(0, a)
if(a == message[curmes].length + 5)
{
curmes = curmes + 1
a = 0
}
if(curmes > 2)
{
curmes = 0
}
counter = setTimeout("typew()", 100)
}
function check()
{
if(a <= message[curmes].length)
{
if(message[curmes].substring(a, a + 1) == "")
{
a = a + 1
check()
}
}
}
// STOP HIDE -->
</script>
<body background="BG2 copy.jpg" onload=typew()>
<table width="100%" border="0">
  <tr> 
    <td colspan="2"><div align="center"><font size="+3"> ระบบบริการเครือข่ายห้องสมุด</font></div></td>
  </tr>
  <tr> 
    <td colspan="2"><table width="100%" border="0">
        <tr> 
          <td width="19%"><div align="center"><font size="-2"><strong><font color="#FFFF99" size="-1"><script language="javascript">
now = new Date(); 
var thday = new Array ("อาทิตย์","จันทร์",
"อังคาร","พุธ","พฤหัส","ศุกร์","เสาร์"); 
var thmonth = new Array ("มกราคม","กุมภาพันธ์","มีนาคม",
"เมษายน","พฤษภาคม","มิถุนายน", "กรกฎาคม","สิงหาคม","กันยายน",
"ตุลาคม","พฤศจิกายน","ธันวาคม"); 

document.write("วัน" + thday[now.getDay()]+ "ที่ "+ now.getDate()+ " " + 
thmonth[now.getMonth()]+ " " + (0+now.getYear()+543));
</script></font></strong></font></div></td>
          <td width="81%"><table width="100%" border="0">
              <tr> 
                <td width="37%">&nbsp;</td>
                <td width="10%">&nbsp;</td>
                <td width="13%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                    <param name="movie" value="button12.swf">
                    <param name="quality" value="high">
                    <param name="base" value=".">
                    <embed src="button12.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
                  </object></td>
                <td width="13%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                    <param name="movie" value="button13.swf">
                    <param name="quality" value="high">
                    <param name="base" value=".">
                    <embed src="button13.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
                  </object></td>
                <td width="13%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                    <param name="movie" value="button14.swf">
                    <param name="quality" value="high">
                    <param name="base" value=".">
                    <embed src="button14.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
                  </object></td>
                <td width="14%"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0" width="100" height="20">
                    <param name="movie" value="button56.swf">
                    <param name="quality" value="high">
                    <param name="base" value=".">
                    <embed src="button56.swf" base="."  quality="high" pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="100" height="20" ></embed> 
                  </object></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td width="30%" height="270" ><form name="form1" method="post" action="page_one.jsp">
        <table width="100%" border="0">
          <tr> 
                                                <td><strong><font color="#FF6633">ชื่อล็อกอิน</font></strong></td>
            <td> <input name="username" type="text" id="username" size="25" maxlength="20"> 
            </td>
          </tr>
          <tr> 
            <td><strong><font color="#FF6633">รหัสผ่าน</font></strong></td>
            <td> <input name="password" type="password" id="password" size="25" maxlength="20"> 
            </td>
          </tr>
          <tr> 
            <td colspan="2"> <div align="center"> 
                <label><strong><font color="#000000">@Library</font></strong></label>
                <select name="library">
                  <option value="ABC">ABC</option>
                  <option value="XYZ">XYZ</option>
                </select>
                                                                <input name="session" type="hidden" id="session" value="<%=session.getId()%>">
                                                                <p> 
                  <input type="submit" name="Submit" value="เข้าสู่ระบบ">
                </p>
              </div></td>
          </tr>
        </table>
        <p> <jsp:useBean id="errorMessages" scope="request" class="java.util.Vector"/>
	<%
	    if(errorMessages.size()>0){
	%><ul>
          <em><font color="red" size="+2" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
          <strong><j3pJSP:loop name="errorMessages" loopId="msg" className="String" > 
          </j3pJSP:loop></strong><j3pJSP:loop name="errorMessages" loopId="msg" className="String" > 
          <li> <strong><%= msg %></strong></li>
          </j3pJSP:loop> </font></em> 
        </ul>
	<% ;}
	%></p>
      </form>
      <form name="form3" method="post" action="registry1.jsp">
        <table width="100%" border="0">
          <tr> 
            <td><div align="center"><strong>ลงทะเบียนสำหรับผู้ใช้</strong></div></td>
          </tr>
          <tr> 
            <td> <div align="center"> 
                <input name="registry2" type="submit" id="registry3" value="     ลงทะเบียน    ">
              </div></td>
          </tr>
        </table>
      </form>
      
    </td>
    <td width="70%" rowspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0" >
        <tr> 
          <td width="70%">&nbsp;</td>
          <td width="30%"><form name="form2" method="post" action="search1.jsp">
              <input name="search" type="submit" id="search" value="ค้นหาสื่อสารนิเทศ">
            </form></td>
        </tr>
        <tr> 
          <td> 
            <table width="80%" border="1" rules="none" bordercolor="#3399CC">
              <tr> 
                <td colspan="3"><div align="center"><font color="#000000"><strong>ประกาศจากส่วนกลางเครือข่ายห้องสมุด</strong></font></div></td>
              </tr>
              <tr> 
                <td width="5%" rowspan="5">&nbsp;</td>
                <td width="90%"> <div align="center"><font color="#6600CC" size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC"> 
                    - ประกาศเปิดบริการห้องสมุด</font></div></td>
                <td width="5%" rowspan="5">&nbsp;</td>
              </tr>
              <tr> 
                <td><div align="center"><font color="#6600CC" size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">- 
                    ข้อแนะนำในการใช้งานระบบห้องสมุด</font></div></td>
              </tr>
              <tr> 
                <td> <div align="center"><font color="#6600CC" size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">- 
                    ตารางรายการฉายภาพยนต์ประจำเดือน</font></div></td>
              </tr>
              <tr> 
                <td> <div align="center"><font color="#6600CC" size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">- 
                                                                                สัมมนาเรื่อง 
                                                                                การประยุกต์ใช้คอมพิวเตอร์ในองค์กร</font></div></td>
              </tr>
              <tr> 
                <td><div align="center"><font color="#6600CC" size="+1" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">- 
                    ประกาศวันหยุดบริการของห้องสมุดประจำปี 2546</font></div></td>
              </tr>
              <tr> 
                <td colspan="3">&nbsp;</td>
              </tr>
            </table>
            <p>&nbsp;</p>
            <table width="80%" border="1" rules="none" bordercolor="#3399FF">
              <tr> 
                <td colspan="3"><div align="center"><strong><font color="#000000" size="-1">ทรัพยากรณ์สารนิเทศ</font></strong></div></td>
              </tr>
              <tr> 
                <td width="5%" rowspan="4"><div align="center"><font face="AngsanaUPC, BrowalliaUPC, CordiaUPC"></font></div></td>
                <td width="90%"><div align="center"><font size="-1"><a href="สถิติทรัพยากรณ์.jsp" name="สถิติทรัพยากร์" onMouseOver="" id="1"><font color="#336699" face="AngsanaUPC, BrowalliaUPC, CordiaUPC" >สถิติจำนวนทรัพยากรณ์สารนิเทศ</font></a></font></div></td>
                <td width="5%" rowspan="4"><div align="center"></div></td>
              </tr>
              <tr> 
                <td><div align="center"><font size="-1"><a href="หนังสือลงทะเบียน.jsp" name="หนังสือลงทะเบียน"><font color="#336699" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หนังสือใหม่ที่ลงทะเบียน</font></a></font></div></td>
              </tr>
              <tr> 
                <td><div align="center"><font size="-1"><a href="หนังสือใหม่์ที่ออกให้บริการ.jsp" name="หนังสือใหม่ที่ออกให้บริการ"><font color="#336699" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">หนังสือใหม่ที่ออกให้บริการ</font></a></font></div></td>
              </tr>
              <tr> 
                <td height="24"><div align="center"><font size="-1"><a href="แนะนำหนังสือ.jsp" name="แนะนำหนังสือใหม่"><font color="#336699" face="AngsanaUPC, BrowalliaUPC, CordiaUPC">แนะนำหนังสือใหม่</font></a></font></div></td>
              </tr>
              <tr> 
                <td colspan="3"><div align="center"></div></td>
              </tr>
            </table>
            <p>&nbsp;</p>
            </form></td>
          <td rowspan="2"><table width="101%" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td colspan="5"><img src="head_blue.jpg" width="231" height="49"></td>
              </tr>
              <tr> 
                <td width="1%" rowspan="7">&nbsp;</td>
                <td colspan="3"><strong><font color="#000000">หน่วยงานที่เกี่ยวข้อง</font></strong></td>
                <td width="9%" rowspan="7"><img src="right_blue.jpg" width="13" height="163"></td>
              </tr>
              <tr> 
                <td width="12%" rowspan="5">&nbsp;</td>
                <td width="61%">&nbsp;</td>
                <td width="17%" rowspan="5">&nbsp;</td>
              </tr>
              <tr> 
                <td><a href="http://www.kmitl.ac.th/administrators/index.html" name="สำนักงานอธิการบดี" onMouseOver="" id="1"><font color="#336699" size="-1" >สำนักงานอธิการบดี</font></a></td>
              </tr>
              <tr> 
                <td><a href="/my_web/library_abc/abc_index.jsp" name="สำนักงานอธิการบดี" onMouseOver="" id="1"><font color="#336699" size="-1" >ห้องสมุด 
                  ABC </font></a></td>
              </tr>
              <tr> 
                <td><a href="http://www.lib.kmitl.ac.th" name="สำนักงานอธิการบดี" onMouseOver="" id="1"><font color="#336699" size="-1" >ห้องสมุด 
                  XYZ </font></a></td>
              </tr>
              <tr> 
                <td><a href="http://www.ce.kmitl.ac.th" name="สำนักงานอธิการบดี" onMouseOver="" id="1"><font color="#336699" size="-1">ภาควิชาคอมพิวเตอร์</font></a></td>
              </tr>
              <tr> 
                <td height="20" colspan="3">&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="5"><img src="bottom_blue.jpg" width="230" height="29"></td>
              </tr>
            </table></td>
        </tr>
        <tr> 
          <td rowspan="2">&nbsp;</td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table></td>
  </tr>
  <tr> 
    <td height="91" >&nbsp;</td>
  </tr>
  <tr> 
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>

</body>
</html>