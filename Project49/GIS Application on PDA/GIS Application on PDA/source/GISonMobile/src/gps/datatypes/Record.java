package gps.datatypes;


/**
 * Storage data type for parsed GPS data.
 * 
 * @author  dominik.schmidt
 */
public class Record {    
	/**
	 * Character that indicates a warning.
	 */
    public static final String WARNING = "V";
    
    public String output="";
    public String courseMadeGood = "";
    public String dateTimeOfFix = "";
    public String groundSpeed = "";
    public String lattitude = "";
    public String lattitudeDirection = "";
    public String longitude = "";
    public String longitudeDirection = "";
    public String magneticVariation = "";
    public String quality = "";    
    public String satelliteCount = "";
    public boolean warning;
}
