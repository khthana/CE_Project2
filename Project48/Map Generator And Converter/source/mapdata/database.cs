using System;
using Npgsql;

namespace mapdata
{
	/// <summary>
	/// Summary description for database.
	/// </summary>
	public class database
	{
		Npgsql.NpgsqlConnection con;
		NpgsqlCommand command;
		public NpgsqlDataReader dr;

		public database()
		{
			con = new Npgsql.NpgsqlConnection("Server=127.0.0.1;Port=5432;User Id=postgres;Password=mclonly;Database=mapgen;");
			con.Open();
		}

		public void query(string querystring)
		{
			command = new NpgsqlCommand(querystring, con);
			dr = command.ExecuteReader();
		}
		
		public void close()
		{
			con.Close();
		}
	}
}
