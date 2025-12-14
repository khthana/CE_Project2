using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Text;
using Npgsql;
using Microsoft.Web.Services;
using Microsoft.Web.Services.Security;
using Microsoft.Web.Services.Security.X509;
using System.Security.Cryptography;

namespace WebApplication1
{
	/// <summary>
	/// Summary description for ConfirmLogin.
	/// </summary>
	public class ConfirmLogin : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Button Button2;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		private ArrayList mSchoolList;
		private string mReceiptNo;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.ImageButton ImageButton1;
		private ArrayList mClassIdList;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);

			if (Session["userName"] == null)
			{
				//login or register
			}

		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Button2.Click += new System.EventHandler(this.Button2_Click);
			this.ImageButton1.Click += new System.Web.UI.ImageClickEventHandler(this.ImageButton1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button2_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("http://161.246.6.126/WebApplication1/index.aspx");
		}

		private void LinkButton1_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("Register.aspx");
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			if((Boolean)Session["isBuyOrReserve"])
			{
				string userName = TextBox1.Text;
				string passWord = TextBox2.Text;
				if (checkLogin(userName,passWord))
				{
					mSchoolList = getSchoolList();
					ArrayList list= getClassIdList();
					insert2WATxTable(true);
					updateBuying(getRandomReceiptNo());
					Response.Redirect("Profile.aspx");
				}
			}
			else
			{
				string userName = TextBox1.Text;
				string passWord = TextBox2.Text;
			
				if (checkLogin(userName,passWord))
				{
					mSchoolList = getSchoolList();
					ArrayList list= getClassIdList();
					insert2WATxTable(false);
					insertReservation();
					
					Response.Redirect("Profile.aspx");
				}
			}

		}
		public ArrayList getSelectedSchoolList()
		{
			return (ArrayList)Session["school"];	
		}
			
		public bool insert2WATxTable(bool isBuyOrReserve)
		{
			bool isInsertingSucceed = true;
			
			NpgsqlConnection connection = DataAccess.getOlalaConnection();
			connection.Open();
			for(int i =0;i<mClassIdList.Count;i++)
			{
				string sqlCommand = conStructString(isBuyOrReserve,i);
				NpgsqlCommand command = new NpgsqlCommand(sqlCommand,connection);
				Int32 rowsaffect;
				try
				{
					rowsaffect =  command.ExecuteNonQuery();
					if (rowsaffect==0)
						isInsertingSucceed = false;		
				}
				catch(Exception e)
				{
					isInsertingSucceed = false;
				}
			}
			
			connection.Close();
			
			return isInsertingSucceed;
		}


		public bool checkLogin(string userName,string passWord)
		{
			bool succeeded = true;
			// checkLogin add code here
			StringBuilder sqlCommand = new StringBuilder();
			sqlCommand.Append("select * from \"MEMBER\" where ").Append("\"USERNAME\" = '"+userName);
			sqlCommand.Append("' and \"PASSWORD\" = '"+passWord+"'");

			NpgsqlConnection connection = DataAccess.getOlalaConnection();
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(sqlCommand.ToString(),connection);
			
			NpgsqlDataReader dataReader = command.ExecuteReader();
			int counter = 0;
			while(dataReader.Read())
			{
				counter++;
			}
			Session.Add("userName",userName);

			connection.Close();
			if (counter > 0)
				succeeded = true;
			else succeeded = false;
			return succeeded;
		}

		public string conStructString(bool isBuyOrReserve,int row)
		{
			StringBuilder str = new StringBuilder();
			if (isBuyOrReserve)
			{
				
				//for buying
				return "update \"TRANSACTION\" set \"STATUS\"='Paid' where \"USERNAME\" ='"+(string)Session["userName"]+"' and \"COURSEID\"='"+mClassIdList[row].ToString()+"' and \"SCHOOL\" ='"+mSchoolList[row].ToString()+"'" ;

				
			}
			else
			{
				return "INSERT INTO \"TRANSACTION\" Values(Default,'"+(string)Session["userName"]+"','Reserved','"+mClassIdList[row].ToString() +"','"+mSchoolList[row].ToString()+"')";
				//for reservation
			}
			
			//create sqlcommand for insert webApp TX 
			return str.ToString();
		}

		public void updateBuying(string receiptNo)
		{	
			
			for (int i=0;i < mSchoolList.Count;i++)
			{
				string school = (String)mSchoolList[i];
				int courseId = Convert.ToInt32(mClassIdList[i].ToString());
				string email = (String)Session["userName"];

				switch (school)
				{
					case "Jia":
						jiaService.JiaService jiaProxy = new WebApplication1.jiaService.JiaService();
						jiaProxy = configSecureJia(jiaProxy);
						if(jiaProxy.buyClass(courseId,email,receiptNo))
						{}
						else{}

						//tell user cant reserv;
						break;
					case "Au":
						auService.AuService auProxy = new WebApplication1.auService.AuService();
						auProxy = configSecureAu(auProxy);
						if(auProxy.buyClass(courseId,email,receiptNo))
						{}
						else{}
						break;
					case "Apply":
						applyService.ApplyPhysicService applyProxy = new WebApplication1.applyService.ApplyPhysicService();
						applyProxy = configSecureApply(applyProxy);
						if(applyProxy.buyClass(courseId,email,receiptNo))
						{}
						else{}
						break;
					case "Neo":
						neoService.NeoService neoProxy = new WebApplication1.neoService.NeoService();
						neoProxy = configSecureNeo(neoProxy);
						if(neoProxy.buyClass(courseId,email,receiptNo))
						{}
						else{}
						break;
				}//end switch
			}//end for
			
		}//end method

		public void insertReservation()
		{
			string realName = getRealName();
			string realSurName = getRealSurName();
			string phoneNo =getPhoneNo();
			ArrayList list= getClassIdList();
			
			for (int i=0;i < mSchoolList.Count;i++)
			{
				string school = (String)mSchoolList[i];
				int courseId = Convert.ToInt32((String)mClassIdList[i]);
				string email = (String)Session["userName"];
				
				switch (school)
				{
					case "Jia":
						jiaService.JiaService jiaProxy = new WebApplication1.jiaService.JiaService();
						jiaProxy = configSecureJia(jiaProxy);
						if(jiaProxy.reservation(courseId,email,realName,realSurName,phoneNo))
						{}
						else{}

						//tell user cant reserv;
						break;
					case "Au":
						auService.AuService auProxy = new WebApplication1.auService.AuService();
						auProxy = configSecureAu(auProxy);
						if(auProxy.reservation(courseId,email,realName,realSurName,phoneNo))
						{}
						else{}
						break;
					case "Apply":
						applyService.ApplyPhysicService applyProxy = new WebApplication1.applyService.ApplyPhysicService();
						applyProxy = configSecureApply(applyProxy);
						if(applyProxy.reservation(courseId,email,realName,realSurName,phoneNo))
						{}
						else{}
						break;
					case "Neo":
						neoService.NeoService neoProxy = new WebApplication1.neoService.NeoService();
						neoProxy = configSecureNeo(neoProxy);
						if(neoProxy.reservation(courseId,email,realName,realSurName,phoneNo))
						{}
						else{}
						break;
				}//end switch
			}//end for
			
		}//end method

		public string getRandomReceiptNo()
		{
			Random random1 = new Random();
			Random random2 = new Random();
			mReceiptNo = random1.Next(1000,9999).ToString()+random2.Next(1000,9999).ToString();
			return mReceiptNo;
		}

		public ArrayList getSchoolList()
		{
			
			//get school value from school column in dataGrid when selected
			//
			int option = 0;
			if((bool)Session["isBuyOrReserve"])
			{
				option=1;
			};
			ArrayList schoolList = new ArrayList();
			DataSet confirmDataSet = (DataSet)Session["confirmDataSet"];
			for (int i =0;i<confirmDataSet.Tables[0].Rows.Count ;i++)
			{
				schoolList.Add(confirmDataSet.Tables[0].Rows[i].ItemArray[13+option]);
			}
			return  schoolList;
		}

		public ArrayList getClassIdList()
		{
			int option = 0;
			if((bool)Session["isBuyOrReserve"])
			{
				option=1;
			};
			ArrayList classIdList = new ArrayList();
			DataSet confirmDataSet = (DataSet)Session["confirmDataSet"];
			for (int i =0;i<confirmDataSet.Tables[0].Rows.Count ;i++)
			{
				classIdList.Add(confirmDataSet.Tables[0].Rows[i].ItemArray[0+option].ToString());
			}
			mClassIdList = classIdList;
			return classIdList;
		}

		public string getRealName()
		{
			string selectRealName = "select \"NAME\" from \"MEMBER\" where \"USERNAME\" ='" +(String)Session["userName"]+"'";
			NpgsqlConnection connection = DataAccess.getOlalaConnection();
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(selectRealName,connection);
			NpgsqlDataReader reader = command.ExecuteReader();
			reader.Read();
			connection.Close();
			return reader[0].ToString();
		}

		public string getRealSurName()
		{
			string selectRealSurName = "select  \"SURNAME\" from \"MEMBER\" where \"USERNAME\" ='" +(String)Session["userName"]+"'";
			NpgsqlConnection connection = DataAccess.getOlalaConnection();
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(selectRealSurName,connection);
			NpgsqlDataReader reader = command.ExecuteReader();
			reader.Read();
			connection.Close();
			return reader[0].ToString();
		}

		public string getPhoneNo()
		{
			string selectPhoneNo = "select \"PHONENO\" from \"MEMBER\" where \"USERNAME\" ='" +(String)Session["userName"]+"'";
			NpgsqlConnection connection = DataAccess.getOlalaConnection();
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(selectPhoneNo,connection);
			NpgsqlDataReader reader = command.ExecuteReader();
			reader.Read();
			connection.Close();
			return reader[0].ToString();
		
		}

		public jiaService.JiaService configSecureJia(jiaService.JiaService proxy)
		{
//			

			
			X509Certificate certificate = getCertificate();
			X509SecurityToken encToken = new X509SecurityToken(certificate);
			proxy.RequestSoapContext.Security.Tokens.Add(encToken);
			proxy.RequestSoapContext.Security.Elements.Add(new EncryptedData(encToken));
			proxy.RequestSoapContext.Path.MustUnderstand = false;
			return proxy;
		}

		public auService.AuService configSecureAu(auService.AuService proxy)
		{
			X509Certificate certificate = getCertificate();
			X509SecurityToken encToken = new X509SecurityToken(certificate);
			proxy.RequestSoapContext.Security.Tokens.Add(encToken);
			proxy.RequestSoapContext.Security.Elements.Add(new EncryptedData(encToken));
			proxy.RequestSoapContext.Path.MustUnderstand = false;
			return proxy;
		}

		public applyService.ApplyPhysicService configSecureApply(applyService.ApplyPhysicService proxy)
		{
			X509Certificate certificate = getCertificate();
			X509SecurityToken encToken = new X509SecurityToken(certificate);
			proxy.RequestSoapContext.Security.Tokens.Add(encToken);
			proxy.RequestSoapContext.Security.Elements.Add(new EncryptedData(encToken));
			proxy.RequestSoapContext.Path.MustUnderstand = false;
			return proxy;
		}

		public neoService.NeoService configSecureNeo(neoService.NeoService proxy)
		{
			X509Certificate certificate = getCertificate();
			X509SecurityToken encToken = new X509SecurityToken(certificate);
			proxy.RequestSoapContext.Security.Tokens.Add(encToken);
			proxy.RequestSoapContext.Security.Elements.Add(new EncryptedData(encToken));
			proxy.RequestSoapContext.Path.MustUnderstand = false;
			return proxy;
		}

		public X509Certificate getCertificate()
		{
			X509CertificateStore store = X509CertificateStore.LocalMachineStore(X509CertificateStore.MyStore);
			store.OpenRead();
			byte[] encryptHash = new byte[] {0x24, 0x68, 0xef, 0xb1, 0xfe, 0xbc, 0xce, 0xcc, 0x0f, 0x40, 0xe5, 0x02, 0x1b, 0xf9, 0x8c, 0x82, 0x35, 0xeb, 0x91, 0x5c};
			X509CertificateCollection encryptCerts = store.FindCertificateByHash(encryptHash);
			X509Certificate encCert = encryptCerts[0];
			store.Close();
			return encCert;
		}

		private void ImageButton1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
		{
			Response.Redirect("Register.aspx");
		}
	}
}
