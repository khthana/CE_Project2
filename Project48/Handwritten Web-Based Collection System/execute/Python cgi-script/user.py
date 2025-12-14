#!"C:/Python24/python.exe"
# -*- coding: utf-8 -*-
# user.py

import cgi

import Image
import ImageDraw
import os
import re
from database import connect_to_db, close_cnnctn_to_db
from function import printHeader, printHeaderAndScript, chkck

from function import server_http

def main():
    form = cgi.parse()
    user = chkck()
    if form.has_key("user"):
        if user == form["user"][0]:
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

      <td colspan="2"><img src="/pic/menu_home.jpg" width="75" height="30"></td>
      <form method="post" action="">
      <td background="/pic/menu_bg.gif" align="center" valign="top">
      <input type="button" onClick="return popup('/HandWritingApplet.html%s', 'notes')" value="เพิ่มลายมือเขียน" />
      </td></form>
      <form method="post" action="/cgi-bin/previewAll.py">
      <td background="/pic/menu_bg.gif" align="center" valign="top">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="แสดงลายมือทั้งหมด">
      </td></form>
      <form method="post" action="/cgi-bin/previewAll.py">
      <td background="/pic/menu_bg.gif" align="center" valign="top">
      <input type="hidden" name="user" value="%s" />
      <input type="submit" name="action" value="แสดงลายมือของฉันทั้งหมด">
      </td></form>
      <td background="/pic/menu_bg.gif" align="center" valign="top">&nbsp;</td>
      <td background="/pic/menu_bg.gif" align="center" valign="top">&nbsp;</td>
      <td background="/pic/menu_bg.gif">&nbsp;</td>
      <td colspan="2"><img src="/pic/menu_end2.gif" width="30" height="30"></td>
    </tr>

    <tr>
      <td colspan="10" background="/pic/body_bg_800.gif">&nbsp;</td>
    </tr>
    </table>""" % (user, form["user"][0], form["user"][0])

            print """
    <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="10" background="/pic/body_bg_800.gif">
    <blockquote>
        <br><strong>ยินดีต้อนรับคุณ%s เข้าสู่ระบบ</strong>
	  <p><img src="/pic/bullet_01.gif">&nbsp;&nbsp;คุณสามารถทำการเพิ่มลายมือเขียนโดยคลิกที่ปุ่ม เพิ่มลายมือเขียน 
	  <br><img src="/pic/bullet_01.gif">&nbsp;&nbsp;จัดการข้อมูลลายมือเขียนส่วนตัวได้ที่ แสดงลายมือของฉันทั้งหมด
	  <br><img src="/pic/bullet_01.gif">&nbsp;&nbsp;ดูข้อมูลลายมือเขียนทั้งหมดได้ที่ แสดงลายมือทั้งหมด
	  <br><img src="/pic/bullet_01.gif">&nbsp;&nbsp;จัดการข้อมูลส่วนตัวได้ที่ แก้ไขข้อมูล
      <br> </p>
      <br>
    </blockquote>

        <p>&nbsp;</p></td>
  </tr>
  <tr>
    <td colspan="10" background="/pic/body_bg_800.gif">
        <br>&nbsp;
        <br>&nbsp;
    </td>
  </tr>
  <tr>

    <td width="71" align="center" valign="bottom" background="/pic/menu_begin_canvas.gif">&nbsp;</td>
    <td width="116" align="center" valign="bottom" background="/pic/menu_bg_canvas.gif">&nbsp;</td>

    <td width="500" background="/pic/menu_bg_canvas.gif">&nbsp;</td>
    <td width="83" background="/pic/menu_bg_canvas.gif">&nbsp;</td>
    <td width="30" class="tr"><img src="/pic/menu_end2_canvas.gif" width="30" height="30"></td>
  </tr>

</table>  """ % form["user"][0]

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
