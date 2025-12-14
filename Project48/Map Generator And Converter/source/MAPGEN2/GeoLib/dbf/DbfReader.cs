///GeoCon, free tool to create gml & svg from gis files. 
///Copyright(C) 2005 Amri Rosyada
///Distributed under GNU-LGPL, see a copy of the license in root directory
using System;
using System.IO;
using System.Globalization;

using GeoCon.Data;

namespace GeoCon.dbf
{
	/// <summary>
	/// Reads dbf header & records, and adds to a MapData. 
	/// </summary>
	public class DbfReader 
	{
		public Stream DbStream;
		public BinaryReader br;

		/// <summary>
		///  Info of Header and Records in the .dbf file
		/// </summary>
		private dbf.Header DbInfo;

		private long dataOffset;	//starting offset of actual data
		private int fieldsCount=0;	//number of fields
		private int[] offsets;		//relative byte offset of each field
		private int[] sizes;		//size of each field

		//for reading non standard latin char.
		private System.Text.ASCIIEncoding aencoding = new System.Text.ASCIIEncoding();

		/// <summary>
		/// Construct new DbfReader.
		/// </summary>
		/// <param name="filename">path to the dbf file</param>
		public DbfReader(string filename)
		{
			DbStream = new FileStream(filename,FileMode.Open,FileAccess.Read,FileShare.Read);
		}
		public DbfReader(Stream s)
		{
			DbStream = s;
		}

		/// <summary>
		/// Read dbf header and records into a MapData
		/// </summary>
		/// <param name="mapdata">A MapData which will hold the data</param>
		public void Read(ref Data.MapData mapdata)
		{
			br=new BinaryReader(DbStream); 
			br.BaseStream.Seek(0,System.IO.SeekOrigin.Begin);			

			FieldCollection Fields = mapdata.Fields;
			readMainHeader();
			readFieldHeader(ref Fields);
			readRecords(ref Fields);
			mapdata.Info.FieldsCount = fieldsCount;
		}
		/// <summary>
		/// Close the stream associated with this reader.
		/// </summary>
		public void Close()
		{
			aencoding=null;
			if(br!=null) br.Close(); 
			offsets=null;
			sizes=null;			
		}

		/// <summary>
		/// Reads dbf header information
		/// </summary>
		private void readMainHeader()
		{
			DbInfo = new dbf.Header(); 
			DbInfo.dbf_id = br.ReadSByte();
			DbInfo.hasmemo = (DbInfo.dbf_id==3)? true : false;
			DbInfo.last_update_y = br.ReadByte(); 
			DbInfo.last_update_m = br.ReadByte(); 
			DbInfo.last_update_d = br.ReadByte();

			DbInfo.recordCount = (int)br.ReadUInt32();
			DbInfo.data_offset = br.ReadUInt16(); 
			DbInfo.rec_size = br.ReadUInt16(); 
			DbInfo.filesize = (DbInfo.rec_size * DbInfo.recordCount) + DbInfo.data_offset + 1;

			int buffsize = 32;
			fieldsCount = (DbInfo.data_offset - buffsize - 1) / buffsize;

			br.BaseStream.Seek(20,SeekOrigin.Current); 

			//DbInfo.Fields = new Util.FieldCollection(fieldsCount);
		}


		/// <summary>
		/// Reads dbf column header & create appropriate Field.
		/// </summary>
		/// <param name="Fields">A collection the fields will be read into.</param>
		private void readFieldHeader(ref FieldCollection Fields)
		{
			//FieldCollection Fields = new FieldCollection();
			offsets = new int[fieldsCount];
			sizes = new int[fieldsCount];
			int currOffset=1;
			//int currOffset=0;
			//Console.WriteLine ("count {0}",fieldsCount.ToString());
			for ( int i = 0; i < fieldsCount; i++ )  
			{
				//System.Windows.Forms.MessageBox.Show(currOffset.ToString());
				int fsize = readSingleField(ref Fields);
				offsets[i]=currOffset;
				sizes[i]=fsize;
				currOffset = currOffset + fsize;
			}
			if(br.PeekChar()==-1 ) throw new System.IO.EndOfStreamException("unexpected end of dbf file");
			br.BaseStream.Seek(1,SeekOrigin.Current);

			//return Fields;
		}

		/// <summary>
		/// Read a Field header information. Called by readFieldHeader.
		/// </summary>
		/// <param name="Fields">FieldCollection into which the field will be added to.</param>
		/// <returns>The bytes size of the field</returns>
		private int readSingleField(ref FieldCollection Fields)
		{
			//column name max 11 chars.
			byte[] bete = new byte[11];
			br.BaseStream.Read(bete,0,11);
			string name = aencoding.GetString(bete).Trim(new char[1]{'\0'});

			char dbtype = System.Convert.ToChar(br.ReadByte());
			br.BaseStream.Seek(4,SeekOrigin.Current);
			int fsize = br.ReadByte();	//field size
			int fract = br.ReadByte();	//fraction digit number

			Fields.Add(createField(name,dbtype,fsize,fract));

			dataOffset=br.BaseStream.Seek(14,SeekOrigin.Current);

			//Console.WriteLine ("position {0}",br.BaseStream.Position.ToString()+" "+name);
			return fsize;
		}
		/// <summary>
		/// Creates a new Field.
		/// </summary>
		/// <param name="name">name of the field</param>
		/// <param name="dbtype">type of the field</param>
		/// <param name="fsize">field byte size</param>
		/// <param name="fract">fraction digits number</param>
		/// <returns>The newly created field</returns>
		private Field createField(string name, char dbtype,int fsize,int fract)
		{
			Field f;
			switch (dbtype.ToString().ToUpper() )
			{
				case "C" : //c	//string
					f=new StringField(fsize);
					break;
				case "N" : //n	//number : integer vs double determined by fraction digits 
					if(fract==0)
					{
						f = new IntegerField(fsize,fract);
					}
					else
					{
						f = new DoubleField(fsize,fract);
					}
					break;
				case "D" :		//date : format YYYYMMDD
					f=new DateTimeField(); 
					break;
				case "L" :		//bool : char value are 'T' and 'F'
					f=new BoolField(); 
					break;
//				case "F": //f	//?
//					break;
//				case "M" :		//?
//					break;
//				case "G" :		//?
//					break;
				default:
					f=new StringField(fsize); 
					break;
			}
			f.Name=name;
			return f;
		}

		/// <summary>
		/// Reads records data for each Field in a FieldCollection.
		/// </summary>
		/// <param name="Fields">A collection which will hold the data.</param>
		private void readRecords(ref FieldCollection Fields)
		{
			for (int rec=0;rec<DbInfo.recordCount;rec++)
			{
				//Console.WriteLine ("pos {0}",br.BaseStream.Position.ToString() );

				//string str = new string(br.ReadChars(DbInfo.rec_size));

				//to handle non-latin char in string
				byte[] bete = new byte[DbInfo.rec_size];
				br.BaseStream.Read(bete,0,DbInfo.rec_size);
				string str = aencoding.GetString(bete);

				//Console.WriteLine ( "Data read :{0}",str);
				 
				for (int i = 0; i < Fields.Count ; i++ )  
				{
					string s = str.Substring(offsets[i],sizes[i]).Trim();

					//Console.WriteLine ( "Data read {0}",rec.ToString()+","+i.ToString()+" "+offsets[i].ToString()+"-"+sizes[i].ToString()+":"+s);
					//beware the 1A hex char (dbf closing char)
					if(rec==DbInfo.recordCount-1  && i==Fields.Count-1 && s.Length>1) s = s.Remove(s.Length-1,1);
					
					if(Fields[i].Type == typeof(string))
					{
						Fields[i].Add(s);
					}
					else if(Fields[i].Type == typeof(int))
					{
						Fields[i].Add(int.Parse(s));
					}
					else if(Fields[i].Type == typeof(double))
					{
						Fields[i].Add(double.Parse(s));
					}
					else if(Fields[i].Type == typeof(bool))
					{
						if(s.ToUpper()=="T") 
						{
							Fields[i].Add(true);
						}
						else if(s.ToUpper()=="F") 
						{
							Fields[i].Add(false);
						}						
						else
						{
							Fields[i].Add(Fields[i].NullSymbol);
						}
					}
					else if(Fields[i].Type == typeof(DateTime))
					{
						if(s.Length<8) 
						{
							Fields[i].Add(Fields[i].NullSymbol);
							return;
						}
						int iyear	= int.Parse(s.Substring(0,4));
						int imonth	= int.Parse(s.Substring(4,2));
						int iday	= int.Parse(s.Substring(6,2));
						if(    iyear<System.DateTime.MinValue.Year || iyear>System.DateTime.MaxValue.Year
							|| imonth<System.DateTime.MinValue.Month || imonth>System.DateTime.MaxValue.Month
							|| iday<System.DateTime.MinValue.Day || iday>System.DateTime.DaysInMonth(iyear,imonth)
							)
						{
							Fields[i].Add(Fields[i].NullSymbol);
						}
						else
						{
							Fields[i].Add(new DateTime(iyear,imonth,iday));
						}
					}
					else
					{
						throw new FormatException("DbfReader : unable to parse value "+s+" at row:"+rec.ToString()+" col:"+i.ToString()); 
					}
					s=null;
				}		
				str=null;
			}
			//System.Diagnostics.Debug.WriteLine ("Data read : {0} rows",DbInfo.recordCount);
		}

	}
}

