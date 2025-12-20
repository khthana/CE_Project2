# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#                                                                                     #
#  World Wide Web malefic code inspection system.                                     #
#  **** AccessDB1 ****                                                                #
#  Programer : Paktoon Jaithong & Pichanee Tassanasatien                              #
#  Interface : Command Line Interface                                                 #
#  connect to Web server : urllib2 & Htmllib                                          #
#  Save links in page : Database MySQL                                                #
#  program OK successful : a little bit error with tag is't <a>                       #
#  Input url from init row in Database                                                #
#  Combine with another source                                                        #
#                                                                                     #
#  Ctrl-C to stop program                                                             #		#             									      #
# # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #
#!/usr/local/bin/python2.5

import MySQLdb
import sys
__all__ = ["AccessDB"]
# Class for insert ,find ,close data in Database project
class AccessDB:
   
   def __init__(self):
      #init Class for connect and cursor
      try:
      	self.connection = MySQLdb.connect(passwd = "098234373",db = "PROJECT")
      	self.cursor = self.connection.cursor()
      except MySQLdb.OperationalError, message:
	print "Error %d:\n%s" %\
                        (message[0],message[1])
	
      
   def findbut( self,id ,table):
      
      #connecting with database
      try:
          query = """SELECT URL FROM %s WHERE ID = %s""" %(table,id)
          self.cursor.execute(query)
          row = self.cursor.fetchone()
          if row:
             return row[0]
          else:
             print "Error","no ID: "+str(id)
	     return None
      #error connecting to database
      except MySQLdb.OperationalError, message:
             print "Error %d:\n%s" %\
                        (message[0],message[1])
      except UnicodeDecodeError:
          print "find invalid language"
   def insertbut( self,table ,url ,ids):
      #connecting with database
      try:
          query = """INSERT INTO %s(URL,URL_ID) VALUES ('%s',%d) """ %(table,url,ids)
          self.cursor.execute(query)
          self.connection.commit()
 
      #error connecting to database
      except MySQLdb.DatabaseError, message:
             pass
      except UnicodeDecodeError:
          print "insert invalid language"

   def updatebut( self,table,field,timestamp,ids):
      try:
         query = """UPDATE %s SET %s = %s WHERE ID = "%d" """ %(table,field,timestamp,ids)
         self.cursor.execute(query)
         self.connection.commit()
      except MySQLdb.DatabaseError, message:
             pass
      except UnicodeDecodeError:
          print "insert invalid language" 

   def inserti( self,query):
	#connecting with database
      try:
          self.cursor.execute(query)
          self.connection.commit()
 
      #error connecting to database
      except MySQLdb.DatabaseError, message:
             pass
      except UnicodeDecodeError:
          print "insert invalid language"

   def findj( self,query):
      
      #connecting with database
      try:
          self.cursor.execute(query)
          row = self.cursor.fetchone()
          if row:
             return row[0]
          else:
             return None
      #error connecting to database
      except MySQLdb.OperationalError, message:
             print "Error %d:\n%s" %\
                        (message[0],message[1])
      except UnicodeDecodeError:
          print "find invalid language"
	
   def findlist( self,query):
      
      #connecting with database
      try:
          self.cursor.execute(query)
          row = self.cursor.fetchall()
          if row:
             return row
          else:
             pass
      #error connecting to database
      except MySQLdb.OperationalError, message:
             print "Error %d:\n%s" %\
                        (message[0],message[1])
      except UnicodeDecodeError:
          print "find invalid language"

   def close( self ):
      # Close connection and cursor
      self.cursor.close()
      self.connection.close()
 
