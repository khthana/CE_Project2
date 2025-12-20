# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  										      #
#  World Wide Web malefic code inspection system.                                     #
#  **** Crawler Pocess ****                                                           #
#  Programer : Paktoon Jaithong & Pichanee Tassanasatien                              #
#  King Mongkut's Institute of Technology Ladkrabang				      #
#  Interface : Command Line Interface                                                 #
#  connect to Web server : urllib2 & Htmllib                                          #
#  Save links in page : Database MySQL                                                #
#  program OK successful : a little bit error with tag is't <a>                       #
#  Input url from init row in Database                                                #
#  Require AccessDB1.py, ClassText.py, TextDetection.py                               #
#                                                                                     #
#  Ctrl-C to stop program                                                             #
#  multithread program 128 threads init 96  threads (default)                         #
#  Access to Database 96  threads config mySQL max connection default 100 ->> 500     # #                        							      #
#                                                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#!/usr/local/bin/python2.5

import urllib2      # build request and sent to Web server for get html file
import httplib      # for exception InvalidURL
import urlparse     # test url and set url to effective url
import htmllib      # parse html file find tag <a> and tag <img> for get hyperlink anf image link 
import formatter    # combine with htmllib
import string       # combine with htmllib
import signal       # for Ctrl-C terminate program 
import threading    # Use Semaphore build multithread program
from AccessDB1 import AccessDB  # Class for Access to Database project
import thread       # Define for multithread programming
import os
import time
from Numeric import * # classify page
from pylab import *  # classify page
from ClassText import Classified
from TextDetection import DetectText
import searchAPI
####### impove performance #############
# import psyco for impove performance
try:
    import psyco
    psyco.full()
except:
    pass


########################################
# Create Class inherit from HTMLParser for parse html
# Use standard function for parse tag <a> find hyperkink
class ImagePuller(htmllib.HTMLParser):
    
    def __init__(self):
        htmllib.HTMLParser.__init__(self,
                                    formatter.NullFormatter())
        self.list_of_images = [] # list for image link in that page
        
    # Overwrite function for parse tag <img> find link image
    def do_img(self, attributes):
        for name, value in attributes:

            # find <img src="value"/>
            if name == 'src':
                new_image = value

                # add image link to list
                self.list_of_images.append(new_image)

    def getImageList(self):

        # function get list of image
        return self.list_of_images


##########################################################

# Class for multithread program   
class SemaphoreThread( threading.Thread ):
   """Class using semaphores"""

###############################################
   """default varliable"""

   #number of Crawler Thread
   CrawlerThread=128  

   #wide of search
   maxwideSe=100

   #high of search
   maxhighSe=3

   #max number of image per page
   maxImg=50
   try:

	#Lookup in config file
	configf = open('%s/project.txt'%os.getcwd(),'r')
	config = configf.read().split('\n')[:-1]
	for v in config:

		#Ignore comment in config file
		if v[0] != '#':
			var = v.split('=')

			#set CrawlerThread value
			if var[0] == 'CrawlerThread':
				CrawlerThread=int(var[1])

			#set maxwideSe value
			elif var[0] == 'maxwideSe':
				maxwideSe=int(var[1])

			#set maxhighSe value
			elif var[0] =='maxhighSe':
				maxhighSe=int(var[1])

			#set maxImg value
			elif var[0] == 'maxImg':
				maxImg=int(var[1])
	configf.close()
   except:

	#can't find config file. Use default value!
	print "can't find config file. Use default value!"

###############################################

   """Choose ID from Database to init ID for search continue or 1 if don't have more rows"""

   #connect to Database
   DBfirst = AccessDB()  
 
   #avi = DBfirst.findj('SELECT min(ID) FROM ALLURL WHERE DATE_TIME IS NULL')
   avi = DBfirst.findj('SELECT max(ID) FROM ALLURL WHERE DATE_TIME IS NOT NULL')

   #CrawlerThread for semaphore avaliable
   if avi == None or avi < CrawlerThread:
	avi = 1
   else : avi = avi - CrawlerThread
   print avi
   DBfirst.close()
   del DBfirst
	
    # 96 threads for init if use more than 96 thread force too many connection to Database error
   available = [ availy for availy in range(avi,avi+96) ]   
   count = 0 #96

   def __init__( self, semaphore, weight1 = 100 , weight2 = 50):
      """Initialize thread"""

      threading.Thread.__init__( self)

      # set the semaphore as a data attribute of the class
      self.threadSemaphore = semaphore   
      self.weight1 = SemaphoreThread.maxwideSe
      self.weight2 = SemaphoreThread.maxImg  #SemaphoreThread.maxImg 
	
    # Overwrite run function
   def run( self ):
      """Run program and release semaphore"""
      
      # Create Class inherit from htmllib.HTMLParser
      puller = ImagePuller()
      
      # acquire the semaphore
      self.threadSemaphore.acquire()
      
      # remove a table from the list
      table = SemaphoreThread.available.pop(0)
    
      # add next table
      SemaphoreThread.available.append( table + 96 )
      
      # call run main function to execution URL
      self.running(puller,table)
      
      # release the semaphore after execution finishes
      self.threadSemaphore.release()
      puller.close()
      del puller

    # function output to Database for save hyperlink and image link     
   def outputtoFile(self,DBout,ylist,urlget,TBname,ids,flagg) :
        
       # list link in page
        for i in range(0,len(ylist)):
            if ylist[i][-1] != "":
            # parse '/' from URL for fix some error in URL
                    if ylist[i][-1] == '/':
                        ylist[i] = ylist[i][0:len(ylist[i])-1]
        
        	    # set url link to effective link
        	    ylist[i] = urlparse.urljoin(urlget.geturl(),ylist[i])
        
        	    # check URL part it is Web page or Web site
        	    components1 = urlparse.urlparse( urlget.geturl() )
        	    components2 = urlparse.urlparse( ylist[i] )
        
                    #if addressing scheme not specified, use http
                    if components2[ 0 ] == "":
                    	ylist[i] = "http://" + ylist[i]
        	    components2 = urlparse.urlparse( ylist[i] )
        
        	    # check URL condition
        	    if components1.netloc == components2.netloc :
        
        		#it is web page ==> child of page
        		flagt = 0
        	    else : 
        		if components2[2] =='' and components2[3] =='' and components2[4] =='' and components2[5] =='' :
        
        			#it is web site ==> new page
        			flagt = 1
        
        		#it is web page ==> child of page
        		else: flagt = 0	    
                    
        	    # if it is web site or no more 3 level
        	    if flagg == 1 or flagt == 1:
            
                        # parse URL to 6 component for modify and manage URL
                    	scheme, host, path, params, query, fragment = urlparse.urlparse( ylist[i] )
                    
                        # if addressing scheme not specified, not use http or https
                    	if (scheme == "http" or scheme == "https") and ylist[i][-1] != "'":
        
                                # parse fragment '#' out of URL
                        	completeURL = urlparse.urlunparse([scheme,host,path,params,query,''])
        
                       		# parse '/' from URL for fix some error in URL
                        	if completeURL[-1] == '/':
                            		completeURL = completeURL[0:len(completeURL)-1]
        
        			# insert condition
                    		if flagt == 1:
        				
        				# if web site URL_ID = 0    
                        		DBout.insertbut(TBname,completeURL,0)
                    		elif flagt == 0 : 
        
        				# if web page URL_ID = ID parent 
        				DBout.insertbut(TBname,completeURL,ids) 

   def outputtoHAS(self,DBout,ylist,urlget,TBname,ids,flagg) :
	
       # list link in page
        for i in range(0,len(ylist)):
            if ylist[i] != "":
        	    print ylist[i][-1],"pass8.1.1"
                    # parse '/' from URL for fix some error in URL
                    if ylist[i][-1] == '/':
                        ylist[i] = ylist[i][0:len(ylist[i])-1]
         	    print ylist[i],"pass8.2"
        	    ylist[i] = urlparse.urljoin(urlget.geturl(),ylist[i])
        	    # set url link to effective link
        	    components2 = urlparse.urlparse( ylist[i] )
                    #if addressing scheme not specified, use http
                    if components2[ 0 ] == "":
                    	ylist[i] = "http://" + ylist[i]
        	    # check URL condition
                    print ylist[i],"pass8.3"
        	    # if it is web site or no more 3 level
        	    if flagg == 1:
            
                        # parse URL to 6 component for modify and manage URL
                    	scheme, host, path, params, query, fragment = urlparse.urlparse( ylist[i] )
                        print ylist[i],"pass8.4"
                        # if addressing scheme not specified, not use http or https
                    	if (scheme == "http" or scheme == "https") and ylist[i][-1] != "'":
        
                                # parse fragment '#' out of URL
                        	completeURL = urlparse.urlunparse([scheme,host,path,params,query,''])
        			print ylist[i],"pass8.5"
                       		# parse '/' from URL for fix some error in URL
                        	if completeURL[-1] == '/':
                            		completeURL = completeURL[0:len(completeURL)-1]
        
        			# if web page URL_ID = ID parent 
        			DBout.inserti('INSERT into IMAGE(URL) VALUES("%s")'%completeURL)
        			IDi = DBout.findj('SELECT ID FROM IMAGE WHERE URL ="%s"'%completeURL)
        			print ylist[i],"pass8.6"
        			if IDi:
        				DBout.inserti('INSERT into HAS(PAGE_ID,IMAGE_ID) VALUES(%s,%s)'%(str(ids),str(IDi)))

    # main function for execution URL            
   def running(self, puller, ids):

        global t2
	t2 = os.getpid() 

	# bulid class Calssified 
	v = Classified() 
   
        # build Object from AccessDB class
        DBobj = AccessDB()

	# detect text only
        contentType='text'

        # get URL from Database with id from available table
        myURL = DBobj.findbut(ids,'ALLURL')
        if myURL == None:
		SemaphoreThread.count += 1
        while myURL == None:
		print " %s can't; find table. sleep : %d" % \
         		( self.getName(),10)
        	time.sleep( 10 )
		myURL = DBobj.findbut(ids,'ALLURL')
		if myURL != None:
			SemaphoreThread.count -= 1
			break

	# set DATE_TIME mean we get URL already
	DBobj.updatebut('ALLURL','DATE_TIME','now()',ids)

        components = urlparse.urlparse( myURL )
        #if addressing scheme not specified, use http
        if components[ 0 ] == "":
            myURL = "http://" + myURL

	# Profe that URL in 3 level
        parent = DBobj.findj('select URL_ID from ALLURL where ID = (select URL_ID from ALLURL where ID = (select URL_ID from ALLURL where ID = %d))'%ids)

	# condition to profe
	if parent == None:

		# in 3 level
		flagg = 1

	# out of 3 level
	else : flagg = 0  
  
        # connect and retrieve the file   
        try:
	    myURL = "http://xcocktail.com/upskirt1218/1893galla9.html "
	    # connect to web server to get html fiel
            tempFile = urllib2.urlopen(urllib2.Request(myURL))
	    print "pass1"
	    # check type of document if text continue process if not pass process
	    if tempFile.info( ).getmaintype( ) == contentType.lower( ) :

		# Get Timestamp from packet
            	TimeStamp = tempFile.info().getdate("date")
		print "pass2"
		# set format to update Database
            	TimeStampD = str(TimeStamp[0])+"-"+str(TimeStamp[1])+"-"+str(TimeStamp[2])+" "+str(TimeStamp[3])+":"+str(TimeStamp[4])+":"+str(TimeStamp[5])
                print "pass3"
            	# Read html file from file index
            	text = tempFile.read()
                print "pass4"
		# Use puller to find <a> & <img>
            	puller.feed(text)
            	print "pass5"
		# limit number of link to maxwideSe(100)
		if len(puller.anchorlist) > self.weight1:
			tmplist = puller.anchorlist[0:self.weight1]
		else : tmplist = puller.anchorlist
                print "pass6"
            	# save hyperlink to Database
            	self.outputtoFile(DBobj,tmplist,tempFile,'ALLURL',ids,flagg)
            	print "pass7"
		# limit number of image to maxImg(50)
		if len(puller.getImageList()) > self.weight2:
			#tmplist = puller.getImageList()[0:int((self.weight2 / 100.0 )*self.weight1)]		
			tmplist = puller.getImageList()[0:self.weight2]
		else : #tmplist = puller.getImageList()[0:int((self.weight2 / 100.0 )*len(puller.getImageList()))]
			tmplist = puller.getImageList()
                print "pass8"
            	# save image link to Database
            	self.outputtoHAS(DBobj,tmplist,tempFile,'IMAGE',ids,1)
                print "pass9"
		# Call Class and Function to detect content and classify page
		result = DetectText(text)
		print "pass10"
		textweight = v.Fn_Eigenvec(array(result))
		print "pass11"
		del v
		
		# close index
            	tempFile.close()

		# if all process successful print this line to terminal
            	print myURL,"OK id: %d templist = %d text weight = %s"%(ids,len(tmplist),str(textweight)),self.getName()

		# update URL_TIMESTAMP and TEXT_WEIGHT to DATABASE and END process
            	DBobj.updatebut('ALLURL','URL_TIMESTAMP',"'"+TimeStampD+"'",ids)
		DBobj.updatebut('ALLURL','TEXT_WEIGHT',"'"+str(textweight)+"'",ids)

	    # if document isn't text
	    else : print myURL,"is not text id: %d "%ids,self.getName()

            # error with HTTP request
        except urllib2.HTTPError,e:
            print myURL,"Error code : ",e.code,"id: %d "%ids,self.getName()
            
            # error when get not html file
        except htmllib.HTMLParseError:
            print myURL,"parse error","id: %d "%ids,self.getName()
            
            # error don't find URL
        except IOError:
            print myURL,"Error finding file","id: %d "%ids,self.getName()
            
            # error when URL invalid
        except httplib.InvalidURL:
            print myURL,"InvalidURL","id: %d "%ids,self.getName()

	    # for another error maybe happen
        except Exception,e :
            print myURL,"Error :",e,self.getName()    

        # finish program
        puller.reset()
        DBobj.close()
	del DBobj
        
    ##########################################################
        
# Function for fix Ctrl-C exit command   
def stop(signalNumber, frame):
    #global working
    #working = 0
    os.popen("kill -9 "+str(t2))
    print "Exit"
    
def main():
    # list of threads
    threads = []
    t1 , t2 = 0,0
    t1 = os.getpid()
    # semaphore allows 96 threads to enter critical section Database
    threadSemaphore = threading.Semaphore(len( SemaphoreThread.available ) )

    #init thread
    initThread = SemaphoreThread(threadSemaphore )
    initThread.start()
    #initThread.join()
    
    # create 96 threads run in same time
    #for i in range( 2, 97 ):
    #   threads.append( SemaphoreThread( threadSemaphore ) )

    # start each thread
    #for thread in threads:
    #   thread.start()
  
    # running 128 thread over time
    #while True:
    #    if threading.activeCount() < 129:
    #        SemaphoreThread( threadSemaphore ).start()
    #    if SemaphoreThread.count >= 96:
	#    searchAPI.SearchAPI()
        

if __name__ == "__main__":
    #Use signal for control multithread
    signal.signal(signal.SIGINT ,stop)
    main()
