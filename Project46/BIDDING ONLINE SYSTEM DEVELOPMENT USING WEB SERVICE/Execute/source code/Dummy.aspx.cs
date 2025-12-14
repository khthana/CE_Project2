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
	/// Summary description for Dummy.
	/// </summary>
	public class Dummy : System.Web.UI.Page
	{
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			Session["idb1"]=Request.QueryString["idb"];
			//Session["idb2"]=Request.QueryString["idb2"];
//			if(Request.QueryString["form"]=="0")
//			{
//				Response.Redirect("winner.aspx");	
//			}
//			else	
//			{
//				//Response.Redirect("only.aspx");
//			}
			string x;

			x=Request.QueryString["form"];
			Session["fromz"]=x;
			//Response.Redirect("winner.aspx?fromz=" + Request.QueryString["form"]);
			Response.Redirect("winner.aspx");
			
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
