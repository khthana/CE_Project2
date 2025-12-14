#!"D:/Python24/python.exe"
# database.py

import MySQLdb
import sys

def connect_to_db(hst, usr, psswrd, db):
    
    # connect to database and retrieve a cursor
    try:
        connection = MySQLdb.connect(host = hst, \
                                     user = usr, \
                                     passwd = psswrd, \
                                     db = db )

    # error connecting to database
    except MySQLdb.OperationalError, error:
        print "Error %d: %s" % (error.args[0], error.args[1])
        sys.exit(1)

    # retrieve cursor
    else:
        cursor = connection.cursor()
        cursor.execute( "SET NAMES UTF8" )
        return (connection, cursor)



def close_cnnctn_to_db(connection, cursor):
    
    # close cursor and connection
    cursor.close()
    connection.close()
    return None
    


