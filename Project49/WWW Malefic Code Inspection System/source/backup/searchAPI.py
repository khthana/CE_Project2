#!/usr/local/lib/python2.5
# googly.py
# A typical Google Web API Python script using Mark Pilgrim's
# PyGoogle Google Web API wrapper
# [http://diveintomark.org/projects/pygoogle/].
# Usage: python googly.py <query>
# Pichanee Tassanasatien
# Modify at 30/12/06

import sys, string, codecs
import SOAP
import google
import MySQLdb
import re
import GoogleSOAPFacade
import urlparse
#from TextDetection import DetectPool
import urllib2
import threading
import warnings
import time
import signal

class Cthread(threading.Thread):
     def __init__( self, result , query):
      """Initialize thread"""

      threading.Thread.__init__( self)
      self.result = result
      self.query = query
     def run(self):
          flag = 0
	  numpool = 0 
          if self.result.URL[-1] == "/":
              self.result.URL = self.result.URL[:-1]
          find = re.findall("(.*)wikipedia(.*)",self.result.URL,re.I)
	  findim = re.findall("(.*)imdb(.*)",self.result.URL,re.I)
          if find:
              print "wikipedia web : "
              print self.result.URL
	  elif findim:
	      print "imdb web : "
	      print self.result.URL 	
          else:
               link = URItoURL(self.result.URL)
	       print link
               try:
			htmlSource = urllib2.urlopen(link)
			numpool = DetectPool(htmlSource.read())
			if numpool>=1:
			       	print "Porn web : num pool = ",numpool
				print link
				InsertDB(link)
			else:
			       	print "Non Porn web : "
				print link
               except:
			print "File Not Found"
                    
## Read Data From QUERIES ##
def ReadDB(select):
    connection = MySQLdb.connect(passwd="098234373",db = "PROJECT")
    cursor = connection.cursor()
    try:
        query = """SELECT %s FROM QUERIES WHERE ID = (SELECT MIN(ID) FROM QUERIES WHERE CHECKED IS NULL);"""%select
        cursor.execute(query)
        row = cursor.fetchone()
#	print row
        if row:
            return row[0]
        else:
            print "Error No New Pool"
    #error connecting to database
    except MySQLdb.OperationalError, message:
        print "Error %d:\n%s" %\
                        (message[0],message[1])
    cursor.close()
    connection.close()

## Update pool in QUERIES ##
def UpdateDB(ID):
    connection = MySQLdb.connect(passwd="098234373",db = "PROJECT")
    cursor = connection.cursor()
    try:
        query = """update QUERIES set CHECKED=1 where ID = %s"""%ID
        cursor.execute(query)
        connection.commit()
    #error connecting to database
    except MySQLdb.OperationalError, message:
        print "Error %d:\n%s" %\
                        (message[0],message[1])
    cursor.close()
    connection.close()

## Insert link into ALLURL ##
def InsertDB(URL):
    connection = MySQLdb.connect(passwd="098234373",db = "PROJECT")
    cursor = connection.cursor()
    try:
	query = """INSERT INTO ALLURL(URL,URL_ID) VALUES ('%s',0) """ %(URL)
	cursor.execute(query)
	connection.commit()
    #error connecting to database
    except MySQLdb.DatabaseError, message:
        pass
    except UnicodeDecodeError:
        print "insert invalid language"
    cursor.close()
    connection.close()

## Detect pool from meta tag ##
def DetectPool(htmlSource):
    i = 0
    poolword = 0
    index = 0
    index1 = 0
    leng = 0
    pool = "^adulter$|(.*)amateurcouple(.*)|^anal$|^anilingus(.*)|^anus$|^ass$|(.*)bdsm(.*)|(.*)blowjob(.*)|^bondage$|^boob(s)?$|^boobie(s)?$|(.*)borrachas(.*)|(.*)bulldoglist(.*)|^busty$|^cam(s)?$|(.*)cfnm(.*)|^cock(s)?$|(.*)creampie(.*)|^cum$|^cumshot(s)?$|^cunt$|(.*)cybersex(.*)|(.*)cybersexual(.*)|^dildo(s)?$|(.*)femdom(.*)|(.*)fuck(.*)|(.*)handjob(.*)|(.*)hentai(.*)|(.*)interracial(.*)|(.*)maledom(.*)|(.*)malestripper(.*)|(.*)masturbat(.*)|^mature(.*)|(.*)milf(.*)|^nude(.*)|^nudism(.*)|(.*)nudistas(.*)|^nudity(.*)|^oral(.*)|(.*)orgasm(.*)|^pantie(.*)|(.*)penis(.*)|^piss(.*)|(.*)porn(.*)|(.*)pued(.*)|(.*)purecfnm(.*)|^puss(.*)|^putas(.*)|^rimjob(.*)|^rimming(.*)|(.*)rubias(.*)|(.*)shemale(.*)|(.*)tetazas(.*)|(.*)tgp(.*)|^tit(s)?$|(.*)titworld(.*)|(.*)upskirt(.*)|(.*)xnxx(.*)|(.*)yobt(.*)|(.*)ztod(.*)|(.*)gangbang(.*)|(.*)hardcore(.*)|^babe(s)?$|^amateur(s)?$|^DVDA$|^pussy$"
    a = pool.split("|")
    findmeta = re.findall("(<[\s]*meta[\s]+)([^>]+)(>)",htmlSource,re.I)
    if findmeta:
    	for i in findmeta:
        	if index<len(findmeta):
            		for j in findmeta[index]:
				flag = 0
                		findd = re.findall("([^a-z0-9]*)([a-z0-9]+)([^a-z0-9]*)",j,re.I)
				for k in findd:
                    			for m in range(len(a)):
                        			searchpool = re.findall(a[m],k[1],re.I)
						if searchpool:
							poolword+=1

        	index = index+1
    return poolword

## Convert URI to URL ##
def URItoURL(myURL):
    components = urlparse.urlparse( myURL )
    #if addressing scheme not specified, use http
    if components[ 0 ] == "":
        myURL = "http://" + myURL
    components = urlparse.urlparse( myURL )
    myURL = components[0]+"://"+components[1]
    return myURL

# main function ##
def SearchAPI():
    # initail values    
    count = 1
    startt = 10

    # Read Pool from database
    query = ReadDB("POOL")
    ID = ReadDB("ID")
    print query
    
    # Google API developer's key.
    google.LICENSE_KEY = 'IQiYLq9QFHKl/m1m1MgRSL07xdOj1UL0'
    
    # Query Google.
    data = google.doGoogleSearch(query,0)
    lenght = data.meta.endIndex-data.meta.startIndex
    if lenght<9:
	lenght = 9
	
    # Teach standard output to deal with utf-8 encoding in the results.
    sys.stdout = codecs.lookup('utf-8')[-1](sys.stdout)

    # Output.
    while lenght==9 and count<=200 and startt!=data.meta.startIndex:     
        for result in data.results:
          Cthread(result,query).start()
	  count+=1
	print "start : "+str(data.meta.startIndex)
	startt = data.meta.startIndex
        endd = data.meta.endIndex
        print "end : "+str(data.meta.endIndex)
        print "##########################################"
        google.LICENSE_KEY = 'IQiYLq9QFHKl/m1m1MgRSL07xdOj1UL0'
        lenght = data.meta.endIndex-data.meta.startIndex
        data = google.doGoogleSearch(query,data.meta.endIndex)
        flag = 0

    UpdateDB(ID)

    while True:
	if threading.activeCount() <= 1:
		print threading.activeCount()
		print "STOP :",time.ctime()
		return
#		sys.exit(0)

def stop(signalNumber, frame):
    #global working
    #working = 0
    os.popen("kill -9 "+str(t2))
    print "Exit"

signal.signal(signal.SIGINT ,stop)
warnings.filterwarnings('ignore','.*',DeprecationWarning)
#a = SearchAPI()
#a = SearchAPI()
#a = SearchAPI()
#tmp = urllib2.urlopen("http://www.gaypornspace.com")
#htmlSource = tmp.read()
#DetectPool(htmlSource)
#sys.exit(0)
