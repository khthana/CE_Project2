///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;

namespace GeoCon.dbf
{
	/// <summary>
	/// Holds information for dbf header and records.
	/// </summary>
	public struct Header 
	{
		/// <summary>
		/// type of dbf file.
		/// </summary>
		public int dbf_id;			//a single byte integer

		/// <summary>
		/// the year of the file last update, start from year 1900.
		/// </summary>
		/// 
		public int last_update_y;	//a single byte integer, must add 1900
		/// <summary>
		/// the month of the file last update
		/// </summary>
		public int last_update_m;	//a single byte integer

		/// <summary>
		/// the date of the file last update
		/// </summary>
		public int last_update_d;	//a single byte integer

		/// <summary>
		/// records count
		/// </summary>
		public int recordCount;		//4 bytes, int32 : records count

		/// <summary>
		/// start of dbf file actual record data, in bytes. 
		/// </summary>
		public int data_offset;		//2 bytes, int16

		/// <summary>
		/// data record size, in bytes
		/// </summary>
		public int rec_size;		//2 bytes, int16

		/// <summary>
		/// true if this dbf has memo field
		/// </summary>
		public bool hasmemo;		//true if dbf_id=3

		/// <summary>
		/// length of the dbf file, in bytes - (position of the end of stream)
		/// </summary>
		public int filesize;		//(rec_size * recordCount) + data_offset + 1

	}

}

