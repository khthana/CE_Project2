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

namespace project
{
	/// <summary>
	/// Summary description for main.
	/// </summary>
	public class main : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.LinkButton lnknewbid;
		protected System.Web.UI.WebControls.LinkButton lnkmanage;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			Session["idp1"]=Request.QueryString["idplace"];
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
			this.lnknewbid.Click += new System.EventHandler(this.lnknewbid_Click);
			this.lnkmanage.Click += new System.EventHandler(this.lnkmanage_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void lnknewbid_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("goverment.aspx?idplace=" +Request.QueryString["idplace"]);

		}

		private void lnkmanage_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("determind.aspx");
		}


	}
}
