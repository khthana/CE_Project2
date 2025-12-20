#!/usr/local/bin/python2.5

import math
from  operator import div
import urllib2
#Import Function from Library to calculate Eigenvector
from Numeric import *
from LinearAlgebra import eigenvectors
from pylab import *
import warnings
from TextDetection import DetectText
import threading

#class Cthread(threading.Thread):

#	def __init__(self,URL):
#		threading.Thread.__init__(self)
#		self.URL = URL

#	def run(self):
#		v = Classified()
#		try:
#        		tmp = urllib2.urlopen(self.URL)
#        		result = DetectText(tmp.read())
#        		x,y,z= v.Fn_Eigenvec(array(result))
#        		count = count+1
#        		tmp.close()
#    		except IOError:
#        		print "Error finding file"
#        		counterr = counterr+1
#        		count = count+1
#

class Classified:
    """Class for classifly Image by their dimention"""

    def __init__(self) :
        """ Create init parameter that gave from eigen function """

        """Eigenvector of dimention taht have maximum eigen value """
        self.eigenvec =[[-0.35957221,-0.11547346,0.22476676,-0.03699852,-0.49346665,-0.2672396,-0.45560666,-0.38026062,-0.18904029,-0.04007976,0.22476676,0.22476676],	[-0.02643652,-0.07546966,-0.5233763,-0.00477049,-0.2355682,-0.05733572,-0.23198271,-0.2405511,-0.03371648,0.0147328,-0.5233763,-0.5233763]]
        self.meanx =[5.58635925749,8.88960666092,3.52777319625,1.78576732306,4.67169396973,4.09699218735,3.99004289414,3.2875139534,2.08888617605,1.27299631176,3.52777319625,3.52777319625]

    def Fn_Eigenvec(self,Data) :
        """Function to find FinalData to use in K-nearest neighbor"""

        """Find DataAdjusted By minus every data with their mean"""
        DataAdj = []
        for i in range(len(Data)):
            DataAdj.append([Data[i][0] - self.meanx[i]])

        """Calculate FinalData by multiply eigenvector with DataAdjusted"""
        FinalData = matrixmultiply(self.eigenvec,DataAdj)

        """Call Function KNN for classifier data with K-nearest neighbor"""
        distance = self.lineUpDown(FinalData)
        return distance

    def lineUpDown(self,Final) :
        """Function classified data with K-nearest neighbor"""

        b = Final[0] - (2.6741*Final[1])
	#print "slop: ",b

	if b >= - 9.9498:
	    distance = self.Cal_Weight(Final)
	else :
	    distance = 0
	return distance

    def Cal_Weight(self,Final):
        x = Final[1]
        y = Final[0]
        xx = x[0]
        yy = y[0]
        distance = (yy-(2.6741*xx)+9.9498)/2.855
	if distance >= 50:
		distance = 50
	distance = distance*2
	if distance<1:
		distance = 0
#	distance = ((70*distance)/100)+30
	return distance

        """return group of that dimension that tell your image is 
pornographic or not"""
#F = open("/root/porn.txt","r")
#link = F.readlines()
#global counterr
#global count
#global countp
#global countn
#global maxl
#global minl
#global URLm
#global weight
#counterr = 0
#count = 0
#countp = 0
#countn = 0
#maxl = 0
#minl = 200
#URLm = []
#weight = []
#if len(link) > 97:
#	Cthread(link[0]).start()
#	st = 1
#	print st,"###########"
#	while True:
#		if threading.activeCount() < 97 :
#			if threading.activeCount() == 0 or st >= len(link):
#				break
#         		Cthread(link[st]).start()
#	    		st = st + 1
#			print st,"###########"
#        	else : pass
#else : 
#	for i in range(0,len(link)):
#		Cthread(link[i]).start()


#print "STOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOP"
#Fi = open("/root/result_pornweb.txt","w")
#Fi.write("total web = "+str(count)+"\n"+"porn web = "+str(countp)+"\n"+"non porn web = "+str(countn)+"\n"+"error find = "+str(counterr)+"\n"+"min distance = "+str(minl)+"\n"+"maxdistance = "+str(maxl)+"\n"+str(URLm)+str(len(URLm))+"\n"+str(weight))
#Fi.close()
#sys.exit(0)

