

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
using System.Web.Services.Protocols;
using Microsoft.Web.Services;
using Microsoft.Web.Services.Security;
using Microsoft.Web.Services.Security.X509;
using System.Security.Cryptography;

namespace WebApplication1
{
	/// <summary>
	/// Summary description for WebForm2.
	/// </summary>
	public class SelectedCourse: System.Web.UI.Page
	{
		protected System.Data.DataSet dataSet1;
		private ArrayList mSubjectList =new ArrayList();
		private ArrayList mSchoolList = new ArrayList();
		private ArrayList mPeriodList = new ArrayList();
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Data.DataSet dataSet2;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		DataTable selectedCourseDataTable = new DataTable();
		protected System.Data.DataSet dataSet3;
		private DataSet allDataSet = new DataSet();
		int count;
		private const int term1 =1;
		private const int term2 =2;
		private const int summer1 =3;
	
		protected System.Web.UI.WebControls.Button Button2;
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
		protected System.Web.UI.WebControls.Label Label4;
		private const int summer2 =4;
		private void Page_Load(object sender, System.EventArgs e)
		{	
			
		
			
		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
			
			showDataTable();
			initAllList();
			queryData();
			try
			{
				dataSet3 = allDataSet;
				DataGrid1.DataSource = dataSet3;
				DataGrid1.DataBind();	
			}
			catch(Exception ee)
			{

			}
			count = 0;
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.dataSet1 = new System.Data.DataSet();
			this.dataSet2 = new System.Data.DataSet();
			this.dataSet3 = new System.Data.DataSet();
			((System.ComponentModel.ISupportInitialize)(this.dataSet1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.dataSet2)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.dataSet3)).BeginInit();
			this.DataGrid1.Init += new System.EventHandler(this.Page_Load);
			this.Button2.Click += new System.EventHandler(this.Button2_Click);
			// 
			// dataSet1
			// 
			this.dataSet1.DataSetName = "NewDataSet";
			this.dataSet1.Locale = new System.Globalization.CultureInfo("th-TH");
			// 
			// dataSet2
			// 
			this.dataSet2.DataSetName = "NewDataSet";
			this.dataSet2.Locale = new System.Globalization.CultureInfo("th-TH");
			// 
			// dataSet3
			// 
			this.dataSet3.DataSetName = "NewDataSet";
			this.dataSet3.Locale = new System.Globalization.CultureInfo("th-TH");
			this.Load += new System.EventHandler(this.Page_Load);
			((System.ComponentModel.ISupportInitialize)(this.dataSet1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.dataSet2)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.dataSet3)).EndInit();

		}
		#endregion
		public void showDataTable()
		{
			//create selectedCorseDataTable
			selectedCourseDataTable = dataSet1.Tables.Add("myTable");
			dataSet1=(DataSet)Session["ds"];
			//selectedCourseDataTable = dataSet1.Tables[0];
		}

		public void initAllList()
		{
			
			DataRow tempRow = selectedCourseDataTable.NewRow();
			int rowCount = Convert.ToInt16(Session["count"].ToString());
			for(int i=0;i<rowCount-1;i++)
			{
				try
				{
					tempRow=dataSet1.Tables["myTable"].Rows[i];
					mSubjectList.Add(tempRow.ItemArray.GetValue(1).ToString());
					mSchoolList.Add(tempRow.ItemArray.GetValue(2).ToString());
					mPeriodList.Add(tempRow.ItemArray.GetValue(3).ToString());
				}
				catch(Exception ee)
				{

				}				
			}
		}

		public void queryData()
		{
			for(int i= 0;i<mSchoolList.Count;i++)
			{
				int termTemp =0;
				string subject = (String)mSubjectList[i];
				string theSchool = (String)mSchoolList[i];
				string peRiod = (String)mPeriodList[i];
				switch(peRiod)
				{
					case "Term1" : 
					{
						termTemp=1;
						break;
					}
					case "Term2" : 
					{
						termTemp=2;
						break;
					}
					case "Summer1" : 
					{
						termTemp=3;
						break;
					}
					case "Summer2" : 
					{
						termTemp=4;
						break;
					}
				}
				queryEachSchool(subject,termTemp,theSchool);
			}
				
		}

		public void queryEachSchool(string subject,int termTemp,string theSchool)
		{
			jiaService.JiaService jiaProxy = new WebApplication1.jiaService.JiaService();
			auService.AuService auProxy = new WebApplication1.auService.AuService();
			applyService.ApplyPhysicService applyProxy = new WebApplication1.applyService.ApplyPhysicService();
			neoService.NeoService neoProxy = new WebApplication1.neoService.NeoService();
			string xmlResultString = null;						
			DataSet xmlDataSet = null;
			switch (theSchool)
			{	
				case  "Jia" :
					jiaProxy = configSecureJia(jiaProxy);
					xmlResultString = jiaProxy.getCourse(subject,termTemp);
					
					break;
				case "Au" :
					auProxy = configSecureAu(auProxy);
					xmlResultString =  auProxy.getCourse(subject,termTemp);
					break;
				case "Apply" :
					applyProxy = configSecureApply(applyProxy);
					xmlResultString = applyProxy.getCourse(subject,termTemp);
					break;
				case "Neo" :
					neoProxy = configSecureNeo(neoProxy);
					xmlResultString = neoProxy.getCourse(subject,termTemp);
					break;

			}
			jiaProxy.Dispose();
			auProxy.Dispose();
			applyProxy.Dispose();
			neoProxy.Dispose();
			xmlDataSet = new XMLConverter(xmlResultString).getXmlDataSet();
			configDataSet(xmlDataSet);
		}

		public void configDataSet(DataSet dataSet)
		{
			allDataSet.Merge(dataSet);	
		
		}

		private void Button2_Click(object sender, System.EventArgs e)
		{
			/*try
			{
				DataSet xxx=(DataSet)Session["selectedDataSet2"];
					dataSet3=(DataSet) Session["selectedDataSet2"];

			}
			catch(Exception asa)
			{

			}
			*/
			

			
			count++;
			Session.Add("count", count);
			//Session.Add("selectedCourseDataTable2",selectedCourseDataTable);
			TextBox1.Text=count.ToString();
			DataGridItemCollection items = DataGrid1.Items;
			DataTable dt =new DataTable();
			dt = dataSet3.Tables[0];
			
			
			for (int i=DataGrid1.Items.Count-1; i >=0 ; i--)
			{
				CheckBox chkBox = (CheckBox)items[i].Cells[0].FindControl("CheckBox1");
				if (!chkBox.Checked)
				{
					//selectedCourseDataTable.Rows.RemoveAt(item);	
					dt.Rows.RemoveAt(i);
				}
			}
			
			DataSet newDataSet = new DataSet("new");
			newDataSet=dataSet3;
		//	Session.Remove("selectedDataSet2");
			Session.Add("selectedDataSet2",newDataSet);
			
			
			Response.Redirect("SelectedSummary.aspx");
		}
		
		public jiaService.JiaService configSecureJia(jiaService.JiaService proxy)
		{
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
