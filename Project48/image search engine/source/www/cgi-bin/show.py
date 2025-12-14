#! C:\Python24\python.exe
# import MySQL module
print 'Content-type: text/html\n'
import MySQLdb
import cgi, re
import cgi
import cgitb; cgitb.enable()
import os, sys
import Image
import cStringIO 
import urllib
import urllib2

form=cgi.FieldStorage()
if form.has_key("filename"):
    filename=form["filename"].value
else:
    filename=""

##print("c:/appserv/www/"+filename)

#histogram
img = Image.open("c:/appserv/www/"+filename)
a=img.getdata()

histogram=list()

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

print """<meta http-equiv="refresh" content="0;url=http://161.246.5.92/display.php?display=%s&filename=%s"> """%(histogram,filename)
