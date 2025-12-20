#!/usr/local/bin/python2.5

import Image
import math

def gen(im,maskX,maskY):
    img_output = Image.new("RGB",(im.size[0],im.size[1]))
    for x in range(1,im.size[0]-1):
        for y in range(1,im.size[1]-1):
            r = []; g=[]; b=[]
            for i in range(-1,2):
                for j in range(-1,2):
                    tmp = im.getpixel((x+i,y+j))
                    r.append(tmp[0])
                    g.append(tmp[1])
                    b.append(tmp[2])
            Red = Convolution(maskX,maskY,r)
            Green = Convolution(maskX,maskY,g)
            Blue = Convolution(maskX,maskY,b)
            RGB = (Red,Green,Blue)
            img_output.putpixel((x,y),RGB)
    return img_output

def Convolution(CoefficientX,CoefficientY, Raw_Data):
          mX = []
          mY = []
          for i in range(len(CoefficientX)):
                    mX.append(CoefficientX[i] * Raw_Data[i])
                    mY.append(CoefficientY[i] * Raw_Data[i])
          return math.fabs(sum(mX))+math.fabs(sum(mY))
        
#ims = Image.open('C:/Image_test/porn/24.jpg')
#iml = ims.convert('RGB')
#im = iml.resize((256,256))
#maskX = [1,2,1,0,0,0,-1,-2,-1]
#maskY = [1,0,-1,2,0,-2,1,0,-1]
#m = gen(im,maskX,maskY)
#img1 = Image.new("L",(im.size[0],im.size[1]))
#img2 = Image.new("L",(im.size[0],im.size[1]))
#img3 = Image.new("L",(im.size[0],im.size[1]))
#for i in range(im.size[0]):
#    for j in range(im.size[1]):
#        r1,g1,b1 =m.getpixel((i,j))
#        img1.putpixel((i,j),r1)
#        img2.putpixel((i,j),g1)
#        img3.putpixel((i,j),b1)    
#m = m.convert('L')
#img1.show()
#img2.show()
#img3.show()
#del m
#del ims
#del iml
#del im
#del img1
#del img2
#del img3
        
