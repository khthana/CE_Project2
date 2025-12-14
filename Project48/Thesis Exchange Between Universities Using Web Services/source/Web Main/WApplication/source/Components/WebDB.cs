using System;
using System.Data;
using System.Data.SqlClient;

namespace WApplication.Components
{
	public class WebDB
	{
		public WebDB()
		{
		}
		public DataSet after(string myQ)
		{
			DataSet se = new DataSet();//local
			string cost = "server=(local); database=WebDB;uid=webadmin;pwd=admin;";
			SqlConnection myConnection = new SqlConnection(cost);
			SqlCommand myCommand = new SqlCommand(myQ,myConnection);
			SqlDataAdapter myAdapter = new SqlDataAdapter();
			myConnection.Open();
			myCommand.CommandType = CommandType.Text;
			myAdapter.SelectCommand = myCommand;
			myAdapter.Fill(se);
			myConnection.Close();
			return se;
		}
		public DataSet GetNews()
		{
			string myQ;
			myQ= "select * from NEWS";
			DataSet se = new DataSet();
			se=after(myQ);
			return se;
		}
		

		public DataSet GetUname()
		{
			string myQ;
			myQ= "select NAME from UNIVERSITY";
			DataSet se = new DataSet();
			se=after(myQ);
			return se;
		}
		
		public DataSet GetValue()
		{
			string myQ;
			myQ= "select VALUE from UNIVERSITY";
			DataSet se = new DataSet();
			se=after(myQ);
			return se;
		}

		public DataSet GetQust()
		{
			string myQ;
			myQ= "select * from QUESTION ORDER BY QID DESC";
			DataSet se = new DataSet();
			se=after(myQ);
			return se;
		}
		
		public DataSet GetAns(int a)
		{
			string myQ;
			myQ= "SELECT COUNT(*) AS Expr1 FROM ANSWER WHERE (QID = " + a + ")";
			DataSet se = new DataSet();
			se=after(myQ);
			return se;
		}

		public void UpdateQuset(string subject,string body,string name )
		{
			string myQ;
			myQ= "INSERT INTO QUESTION (QTITLE, QDETAIL, QNAME) VALUES ('"+subject.ToString()+"', '"+body.ToString() +"', '"+name +"')";
			//		DataSet se = new DataSet();
			//	se=after(myQ);
			//		return se;
			string cost = "server=(local); database=WebDB;uid=webadmin;pwd=admin;";
			SqlConnection myConnection = new SqlConnection(cost);
			SqlCommand myCommand = new SqlCommand(myQ,myConnection);
			SqlDataAdapter myAdapter = new SqlDataAdapter();
			myConnection.Open();
			myCommand.CommandType = CommandType.Text;
			myCommand.ExecuteNonQuery();
			
			myConnection.Close();

			//myAdapter = myCommand;
			//	myAdapter.Fill(se);

		}

		public DataSet GetQuest(int a)
		{
			string myQ;
			myQ= "SELECT *  FROM QUESTION WHERE (QID = " + a + ")";
			DataSet se = new DataSet();
			se=after(myQ);
			return se;
		}

		public DataSet GetAnsAll(int a)
		{
			string myQ;
			myQ= "SELECT *  FROM ANSWER WHERE (QID = " + a + ")";
			DataSet se = new DataSet();
			se=after(myQ);
			return se;
		}

		public void AddAns(string name,string detail ,int a)
		{

			string myQ;
			myQ= "INSERT INTO ANSWER (ANSNAME, ANSDETAIL, QID) VALUES ('"+ name.ToString() + "', '"+ detail.ToString() + "', '"+ a +"')";
			string cost = "server=(local); database=WebDB;uid=webadmin;pwd=admin;";
			SqlConnection myConnection = new SqlConnection(cost);
			SqlCommand myCommand = new SqlCommand(myQ,myConnection);
			SqlDataAdapter myAdapter = new SqlDataAdapter();
			myConnection.Open();
			myCommand.CommandType = CommandType.Text;
			myCommand.ExecuteNonQuery();
			myConnection.Close();

		}

		public string SelectQid()
		{
			string myQ;
			myQ= "SELECT MAX(QID)  FROM QUESTION ";
			DataSet se = new DataSet();
			se=after(myQ);
			return se.Tables[0].Rows[0].ItemArray[0].ToString() ;
		}

	}
}
