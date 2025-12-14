/**
 * Cache' Java Class Generated 11:01AM  09 Mar 2002 for class User.Village
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
 



public class Village extends Persistent {

    /**
     * Constructor creates a new instance
     *
    **/
    public Village( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public Village( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public Village( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Village( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Village( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Village( ObjectServer os, int id ) throws CacheException {
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
    private TransientAttr m_AreaTemp;
    private TransientAttr m_HasGeometry;
    private StringAttr m_Name;
    private TransientAttr m_PopulationTemp;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "AreaTemp", (m_AreaTemp = new TransientAttr( this, "AreaTemp" )) );
        h.put( "HasGeometry", (m_HasGeometry = new TransientAttr( this, "HasGeometry" )) );
        h.put( "Name", (m_Name = new StringAttr( this, "Name" )) );
        h.put( "PopulationTemp", (m_PopulationTemp = new TransientAttr( this, "PopulationTemp" )) );
        super._initClass( h );
        

        return "User.Village";
    }



    /**
     * Get Accessor method for AreaTemp
     *
    **/
    public ArrayOfObjects getAreaTemp() throws CacheException {
        return (ArrayOfObjects) m_AreaTemp.get();
    }

    /**
     * Set Accessor method for AreaTemp
     *
    **/
    public void setAreaTemp(ArrayOfObjects value) throws CacheException {
        m_AreaTemp.set( (Transient) value );
    }



    /**
     * Get Accessor method for HasGeometry
     *
    **/
    public Geometry getHasGeometry() throws CacheException {
        return (Geometry) m_HasGeometry.get();
    }

    /**
     * Set Accessor method for HasGeometry
     *
    **/
    public void setHasGeometry(Geometry value) throws CacheException {
        m_HasGeometry.set( (Transient) value );
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
     * Get Accessor method for PopulationTemp
     *
    **/
    public ArrayOfObjects getPopulationTemp() throws CacheException {
        return (ArrayOfObjects) m_PopulationTemp.get();
    }

    /**
     * Set Accessor method for PopulationTemp
     *
    **/
    public void setPopulationTemp(ArrayOfObjects value) throws CacheException {
        m_PopulationTemp.set( (Transient) value );
    }




    /**
     * Java implementation of GetArea
     *
    **/
    public Area GetArea(Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( AtDate, 0 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "GetArea", _args, true );

            return (Area)m_objectServer.getObjectFromOref( new Oref( _args.getString( 0 ) ), true );
        }
    }



    /**
     * Java implementation of GetPopulation
     *
    **/
    public Population GetPopulation(Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( AtDate, 0 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "GetPopulation", _args, true );

            return (Population)m_objectServer.getObjectFromOref( new Oref( _args.getString( 0 ) ), true );
        }
    }



    /**
     * Java implementation of SetArea
     *
    **/
    public int SetArea(double Area, Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( Area, 0 );
            _args.set( AtDate, 1 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "SetArea", _args, true );

            return _args.getInt( 0 );
        }
    }



    /**
     * Java implementation of SetPopulation
     *
    **/
    public int SetPopulation(double Population, Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( Population, 0 );
            _args.set( AtDate, 1 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "SetPopulation", _args, true );

            return _args.getInt( 0 );
        }
    }



    /**
     * Java implementation of TemporalSearch
     *
    **/
    public SysList TemporalSearch(String SearchExpr, String AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( SearchExpr, 0 );
            _args.set( AtDate, 1 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "TemporalSearch", _args, true );

            return _args.getSysList( 0 );
        }
    }





}


/**
 * End-of-file
**/
