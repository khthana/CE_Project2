#!/usr/bin/env python
# -*- coding: cp874 -*-

import sys,time
from Numeric import *
from mod_python import apache
import pg

PI_VALUE = 3.14159265
FOURTHPI = PI_VALUE / 4
DEG2RAD = PI_VALUE / 180.0
RAD2DEG = 180.0 / PI_VALUE

FE = 500000.0
OK = 0.9996
CHAR_ARRAY = "CDEFGHJKLMNPQRSTUVWX"

def CalculateESquared( a, b ):
    return ( ( a * a ) - ( b * b ) ) / ( a * a )

def CalculateE2Squared( a, b ):
    return ( ( a * a ) - ( b * b ) ) / ( b * b )

def denom( es, sphi ):
    sinSphi = sin( sphi )
    return sqrt( 1.0 - es * ( sinSphi * sinSphi ) )

def sphsr( a, es, sphi ):
    dn = denom( es, sphi )
    return a * ( 1.0 - es ) / ( dn * dn * dn )

def sphsn( a, es, sphi ):
    sinSphi = sin( sphi )
    return a / sqrt ( 1.0 - es * ( sinSphi * sinSphi ) )

def sphtmd( ap, bp, cp, dp, ep, sphi ):
    return ( ap * sphi ) - ( bp * sin( 2.0 * sphi ) ) + ( cp * sin( 4.0 * sphi ) ) - ( dp * sin( 6.0 * sphi ) ) + ( ep * sin( 8.0 * sphi ) )

##=======================================================================
## Purpose:
##  This function converts the specified lat/lon coordinate to a UTM
##  coordinate.
## Parameters:
##  double a:
##      Ellipsoid semi-major axis, in meters. (For WGS84 datum, use 6378137.0)
##  double f:
##      Ellipsoid flattening. (For WGS84 datum, use 1 / 298.257223563)
##  int& utmXZone:
##      Upon exit, this parameter will contain the hotizontal zone number of
##      the UTM coordinate.  The returned value for this parameter is a number
##      within the range 1 to 60, inclusive.
##  char& utmYZone:
##      Upon exit, this parameter will contain the zone letter of the UTM
##      coordinate.  The returned value for this parameter will be one of:
##      CDEFGHJKLMNPQRSTUVWX.
##  double& easting:
##      Upon exit, this parameter will contain the UTM easting, in meters.
##  double& northing:
##      Upon exit, this parameter will contain the UTM northing, in meters.
##  double lat, double lon:
##      The lat/lon coordinate to convert.
## Notes:
##  - The code in this function is a C conversion of some of the source code
##    from the Mapping Datum Transformation Software (MADTRAN) program,
##    written in PowerBasic.  To get the source code for MADTRAN, go to:
##
##      http:##164.214.2.59/publications/guides/MADTRAN/index.html
##    
##    and download MADTRAN.ZIP
##  - If the UTM zone is out of range, the y-zone character is set to the
##    asterisk character ('*').
##=======================================================================
def LatLonToUtm( a, f, lat, lon ):
    
##void LatLonToUtm (double a, double f, int& utmXZone, char& utmYZone,
##	double& easting, double& northing, double lat, double lon) 

    if lon <= 0.0 : 
	utmXZone = 30 + int( lon / 6.0 )
    else :
	utmXZone = 31 + int( lon / 6.0 )
    
    if lat < 84.0 and lat >= 72.0 :
        ##Special case: zone X is 12 degrees from north to south, not 8.
	utmYZone = CHAR_ARRAY[ 19 ]
    else :
	inarr = int( ( lat + 80.0 ) / 8.0 )
	##print inarr
	utmYZone = CHAR_ARRAY[ inarr ]
	##echo (int)(($lat + 80.0) / 8.0);
	##echo $cArray[11];
	##echo $utmYzone;
	
    if lat >= 84.0 or lat < -80.0 :
	##Invalid coordinate; the vertical zone is set to the invalid
	##character.
	utmYZone = '*'
	
    #$utmYZone = '*';

    latRad = lat * DEG2RAD
    lonRad = lon * DEG2RAD
    recf = 1.0 / f
    b = a * ( recf - 1.0 ) / recf
    eSquared = CalculateESquared( a, b )
    e2Squared = CalculateE2Squared( a, b )
    tn = ( a - b ) / ( a + b )
    tn2 = ( tn * tn )
    tn3 = ( tn2 * tn )
    tn4 = ( tn2 * tn2 )
    tn5 = ( tn2 * tn3 )

    ap = a * ( 1.0 - tn + 5.0 * ( tn2 - tn3 ) / 4.0 + 81.0 * ( tn4 - tn5) / 64.0 )
    bp = 3.0 * a * ( tn - tn2 + 7.0 * ( tn3 - tn4 ) / 8.0 + 55.0 * tn5 / 64.0 ) / 2.0
    cp = 15.0 * a * ( tn2 - tn3 + 3.0 * ( tn4 - tn5 ) / 4.0 ) / 16.0
    dp = 35.0 * a * ( tn3 - tn4 + 11.0 * tn5 / 16.0 ) / 48.0
    ep = 315.0 * a * ( tn4 - tn5 ) / 512.0
    olam = ( utmXZone * 6 - 183 ) * DEG2RAD
    dlam = lonRad - olam
    s = sin( latRad )
    c = cos( latRad )
    t = s / c
    eta = e2Squared * ( c * c )
    sn = sphsn( a, eSquared, latRad )
    tmd = sphtmd( ap, bp, cp, dp, ep, latRad )
    t1 = tmd * OK
    t2 = sn * s * c * OK / 2.0
    t3 = sn * s * ( c * c * c ) * OK * ( 5.0 - ( t * t ) + 9.0 * eta + 4.0 * ( eta * eta ) ) / 24.0
    if latRad < 0.0 :
        nfn = 10000000.0
    else :
        nfn = 0

    northing = nfn + t1 + ( dlam * dlam ) * t2 + ( dlam * dlam * dlam * dlam ) * t3 + ( dlam * dlam * dlam * dlam * dlam * dlam ) + 0.5
    t6 = sn * c * OK
    t7 = sn * ( c * c * c ) * ( 1.0 - ( t * t ) + eta ) / 6.0
    easting = FE + dlam * t6 + ( dlam * dlam * dlam ) * t7 + 0.5
    if ( northing >= 9999999.0 ):
        northing = 9999999.0

    outPut = ( utmXZone, utmYZone, easting, northing )
    
    return outPut

##=======================================================================
##  Purpose:
##  This function converts the specified lat/lon coordinate to a UTM
##  coordinate in the WGS84 datum.  (See the comment block for the
##  LatLonToUtm() member function.)
##=======================================================================

def LatLonToUtmWGS84( lat, lon ):
    return LatLonToUtm( 6378137.0, 1 / 298.257223563, lat, lon )

#print LatLonToUtmWGS84( 13.75, 100.5 )

##=======================================================================
## Purpose:
##  This function converts the specified UTM coordinate to a lat/lon
##  coordinate.
## Pre:
##  - utmXZone must be between 1 and 60, inclusive.
##  - utmYZone must be one of: CDEFGHJKLMNPQRSTUVWX
## Parameters:
##  double a:
##      Ellipsoid semi-major axis, in meters. (For WGS84 datum, use 6378137.0)
##  double f:
##      Ellipsoid flattening. (For WGS84 datum, use 1 / 298.257223563)
##  int utmXZone:
##      The horizontal zone number of the UTM coordinate.
##  char utmYZone:
##      The vertical zone letter of the UTM coordinate.
##  double easting, double northing:
##      The UTM coordinate to convert.
##  double& lat:
##      Upon exit, lat contains the latitude.
##  double& lon:
##      Upon exit, lon contains the longitude.
## Notes:
##  The code in this function is a C conversion of some of the source code
##  from the Mapping Datum Transformation Software (MADTRAN) program, written
##  in PowerBasic.  To get the source code for MADTRAN, go to:
##
##    http:##164.214.2.59/publications/guides/MADTRAN/index.html
##
##  and download MADTRAN.ZIP
##=======================================================================
def UtmToLatLon( a, f, utmXZone, utmYZone, easting, northing ):
    ##void UtmToLatLon (double a, double f, int utmXZone, char utmYZone,
    ##double easting, double northing, double& lat, double& lon) 

    #global $PI, $FOURTHPI, $deg2rad, $rad2deg, $fe, $ok, $cArray;

    recf = 1.0 / f
    b = a * ( recf - 1 ) / recf
    eSquared = CalculateESquared( a, b )
    e2Squared = CalculateE2Squared( a, b )
    tn = ( a - b ) / ( a + b )
    tn2 = ( tn * tn )
    tn3 = ( tn2 * tn )
    tn4 = ( tn2 * tn2 )
    tn5 = ( tn2 * tn3 )
    ap = a * ( 1.0 - tn + 5.0 * ( tn2 - tn3 ) / 4.0 + 81.0 * ( tn4 - tn5 ) / 64.0 )
    bp = 3.0 * a * ( tn - tn2 + 7.0 * ( tn3 - tn4 ) / 8.0 + 55.0 * tn5 / 64.0 ) / 2.0
    cp = 15.0 * a * ( tn2 - tn3 + 3.0 * ( tn4 - tn5 ) / 4.0 ) / 16.0
    dp = 35.0 * a * ( tn3 - tn4 + 11.0 * tn5 / 16.0) / 48.0
    ep = 315.0 * a * ( tn4 - tn5 ) / 512.0
    if ( ( utmYZone <= 'M' and utmYZone >= 'C' ) or ( utmYZone <= 'm' and utmYZone >= 'c' ) ):
    	nfn = 10000000.0
    else :
	nfn = 0

    tmd = ( northing - nfn ) / OK
    sr = sphsr( a, eSquared, 0.0 )
    ftphi = tmd / sr
    ##double t10, t11, t14, t15
    for i in range(5) :
        t10 = sphtmd( ap, bp, cp, dp, ep, ftphi )
        sr = sphsr( a, eSquared, ftphi )
        ftphi = ftphi + ( tmd - t10 ) / sr
	
    sr = sphsr( a, eSquared, ftphi )
    sn = sphsn( a, eSquared, ftphi )
    s = sin( ftphi )
    c = cos( ftphi )
    t = s / c
    eta = e2Squared * ( c * c )
    de = easting - FE
    t10 = t / ( 2.0 * sr * sn * ( OK * OK ) )
    t11 = t * ( 5.0 + 3.0 * ( t * t ) + eta - 4.0 * ( eta * eta ) - 9.0 * ( t * t ) * eta ) / ( 24.0 * sr * ( sn * sn * sn ) * ( OK * OK * OK * OK ) ) 
    lat = ftphi - ( de * de ) * t10 + ( de * de * de * de ) * t11
    t14 = 1.0 / ( sn * c * OK )
    t15 = ( 1.0 + 2.0 * ( t * t ) + eta ) / ( 6 * ( sn * sn * sn) * c * ( OK * OK * OK ) )
    dlam = de * t14 - ( de * de * de ) * t15
    olam = ( utmXZone * 6 - 183.0 ) * DEG2RAD
    lon = olam + dlam
    lon *= RAD2DEG
    lat *= RAD2DEG

    out = ( lat, lon )
    #out[0] = lat
    #out[1] = lon
    return out

##=======================================================================
##  Purpose:
##  This function converts the specified UTM coordinate to a lat/lon
##  coordinate in the WGS84 datum.  (See the comment block for the
##  UtmToLatLon() member function.
##=======================================================================

def UtmToLatLonWGS84( utmXZone, utmYZone, easting, northing ) :

    ##void UtmToLatLonWGS84 (int utmXZone, char utmYZone, double easting,
    ##double northing, double& lat, double& lon)
    return UtmToLatLon( 6378137.0, 1 / 298.257223563, utmXZone, utmYZone, easting, northing )
# Module coorConvert
# ===================================================
# ===================================================
# ===================================================

def requestserver( req ):
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    lstServ = db.query("SELECT car.type_id,serv.serv_id,serv.x_pos,serv.y_pos FROM serv,car where state='00' and serv.car_id=car.car_id;")
    lstS = lstServ.dictresult()
    
    if len( lstS )>= 1:
        txt = lstS[0]['type_id'] + "," + lstS[0]['serv_id'] + "," + str(lstS[0]['x_pos']) + "," + str(lstS[0]['y_pos'])
        for into in range(1,len(lstS)):
            txt = txt + "," + lstS[into]['type_id'] + "," + lstS[into]['serv_id'] + "," + str(lstS[into]['x_pos']) + "," + str(lstS[into]['y_pos'])
    else :
        txt = 'Not pass'
    
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( txt )
    return

def carserver( req ):
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    readyCar = db.query("SELECT * FROM car;")
    lstCar = readyCar.dictresult()
    
    if len( lstCar )>= 1:
        txt = lstCar[0]['type_id'] + "," + lstCar[0]['car_id'] + "," + str(lstCar[0]['x_pos']) + "," + str(lstCar[0]['y_pos'])+","+lstCar[0]['status_id']
        for into in range(1,len(lstCar)):
            txt = txt + "," + lstCar[into]['type_id'] + "," + lstCar[into]['car_id'] + "," + str(lstCar[into]['x_pos']) + "," + str(lstCar[into]['y_pos'])+","+lstCar[into]['status_id']
    else :
        txt = 'Not pass'
    
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( txt )
    return

def onlogin( req, car_id ):
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    readyCar = db.query("SELECT * FROM car WHERE car_id='"+car_id+"';")
    lstReadyCar = readyCar.dictresult()
    
    if len( lstReadyCar )>= 1:
        txt = lstReadyCar[0]['type_id']
    else :
        txt = 'Not'
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( txt )
    return

def onaccept( req, car_id ):
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    
    db.query("UPDATE car SET status_id='00000002' WHERE car_id='"+car_id+"';")
    ###sqlStatement = "select * from polyamphoe"
    
    txt = 'Accept State'    
    
    result = db.query("SELECT * FROM serv WHERE car_id='"+car_id+"' and state='00';")
    lstDictServ = result.dictresult()
    if len( lstDictServ )>= 1:
        
        txt = str(lstDictServ[0]['serv_id'])
        
    else :
        txt = '0' 
           
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( txt )
    return

def onprocess( req, car_id ):
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    
    db.query("UPDATE car SET status_id='00000003' WHERE car_id='"+car_id+"';")
    ###sqlStatement = "select * from polyamphoe"
    
    txt = 'Processing State'    
        
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( txt )
    return

def onready( req, car_id, serv_id ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    
    db.query("UPDATE car SET status_id='00000001' WHERE car_id='"+car_id+"';")
    
    db.query("UPDATE serv SET state='11' WHERE serv_id='"+serv_id+"';")
    ###sqlStatement = "select * from polyamphoe"
    
    txt = 'ready State'    
        
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( txt )
    return 

def online( req, car_id, x_pos, y_pos ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    
    db.query("UPDATE car SET x_pos="+x_pos+",y_pos="+y_pos+" WHERE car_id='"+car_id+"';")
    ###sqlStatement = "select * from polyamphoe"
    
    result = db.query("SELECT * FROM serv WHERE car_id='"+car_id+"' and state='00';")
    lstDictServ = result.dictresult()
    if len( lstDictServ )>= 1:
        txt = '1'
        txt = txt + ',' + str(lstDictServ[0]['serv_id'])
        txt = txt + ',' + str(lstDictServ[0]['x_pos'])
        txt = txt + ',' + str(lstDictServ[0]['y_pos'])
        
    else :
        txt = '0'    
        
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( txt )
    return 

def requests( req, type, x_pos, y_pos ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    
    nnn = time.localtime(time.time())
    
    st = []    
    for item in nnn:
        print item
        if item < 10:
            st.append('0'+str(item))
        else :
            st.append(str(item))        
    
    readyCar = db.query("SELECT * FROM car WHERE type_id='"+type+"' and status_id='00000001';")
    lstReadyCar = readyCar.dictresult()
    
    if len(lstReadyCar) >= 1:
        icount = 0
        rx_pos = float(x_pos)
        ry_pos = float(y_pos)
        ShortDistance = pow(pow(lstReadyCar[icount]['x_pos']-rx_pos,2)+pow(lstReadyCar[icount]['y_pos']-ry_pos,2),0.5)
        for into in range(1,len(lstReadyCar)):
            tempDistance = pow(pow(lstReadyCar[into]['x_pos']-rx_pos,2)+pow(lstReadyCar[into]['y_pos']-ry_pos,2),0.5)
            if ShortDistance > tempDistance:
                icount = into
                ShortDistance = tempDistance
        car_id = lstReadyCar[icount]['car_id']    
        serv_id = st[3] + st[4] + st[5] + st[2] + st[1] + st[0]
        serv_row = {'serv_id':serv_id,'x_pos':float(x_pos),'y_pos':float(y_pos),'car_id':car_id,'state':'00'}
        db.insert('serv',serv_row)
        db.query("UPDATE car SET status_id='00000004' WHERE car_id='"+car_id+"';")
        txt = serv_id
    else :
        txt = "None"
        
    req.content_type = "text/xml" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( '<?xml version="1.0"?><service servid="'+txt+'"/>' )
    return 

def ontrack( req, serv_id ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )    
    
    carForServ = db.query("SELECT car.x_pos,car.y_pos,serv.state FROM car,serv WHERE serv_id='"+serv_id+"' and serv.car_id=car.car_id;")
    lstCarForServ = carForServ.getresult()
    
    if len(lstCarForServ) >= 1:
##        if  == '11':
        x_pos_car = lstCarForServ[0][0]
        y_pos_car = lstCarForServ[0][1]
        state = lstCarForServ[0][2]
        
    else :
        x_pos_car = 0
        y_pos_car = 0
        state = "xx"
        
    req.content_type = "text/xml" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( '<?xml version="1.0"?><cars><car state="'+state+'" xpos="'+str(x_pos_car)+'" ypos="'+str(y_pos_car)+'"/></cars>' )
    return 

# Mobile request
def requestsfrommobile( req, type, x_pos, y_pos ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )
    
    nnn = time.localtime(time.time())
# Call Method Convert
    xConverted = convertposfrommobile(x_pos)
    yConverted = convertposfrommobile(y_pos)
    temp = []
    temp = LatLonToUtmWGS84(xConverted, yConverted)
    
    x_posted = temp[2]
    y_posted = temp[3]
    
    st = []
    for item in nnn:
        print item
        if item < 10:
            st.append('0'+str(item))
        else :
            st.append(str(item))        
    
    readyCar = db.query("SELECT * FROM car WHERE type_id='"+type+"' and status_id='00000001';")
    lstReadyCar = readyCar.dictresult()
    
    if len(lstReadyCar) >= 1:
        icount = 0
        rx_pos = x_posted
        ry_pos = y_posted
        ShortDistance = pow(pow(lstReadyCar[icount]['x_pos']-rx_pos,2)+pow(lstReadyCar[icount]['y_pos']-ry_pos,2),0.5)
        for into in range(1,len(lstReadyCar)):
            tempDistance = pow(pow(lstReadyCar[into]['x_pos']-rx_pos,2)+pow(lstReadyCar[into]['y_pos']-ry_pos,2),0.5)
            if ShortDistance > tempDistance:
                icount = into
                ShortDistance = tempDistance
                
        car_id = lstReadyCar[icount]['car_id']
        serv_id = st[3] + st[4] + st[5] + st[2] + st[1] + st[0]
        serv_row = {'serv_id':serv_id,'x_pos':float(x_posted),'y_pos':float(y_posted),'car_id':car_id,'state':'00'}
        db.insert('serv',serv_row)
        db.query("UPDATE car SET status_id='00000004' WHERE car_id='"+car_id+"';")
        txt = serv_id
    else :
        txt = "Don't have car on status is ready."
        
    req.content_type = "text/xml" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write( '<?xml version="1.0"?><service servid="'+txt+'"/>' )
    return 

# Mobile Request
# Method Convert XPosition & YPosition
def convertposfrommobile(position):
        
    pos = float(position)
    WGSFactor = 186413.5111
    posConverted = pos/WGSFactor
    
    return posConverted

# Module coorConvert
# ===================================================

def camera( req, camera_ip ): #, serv_id ) :
    
#    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )    
#    
#    carForServ = db.query("SELECT car.x_pos,car.y_pos,serv.state FROM car,serv WHERE serv_id='"+serv_id+"' and serv.car_id=car.car_id;")
#    lstCarForServ = carForServ.getresult()
#    
#    if len(lstCarForServ) >= 1:
###        if  == '11':
#        x_pos_car = lstCarForServ[0][0]
#        y_pos_car = lstCarForServ[0][1]
#        state = lstCarForServ[0][2]
#        
#    else :
#        x_pos_car = 0
#        y_pos_car = 0
        
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    #req.write( '<?xml version="1.0"?><cars><car state="'+state+'" xpos="'+str(x_pos_car)+'" ypos="'+str(y_pos_car)+'"/></cars>' )
    return """<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Expires" content="Tue, 12 May 1962 1:00:00 GMT"/>
		<meta http-equiv="Pragma" content="no-cache"/>
		<meta http-equiv="Cache-Control" content="no-cache"/>
		<meta http-equiv="Content-type" CONTENT="text/html; charset=iso-8859-1"/>
		<meta http-equiv="Content-language" CONTENT="en"/>
		<title>Video from EMERGENCY</title>
		
		<!-- GLOBAL JAVASCRIPTS -->
		<script language="JavaScript" type="text/javascript"><!--
		
		function launch(url) 
		{
		  var w = 480, h = 340;

		  if (document.all) 
		  {
			w = document.body.clientWidth;
			h = document.body.clientHeight;
		  }
		  else if (document.layers)
		  {
			w = window.innerWidth;
			h = window.innerHeight;
		  }

		  var popW = 462, popH = 570;
		  var leftPos = (w-popW)/2, topPos = (h-popH)/2;

		  self.name = "opener";
		  remote = open(url, "helpWin", "resizable,scrollbars,status,width=" + popW + ",height="+popH+",left="+leftPos+",top="+topPos+"");
		}

		function openPopUp(thePage, theName, theWidth, theHeight)
		{
		  var someFeatures = 'scrollbars=yes,toolbar=0,location=no,directories=0,status=0,menubar=0,resizable=1,width=' + theWidth + ',height=' + theHeight;
		  var aPopUpWin = window.open(thePage, theName, someFeatures);

		  if (navigator.appVersion.indexOf("Win") != -1) {
			aPopUpWin.focus();
		  }

		  if (navigator.appName == "Netscape") {
			aPopUpWin.focus();
		  }
		}
		// -->
		</script>
		<SCRIPT SRC="http://"""+camera_ip+"""/incl/activeX.js"></SCRIPT>

	<!-- END GLOBAL JAVASCRIPTS -->
	</head>

	<body topmargin="0" leftmargin="0" marginwidth="0" marginheight="0" onLoad="window.resizeTo(200, 144)">
		<form>
			<table border="0" cellpadding="2" cellspacing="0" class="bg_color2" width="100%">
			  <tr>
				<td class="oddItem" align="left">

					<script language="JavaScript" type="text/javascript">
					<!--
						  var File = "http://"""+camera_ip+"""/axis-cgi/mjpg/video.cgi?";

						  File += "camera=1";
						  File += "&resolution=1280x1024";
						  File += "&compression=30";
						  File += "&rotation=0";
						  File += "&color=1";
						  File += "&squarepixel=0";
						  File += "&overlayimage=0";
						  File += "&overlaypos=0x0";
						  File += "&date=1";
						  File += "&clock=1";
						  File += "&textstring=kmitl"; //+ escape(opener.document.WizardForm.root_Image_I0_Text_String.value);
						  File += "&textpos=top";
						  File += "&fps=24";
						  //alert("ASDDDDDDDDDDDDDDDDD");

					// -->
					</script>

			<SCRIPT LANGUAGE="JavaScript">
			<!--
			if ((navigator.appName == "Microsoft Internet Explorer") && (navigator.platform != "MacPPC") && (navigator.platform != "Mac68k")) {
			  var browser = "IE"
			} else {
			  var browser = "Netscape"
			}
			//-->
			</SCRIPT>

			<SCRIPT LANGUAGE="JavaScript">
			<!--

			var useJavaApplet = "no"
			
			if (browser == "IE") 
			{
			} else 
			{
			}

			var width = parseInt(200)
			var height = parseInt(144)

			var agent = navigator.userAgent.toLowerCase();
			
			if (agent.indexOf("applewebkit/") != -1) 
			{
			  var pos = agent.indexOf("applewebkit/") + 12
			  var webKitVersion = parseInt(agent.substring(pos, agent.indexOf(" ", pos)))
			  if (webKitVersion < 416) 
			  {
				useJavaApplet = "yes";
			  }
			}

			if (useJavaApplet == "yes") {
			  document.write('<APPLET archive="ama.jar" codeBase="/java/ama" code="ama.MediaApplet" width="' + width + '" height="' + height + '">');
			  document.write('<PARAM NAME="code" VALUE="ama.MediaApplet">');
			  document.write('<PARAM NAME="archive" VALUE="ama.jar">');
			  document.write('<PARAM NAME="codebase" VALUE="/java/ama">');
			  document.write('<PARAM NAME="ama_cgi-path" VALUE="axis-cgi">');
			  document.write('<PARAM NAME="cache_archive" VALUE="ama.jar">');
			  document.write('<PARAM NAME="cache_version" VALUE="0.90.1.0">');
			  document.write('<PARAM NAME="ama_plugins" VALUE="">');
			  document.write('<PARAM NAME="type" VALUE="application/x-java-applet;version=1.4">');
				document.write('<PARAM NAME="ama_url" VALUE="' + File + '">');
			  document.write("</APPLET><br>");
			  alert("KMITL");
			} else {
				
			  if (browser == "IE") {
				var imagepath = File
				var installText1 = "which enables streaming"; 
				var videoText = "video";
				var installText2 = "in Microsoft Internet Explorer, has not been installed or could not be registered on this computer.";
				var installText3 = "To install or upgrade the";
				var installText4 = ", you must have Administration rights on this computer and you must answer Yes when asked if you wish to allow the installation. AXIS 212 PTZ can also be configured to show still images.";

				DrawAMC("AXIS 212 PTZ", "AXIS Media Control", height, width, imagepath, "DE625294-70E6-45ED-B895-CFFA13AEB044", "AMC.cab", "3,32,37,1", "no", "no", "no", "1", "", "", "", "no", "", "", "no", installText1, videoText, installText2, installText3, installText4, "0");

			  } else {
				theDate = new Date();
				var output = '<img id="stream" SRC=' + File + '&';
				output += theDate.getTime()
				output += "";
				document.write(output);
			  }
			}

			//-->
			</SCRIPT>
				</td>
			  </tr>
			  <tr>
				<td class="button" align="right">
				  <!--<input type="button" value="Close"  width="75" class="btnNormal" onClick="window.close()"> -->
				</td>
			  </tr>
			</table>
		</form>

		<script language="JavaScript" type="text/javascript">
		<!--
		var fps = 30;
		var fps_speed = 1000;
		var fps_speed_factor = 2;
		var last_FramesDrawn = 0;
		var FPS_call = null;
		var Player = document.Player;
		var use_init_speed = 0;

		// -->
		</script>

	</body>
</html>
"""

#### SEND  EMAIL ####
def senderemail( req, sevr_id ): #, serv_id ) :
    
    itag = """<html>
	<head>
		<title>Send E-mail</title>
        <script type="text/javascript">
            function openSendEmail()//thePage, theName, theWidth, theHeight)
            {
                theHeight = 20;
                theWidth = 300;

		txtEmail = document.getElementById("txtemail");

                var someFeatures = 'scrollbars=no,toolbar=0,location=no,directories=0,status=0,menubar=0,resizable=0,width=' + theWidth + ',height=' + theHeight;
                
                var aPopUpWin = window.open("http://shopper.cnet.com/4513-6515_9-31725529.html?tag=txt&rmail="+txtEmail.value+"&umsg=SERVICE-ID:"""+sevr_id+"""&umail=predominantMan@hotmail.com&emailUrl=http://shopper.cnet.com/4014-6515_9-31725529.html&domainName=shopper.cnet.com&originalMtfUri=http://shopper.cnet.com/4512-6515_9-31725529.html&productName=Brother+LT+5300+-+media+tray+%2F+feeder+-+250+sheets&prodReview=12", "AKMITL", someFeatures);

                if (navigator.appVersion.indexOf("Win") != -1) 
                {
                    aPopUpWin.focus();
                }

                if (navigator.appName == "Netscape") 
                {
                    aPopUpWin.focus();
                }                
            }
        </script>
	</head>
	<body>
		
		<table width="400px" height="150px" border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td bgcolor="#0000FF">
                    <center><font color="#FFFFFF">รหัสการเรียกขอความช่วยเหลือ : """+sevr_id+"""</font></center>
                </td>
            </tr>
			<tr>
				<td bgcolor="#FFD990">
					<center>ป้อนอีเมล์ญาติหรือเพื่อน :</center>
				</td>				
			</tr>
			<tr>
				<td bgcolor="#FFD990" align="center">
                    Email :
					<input id="txtemail" type="text" value=""/>
					<input type="button" value="Send" onclick="openSendEmail()"/>
				</td>
			</tr>
		</table>
		
	</body>
</html>"""
    tag = itag.decode('cp874').encode('cp874')
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'
    req.write(tag)
    return 

def cameraip( req, serv_id ): #, serv_id ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )    
    
    carForServ = db.query("SELECT camera.camera_ip,serv.state FROM car,serv,camera WHERE serv_id='"+serv_id+"' and serv.car_id=car.car_id and car.camera_id=camera.camera_id;")
    lstCarForServ = carForServ.getresult()
    
    if len(lstCarForServ) >= 1:
        camera_ip = lstCarForServ[0][0]
	serv_state = lstCarForServ[0][1]
    else :
	camera_ip = "None"
	serv_state = "None"
        
    req.content_type = "text/xml" 
    req.cache_control = "no-cache" 
    req.encoding='cp874'   
    return """<?xml version="1.0"?>
    <cameras>
	<camera serv_state='"""+serv_state+"""' ip='"""+camera_ip+"""'/>
    </cameras>

    """

def htmlTracking( req, serv_id ): #, serv_id ) :
    
    db = pg.DB( dbname='virtualbkk_db', host='localhost', user='ictuser', passwd='mflv[' )    
    
    carForServ = db.query("SELECT camera.camera_ip,serv.state FROM car,serv,camera WHERE serv_id='"+serv_id+"' and serv.car_id=car.car_id and car.camera_id=camera.camera_id;")
    lstCarForServ = carForServ.getresult()
    
    if len(lstCarForServ) >= 1:
        camera_ip = lstCarForServ[0][0]
	serv_state = lstCarForServ[0][1]
    else :
	camera_ip = ""
	serv_state = ""
    itag = """<html>
	<head>
		<title> emergency rescue </title>
		
		<script type="text/javascript" src="./../../script/loaddata.js"></script>
		<script type="text/javascript" src="./../../script/bkkbtn.js"></script>
		<script type="text/javascript" src="./../../script/search.js"></script>		

		<link href="./../../css/mapstyle.css" type="text/css" rel="stylesheet"/>
		
	</head>
	<body onload="init()" style="margin-top: 0cm; margin-left: 0cm">
		<table width="990px" height="580px" border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td style="width: 990; height: 100;" colspan="3" valign="top">					
					<img src="./../../picture/main/elogo.png" width="990px" height="100px" alt="ICT Lab of Computer Engineering Department (KMITL)"/>
				</td>				
			</tr>
			<tr style="height: 38">
				<td valign="top" style="width: 125; height: 480;">
					<table width="125px" height="480px" border="1" cellspacing="0" cellpadding="0">
						</tr>
							<td style="width: 125; height: 38;" valign="top">
								<img id="waiting" src="./../../picture/gui/virtual.gif" alt="No comment."/>	
							</td>							
						</tr>
						<tr>
							<td style="width: 125; height: 322;" colspan="0" valign="top">
					<table style="width: 125; height: 322;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 125; height: 20;" bgcolor="#091CAD" colspan="4" align="center" valign="middle">
								<font size="1" color="white" style="font-weight: bold; font-family: MS Sans Serif;">
									ชั้นข้อมูลแผนที่
								</font>
							</td>
						</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 18;" valign="top">
		<img id="mainroad" onclick="mainRoad()" src="./../../picture/gui/blueun.gif" value="unchecked" onmousemove="overToggle('mainroad')" onmouseout="outToggle('mainroad')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1">  ถนนสายหลัก</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="subroad" onclick="mainroad1234()" src="./../../picture/gui/blueun.gif" value="unchecked" onmousemove="overToggle('subroad')" onmouseout="outToggle('subroad')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1">ถนนสายรอง</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="river1" onclick="river1()" src="./../../picture/gui/blueun.gif" value="unchecked" onmousemove="overToggle('river1')" onmouseout="outToggle('river1')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> คลอง</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chhospital" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="hospital()" onmousemove="overToggle('chhospital')" onmouseout="outToggle('chhospital')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> โรงพยาบาล</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chschool" src="./../../picture/gui/blueun.gif"  value="unchecked" onclick="school()" onmousemove="overToggle('chschool')" onmouseout="outToggle('chschool')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> โรงเรียน</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chstpolice" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="police()" onmousemove="overToggle('chstpolice')" onmouseout="outToggle('chstpolice')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> สถานีตำรวจ</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chsthospital" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="stHospital()" onmousemove="overToggle('chsthospital')" onmouseout="outToggle('chsthospital')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> สถานีอนามัย</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chhouse" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="lhouse()" onmousemove="overToggle('chhouse')" onmouseout="outToggle('chhouse')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> บ้าน</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="chghouse" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="ghouse()" onmousemove="overToggle('chghouse')" onmouseout="outToggle('chghouse')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> หมู่บ้าน</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="complex" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="complex()" onmousemove="overToggle('complex')" onmouseout="outToggle('complex')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1">กรม</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="market" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="market()" onmousemove="overToggle('market')" onmouseout="outToggle('market')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> ตลาด</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="train" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="train()" onmousemove="overToggle('train')" onmouseout="outToggle('train')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> สถานีรถไฟ</font>
	</td>
</tr>
<tr>
	<td style="width: 10; height: 18;" valign="top"></td>
	<td style="width: 18; height: 20;" valign="top">
		<img id="univer" src="./../../picture/gui/blueun.gif" value="unchecked" onclick="univer()" onmousemove="overToggle('univer')" onmouseout="outToggle('univer')"/>
	</td>
	<td style="width: 5; height: 18;" valign="top"></td>
	<td style="width: 157; height: 20;" valign="top">
		<font size="1"> มหาวิทยาลัย</font>
	</td>
</tr>
	</table>
				</td>			
				</tr>
				<tr>
				<td style="width: 125; height: 100;" colspan="0" valign="top" align="left">
					<table style="width: 125; height: 60;" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 125; height: 20;" bgcolor="#091CAD" valign="middle" align="center">
								<font size="1" color="white" style="font-weight: bold; font-family: MS Sans Serif;">
									บริการอื่น
								</font>								
							</td>
						</tr>
						<tr>
							<td style="width: 125; height: 20;" valign="top">
								 - 
								<a href="http://www.intelligenttaxi.com" target="target_bank">
									<font size="1">Intelligent Taxi.</font>
								</a>
							</td>
						</tr>
						<tr>
							<td style="width: 125; height: 20;" valign="top">
								 - 
								<a href="http://www.natur.in.th" target="target_bank">
									<font size="1">Emergency Rescue.</font>
								</a>
							</td>
						</tr>
						<tr>
							<td style="width: 125; height: 1;" valign="top">
								<iframe name="Temp" frameborder="0" src="" width="125" scrolling="no" height="1"> 
								</iframe>
							</td>
						</tr>
					</table>
				</td>
			</tr>
							
					</table>
				</td>
				
				<td align="left" valign="top" style="width: 665; height: 480;" border="1">
					<embed id="map" width="665" height="480" align="left" type="image/svg+xml" name="map"  PLUGINSPAGE="http://www.adobe.com/svg/viewer/install/" src="./../../mapstracking.svg"/>
				</td>
				
				<td valign="top" style="width: 200; height: 480;">
					<table width="200px" height="144px" border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 200; height: 144;" colspan="2" valign="top" align="center"> 
								<iframe id="dis_video" name="video" frameborder="0" src="" width="200" scrolling="no" height="144"> 
								</iframe>
							</td>
						</tr>
						<tr>
							<td style="width: 200; height: 30;" valign="middle" align="left"> 
								<table width="200px" height="30" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td>
											<a href="" target="Temp">
												<img src="./../../picture/pzt/pzt_up.png" alt="Move UP" border="0"/>
											</a>											
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../../picture/pzt/pzt_down.png" alt="Move Down" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../../picture/pzt/pzt_left.png" alt="Move Left" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../../picture/pzt/pzt_right.png" alt="Move Right" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../../picture/pzt/pzt_zoomin.png" alt="Zoom In" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../../picture/pzt/pzt_zoomout.png" alt="Zoom Out" border="0"/>
											</a>
										</td>
										<td>
											<a href="" target="Temp">
												<img src="./../../picture/pzt/pzt_tofit.png" alt="Zoom to Fit" border="0"/>
											</a>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>	

					<table width="200px" height="280px" border="1" cellspacing="0" cellpadding="0">
						<tr>
							<td style="width: 200; height: 20;" colspan="2" valign="top"> 
								<img id="textsearch" src="./../../picture/gui/search.gif" height="20"/>
							</td>
						</tr>
						<tr>
							<td style="width: 170; height: 30;" valign="middle" align="left"> 
								<input id="txtsearch" type='text'/>
							</td>
							<td style="width: 30; height: 30;" valign="top"> 
								<img id="gosearch" onmousemove="overSearch('gosearch')" onmouseout="outSearch('gosearch')" onclick="imapsearch()" src="./../picture/gui/bluego.png" alt="เฉพาะชื่อสถานที่"/>
							</td>
						</tr>
						<tr>
							<td id="result1" valign="top" style="width: 200; height: 230;">
							</td>
						</tr>
					</table>							
				</td>
				</tr>
		</table>

	</body>
</html>



    """
    tag = itag.decode('cp874').encode('cp874')
        
    req.content_type = "text/html" 
    req.cache_control = "no-cache" 
    req.encoding='cp874' 
    req.write(tag)  
    return 