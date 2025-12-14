/**
 * Cache' Java Class Generated 05:35AM  01 Feb 2002 for class User.PointSet
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





public class PointSet extends TempInterval {

    /**
     * Constructor creates a new instance
     *
    **/
    public PointSet( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public PointSet( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public PointSet( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public PointSet( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public PointSet( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public PointSet( ObjectServer os, int id ) throws CacheException {
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
    private TransientAttr m_Geometry;
    private TransientAttr m_X1;
    private TransientAttr m_X2;
    private TransientAttr m_Y1;
    private TransientAttr m_Y2;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "Geometry", (m_Geometry = new TransientAttr( this, "Geometry" )) );
        h.put( "X1", (m_X1 = new TransientAttr( this, "X1" )) );
        h.put( "X2", (m_X2 = new TransientAttr( this, "X2" )) );
        h.put( "Y1", (m_Y1 = new TransientAttr( this, "Y1" )) );
        h.put( "Y2", (m_Y2 = new TransientAttr( this, "Y2" )) );
        super._initClass( h );
        

        return "User.PointSet";
    }



    /**
     * Get Accessor method for Geometry
     *
    **/
    public Geometry getGeometry() throws CacheException {
        return (Geometry) m_Geometry.get();
    }

    /**
     * Set Accessor method for Geometry
     *
    **/
    public void setGeometry(Geometry value) throws CacheException {
        m_Geometry.set( (Transient) value );
    }



    /**
     * Get Accessor method for X1
     *
    **/
    public ListOfDataTypes getX1() throws CacheException {
        return (ListOfDataTypes) m_X1.get();
    }

    /**
     * Set Accessor method for X1
     *
    **/
    public void setX1(ListOfDataTypes value) throws CacheException {
        m_X1.set( (Transient) value );
    }



    /**
     * Get Accessor method for X2
     *
    **/
    public ListOfDataTypes getX2() throws CacheException {
        return (ListOfDataTypes) m_X2.get();
    }

    /**
     * Set Accessor method for X2
     *
    **/
    public void setX2(ListOfDataTypes value) throws CacheException {
        m_X2.set( (Transient) value );
    }



    /**
     * Get Accessor method for Y1
     *
    **/
    public ListOfDataTypes getY1() throws CacheException {
        return (ListOfDataTypes) m_Y1.get();
    }

    /**
     * Set Accessor method for Y1
     *
    **/
    public void setY1(ListOfDataTypes value) throws CacheException {
        m_Y1.set( (Transient) value );
    }



    /**
     * Get Accessor method for Y2
     *
    **/
    public ListOfDataTypes getY2() throws CacheException {
        return (ListOfDataTypes) m_Y2.get();
    }

    /**
     * Set Accessor method for Y2
     *
    **/
    public void setY2(ListOfDataTypes value) throws CacheException {
        m_Y2.set( (Transient) value );
    }






}


/**
 * End-of-file
**/
