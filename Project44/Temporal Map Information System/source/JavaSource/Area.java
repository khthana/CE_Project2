/**
 * Cache' Java Class Generated 05:36AM  01 Feb 2002 for class User.Area
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



public class Area extends TempInterval {

    /**
     * Constructor creates a new instance
     *
    **/
    public Area( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public Area( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public Area( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Area( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Area( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Area( ObjectServer os, int id ) throws CacheException {
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
    private TransientAttr m_Village;
    private DoubleAttr m_VillageArea;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "Village", (m_Village = new TransientAttr( this, "Village" )) );
        h.put( "VillageArea", (m_VillageArea = new DoubleAttr( this, "VillageArea" )) );
        super._initClass( h );
        

        return "User.Area";
    }



    /**
     * Get Accessor method for Village
     *
    **/
    public Village getVillage() throws CacheException {
        return (Village) m_Village.get();
    }

    /**
     * Set Accessor method for Village
     *
    **/
    public void setVillage(Village value) throws CacheException {
        m_Village.set( (Transient) value );
    }



    /**
     * Get Accessor method for VillageArea
     *
    **/
    public double getVillageArea() throws CacheException {
        return m_VillageArea.get();
    }

    /**
     * Set Accessor method for VillageArea
     *
    **/
    public void setVillageArea(double value) throws CacheException {
        m_VillageArea.set( value );
    }






}


/**
 * End-of-file
**/
