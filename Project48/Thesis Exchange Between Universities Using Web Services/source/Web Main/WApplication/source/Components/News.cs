using System;
using System.Data;
using System.Data.SqlClient;

namespace WApplication.Components
{
	/// <summary>
	/// Summary description for News.
	/// </summary>
/*	public class BookDetails
	{
		public string BookName;
		public string Price;
	}*/
	
	public class News
	{
		public News()
		{
		}
		public DataSet GetNews()
		{
			DataSet ds= new DataSet();
			string con = "server=(local); database=WebDB;uid=webadmin;pwd=admin;";
			SqlConnection myCon = new SqlConnection(con);
			string myQ;
			myQ= "SELECT * FROM NEWS";
			SqlCommand myCommand = new SqlCommand(myQ,myCon);	
			SqlDataAdapter myAdapter = new SqlDataAdapter();
			myCon.Open();
			myCommand.CommandType = CommandType.Text;
			myAdapter.SelectCommand = myCommand;
			myAdapter.Fill(ds);
			myCon.Close();
			return ds;
		}

	/*	public BookDetails GetNews(int Nid)
		{
			BookDetails book = new BookDetails();
			book.BookName = "asdfas";
			book.Price = "123";
			return book;
		}
		*/
	}
}
