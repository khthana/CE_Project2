using System;
using System.IO;

namespace GeoCon.shp
{
	/// <summary>
	/// Summary description for ShapeHeader.
	/// </summary>
	/// 

	public class ShapeHeader
	{
		public shp.ShapeFileHeader shape;
		public shp.IndexFileHeader index;
		public ShapeHeader()
		{
			shape=new ShapeFileHeader(); 
			index=new IndexFileHeader(); 
		}
	}

	public struct ShapeFileHeader
	{
		public int FileCode; //big
		public int FileLength; //big Endian
		public int version; //Little
		public int shapeType; //Little
	}
	public struct IndexFileHeader	
	{
		public int FileCode; //big
		public int FileLength; //big Endian
	}

	public struct RecordHeader //all big endian 4-bytes integer
	{
		public int indexOffset;
		public int indexLength;
		public int shapeNumber;
		public int shapeLength;
	}

	public enum FILESIZES
	{
		MainHeaderSize = 100, //in bytes
		IndexRecSize = 8, //in bytes
		shpRecSize = 8
	}

	public enum TYPE
	{
		typeNullShape = 0,

		typePoint = 1,
		typePolyLine = 3,
		typePolygon = 5,
		typeMultiPoint = 8,

		typePointZ = 11,
		typePolyLineZ = 13,
		typePolygonZ = 15,
		typeMultiPointZ = 18,

		typePointM = 21,
		typePolyLineM = 23,
		typePolygonM = 25,
		typeMultiPointM = 28,

		typeMultiPatch = 31,
	}

	public enum PATCHTYPE
	{
		TRISTRIP=0, //connecting the new vertex with its two immediate predecessors.
		TRIFAN=1,   //connecting the new vertex with its immediate predecessor and the first vertex of a part
		OUTERRING=2,
		INNERRING=3,
		FIRSTRING=4,
		RING=5
	}

	
	
}
