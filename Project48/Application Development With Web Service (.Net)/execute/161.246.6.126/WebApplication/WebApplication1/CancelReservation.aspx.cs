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
using Npgsql;
using System.Security.Cryptography;
using Microsoft.Web.Services;
using Microsoft.Web.Services.Security;
using Microsoft.Web.Services.Security.X509;
namespace WebApplication1
{
	/// <summary>
	/// Summary description for CancelReservation.
	/// </summary>
	public class CancelReservation : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Button Button2;

		private DataSet mDataSet;
		private ArrayList mSchoolList;
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

			mDataSet = (DataSet)Session["cancelDataSet"];
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Button2.Click += new System.EventHandler(this.Button2_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button2_Click(object sender, System.EventArgs e)
		{
			
			Response.Redirect("Profile.aspx");
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			mSchoolList = getSchoolList();
			mClassIdList = getClassIdList();
			updateDelete();


			//////////////////////////////
			
			NpgsqlConnection connection = DataAccess.getOlalaConnection();
			connection.Open();
			for(int i =0;i<mClassIdList.Count;i++)
			{
                
				
				string sqlCommand =  "update \"TRANSACTION\" set \"STATUS\"='Canceled' where \"USERNAME\" ='"+(string)Session["userName"]+"' and \"COURSEID\"='"+mClassIdList[i].ToString()+"' and \"SCHOOL\" ='"+mSchoolList[i].ToString()+"'" ;

				
				
				NpgsqlCommand command = new NpgsqlCommand(sqlCommand,connection);
				Int32 rowsaffect;

				try
				{
					rowsaffect =  command.ExecuteNonQuery();
					
						
				}
				catch(Exception eee)
				{

				
				}
			}
			
			connection.Close();

			/////////////////////////

			
			Response.Redirect("Profile.aspx");
		}
		public void updateDelete()
		{

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
						if(jiaProxy.cancel(courseId,email))
						{}
						else{}

						//tell user cant reserv;
						break;
					case "Au":
						auService.AuService auProxy = new WebApplication1.auService.AuService();
						auProxy = configSecureAu(auProxy);
						if(auProxy.cancel(courseId,email))
						{}
						else{}
						break;
					case "Apply":
						applyService.ApplyPhysicService applyProxy = new WebApplication1.applyService.ApplyPhysicService();
						applyProxy = configSecureApply(applyProxy);
						if(applyProxy.cancel(courseId,email))
						{}
						else{}
						break;
					case "Neo":
						neoService.NeoService neoProxy = new WebApplication1.neoService.NeoService();
						neoProxy = configSecureNeo(neoProxy);
						if(neoProxy.cancel(courseId,email))
						{}
						else{}
						break;
				}//end switch
			}//end for
			
		}

		public ArrayList getSchoolList()
		{
			
			//get school value from school column in dataGrid when selected
			//
			ArrayList schoolList = new ArrayList();
			DataSet cancelDataSet = (DataSet)Session["cancelDataSet"];
			for (int i =0;i<cancelDataSet.Tables[0].Rows.Count ;i++)
			{
				schoolList.Add(cancelDataSet.Tables[0].Rows[i].ItemArray[14]);
			}
			return  schoolList;
		}

		public ArrayList getClassIdList()
		{
			ArrayList classIdList = new ArrayList();
			DataSet cancelDataSet = (DataSet)Session["cancelDataSet"];
			for (int i =0;i<cancelDataSet.Tables[0].Rows.Count ;i++)
			{
				classIdList.Add(cancelDataSet.Tables[0].Rows[i].ItemArray[1]);
			}
			return classIdList;
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

	}
}
