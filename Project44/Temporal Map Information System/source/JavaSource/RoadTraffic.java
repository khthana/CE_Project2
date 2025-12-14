/**
 * Cache' Java Class Generated 06:22PM  03 Mar 2002 for class User.RoadTraffic
 *
**/

/**
 * Imports
 *
**/

import java.util.Date;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Hashtable;
import java.math.BigInteger;
import java.math.BigDecimal;
import COM.intersys.objects.*;
import COM.intersys.objects.attribute.*;
import COM.intersys.util.SysList;
import COM.intersys.util.CacheException;





public class RoadTraffic extends TempInterval {

    /**
     * Constructor creates a new instance
     *
    **/
    public RoadTraffic( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public RoadTraffic( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public RoadTraffic( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadTraffic( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadTraffic( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadTraffic( ObjectServer os, int id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * _close closes an Oref
     *
    **/
    public void _close() throws CacheException {
        synchronized (m_objectServer)  {
            super._close();
        }
    }


    /**
     * Parameters
     *
    **/



    /**
     * Property Storage
     *
    **/
    private TransientAttr m_Road;
    private DoubleAttr m_Traffic;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "Road", (m_Road = new TransientAttr( this, "Road" )) );
        h.put( "Traffic", (m_Traffic = new DoubleAttr( this, "Traffic" )) );
        super._initClass( h );
        

        return "User.RoadTraffic";
    }



    /**
     * Get Accessor method for Road
     *
    **/
    public Road getRoad() throws CacheException {
        return (Road) m_Road.get();
    }

    /**
     * Set Accessor method for Road
     *
    **/
    public void setRoad(Road value) throws CacheException {
        m_Road.set( (Transient) value );
    }



    /**
     * Get Accessor method for Traffic
     *
    **/
    public double getTraffic() throws CacheException {
        return m_Traffic.get();
    }

    /**
     * Set Accessor method for Traffic
     *
    **/
    public void setTraffic(double value) throws CacheException {
        m_Traffic.set( value );
    }






}


/**
 * End-of-file
**/
