#!"C:/Python24/python.exe"
# -*- coding: tis-620 -*-
# forgetPasswd.py

import smtplib
import cgi
from database import connect_to_db, close_cnnctn_to_db

from function import server_http, serverhost_db
from function import username_db, password_db, schema_db

def main():
    form = cgi.parse()
    print "Content-type: text/html\n"
    print """<head>
    <meta http-equiv="Content-Type" content="text/html; charset=TIS-620">
    <title>ระบบเก็บฐานข้อมูลลายมือเขียนภาษาไทย</title></head><body><center>
    <br><br><br>"""
    
    if form.has_key("username"):
        # connect to database and retrieve a cursor
        cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
        connection = cnnct[0]
        cursor = cnnct[1]
        query = "SELECT * FROM memberdata WHERE username = '"
        query += form["username"][0] + "'"
        cursor.execute(query)
        member = cursor.fetchall()  # get member
        #print member
        rowCount = cursor.rowcount   
        # close cursor and connection
        close_cnnctn_to_db(connection, cursor)

        if rowCount != 0:
            sender = "admin@setsunakami.kmitl.ac.th"
            receiver = member[0][4]
            sub = "Send Password"
            msg = "username %s      password %s" % (form["username"][0], member[0][2])
            string = "From: %s\r\nTo: %s\r\nSubject: %s\r\n%s\r\n" % (sender, ", ".join(receiver), sub, msg)
    
            s = smtplib.SMTP()
            s.connect()   
            s.sendmail(sender, receiver, string)
            s.close()
            print """<center><font color="green">
            ระบบได้ทำการส่งรหัสผ่านสำหรับ %s <br>ไปที่อีเมล์แอดเดรส %s เรียบร้อยแล้ว</font></center>""" % (form["username"][0],
                                                                                                           receiver)
            
        else:
            print """กรุณาใส่ชื่อผู้ใช้เพื่อระบบจะได้ทำการส่งรหัสผ่านไปที่อีเมล์แอดเดรสของคุณ<br><br>
            <form action="/cgi-bin/forgetPasswd.py" method="post">
        <input type="text" name="username" />
        <input type="submit" name="action" value="ตกลง" />
        </form>"""

            print """ไม่มีรายชื่อผู้ใช้ <font color="red">%s</font> อยู่ในระบบ""" % form["username"][0]

    else:
        print """กรุณาใส่ชื่อผู้ใช้เพื่อระบบจะได้ทำการส่งรหัสผ่านไปที่อีเมล์แอดเดรสของคุณ<br><br>
        <form action="/cgi-bin/forgetPasswd.py" method="post">
        <input type="text" name="username" />
        <input type="submit" name="action" value="ตกลง" />
        </form>"""
        
    print "</ceneter></body></html>"

main()
