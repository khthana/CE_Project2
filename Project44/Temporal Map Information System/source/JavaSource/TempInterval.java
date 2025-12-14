/**
 * Cache' Java Class Generated 09:33AM  16 Jan 2002 for class User.TempInterval
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




public class TempInterval extends Persistent {

    /**
     * Constructor creates a new instance
     *
    **/
    public TempInterval( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public TempInterval( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public TempInterval( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public TempInterval( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public TempInterval( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public TempInterval( ObjectServer os, int id ) throws CacheException {
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
    private DateAttr m_VTE;
    private DateAttr m_VTS;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "VTE", (m_VTE = new DateAttr( this, "VTE" )) );
        h.put( "VTS", (m_VTS = new DateAttr( this, "VTS" )) );
        super._initClass( h );
        

        return "User.TempInterval";
    }



    /**
     * Get Accessor method for VTE
     *
    **/
    public Date getVTE() throws CacheException {
        return m_VTE.get();
    }

    /**
     * Set Accessor method for VTE
     *
    **/
    public void setVTE(Date value) throws CacheException {
        m_VTE.set( value );
    }



    /**
     * Get Accessor method for VTS
     *
    **/
    public Date getVTS() throws CacheException {
        return m_VTS.get();
    }

    /**
     * Set Accessor method for VTS
     *
    **/
    public void setVTS(Date value) throws CacheException {
        m_VTS.set( value );
    }






}


/**
 * End-of-file
**/
