using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;

namespace WService
{
	public class Service1 : System.Web.Services.WebService
	{
		public Service1()
		{
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
		public DataSet after(string myQ)
		{
			DataSet se = new DataSet();//local
			string cost = "server=(local); database=MainDB;uid=ranza;pwd=hamster;";
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

		//------------------------------------------------------------------------------------------
		[WebMethod]
		public DataSet TitleAll(string a,string b,string c,string d,int count)
		{
			string myQ;
			myQ = "select * from VIEW1";
			if(count>0)
			{
				for(int i=0;i<count;i++)
				{
					switch(i)
					{
						case 0 :  myQ += " where"; break;
						default : myQ += " and"; break;
					}
					if(a!="")
					{
						string [] split = a.Split(new Char [] {' ', ',', '.', ':'});
						for(int j=0;j<split.Length;j++)
						{
							if(j>0)
								myQ += " and";
							myQ += " TNAME like '%"+split[j]+"%'";
						}
						a="";
					}
					else 
						if(b!="")
					{
						myQ += " FAC like'"+b+"'";
						b="";
					}
					else
						if(c!="")
					{
						myQ += " DEPT like'"+c+"'";
						c="";
					}
					else
						if(d!="")
					{
						myQ += " TYEAR like'"+d+"'";
						d="";
					}
				}
			}
			DataSet se= new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod]
		public DataSet TitleSome(string a,string b,string c,string d,int count)
		{
			string myQ;
			myQ = "select * from VIEW1";
			if(count>0)
			{
				for(int i=0;i<count;i++)
				{
					switch(i)
					{
						case 0 :  myQ += " where"; break;
						default : myQ += " and"; break;
					}
					if(a!="")
					{
						string [] split = a.Split(new Char [] {' ', ',', '.', ':'});
						for(int j=0;j<split.Length;j++)
						{
							if(j==0)
								myQ += " (";
							else //(j>0)
								myQ += " or ";
							myQ += " TNAME like '%"+split[j]+"%'";
						}
						myQ += ")";
						a="";
					}
					else 
						if(b!="")
					{
						myQ += " FAC like'"+b+"'";
						b="";
					}
					else
						if(c!="")
					{
						myQ += " DEPT like'"+c+"'";
						c="";
					}
					else
						if(d!="")
					{
						myQ += " TYEAR like'"+d+"'";
						d="";
					}
				}
			}
			DataSet se= new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod]
		public DataSet KeywordAll(string a,string b,string c,string d,int count)
		{
			string myQ;
			myQ = "select * from VIEW1";
			if(count>0)
			{
				for(int i=0;i<count;i++)
				{
					switch(i)
					{
						case 0 :  myQ += " where"; break;
						default : myQ += " and"; break;
					}
					if(a!="")
					{
						string [] split = a.Split(new Char [] {' ', ',', '.', ':'});
						for(int j=0;j<split.Length;j++)
						{
							if(j>0)
								myQ += " and";
							myQ += " KEYWORD like '%"+split[j]+"%'";
							//	myQ += " or TNAME like '%"+split[j]+"%'";							
						}
						a="";
					}
					else 
						if(b!="")
					{
						myQ += " FAC like'"+b+"'";
						b="";
					}
					else
						if(c!="")
					{
						myQ += " DEPT like'"+c+"'";
						c="";
					}
					else
						if(d!="")
					{
						myQ += " TYEAR like'"+d+"'";
						d="";
					}
				}
			}
			DataSet se= new DataSet();
			se = after(myQ);
			return se;
		}
		[WebMethod]
		public DataSet KeywordSome(string a,string b,string c,string d,int count)
		{
			string myQ;
			myQ = "select * from VIEW1";
			if(count>0)
			{
				for(int i=0;i<count;i++)
				{
					switch(i)
					{
						case 0 :  myQ += " where"; break;
						default : myQ += " and"; break;
					}
					if(a!="")
					{
						string [] split = a.Split(new Char [] {' ', ',', '.', ':'});
						for(int j=0;j<split.Length;j++)
						{
							if(j==0)
								myQ += " (";
							else //(j>0)
								myQ += " or";
							myQ += " KEYWORD like '%"+split[j]+"%'";
							//	myQ += " or TNAME like '%"+split[j]+"%'";							
						}
						myQ += ")";
						a="";
					}
					else 
						if(b!="")
					{
						myQ += " FAC like'"+b+"'";
						b="";
					}
					else
						if(c!="")
					{
						myQ += " DEPT like'"+c+"'";
						c="";
					}
					else
						if(d!="")
					{
						myQ += " TYEAR like'"+d+"'";
						d="";
					}
				}
			}
			DataSet se= new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod]
		public String Uname()
		{
			String name="สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง2";
			return name;
		}

		[WebMethod]
		public DataSet listFac()
		{
			string myQ;
			myQ = "select distinct FAC from VIEW1 order by FAC";
			DataSet se=new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod]
		public DataSet listDept(String aa)
		{
			string myQ;
			myQ = "select distinct DEPT from VIEW1 where FAC = '" +aa+ "'";
			DataSet se=new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod (MessageName="listYear")]
		public DataSet listYear()
		{
			string myQ;
			myQ = "select distinct TYEAR from VIEW1 order by TYEAR DESC";
			DataSet se=new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod (MessageName="listYearWithFac")]
		public DataSet listYear(string fac)
		{
			string myQ;
			myQ = "select distinct TYEAR from VIEW1 where FAC = '"+fac+"' order by TYEAR DESC";
			DataSet se=new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod (MessageName="listYearWithFacDept")]
		public DataSet listYear(string fac,string dept)
		{
			string myQ;
			myQ = "select distinct TYEAR from VIEW1 where FAC = '"+fac+"' and DEPT = '"+dept+"' order by TYEAR DESC";
			DataSet se=new DataSet();
			se = after(myQ);
			return se;
		}
		
		[WebMethod]
		public string result()
		{
			string myQ;
			myQ = "select COUNT(DISTINCT TNAME) from VIEW1";
			DataSet se = new DataSet();
			se = after(myQ);
			return se.Tables[0].Rows[0].ItemArray[0].ToString();
		}

		[WebMethod]
		public DataSet DetailP(string jj)
		{
			string myQ;
			myQ = "select * from VIEW1 where TNAME like '%"+jj+"%'";
			DataSet se =new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod]
		public DataSet DetailA(string jj)
		{
			string myQ;
			myQ = "select * from VIEW1 where TNAME like '%"+jj+"%'";
			DataSet se =new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod]
		public DataSet Name(string a,string kind)
		{
			string myQ="";
			switch(kind)
			{
				case "AUTHOR":
					myQ = "select * from VIEW1 where ANAME like '%"+a+"%'";
					break;
				case "PROFESSOR":
					myQ = "select * from VIEW1 where PNAME like '%"+a+"%'";
					break;
			}
			DataSet se= new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod]
		public DataSet Group()
		{
			string myQ="";
			myQ = "SELECT DISTINCT [FIRST] FROM [T-CAT]";
			DataSet se= new DataSet();
			se = after(myQ);
			return se;
		}
		[WebMethod]
		public DataSet GroupDB(string gr)
		{
			string myQ="";
			myQ = "SELECT[SECOND] FROM  [T-CAT] WHERE ([FIRST] LIKE '%"+ gr +"%')";
			DataSet se= new DataSet();
			se = after(myQ);
			return se;
		}

		[WebMethod]
		public DataSet Mail(string gr)
		{
			string myQ="";
			myQ = "SELECT ID FROM [T-CAT] WHERE ([SECOND] LIKE '%"+gr+"%')";
			DataSet se= new DataSet();
			DataSet sh= new DataSet();
			se = after(myQ);

			sh = mm(se);
			return sh;

		}
		
	
		public DataSet mm(DataSet se)
		{
			DataSet ss = new DataSet();
			string myQ;
			if (se.Tables[0].Rows.Count != 0)
			{
				myQ = "SELECT * FROM PROFESSOR WHERE (ID1 = " + se.Tables[0].Rows[0].ItemArray[0]+") OR (ID2 = "+ se.Tables[0].Rows[0].ItemArray[0]+")";
				
				ss = after(myQ);
				return ss;
			}
			return ss;
		}
	}
}
