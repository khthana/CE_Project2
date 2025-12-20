#!/usr/local/bin/python2.5

from Numeric import *
from LinearAlgebra import eigenvectors
from pylab import *

def ev_sort(eigval,eigvec):
  newval=zeros(len(eigval),Float)
  newvec= zeros(eigvec.shape,Float)
  index=argsort(eigval)
  for i in index:
    newval[i]=eigval[index[i]]
    newvec[i,:]=eigvec[index[i],:] 
  return newval,newvec

def EigenVec(Data):
    DataAdjusted = []
    for i in Data:
        DataAdjust = []
        ME = mean(i)
        for j in i:
            DataAdjust.append(j-ME)
        DataAdjusted.append(DataAdjust)
    Dcov = cov(transpose(DataAdjusted)) 
    val , vec = eigenvectors(Dcov)
    val,vec = ev_sort(val,vec)
    print "#######Your Eigenvalue#######"
    print val
    print "#######Your Eigenvector#######"
    print vec
    print "#######Your Max Eigenvector#######"
    print vec[-2:]
    FinalData = matrixmultiply(vec[-2:],DataAdjusted)
    clf()
    #f = open("C:/kmean.txt",'a')
    #f.write('[')
    #for i in range(len(FinalData[1])) :
    #    f.write(str(FinalData[1][i])+' '+str(FinalData[0][i])+';')
    #f.write(']')
    #f.close()
    #x = FinalData[1]
    #y = FinalData[0]
    #a,b = Kmean(x,y)
    print FinalData
    #plot(FinalData)
    #show()

x = [2.5,0.5,2.2,1.9,3.1,2.3,2,1,1.5,1.1]
y = [2.4,0.7,2.9,2.2,3.0,2.7,1.6,1.1,1.6,0.9]
D = array([x,y])
EigenVec(D)
