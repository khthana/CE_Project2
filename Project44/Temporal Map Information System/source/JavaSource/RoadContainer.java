//

import java.util.*;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Hashtable;
import java.math.BigInteger;
import java.math.BigDecimal;
import COM.intersys.objects.*;
import COM.intersys.objects.attribute.*;
import COM.intersys.util.SysList;
import COM.intersys.util.CacheException;
import java.lang.*;



public class RoadContainer  
{	
		public int id;
		public double   roadlong,roadtraffic;
		public int roadtype;
		public PointSet pointset;
		public Date  pointsetVTS,pointsetVTE,roadlongVTS,roadlongVTE,roadtrafficVTS,roadtrafficVTE,roadtypeVTS,roadtypeVTE;
		private ObjectFactory rcfactory;
		public String Name,GType,Road;
		public RoadContainer(ObjectFactory factory) 
		{
					id=0;
					roadlong = 0.0;
					roadtraffic=0.0;
					roadtype=0;
					pointset=null;
					pointsetVTS = null;
					pointsetVTE = null;
					roadtrafficVTS = null;
					roadtrafficVTE = null;
					roadlongVTS = null;
					roadlongVTE = null;
					roadtypeVTS = null;
					roadtypeVTE = null;
					rcfactory = factory;
					Name = null;
					GType = null;
		}


		public Vector GetAllRoad(Date AtDate)
		{
				SysList idlist;
				Layer layer=null;
				Geometry geometry=null;
				ArrayOfObjects  geometries=null;
				Road road=null;
				RoadContainer roadcontainer = null;
				Vector RoadVector = null;
				int i;
   			    try 
				{						
			            layer = new Layer(rcfactory);				 							
						idlist = layer.SearchByName("Road");						
						layer = new Layer(rcfactory,idlist.getInt(0));
						geometries = layer.getGeometries();
						RoadVector = new Vector();
						for (i=1; i<=geometries._count(); i++)
						{											
								geometry =  new Geometry(rcfactory,geometries._getObjectAt(Integer.toString(i)));								
								roadcontainer = new RoadContainer(rcfactory);
								road = geometry.getHasRoad();
								roadcontainer.id = (road._getOid()).getIdInt();
								roadcontainer.Name = road.getName();
								roadcontainer.GType = geometry.getGType();
								roadcontainer.roadlong  = (road.GetRoadLong(AtDate)).getLong();
								roadcontainer.roadlongVTS = ((road.GetRoadLong(AtDate)).getVTS());
								roadcontainer.roadlongVTE = ((road.GetRoadLong(AtDate)).getVTE());
								roadcontainer.roadtraffic = (road.GetRoadTraffic(AtDate)).getTraffic();
								roadcontainer.roadtrafficVTS = ((road.GetRoadTraffic(AtDate)).getVTS());
								roadcontainer.roadtrafficVTE = ((road.GetRoadTraffic(AtDate)).getVTE());						
								roadcontainer.roadtype = (road.GetRoadType(AtDate)).getType();
								roadcontainer.roadtypeVTS = ((road.GetRoadType(AtDate)).getVTS());
								roadcontainer.roadtypeVTE = ((road.GetRoadType(AtDate)).getVTE());
								roadcontainer.pointset = geometry.GetGeometry(AtDate);
								roadcontainer.pointsetVTS = (geometry.GetGeometry(AtDate)).getVTS();
								roadcontainer.pointsetVTE = (geometry.GetGeometry(AtDate)).getVTE();
								RoadVector.addElement(roadcontainer);												

						}																
						geometries._close();
						road._close();
						geometry._close();
						layer._close();
						id=1;
						return(RoadVector);
				 } 
				 catch (Exception ex) 
				 {
						System.out.println( "GetAllRoad ::Caught exception: " + ex.getClass().getName() + ": " + ex.getMessage() );
						id=0;
						return(null);
				 } 
        }					
		public Vector SearchRoad(String SearchExpr,Date AtDate)
		{
				SysList idlist;
				Geometry geometry=null;
				Road road=null;
				RoadContainer roadcontainer = null;
				Vector RoadVector = null;
				String DateExpr;
				int i;
   			    try 
				{		
						road = new Road(rcfactory);		
						DateExpr = Integer.toString(AtDate.getMonth()+1)+"/"+Integer.toString(AtDate.getDate())+"/"+Integer.toString(AtDate.getYear()+1900);
					    idlist = road.TemporalSearch(SearchExpr,DateExpr);
						RoadVector = new Vector();

						for (i=1; i<=idlist.getCount(); i++)
						{
								road = new Road(rcfactory,idlist.getInt(i-1));
								roadcontainer = new RoadContainer(rcfactory);
								geometry = road.getHasGeometry();								
								roadcontainer.id = (road._getOid()).getIdInt();
								roadcontainer.Name = road.getName();
								roadcontainer.GType = geometry.getGType();
								roadcontainer.roadlong  = (road.GetRoadLong(AtDate)).getLong();
								roadcontainer.roadlongVTS = ((road.GetRoadLong(AtDate)).getVTS());
								roadcontainer.roadlongVTE = ((road.GetRoadLong(AtDate)).getVTE());
								roadcontainer.roadtraffic = (road.GetRoadTraffic(AtDate)).getTraffic();
								roadcontainer.roadtrafficVTS = ((road.GetRoadTraffic(AtDate)).getVTS());
								roadcontainer.roadtrafficVTE = ((road.GetRoadTraffic(AtDate)).getVTE());
								roadcontainer.roadtype = (road.GetRoadType(AtDate)).getType();
								roadcontainer.roadtypeVTS = ((road.GetRoadType(AtDate)).getVTS());
								roadcontainer.roadtypeVTE = ((road.GetRoadType(AtDate)).getVTE());
								roadcontainer.pointset = geometry.GetGeometry(AtDate);
								roadcontainer.pointsetVTS = (geometry.GetGeometry(AtDate)).getVTS();
								roadcontainer.pointsetVTE = (geometry.GetGeometry(AtDate)).getVTE();
								RoadVector.addElement(roadcontainer);
						}
						geometry._close();						
						road._close();						
						id=1;
						return(RoadVector);
				 } 
				 catch (Exception ex) 
				 {						
						System.out.println( "SearchRoad ::Caught exception: " + ex.getClass().getName() + ": " + ex.getMessage() );
						id=0;
						return(null);
				 } 
        }	
				
		public int UpdateRoad(RoadContainer rcUpdate,Date AtDate)
		{
				Geometry geometry=null;
				Road road=null;
				int chk=0;
   			    try 
				{		
						road = new Road(rcfactory,rcUpdate.id);		
						geometry = road.getHasGeometry();
						chk=road.SetRoadLong(rcUpdate.roadlong,AtDate);
						chk=road.SetRoadTraffic(rcUpdate.roadtraffic,AtDate);
						chk=road.SetRoadType(rcUpdate.roadtype,AtDate);
						chk=geometry.SetGeometry(rcUpdate.pointset,AtDate);
						geometry._save();
						road._save();
						geometry._close();						
						road._close();							
						return(chk);
				 } 
				 catch (Exception ex) 
				 {						
						System.out.println( "Caught exception: " + ex.getClass().getName() + ": " + ex.getMessage() );
						return(0);
				 } 
        }	

		public void  InsertRoad(RoadContainer rcInsert)
		{
		        SysList idlist=null;        
				Layer layer=null;
				Road road=null;        
				RoadLong rlong=null;
				RoadTraffic rtraffic=null;
				RoadType rtype = null;
				Geometry geometry=null;
				PointSet pset=null;
				ArrayOfObjects RoadLongArry=null,RoadTrafficArry=null,RoadTypeArry=null,PointSetArry=null,GeometryArry=null;
		        String ConstVTE = new String("12/31/9999");
		        int i;

				try 
				{    
						// 
						layer = new Layer(rcfactory);
				        idlist = layer.SearchByName("Road");
				        layer = new Layer(rcfactory,idlist.getInt(0));
				        //
				        rlong = new RoadLong(rcfactory);                
				        rlong.setLong(rcInsert.roadlong);
				        rlong.setVTE(new Date(ConstVTE));
				        rlong.setVTS(rcInsert.roadlongVTS);
				        RoadLongArry = new ArrayOfObjects(rcfactory);
				        RoadLongArry._setAt("1",rlong);        
				        // 
				        rtraffic = new RoadTraffic(rcfactory);                
				        rtraffic.setTraffic(rcInsert.roadtraffic);
				        rtraffic.setVTE(new Date(ConstVTE));
				        rtraffic.setVTS(rcInsert.roadtrafficVTS);
				        RoadTrafficArry = new ArrayOfObjects(rcfactory);
				        RoadTrafficArry._setAt("1",rtraffic);        
				        //
				        rtype = new RoadType(rcfactory);                
				        rtype.setType(rcInsert.roadtype);
				        rtype.setVTE(new Date(ConstVTE));
				        rtype.setVTS(rcInsert.roadtypeVTS);
				        RoadTypeArry = new ArrayOfObjects(rcfactory);
						RoadTypeArry._setAt("1",rtype);        
						//
				        pset = new PointSet(rcfactory);
				        pset.setX1((rcInsert.pointset).getX1());
				        pset.setX2((rcInsert.pointset).getX2());
				        pset.setY1((rcInsert.pointset).getY1());
					    pset.setY2((rcInsert.pointset).getY2());
						pset.setVTE(new Date(ConstVTE));
				        pset.setVTS(rcInsert.pointsetVTS);
				        PointSetArry = new ArrayOfObjects(rcfactory);
				        PointSetArry._setAt("1",pset);                        
				        //
					    geometry = new Geometry(rcfactory);
						geometry.setPointSetTemp(PointSetArry);
				        geometry.setGType(rcInsert.GType);
				        //
				        road = new Road(rcfactory);
				        road.setName(rcInsert.Name);
				        road.setRoadLongTemp(RoadLongArry);
				        road.setRoadTrafficTemp(RoadTrafficArry);
				        road.setRoadTypeTemp(RoadTypeArry);
				        //        
				        road.setHasGeometry(geometry);
				        geometry.setHasRoad(road);        
				        //
				        geometry.setLayer(layer);
				        pset.setGeometry(geometry);
				        rlong.setRoad(road);
				        rtraffic.setRoad(road);
				        rtype.setRoad(road);
				        //
				        GeometryArry = new ArrayOfObjects(rcfactory);
				        GeometryArry = layer.getGeometries();
						i=GeometryArry._count()+1;
						GeometryArry._setAt(Integer.toString(i),geometry);
						layer.setGeometries(GeometryArry);			
				        //
				        road._save();
						rlong._save();
				        rtraffic._save();
				        geometry._save();
				        pset._save();
				        //
				        GeometryArry._close();
				        PointSetArry._close();
				        RoadLongArry._close();
				        RoadTrafficArry._close();        
				        RoadTypeArry._close();        
				        //
				        road._close();
				        rlong._close();
				        rtraffic._close();
				        rtype._close();
				        geometry._close();
				        pset._close();        
				} 
				catch (Exception ex) 
				{
					System.out.println( "InsertRoad::Caught exception: " + ex.getClass().getName()+ ": " + ex.getMessage() );
			    }    
	    }	

		public void Print()
		{
				int pcount;
				ListOfDataTypes xp1,yp1,xp2,yp2;

				System.out.println("Name  ----->  "+Name);
				System.out.println("ID  ----->  "+id);
				System.out.println("Long  ----->  "+roadlong+",ValidTimeStart -----> "+roadlongVTS.getDay()+"/"+roadlongVTS.getMonth()+"/"+roadlongVTS.getYear()+
					" ,ValidTimeStop -----> "+roadlongVTE.getDay()+"/"+roadlongVTE.getMonth()+"/"+roadlongVTE.getYear());
				System.out.println("Traffic  ----->  "+roadtraffic+",ValidTimeStart -----> "+roadtrafficVTS.getDay()+"/"+roadtrafficVTS.getMonth()+"/"+roadtrafficVTS.getYear()+
					" ,ValidTimeStop -----> "+roadtrafficVTE.getDay()+"/"+roadtrafficVTE.getMonth()+"/"+roadtrafficVTE.getYear());
				System.out.println("Type  ----->  "+roadtype+",ValidTimeStart -----> "+roadtypeVTS.getDay()+"/"+roadtypeVTS.getMonth()+"/"+roadtypeVTS.getYear()+
					" ,ValidTimeStop -----> "+roadtypeVTE.getDay()+"/"+roadtypeVTE.getMonth()+"/"+roadtypeVTE.getYear());
				System.out.println("Geometry Type  ----->  "+GType);
		try{
			        xp1=pointset.getX1();
			        yp1=pointset.getY1();
			        xp2=pointset.getX2();
			        yp2=pointset.getY2();
					pcount=xp1._count();
				System.out.println("PointSet count----->  "+pcount+",ValidTimeStart ----->  "+pointsetVTS.getDay()+"/"+pointsetVTS.getMonth()+"/"+pointsetVTS.getYear()+
					",ValidTimeStop ----->  "+pointsetVTE.getDay()+"/"+pointsetVTE.getMonth()+"/"+pointsetVTE.getYear());				
				if(pcount>0)
				{
			        for(int r=1;r<=pcount;r++)
					{
				        System.out.println(Integer.toString(r)+" : ("+xp1._getAt(r)+","+yp1._getAt(r)+"),("+
							xp2._getAt(r)+","+yp2._getAt(r)+")");
				    }
				}
		 } 
		 catch (Exception ex) 
		 {				
				System.out.println( "VillageContainer.print() -> "+Name +" Caught exception: " + ex.getClass().getName() + ": " + ex.getMessage() );
		 } 

		}			
}


