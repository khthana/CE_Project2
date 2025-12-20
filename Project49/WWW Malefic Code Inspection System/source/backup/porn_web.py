#!/usr/local/bin/python2.5

import socket
import urlparse
import os
import string
import re
import sys
import threading
import time
import signal
from tree import Tree
from CalWeight import totalHelp
from AccessDB1 import AccessDB
from Calstat import CalStat

class Cthread(threading.Thread):

	def __init__(self,URL,ID):
		threading.Thread.__init__(self)
		self.URL = URL
		self.ID = ID

	def run(self):
		DBobj = AccessDB()
		cmd = totalHelp(self.ID)

		components = urlparse.urlparse( self.URL )
        	if components[ 0 ] == "":
            		self.URL = "http://" + self.URL
		oldURL = DBobj.findj("""SELECT ID FROM PORN_WEB WHERE URL = '%s'"""%self.URL)
				
		if cmd > 0 and not(oldURL):
			try:
				print 'ID :',self.ID,'URL :',self.URL,'WEIGHT :',cmd
				if urlparse.urlparse(self.URL).scheme != "":
					scheme = urlparse.urlparse(self.URL).scheme
					self.URL = urlparse.urlparse(self.URL).netloc
				hostname, aliaslist, ipaddrlist = socket.gethostbyname_ex(self.URL)
				ipad = ""
				#print hostname, aliaslist, ipaddrlist
				for ip in ipaddrlist:
    					ipad = ipad+' ,'+ip
				ipad = ipad[2:]				
		##############################################
				atrdic = {}
				ofile = os.popen('whois %s'%ipaddrlist[0])
				sfile = ofile.read()
				ofile.close()
				for i in string.split(sfile,'\n'):
					m = re.search('(.*)(:)[\s]+(.*)',i)
					if m:
						atrdic.setdefault(m.group(1),m.group(3))

				name = "----"
				country = "----"
				phone = "----"
				E_mail = "----"
				IP_range = "----"
				for j in atrdic.keys():	
					w = string.lower(j)
					if (w == 'inetnum')|(w =='netrange'):
						IP_range = atrdic[j]
					#elif (j == 'netname'):
					#	name = atrdic[j]
					elif (w =='country'):
						country = atrdic[j]
					elif (w =='mnt-lower')|(w =='mnt-routes')|(w =='orgname'):
						name = atrdic[j]
					elif (w =='phone')|(w =='orgtechephone')|(w =='rtechephone'):
						phone = atrdic[j]
					elif (w =='e-mail')|(w =='orgtechemail')|(w =='rtechemail'):	
						E_mail = atrdic[j]
				if name == "----" :
					try: 
						name = atrdic['mnt-by']
					except: 
						pass#print "no field"
				#print "name: %s\ncountry: %s\nphone: %s\nE_mail: %s\nIP_range: %s\n#########"%(name,country,phone,E_mail,IP_range)
				DBobj.inserti("""INSERT INTO ISP(NAME,COUNTRY,PHONE,E_MAIL,IP_RANGE) VALUES ('%s','%s','%s','%s','%s') """%(name,country,phone,E_mail,IP_range))
				ISP_ID = DBobj.findj("""SELECT ID FROM ISP WHERE IP_RANGE = '%s'"""%IP_range)
				DBobj.inserti("""INSERT INTO PORN_WEB(URL,IP_ADDRESS,DATE_TIME,TOTAL_WEIGHT,ISP_ID) VALUES ('%s','%s',now(),%s,%d) """ %(scheme+'://'+self.URL,ipad,str(cmd),int(ISP_ID)))
			except socket.gaierror,e: print "Can't connect in your URL : %s and %s"%(self.URL,e)
			except IOError,e: print "Error in your URL : %s and %s"%(self.URL,e)
			except : print "Error in your URL : %s"%(self.URL)
		elif oldURL:
			DBobj.inserti("""UPDATE PORN_WEB SET TOTAL_WEIGHT = %s , DATE_TIME =now() WHERE ID = %s"""%(str(cmd),str(oldURL)))
			print "UPDATE %s SET TOTAL_WEIGHT = %s"%(self.URL,str(cmd))
		DBobj.close()
		del DBobj
		fi = open('/root/porn_process.txt','a')
		fi.write('%s URL is %s and ID is %s\n'%(self.getName(),self.URL,self.ID))
		fi.close()
###############################################
def stop(signalNumber, frame):
    #global working
    #working = 0
    os.popen("kill -9 "+str(t2))
    print "Exit"
###############################################
def run(CalWeightThread):
	global t2
	t2 = os.getpid()
	URLlist = []
	IDlist = []
	print "START :",time.ctime()
	DBobj = AccessDB()
	row = DBobj.findlist('SELECT URL,ID FROM ALLURL WHERE URL_ID = 0 and DATE_TIME is not NULL and URL_TIMESTAMP is not NULL')
	for i in range(len(row)):
		URLlist.append(row[i][0])
		IDlist.append(row[i][1])
	print len(URLlist)
	#print IDlist
	DBobj.close()
	del DBobj
	if len(URLlist) > CalWeightThread-1:
		Cthread(URLlist[0],IDlist[0]).start()
		st = 1
		print st,'###################'
		while True:
			if threading.activeCount() < CalWeightThread :
				if threading.activeCount() == 0 or st >= len(URLlist):
					break
            			Cthread(URLlist[st],IDlist[st]).start()
				#fi = open('/root/porn_process.txt','a')
				#fi.write('Thread %d start curent thread is %d URL is %s and ID is %s\n'%(st,threading.activeCount(),URLlist[st],str(IDlist[st])))
				#fi.close()
	    			st = st + 1
				print st,'###################'
        		else : pass
	else : 
		for i in range(0,len(URLlist)):
			Cthread(URLlist[i],IDlist[i]).start()

	while True:
		if threading.activeCount() <= 1:
			CalStat()
			print "STOP :",time.ctime()
			return

def main():
	global t2
	t2 = os.getpid()
	URLlist = []
	IDlist = []
	print "START :",time.ctime()
	DBobj = AccessDB()
	row = DBobj.findlist('SELECT URL,ID FROM ALLURL WHERE URL_ID = 0 and DATE_TIME is not NULL and URL_TIMESTAMP is not NULL')
	for i in range(len(row)):
		URLlist.append(row[i][0])
		IDlist.append(row[i][1])
	print len(URLlist)
	#print IDlist
	DBobj.close()
	del DBobj
	if len(URLlist) > 97:
		Cthread(URLlist[0],IDlist[0]).start()
		st = 1
		print st,'###################'
		while True:
			if threading.activeCount() < 97 :
				if threading.activeCount() == 0 or st >= len(URLlist):
					break
            			Cthread(URLlist[st],IDlist[st]).start()
	    			st = st + 1
				print st,'###################'
        		else : pass
	else : 
		for i in range(0,len(URLlist)):
			Cthread(URLlist[i],IDlist[i]).start()

	while True:
		time.sleep(10)
		print threading.enumerate()
		if threading.activeCount() <= 1:
			print threading.activeCount()
			CalStat()
			print "STOP :",time.ctime()
			sys.exit(0)

if __name__ == "__main__":
    signal.signal(signal.SIGINT ,stop)
    main()
