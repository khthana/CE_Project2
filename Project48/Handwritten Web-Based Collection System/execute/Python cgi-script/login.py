#!"C:/Python24/python.exe"

import os
import cgi
import Cookie
import MySQLdb

from function import server_http, serverhost_db
from function import username_db, password_db, schema_db

form = cgi.FieldStorage()

if (form.has_key( "user" ) and form.has_key("password")):
    user_n = cgi.escape(form["user"].value)
    pass_w = cgi.escape(form["password"].value)

    # connect to database and retrieve a cursor
    try:
        connection = MySQLdb.connect( host=serverhost_db ,user=username_db, passwd=password_db, db=schema_db )	

    # error connecting to database
    except MySQLdb.OperationalError, error:
        sys.exit( 1 )

    # retrieve cursor
    else:
        cursor = connection.cursor()
        cursor.execute( "SET NAMES UTF8" )

    # query all records 
    selectStr = "select * from memberdata  where username = '%s' and passwd = '%s' " % ( user_n, pass_w)
    cursor.execute(selectStr)
    output = cursor.fetchall()
    row = cursor.rowcount
            
    # incorrect username or password
    if row == 0:
        warningMsg = "รหัสผู้ใช้หรือรหัสผ่านไม่ถูกต้อง"	
    else:

        # Create a cookie dictionary object
        c1 = Cookie.Cookie()

        # Create a cookie in c1
        # This will be temporary and will disappear when the session is closed
        c1["user_id"] = user_n
        # The RFC says you should always set this but it seems to work ok without it
        c1["user_id"]["version"] = 1
        # Make the browser store it for one hour
        c1["user_id"]["max-age"] = 3600		# Time to keep, in seconds (3600=1hr)
        c1["user_id"]["expires"] = 3600		# Obsolete, but Netscape still seems to require it

        # does user visit login page
        c1["visitedp1"] = "1"
        c1["visitedp1"]["max-age"] = 3600	
        c1["visitedp1"]["expires"] = 3600	
        c1["visitedp1"]["version"] = 1

        # Print the headers that sets the cookies
        print c1

        if output[0][3] == "admin":
            location = "Location: http://" + server_http + "/cgi-bin/admin.py?user=%s\n\n" %(user_n)
            print location
            sys.exit( 1 )
        else:
            location = "Location: http://" + server_http + "/cgi-bin/user.py?user=%s\n\n" %(user_n)
            print location
            sys.exit( 1 )
        
        # close cursor and connection
        cursor.close()
        connection.close()

else:
    warningMsg = "กรุณาเติมช่องว่างให้ครบ"


print "Content-type: text/html\n"
print """<html>
<head>
<title>ระบบเก็บฐานข้อมูลลายมือเขียนภาษาไทย</title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-874">
<style type="text/css">
<!--
a:link {
        text-decoration: none;
        color: #000000;
}
a:visited {
        text-decoration: none;
        color: #000000;
}
a:hover {
    text-decoration: none;
    color: #FFAC59;
}
a:active {
        text-decoration: none;
    color: #FFAC59;
}

.form-noindent {background-color: #ffffff; border: #C3D9FF 1px solid}

.tl {padding: 0; width: 4; text-align: left; vertical-align: top}
.tr {padding: 0; width: 4; text-align: right; vertical-align: top}
.bl {padding: 0; width: 4; text-align: left; vertical-align: bottom}
.br {padding: 0; width: 4; text-align: right; vertical-align: bottom}
-->
</style></head>
<body>"""

print """<form name="form1" method="post" action="/cgi-bin/login.py">
<table width="800" height="50" border="0" align="center" cellspacing="0">
    <tr>
    <td width="100" height="30" rowspan="2">&nbsp;</td>
    <td class="tl" width="8" bgcolor="#C3D9FF"><img src="/pic/corner_tl.gif" width="4" height="4"></td>
    <td width="757" rowspan="2" bgcolor="#C3D9FF"><font size="+1"><strong>&nbsp;&nbsp;ระบบเก็บฐานข้อมูลลายมือเขียนภาษาไทย</strong></font></td>
    <td class="tr" width="2" bgcolor="#C3D9FF" align="right" valign="top" style="margin-top: 0px "><img src="/pic/corner_tr.gif" width="4" height="4"  ></td>
    </tr>
    <tr>
    <td class="bl" width="8" bgcolor="#C3D9FF"><img src="/pic/corner_bl.gif" width="4" height="4"></td>
    <td class="br" bgcolor="#C3D9FF" ><img src="/pic/corner_br.gif" width="4" height="4"></td>
    </tr>
</table>
<br>
    <table width="800"  border="0" align="center">
    <tr>
        <td>&nbsp;</td>
        <td><strong>ระบบเก็บฐานข้อมูลลายมือเขียนภาษาไทย</strong></td>
        <td width="260">&nbsp;</td>
    </tr>
    <tr>
        <td width="10">&nbsp;</td>
        <td valign="top"><blockquote>
            </p>
        </blockquote></td>
        <td><table width="100%"  class="form-noindent" >
        <tr>
            <td bordercolor="#C3D9FF" bgcolor="#eeeeee"><table width="250"  border="0" align="center" bgcolor="#F2F2F2">
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2"><div align="center"><strong>เข้าสู่ระบบ HCR</strong></div></td>
            </tr>
            <tr>
                <td width="70"> &nbsp;&nbsp;รหัสผู้ใช้:</td>
                <td><input type="text" name="user"></td>
            </tr>
            <tr>
                <td width="70">&nbsp;&nbsp;รหัสผ่าน:</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td colspan="2"><div align="center"><font color = "#FF6600">"""

print warningMsg

print """</font></div></td>
            </tr>
            <tr>
                <td colspan="2"><div align="center">
                    <input type="submit" name="Submit" value="ลงชื่อเข้าใช้งาน">
                </div></td>
            </tr>
            <tr>
                <td colspan="2"><div align="center"><a href="/cgi-bin/forgetPasswd.py">ลืมชื่อผู้ใช้งานหรือรหัสผ่าน</a></div></td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            </table></td>
        </tr>
        </table>      </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td><table  width="100%" class="form-noindent">
        <tr>
            <td height="65" bordercolor="#C3D9FF" bgcolor="#eeeeee"><div align="center">
                <p>
                <a href="http://161.246.6.161/document.pdf">แนะนำวิธีการใช้งาน</a>				<br>
                            <br>
                                <a href="http://161.246.6.161/about.html">เกี่ยวกับผู้จัดทำ</a>
                                <br>
                    </p>
                </div></td>
            </tr>
          </table></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <br>
      <table width="90%"  border="0" align="center" cellspacing="0">
        <tr>
          <td width="8" height="30" bgcolor="#C3D9FF" class="tl"><img src="/pic/corner_tl.gif" width="4" height="4"></td>
          <td width="757" rowspan="2" bgcolor="#C3D9FF">&nbsp;</td>
          <td class="tr" width="2" bgcolor="#C3D9FF" align="right" valign="top" style="margin-top: 0px "><img src="/pic/corner_tr.gif" width="4" height="4"  ></td>
        </tr>
        <tr>
          <td class="bl" width="8" bgcolor="#C3D9FF"><img src="/pic/corner_bl.gif" width="4" height="4"></td>
          <td class="br" bgcolor="#C3D9FF" ><img src="/pic/corner_br.gif" width="4" height="4"></td>
        </tr>
      </table>
    </form>""" 



print """</body></html>"""



