#!"C:/Python24/python.exe"
# -*- coding: utf-8 -*-
# previewAll.py

import cgi
from database import connect_to_db, close_cnnctn_to_db
from function import printHeader, printHeaderAndScript, chkck

from function import server_http, serverhost_db
from function import username_db, password_db, schema_db

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
        #printUserMenu(form)

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
      
      <td align="center" valign="top"><img src="/pic/menu_showallhandwriting.jpg" width="131" height="30"></td>
      
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
      </td></form>""" % (form["user"][0], user)

                if form["action"][0] == "แสดงลายมือของฉันทั้งหมด":
                    print """
              <form method="post" action="/cgi-bin/previewAll.py">
              <td align="center" valign="top" background="/pic/menu_bg.gif">
              <input type="hidden" name="user" value="%s" />
              <input type="submit" name="action" value="แสดงลายมือทั้งหมด">
              <td align="center" valign="top"><img src="/pic/menu_showallmyhandwriting.jpg" width="169" height="30"></td>
              </td></form>
            """ % form["user"][0]
                else:
                    print """
              <td align="center" valign="top"><img src="/pic/menu_showallhandwriting.jpg" width="131" height="30"></td>
              <form method="post" action="/cgi-bin/previewAll.py">
              <td align="center" valign="top" background="/pic/menu_bg.gif">
              <input type="hidden" name="user" value="%s" />
              <input type="submit" name="action" value="แสดงลายมือของฉันทั้งหมด">
              </td></form>
              """ % form["user"][0]
    
                print """
          <td background="/pic/menu_bg.gif" align="center" valign="top">&nbsp;</td>
          <td background="/pic/menu_bg.gif" align="center" valign="top">&nbsp;</td>
          <td background="/pic/menu_bg.gif">&nbsp;</td>
          <td colspan="2"><img src="/pic/menu_end2.gif" width="30" height="30"></td>
        </tr>
        <tr>
          <td colspan="10" background="/pic/body_bg_800.gif">&nbsp;</td>
        </tr>
      </table>"""

            print """
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" background="/pic/body_bg_800.gif"><p>&nbsp;</p>
    </td>
  </tr>
  <tr>
    <td colspan="5" background="/pic/body_bg_800.gif">""" 
        
            # connect to database and retrieve a cursor
            cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
            connection = cnnct[0]
            cursor = cnnct[1]
    
            if form["action"][0] == "แสดงลายมือของฉันทั้งหมด":
                query = "SELECT * FROM transactions WHERE username = '"
                query += form["user"][0] + "' ORDER BY matchchar"
            else:
                query = "SELECT * FROM transactions ORDER BY matchchar"
        
            cursor.execute(query)
            output = cursor.fetchall()  # output
            rowCount = cursor.rowcount

            # close cursor and connection
            close_cnnctn_to_db(connection, cursor)
    
            charDict = {'ก':0, 'ข':1, 'ฃ':2, 'ค':3, 'ฅ':4, 'ฆ':5, 'ง':6, 'จ':7, 'ฉ':8, 'ช':9, 'ซ':10,
                        'ฌ':11, 'ญ':12, 'ฎ':13, 'ฏ':14, 'ฐ':15, 'ฑ':16, 'ฒ':17, 'ณ':18, 'ด':19, 'ต':20, 'ถ':21,
                        'ท':22, 'ธ':23, 'น':24, 'บ':25, 'ป':26, 'ผ':27, 'ฝ':28, 'พ':29, 'ฟ':30, 'ภ':31, 'ม':32,
                        'ย':33, 'ร':34, 'ล':35, 'ว':36, 'ศ':37, 'ษ':38, 'ส':39, 'ห':40, 'ฬ':41, 'อ':42, 'ฮ':43}
            counts = []
            for i in range(0, 44):
                counts.append(0)
            for i in range(rowCount):
                counts[charDict[output[i][3]]] += 1

            chars = ['ก', 'ข', 'ฃ', 'ค', 'ฅ', 'ฆ', 'ง', 'จ', 'ฉ', 'ช', 'ซ',
                     'ฌ', 'ญ', 'ฎ', 'ฏ', 'ฐ', 'ฑ', 'ฒ', 'ณ', 'ด', 'ต', 'ถ',
                    'ท', 'ธ', 'น', 'บ', 'ป', 'ผ', 'ฝ', 'พ', 'ฟ', 'ภ', 'ม',
                    'ย', 'ร', 'ล', 'ว', 'ศ', 'ษ', 'ส', 'ห', 'ฬ', 'อ', 'ฮ']
    
    #####
    
            if form["action"][0] == "แสดงลายมือของฉันทั้งหมด":
                print """<center><font size="5">ลายมือของ %s</font></center><br>""" % form["user"][0]
                mine = """<input type="hidden" name="mine" value="1" />"""
            else:
                print """<center><font size="5">ลายมือทั้งหมดจากฐานข้อมูล</font></center><br>"""
                mine = ""
        
            print """<center><table border="1" cellspacing="0" bordercolor="#CCCCCC"><tr>
    <td align="center" valign="middle" height="35">ตัวอักษร</td>
    <td align="center" valign="middle">ตัว</td>
    <form action="/cgi-bin/review.py" method="post"><td align="center" valign="middle">
    <input type="hidden" name="character" value="%s" />
    <input type="hidden" name="itemsPerPage" value="%d" />
    %s
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="ตรวจสอบทั้งหมด" />
    </td></form>
    <form action="/cgi-bin/download.py" method="post"><td align="center" valign="middle">
    %s
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="ดาวน์โหลดทั้งหมด" />
    </td></form></tr>""" % ('ก', 5, mine, form["user"][0], mine, form["user"][0])
    
            for i in range(len(chars)):
                if counts[i] == 0:
                    disabled = ' disabled="true"'
                else:
                    disabled = ""
            
                if i % 2 == 0:
                    bgcolor = "#CCFCE8"
                else:
                    bgcolor ="#EBFAFE"
            
                print """
        <tr bgcolor="%s">
            <td width="100" align="center" valign="middle" height="35">%s</td>
            <td width="100" align="center" valign="middle">%d</td>
            <form action="/cgi-bin/review.py" method="post"><td align="center" valign="middle">
                <input type="hidden" name="character" value="%s" />
                <input type="hidden" name="itemsPerPage" value="%d" />
                %s
                <input type="hidden" name="user" value="%s" />
                <input type="submit" name="action" value="ตรวจสอบ"%s />
                </td></form>
            <form action="/cgi-bin/download.py" method="post"><td align="center" valign="middle">
                <input type="hidden" name="character" value="%s" />
                %s
                <input type="hidden" name="user" value="%s" />
                <input type="submit" name="action" value="ดาวน์โหลด"%s />
                </td></form>
        </tr>""" % (bgcolor, chars[i], counts[i], chars[i], 5, \
                    mine, form["user"][0], disabled, \
                    chars[i], mine, form["user"][0], disabled)   
            print "</table></center>"

            print """
        </td>
      </tr>
      <tr>
        <td colspan="5" background="/pic/body_bg_800.gif">
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
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
</table>"""
    
            print """</body></html>"""
        else:
            print "Location: http://%s/index.html\n\n" % server_http
    else:
        print "Location: http://%s/index.html\n\n" % server_http 

main()
