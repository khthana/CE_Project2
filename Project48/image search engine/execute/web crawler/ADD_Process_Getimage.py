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

show = "SELECT urllink FROM table_link  "

#=============================follow link to get image=====================================
def follow_level_1(d):
    #hhh = str(1)

    #print d
    #d = d+1000
    #print d

    try:
        timeout = 10
        defTimeOut=socket.getdefaulttimeout()
        socket.setdefaulttimeout(timeout)
        found=1
        query = "SELECT `urllink` FROM `table_test_link` WHERE  `id` = '"+str (d)+"'  "
        print query
        cursor.execute(query)
        row = cursor.fetchone()

        #cursor.execute("UPDATE `table_test_link` SET `check` = '%s' WHERE `id` = '%s'"
                        #%(hhh, str(d)))
        
            
        
        for line in urllib2.urlopen(row[0]):
            if '' in line :
                #print line
                x = line
                m = re.search(LinkToSrc, x)
                if m:
                    match_src = m.group()
                    #match_jpg_name = match_href[5:-1]
                    match_src = replace(match_src,"""src=""","""""")
                    match_src = replace(match_src,"""\"""","""""")
                    match_src = replace(match_src,"""\'""","""""")
                    fullurl = urljoin(row[0],match_src)
                    fullurl = replace(fullurl,"""\n""","""""")
                    print fullurl

                    log_image = file('e:/logfile_getimage.txt', 'a')
                    log_image.write('\n')
                    log_image.write(show)
                    log_image.write('\n')
                    log_image.write(fullurl)
                    log_image.write('\n')
                  
                    
                    try:
                        cursor.execute("INSERT INTO table_test_image (urlimage) VALUES (%s)"
                        , [  (fullurl)])
                    except(IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine):
                        print 'url duplicate'
                        continue
                   
                 

                    #cursor.executemany("INSERT INTO table_image (urlimage,histogram,date) VALUES (%s,%s,%s)"
                     #, [ (fullurl,str(histogram),now)])
                    
                        
                    db.commit()

                    print 'INSERT INTO table_test_image'
                    
    except ( urllib2.HTTPError, urllib2.URLError,socket.error, socket.sslerror,ECONNRESET,IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine,HTTPError,URLError):
        found=0
        socket.setdefaulttimeout(defTimeOut)
        d = d + 1
        print 'TIME OUT'
        return d
        pass

    

##################################### THREAD USAGE ####################################
    
def thread ():
    try:
        #cursor.execute("INSERT INTO `table_id_process` ( `id` , `start` , `stop` ) VALUES ('', '0', '0')")

        while True :
            
            cursor.execute("SELECT MAX( `id` ) FROM `table_id_process`")
            getmax = cursor.fetchone()

            cursor.execute("SELECT `stop` FROM `table_id_process` WHERE `id` = '%s'" % (getmax[0]))
            get_stop = cursor.fetchone()

            ha = get_stop[0]+1
            haha = get_stop[0]+100

            cursor.execute("INSERT INTO `table_id_process` (start,stop) VALUES (%s,%s)"
                            %(ha,haha))
                

            # execute SQL statement
            cursor.execute("SELECT urllink FROM table_test_link")
        
            # get the number of rows in the resultset
            numrows = int(cursor.rowcount)

            # get and display one row at a time
            s = ha
            for record in range(ha,haha+1):
                follow_level_1(s)
                s=s+1
                sleep(0.03)

                                              
                

                 
            #e = file('e:/counter.txt', 'a')
            #e.write(site)

      

    except(urllib2.HTTPError, urllib2.URLError,socket.error, socket.sslerror,ECONNRESET,IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine,HTTPError,URLError):
        print "error thread1 "

       

#------- MAIN ------------#


#f = file('e:/url.txt', 'r')
  
#for site in f:
try:
    start_new_thread(thread())
        
except(urllib2.HTTPError, urllib2.URLError,socket.error, socket.sslerror,ECONNRESET,IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine,HTTPError,URLError):
    print 'thread complete'
    
#check time for update image
nowtoday = date.today()

if int(nowtoday.strftime("%d")) == 1  :
    start_new_thread(thread_update(nowtoday))
        

if int(nowtoday.strftime("%d")) == 15  :
    start_new_thread(thread_update(nowtoday))
        
    


cursor.close()
db.close()
