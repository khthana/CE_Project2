using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace Hospital
{
	/// <summary>
	/// Summary description for header.
	/// </summary>
	public class header : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Image Image1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			//String strConn="data source=EKOC;initial catalog=datahospital;password=kucoke;persist security info=True;user id=dbhospital;workstation id=EKOC;packet size=4096";
			String conStr="";
			try
			{
				FileStream aFile=new FileStream(@"C:\Inetpub\configDBHospital.txt",FileMode.Open);
				StreamReader sr=new StreamReader(aFile);
				conStr=sr.ReadToEnd();
				sr.Close();
			}
			catch(IOException ea)
			{
				Console.WriteLine("An IO exception has been thrown!");
				Console.WriteLine(ea.ToString());
			}
			SqlDataAdapter logfileAdapter=new SqlDataAdapter("Select * From HOSPITAL_INFO",conStr);
			SqlCommandBuilder buildCommand=new SqlCommandBuilder(logfileAdapter);

			DataSet dataSet1=new DataSet();
			DataTable logtable=new DataTable();
			logfileAdapter.Fill(dataSet1);
			logtable=dataSet1.Tables[0];

			String hmain="";
			if(logtable.Rows.Count!=0)
			{
				DataRow getAttr=logtable.Rows[0];
				if(!getAttr["HMAIN"].ToString().Equals(""))
				{
					hmain=(String)getAttr["HMAIN"];
				}
				else{hmain="00001";}
			}
			else{hmain="00001";}

			//label2.Text=hmain;


			SqlDataAdapter logfileAdapter2=new SqlDataAdapter("Select * From HOSPITALMAIN",conStr);
			SqlCommandBuilder buildCommand2=new SqlCommandBuilder(logfileAdapter2);

			DataSet dataSet2=new DataSet();
			DataTable logtable2=new DataTable();
			logfileAdapter2.Fill(dataSet2);
			logtable2=dataSet2.Tables[0];

			String hmain_name="";
			String hmain_province="";
			DataRow[] getAttr2=logtable2.Select("HMAIN="+hmain);
			if(getAttr2.Length!=0)
			{
				if(!getAttr2[0]["HMAIN"].ToString().Equals(""))
				{
					hmain_name=(String)getAttr2[0]["HNAME"];
					hmain_province=(String)getAttr2[0]["PURCHASEPROVINCE"];
				}
			}
			else{hmain_name="noname"; hmain_province="noprovince";}
			Label1.Text=hmain_name;


		}

		#region Web Form Designer generated code
		override protected void OnInit(EventArgs e)
		{
			//
			// CODEGEN: This call is required by the ASP.NET Web Form Designer.
			//
			InitializeComponent();
			base.OnInit(e);
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
	}
}
