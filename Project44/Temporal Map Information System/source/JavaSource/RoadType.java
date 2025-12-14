/**
 * Cache' Java Class Generated 06:22PM  03 Mar 2002 for class User.RoadType
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





public class RoadType extends TempInterval {

    /**
     * Constructor creates a new instance
     *
    **/
    public RoadType( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public RoadType( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public RoadType( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadType( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadType( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public RoadType( ObjectServer os, int id ) throws CacheException {
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
    private IntAttr m_Type;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "Road", (m_Road = new TransientAttr( this, "Road" )) );
        h.put( "Type", (m_Type = new IntAttr( this, "Type" )) );
        super._initClass( h );
        

        return "User.RoadType";
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
     * Get Accessor method for Type
     *
    **/
    public int getType() throws CacheException {
        return m_Type.get();
    }

    /**
     * Set Accessor method for Type
     *
    **/
    public void setType(int value) throws CacheException {
        m_Type.set( value );
    }






}


/**
 * End-of-file
**/
