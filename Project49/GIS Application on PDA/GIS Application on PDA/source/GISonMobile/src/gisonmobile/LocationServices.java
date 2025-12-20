package gisonmobile;

import gisonmobile.page.*;
import gps.datatypes.Record;
import gps.exceptions.EmptyBufferException;
import gps.log.Logger;
import gps.GPS;
import java.util.Random;


public class LocationServices implements Runnable
{
	public double y;
    public double x;
    public int tmpX;
    public int tmpY;
    public String latitude;
    public String longtitude;
	private int round = 1;
	private String mode;
	private Random MyRandom;
		
	private static final long BREAK = 3000;

	private Thread runner;

	private GPS gps;
	
	private Logger l = new Logger("Bluetooth Test", 512, 0);
	
	private static  String GPS_BT_URL = "comm:6;baudrate=4800";

	  public LocationServices() 
	  {
			gps = new GPS(l,GPS_BT_URL);
			MyRandom=new Random();
			x = 692000.80441401;
			y = 1518500.10177363;
			
			mode = CampusGISMain.instance.position;
			if (mode.equals("GPS"))
			{
				gps.start();
			}
			start();
	  }
	
	  public void run() 
	  {
		  while(Thread.currentThread() == runner)
		  {
	
			  System.out.println("Start "+ round++);
	
			  if(mode.equals("Demon"))
			  {
				  
			  		if (MyRandom.nextInt(2)==1)
			  		{
				  		if (MyRandom.nextInt(2)==1)
				  		{
				  			tmpX = MyRandom.nextInt(10);
				  			while(tmpX < 5)
				  				tmpX = MyRandom.nextInt(10);
				 
				  			
				  		}
				  		else
				  		{
				  			tmpX = MyRandom.nextInt(10);
				  			while(tmpX < 5)
				  				tmpX = MyRandom.nextInt(10);
				  			
				  			tmpX = -tmpX;
				  		}
				  	
				  	}
				  	else
				  	{
				  		if (MyRandom.nextInt(2)==1)
				  		{
				  			tmpY = MyRandom.nextInt(10);
				  			while(tmpY < 5)
				  				tmpY = MyRandom.nextInt(10);
				  		}
				  		else
				  		{
				  			tmpY = MyRandom.nextInt(10);
				  			while(tmpY < 5)
				  				tmpY = MyRandom.nextInt(10);
				  			tmpY = -tmpY;
				  		}
				  	
				  	}
			  		tmpX = 5;
			  		tmpY = -5;
				  System.out.println("Demon : "+tmpX+","+tmpY);
			  }
			  else
			  {
				  if (mode.equals("GPS"))
				  {  
							try {
								Record record = gps.getRecord();
								LatLonToUtm(record.lattitude,record.longitude);
								System.out.println("GPS : "+x+","+y);
								CampusGISMain.instance.ShowAlertPage("Position from gps", "GPS : "+x+","+y);
							} catch (EmptyBufferException e) {
								System.out.println("GPS : Empty Buffer");
							}
		
				  }else if (mode.equals("Hotspot"))
				  {
					  x = 2;
					  y = 2;
					  System.out.println("Access Point : "+x+","+y);
				  }
				  
				  else if(mode.equals("Manual"))
				  {
					  System.out.println("Manual : "+x+","+y);
				  }
				  
			  }
			  
			  if(!CampusGISMain.instance.sessionkey.equals(""))
			  {
				  if(CampusGISMain.instance.showMyPosition.equals("Yes") && CampusGISMain.instance.mode.equals("Online"))
				  {
					  ConnectService con = new ConnectService();
					  con.updatePosition(""+x, ""+y);
				  }
				  
				  if(CampusGISMain.instance.showContactPosition.equals("Yes") && CampusGISMain.instance.mode.equals("Online"))
				  {
					  ConnectService con = new ConnectService();
					  con.getContactsPosition();
				  }
				  
				  if(CampusGISMain.instance.showBusPosition.equals("Yes") && CampusGISMain.instance.mode.equals("Online"))
				  {
					  ConnectService con = new ConnectService();
					  con.getBusPosition();
				  }
				  
			  }
			  
			  try {
					Thread.sleep(BREAK);
				} catch (InterruptedException e) {
				}
		  }
		  
	  }

	public void update()
	{
		if (!mode.equals(CampusGISMain.instance.position))
		{
			if(!mode.equals("GPS") && CampusGISMain.instance.position.equals("GPS"))
			{
				mode = CampusGISMain.instance.position;
				gps.start();
			}
			else if (mode.equals("GPS")  && !CampusGISMain.instance.position.equals("GPS"))
			{
				mode = CampusGISMain.instance.position;
				gps.stop();
			}else
			{
				mode = CampusGISMain.instance.position;
			}
		}
	}

	public void start() {
		if (runner == null) {
			runner = new Thread(this);
			runner.start();
		}
	}

	public void stop() {
		runner = null;
	}
	
	public void LatLonToUtm (String latStr, String lonStr) 
    {
		double lat = Double.parseDouble(latStr.substring(0,2)) + 
					((Double.parseDouble(latStr.substring(2,4))*60)+ Double.parseDouble(latStr.substring(5)))/3600;
		double lon = Double.parseDouble(lonStr.substring(0,3)) + 
					((Double.parseDouble(lonStr.substring(3,5))*60)+ Double.parseDouble(lonStr.substring(6)))/3600;
		double deg2rad = Math.PI / 180;
        double rad2deg = 180.0 / Math.PI;   
        // Some constants used by these functions.
        final double fe = 500000.0;
        final double ok = 0.9996;

        // An array containing each vertical UTM zone.
        char[] cArray = new char[20];
        String abc="CDEFGHJKLMNPQRSTUVWX";
            cArray = abc.toCharArray();

        double a = 6378137.0;
        double f = 1 / 298.257223563;
        int utmXZone;
        char utmYZone;
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
        s = Math.sin(latRad);
        c = Math.cos(latRad);
        t = s / c;
        eta = e2Squared * (c * c);
        sn = sphsn (a, eSquared, latRad);
        tmd = sphtmd (ap, bp, cp, dp, ep, latRad);
        t1 = tmd * ok;
        t2 = sn * s * c * ok / 2.0;
        t3 = sn * s * (c * c * c) * ok * (5.0 - (t * t) + 9.0 * eta + 4.0
	        * (eta * eta)) / 24.0;
        
        if (latRad < 0.0) nfn = 10000000.0; else nfn = 0;
            y = nfn + t1 + (dlam * dlam) * t2 + (dlam * dlam * dlam
	        * dlam) * t3 + (dlam * dlam * dlam * dlam * dlam * dlam) + 0.5;
        t6 = sn * c * ok;
        t7 = sn * (c * c * c) * (1.0 - (t * t) + eta) / 6.0;
        x = fe + dlam * t6 + (dlam * dlam * dlam) * t7 + 0.5;
        if (y >= 9999999.0) y = 9999999.0;
        //MessageBox.Show(northing + "  " + easting);
}
    ////////////////////////////////////////////////////////////////////////////

	/////////////////////////////////////////////////////////////////////////////
	// Miscellaneous functions for these UTM conversion formulas.

	 private double CalculateESquared(double a, double b)
	 {
	     return ((a * a) - (b * b)) / (a * a);
	 }


	 private double CalculateE2Squared(double a, double b)
	 {
	     return ((a * a) - (b * b)) / (b * b);
	 }


	 private double denom(double es, double sphi)
	 {
	     double sinSphi = Math.sin(sphi);
	     return Math.sqrt(1.0 - es * (sinSphi * sinSphi));
	 }


	 private double sphsr(double a, double es, double sphi)
	 {
	     double dn = denom(es, sphi);
	     return a * (1.0 - es) / (dn * dn * dn);
	 }


	 private double sphsn(double a, double es, double sphi)
	 {
	     double sinSphi = Math.sin(sphi);
	     return a / Math.sqrt(1.0 - es * (sinSphi * sinSphi));
	 }


	 private double sphtmd(double ap, double bp, double cp, double dp, double ep,
	     double sphi)
	 {
	     return (ap * sphi) - (bp * Math.sin(2.0 * sphi)) + (cp * Math.sin(4.0 * sphi))
	         - (dp * Math.sin(6.0 * sphi)) + (ep * Math.sin(8.0 * sphi));
	 }
	

} 