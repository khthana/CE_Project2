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
using System.Data.SqlClient;
using System.Text;

namespace project
{
	/// <summary>
	/// Summary description for _3.
	/// </summary>
	public class _3 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.Label Label24;
		protected System.Web.UI.WebControls.Label Label25;
		protected System.Web.UI.WebControls.Label Label27;
		protected System.Web.UI.WebControls.Label Label28;
		protected System.Web.UI.WebControls.Label Label29;
		protected System.Web.UI.WebControls.Label Label30;
		protected System.Web.UI.WebControls.Label Label31;
		protected System.Web.UI.WebControls.Label Label32;
		protected System.Web.UI.WebControls.Label Label33;
		protected System.Web.UI.WebControls.Label Label34;
		protected System.Web.UI.WebControls.Label Label35;
		protected System.Web.UI.WebControls.Label Label36;
		protected System.Web.UI.WebControls.Label Label37;
		protected System.Web.UI.WebControls.Label Label43;
		protected System.Web.UI.WebControls.Label Label44;
		protected System.Web.UI.WebControls.Label Label45;
		protected System.Web.UI.WebControls.Label Label47;
		protected System.Web.UI.WebControls.Label Label49;
		protected System.Web.UI.WebControls.Label Label50;
		protected System.Web.UI.WebControls.Label Label51;
		protected System.Web.UI.WebControls.Label Label53;
		protected System.Web.UI.WebControls.Label Label54;
		protected System.Web.UI.WebControls.Label Label56;
		protected System.Web.UI.WebControls.Label Label57;
		protected System.Web.UI.WebControls.Label Label58;
		protected System.Web.UI.WebControls.Label Label59;
		protected System.Web.UI.WebControls.Label Label60;
		protected System.Web.UI.WebControls.Label Label61;
		protected System.Web.UI.WebControls.Label Label62;
		protected System.Web.UI.WebControls.Label Label63;
		protected System.Web.UI.WebControls.Label Label64;
		protected System.Web.UI.WebControls.LinkButton lnkhome;
		protected System.Web.UI.WebControls.Label Label66;
		protected System.Web.UI.WebControls.Label Label38;
		protected System.Web.UI.WebControls.Label Label17;
		protected System.Web.UI.WebControls.Label Label18;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.LinkButton LinkButton1;
		protected System.Web.UI.WebControls.RadioButtonList rad;
		protected System.Web.UI.WebControls.LinkButton LinkButton2;
		protected System.Web.UI.WebControls.Label Label4;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);
			string strsql="SELECT *"
				+"FROM DetailOffice "
				+"WHERE IDPlace=" + Session["idp1"];

			string strsql2="SELECT *"
				+"FROM DetailBidding "
				+"WHERE IDBidding=" + Session["idb1"];

			string strsql3="SELECT *"
				+"FROM SpectBidding "
				+"WHERE IDBidding=" + Session["idb1"];

			string strsql4="SELECT *"
				+"FROM Product "
				+"WHERE IDBidding=" + Session["idb1"];


			
			//render to paper
			sqlconn.Open();
			SqlCommand sqlcomm = new SqlCommand(strsql,sqlconn);
			SqlDataReader dr=sqlcomm.ExecuteReader();
			dr.Read();
			Label3.Text=dr.GetString(1);
			
			Label5.Text=dr.GetString(1);
			Label6.Text=dr.GetString(2);
			Label12.Text=dr.GetString(2);
			Label15.Text=dr.GetString(2);
			Label16.Text=dr.GetString(2);
			Label17.Text=dr.GetString(2);
			Label18.Text=dr.GetString(2);
			Label27.Text=dr.GetString(2);
			Label29.Text=dr.GetString(2);
			Label30.Text=dr.GetString(2);
			Label31.Text=dr.GetString(2);
			Label32.Text=dr.GetString(2);
			Label33.Text=dr.GetString(2);
			Label34.Text=dr.GetString(2);
			Label35.Text=dr.GetString(2);
			Label36.Text=dr.GetString(2);
			Label37.Text=dr.GetString(2);
			Label38.Text=dr.GetString(2);
			Label17.Text=dr.GetString(2);
			Label53.Text=dr.GetString(2);
			Label56.Text=dr.GetString(2);
			Label57.Text=dr.GetString(2);
			Label58.Text=dr.GetString(2);
			Label59.Text=dr.GetString(2);		
			Label60.Text=dr.GetString(1);		
			Label24.Text=dr.GetString(2);
			dr.Close();
			sqlconn.Close();

			sqlconn.Open();
			SqlCommand sqlcomm2 = new SqlCommand(strsql2,sqlconn);
			SqlDataReader dr2=sqlcomm2.ExecuteReader();
			dr2.Read();
			Label1.Text=dr2.GetString(14);
			Label2.Text=dr2.GetString(2);
			Label7.Text=dr2.GetString(2);
			Label4.Text=dr2.GetDateTime(3).ToShortDateString();
			Label25.Text=dr2.GetDateTime(11).ToShortDateString();
			Label62.Text=dr2.GetDateTime(3).ToShortDateString();
			Label63.Text=dr2.GetString(17);
			Label64.Text=dr2.GetString(18);
			Label9.Text=dr2.GetInt32(15).ToString();
			Label8.Text=dr2.GetString(19);
			Label11.Text=dr2.GetString(19);


			dr2.Close();
			sqlconn.Close();
			
			sqlconn.Open();
			SqlCommand sqlcomm3 = new SqlCommand(strsql3,sqlconn);
			SqlDataReader dr3=sqlcomm3.ExecuteReader();
			dr3.Read();
			Label66.Text=dr3.GetString(11);
			Label10.Text=dr3.GetInt32(2).ToString();
			Label13.Text=dr3.GetInt32(3).ToString();
			Label14.Text=dr3.GetInt32(14).ToString();
			Label28.Text=dr3.GetString(16);
			Label43.Text=dr3.GetDouble(12).ToString();
			Label44.Text=dr3.GetString(13);
			Label45.Text=dr3.GetInt32(4).ToString();
			Label18.Text=dr3.GetDouble(5).ToString();
			Label47.Text=dr3.GetInt32(7).ToString();
			Label49.Text=dr3.GetInt32(8).ToString();
			Label50.Text=dr3.GetDouble(9).ToString();
			Label51.Text=dr3.GetString(17);
			Label54.Text=dr3.GetString(18);
			dr3.Close();
			sqlconn.Close();


//			sqlconn.Open();
//			SqlCommand sqlcomm4 = new SqlCommand(strsql4,sqlconn);
//			SqlDataReader dr4=sqlcomm4.ExecuteReader();
//			dr4.Read();
//			Label8.Text=dr4.GetString(1);
//			Label11.Text=dr4.GetString(1);
//			
//			
//			dr4.Close();
//			sqlconn.Close();
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
			this.lnkhome.Click += new System.EventHandler(this.lnkhome_Click);
			this.LinkButton1.Click += new System.EventHandler(this.LinkButton1_Click);
		//	this.LinkButton2.Click += new System.EventHandler(this.LinkButton2_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion



		private void lnkhome_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("1.aspx");
		}



		private void LinkButton1_Click(object sender, System.EventArgs e)
		{
			
			
			
			
			string strconn="server=(local);database=project;uid=sa;password=;";
			SqlConnection sqlconn=new SqlConnection(strconn);

			string strEndSubmit="SELECT EndSubmit FROM DetailBidding "
								+"WHERE IDBidding=" +Session["idb1"] ;

			string strcheck="SELECT IDBidding,IDCompany FROM SpectCompany "
							+"WHERE IDBidding=" +Session["idb1"];

			sqlconn.Open();
			SqlCommand commEnd=new SqlCommand(strEndSubmit,sqlconn);
			if((Convert.ToDateTime(System.DateTime.Today.ToShortDateString()))>(Convert.ToDateTime(commEnd.ExecuteScalar())))
			{
				
				StringBuilder msg2 = new StringBuilder();
				msg2.Append("<script>\r\n");
				msg2.Append("alert(\"การประกวดนี้หมดเวลารับการประกวดแล้ว !\");\r\n");
				msg2.Append("window.location.href='result.aspx';\r\n");
				msg2.Append("</script>\r\n");
				this.RegisterClientScriptBlock("clientScript",msg2.ToString());
			}
			else 
			{
				sqlconn.Close();
				sqlconn.Open();
				SqlCommand comm = new SqlCommand(strcheck,sqlconn);
				SqlDataReader dr=comm.ExecuteReader();
				
			
				bool again=false;
				if (rad.SelectedIndex==1)
				{
					if(Session["complete"]=="1")
					{
						while(dr.Read())
						{
							
							if(Convert.ToInt32(Session["iduser"])==Convert.ToInt32(dr["IDCompany"]))
							{

								again=true;
							}

						}
						if(again)
						{
							StringBuilder msg1 = new StringBuilder();
							msg1.Append("<script>\r\n");
							msg1.Append("alert(\"ท่านได้ยื่นการประกวดไปแล้ว ไม่สามารถยื่นได้อีก !\");\r\n");
							msg1.Append("window.location.href='index.aspx';\r\n");
							msg1.Append("</script>\r\n");
							this.RegisterClientScriptBlock("clientScript",msg1.ToString());
						}
						else
							Response.Redirect("4.aspx");
					}
					else
					{
						StringBuilder msg = new StringBuilder();
						msg.Append("<script>\r\n");
						msg.Append("alert(\"ท่านยังไม่ได้ login กรุณา login ก่อน !\");\r\n");
						msg.Append("window.location.href='index.aspx';\r\n");
						msg.Append("</script>\r\n");
						this.RegisterClientScriptBlock("clientScript",msg.ToString());
					}

				
				}
				else
				{
				
					Response.Redirect("index.aspx");
				}
			}

		}

		private void LinkButton2_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("2.aspx");
		}


	}
}
