using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using Npgsql;
using System.Text;

namespace GISBankWS.WebService
{
	/// <summary>
	/// Summary description for ServicePortalWebApp.
	/// </summary>
	public class ServicePortalWebApp : System.Web.Services.WebService
	{
		public ServicePortalWebApp()
		{
			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
		}

		#region Component Designer generated code
		
		//Required by the Web Services Designer 
		private IContainer components = null;
				
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if(disposing && components != null)
			{
				components.Dispose();
			}
			base.Dispose(disposing);		
		}
		
		#endregion
		
		[WebMethod]
		public bool isAccountExist(string creditNo,string creditBehind,string bureau,string month,string year)
		{
			bool isSelectedSucceed = false;
			string selectCommand = constructString(creditNo,creditBehind,bureau,month,year);
			NpgsqlConnection connection = getConnection();
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(selectCommand,connection);
			try
			{
				NpgsqlDataReader dataReader = command.ExecuteReader();
				int couter = 0;
				while(dataReader.Read())
					couter++;

				if (couter != 0)
					isSelectedSucceed = true;
			}
			catch (Exception e)
			{
				isSelectedSucceed =  false;
			}
			finally
			{
				connection.Close();
			}
			return isSelectedSucceed;

		}

		[WebMethod]
		public bool buyCourse(string sqlCommand)
		{
			bool isInsertingSucceed = false;
			NpgsqlConnection connection = getConnection();
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(sqlCommand,connection);
			Int32 rowsaffect;

			try
			{
				rowsaffect =  command.ExecuteNonQuery();
				if (rowsaffect>0)
					isInsertingSucceed = true;
			}
			catch (Exception e)
			{
				isInsertingSucceed = false;
			}
			finally
			{
				connection.Close();
			}
			return isInsertingSucceed;
		}
		public NpgsqlConnection getConnection()
		{
			return (new NpgsqlConnection("Server=localhost;Port=5432;User Id=postgres;Password=webservice;Database=GIS_BANK"));	
		}
		
		public string constructString(string creditNo,string creditBehind,string bereau,string month,string year)
		{
			StringBuilder selectString = new StringBuilder();
			selectString.Append("select * from \"CARD\" where ").Append("\"CREDITNO\" = '").Append(creditNo).Append("' and "+"\"VERIFYNO\" = '");
			selectString.Append(creditBehind).Append("' and "+"\"CREDITTYPE\" = '").Append(bereau).Append("' and \"EXPIREMONTH\" = '").Append(month);
			selectString.Append("' and \"EXPIREYEAR\" = '").Append(year).Append("'");
			return selectString.ToString();
		}



	}
}
