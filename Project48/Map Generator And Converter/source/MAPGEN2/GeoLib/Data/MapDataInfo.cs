///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.Data;

namespace GeoCon.Data
{
	/// <summary>
	/// Info about this MapData.
	/// </summary>
	/// 
	[Serializable]
	public class MapDataInfo
	{
		public MapDataInfo(){}

		private string filever="-1.0.0";
		private string filedir="";
		private string filegeom="";
		private string filedata="";
		private string fileindex="";
		private int fscount=0;
		private int rscount=0;
		private string projname="unknown";

		private double left=double.NaN;
		private double top=double.NaN;
		private double right=double.NaN;
		private double bottom=double.NaN;

		/// <summary>
		/// version of the shp or mif file, or whatever the source file format is.
		/// </summary>
		public string FileVersion
		{
			get{return filever;}
			set{filever=value;}
		}
		/// <summary>
		/// directory where the map source files reside
		/// </summary>
		public string FileDirectory
		{
			get{return filedir;}
			set{filedir=value;}
		}
		/// <summary>
		/// the name of the file which hold the geometry data
		/// </summary>
		public string FileGeometry
		{
			get{return filegeom;}
			set{filegeom=value;}
		}
		/// <summary>
		/// the name of the file which hold the non-geometry data
		/// </summary>
		public string FileData
		{
			get{return filedata;}
			set{filedata=value;}
		}

		/// <summary>
		/// the name of the file which hold the index for geometry data (ie. shx file for a shp file)
		/// </summary>
		public string FileIndex
		{
			get{return fileindex;}
			set{fileindex=value;}
		}
		/// <summary>
		/// number of data fields contained in the map source
		/// </summary>
		public int FieldsCount
		{
			get{return fscount;}
			set{fscount=value;}
		}
		/// <summary>
		/// number of records count in the map source
		/// </summary>
		public int RecordsCount
		{
			get{return rscount;}
			set{rscount=value;}
		}

		/// <summary>
		/// the name of the projection used to describe the map geometry
		/// TODO : add other required parameters to re-project the geometry data.
		/// </summary>
		public string ProjectionName
		{
			get{return projname;}
			set{projname=value;}
		}

		/// <summary>
		/// map left boundary
		/// </summary>
		public double BoundsLeft
		{
			get{return left;}
			set{left=value;}
		}
		/// <summary>
		/// map top boundary
		/// </summary>
		public double BoundsTop
		{
			get{return top;}
			set{top=value;}
		}
		/// <summary>
		/// map right boundary
		/// </summary>
		public double BoundsRight
		{
			get{return right;}
			set{right=value;}
		}
		/// <summary>
		/// map bottom boundary
		/// </summary>
		public double BoundsBottom
		{
			get{return bottom;}
			set{bottom=value;}
		}

		public DataTable CreateDataTable()
		{
			DataTable table = new DataTable();
			table.Columns.Add(new DataColumn("Info",typeof(string)));
			table.Columns.Add(new DataColumn("Value",typeof(string)));

			SetDataRow(ref table,"Directory",this.FileDirectory);
			SetDataRow(ref table,"File Version",this.FileVersion);
			SetDataRow(ref table,"Geometry File",this.FileGeometry);
			SetDataRow(ref table,"Data File",this.FileData);
			SetDataRow(ref table,"Index File",this.FileIndex);
			SetDataRow(ref table,"Data Fields Count",this.FieldsCount);
			SetDataRow(ref table,"Records Count",this.RecordsCount);
			SetDataRow(ref table,"Projection",this.ProjectionName);
			SetDataRow(ref table,"Bound XMin",this.BoundsLeft);
			SetDataRow(ref table,"Bound YMin",this.BoundsBottom);
			SetDataRow(ref table,"Bound XMax",this.BoundsRight);
			SetDataRow(ref table,"Bound YMax",this.BoundsTop);

			return table;
		}
		private void SetDataRow(ref DataTable table, string info,object Value)
		{
			DataRow row=table.NewRow();
			row["Info"]  = info;
			row["Value"] = Value;
			table.Rows.Add(row);
		}
	}
}
