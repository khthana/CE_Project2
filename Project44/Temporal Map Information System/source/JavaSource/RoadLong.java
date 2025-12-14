/**
 * Cache' Java Class Generated 06:22PM  03 Mar 2002 for class User.RoadLong
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

  



public class RoadLong extends TempInterval {

    /**
     * Constructor creates a new instance
     *
    **/
    public RoadLong( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public RoadLong( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public RoadLong( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadLong( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadLong( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadLong( ObjectServer os, int id ) throws CacheException {
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
    private DoubleAttr m_Long;
    private TransientAttr m_Road;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "Long", (m_Long = new DoubleAttr( this, "Long" )) );
        h.put( "Road", (m_Road = new TransientAttr( this, "Road" )) );
        super._initClass( h );
        

        return "User.RoadLong";
    }



    /**
     * Get Accessor method for Long
     *
    **/
    public double getLong() throws CacheException {
        return m_Long.get();
    }

    /**
     * Set Accessor method for Long
     *
    **/
    public void setLong(double value) throws CacheException {
        m_Long.set( value );
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






}


/**
 * End-of-file
**/
