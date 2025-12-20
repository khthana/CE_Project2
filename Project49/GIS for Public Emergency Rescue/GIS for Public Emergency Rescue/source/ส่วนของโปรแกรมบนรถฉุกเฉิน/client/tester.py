import urllib2

req_str = "http://www.natur.in.th/xml/serv.py/carserver"
reqOnline = urllib2.Request(req_str)
fd = urllib2.urlopen(reqOnline)
cars = fd.read(1024)
print cars

serv_point = cars.split(',')

print len(serv_point)

print serv_point

req_str = "http://www.natur.in.th/xml/serv.py/requestserver"
reqOnline = urllib2.Request(req_str)
fd = urllib2.urlopen(reqOnline)
xypoint = fd.read(1024)
print xypoint