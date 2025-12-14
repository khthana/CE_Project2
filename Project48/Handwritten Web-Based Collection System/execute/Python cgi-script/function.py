#!"C:/Python24/python.exe"
# -*- coding: utf-8 -*-
# function.py

import Cookie
import os
from database import connect_to_db, close_cnnctn_to_db

server_http = "161.246.6.170"
serverhost_db = "localhost"
username_db = "root"
password_db = "password"
schema_db = "test"

def chkck():
    try:
	cookie = os.environ["HTTP_COOKIE"]
    except KeyError:
	print "Location: http://%s/index.html\n\n" %(server_http)
	sys.exit(1)
    else:
	c2 = Cookie.Cookie()
	c2.load(os.environ["HTTP_COOKIE"])
	if c2["visitedp1"].value == "0":
            print "Location: http://%s/index.html\n\n" %(server_http)
            sys.exit( 1 )
            
    return c2["user_id"].value
            
def printHeader():          
    print "Content-type: text/html\n"
    print """<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css">
    <!--
    .form-noindent {background-color: #ffffff; border: #C3D9FF 1px solid}

    .tl {padding: 0; width: 4; text-align: left; vertical-align: top}
    .tr {padding: 0; width: 4; text-align: right; vertical-align: top}
    .bl {padding: 0; width: 4; text-align: left; vertical-align: bottom}
    .br {padding: 0; width: 4; text-align: right; vertical-align: bottom}
    -->
    </style>
    <title>ระบบเก็บฐานข้อมูลลายมือเขียนภาษาไทย</title></head><body>"""


def printHeaderAndScript():      
    print "Content-type: text/html\n"
    print """<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css">
    <!--
    .form-noindent {background-color: #ffffff; border: #C3D9FF 1px solid}

    .tl {padding: 0; width: 4; text-align: left; vertical-align: top}
    .tr {padding: 0; width: 4; text-align: right; vertical-align: top}
    .bl {padding: 0; width: 4; text-align: left; vertical-align: bottom}
    .br {padding: 0; width: 4; text-align: right; vertical-align: bottom}
    -->
    </style>
    <title>ระบบเก็บฐานข้อมูลลายมือเขียนภาษาไทย</title>
    
    <script type="text/javascript">
        <!--
        function popup(mylink, windowname)
        {
        if (! window.focus)return true;
        var href;
        if (typeof(mylink) == 'string')
        href=mylink;
        else
        href=mylink.href;
        window.open(href, windowname, 'width=810, height=580, scrollbars=no');
        return false;
        }
        -->
    </script>


    <script language="JavaScript">
    <!--
        function check(field)
        {
            for (i = 0; i < field.length; i++)
            {
                field[i].checked = true;
            }
            return "เลือกทั้งหมด";
        }

        function uncheck(field)
        {
            for (i = 0; i < field.length; i++)
            {
                field[i].checked = false;
            }
            return "เอาออกทั้งหมด";
        }
    -->
    </script>
    </head><body>"""

def printGoHome(user):
    # connect to database and retrieve a cursor
    cnnct = connect_to_db(serverhost_db, username_db, password_db, schema_db)
    connection = cnnct[0]
    cursor = cnnct[1]
    query = "SELECT role FROM memberdata WHERE username = '"
    query += user + "'"    
    cursor.execute(query)
    role = cursor.fetchall()
    # close cursor and connection
    close_cnnctn_to_db(connection, cursor)

    if role[0][0] == "admin":
        print """<form action="/cgi-bin/admin.py" method="post">
        <input type="hidden" name="user" value="%s" />
        <input type="submit" name="action" value="กลับหน้าหลัก" />
        </form>""" % user
    else:
        print """<form action="/cgi-bin/user.py" method="post">
        <input type="hidden" name="user" value="%s" />
        <input type="submit" name="action" value="กลับหน้าหลัก" />
        </form>""" % user

def printMenu(form):
    print """<form action="/cgi-bin/changePasswd.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="เปลี่ยนรหัสผ่าน" />
    </form>""" % form["user"][0]

    print """<form action="/cgi-bin/logout.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="ล็อกเอาท์" />
    </form>""" % form["user"][0]

    print """<form action="/cgi-bin/addUser.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="เพิ่มผู้ใช้" />
    </form>""" % form["user"][0]

    print """<form action="/cgi-bin/userList.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="แสดงรายชื่อผู้ใช้" />
    </form>""" % form["user"][0]

    print """<form action="/cgi-bin/previewAll.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="แสดงลายมือทั้งหมด" />
    </form>""" % form["user"][0]

def printUserMenu(form):
    user = "?user="
    user += form["user"][0]
    
    print """<form action="/cgi-bin/changePasswd.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="เปลี่ยนรหัสผ่าน" />
    </form>""" % form["user"][0]
        
    print """<form action="/cgi-bin/logout.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="ล็อกเอาท์" />
    </form>""" % form["user"][0]
    
    print """<form>
    <input type="button" onClick="return popup('/HandWritingApplet.html%s', 'notes')" value="เพิ่มลายมือเขียน" />
    </form>""" % user

    print """<form action="/cgi-bin/previewAll.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="แสดงลายมือทั้งหมด" />
    </form>""" % form["user"][0]
    
    print """<form action="/cgi-bin/previewAll.py" method="post">
    <input type="hidden" name="user" value="%s" />
    <input type="submit" name="action" value="แสดงลายมือของฉันทั้งหมด" />
    </form>""" % form["user"][0]

    
    
    
