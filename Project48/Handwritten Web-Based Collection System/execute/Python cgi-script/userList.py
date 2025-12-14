#!"C:/Python24/python.exe"
# -*- coding: utf-8 -*-
# userList.py

import cgi
import Cookie
import os
import re
from database import connect_to_db, close_cnnctn_to_db
from function import printHeader, chkck

from function import server_http, serverhost_db
from function import username_db, password_db, schema_db

def main():
    form = cgi.parse()
    user = chkck()
    if form.has_key("user"):
        if user == form["user"][0]:
            printHeader()
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
            #printMenu(form)
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

            print """
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td width="4">&nbsp;</td>
      <td width="68">&nbsp;</td>

      <td width="116">&nbsp;</td>
      <td width="71">&nbsp;</td>
      <td width="131">&nbsp;</td>
      <td width="89">&nbsp;</td>
      <td width="211">&nbsp;</td>
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
      
      <td align="center" valign="top"><img src="/pic/menu_showuser.jpg" width="116" height="30"></td>
      
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

      <td background="/pic/menu_bg.gif" align="center" valign="top">&nbsp;</td>
      <td background="/pic/menu_bg.gif">&nbsp;</td>

      <td colspan="2"><img src="/pic/menu_end2.gif" width="30" height="30"></td>
    </tr>
    <tr>
      <td colspan="10" background="/pic/body_bg_800.gif">&nbsp;</td>
    </tr>
  </table>""" % (form["user"][0], form["user"][0], form["user"][0], form["user"][0])

            print """
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" background="/pic/body_bg_800.gif"><p>&nbsp;</p>
    </td>
  </tr>
  <tr>
    <td colspan="5" background="/pic/body_bg_800.gif">"""

            if form["action"][0] == "ลบผู้ใช้":
                if form.has_key("number"):
                    usernames = re.split(r",", form["usernames"][0])
                    # connect to database and retrieve a cursor
                    cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
                    connection = cnnct[0]
                    cursor = cnnct[1]

                    for i in range(len(form["number"])):
                        query = "DELETE FROM memberdata WHERE id = " + str(usernames[int(form["number"][i])])
                        #print query
                        cursor.execute(query)
                
                    connection.commit()
            
                    # close cursor and connection
                    close_cnnctn_to_db(connection, cursor)
            
                else:
                    print "กรุณาเลือกรายชื่อผู้ใช้ที่ต้องการลบ"
    
            # connect to database and retrieve a cursor
            cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
            connection = cnnct[0]
            cursor = cnnct[1]
            query = "SELECT * FROM memberdata WHERE role = 'user'"
            cursor.execute(query)
            member = cursor.fetchall()  # get member
            rowCount = cursor.rowcount
    
            # close cursor and connection
            close_cnnctn_to_db(connection, cursor)

            print """<center><form action="/cgi-bin/userList.py" method="post">
    <table border="1" cellspacing="0" bordercolor="#CCCCCC">
        <tr>
            <td width="35" align="center" valign="middle" height="35">&nbsp;</td>
            <td align="center" valign="middle">ชื่อผู้ใช้</td>
            <td align="center" valign="middle">อีเมล์</td></tr>"""

            ids = ""

            for i in range(rowCount):
                if i == rowCount - 1:
                    ids += str(member[i][0])
                else:
                    ids += str(member[i][0]) + ","
            
                print """<tr>
            <td align="center" valign="middle" height="35"><input type="checkbox" name="number" value="%d"></td>
            <td align="center" valign="middle">%s</td>
            <td align="center" valign="middle">%s</td></tr>""" % (i, member[i][1], member[i][4])
    
            print """</table><br>
    <input type="hidden" name="usernames" value="%s" />
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="ลบผู้ใช้" />
    </form></center>""" % (ids, form["user"][0])
    
            print """
    </td>
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

</table>
    """
    
            print """</body></html>"""
        else:
            print "Location: http://%s/index.html\n\n" % server_http
    else:
        print "Location: http://%s/index.html\n\n" % server_http 

main()
