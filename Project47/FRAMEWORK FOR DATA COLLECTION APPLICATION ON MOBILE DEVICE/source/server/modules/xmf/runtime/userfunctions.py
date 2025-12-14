#!/usr/bin/env python
from mx import DateTime

def DATE(date):
  if str(type(date)) == "<type 'DateTime'>":
    return date.absdate
  elif str(type(date)) == "<type 'str'>":
    return DateTime.DateTimeFrom(date).absdate
  
def TIME(time):
  if str(type(time)) == "<type 'DateTime'>":
    return date.abstime
  elif str(type(time)) == "<type 'str'>":
    return DateTime.DateTimeFrom(time).abstime
  
def DATETIME(datetime):
  return DateTime.DateTimeFrom(datetime)

def TODAY():
  return DateTime.today().absdate