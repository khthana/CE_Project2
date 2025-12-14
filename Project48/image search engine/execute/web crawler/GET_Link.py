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

#//////////////////////////////////////////Retrieve link////////////////////////////////////

def gethref (w):
    try:
        timeout = 10
        defTimeOut=socket.getdefaulttimeout()
        socket.setdefaulttimeout(timeout)
        found=1
        for line in urllib2.urlopen(w):
            if '' in line :
                x = line
                m = re.search(LinkToHref, x)
                if m:
                    match_href = m.group() 
                    #match_jpg_name = match_href[6:-1]
                    match_href = replace(match_href,"""href=""","""""")
                    match_href = replace(match_href,"""\"""","""""")
                    match_href = replace(match_href,"""\'""","""""")
                    
                    fullurl = urljoin(site,match_href)
                    #print fullurl
                    fullurl = replace(fullurl,"""
                    ""","""""")
                    fullurl = replace(fullurl,""" ""","""""")
                    fullurl = replace(fullurl,"""\n""","""""")
                    print fullurl

                    log_link = file('e:/logfile_getlink.txt', 'a')
                    log_link.write('\n')
                    log_link.write(fullurl)
                    log_link.write('\n')
                    
                   
                    now = date.today()
                    print now

                    
                    
                    try:
                        cursor.executemany("INSERT INTO table_test_link (urllink,date) VALUES (%s,%s)"
                         , [(fullurl,now)])
              
                        
                        db.commit()

                    except(StandardError):
                        print 'Link Duplicate'
                        continue
                    
                    print "INSERT INTO table_test_link"
                    sleep(0.003)
                    
    except(urllib2.HTTPError, urllib2.URLError,socket.error, socket.sslerror,ECONNRESET,IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine,HTTPError,URLError ):
        found=0
        socket.setdefaulttimeout(defTimeOut)
        print'Webpage ERROR2'

    return found


def getjs (w):
    try:
        timeout = 10
        defTimeOut=socket.getdefaulttimeout()
        socket.setdefaulttimeout(timeout)
        found=1
        for line in urllib2.urlopen(w):
            if '' in line :
                x = line
                m = re.search(LinkToJs, x)
                if m:
                    match_src = m.group() 
                    #match_jpg_name = match_href[5:-1]
                    match_src = replace(match_src,"""src=""","""""")
                    match_src = replace(match_src,"""\"""","""""")
                    match_src = replace(match_src,"""\'""","""""")
                    
                    #match_src = replace(match_src,"""\n""","""""")
                    fullurl = urljoin(site,match_src)
                    #print fullurl
                    fullurl = replace(fullurl,"""\n""","""""")
                    print fullurl

                    log_linkjs = file('e:/logfile_getlink.txt', 'a')
                    log_linkjs.write('\n')
                    log_linkjs.write(fullurl)
                    log_linkjs.write('\n')

                    urlretrieve(fullurl,'e:/test.txt')
                    
                    inp = codecs.open("e:/test.txt","r","mbcs")

                    iq = inp.read()

                    inp.close()
                    d=0
                    y1 =''
                    for x1 in iq:

                        if d == 0:
                            y1 = y1+x1
                            d = 1
                        else:
                            d = 0

                    #print y1

                    x2 = '';
                    for way in y1:
                        if way == '\n':
                            
                            m1 = re.search(LinkToSrc_Js, x2)
                        
                            if m1:
                                match = m1.group() 
                                #jpg_name = match[1:-1]
                                match = replace(match,"""src=""","""""")
                                match = replace(match,"""\"""","""""")
                                match_src = replace(match,"""\'""","""""")
                                
                                fullurl2 = urljoin(site,match)
                                #print fullurl2
                                fullurl2 = replace(fullurl2,"""\n""","""""")
                                print fullurl2

                                try:
                                    cursor.execute("INSERT INTO table_test_image (urlimage) VALUES (%s)"
                                     , [  (fullurl2)])
                                except(IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine):
                                    print 'url duplicate'
                                    continue

                                try:
                                                                
                                    file = urllib.urlopen(fullurl2)
                                    im = cStringIO.StringIO(file.read()) # constructs a StringIO holding the image
                                    img = Image.open(im)

                                    a=img.getdata()

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
                                    print '////////////////////////////////'

                                except (ECONNRESET,IOError , TypeError , ValueError,RuntimeError):
                                    print 'histogram'
                                    continue

                                x2 = ''

                            try:
                                cursor.execute ("UPDATE table_test_image SET histogram = '%s' , date = '%s' WHERE urlimage = '%s' "
                                                %(histogram,now,fullurl2))
                            except(os.error,os.strerror,ECONNRESET,IOError , TypeError , ValueError,RuntimeError,StandardError,HTTPError,URLError, InvalidURL,BadStatusLine):
                                continue                            
              
                            x2 = ''
                        else:
                            x2 = x2+way

                    
                
                    try:
                        cursor.executemany("INSERT INTO table_test_link (urllink,date) VALUES (%s,%s)"
                         , [(fullurl,now)])
              
                        
                        db.commit()

                    except(StandardError):
                        print 'Link Duplicate'
                        continue
               
                    print "INSERT INTO table_test_link"

    except(urllib2.HTTPError, urllib2.URLError,socket.error, socket.sslerror,ECONNRESET,IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine,HTTPError,URLError ):
        found=0
        socket.setdefaulttimeout(defTimeOut)
        print'Webpage ERROR3'

    return found

#************************************follow_level_2 to get link**********************************

def follow_level_2(ta):
    try:
        timeout = 10
        defTimeOut=socket.getdefaulttimeout()
        socket.setdefaulttimeout(timeout)
        found=1
        query = "SELECT urllink FROM table_test_link WHERE  id = '"+str (ta)+"'"
        print query
        cursor.execute(query)
        row = cursor.fetchone()
        #print row[0]
        for line in urllib2.urlopen(row[0]):
            if '' in line :
                x = line
                m = re.search(LinkToHref, x)
                if m:
                    match_href = m.group() 
                    #match_link_name = match_href[6:-1]
                    match_href = replace(match_href,"""href=""","""""")
                    match_href = replace(match_href,"""\"""","""""")
                    match_href = replace(match_href,"""\'""","""""")
                    
                    fullurl_href = urljoin(row[0],match_href)
                    #print fullurl_href
                    fullurl_href = replace(fullurl_href,"""\n""","""""")
                    print fullurl_href

                    log_link = file('e:/logfile_getlink.txt', 'a')
                    log_link.write('\n')
                    log_link.write(show)
                    log_link.write('\n')
                    log_link.write(fullurl_href)
                    log_link.write('\n')

                    try:
                        cursor.executemany("INSERT INTO table_test_link (urllink,date) VALUES (%s,%s)"
                         , [(fullurl_href,now)])
          
                    
                        db.commit()

                    except(StandardError):
                        print 'Link Duplicate'
                        continue
                
                    print "INSERT INTO table_test_link"
            

                
    except (urllib2.HTTPError, urllib2.URLError,socket.error, socket.sslerror,IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine,HTTPError,URLError,ECONNRESET ):
        found=0
        socket.setdefaulttimeout(defTimeOut)
        ta = ta + 1
        print 'TIME OUT'
        return ta

    return found


def follow_level_2_js(tb):
    try:
        timeout = 10
        defTimeOut=socket.getdefaulttimeout()
        socket.setdefaulttimeout(timeout)
        found=1
        query = "SELECT urllink FROM table_test_link WHERE  id = '"+str (tb)+"'"
        print query
        cursor.execute(query)
        row = cursor.fetchone()
        for line in urllib2.urlopen(row[0]):
            if '' in line :
                x = line
                m = re.search(LinkToJs, x)
                if m:
                    match_Js = m.group() 
                    #match_Js_name = match_Js[5:-1]
                    match_Js = replace(match_Js,"""src=""","""""")
                    match_Js = replace(match_Js,"""\"""","""""")
                    match_Js = replace(match_Js,"""\'""","""""")
                    
                    
                    fullurl = urljoin(row[0],match_Js)
                    #print fullurl
                    fullurl = replace(fullurl,"""\n""","""""")
                    print fullurl

                    log_js = file('e:/logfile_getlink.txt', 'a')
                    log_js.write('\n')
                    log_js.write(show)
                    log_js.write('\n')
                    log_js.write(fullurl)
                    log_js.write('\n')

                    urlretrieve(fullurl,'e:/test.txt')
                    
                    inp = codecs.open("e:/test.txt","r","mbcs")

                    iq = inp.read()

                    inp.close()
                    d=0
                    y1 =''
                    for x1 in iq:

                        if d == 0:
                            y1 = y1+x1
                            d = 1
                        else:
                            d = 0

                    #print y1

                    x2 = '';
                    for way in y1:
                        if way == '\n':
                            
                            m1 = re.search(LinkToSrc, x2)
                        
                            if m1:
                                match = m1.group() 
                                #js_name = match[5:-1]
                                match = replace(match,"""src=""","""""")
                                match = replace(match,"""\"""","""""")
                                match = replace(match,"""\'""","""""")
                                
                            
                                fullurl_Js = urljoin(row[0],match)
                                #print fullurl_Js
                                fullurl_Js = replace(fullurl_Js,"""\n""","""""")
                                print fullurl_Js
                                

                                try:
                                    cursor.execute("INSERT INTO table_test_image (urlimage) VALUES (%s)"
                                    , [  (fullurl_Js)])
                                except(IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine):
                                    print 'url duplicate'
                                    continue

                                try:
                                                                
                                    file = urllib.urlopen(fullurl2)
                                    im = cStringIO.StringIO(file.read()) # constructs a StringIO holding the image
                                    img = Image.open(im)

                                    a=img.getdata()

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

                                except (ECONNRESET,IOError , TypeError , ValueError,RuntimeError):
                                    print 'histogram'
                                    continue

                            x2 = ''

                            try:
                                cursor.execute ("UPDATE table_test_image SET histogram = '%s' , date = '%s' WHERE urlimage = '%s' "
                                %(histogram,now,fullurl_Js))
                            except(os.error,os.strerror,ECONNRESET,IOError , TypeError , ValueError,RuntimeError,StandardError,HTTPError,URLError, InvalidURL,BadStatusLine):
                                continue

                            #try:
                            #    cursor.executemany("INSERT INTO table_image (urlimage,histogram,date) VALUES (%s,%s,%s)"
                            #    , [  (fullurl2,str(histogram),now)])
                            #except(os.error,os.strerror,ECONNRESET,IOError , TypeError , ValueError,RuntimeError,StandardError,HTTPError,URLError, InvalidURL,BadStatusLine):
                            #    continue
                               
              
                            x2 = ''
                        else:
                            x2 = x2+way

                    #---1111111111111111

                    try:
                        cursor.executemany("INSERT INTO table_test_link (urllink,date) VALUES (%s,%s)"
                         , [(fullurl,now)])
          
                    
                        db.commit()

                    except(StandardError):
                        print 'Link Duplicate'
                        continue
                
                    print "INSERT INTO table_test_link"

                
    except (urllib2.HTTPError, urllib2.URLError,socket.error, socket.sslerror,IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine,HTTPError,URLError,ECONNRESET ):
        found=0
        socket.setdefaulttimeout(defTimeOut)
        tb = tb + 1
        print 'TIME OUT'
        return tb

    return found

##################################### THREAD USAGE ####################################
    
def thread (site):
    try:
        g = file('e:/counter.txt', 'r')
        
        j = g.read()

        print j
        print site

        xx = string.find(j,site) 

        if xx == -1:
            print 'not found'

            while True :
                
                gethref (site)
                sleep(0.05)

                getjs (site)
                sleep(0.05)

                #break

                # execute SQL statement
                cursor.execute("SELECT urllink FROM table_test_link")
        
                # get the number of rows in the resultset
                numrows = int(cursor.rowcount)

                # get and display one row at a time
               
                ra = 1
                for record in range(0,numrows):
                
                    follow_level_2(ra)
                    ra=ra+1
                    sleep(0.5)

                na = 200
                for record in range(0,numrows):
                
                    follow_level_2(na)
                    na=na+1
                    sleep(0.5)

                nb = 500
                for record in range(0,numrows):
                
                    follow_level_2(nb)
                    nb=nb+1
                    sleep(0.5)
                                
                                    
                rd = 1
                for record in range(0,numrows):
            
                    follow_level_2_js(rb)
                    rd=rd+1
                    sleep(0.5)
                
          
                e = file('e:/counter.txt', 'a')
                e.write(site)

        else:
            print 'found'
            
        

    except(IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine):
        print "error thread1 "
       
    
def thread_update(now):
    try:
        # execute SQL statement
        cursor.execute("SELECT urllink FROM table_test_link")
    
        # get the number of rows in the resultset
        numrows = int(cursor.rowcount)

        # get and display one row at a time
        ra = 1
        for record in range(0,numrows):
        
            follow_level_2(ra)
            ra=ra+1
            sleep(0.5)

        na = 200
        for record in range(0,numrows):
        
            follow_level_2(na)
            na=na+1
            sleep(0.5)

        nb = 500
        for record in range(0,numrows):
        
            follow_level_2(nb)
            nb=nb+1
            sleep(0.5)

        rb = 1
        for record in range(0,numrows):
        
            follow_level_2_js(rb)
            rb=rb+1
            sleep(0.5)

      
    except (IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine ):
        print 'update error'

#------- MAIN ------------#


f = file('e:/url.txt', 'r')
  
for site in f:
    try:
        start_new_thread(thread(site))
        
    except(IOError , TypeError , ValueError,RuntimeError,StandardError,InvalidURL,BadStatusLine):
        print 'thread complete'
    
#check time for update image
nowtoday = date.today()

if int(nowtoday.strftime("%d")) == 1  :
    start_new_thread(thread_update(nowtoday))
        

if int(nowtoday.strftime("%d")) == 15  :
    start_new_thread(thread_update(nowtoday))
        
    


cursor.close()
db.close()
