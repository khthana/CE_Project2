#######Paktoon Jaithong##########
#!/usr/local/bin/python2.5
#Connect to Internet get Image
import os
import cStringIO       
import urllib
import urllib2
import httplib
import htmllib
import time
from AccessDB1 import AccessDB  # Class for Access to Database project
import signal
#Image Library
import Image
import urlparse
import time
#Math Library
import math
import sys
from  operator import div

import thread       # Define for multithread programming
import threading    # Use Semaphore build multithread program

#From Sobel import function gen to create sobel image
from Sobel import gen
import ImageChops

#Import Function from Library to calculate Eigenvector
from Numeric import *
from LinearAlgebra import eigenvectors
from pylab import *
import warnings
#Set recursion limit for loop
sys.setrecursionlimit(15000)

"""Create Class for get attribute from Image"""
class GetImage:
    """Class to get attribute from Image"""

    def __init__(self,img) :
        """Constructor of class"""
        self.count = [] # keep size of region
        self.countin = 0 # parameter count pixel in region
        self.iv = 1 # parameter number of region
        self.im = img # source Image
	self.v = [[0 for i in range(self.im.size[1])] for i in range(self.im.size[0])] # list  pixel that have skin color
        self.m = []
      
    def findSkin(self):
        """ Find Skin pixel in image """
	self.m = self.SobelMask() # sobel Image
        """Loop for check every pixel in source Image"""
        for i in range(self.im.size[0]):
            for j in range(self.im.size[1]):
                
                """Call Function to check pixel"""
                self.SetSkin(i,j)

                """complete check in Region set count with number of skin pixek in region and set countin to zero"""
                if self.countin != 0:
                    self.count.append(self.countin)
                    self.countin = 0
                    self.iv = self.iv + 1 # increase number of Region

    def rgb2YCbCr(self,R,G,B):
        """Function to convert R,G,B color space to Y,Cb,Cr color space"""
        
        Y = (0.299 * R) + (0.587 * G) + (0.114 * B)    #calculate Y from R,G,B
        Cb = (-0.1687 * R) + (-0.3313 * G) + (0.5 * B) #calculate Cb from R,G,B
        Cr = (0.5 * R) + (-0.4187 * G) + (-0.0813 * B) #calculate Cr from R,G,B
        return Y,Cb,Cr

    def SetSkin(self,i,j):
        """Function to check Skin pixel and their neighbor and mark it in list 'v' """

        #Base case for when i,j lookover image size
        if i < 0 or j < 0 or i >= self.im.size[0] or j >= self.im.size[1]: return

        """Check Skin colorpixel"""
        try :
            if self.v[i][j] == 0 :  #When that pixel don't be marked or Don't check it yet !
                R ,G ,B = self.im.getpixel((i,j)) # Get R,G,B from source Image
                r ,g ,b = self.m.getpixel((i,j))  # Get r,g,b from sobel Image
                Y , Cb , Cr = self.rgb2YCbCr(R,G,B) # Convert Input R,G,B to Y,Cb,Cr color space

                """Condition to check that pixel is skin clor or not skin color """
                #Pre-calculate for Cr condition
                if Y > 128.0 :
                    Q1 = ((256.0-Y)/16.0)-2.0
                    Q2 = 20.0-((256.0-Y)/16.0)
                    Q3 = 6.0
                    Q4 = -8.0
                elif Y <= 128.0 :
                    Q1 = 6.0
                    Q2 = 12.0
                    Q3 = 2.0+(Y/32.0)
                    Q4 = (Y/16.0)-16.0
                    
                """Cr condition if that pixel has property that match with this condition , that pixel is skin color pixel"""
                CrCondition = (Cr >= -2.0*(Cb+24.0) and Cr >= -1.0*(Cb+17.0) and Cr >= -4.0*(Cb+32.0) and Cr >= 2.5*(Cb+Q1) and Cr >= Q3 and Cr >= -0.5*(Q4-Cb) and Cr <= (220.0-Cb)/6.0 and Cr <= (4.0/3.0)*(Q2-Cb))
                #HSVCondition = ((S >= 10 and V >= 40 and S <= (110 - (H + (0.1*V))) and H <= ((-0.4*V) + 75)) and not ((H >= 0 and S <= ((0.08*(100-V)*H) + (0.5*V))) or (H < 0 and S <= (0.5*H)+35)))

                """Check our pixel with Cr condition and sobel(from skin pixel isn't eage pixel) """
                if CrCondition and not (r == 255 or g == 255 or b == 255):
                    
                    """mark that pixel to skin pixel"""
                    self.v[i][j] = self.iv

                    """count number of skin pixel in region"""
                    self.countin = self.countin + 1

                    """Check their neighbor with recursive Function Setskin . We check all neighbor of that pixel(8-nighbor)"""
                    self.SetSkin(i-1,j-1)
                    self.SetSkin(i-1,j)
                    self.SetSkin(i-1,j+1)
                    self.SetSkin(i,j-1)
                    self.SetSkin(i+1,j-1)
                    self.SetSkin(i,j+1)
                    self.SetSkin(i+1,j)
                    self.SetSkin(i+1,j+1)

        
        except IndexError,MemoryError:
            """When have someting error program will tall us about pixel yhat has error"""
            print i,j
        #else :
        #    im.putpixel((i,j),(255,255,255))

        """Don't have skin pixel in that region return to main function to find another region"""
        return

    def calWeight(self):
        """ Function to calculate 6 dimention of attribute that we retrive from main function"""

        """If count empty that mean don't have skin pixel in source Image we return 0 for all dimention"""
        if self.count == [] : return 0,0,0,0,0,0

        """Crate parameter for use in function"""
        Region = [] ; RegionMx = [] ; RegionMy = [] # Information about Region
        loopc = 1 #loop count 
        allsize = 0 # all number of skin color pixel in source Image 
        locationM = 0 # Index to Region that has maximum number of pixel
        MAXC = max(self.count) # maximum number of pixel in source Image

        # filter small area
        for size in self.count:
            if size > 50 :
                Region.append(loopc) # keep Index of region in Image
                allsize = allsize+size # count pixel that is skin pixel
            if MAXC == size:
                locationM = loopc # keep Index of maximum region in Image
            loopc = loopc+1

        """After filter if Image don't have Region that has pixel more than 50 pixel we will ignore it and return 0 for all dimention""" 
        if allsize == 0 : return 0,0,0,0,0,0

        """we will find region with Index from above"""
        for i in range(self.im.size[0]):
            for j in range(self.im.size[1]):
                
                """Ignore region that has small size"""
                if self.v[i][j] not in Region :
                    #self.im.putpixel((i,j),(255,255,255))
		    pass
                    
                """when meet region that has maximum size we will keep its coordinate"""
                if self.v[i][j] == locationM:
                    RegionMy.append(i)
                    RegionMx.append(j)

        """Calculate 6 dimention of source Image"""
        
        """First Dimention is Ratio of largest per all"""
        LargePerAll = max(self.count)* 100.0 / allsize

        """Second Dimention is Ratio of height"""
        Rheight = (max(RegionMx) - min(RegionMx) +1) * 100.0 /self.im.size[1]

        """Third Dimention is Ratio of width"""
        Rwidth  = (max(RegionMy) - min(RegionMy) +1) * 100.0 /self.im.size[0]

        """Fourth Dimention is Ratio of skin area"""
        allsize = allsize*100.0/ (self.im.size[0] * self.im.size[1]) # the ratio of skin area to image area

        """Fifth Dimention is Ratio of largest area"""
        size = max(self.count)*100.0/ (self.im.size[0] * self.im.size[1]) # the ratio of the area of the largest skin segment to the image area

        """Sixth Dimention is Number of segment"""
        nsegment = len(Region)

        """Return all dimention"""
        return allsize,size,nsegment,Rheight,Rwidth,LargePerAll 
    
    def SobelMask(self):
        """Function to call gen function in Sobel"""

        """Create mask for sobel"""
        maskX = [1,2,1,0,0,0,-1,-2,-1]
        maskY = [1,0,-1,2,0,-2,1,0,-1]

        """Call function gen fromSobel"""
        m = gen(self.im,maskX,maskY)

        """Retrun Image that had been sobeled"""
        return m


class Classified:
    """Class for classifly Image by their dimention"""
    
    def __init__(self) :
        """ Create init parameter that gave from eigen function """

        """Eigenvector of dimention taht have maximum eigen value """
        self.eigenvec = [ [-0.46076256 ,-0.48284077 , 0.2327821 , -0.05986624  ,0.10544402 , 0.69690225],
                          [ 0.37311171 , 0.37007975  ,0.03439508 ,0.50656072 , 0.50569109  ,0.45860481]]

        self.mean_di_1 = 34.63125 # mean of dimention 1
        self.mean_di_2 = 32.711525 # mean of dimention 2
        self.mean_di_3 = 12.8 # mean of dimention 3
        self.mean_di_4 = 56.332 # mean of dimention 4
        self.mean_di_5 = 58.8755 # mean of dimention 5
        self.mean_di_6 = 65.11667025 # mean of dimention 6
        self.cen1 = [-34.1640,28.3840] # Centriod of group 1 that isn't Pornographic
        self.cen2 = [76.3960,-4.6239] # Centriod of group 2 that is Pornographic
        self.cen3 = [-113.0394,-18.9615] # Centriod of group 3 that hasn't skin pixel

    def Fn_Eigenvec(self,Data) :
        """Function to find FinalData to use in K-nearest neighbor"""

        """Find DataAdjusted By minus every data with their mean"""
        DataAdj = []
        DataAdj.append([Data[0][0] - self.mean_di_1])
        DataAdj.append([Data[1][0] - self.mean_di_2])
        DataAdj.append([Data[2][0] - self.mean_di_3])
        DataAdj.append([Data[3][0] - self.mean_di_4])
        DataAdj.append([Data[4][0] - self.mean_di_5])
        DataAdj.append([Data[5][0] - self.mean_di_6])

        """Calculate FinalData by multiply eigenvector with DataAdjusted"""
        FinalData = matrixmultiply(self.eigenvec,DataAdj)

        """Call Function KNN for classifier data with K-nearest neighbor"""
        cas,Dall = self.KNN(FinalData)
        return FinalData[1],FinalData[0],cas,Dall

    def KNN(self,Final) :
        """Function classified data with K-nearest neighbor"""
        
        j = 0
        cas = []

        """Find lenght of that dimention with 3 centriod"""
        dist1 = math.sqrt(( (Final[1] - self.cen1[0])*(Final[1] - self.cen1[0]) ) + ( (Final[0] - self.cen1[1])*(Final[0] - self.cen1[1]) ))
        dist2 = math.sqrt(( (Final[1] - self.cen2[0])*(Final[1] - self.cen2[0]) ) + ( (Final[0] - self.cen2[1])*(Final[0] - self.cen2[1]) ))
        dist3 = math.sqrt(( (Final[1] - self.cen3[0])*(Final[1] - self.cen3[0]) ) + ( (Final[0] - self.cen3[1])*(Final[0] - self.cen3[1]) ))

        """Find shortest lenght from 3 length"""
        Dall = min([dist1,dist2,dist3])
        if Dall == dist2 :
            cas.append(2)
	    return cas,Dall
        elif Dall == dist1 :
            cas.append(1)
	    return cas,0
        elif Dall == dist3 :
            cas.append(3)
	    return cas,0

        """return group of that dimension that tell your image is pornographic or not"""

##########################################################################
# Class for multithread program   
class SemaphoreThread1( threading.Thread ):
   """Class using semaphores"""

   DB = AccessDB()  

   countImg = DB.findj('SELECT COUNT(*) FROM IMAGE')
   if countImg :
	avi = DB.findj('SELECT min(ID) FROM IMAGE WHERE DATE_TIME IS NULL')
   	#print "start URL's id is :",avi
   else:
	avi = 1
   	
   print "start IMAGE's id is :",avi
   DB.close()
   del DB	
    # 96 threads for init if use more than 96 thread force too many connection to Database error
   available = [ availy for availy in range(avi,avi+96) ]  

   def __init__( self, semaphore ):
      """Initialize thread"""

      threading.Thread.__init__( self)

      # set the semaphore as a data attribute of the class
      self.threadSemaphore1 = semaphore     

    # Overwrite run function
   def run( self ):
      """Run program and release semaphore"""
      
      # Create Class inherit from htmllib.HTMLParser
      
      # acquire the semaphore
      self.threadSemaphore1.acquire()
      
      # remove a table from the list
      table = SemaphoreThread1.available.pop(0)
      
      # add next table
      SemaphoreThread1.available.append( table + 96 )
      
      # call run main function to execution URL
      self.running(table)
      
      # release the semaphore after execution finishes
      self.threadSemaphore1.release()
                
    # main function for execution URL            
   def running(self, ids):
	global t2
	t2 = os.getpid()
	DBobj = AccessDB()
	myURL = DBobj.findbut(ids,'IMAGE')
	contentType='image'
	if myURL != 0 :
		components = urlparse.urlparse( myURL )
        	#if addressing scheme not specified, use http
		
        	if components[ 0 ] == "":
            		myURL = "http://" + myURL
            
        	# connect and retrieve the file
		try:
			fp = urllib2.urlopen(urllib2.Request(myURL))
			if fp.info( ).getmaintype( ) == contentType.lower( ) :
     				img = cStringIO.StringIO(fp.read())
			
				#im = img.convert('RGB').resize((100,100))
        			"""Open Image and convert to RGB color space and resize to 100*100 pixel"""
				fp.close()
        			im = Image.open(img)
				im = im.convert('RGB')
				orgSi1 = im.size[0]
				orgSi2 = im.size[1]
			
				#print len(IsoIm.v)
				if orgSi1 >= 50 and orgSi2 >= 50 :
					if im.size[0] > 100 or im.size[1] > 100:
						im = im.resize((int(im.size[0]*100.0/max(im.size)),int(im.size[1]*100.0/max(im.size))))
        			#print im.format ,im.size ,im.mode
					IsoIm = GetImage(im)
					IsoIm.findSkin()

					allsize,size,nsegment,Rheight,Rwidth,LargePerAll = IsoIm.calWeight()
					#print """#####Image name : %s  id = %d old size = %d*%d new size = %d*%d#####"""%(myURL,ids,orgSi1,orgSi2,im.size[0],im.size[1])
					print """#####Image name : %s  id = %d#####"""%(myURL,ids)
					print """Ratio of skin area '%s' Ratio of largest area '%s' Number of segment '%s'
Ratio of height '%s' Ratio of width '%s' Ratio of largest per all '%s'
      			"""%(allsize,size,nsegment,Rheight,Rwidth,LargePerAll)
					x = [allsize] ; y = [size] ; z = [nsegment*100.0/13.0] ; a = [Rheight] ; b = [Rwidth] ; c = [LargePerAll]
					Data = array([x,y,z,a,b,c])
					Classifier = Classified()
					Final1,Final2,cas,Dall = Classifier.Fn_Eigenvec(Data)
					if cas[0] == 2:
						Dall = 100 - (((Dall-0.967659473553)*50.0)/63.3066624332)
					DBobj.updatebut('IMAGE','IMAGE_WEIGHT',Dall,ids)	
					print cas,Dall
					#IsoIm.im.show()
				else : print "%s's size is %d ,%d id = %d"%(myURL,orgSi1,orgSi2,ids)
			else : print "%s's id = %d is not image"%(myURL,ids)

		except urllib2.HTTPError,e:
            		print myURL,"Error code : ",e.code,"id: %d "%ids
            
            	# error when get not html file
        	except htmllib.HTMLParseError:
            		print myURL,"parse error id: %d "%ids
            
            	# error don't find URL
        	except IOError:
            		print myURL,"Error finding file id: %d "%ids
            
            	# error when URL invalid
        	except httplib.InvalidURL:
            		print myURL,"InvalidURL id: %d "%ids

        	except Exception,e :
            		print myURL,"Error :",e,"id: %d "%ids
	else : 
		print "I can't access your Image id %d "%(ids)
        DBobj.updatebut('IMAGE','DATE_TIME','now()',ids)
	DBobj.close()       
        del DBobj
        
##########################################################
def stop(signalNumber, frame):
    os.popen("kill -9 "+str(t2))
    print "Exit"

def main():
	#runp(1,5)
	# list of threads
    threads = []
    t1 , t2 = 0,0
    t1 = os.getpid()
    # semaphore allows 96 threads to enter critical section Database
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
        if threading.activeCount() < 129:
            SemaphoreThread1( threadSemaphore1 ).start()
        else : pass

if __name__ == "__main__":
    warnings.filterwarnings('ignore','.*',DeprecationWarning)
    signal.signal(signal.SIGINT ,stop)
    #warnings.filterwarnings('ignore', category=DeprecationWarning)
    main()
