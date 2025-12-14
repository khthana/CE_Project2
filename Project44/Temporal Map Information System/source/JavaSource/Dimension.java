/**
 * Cache' Java Class Generated 09:36AM  05 Feb 2002 for class User.Dimension
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





public class Dimension extends Persistent {

    /**
     * Constructor creates a new instance
     *
    **/
    public Dimension( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public Dimension( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public Dimension( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Dimension( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Dimension( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Dimension( ObjectServer os, int id ) throws CacheException {
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
    private IntAttr m_LB;
    private TransientAttr m_Map;
    private StringAttr m_Name;
    private DoubleAttr m_Tolerance;
    private IntAttr m_UB;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "LB", (m_LB = new IntAttr( this, "LB" )) );
        h.put( "Map", (m_Map = new TransientAttr( this, "Map" )) );
        h.put( "Name", (m_Name = new StringAttr( this, "Name" )) );
        h.put( "Tolerance", (m_Tolerance = new DoubleAttr( this, "Tolerance" )) );
        h.put( "UB", (m_UB = new IntAttr( this, "UB" )) );
        super._initClass( h );
        

        return "User.Dimension";
    }



    /**
     * Get Accessor method for LB
     *
    **/
    public int getLB() throws CacheException {
        return m_LB.get();
    }

    /**
     * Set Accessor method for LB
     *
    **/
    public void setLB(int value) throws CacheException {
        m_LB.set( value );
    }



    /**
     * Get Accessor method for Map
     *
    **/
    public Map getMap() throws CacheException {
        return (Map) m_Map.get();
    }

    /**
     * Set Accessor method for Map
     *
    **/
    public void setMap(Map value) throws CacheException {
        m_Map.set( (Transient) value );
    }



    /**
     * Get Accessor method for Name
     *
    **/
    public String getName() throws CacheException {
        return m_Name.get();
    }

    /**
     * Set Accessor method for Name
     *
    **/
    public void setName(String value) throws CacheException {
        m_Name.set( value );
    }



    /**
     * Get Accessor method for Tolerance
     *
    **/
    public double getTolerance() throws CacheException {
        return m_Tolerance.get();
    }

    /**
     * Set Accessor method for Tolerance
     *
    **/
    public void setTolerance(double value) throws CacheException {
        m_Tolerance.set( value );
    }



    /**
     * Get Accessor method for UB
     *
    **/
    public int getUB() throws CacheException {
        return m_UB.get();
    }

    /**
     * Set Accessor method for UB
     *
    **/
    public void setUB(int value) throws CacheException {
        m_UB.set( value );
    }






}


/**
 * End-of-file
**/
