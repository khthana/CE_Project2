# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#  										      #
#  World Wide Web malefic code inspection system.                                     #
#  **** Center Pocess ****                                                            #
#  Programer : Paktoon Jaithong & Pichanee Tassanasatien                              #
#  King Mongkut's Institute of Technology Ladkrabang				      #
#  Interface : Command Line Interface                                                 #
#  connect to Web server : urllib2 & Htmllib                                          #
#  Save links in page : Database MySQL                                                #
#  program OK successful : 3 process                                                  #
#  start and control 3 process                                                        #
#  Require AccessDB1.py, Crawler.py, TestImg1.py, porn_web.py                         #
#                                                                                     #
#  Ctrl-C to stop program                                                             # #                        							      #
#                                                                                     #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#!/usr/local/bin/python2.5

import os
import time
import warnings
import sys
#import urllib2      # build request and sent to Web server for get html file
#import httplib      # for exception InvalidURL
#import urlparse     # test url and set url to effective url
#import htmllib      # parse html file find tag <a> and tag <img> for get hyperlink anf image link 
#import formatter    # combine with htmllib
#import string       # combine with htmllib
import signal       # for Ctrl-C terminate program 
import threading    # Use Semaphore build multithread program
from AccessDB1 import AccessDB  # Class for Access to Database project
import thread       # Define for multithread programming
import searchAPI
from Crawler import SemaphoreThread
from TestImg1 import SemaphoreThread1
import porn_web
processname = "parent"

# Function to end all process with Ctrl-C keyboard interupt
def stop(signalNumber, frame):
    
    # Kill first child process by send SIGKILL signal
    os.kill(forkID1,signal.SIGKILL)

    # Kill second child process by send SIGKILL signal
    os.kill(forkID2,signal.SIGKILL)
    fi = open('%s/process.txt'%os.getcwd(),'a')
    fi.write('process Calculate weight is stoped.\n')
    fi.close()
    print "Function test image was terminated"
    print "Function test link was terminated"

    # Kill main process 
    os.popen("kill -9 "+str(t1))

    # Finish 
    sys.exit(0)

def main():

	# Try to fork process create first child process 
	try:
		global forkID1
		forkID1 = os.fork()

	# if your OS don't support fork
	except OSError:
		sys.exit("Unable to create new process.")

	#default varliable

	#number of Crawler Thread
	CrawlerThread=128

	#number of image detection Thread
	TestimgThread=128

	#number of Calculate weight Thread
	CalWeightThread=97

	#wide of search
	maxwideSe=200

	#high of search
	maxhighSe=3

	#max number of image per page
	maxImg=100
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

				#set TestimgThread value
				elif var[0] == 'TestimgThread':
					TestimgThread=int(var[1])

				#set CalWeightThread value
				elif var[0] == 'CalWeightThread':
					CalWeightThread=int(var[1])

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

	# Parent Process
	if forkID1 != 0: 

		# Try to fork process create second child process 
		try:
			global forkID2
			forkID2 = os.fork()

		# if your OS don't support fork
		except OSError:
			sys.exit("Unable to create new process.")

		if forkID2 != 0: #parent process
			global t1
    			# list of threads
    			threads = []
			t1 = os.getpid()
    			# semaphore allows 96 threads to enter critical section Database
    			threadSemaphore = threading.Semaphore(len( SemaphoreThread.available ) )

    			#init thread
    			initThread = SemaphoreThread(threadSemaphore )
    			initThread.start()
			#initThread.join()

    			# create 96 threads run in same time
    			for i in range( 2, 97 ):
       				threads.append( SemaphoreThread( threadSemaphore ) )

    			# start each thread
    			for thread in threads:
       				thread.start()
  		
    			# running 128 thread over time
    			while True:
        			if threading.activeCount() < CrawlerThread+1:
            				SemaphoreThread( threadSemaphore ).start()
        			if SemaphoreThread.count >= 96:
	    				searchAPI.SearchAPI()
		elif forkID2 == 0: #second child process

			# Listen signal from parent
			signal.signal(signal.SIGINT, signal.SIG_IGN)

			# loop to calculate weight
			while True:  
				fi = open('%s/process.txt'%os.getcwd(),'a')
				fi.write('process Calculate weight start in 1 hr.\n')
				fi.close()
				# every 1 hr.
				time.sleep(3600)
				
				# open file to check process
				fi = open('%s/process.txt'%os.getcwd(),'a')
				fi.write("""Calculate total weight process start at: %s \n"""%(time.ctime()))
				fi.close()
				print """################Calculate total weight process################## start at: %s"""%(time.ctime())

				# call function to calculate weight
				porn_web.run(CalWeightThread)
				fi = open('%s/process.txt'%os.getcwd(),'a')
				fi.write("""Calculate total weight process stop at: %s \n"""%(time.ctime()))
				fi.close()

	# Child process
	elif forkID1 == 0:
		print 'Progrem started : Ctrl-C to stop program'
    			#runp(1,5)
		# list of threads
		signal.signal(signal.SIGINT, signal.SIG_IGN)
    		threads = []

    		DB = AccessDB()
    		while True:
    			countImg = DB.findj('SELECT COUNT(*) FROM IMAGE')
    			if countImg > 129 :
				threadSemaphore1 = threading.Semaphore(len( SemaphoreThread1.available ) )
				initThread = SemaphoreThread1(threadSemaphore1 )
    				#initThread.start()
    				#initThread.join()
				DB.close()
				break
			time.sleep(5)
		
    		# create 96 threads run in same time
    		for i in range( 1, 97 ):
       			threads.append( SemaphoreThread1( threadSemaphore1 ) )

    		# start each thread
    		for thread in threads:
       			thread.start()
    		# running 128 thread over time
    		while True:
        		if threading.activeCount() < TestimgThread+1:
            			SemaphoreThread1( threadSemaphore1 ).start()
        		else : pass

if __name__ == "__main__":

    #Use signal for control multiprocess
    signal.signal(signal.SIGINT ,stop)

    #Ignore DeprecationWarning maybe interupt program
    warnings.filterwarnings('ignore','.*',DeprecationWarning)

    #Call main function of project
    main()	
