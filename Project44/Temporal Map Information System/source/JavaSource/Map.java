/**
 * Cache' Java Class Generated 04:15PM  02 Mar 2002 for class User.Map
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




public class Map extends Persistent {

    /**
     * Constructor creates a new instance
     *
    **/
    public Map( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public Map( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public Map( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Map( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Map( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Map( ObjectServer os, int id ) throws CacheException {
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
    private TransientAttr m_Dimensions;
    private TransientAttr m_Layers;
    private StringAttr m_Name;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "Dimensions", (m_Dimensions = new TransientAttr( this, "Dimensions" )) );
        h.put( "Layers", (m_Layers = new TransientAttr( this, "Layers" )) );
        h.put( "Name", (m_Name = new StringAttr( this, "Name" )) );
        super._initClass( h );
        

        return "User.Map";
    }



    /**
     * Get Accessor method for Dimensions
     *
    **/
    public ArrayOfObjects getDimensions() throws CacheException {
        return (ArrayOfObjects) m_Dimensions.get();
    }

    /**
     * Set Accessor method for Dimensions
     *
    **/
    public void setDimensions(ArrayOfObjects value) throws CacheException {
        m_Dimensions.set( (Transient) value );
    }



    /**
     * Get Accessor method for Layers
     *
    **/
    public ArrayOfObjects getLayers() throws CacheException {
        return (ArrayOfObjects) m_Layers.get();
    }

    /**
     * Set Accessor method for Layers
     *
    **/
    public void setLayers(ArrayOfObjects value) throws CacheException {
        m_Layers.set( (Transient) value );
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
