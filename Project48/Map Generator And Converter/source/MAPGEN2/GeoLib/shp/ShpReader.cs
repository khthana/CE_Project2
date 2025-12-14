///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory

using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

using GeoCon;
using GeoCon.Data;
using GeoCon.dbf;
using gml;

namespace GeoCon.shp
{
	/// <summary>
	/// A class for reading arcview shapefile(*.shp), including its index(*.shx) and data(*.dbf).
	/// </summary>
	public class ShapeReader
	{

		#region private fields
		private short shpFileCode = 9994;
		private int RecordCount;
		private int currentShapeType;

		private BinaryReader shpReader;
		private BinaryReader shxReader;
		private dbf.DbfReader dbfReader;
		private string name;
		//private const string defaultsrs = "http://www.opengis.net/gml/srs/epsg.xml#4326";
		private string defaultsrs = " ";

		//private dbf.Header dbHeader;
		private shp.RecordHeader[] recordIndex;
		#endregion

		#region public fields

		/// <summary>
		/// Occurs when there's noticable change in this reader progress.
		/// </summary>
		public event GeoCon.Data.StatusEventHandler StatusChange;
		private GeoCon.Data.StatusEventArgs StatusArgs = new GeoCon.Data.StatusEventArgs("",0); 

		/// <summary>Holds various info about the shapefile</summary>
		public shp.ShapeHeader mainHeader;
		//public gml.AbstractGeometryType[] Shapes;

		/// <summary>Field collection of dbf and geometry data.</summary>
		public Data.FieldCollection Fields;
		#endregion

		#region constructor
		/// <summary>
		/// Constructs new ShapeReader
		/// </summary>
		/// <param name="shapepath">the full path to a shapefile(*.shp)</param>
		public ShapeReader(string shapepath)
		{
			try
			{
				string fne =System.IO.Path.GetFileNameWithoutExtension(shapepath);
				name=fne;
				string shxpath = fne + ".shx";
				string dbfpath = fne + ".dbf";

				shpReader = new BinaryReader(File.Open(shapepath,FileMode.Open,FileAccess.Read,FileShare.Read));
				shxReader = new BinaryReader(File.Open(shxpath,FileMode.Open,FileAccess.Read,FileShare.Read));
				if(File.Exists(dbfpath)) dbfReader = new dbf.DbfReader(dbfpath);
				shxpath=null;
				dbfpath=null;
			}
			catch(FileNotFoundException fnfe)
			{
				//System.Windows.Forms.MessageBox.Show("file '"+fnfe.FileName+"' not found.");
				throw new FileNotFoundException(fnfe.Message); 
			}
			catch(System.Exception ioe)
			{
				//System.Windows.Forms.MessageBox.Show("error : \r"+ioe.Message);
				throw new Exception(ioe.Message,ioe.InnerException);   
			}

		}
		#endregion

		#region public methods

		/// <summary>
		/// Begin read .shp, .shx, and .dbf file.
		/// </summary>
		/// <returns>The MapData which holds shapes & data.</returns>
		public MapData Read()
		{
			UpdateStatus("reading "+name+"..",0);
			MapData mapdata = new MapData();
			mapdata.Name=name;
			mainHeader = new shp.ShapeHeader();
			if(dbfReader!=null) dbfReader.Read(ref mapdata);
			readShapeHeader(ref mapdata);
			readIndexHeader();
			readRecordHeader(ref mapdata);
			mapdata.Info.FileDirectory = System.Environment.CurrentDirectory;//System.IO.Path.GetDirectoryName(name);
			mapdata.Info.FileGeometry  = name+".shp";
			mapdata.Info.FileData =(dbfReader!=null)? name+".dbf" : "not found";
			mapdata.Info.FileIndex = name+".shx";
			mapdata.Info.RecordsCount = RecordCount;

			UpdateStatus("Finished reading "+name,0);

			return mapdata;
		}
		/// <summary>
		/// close readers/streams used in this reader.
		/// </summary>
		public void Close()
		{	
			if(dbfReader!=null) dbfReader.Close();
			shpReader.Close();
			shxReader.Close();
		}
		#endregion

		#region read header
		/// <summary>
		/// 
		/// </summary>
		/// <param name="mapdata"></param>
		private void readShapeHeader(ref MapData mapdata)
		{
			shp.ShapeFileHeader fh = mainHeader.shape;
			mainHeader.shape.FileCode = SwapEndian32(shpReader.ReadInt32());
			if (mainHeader.shape.FileCode != shpFileCode)
			{
				shpReader.Close();
				throw new Exception("filetype unknown, "+mainHeader.shape.FileCode.ToString());
			}
			//skip 5 * int32, me know not what are they
			shpReader.BaseStream.Seek(20,SeekOrigin.Current);
			mainHeader.shape.FileLength = SwapEndian32(shpReader.ReadInt32());
			mainHeader.shape.version = shpReader.ReadInt32();
			mainHeader.shape.shapeType = shpReader.ReadInt32();

			mapdata.Info.FileVersion = mainHeader.shape.version.ToString();
			mapdata.Info.BoundsLeft = shpReader.ReadDouble();
			mapdata.Info.BoundsBottom = shpReader.ReadDouble();
			mapdata.Info.BoundsRight = shpReader.ReadDouble();
			mapdata.Info.BoundsTop = shpReader.ReadDouble();

			mapdata.BoundingBox  = new gml.BoxType(new double[4]{mapdata.Info.BoundsLeft,mapdata.Info.BoundsTop,mapdata.Info.BoundsRight,mapdata.Info.BoundsBottom});
		}

		/// <summary>
		/// 
		/// </summary>
		private void readIndexHeader()
		{
			//byte start offset = 1
			mainHeader.index.FileCode = SwapEndian32(shxReader.ReadInt32());

			//skip 5 of 4-bytes integer , me know not what them
			shxReader.BaseStream.Seek(20,SeekOrigin.Current);

			//byte start offset = 25
			mainHeader.index.FileLength = SwapEndian32(shxReader.ReadInt32());
			RecordCount = (mainHeader.index.FileLength - 50) / 4;
		}

		/// <summary>
		/// Reads header for each shape. 
		/// </summary>
		/// <param name="mapdata"></param>
		private void readRecordHeader(ref MapData mapdata)
		{
			recordIndex = new shp.RecordHeader[RecordCount];
			GeometryField fgeo = new Data.GeometryField();
			mapdata.Fields.Add(fgeo);
			
			shxReader.BaseStream.Seek(100,SeekOrigin.Begin);

			for (int i=0;i<recordIndex.Length;i++)
			{
				UpdateStatus("",100*i/RecordCount);

				recordIndex[i] = new shp.RecordHeader();
				recordIndex[i].indexOffset = SwapEndian32(shxReader.ReadInt32());
				recordIndex[i].indexLength = SwapEndian32(shxReader.ReadInt32());

				//TODO ?: check if shpoff bigger than the stream length ;
				long shpoff = recordIndex[i].indexOffset*2;	//we use long for large files;
				shpReader.BaseStream.Seek(shpoff,SeekOrigin.Begin);

				recordIndex[i].shapeNumber = SwapEndian32(shpReader.ReadInt32());
				recordIndex[i].shapeLength = SwapEndian32(shpReader.ReadInt32());

				//shape number start from 1
				if(recordIndex[i].shapeNumber!=(i+1)) throw new Exception("record number in shape file doesn't match index file : " + recordIndex[i].shapeNumber.ToString()+" vs "+(i+1).ToString());
				currentShapeType = shpReader.ReadInt32();
				if(currentShapeType != mainHeader.shape.shapeType) throw new Exception("shape type in record no "+i.ToString()+" doesn't match with the header");

				readSingleShape(i,ref fgeo);
			}
		}
		#endregion

		#region read shapes

		/// <summary>
		/// Read arcview shape
		/// </summary>
		/// <param name="index">record index, zero based</param>
		/// <param name="fgeo"></param>
		private void readSingleShape(int index, ref GeometryField fgeo)
		{
			if(index<recordIndex.GetLowerBound(0) || index > recordIndex.GetUpperBound(0) ) 
			{
				throw new ArgumentOutOfRangeException("index must be between "+recordIndex.GetLowerBound(0).ToString()+" and "+recordIndex.GetUpperBound(0).ToString()) ;
			}
			switch (currentShapeType)
			{
				case (int)shp.TYPE.typeNullShape :
					fgeo.Add(fgeo.NullSymbol);
					break;
				case (int)shp.TYPE.typePoint :
					readPoint(ref fgeo);
					break;
				case (int)shp.TYPE.typePointM :
					readPointM(ref fgeo);
					break;
				case (int)shp.TYPE.typePointZ :
					readPointM(ref fgeo);
					break;
				case (int)shp.TYPE.typeMultiPoint :
					readMultiPoint(ref fgeo);
					break;
				case (int)shp.TYPE.typeMultiPointM :
					readMultiPointM(ref fgeo);
					break;
				case (int)shp.TYPE.typeMultiPointZ :
					readMultiPointM(ref fgeo);
					break;
				case (int)shp.TYPE.typePolyLine :
					readPolyline(ref fgeo);
					break;
				case (int)shp.TYPE.typePolyLineM :
					readPolylineM(ref fgeo);
					break;
				case (int)shp.TYPE.typePolyLineZ :
					readPolylineM(ref fgeo);
					break;
				case (int)shp.TYPE.typePolygon :
					readPolygon(ref fgeo,false);
					break;
				case (int)shp.TYPE.typePolygonM :
					readPolygon(ref fgeo,true);
					break;
				case (int)shp.TYPE.typePolygonZ :
					readPolygon(ref fgeo,true);
					break;
				case (int)shp.TYPE.typeMultiPatch :
					readMultiPatch(ref fgeo,true);
					break;
				default:
					break;
			}
		}
		#endregion

		#region read point, pointM & Z
		/// <summary>
		/// Read a point
		/// </summary>
		/// <param name="fgeo"></param>
		private void readPoint(ref GeometryField fgeo)
		{
			double _x = shpReader.ReadDouble();
			double _y = shpReader.ReadDouble();
			gml.CoordinatesType _ct = new gml.CoordinatesType(new double[2]{_x,_y});
			gml.PointType pt = new gml.PointType(_ct);
			fgeo.Add(new gml.PointPropertyType(pt));
		}
		/// <summary>
		/// Reads PointM or PointZ, M values treated as Z values.
		/// </summary>
		/// <param name="fgeo"></param>
		private void readPointM(ref GeometryField fgeo)
		{
			double _x = shpReader.ReadDouble();
			double _y = shpReader.ReadDouble();
			double _z = shpReader.ReadDouble();
			gml.CoordinatesType _ct = new gml.CoordinatesType(new double[2]{_x,_y});
			_ct.hasZ = true;
			_ct.zArray=new double[1]{_z};
			gml.PointType pt = new gml.PointType(_ct);
			fgeo.Add(new gml.PointPropertyType(pt));
		}

		#endregion

		#region read multipoint, multipointM & Z
		/// <summary>
		/// Read multipoint
		/// </summary>
		/// <param name="fgeo"></param>
		private void readMultiPoint(ref GeometryField fgeo)
		{
			//multipoint bounding box
			double _left = shpReader.ReadDouble();
			double _bottom = shpReader.ReadDouble();
			double _right = shpReader.ReadDouble();
			double _top = shpReader.ReadDouble();

			int _partsCount = shpReader.ReadInt32();
			gml.PointType[] pts = new gml.PointType[_partsCount]; 
			double _x, _y;
			for (int j=0;j<_partsCount;j++)
			{
				_x = shpReader.ReadDouble();
				_y = shpReader.ReadDouble();
				gml.CoordinatesType _ct = new gml.CoordinatesType(new double[2]{_x,_y});
				pts[j] = new gml.PointType(_ct);
			}
			gml.MultiPointType mpt = new gml.MultiPointType(defaultsrs,pts);
			fgeo.Add(new gml.MultiPointPropertyType(mpt)); 
			pts=null;
			mpt=null;
		}
		/// <summary>
		/// Read MultiPointM or MultiPointZ, M values treated as Z values
		/// </summary>
		/// <param name="fgeo"></param>
		private void readMultiPointM(ref GeometryField fgeo)
		{
			//multipoint bounding box
			double _left = shpReader.ReadDouble();
			double _bottom = shpReader.ReadDouble();
			double _right = shpReader.ReadDouble();
			double _top = shpReader.ReadDouble();

			int _partsCount = shpReader.ReadInt32();
			gml.CoordinatesType[] cts=new CoordinatesType[_partsCount];
			double _x, _y;
			for (int j=0;j<_partsCount;j++)
			{
				_x = shpReader.ReadDouble();
				_y = shpReader.ReadDouble();
				cts[j]=new gml.CoordinatesType(new double[2]{_x,_y});
			}
			double miniValue = shpReader.ReadDouble();
			double maxiValue = shpReader.ReadDouble();
			gml.PointType[] pts = new gml.PointType[_partsCount]; 
			for (int j=0;j<_partsCount;j++) //each part contains one point
			{
				cts[j].hasZ=true;
				cts[j].zArray=new double[1]{shpReader.ReadDouble()};
				pts[j]=new PointType(cts[j]);
			}
			if(_partsCount>1)
			{
				gml.MultiPointType mpt = new gml.MultiPointType(defaultsrs,pts);
				fgeo.Add(new gml.MultiPointPropertyType(mpt)); 
				mpt=null;
			}
			else
			{
				fgeo.Add(new gml.PointPropertyType(pts[0])); 
			}
			cts=null;
			pts=null;
		}

		#endregion

		#region read polyline, polylineM & Z
		/// <summary>
		/// Reads a polyline
		/// </summary>
		/// <param name="fgeo"></param>
		private void readPolyline(ref GeometryField fgeo)
		{
			double _left = shpReader.ReadDouble();
			double _bottom = shpReader.ReadDouble();
			double _right = shpReader.ReadDouble();
			double _top = shpReader.ReadDouble();

			int _partsCount = shpReader.ReadInt32();
			int _totalPoints = shpReader.ReadInt32();
			int kend, dcount;
			gml.LineStringType[] LSArray = new gml.LineStringType[_partsCount]; 
			int[] _partPoints = readIntegerArray(shpReader,_partsCount);
			for (int j=0;j<_partPoints.Length;j++)
			{
				kend = (j!=(_partsCount-1))? _partPoints[j+1] : _totalPoints;
				dcount = (kend-_partPoints[j]);
				gml.CoordinatesType _ct = new gml.CoordinatesType(ReadTuples(shpReader,dcount));
				LSArray[j] = new gml.LineStringType(_ct); 
			}
			if(_partsCount>1) //multilinestring
			{
				gml.MultiLineStringType mls = new gml.MultiLineStringType(defaultsrs,LSArray);
				fgeo.Add(new MultiLineStringPropertyType(mls));
			}
			else //linestring
			{
				fgeo.Add(new gml.LineStringPropertyType(LSArray[0]));
			}
			LSArray=null;
			_partPoints=null;
		}
		/// <summary>
		/// Reads a polylineM or polylineZ, M values treated as Z values.
		/// </summary>
		/// <param name="fgeo">GeometryField to store the shape</param>
		private void readPolylineM(ref GeometryField fgeo)
		{
			double _left = shpReader.ReadDouble();
			double _bottom = shpReader.ReadDouble();
			double _right = shpReader.ReadDouble();
			double _top = shpReader.ReadDouble();

			int _partsCount = shpReader.ReadInt32();
			int _totalPoints = shpReader.ReadInt32();
			int kend, dcount;
			gml.CoordinatesType[] cts = new CoordinatesType[_partsCount];
			int[] _partPoints = readIntegerArray(shpReader,_partsCount);
			for (int j=0;j<_partPoints.Length;j++)
			{
				kend = (j!=(_partsCount-1))? _partPoints[j+1] : _totalPoints;
				dcount = (kend-_partPoints[j]);
				cts[j]=new gml.CoordinatesType(ReadTuples(shpReader,dcount));
			}
			double miniValue = shpReader.ReadDouble(); //or startlength?
			double maxiValue = shpReader.ReadDouble(); //or endlength?
			for (int j=0;j<_partPoints.Length;j++)
			{
				kend = (j!=(_partsCount-1))? _partPoints[j+1] : _totalPoints;
				dcount = (kend-_partPoints[j]);
				cts[j].hasZ=true;
				cts[j].zArray=ReadDoubles(shpReader,dcount);
			}
			if(_partsCount>1) //multilinestring
			{
				gml.LineStringType[] lss = new LineStringType[_partsCount];
				for(int i=0;i<cts.Length;i++) lss[i]=new LineStringType(cts[i]);
				gml.MultiLineStringType mls = new gml.MultiLineStringType(defaultsrs,lss);
				fgeo.Add(new MultiLineStringPropertyType(mls));
			}
			else //linestring
			{
				fgeo.Add(new gml.LineStringPropertyType(new gml.LineStringType(cts[0])));
			}
			_partPoints=null;
		}
		#endregion

		#region read polygon
	
		/// <summary>
		/// read polygon / multipolygon and add it into geometry field
		/// For better result: in Arcview, explode the multipart polygon first and then union the resulting polygons back ; plus do some cleaning.
		/// (in avenue using Explode,ReturnUnion,Clean) Must check if such script exists or write one.
		/// </summary>
		/// <param name="fgeo">geometry field where the polygon property will be added to.</param>
		/// <param name="hasMeasure">whether we are reading plain Polygon or PolygonM/PolygonZ.</param>
		private void readPolygon(ref GeometryField fgeo, bool hasMeasure)
		{
			//polygon bounding box
			double _left = shpReader.ReadDouble();
			double _bottom = shpReader.ReadDouble();
			double _right = shpReader.ReadDouble();
			double _top = shpReader.ReadDouble();

			int _partsCount = shpReader.ReadInt32();
			if(_partsCount<=0)
			{
				throw new System.Exception("encounter polygon with zero parts count"); 
			}
			else if(_partsCount==1) //singlepartpolygon
			{
				ReadSinglePartPolygon(ref fgeo,hasMeasure);
			}
			else //multipartpolygon
			{
				ReadMultiPartPolygon(ref fgeo,_partsCount,hasMeasure);
			}
		}

		/// <summary>
		/// Reads singlepart polygon
		/// </summary>
		/// <param name="fgeo">geometry field in which the polygonproperty will be added to</param>
		/// <param name="hasMeasure">whether we are reading plain Polygon or PolygonM/PolygonZ.</param>
		private void ReadSinglePartPolygon(ref GeometryField fgeo, bool hasMeasure)
		{
			int _totalPoints = shpReader.ReadInt32();
			int _partPoints = shpReader.ReadInt32(); //= _totalPoints, but we must advance anyway
			gml.CoordinatesType ct = new gml.CoordinatesType(ReadTuples(shpReader,_totalPoints));
			if(hasMeasure)
			{
				double miniValue = shpReader.ReadDouble();
				double maxiValue = shpReader.ReadDouble();

				ct.hasZ=true;
				ct.zArray=ReadDoubles(shpReader,_totalPoints);
			}
			gml.PolygonType pt = new gml.PolygonType(ct);
			fgeo.Add(new gml.PolygonPropertyType(pt));
		}

		/// <summary>
		/// Reads polygon with 2 or more parts.
		/// </summary>
		/// <param name="fgeo">geometry field in which the polygonproperty or multipolygonproperty will be added to</param>
		/// <param name="partsCount">number of parts</param>
		/// <param name="hasMeasure">whether we are reading plain Polygon or PolygonM/PolygonZ.</param>
		private void ReadMultiPartPolygon(ref GeometryField fgeo,int partsCount, bool hasMeasure)
		{
			int _totalPoints = shpReader.ReadInt32();
			int[] _partPoints = readIntegerArray(shpReader,partsCount);
			gml.BoxType[] boxes = new BoxType[partsCount];
			gml.CoordinatesType[] cts = new CoordinatesType[partsCount];
			for (int j=0;j<partsCount;j++)
			{	
				int dcount = (j != (partsCount-1))? (_partPoints[j+1] - _partPoints[j]) : (_totalPoints - _partPoints[j]);
				boxes[j]=new BoxType();
				cts[j] = new CoordinatesType( ReadTuplesWithBox(shpReader,dcount,ref boxes[j]) );
			}

			if(hasMeasure)
			{
				double miniValue = shpReader.ReadDouble();
				double maxiValue = shpReader.ReadDouble();
				for (int j=0;j<partsCount;j++)
				{	
					int dcount = (j != (partsCount-1))? (_partPoints[j+1] - _partPoints[j]) : (_totalPoints - _partPoints[j]);
					cts[j].hasZ=true;
					cts[j].zArray = ReadDoubles(shpReader,dcount);
				}
			}

			mbox[] ms = matchBoxes(boxes);
			int polycount=0;
			for(int i=0;i<ms.Length;i++)
			{
				if(ms[i].container!=-1) continue;
				polycount++;
				for(int j=0;j<ms.Length;j++) if(ms[j].container==i) ms[i].innerCount++;
			}
			gml.PolygonType[] pgs = new PolygonType[polycount];

			int polyindex=-1;
			for(int i=0;i<ms.Length;i++)
			{
				if(ms[i].container!=-1) continue;
				polyindex++;
				pgs[polyindex] = new PolygonType(cts[ms[i].index]);
				int icount=ms[i].innerCount;
				gml.PolygonTypeInnerBoundaryIs[] ibs = new PolygonTypeInnerBoundaryIs[icount];
				int innerindex=-1;
				for(int j=0;j<ms.Length;j++)
				{
					if(ms[j].container!=i) continue;
					innerindex++;
					ibs[innerindex]=new PolygonTypeInnerBoundaryIs(cts[ms[j].index]);
				}
				pgs[polyindex].innerBoundaryIs = ibs;
				ibs=null;
			}

			if(polycount==1)
			{
				fgeo.Add(new gml.PolygonPropertyType(pgs[0]));
			}
			else 
			{
				fgeo.Add(new gml.MultiPolygonPropertyType(new MultiPolygonType(defaultsrs,pgs)));
			}

			ms  = null;
			pgs = null;
			_partPoints = null;
			boxes = null;
		}

		/// <summary>
		/// Find relationships among parts in shape
		/// </summary>
		/// <param name="boxes">bounding box of each part </param>
		/// <returns>the containment relationship</returns>
		private mbox[] matchBoxes(gml.BoxType[] boxes)
		{
			mbox[] ms = new mbox[boxes.Length];
			for(int i=0;i<boxes.Length;i++)
			{ 
				ms[i]=new mbox();
				ms[i].index=i; 
				ms[i].container=-1;
				ms[i].innerCount=0;
			}
			for(int i=0;i<boxes.Length;i++)
			{
				for(int j=0;j<boxes.Length;j++)
				{
					if(i==j) continue;
					if(boxes[i].isContainedIn(boxes[j]))
					{
						if(ms[i].container==-1)
						{
							ms[i].container=j;
						}
						else
						{
							if(j==ms[i].container) continue;
							if(boxes[j].isContainedIn(boxes[ms[i].container]))	//nested parts
							{
								ms[j].container = ms[i].container; //immediate container
								ms[i].container = -1; //set the container's container to nothing --> new polygon;
								//TODO : Check if this algorithm gives correct result.., so far it's ok.
							}
						}
					}
				}
			}
			return ms;
		}

		/// <summary>
		/// private struct for storing relationship between parts
		/// </summary>
		private struct mbox
		{
			public int index;		//this shape index
			public int container;	//the container index
			public int innerCount;  //number of innerboundary
		}
		// Notes on poygon : 
		// 1. how do we determine if a part is outer or inner ?
		//    they're not always stored in fixed order
		//    they're not always 'clean'(no self intersection & it's inner boundary - there's if any - traverse counter-clockwise)
		// 2. how do we deal with inner boundary containing another inner boundary (island shapes)? 
		//    gml 2.0 innerboundary may not contain another boundary
		#endregion

		#region read multipatch
		/// <summary>
		/// read multipatch
		/// </summary>
		/// <param name="fgeo">Geometry field</param>
		/// <param name="hasMeasure">it must be true</param>
		private void readMultiPatch(ref GeometryField fgeo, bool hasMeasure)
		{
			//multipatch bounding box
			double _left = shpReader.ReadDouble();
			double _bottom = shpReader.ReadDouble();
			double _right = shpReader.ReadDouble();
			double _top = shpReader.ReadDouble();

			int _partsCount = shpReader.ReadInt32();
			int _totalPoints = shpReader.ReadInt32();
			int[] _partPoints = readIntegerArray(shpReader,_partsCount);
			int[] _partTypes = readIntegerArray(shpReader,_partsCount);

			gml.BoxType[] boxes = new BoxType[_partsCount];
			gml.CoordinatesType[] cts = new CoordinatesType[_partsCount];
			for (int j=0;j<_partsCount;j++)
			{	
				int dcount = (j != (_partsCount-1))? (_partPoints[j+1] - _partPoints[j]) : (_totalPoints - _partPoints[j]);
				boxes[j]=new BoxType();
				if(_partTypes[j]==(int)PATCHTYPE.TRISTRIP || _partTypes[j]==(int)PATCHTYPE.TRIFAN)
				{
					double[] dd = ConvertToTriangles( ReadTuplesWithBox(shpReader,dcount,ref boxes[j]),_partTypes[j] );
					cts[j] = new CoordinatesType(dd);
				}
				else
				{
					cts[j] = new CoordinatesType( ReadTuplesWithBox(shpReader,dcount,ref boxes[j]) );
				}
			}
			if(hasMeasure)
			{
				double miniValue = shpReader.ReadDouble();
				double maxiValue = shpReader.ReadDouble();
				for (int j=0;j<_partsCount;j++)
				{	
					int dcount = (j != (_partsCount-1))? (_partPoints[j+1] - _partPoints[j]) : (_totalPoints - _partPoints[j]);
					cts[j].hasZ=true;
					if(_partTypes[j]==(int)PATCHTYPE.TRISTRIP || _partTypes[j]==(int)PATCHTYPE.TRIFAN)
					{
						cts[j].zArray = ConvertToTriangles( ReadDoubles(shpReader,dcount),_partTypes[j] );
					}
					else
					{
						cts[j].zArray = ReadDoubles(shpReader,dcount);
					}
					
				}
			}

			mbox[] ms = matchBoxes(boxes);
			int polycount=0;
			for(int i=0;i<ms.Length;i++)
			{
				if(ms[i].container!=-1) continue;
				polycount++;
				for(int j=0;j<ms.Length;j++) if(ms[j].container==i) ms[i].innerCount++;
			}
			gml.PolygonType[] pgs = new PolygonType[polycount];

			int polyindex=-1;
			for(int i=0;i<ms.Length;i++)
			{
				if(ms[i].container!=-1) continue;
				polyindex++;
				pgs[polyindex] = new PolygonType(cts[ms[i].index]);
				int icount=ms[i].innerCount;
				gml.PolygonTypeInnerBoundaryIs[] ibs = new PolygonTypeInnerBoundaryIs[icount];
				int innerindex=-1;
				for(int j=0;j<ms.Length;j++)
				{
					if(ms[j].container!=i) continue;
					innerindex++;
					ibs[innerindex]=new PolygonTypeInnerBoundaryIs(cts[ms[j].index]);
				}
				pgs[polyindex].innerBoundaryIs = ibs;
				ibs=null;
			}

			if(polycount==1)
			{
				fgeo.Add(new gml.PolygonPropertyType(pgs[0]));
			}
			else 
			{
				fgeo.Add(new gml.MultiPolygonPropertyType(new MultiPolygonType(defaultsrs,pgs)));
			}

			ms  = null;
			pgs = null;
			_partPoints = null;
			boxes = null;
		}

		private double[] ConvertToTriangles(double[] orig,int TriType)
		{
			int newcount=3*(orig.Length-2);
			if (newcount<6) return orig;
			if(TriType==(int)PATCHTYPE.TRISTRIP)
			{	
				double[] ts = new double[newcount];
				for(int i=0;i<2;i++) ts[i]=orig[i];	
				for(int i=3;i<orig.Length;i++)
				{
					ts[3*(i-2)]=ts[3*(i-3)+1];	
					ts[3*(i-2)+1]=ts[3*(i-3)+2];
					ts[3*(i-2)+2]=orig[i];
				}
				return ts;
			}
			else if(TriType==(int)PATCHTYPE.TRIFAN)
			{
				double[] ts = new double[newcount];
				for(int i=0;i<2;i++) ts[i]=orig[i];	
				for(int i=3;i<orig.Length;i++)
				{
					ts[3*(i-2)]=ts[3*(i-3)];
					ts[3*(i-2)+1]=ts[3*(i-3)+2];
					ts[3*(i-2)+2]=orig[i];
				}
				return ts;
			}
			return orig;
		}
		#endregion

		#region utilities
		private int SwapEndian32(int orig) 
		{
			//we may also use Encoding on the reader
			byte[] temp = BitConverter.GetBytes(orig);
			Array.Reverse(temp); 
			return BitConverter.ToInt32(temp, 0);
		}

		/// <summary>
		/// Read consecutive integer values
		/// </summary>
		/// <param name="rd">binary reader</param>
		/// <param name="count">number of integer to read</param>
		/// <returns>array of integer value</returns>
		private int[] readIntegerArray(System.IO.BinaryReader rd, int count)
		{
			int bytescount = 4*count;
			int[] da = new int[count];
			byte[] ba = rd.ReadBytes(bytescount);
			for (int n=0;n<da.Length;n++)
			{
				da[n]=BitConverter.ToInt32(ba,n*4);
			}
			ba=null;
			return da;
		}

		/// <summary>
		/// Reads consecutive double values
		/// </summary>
		/// <param name="rd">Binary reader</param>
		/// <param name="count">number of values to read</param>
		/// <returns>array of double value</returns>
		private double[] ReadDoubles(System.IO.BinaryReader rd, int count)
		{
			byte[] ba = rd.ReadBytes(8*count);
			double[] da = new double[count];
			for (int n=0;n<da.Length;n++)
			{
				da[n]=BitConverter.ToDouble(ba,n*8);
			}
			ba=null;
			return da;
		}

		/// <summary>
		/// utility for reading consecutive tuple values
		/// </summary>
		/// <param name="rd">wether we are reading shp or shx</param>
		/// <param name="count">number of tuples</param>
		/// <returns>array of tuples [x0,y0,..,xn,yn]</returns>
		private double[] ReadTuples(System.IO.BinaryReader rd, int tuplesnum)
		{
			return ReadDoubles(rd,tuplesnum*2);
		}
		/// <summary>
		/// utility for reading consecutive tuple values and create the bounding box.
		/// </summary>
		/// <param name="rd">wether we are reading shp or shx</param>
		/// <param name="count">number of tuples</param>
		/// <returns>array of tuples [x0,y0,..,xn,yn]</returns>
		private double[] ReadTuplesWithBox(System.IO.BinaryReader rd, int tuplesnum,ref gml.BoxType box)
		{
			box.Left  = double.MaxValue;
			box.Right = -double.MaxValue;
			box.Bottom = double.MaxValue;
			box.Top = -double.MaxValue;

			byte[] ba = rd.ReadBytes(8*tuplesnum*2);
			double[] da = new double[tuplesnum*2];
			bool odd=true;
			for (int n=0;n<da.Length;n++)
			{
				da[n]=BitConverter.ToDouble(ba,n*8);
				if(odd)
				{
					if(da[n]<box.Left) {box.Left=da[n];}
					else if(da[n]>box.Right) {box.Right=da[n];}
				}
				else
				{
					if(da[n]<box.Bottom) {box.Bottom=da[n];}
					else if(da[n]>box.Top) {box.Top=da[n];}
				}
				odd=!odd;
			}
			ba=null;
			return da;
		}

		private void UpdateStatus(string message, int progressvalue)
		{
			//if(progressvalue>0 && progressvalue-StatusArgs.statusValue<5) return;
			//StatusArgs.setCurrentStatus(message, progressvalue);
			//StatusChange(this,StatusArgs);
		}
		#endregion

	}
}
