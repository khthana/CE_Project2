# import MySQL module
import urllib2
from urlparse import urlsplit, urljoin

from datetime import date

from httplib import HTTPConnection
from httplib import InvalidURL
from httplib import BadStatusLine

from urllib import urlretrieve

from urllib2 import URLError
from urllib2 import HTTPError

from errno import ECONNRESET

from sys import exitfunc
from time import sleep

from string import replace

import re
import string
import urllib
import os
import sys
import MySQLdb
import cgi

import socket

import atexit

import Image
import cStringIO

import thread
from thread import start_new_thread

import httplib

import codecs


# connect
db = MySQLdb.connect(host="localhost", user="root", passwd="",
db="python")

# create a cursor
cursor = db.cursor()


#=================================INITIAL=============================

cursor.execute("INSERT INTO `table_id_process` ( `id` , `start` , `stop` ) VALUES ('', '0', '0');")
