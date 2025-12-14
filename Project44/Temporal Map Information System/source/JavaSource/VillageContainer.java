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



public class VillageContainer  
{	
		public int id;
		public double  area,population;
		public PointSet pointset;
		public Date  pointsetVTS,pointsetVTE,areaVTS,areaVTE,populationVTS,populationVTE;
		private ObjectFactory vcfactory;
		public String Name,GType;
		public VillageContainer(ObjectFactory factory) 
		{
					id=0;
					area = 0.0;
					population=0.0;
					pointset=null;
					pointsetVTS = null;
					pointsetVTE = null;
					areaVTS = null;
					areaVTE = null;
					populationVTS = null;
					populationVTE = null;
					GType=null;
					Name=null;
					vcfactory = factory;
		}

		

		public Vector GetAllVillage(Date AtDate)
		{
				SysList idlist;
				Layer layer=null;
				Geometry geometry=null;
				ArrayOfObjects  geometries=null;
				Village village=null;
				VillageContainer villagecontainer = null;
				Vector VillageVector = null;
				int i;
   			    try 
				{								
			            layer = new Layer(vcfactory);				 							
						idlist = layer.SearchByName("Village");						
						layer = new Layer(vcfactory,idlist.getInt(0));
						geometries = layer.getGeometries();
						VillageVector = new Vector();
						for (i=1; i<=geometries._count(); i++)
						{													
								villagecontainer = new VillageContainer(vcfactory);
								geometry =  new Geometry(vcfactory,geometries._getObjectAt(Integer.toString(i)));
								village = geometry.getHasVillage();
								villagecontainer.id = (village._getOid()).getIdInt();
								villagecontainer.Name = village.getName();
								villagecontainer.GType = geometry.getGType();
								villagecontainer.area  = (village.GetArea(AtDate)).getVillageArea();
								villagecontainer.areaVTS = ((village.GetArea(AtDate)).getVTS());
								villagecontainer.areaVTE = ((village.GetArea(AtDate)).getVTE());
								villagecontainer.population = (village.GetPopulation(AtDate)).getVillagePopulation();
								villagecontainer.populationVTS = ((village.GetPopulation(AtDate)).getVTS());
								villagecontainer.populationVTE = ((village.GetPopulation(AtDate)).getVTE());
								villagecontainer.pointset = geometry.GetGeometry(AtDate);
								villagecontainer.pointsetVTS = (geometry.GetGeometry(AtDate)).getVTS();
								villagecontainer.pointsetVTE = (geometry.GetGeometry(AtDate)).getVTE();								
								VillageVector.addElement(villagecontainer);										
						}																		
						geometries._close();
						village._close();
						geometry._close();
						layer._close();
						id=1;
						return(VillageVector);
				 } 
				 catch (Exception ex) 
				 {
						id=0;
						System.out.println( "GetAllVillage::Caught exception: " + ex.getClass().getName() + ": " + ex.getMessage() );
						return(null);
				 } 
        }					

		public Vector SearchVillage(String SearchExpr,Date AtDate)
		{
				SysList idlist;
				Geometry geometry=null;
				Village village=null;
				VillageContainer villagecontainer = null;
				Vector VillageVector = null;
				String DateExpr;
				int i;
   			    try 
				{		
						
						village = new Village(vcfactory);		
						DateExpr = Integer.toString(AtDate.getMonth()+1)+"/"+Integer.toString(AtDate.getDate())+"/"+Integer.toString(AtDate.getYear()+1900);
					    idlist = village.TemporalSearch(SearchExpr,DateExpr);
						VillageVector = new Vector();
						for (i=1; i<=idlist.getCount(); i++)
						{
								villagecontainer = new VillageContainer(vcfactory);
								village = new Village(vcfactory,idlist.getInt(i-1));
								geometry = village.getHasGeometry();								
								villagecontainer.id = (village._getOid()).getIdInt();
								villagecontainer.Name = village.getName();
								villagecontainer.GType = geometry.getGType();
								villagecontainer.area  = (village.GetArea(AtDate)).getVillageArea();
								villagecontainer.areaVTS = ((village.GetArea(AtDate)).getVTS());
								villagecontainer.areaVTE = ((village.GetArea(AtDate)).getVTE());
								villagecontainer.population = (village.GetPopulation(AtDate)).getVillagePopulation();
								villagecontainer.populationVTS = ((village.GetPopulation(AtDate)).getVTS());
								villagecontainer.populationVTE = ((village.GetPopulation(AtDate)).getVTE());
								villagecontainer.pointset = geometry.GetGeometry(AtDate);
								villagecontainer.pointsetVTS = (geometry.GetGeometry(AtDate)).getVTS();
								villagecontainer.pointsetVTE = (geometry.GetGeometry(AtDate)).getVTE(); 		
								VillageVector.addElement(villagecontainer);							
						}
						geometry._close();						
						village._close();						
						id=1;
						return(VillageVector);
				 } 
				 catch (Exception ex) 
				 {				
						id=0;
						System.out.println( "SearchVillage::Caught exception: " + ex.getClass().getName() + ": " + ex.getMessage() );						
						return(null);
				 } 
        }	

		public void  InsertVillage(VillageContainer vcInsert)
		{
		        SysList idlist=null;        
				Layer layer=null;
				Village village=null;        
				Area area=null;
				Population population=null;
				Geometry geometry=null;
				PointSet pset=null;
				ArrayOfObjects AreaArry=null,PopulationArry=null,PointSetArry=null,GeometryArry=null;
		        String ConstVTE = new String("12/31/9999");
		        int i;
				try 
				{    
						// 
						layer = new Layer(vcfactory);
				        idlist = layer.SearchByName("Village");
				        layer = new Layer(vcfactory,idlist.getInt(0));
				        //
				        area = new Area(vcfactory);                
				        area.setVillageArea(vcInsert.area);
				        area.setVTE(new Date(ConstVTE));
				        area.setVTS(vcInsert.areaVTS);
				        AreaArry = new ArrayOfObjects(vcfactory);
				        AreaArry._setAt("1",area);        
				        // 
				        population = new Population(vcfactory);                
				        population.setVillagePopulation(vcInsert.population);
				        population.setVTE(new Date(ConstVTE));
				        population.setVTS(vcInsert.populationVTS);
				        PopulationArry = new ArrayOfObjects(vcfactory);
				        PopulationArry._setAt("1",population);        
				        //
				        pset = new PointSet(vcfactory);
				        pset.setX1((vcInsert.pointset).getX1());
				        pset.setX2((vcInsert.pointset).getX2());
				        pset.setY1((vcInsert.pointset).getY1());
					    pset.setY2((vcInsert.pointset).getY2());
						pset.setVTE(new Date(ConstVTE));
				        pset.setVTS(vcInsert.pointsetVTS);
				        PointSetArry = new ArrayOfObjects(vcfactory);
				        PointSetArry._setAt("1",pset);                        
				        //
					    geometry = new Geometry(vcfactory);
						geometry.setPointSetTemp(PointSetArry);
				        geometry.setGType(vcInsert.GType);
				        //
				        village = new Village(vcfactory);
				        village.setName(vcInsert.Name);
				        village.setPopulationTemp(PopulationArry);
				        village.setAreaTemp(AreaArry);
				        //        
				        village.setHasGeometry(geometry);
				        geometry.setHasVillage(village);        
				        //
				        geometry.setLayer(layer);
				        pset.setGeometry(geometry);
				        area.setVillage(village);
				        population.setVillage(village);
				        //
				        GeometryArry = new ArrayOfObjects(vcfactory);
				        GeometryArry = layer.getGeometries();
						i=GeometryArry._count()+1;
						GeometryArry._setAt(Integer.toString(i),geometry);
						layer.setGeometries(GeometryArry);			
				        //
				        village._save();
						area._save();
				        population._save();
		  		        pset._save();
				        geometry._save();				   
				        //
				        GeometryArry._close();
				        PointSetArry._close();
				        PopulationArry._close();
				        AreaArry._close();        
				        //
				        village._close();
				        area._close();
				        population._close();
				        geometry._close();
				        pset._close();        
						id=1;
				} 
				catch (Exception ex) 
				{
					id=0;
					System.out.println( "InsertVillage::Caught exception: " + ex.getClass().getName()+ ": " + ex.getMessage() );
			    }    
    }
	public int UpdateVillage(VillageContainer vcUpdate,Date AtDate)
	{
				Geometry geometry=null;
				Village village=null;
				int chk=0;
   			    try 
				{		
						village = new Village(vcfactory,vcUpdate.id);		
						geometry = village.getHasGeometry();
						chk = village.SetArea(vcUpdate.area,AtDate);
						chk=village.SetPopulation( vcUpdate.population,AtDate);
						chk=geometry.SetGeometry(vcUpdate.pointset,AtDate);
						geometry._save();
						village._save();
						geometry._close();						
						village._close();							
						id=1;
						return(chk);
				 } 
				 catch (Exception ex) 
				 {				
						id=0;
						System.out.println( "Caught exception: " + ex.getClass().getName() + ": " + ex.getMessage() );
						return(0);
				 } 
     }	
	public void Print()
	{
				int pcount;
				ListOfDataTypes xp,yp;

				System.out.println("Name  ----->  "+Name);
				System.out.println("ID  ----->  "+id);
				System.out.println("Geometry Type  ----->  "+GType);
				System.out.println("Area  ----->  "+area+" ,ValidTimeStart ----->  "+areaVTS.getDay()+"/"+areaVTS.getMonth()+"/"+areaVTS.getYear()+
					" ,ValidTimeStop ----->  "+areaVTE.getDay()+"/"+areaVTE.getMonth()+"/"+areaVTE.getYear());
				System.out.println("Population  ----->  "+population+" ,ValidTimeStart ----->  "+populationVTS.getDay()+"/"+populationVTS.getMonth()+"/"+populationVTS.getYear()+
					" ,ValidTimeStop ----->  "+populationVTE.getDay()+"/"+populationVTE.getMonth()+"/"+populationVTE.getYear());
		try{
			        xp=pointset.getX1();
			        yp=pointset.getY1();
					pcount=xp._count();
				System.out.println("PointSet count----->  "+pcount+" ,ValidTimeStart ----->  "+pointsetVTS.getDay()+"/"+pointsetVTS.getMonth()+"/"+pointsetVTS.getYear()+
					" ,ValidTimeStop ----->  "+pointsetVTE.getDay()+"/"+pointsetVTE.getMonth()+"/"+pointsetVTE.getYear());				
				if(pcount>0)
				{
			        for(int r=1;r<=pcount;r++)
					{
				        System.out.println(Integer.toString(r)+" : ("+xp._getAt(r)+","+yp._getAt(r)+")");
				    }
				}
		 } 
		 catch (Exception ex) 
		 {				
				System.out.println( "VillageContainer.print() -> "+Name +" Caught exception: " + ex.getClass().getName() + ": " + ex.getMessage() );
		 } 

//************************************************
      }			
}


