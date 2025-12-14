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
using Microsoft.Web.Services;
using Microsoft.Web.Services2.Security;
using Microsoft.Web.Services2.Security.X509;
using Microsoft.Web.Services2.Security.Tokens;
using System.Security.Cryptography;
using System.Text;
using Npgsql;

namespace WebApplication1
{
	/// <summary>
	/// Summary description for Paying.
	/// </summary>
	public class Paying : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.DropDownList fComboCardType;
		protected System.Web.UI.WebControls.DropDownList fComboYear;
		protected System.Web.UI.WebControls.Label fLableCreditNo;
		protected System.Web.UI.WebControls.Label fLabelVerifyNo;
		protected System.Web.UI.WebControls.Label fLableCardType;
		protected System.Web.UI.WebControls.Label fLabelYear;
		protected System.Web.UI.WebControls.Label fLableExpire;
		protected System.Web.UI.WebControls.Label fLabelMonth;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.TextBox fTextTotalCost;
		protected System.Web.UI.WebControls.TextBox fTextCreditNo;
		protected System.Web.UI.WebControls.TextBox fTextVerifyNo;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
	
		private DataSet selectedDataSet;
		private static string mCreditNo;
		private string mVerifyNo;
		private string mCardType;
		private string mMonth;
		protected System.Web.UI.WebControls.DropDownList fComboMonth;
		private string mYear;
		protected System.Web.UI.WebControls.Button fButtonCancel;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label4;
		private static string mCustomerBankName;

		private void Page_Load(object sender, System.EventArgs e)
		{
			DataGridItemCollection items = DataGrid1.Items;
			DataTable dt =new DataTable();
			dt = selectedDataSet.Tables[0];
			DataRow tempRow = dt.NewRow();
			for (int i=DataGrid1.Items.Count-1; i >=0 ; i--)
			{
				tempRow=selectedDataSet.Tables[0].Rows[i];
				double firstDigit = Convert.ToDouble(tempRow.ItemArray.GetValue(12).ToString());
				double secondDigit =Convert.ToDouble(fTextTotalCost.Text);
				double sum =(firstDigit+secondDigit);
				fTextTotalCost.Text=sum.ToString();
				//if (!chkBox.Checked)
				//{
			

				//}
				//TextBox1.Text+=tempRow.ItemArray.GetValue(11).ToString();

			}
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);

			selectedDataSet = (DataSet)Session["buyingDataSet"];
			DataGrid1.DataSource = selectedDataSet;
			DataGrid1.DataBind();
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void Button1_Click(object sender, System.EventArgs e)
		{
			mCreditNo = fTextCreditNo.Text;
			mVerifyNo = fTextVerifyNo.Text;
			mCardType = Convert.ToString(fComboCardType.SelectedValue);
			mMonth = Convert.ToString(fComboMonth.SelectedIndex+1);
			mYear = Convert.ToString(fComboYear.SelectedIndex+2006);
			checkCredit();
		}
		public void checkCredit()
		{
			GISService.ServicePortalWebApp gisProx = new WebApplication1.GISService.ServicePortalWebApp();
			ISAGService.ServicePortalWebApp isagProx = new WebApplication1.ISAGService.ServicePortalWebApp();
			
			gisProx = configGISSecure(gisProx);
			isagProx = configISAGSecure(isagProx);

			if (gisProx.isAccountExist(mCreditNo,mVerifyNo,mCardType,mMonth,mYear))
			{
				mCustomerBankName= "GIS Bank";
				doBuying();
			}
			if (isagProx.isAccountExist(mCreditNo,mVerifyNo,mCardType,mMonth,mYear))
			{
				mCustomerBankName = "ISAG Bank";
				doBuying();
			}
			else
				Response.Redirect("invalidCreditCard.html");
		}

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

		public static string getCustomerBankName()
		{
			return mCustomerBankName;
		}
		public static string getCreditNo()
		{
			return mCreditNo;
		}

		public bool doBuying()
		{
			ArrayList classIdList = getClassIdList();
			bool isSucceeded = false;
			for (int i=0;i<classIdList.Count;i++)
			{
				string classId = (String)classIdList[i];
				try
				{
					Session.Add("isBuyOrReserve",true);
					Session.Add("confirmDataSet",getConfirmDataSet());
					
					insert2WA(classId);
					Response.Redirect("ConfirmLogin.aspx");
				
				}
				catch(Exception e)
				{
					isSucceeded = false;
				}
			}
			return isSucceeded;
		}

		public bool insert2WA(string classId)
		{
			bool isInsertingSucceed = false;
			string sqlCommand = constructInsertString(classId);
			NpgsqlConnection connection = DataAccess.getOlalaConnection();
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

		public string constructInsertString(string classId)
		{
		 
			string userName = (String)Session["userName"];
			StringBuilder str = new StringBuilder();
			str.Append("insert into TRANSACTION values (").Append(userName+", paid,");
			str.Append(classId+")");
			return userName.ToString();
		}

		public ArrayList getClassIdList()
		{
			ArrayList classIdList = new ArrayList();
			DataSet buyingDataSet = (DataSet)Session["buyingDataSet"];
			for (int i=0;i<buyingDataSet.Tables[0].Rows.Count;i++)
			{
				classIdList.Add(buyingDataSet.Tables[0].Rows[i].ItemArray[2]);
			}
			return classIdList;
		}

		DataSet getConfirmDataSet()
		{
			DataSet aaa = new DataSet();
			aaa = (DataSet)Session["buyingDataSet"];
			return aaa;
		}

	}
}
