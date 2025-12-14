/**
 * Cache' Java Class Generated 11:56PM  19 Mar 2002 for class User.Geometry
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





public class Geometry extends Persistent {

    /**
     * Constructor creates a new instance
     *
    **/
    public Geometry( ObjectServer os ) throws CacheException {
        super( os, new SysList() );
    }

    /**
     * Constructor creates a new instance (with arguments)
     *
    **/
    public Geometry( ObjectServer os, SysList args ) throws CacheException {
        super( os, args );
    }

    /**
     * Constructor creates attaches to an existing oref
     *
    **/
    public Geometry( ObjectServer os, Oref oref ) throws CacheException {
        super( os, oref );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Geometry( ObjectServer os, Oid oid ) throws CacheException {
        super( os, oid );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Geometry( ObjectServer os, String id ) throws CacheException {
        super( os, new Oid( id ) );
    }

    /**
     * Constructor opens the specified instance
     *
    **/
    public Geometry( ObjectServer os, int id ) throws CacheException {
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
    private StringAttr m_GType;
    private TransientAttr m_HasRoad;
    private TransientAttr m_HasVillage;
    private TransientAttr m_Layer;
    private TransientAttr m_PointSetTemp;



    /**
     * Initialize the class
     *
    **/
    protected String _initClass( Hashtable h ) {
        h.put( "GType", (m_GType = new StringAttr( this, "GType" )) );
        h.put( "HasRoad", (m_HasRoad = new TransientAttr( this, "HasRoad" )) );
        h.put( "HasVillage", (m_HasVillage = new TransientAttr( this, "HasVillage" )) );
        h.put( "Layer", (m_Layer = new TransientAttr( this, "Layer" )) );
        h.put( "PointSetTemp", (m_PointSetTemp = new TransientAttr( this, "PointSetTemp" )) );
        super._initClass( h );
        

        return "User.Geometry";
    }



    /**
     * Get Accessor method for GType
     *
    **/
    public String getGType() throws CacheException {
        return m_GType.get();
    }

    /**
     * Set Accessor method for GType
     *
    **/
    public void setGType(String value) throws CacheException {
        m_GType.set( value );
    }



    /**
     * Get Accessor method for HasRoad
     *
    **/
    public Road getHasRoad() throws CacheException {
        return (Road) m_HasRoad.get();
    }

    /**
     * Set Accessor method for HasRoad
     *
    **/
    public void setHasRoad(Road value) throws CacheException {
        m_HasRoad.set( (Transient) value );
    }



    /**
     * Get Accessor method for HasVillage
     *
    **/
    public Village getHasVillage() throws CacheException {
        return (Village) m_HasVillage.get();
    }

    /**
     * Set Accessor method for HasVillage
     *
    **/
    public void setHasVillage(Village value) throws CacheException {
        m_HasVillage.set( (Transient) value );
    }



    /**
     * Get Accessor method for Layer
     *
    **/
    public Layer getLayer() throws CacheException {
        return (Layer) m_Layer.get();
    }

    /**
     * Set Accessor method for Layer
     *
    **/
    public void setLayer(Layer value) throws CacheException {
        m_Layer.set( (Transient) value );
    }



    /**
     * Get Accessor method for PointSetTemp
     *
    **/
    public ArrayOfObjects getPointSetTemp() throws CacheException {
        return (ArrayOfObjects) m_PointSetTemp.get();
    }

    /**
     * Set Accessor method for PointSetTemp
     *
    **/
    public void setPointSetTemp(ArrayOfObjects value) throws CacheException {
        m_PointSetTemp.set( (Transient) value );
    }




    /**
     * Java implementation of GetGeometry
     *
    **/
    public PointSet GetGeometry(Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( AtDate, 0 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "GetGeometry", _args, true );

            return (PointSet)m_objectServer.getObjectFromOref( new Oref( _args.getString( 0 ) ), true );
        }
    }



    /**
     * Java implementation of SetGeometry
     *
    **/
    public int SetGeometry(PointSet PSet, Date AtDate) throws CacheException {
        SysList     _args;


        synchronized (m_objectServer) {
            _checkObject( true );
            _args = new SysList();
            _args.set( PSet._getOref().toString(), 0 );
            _args.set( AtDate, 1 );
            _flushData();
            m_objectServer.invokeMethod( m_oRef, "SetGeometry", _args, true );

            return _args.getInt( 0 );
        }
    }





}


/**
 * End-of-file
**/
