#!"C:/Python24/python.exe"
# -*- coding: utf-8 -*-
# admin.py

import cgi
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
      <td colspan="2" align="center" valign="top"><img src="/pic/menu_home.jpg" width="75" height="30" /></td>
      
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
  </table>""" % (form["user"][0], form["user"][0], form["user"][0], form["user"][0])


            # connect to database and retrieve a cursor
            cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
            connection = cnnct[0]
            cursor = cnnct[1]
            query = "select count(distinct recogalgorithm) from permanentdata"
            cursor.execute(query)
            outputNumber = cursor.fetchall()   
            # close cursor and connection
            close_cnnctn_to_db(connection, cursor)

            recogNumber = outputNumber[0][0]
    
            # connect to database and retrieve a cursor
            cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
            connection = cnnct[0]
            cursor = cnnct[1]
            query = "select recogalgorithm from permanentdata group by recogalgorithm"
            cursor.execute(query)
            outputName = cursor.fetchall()  
            # close cursor and connection
            close_cnnctn_to_db(connection, cursor)



            print """
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="5" background="/pic/body_bg_800.gif">
"""

            # print statistic table
            print """<center><br>
        สถิติในการรู้จำ<br><table border="1" cellspacing="0" bordercolor="#CCCCCC">
        <tr>
            <td align="center" valign="middle" height="35">อัลกอริทึม</td>
            <td align="center" valign="middle">ตัวอักษรที่ถูกต้อง</td>
            <td align="center" valign="middle">ตัวอักษรที่ผิดพลาด</td>
            <td align="center" valign="middle">เปอร์เซนต์ความถูกต้อง</td></tr>"""

            for i in range(recogNumber):
        
                # connect to database and retrieve a cursor
                cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
                connection = cnnct[0]
                cursor = cnnct[1]
                query = "select * from permanentdata where recogalgorithm = "
                query += outputName[i][0]
                query += " and correct =(select max(correct) from permanentdata where recogalgorithm = "
                query += outputName[i][0]
                query += ")"
                cursor.execute(query)
                output = cursor.fetchall()  
    
                # close cursor and connection
                close_cnnctn_to_db(connection, cursor)
                algorName = output[0][1]
                corrct = output[0][2]
                incorrct = output[0][3]
                percent = (corrct*100)/(corrct+incorrct)
                print """<tr>
            <td align="center" valign="middle" height="35">%s</td>
            <td align="center" valign="middle">%s</td>
            <td align="center" valign="middle" >%s</td>
            <td align="center" valign="middle">%s เปอร์เซนต์</td></tr>""" % (algorName, corrct, incorrct, percent)

        
            print """ </table></center><br><br>"""
 
            print """
  </tr>
  <tr>
    <td colspan="5" background="/pic/body_bg_800.gif">
    <p>&nbsp;</p>
  </tr>
  <tr>
    <td width="71" align="center" valign="bottom"><img src="/pic/menu_begin_canvas.gif" width="75" height="30"></td>
    <td width="116" background="/pic/menu_bg_canvas.gif" align="center" valign="bottom">&nbsp;</td>
    <td width="500" background="/pic/menu_bg_canvas.gif">&nbsp;</td>
    <td width="83" background="/pic/menu_bg_canvas.gif">&nbsp;</td>
    <td width="30" class="tr"><img src="/pic/menu_end2_canvas.gif" width="30" height="30"></td>

  </tr>

</table> """

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

    
    #printMenu(form)
            print """</body></html>"""
        else:
            print "Location: http://%s/index.html\n\n" % server_http
    else:
        print "Location: http://%s/index.html\n\n" % server_http 

main()
