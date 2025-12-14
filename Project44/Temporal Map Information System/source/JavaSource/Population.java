/**
 * Cache' Java Class Generated 05:36AM  01 Feb 2002 for class User.Population
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





public class Population extends TempInterval {

    /**
     * Constructor creates a new instance
     *
    **/
    public Population( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public Population( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public Population( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Population( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Population( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Population( ObjectServer os, int id ) throws CacheException {
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
    private DoubleAttr m_VillagePopulation;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "Village", (m_Village = new TransientAttr( this, "Village" )) );
        h.put( "VillagePopulation", (m_VillagePopulation = new DoubleAttr( this, "VillagePopulation" )) );
        super._initClass( h );
        

        return "User.Population";
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
     * Get Accessor method for VillagePopulation
     *
    **/
    public double getVillagePopulation() throws CacheException {
        return m_VillagePopulation.get();
    }

    /**
     * Set Accessor method for VillagePopulation
     *
    **/
    public void setVillagePopulation(double value) throws CacheException {
        m_VillagePopulation.set( value );
    }






}


/**
 * End-of-file
**/
