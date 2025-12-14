/**
 * Cache' Java Class Generated 02:18AM  19 Mar 2002 for class User.Road
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





public class Road extends Persistent {

    /**
     * Constructor creates a new instance
     *
    **/
    public Road( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public Road( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public Road( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Road( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Road( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Road( ObjectServer os, int id ) throws CacheException {
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
    private TransientAttr m_HasGeometry;
    private StringAttr m_Name;
    private TransientAttr m_RoadLongTemp;
    private TransientAttr m_RoadTrafficTemp;
    private TransientAttr m_RoadTypeTemp;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "HasGeometry", (m_HasGeometry = new TransientAttr( this, "HasGeometry" )) );
        h.put( "Name", (m_Name = new StringAttr( this, "Name" )) );
        h.put( "RoadLongTemp", (m_RoadLongTemp = new TransientAttr( this, "RoadLongTemp" )) );
        h.put( "RoadTrafficTemp", (m_RoadTrafficTemp = new TransientAttr( this, "RoadTrafficTemp" )) );
        h.put( "RoadTypeTemp", (m_RoadTypeTemp = new TransientAttr( this, "RoadTypeTemp" )) );
        super._initClass( h );
        

        return "User.Road";
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
     * Get Accessor method for RoadLongTemp
     *
    **/
    public ArrayOfObjects getRoadLongTemp() throws CacheException {
        return (ArrayOfObjects) m_RoadLongTemp.get();
    }

    /**
     * Set Accessor method for RoadLongTemp
     *
    **/
    public void setRoadLongTemp(ArrayOfObjects value) throws CacheException {
        m_RoadLongTemp.set( (Transient) value );
    }



    /**
     * Get Accessor method for RoadTrafficTemp
     *
    **/
    public ArrayOfObjects getRoadTrafficTemp() throws CacheException {
        return (ArrayOfObjects) m_RoadTrafficTemp.get();
    }

    /**
     * Set Accessor method for RoadTrafficTemp
     *
    **/
    public void setRoadTrafficTemp(ArrayOfObjects value) throws CacheException {
        m_RoadTrafficTemp.set( (Transient) value );
    }



    /**
     * Get Accessor method for RoadTypeTemp
     *
    **/
    public ArrayOfObjects getRoadTypeTemp() throws CacheException {
        return (ArrayOfObjects) m_RoadTypeTemp.get();
    }

    /**
     * Set Accessor method for RoadTypeTemp
     *
    **/
    public void setRoadTypeTemp(ArrayOfObjects value) throws CacheException {
        m_RoadTypeTemp.set( (Transient) value );
    }




    /**
     * Java implementation of GetRoadLong
     *
    **/
    public RoadLong GetRoadLong(Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( AtDate, 0 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "GetRoadLong", _args, true );

            return (RoadLong)m_objectServer.getObjectFromOref( new Oref( _args.getString( 0 ) ), true );
        }
    }



    /**
     * Java implementation of GetRoadTraffic
     *
    **/
    public RoadTraffic GetRoadTraffic(Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( AtDate, 0 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "GetRoadTraffic", _args, true );

            return (RoadTraffic)m_objectServer.getObjectFromOref( new Oref( _args.getString( 0 ) ), true );
        }
    }



    /**
     * Java implementation of GetRoadType
     *
    **/
    public RoadType GetRoadType(Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( AtDate, 0 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "GetRoadType", _args, true );

            return (RoadType)m_objectServer.getObjectFromOref( new Oref( _args.getString( 0 ) ), true );
        }
    }



    /**
     * Java implementation of SetRoadLong
     *
    **/
    public int SetRoadLong(double RLong, Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( RLong, 0 );
            _args.set( AtDate, 1 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "SetRoadLong", _args, true );

            return _args.getInt( 0 );
        }
    }



    /**
     * Java implementation of SetRoadTraffic
     *
    **/
    public int SetRoadTraffic(double RTraffic, Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( RTraffic, 0 );
            _args.set( AtDate, 1 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "SetRoadTraffic", _args, true );

            return _args.getInt( 0 );
        }
    }



    /**
     * Java implementation of SetRoadType
     *
    **/
    public int SetRoadType(int RType, Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( RType, 0 );
            _args.set( AtDate, 1 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "SetRoadType", _args, true );

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
