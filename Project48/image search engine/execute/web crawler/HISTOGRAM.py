# import MySQL module
import urllib2
from urlparse import urlsplit, urljoin

from datetime import date

from httplib import HTTPConnection
from httplib import InvalidURL
from httplib import BadStatusLine

from urllib import urlretrieve

from urllib2 import URLError
from urllib2 import HTTPError

from errno import ECONNRESET

from sys import exitfunc
from time import sleep

from string import replace

import re
import string
import urllib
import os
import sys
import MySQLdb
import cgi
import socket

import atexit

import Image
import cStringIO

import thread
from thread import start_new_thread

import httplib

import codecs

LinkToSrc = re.compile("""src=('|")*[\S+]*[/\[a-zA-Z0-9-_]+]*(.jpg|.bmp)( |/)*('|")*""", re.IGNORECASE)

LinkToSrc_Js = re.compile("""('|")[\S+]*[/\[a-zA-Z0-9-_]+]*(.jpg|.bmp)( |/)*('|")""", re.IGNORECASE)

LinkToJs = re.compile("""src=('|")[\W+]*[\S+]*[/\[a-zA-Z0-9-_]+]*(.js)( |/)*('|")""", re.IGNORECASE)

LinkToHref = re.compile("""href=('|")[\S+]*[/\[a-zA-Z0-9-_]+]*(.php|.com|.shtml|.html|.htm|.cgi|.th)*( |/)*('|")""", re.IGNORECASE)

# connect
db = MySQLdb.connect(host="localhost", user="root", passwd="",
db="python")

# create a cursor
cursor = db.cursor()

now = date.today()

value = 1

#========================HISTOGRAM========================================
def his(d):
    try:
        #-set timeout-#
        timeout = 15
        defTimeOut=socket.getdefaulttimeout()
        socket.setdefaulttimeout(timeout)
        found=1

        #-get urlimage from database-#
        query = "SELECT `urlimage` FROM `table_test_image` WHERE  `id` = '"+str (d)+"' AND `chis` = '0'"
        print query
        cursor.execute(query)
        row = cursor.fetchone()

        #-check histogram finished-#
        cursor.execute("UPDATE `table_test_image` SET `chis` = '%s' WHERE `id` = '%s'"
                       %(value, str(d)))
        
        file = urllib.urlopen(row[0])
        im = cStringIO.StringIO(file.read()) # constructs a StringIO holding the image
        img = Image.open(im)

        img.putdata(range(256))                         
        a = list(img.convert("RGB").getdata())

        ##a=img.getdata()

        histogram =list()
    
        k=1
        while k<=216:
            histogram.append(0)
            k=k+1
	
        for i in a:
            red=i[0]/43##red
            green=i[1]/43##green
            blue=i[2]/43##blue

            histogram[(red*36)+(green*6)+blue]=histogram[(red*36)+(green*6)+blue]+1

        l=0
        while l<=215:
            histogram[l]=(histogram[l]*100)/len(a)
            l=l+1

        print histogram

        
    except (IOError , TypeError , ValueError,RuntimeError):
        print 'his finished'
        pass

        
    try:
        #print "UPDATE table_test_image SET histogram = '%s' , date = '%s' WHERE urlimage = '%s' " %(histogram,now,row[0])
        cursor.execute ("UPDATE table_test_image SET histogram = '%s' , date = '%s' WHERE urlimage = '%s' "
                        %(histogram,now,row[0]))
    except(urllib2.HTTPError, urllib2.URLError,socket.error, socket.sslerror,IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine):
        found=0
        socket.setdefaulttimeout(defTimeOut)
        print 'his db duplicate'

  
    return found
        

##################################### THREAD USAGE ####################################
    
def thread ():
    try:
        # execute SQL statement
        #cursor.execute("SELECT urlimage FROM table_test_image")
        
        # get the number of rows in the resultset
        #numrows = int(cursor.rowcount)

        # get and display one row at a time
        #s = 1
        #for record in range(0,numrows):
            #his(s)
            #s=s+1
            #sleep(0.003)

            #show = "SELECT urlimage FROM table_test_image WHERE  id = '"+ str(s) +"'"
            #log_image = file('e:/log_his.txt', 'a')
            #log_image.write('\n')
            #log_image.write(show)
            #log_image.write('\n')

        #sleep(30)
        
        while True :
            # execute SQL statement
            cursor.execute("SELECT max(id) FROM table_test_image WHERE `chis` = '0'")
            max_id = cursor.fetchone()
            
            cursor.execute("SELECT min(id) FROM table_test_image WHERE `chis` = '0'")
            min_id = cursor.fetchone()
            
            # get the number of rows in the resultset
            #numrows = int(cursor.rowcount)

            # get and display one row at a time
            print min_id[0]
            print max_id[0]
            
            s = min_id[0]
            for record in range(min_id[0],max_id[0]+1):
                his(s)
                s=s+1
                sleep(0.003)

                show = "SELECT urlimage FROM table_test_image WHERE  id = '"+ str(s) +"'"
                log_image = file('e:/log_his.txt', 'a')
                log_image.write('\n')
                log_image.write(show)
                log_image.write('\n')

            sleep(40)

    
    except(IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine):
        print "error thread1 "

    
       
#------- MAIN ------------#



try:
    start_new_thread(thread())
        
except(IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine):
    print 'thread complete'



cursor.close()
db.close()
