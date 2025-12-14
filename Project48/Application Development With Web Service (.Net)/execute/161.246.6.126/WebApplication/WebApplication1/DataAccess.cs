using System;
using Npgsql;

namespace WebApplication1
{
	/// <summary>
	/// Summary description for DataAccess.
	/// </summary>
	public class DataAccess
	{
		public DataAccess()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static NpgsqlConnection getOlalaConnection()
		{
			return new NpgsqlConnection("Server=161.246.6.120;Port=5432;User Id=postgres;Password=webservice;Database=OLALA_EDU");
			
		}

		public static NpgsqlConnection getGISConnection()
		{
			return new NpgsqlConnection("Server=161.246.6.120;Port=5432;User Id=postgres;Password=webservice;Database=GIS_BANK");
			
		}

		public static NpgsqlConnection getISAGConnection()
		{
			return new NpgsqlConnection("Server=161.246.6.120;Port=5432;User Id=postgres;Password=webservice;Database=ISAG_BANK");
		}

	
	}
}
