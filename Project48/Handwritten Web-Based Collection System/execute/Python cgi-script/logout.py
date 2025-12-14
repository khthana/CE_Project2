#!"C:/Python24/python.exe"
# -*- coding: utf-8 -*-
# logout.py

import cgi
import Cookie

from function import server_http

def logout():
    form = cgi.parse()
    # Create a cookie dictionary object
    c1 = Cookie.Cookie()

    # does user visit login page
    c1["visitedp1"] = "0"
    c1["visitedp1"]["max-age"] = 3600	
    c1["visitedp1"]["expires"] = 3600	
    c1["visitedp1"]["version"] = 1

    # Print the headers that sets the cookies
    print c1

    #
    print "Location: http://" + server_http + "\n\n"
    sys.exit( 1 )

logout()
