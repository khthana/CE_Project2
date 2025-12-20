from Numeric import *

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

utm_r = LatLonToUtmWGS84( 13.837, 114.13 )
print utm_r
#
latlon_r = UtmToLatLonWGS84( utm_r[0], utm_r[1], utm_r[2], utm_r[3] )
print latlon_r
