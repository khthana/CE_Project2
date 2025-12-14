#!"C:/Python24/python.exe"
# -*- coding: utf-8 -*-
# changePasswd.py

import cgi
import Cookie
import os
from database import connect_to_db, close_cnnctn_to_db
from function import printHeader, printHeaderAndScript, chkck

from function import server_http, serverhost_db
from function import username_db, password_db, schema_db

############################################################################

def main():
    form = cgi.parse()
    user = chkck()
    if form.has_key("user"):
        if user == form["user"][0]:
            # connect to database and retrieve a cursor
            cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
            connection = cnnct[0]
            cursor = cnnct[1]
            query = "SELECT role FROM memberdata WHERE username = '"
            query += form["user"][0] + "'"    
            cursor.execute(query)
            role = cursor.fetchall()
            # close cursor and connection
            close_cnnctn_to_db(connection, cursor)

            if role[0][0] == "admin":
                printHeaderAndScript()
                print """<table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="4" bgcolor="#FFF3C3" class="tl"><img src="/pic/corner_tl.gif" width="4" height="4"></td>
                <td rowspan="2" bgcolor="#FFF3C3"><font size="+1"><strong>ผู้ดูแลระบบ %s</strong></font> </td>
                <td width="4" bgcolor="#FFF3C3" class="tr"><img src="/pic/corner_tr.gif" width="4" height="4"></td>
              </tr>
              <tr>
                <td width="4" bgcolor="#FFF3C3" class="bl"><img src="/pic/corner_bl.gif" width="4" height="4"></td>
                <td width="4" bgcolor="#FFF3C3" class="br"><img src="/pic/corner_br.gif" width="4" height="4"></td>
              </tr>
            </table>""" % form["user"][0]
            else:
                printHeaderAndScript()
                print """<table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="4" bgcolor="#FFF3C3" class="tl"><img src="/pic/corner_tl.gif" width="4" height="4"></td>
                <td rowspan="2" bgcolor="#FFF3C3"><font size="+1"><strong>ผู้ใช้ %s</strong></font> </td>
                <td width="4" bgcolor="#FFF3C3" class="tr"><img src="/pic/corner_tr.gif" width="4" height="4"></td>
              </tr>
              <tr>
                <td width="4" bgcolor="#FFF3C3" class="bl"><img src="/pic/corner_bl.gif" width="4" height="4"></td>
                <td width="4" bgcolor="#FFF3C3" class="br"><img src="/pic/corner_br.gif" width="4" height="4"></td>
              </tr>
            </table>""" % form["user"][0]
        
            print """
    <table width="800" height="50" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>

      <td width="100" rowspan="2">&nbsp;</td>
      <td width="4" bgcolor="#C3D9FF" class="tl"><img src="/pic/corner_tl.gif" width="4" height="4"></td>
      <td width="346" rowspan="2" bgcolor="#C3D9FF"><strong>&nbsp;&nbsp;&nbsp;ระบบเก็บฐานข้อมูลลายมือเขียนภาษาไทย</strong></td>
      <form method="post" action="/cgi-bin/changePasswd.py">
      <td width="261" rowspan="2" align="right" valign="middle" bgcolor="#C3D9FF">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="แก้ไขข้อมูล">
      </td></form>
      <form method="post" action="/cgi-bin/logout.py">
      <td width="85" rowspan="2" align="center" valign="middle" bgcolor="#C3D9FF">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="ล็อกเอาท์">
      </td></form>
      <td width="4" bgcolor="#C3D9FF" class="tr"><img src="/pic/corner_tr.gif" width="4" height="4"></td>
    </tr>
    <tr>

      <td bgcolor="#C3D9FF" class="bl"><img src="/pic/corner_bl.gif" width="4" height="4"></td>
	  <td bgcolor="#C3D9FF" class="br"><img src="/pic/corner_br.gif" width="4" height="4"></td>
    </tr>
  </table>""" % (form["user"][0], form["user"][0])

            if role[0][0] == "admin":
                print """
        <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="4">&nbsp;</td>
      <td width="68">&nbsp;</td>

      <td width="116">&nbsp;</td>
      <td width="71">&nbsp;</td>
      <td width="131">&nbsp;</td>
      <td width="150">&nbsp;</td>
      <td width="150">&nbsp;</td>
      <td width="77">&nbsp;</td>
      <td width="26">&nbsp;</td>
      <td width="4">&nbsp;</td>
    </tr>

    <tr>
      <form method="post" action="/cgi-bin/admin.py">
      <td colspan="2" background="/pic/menu_begin.gif" align="center" valign="top">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="หน้าแรก">
      </td></form>
      
      <form method="post" action="/cgi-bin/userList.py">
      <td align="center" valign="top" background="/pic/menu_bg.gif">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="แสดงรายชื่อผู้ใช้">
      </td></form>

      <form method="post" action="/cgi-bin/addUser.py">
      <td align="center" valign="top" background="/pic/menu_bg.gif">
      <input type="hidden" name="user" value="%s" />
      <input name="action" type="submit" id="action" value="เพิ่มผู้ใช้">
      </td></form>
      
      <form method="post" action="/cgi-bin/previewAll.py">
      <td background="/pic/menu_bg.gif" align="center" valign="top">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="แสดงลายมือทั้งหมด">
      </td></form>
      
      <form method="post" action="/cgi-bin/sendNews.py">
      <td background="/pic/menu_bg.gif" align="center" valign="top">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="แจ้งข่าวสาร">
      </td></form>

      <td background="/pic/menu_bg.gif" align="center" valign="top"></td>
      <td background="/pic/menu_bg.gif" align="center" valign="top">&nbsp;</td>
      <td background="/pic/menu_bg.gif">&nbsp;</td>

      <td colspan="2"><img src="/pic/menu_end2.gif" width="30" height="30"></td>
    </tr>
    <tr>
      <td colspan="10" background="/pic/body_bg_800.gif">&nbsp;</td>
    </tr>
  </table>""" % (form["user"][0], form["user"][0], form["user"][0], form["user"][0], form["user"][0])
        
            else:
                user = "?user="
                user += form["user"][0]
                print """
        <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="4">&nbsp;</td>
      <td width="71">&nbsp;</td>
      <td width="111">&nbsp;</td>

      <td width="131">&nbsp;</td>
      <td width="169">&nbsp;</td>
      <td width="106">&nbsp;</td>
      <td width="75">&nbsp;</td>
      <td width="103">&nbsp;</td>
      <td width="26">&nbsp;</td>
      <td width="4">&nbsp;</td>
    </tr>
    <tr>
      <form method="post" action="/cgi-bin/user.py">
      <td colspan="2" background="/pic/menu_begin.gif" align="center" valign="top">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="หน้าแรก">
      </td></form>
      
      <form><td background="/pic/menu_bg.gif" align="center" valign="top">
      <input type="button" onClick="return popup('/HandWritingApplet.html%s', 'notes')" value="เพิ่มลายมือเขียน" />
      </td></form>
      
      <form method="post" action="/cgi-bin/previewAll.py">
      <td align="center" valign="top" background="/pic/menu_bg.gif">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="แสดงลายมือทั้งหมด">
      </td></form>
      
      <form method="post" action="/cgi-bin/previewAll.py">
      <td background="/pic/menu_bg.gif" align="center" valign="top">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="แสดงลายมือของฉันทั้งหมด">
      </td></form>
      
      <td background="/pic/menu_bg.gif" align="center" valign="top"></td>
      <td background="/pic/menu_bg.gif" align="center" valign="top">&nbsp;</td>
      <td background="/pic/menu_bg.gif">&nbsp;</td>
      <td colspan="2"><img src="/pic/menu_end2.gif" width="30" height="30"></td>
    </tr>

    <tr>
      <td colspan="10" background="/pic/body_bg_800.gif">&nbsp;</td>
    </tr>
  </table>""" % (form["user"][0], user, form["user"][0], form["user"][0])

            print """
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td colspan="10" background="/pic/body_bg_800.gif">"""

            if not form.has_key("oldPass") or not form.has_key("newPass") or not form.has_key("confmPass") or \
               not form.has_key("email"):
                if not form.has_key("email"):
                    # connect to database and retrieve a cursor
                    cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
                    connection = cnnct[0]
                    cursor = cnnct[1]

                    query = "SELECT email FROM memberdata WHERE username = '"
                    query += form["user"][0] + "'"
                    cursor.execute(query)
                    output = cursor.fetchall()
                    # close cursor and connection
                    close_cnnctn_to_db(connection, cursor)
                    email = output[0][0]
                else:
                    email = form["email"][0]
        
                print """
		<table align="center">
                    <form action="/cgi-bin/changePasswd.py" method="post">
                        <tr><td width="120">อีเมล์</td><td><input type="text" name="email" value="%s" /></td></tr>
                        <tr><td></td><td></td></tr>
                        <tr><td><strong>แก้ไขรหัสผ่าน :</strong></td><td></td></tr>
			<tr><td width="120">รหัสผ่านเก่า</td><td><input type="password" name="oldPass" /></td></tr>
			<tr><td>รหัสผ่านใหม่</td><td><input type="password" name="newPass" /></td></tr>
			<tr><td>ยืนยันรหัสผ่าน</td><td><input type="password" name="confmPass" /></td></tr>
			<tr><td colspan="2" align="right"><input type="submit" name="action" value="ตกลง" /></td></tr>
        <input type="hidden" name="user" value="%s" />
        </table></form>""" % (email, form["user"][0])
        
                if form["action"][0] == "ตกลง":
                    print """<center><font color="red">กรุณาใส่ข้อมูลให้ครบ<font></center>"""
            

            else:          
                # connect to database and retrieve a cursor
                cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
                connection = cnnct[0]
                cursor = cnnct[1]

                query = "SELECT passwd FROM memberdata WHERE username = '"
                query += form["user"][0] + "'"
                cursor.execute(query)
                oldPass = cursor.fetchall()  # get oldPass
        
                # close cursor and connection
                close_cnnctn_to_db(connection, cursor)

                if oldPass[0][0] == form["oldPass"][0] and form["newPass"][0] == form["confmPass"][0]:
                    # connect to database and retrieve a cursor
                    cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
                    connection = cnnct[0]
                    cursor = cnnct[1]

                    query = "UPDATE memberdata SET passwd = '"
                    query += form["newPass"][0] + "', email = '" + form["email"][0] + \
                     "' WHERE username = '" + form["user"][0] + "'"
                    cursor.execute(query)
                    connection.commit()
            
                    # close cursor and connection
                    close_cnnctn_to_db(connection, cursor)
                    print """<center><font color="green">ข้อมูลถูกเปลี่ยนเรียบร้อยแล้ว</font></center>"""
                else:
                    print """<table align="center">
            <form action="/cgi-bin/changePasswd.py" method="post">
                        <tr><td width="120">อีเมล์</td><td><input type="text" name="email" value="%s" /></td></tr>
                        <tr><td></td><td></td></tr>
                        <tr><td><strong>แก้ไขรหัสผ่าน :</strong></td><td></td></tr>
			<tr><td width="120">รหัสผ่านเก่า</td><td><input type="password" name="oldPass" /></td></tr>
			<tr><td>รหัสผ่านใหม่</td><td><input type="password" name="newPass" /></td></tr>
			<tr><td>ยืนยันรหัสผ่าน</td><td><input type="password" name="confmPass" /></td></tr>
			<tr><td colspan="2" align="right"><input type="submit" name="action" value="ตกลง" /></td></tr>
        <input type="hidden" name="user" value="%s" />
        </form></table>""" % (form["email"][0], form["user"][0])
                    print """<center><font color="red">รหัสผ่านไม่ถูกต้อง หรือรหัสยืนยันไม่ตรงกับรหัสผ่านใหม่<font></center>"""
            
            
            print """
      </td>
      
    </tr>
    
    <tr>
      <td colspan="10" background="/pic/body_bg_800.gif">&nbsp;</td>
    </tr>
  <tr>

    <td width="71" align="center" valign="bottom" background="/pic/menu_begin_canvas.gif">&nbsp;</td>
    <td width="116" align="center" valign="bottom" background="/pic/menu_bg_canvas.gif">&nbsp;</td>

    <td width="500" background="/pic/menu_bg_canvas.gif">&nbsp;</td>
    <td width="83" background="/pic/menu_bg_canvas.gif">&nbsp;</td>
    <td width="30" class="tr"><img src="/pic/menu_end2_canvas.gif" width="30" height="30"></td>
  </tr>
  </table>"""

            print """
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#C3D9FF">
    <tr>
      <td class="tl"><img src="/pic/corner_tl.gif" width="4" height="4"></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>

      <td class="tr"><img src="/pic/corner_tr.gif" width="4" height="4"></td>
    </tr>
    <tr>
      <td class="bl"><img src="/pic/corner_bl.gif" width="4" height="4"></td>
      <td>&nbsp;</td>
      <td>&nbsp;</td>
      <td class="br"><img src="/pic/corner_br.gif" width="4" height="4"></td>
    </tr>
</table>"""


            print """</body></html>"""

        else:
            print "Location: http://%s/index.html\n\n" % server_http
    else:
        print "Location: http://%s/index.html\n\n" % server_http 

main()
