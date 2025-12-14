using System;
using System.Data.SqlClient;
using System.Data.OleDb;
using Npgsql;


namespace Restaurant
{
	/// <summary>
	/// Summary description for Database.
	/// </summary>
	public class Database
	{
		public static NpgsqlConnection aCon;
		public static OleDbConnection connect;
		public static OleDbDataReader dbReader;
		public Database()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		public static NpgsqlConnection connected()
		{
			//bool pass = false;
			try
			{
				
				aCon = new NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=center;");	
			}
			catch
			{
				return null;
			}
			return aCon;

		}

		public static void closeConnection()
		{
			connect.Close();
			//dbReader.Close();
		}

	}
}
