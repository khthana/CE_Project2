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
using System.Text;
using Microsoft.Web.Services;
using Microsoft.Web.Services2.Security;
using Microsoft.Web.Services2.Security.X509;
using Microsoft.Web.Services2.Security.Tokens;
using System.Security.Cryptography;

namespace WebApplication1
{
	/// <summary>
	/// Summary description for ConfirmationPage.
	/// </summary>
	public class ConfirmationPage : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label fLabelCustomerBank;
		protected System.Web.UI.WebControls.Label fLableCreditNo;
		protected System.Web.UI.WebControls.Label fLabelDestinationBank;
		protected System.Web.UI.WebControls.Label fLabelDestinationAccountName;
		protected System.Web.UI.WebControls.Label fLableDestinationAccountNo;
		protected System.Web.UI.WebControls.Label fLabelReceiptNo;
		private string mReceived;
		private string mEduName;
		private string mCreditNo;

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

			if (mReceived == null)
			{
				mReceived =  getRandomReceived();
				
			
			}
			fLabelReceiptNo.Text = mReceived;

			mCreditNo = Paying.getCreditNo() ;
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		public static string getRandomReceived()
		{
			Random randomNo1 = new Random();
			return randomNo1.Next(10000,999999).ToString()+randomNo1.Next(10000,999999).ToString();
			
		}

		private void submit_Click(object sender, System.EventArgs e)
		{
//			if (DetailPage.getEduBankName(mEduName) == "GIS Bank")
//				doGIS();
//			if (DetailPage.getEduBankName(mEduName) == "ISAG Bank")
//				doISAG();
		}

//		public void doGIS()
//		{
//			GISService.ServicePortalWebApp gisProxy = new WebApplication1.GISService.ServicePortalWebApp();
//			gisProxy = configGISSecure(gisProxy);
//			
//			string buyingString = constructBuying();
//			if (gisProxy.buyCourse(buyingString))
//			{
//				insertTransfer(buyingString);
//				Response.Redirect("succeeded.html");
//			}
//			else Response.Redirect("error.html");
//
//		}
//
//		public void doISAG()
//		{
//			
//			ISAGService.ServicePortalWebApp isagProxy = new WebApplication1.ISAGService.ServicePortalWebApp();
//			isagProxy = configISAGSecure(isagProxy);
//			string buyingString = constructBuying();
//			if (isagProxy.buyCourse(buyingString))
//			{
//				insertTransfer(buyingString);
//				Response.Redirect("succeeded.html");
//			}
//			else Response.Redirect("error.html");
//		}

		public void insertTransfer(string insertCommand)
		{
			NpgsqlConnection connection = new NpgsqlConnection("Server=localhost;Port=5432;User Id=webservice;Password=webservice;Database=OlalaPaymentWA");
			connection.Open();
			NpgsqlCommand command = new NpgsqlCommand(insertCommand,connection);
			Int32 rowsaffected;
    
			try
			{
				rowsaffected = command.ExecuteNonQuery();
			}
			finally
			{
				connection.Close();
			}
		}

//		public string constructBuying()
//		{
//			DateTime now = DateTime.Now;
//		
//			StringBuilder insertCommand = new StringBuilder();
//
//			
//
//			insertCommand.Append("insert into \"TRANSFER\" values(").Append("'"+mReceived+"'");
//			insertCommand.Append(",").Append("'"+CreditCheckingPage.getCustomerBankName()+"'").Append(",").Append("'"+CreditCheckingPage.getCreditNo()+"'");
//			insertCommand.Append(",").Append("'"+DetailPage.getEduBankName(mEduName)+"'"+",").Append("'"+DetailPage.getEduAccountNo(mEduName)+"'");
//			insertCommand.Append(",").Append("'"+now.ToShortDateString()+now.ToShortTimeString()+"'"+")");
//			mReceived = null;
//			return insertCommand.ToString();
//
//		}

		public GISService.ServicePortalWebApp configGISSecure(GISService.ServicePortalWebApp proxy)
		{
			byte[] encHash = new byte[]{0x87,0xd9,0x2c,0xca,0xb7,0x14,0xc3,0x0d,0xb0,0xe0,0xba,0xe6,0xb9,0xb0,0xb6,0x5b,0x5d,0x6d,0xf7,0xcf};
			byte[] signHash = new byte[] {0xca,0x76,0x01,0x38,0x1b,0x45,0x78,0x50,0x2b,0x62,0xb8,0x80,0x98,0x25,0x66,0x4f,0x1e,0x78,0xdf,0xa2};
			X509CertificateStore store = X509CertificateStore.LocalMachineStore(X509CertificateStore.MyStore);
			store.OpenRead();
			X509CertificateCollection encCerts = store.FindCertificateByHash(encHash);
			X509Certificate encCert = encCerts[0];
			X509CertificateCollection signCerts = store.FindCertificateByHash(signHash);
			X509Certificate signCert = signCerts[0];
			
			X509SecurityToken encToken = new X509SecurityToken(encCert);
			X509SecurityToken signToken = new X509SecurityToken(signCert);

			proxy.RequestSoapContext.Security.Tokens.Add(signToken);
			proxy.RequestSoapContext.Security.Elements.Add(new EncryptedData(encToken));
			proxy.RequestSoapContext.Security.Elements.Add(new MessageSignature(signToken));

			return proxy;
		}

		public ISAGService.ServicePortalWebApp configISAGSecure(ISAGService.ServicePortalWebApp proxy)
		{
			byte[] encHash = new byte[]{0x87,0xd9,0x2c,0xca,0xb7,0x14,0xc3,0x0d,0xb0,0xe0,0xba,0xe6,0xb9,0xb0,0xb6,0x5b,0x5d,0x6d,0xf7,0xcf};
			byte[] signHash = new byte[] {0xca,0x76,0x01,0x38,0x1b,0x45,0x78,0x50,0x2b,0x62,0xb8,0x80,0x98,0x25,0x66,0x4f,0x1e,0x78,0xdf,0xa2};
			X509CertificateStore store = X509CertificateStore.LocalMachineStore(X509CertificateStore.MyStore);
			store.OpenRead();
			X509CertificateCollection encCerts = store.FindCertificateByHash(encHash);
			X509Certificate encCert = encCerts[0];
			X509CertificateCollection signCerts = store.FindCertificateByHash(signHash);
			X509Certificate signCert = signCerts[0];
			
			X509SecurityToken encToken = new X509SecurityToken(encCert);
			X509SecurityToken signToken = new X509SecurityToken(signCert);

			proxy.RequestSoapContext.Security.Tokens.Add(signToken);
			proxy.RequestSoapContext.Security.Elements.Add(new EncryptedData(encToken));
			proxy.RequestSoapContext.Security.Elements.Add(new MessageSignature(signToken));

			return proxy;
		}


	}

}
