import time
from AccessDB1 import AccessDB

def CalStat():
	print "Calculate Stat"
	DBobj = AccessDB()
	webpage1 = DBobj.findj("SELECT COUNT(*) from ALLURL")
	webpage2 = DBobj.findj("SELECT COUNT(*) from ALLURL where DATE_TIME is not null")
	webpage3 = DBobj.findj("SELECT COUNT(*) from ALLURL where DATE_TIME is not null and URL_TIMESTAMP is not null")
	webpage4 = DBobj.findj("SELECT COUNT(*) from ALLURL where DATE_TIME is not null and URL_TIMESTAMP is not null and TEXT_WEIGHT > 0")

	image1 = DBobj.findj("SELECT COUNT(*) from IMAGE")
	image2 = DBobj.findj("SELECT COUNT(*) from IMAGE where DATE_TIME is not null")
	image3 = DBobj.findj("SELECT COUNT(*) from IMAGE where DATE_TIME is not null and IMAGE_WEIGHT is not null")
	image4 = DBobj.findj("SELECT COUNT(*) from IMAGE where DATE_TIME is not null and IMAGE_WEIGHT > 0")

	website1 = DBobj.findj("SELECT COUNT(*) from ALLURL where URL_ID = 0")
	website2 = DBobj.findj("SELECT COUNT(*) from ALLURL where URL_ID = 0 and DATE_TIME is not null")
	website3 = DBobj.findj("SELECT COUNT(*) from  ALLURL where URL_ID = 0 and DATE_TIME is not  null and URL_TIMESTAMP is not null")
	website4 = DBobj.findj("SELECT COUNT(*) from PORN_WEB")
	time = DBobj.findj("SELECT max(DATE_TIME) from PORN_WEB")
	print "webpage",webpage1,webpage2,webpage3,webpage4
	print "image",image1,image2,image3,image4
	print "website",website1,website2,website3,website4
	fi = open("/usr/local/apache/htdocs/stat.txt",'w')
	fi.write(str(webpage1)+'\n'+str(webpage2)+'\n'+str(webpage3)+'\n'+str(webpage4)+'\n'+str(image1)+'\n'+str(image2)+'\n'+str(image3)+'\n'+str(image4)+'\n'+str(website1)+'\n'+str(website2)+'\n'+str(website3)+'\n'+str(website4)+'\n'+str(time))
	fi.close()
	print "Finish"

def main():
	CalStat()

if __name__ == "__main__":
   	main()
