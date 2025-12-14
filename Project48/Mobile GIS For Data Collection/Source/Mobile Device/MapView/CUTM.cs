using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
namespace MapView
{
    class CUTM
    {
        public double easting;
        public double northing;
        public void LLtoNE(double lat, double lon)
        {
            double deg2rad = System.Math.PI / 180;
            double rad2deg = 180.0 / System.Math.PI;
            double phi = lat * deg2rad;      // convert latitude to radians
            double lam = lon * deg2rad;   // convert longitude to radians
            //double a = 6377563.396;       // OSGB semi-major axis
            //double b = 6356256.91;        // OSGB semi-minor axis
            double a = 6378137;
            double b = 6356752.3142;
            double e0 = 400000;           // easting of false origin
            double n0 = -100000;          // northing of false origin
            double f0 = 0.9996012717;     // OSGB scale factor on central meridian
            double e2 = 0.0066705397616;  // OSGB eccentricity squared
            double lam0 = -0.034906585039886591;  // OSGB false east
            double phi0 = 0.85521133347722145;    // OSGB false north
            double af0 = a * f0;
            double bf0 = b * f0;
        // easting
            double slat2 = System.Math.Sin(phi) * System.Math.Sin(phi);
            double nu = af0 / (System.Math.Sqrt(1 - (e2 * (slat2))));
            double rho = (nu * (1 - e2)) / (1 - (e2 * slat2));
            double eta2 = (nu / rho) - 1;
            double p = lam - lam0;
            double IV = nu * System.Math.Cos(phi);
            double clat3 = System.Math.Pow(Math.Cos(phi), 3);
            double tlat2 = System.Math.Tan(phi) * System.Math.Tan(phi);
            double V = (nu / 6) * clat3 * ((nu / rho) - tlat2);
            double clat5 = System.Math.Pow(System.Math.Cos(phi), 5);
            double tlat4 = System.Math.Pow(System.Math.Tan(phi), 4);
            double VI = (nu / 120) * clat5 * ((5 - (18 * tlat2)) + tlat4 + (14 * eta2) - (58 * tlat2 * eta2));
            double east = e0 + (p * IV) + (System.Math.Pow(p, 3) * V) + (System.Math.Pow(p, 5) * VI);
        // northing
            double n = (af0 - bf0) / (af0 + bf0);
            double M = Marc(bf0, n, phi0, phi);
            double I = M + (n0);
            double II = (nu / 2) * System.Math.Sin(phi) * System.Math.Cos(phi);
            double III = ((nu / 24) * System.Math.Sin(phi) * Math.Pow(Math.Cos(phi), 3)) * (5 - System.Math.Pow(System.Math.Tan(phi), 2) + (9 * eta2));
            double IIIA = ((nu / 720) * System.Math.Sin(phi) * clat5) * (61 - (58 * tlat2) + tlat4);
            double north = I + ((p * p) * II) + (System.Math.Pow(p, 4) * III) + (System.Math.Pow(p, 6) * IIIA);
            east = System.Math.Round(east);       // round to whole number
            north = System.Math.Round(north);     // round to whole number
            string nstr = north.ToString();      // convert to string
            string estr = east.ToString();
            MessageBox.Show(nstr + "  " + estr);// ditto
  }
        public double Marc(double bf0, double n, double phi0, double phi)
        {
            double Marc = bf0 * (((1 + n + ((5 / 4) * (n * n)) + ((5 / 4) * (n * n * n))) * (phi - phi0))
            - (((3 * n) + (3 * (n * n)) + ((21 / 8) * (n * n * n))) * (System.Math.Sin(phi - phi0)) * (System.Math.Cos(phi + phi0)))
            + ((((15 / 8) * (n * n)) + ((15 / 8) * (n * n * n))) * (System.Math.Sin(2 * (phi - phi0))) * (System.Math.Cos(2 * (phi + phi0))))
            - (((35 / 24) * (n * n * n)) * (System.Math.Sin(3 * (phi - phi0))) * (System.Math.Cos(3 * (phi + phi0)))));
            return(Marc);
  }
        ////////////////////////////////////////////////////////////////////////////
     public  void LatLonToUtm (double lat, double lon) 
        {
            double deg2rad = System.Math.PI / 180;
            double rad2deg = 180.0 / System.Math.PI;   
            // Some constants used by these functions.
            const double fe = 500000.0;
            const double ok = 0.9996;

            // An array containing each vertical UTM zone.
            char[] cArray = new char[20];
            string abc="CDEFGHJKLMNPQRSTUVWX";
                cArray = abc.ToCharArray();

            double a = 6378137.0;
            double f = 1 / 298.257223563;
            int utmXZone;
            char utmYZone;
	        //double easting;
            //double northing;
            double recf;
	        double b;
	        double eSquared;
	        double e2Squared;
	        double tn;
	        double ap;
	        double bp;
	        double cp;
	        double dp;
	        double ep;
	        double olam;
	        double dlam;
	        double s;
	        double c;
	        double t;
	        double eta;
	        double sn;
	        double tmd;
	        double t1, t2, t3, t6, t7;
	        double nfn;

	        if (lon <= 0.0) {
		        utmXZone = 30 + (int)(lon / 6.0);
	        } else {
		        utmXZone = 31 + (int)(lon / 6.0);
	        }
	        if (lat < 84.0 && lat >= 72.0) {
		    // Special case: zone X is 12 degrees from north to south, not 8.
		        utmYZone = cArray[19];
	        } else {
		        utmYZone = cArray[(int)((lat + 80.0) / 8.0)];
	        }
	        if (lat >= 84.0 || lat < -80.0) {
		    // Invalid coordinate; the vertical zone is set to the invalid
		    // character.
		        utmYZone = '*';
	        }

	        double latRad = lat * deg2rad;
	        double lonRad = lon * deg2rad;
	        recf = 1.0 / f;
	        b = a * (recf - 1.0) / recf;
	        eSquared = CalculateESquared (a, b);
	        e2Squared = CalculateE2Squared (a, b);
	        tn = (a - b) / (a + b);
	        ap = a * (1.0 - tn + 5.0 * ((tn * tn) - (tn * tn * tn)) / 4.0 + 81.0 *
		        ((tn * tn * tn * tn) - (tn * tn * tn * tn * tn)) / 64.0);
	        bp = 3.0 * a * (tn - (tn * tn) + 7.0 * ((tn * tn * tn)
		        - (tn * tn * tn * tn)) / 8.0 + 55.0 * (tn * tn * tn * tn * tn) / 64.0)
		        / 2.0;
	        cp = 15.0 * a * ((tn * tn) - (tn * tn * tn) + 3.0 * ((tn * tn * tn * tn)
		        - (tn * tn * tn * tn * tn)) / 4.0) / 16.0;
	        dp = 35.0 * a * ((tn * tn * tn) - (tn * tn * tn * tn) + 11.0
		        * (tn * tn * tn * tn * tn) / 16.0) / 48.0;
	        ep = 315.0 * a * ((tn * tn * tn * tn) - (tn * tn * tn * tn * tn)) / 512.0;
	        olam = (utmXZone * 6 - 183) * deg2rad;
	        dlam = lonRad - olam;
	        s = System.Math.Sin(latRad);
	        c = System.Math.Cos(latRad);
	        t = s / c;
	        eta = e2Squared * (c * c);
	        sn = sphsn (a, eSquared, latRad);
	        tmd = sphtmd (ap, bp, cp, dp, ep, latRad);
	        t1 = tmd * ok;
	        t2 = sn * s * c * ok / 2.0;
	        t3 = sn * s * (c * c * c) * ok * (5.0 - (t * t) + 9.0 * eta + 4.0
		        * (eta * eta)) / 24.0;
	        if (latRad < 0.0) nfn = 10000000.0; else nfn = 0;
	            northing = nfn + t1 + (dlam * dlam) * t2 + (dlam * dlam * dlam
		        * dlam) * t3 + (dlam * dlam * dlam * dlam * dlam * dlam) + 0.5;
	        t6 = sn * c * ok;
	        t7 = sn * (c * c * c) * (1.0 - (t * t) + eta) / 6.0;
	        easting = fe + dlam * t6 + (dlam * dlam * dlam) * t7 + 0.5;
	        if (northing >= 9999999.0) northing = 9999999.0;
            //MessageBox.Show(northing + "  " + easting);
}
        ////////////////////////////////////////////////////////////////////////////

     /////////////////////////////////////////////////////////////////////////////
     // Miscellaneous functions for these UTM conversion formulas.

     double CalculateESquared(double a, double b)
     {
         return ((a * a) - (b * b)) / (a * a);
     }


     double CalculateE2Squared(double a, double b)
     {
         return ((a * a) - (b * b)) / (b * b);
     }


     double denom(double es, double sphi)
     {
         double sinSphi = System.Math.Sin(sphi);
         return System.Math.Sqrt(1.0 - es * (sinSphi * sinSphi));
     }


     double sphsr(double a, double es, double sphi)
     {
         double dn = denom(es, sphi);
         return a * (1.0 - es) / (dn * dn * dn);
     }


     double sphsn(double a, double es, double sphi)
     {
         double sinSphi = System.Math.Sin(sphi);
         return a / System.Math.Sqrt(1.0 - es * (sinSphi * sinSphi));
     }


     double sphtmd(double ap, double bp, double cp, double dp, double ep,
         double sphi)
     {
         return (ap * sphi) - (bp * System.Math.Sin(2.0 * sphi)) + (cp * System.Math.Sin(4.0 * sphi))
             - (dp * System.Math.Sin(6.0 * sphi)) + (ep * System.Math.Sin(8.0 * sphi));
     }

}
}
