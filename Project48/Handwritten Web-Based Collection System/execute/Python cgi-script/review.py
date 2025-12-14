#!"C:/Python24/python.exe"
# -*- coding: utf-8 -*-
# review.py

import cgi
import Image
import ImageDraw
import os
import re
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
    <tr align="center">
      <td colspan="10" background="/pic/body_bg_800.gif">"""

            if form["action"][0] == "ลบ":
                if form.has_key("number"):
                    charIDs = re.split(r",", form["charIDs"][0])
                    # connect to database and retrieve a cursor
                    cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
                    connection = cnnct[0]
                    cursor = cnnct[1]

                    #print form["number"]

                    for i in range(len(form["number"])):
                        query = "DELETE FROM transactions WHERE id = " + str(charIDs[int(form["number"][i])])
                        #print query
                        cursor.execute(query)
                        path = "C:/Program Files/Apache Group/Apache2/htdocs/temp/"
                        fileName = str(charIDs[int(form["number"][i])]) + ".gif"
                        path += fileName
                        os.remove(path)
                
                    connection.commit()
            
                    # close cursor and connection
                    close_cnnctn_to_db(connection, cursor)
            
                else:
                    print """<font color="red">กรุณาเลือกลายมือที่ต้องการลบ</font><br><br>"""
            
            if form["action"][0] == "ต่อไป >>":
                lastID = form["lastID"][0]
            elif form["action"][0] == "ลบ" and form.has_key("number"):
                lastID = int(charIDs[0]) - 1
            else:
                lastID = 0

            if form.has_key("count"):
                count = int(form["count"][0])
            else:
                count = 0

            # connect to database and retrieve a cursor
            cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
            connection = cnnct[0]
            cursor = cnnct[1]
    
            if form.has_key("mine"):
                query = "SELECT * FROM transactions WHERE username = '"
                query += form["user"][0] + "' AND "
            else:
                query = "SELECT * FROM transactions WHERE "
        
            query += "matchchar = '" + form["character"][0]
            query += "' AND id > " + str(lastID) + " LIMIT " + str(form["itemsPerPage"][0])
            cursor.execute(query)
            string = cursor.fetchall()  # get string
            ROWCOUNT = rowCount = cursor.rowcount
    
            # close cursor and connection
            close_cnnctn_to_db(connection, cursor)

            if form.has_key("mine"):
                mine = """<input type="hidden" name="mine" value="1" />"""
            else:
                mine = ""

            if rowCount != 0:
                if form.has_key("mine") or role[0][0] == "admin":
                    print """<form action="/cgi-bin/review.py" method="post">"""
        
                print """<table border="1" cellspacing="0" bordercolor="#CCCCCC">"""

                charIDs = ""
    
                for char_number in range(rowCount):
                    ID = string[char_number][0]
                    pointString = string[char_number][2]

                    if char_number == rowCount - 1:
                        charIDs += str(string[char_number][0])
                    else:
                        charIDs += str(string[char_number][0]) + ","
            
                    pointString = pointString.replace(" ", "")
                    pointString = pointString.replace(")(", ",")
                    pointString = pointString.replace("(", "")
                    pointString = pointString.replace(")", "")

                    point = re.split(r",", pointString)
                    for i in range(len(point)):
                        point[i] = int(point[i]) * 2/3

                    image = Image.new("RGB", (200, 200), "rgb(255, 255, 255)")
                    draw = ImageDraw.Draw(image)

                    for i in range(0, len(point) - 2, 2):
                        if point[i] != -1 and point[i + 1] != -1 \
                           and point[i + 2] != -1 \
                           and point[i + 3] != -1:
                            draw.line((point[i], point[i + 1], point[i + 2], point[i + 3]), \
                                      fill = "rgb(255, 0, 0)")
    
                    del draw
                    #image = image.resize((100, 100))
                    path = "C:/Program Files/Apache Group/Apache2/htdocs/temp/"
                    fileName = str(ID) + ".gif"
                    path += fileName
                    #print fileName
                    try:
                        image.save(path)
                    except IOError:
                        os.makedirs("C:/Program Files/Apache Group/Apache2/htdocs/temp")
                        image.save(path)

                    if form.has_key("mine") or role[0][0] == "admin":
                        print """<tr>
                <td width="35" align="center"><input type="checkbox" name="number" value="%d">&nbsp;%d</td>
                <td width="35" align="center"><img src="/temp/%s" /></td>
                </tr>""" % (char_number, count + char_number + 1, fileName)
                    else:
                        print """<tr>
                <td width="35" align="center">%d</td>
                <td width="35" align="center"><img src="/temp/%s" /></td>
                </tr>""" % (count + char_number + 1, fileName)

                lastID = string[rowCount - 1][0]
                count += rowCount

                #print charIDs

                if form.has_key("mine") or role[0][0] == "admin":
                    print """</table><br>
            <input type="button" value="เลือกทั้งหมด" onClick="this.value=check(this.form.number)" />
            <input type="button" value="เอาออกทั้งหมด" onClick="this.value=uncheck(this.form.number)" />
            <input type="hidden" name="charIDs" value="%s" />
            <input type="hidden" name="character" value="%s" />
            <input type="hidden" name="itemsPerPage" value="%s" />
            <input type="hidden" name="count" value="%d" />
            <input type="hidden" name="mine" value="1" />
            <input type="hidden" name="user" value="%s" />
            <input type="submit" name="action" value="ลบ" />
            </form>""" % (charIDs, form["character"][0], \
                          form["itemsPerPage"][0], count, form["user"][0])
                else:
                    print "</table><br>"


                # connect to database and retrieve a cursor
                cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
                connection = cnnct[0]
                cursor = cnnct[1]
    
                if form.has_key("mine"):
                    query = "SELECT id FROM transactions WHERE username = '"
                    query += form["user"][0] + "' AND "
                else:
                    query = "SELECT id FROM transactions WHERE "
        
                query += "matchchar = '" + form["character"][0]
                query += "' AND id > " + str(lastID)
                cursor.execute(query)
                ids = cursor.fetchall()  # get ids
                rowCount = cursor.rowcount
    
                # close cursor and connection
                close_cnnctn_to_db(connection, cursor)

                if rowCount == 0:
                    disabled = ' disabled="true"'
                else:
                    disabled = ""

                print """<form action="/cgi-bin/review.py" method="post">
        <input type="hidden" name="character" value="%s" />
        <input type="hidden" name="itemsPerPage" value="%s" />
        <input type="hidden" name="count" value="%d" />
        <input type="hidden" name="lastID" value="%d" />
        %s
        <input type="hidden" name="user" value="%s" />
        <input type="submit" name="action" value="ต่อไป >>"%s />
        </form>""" % (form["character"][0], form["itemsPerPage"][0], \
                      count, lastID, mine, form["user"][0], disabled)

            else:
                print """<font color="red">ไม่พบ <font size="7">%s</font> อยู่ในฐานข้อมูล</font>""" % form["character"][0]

            consonants = """
    <option>ก</option><option>ข</option><option>ฃ</option><option>ค</option>
    <option>ฅ</option><option>ฆ</option><option>ง</option><option>จ</option>
    <option>ฉ</option><option>ช</option><option>ซ</option><option>ฌ</option>
    <option>ญ</option><option>ฎ</option><option>ฏ</option><option>ฐ</option>
    <option>ฑ</option><option>ฒ</option><option>ณ</option><option>ด</option>
    <option>ต</option><option>ถ</option><option>ท</option><option>ธ</option>
    <option>น</option><option>บ</option><option>ป</option><option>ผ</option>
    <option>ฝ</option><option>พ</option><option>ฟ</option><option>ภ</option>
    <option>ม</option><option>ย</option><option>ร</option><option>ล</option>
    <option>ว</option><option>ศ</option><option>ษ</option><option>ส</option>
    <option>ห</option><option>ฬ</option><option>อ</option><option>ฮ</option>"""
            consonants = consonants.replace("<option selected>", "<option>")
            consonants = consonants.replace("<option>" + form["character"][0],
                                    "<option selected>" +form["character"][0])

            itemsPerPages = """
    <option>5</option><option>10</option><option>15</option><option>20</option>
    <option>25</option><option>30</option><option>35</option><option>40</option>
    <option>45</option><option>50</option>"""
            itemsPerPages = itemsPerPages.replace("<option selected>", "<option>")
            itemsPerPages = itemsPerPages.replace("<option>" + form["itemsPerPage"][0] + "<",
                                          "<option selected>" + form["itemsPerPage"][0] + "<")

            if form.has_key("mine"):
                mine = """<input type="hidden" name="mine" value="1" />"""
            else:
                mine = ""

            print """
    <form action="/cgi-bin/review.py" method="post">
    ตัวอักษร&nbsp;&nbsp;
    <select name="character">%s</select>&nbsp;&nbsp;&nbsp;
    แสดงผลจำนวน
    <select name="itemsPerPage">%s</select> ต่อหน้า
    %s
    <input type="hidden" name="charIDs" value="%s" />
    <input type="hidden" name="count" value="%d" />
    <input type="hidden" name="itemsPerPage" value="%s" />
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="แสดง" />
    </form>""" % (consonants, itemsPerPages, mine, charIDs, count - ROWCOUNT, \
                  form["itemsPerPage"][0], form["user"][0])
       
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
