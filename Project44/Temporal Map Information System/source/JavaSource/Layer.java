/**
 * Cache' Java Class Generated 04:22PM  02 Mar 2002 for class User.Layer
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





public class Layer extends Persistent {

    /**
     * Constructor creates a new instance
     *
    **/
    public Layer( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public Layer( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public Layer( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Layer( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Layer( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Layer( ObjectServer os, int id ) throws CacheException {
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
    private TransientAttr m_Geometries;
    private TransientAttr m_Map;
    private StringAttr m_Name;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "Geometries", (m_Geometries = new TransientAttr( this, "Geometries" )) );
        h.put( "Map", (m_Map = new TransientAttr( this, "Map" )) );
        h.put( "Name", (m_Name = new StringAttr( this, "Name" )) );
        super._initClass( h );
        

        return "User.Layer";
    }



    /**
     * Get Accessor method for Geometries
     *
    **/
    public ArrayOfObjects getGeometries() throws CacheException {
        return (ArrayOfObjects) m_Geometries.get();
    }

    /**
     * Set Accessor method for Geometries
     *
    **/
    public void setGeometries(ArrayOfObjects value) throws CacheException {
        m_Geometries.set( (Transient) value );
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
     * Java implementation of SearchByName
     *
    **/
    public SysList SearchByName(String Name) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( Name, 0 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "SearchByName", _args, true );

            return _args.getSysList( 0 );
        }
    }





}


/**
 * End-of-file
**/
