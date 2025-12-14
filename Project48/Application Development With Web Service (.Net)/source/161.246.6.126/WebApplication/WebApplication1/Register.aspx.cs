using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.OleDb;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Npgsql;

namespace Register
{
	/// <summary>
	/// Summary description for WebForm1.
	/// </summary>
	public class WebForm1 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.TextBox fTextmail;
		protected System.Web.UI.WebControls.DropDownList fDropAge;
		protected System.Web.UI.WebControls.DropDownList fDropSex;
		protected System.Web.UI.WebControls.TextBox fIntTelephone;
		protected System.Web.UI.WebControls.TextBox fTextPass;
		protected System.Web.UI.WebControls.TextBox fTextPass2;
		protected System.Web.UI.WebControls.TextBox fTextError;
		protected System.Web.UI.WebControls.TextBox fTextFirstName;
		protected System.Web.UI.WebControls.TextBox fTextLastName;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label6;
	
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
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.fTextFirstName.TextChanged += new System.EventHandler(this.TextBox1_TextChanged);
			this.fDropAge.SelectedIndexChanged += new System.EventHandler(this.DropDownList1_SelectedIndexChanged);
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void DropDownList1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
		
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			if(fTextFirstName.Text.Length>1)
			{
				if(fTextLastName.Text.Length>1)
				{
					if((fTextmail.Text.IndexOf("@")>-1)&&(fTextmail.Text.IndexOf(".")>-1)
						&&(fTextmail.Text.Length>5))		
					{
						if(fTextPass.Text.Length>4)			
						{
							if ( fTextPass.Text==fTextPass2.Text)			
							{
								if(fIntTelephone.Text.IndexOf("0")>-1)			
								{

									//	NpgsqlConnection conn = new NpgsqlConnection("Server=161.246.6.128;Port=5432;User Id=por;Password=por;Database=joeDB;");
									NpgsqlConnection con = new NpgsqlConnection("Server=161.246.6.120;Port=5432;User Id=postgres;Password=webservice;Database=OLALA_EDU;");
									//	con.ConnectionString = strCon;
									//	if(con.
									//con.c = 5;
									con.Open();
									//								try
									//								{
									//		DataSet ds = new DataSet();
									String sql = "INSERT INTO \"MEMBER\" Values('"+fTextmail.Text+"','"+fTextPass.Text+"','"+fTextFirstName.Text+"','"+fTextLastName.Text+"','"+fIntTelephone.Text+"')";
									NpgsqlCommand aaaaa = new NpgsqlCommand(sql,con);
									aaaaa.ExecuteNonQuery();
									//NpgsqlDataAdapter da = new NpgsqlDataAdapter("sql");
									//			da.Fill(ds,"test");
									//		con.Close();
									//								}
									//								catch(Exception ex)
									//								{
									//                                    Session.Add("except",ex.ToString);								
									//								}
									con.Close();
								
									Response.Redirect("Profile.aspx");	
								}
								else{fTextError.Visible = true;fTextError.Text="Input telephone Wrong";}
							}
							else{fTextError.Visible = true;fTextError.Text="Re Password not match with Password";}
						}
						else{fTextError.Visible = true;fTextError.Text="Length of Password > 4 ";	}
					}
					else{fTextError.Visible = true;fTextError.Text="Input E-mail Wrong";}					
				}
				else{fTextError.Visible = true;fTextError.Text="Input Last Name Wrong";	}
			}
			else{fTextError.Visible = true;fTextError.Text="Input First Name Wrong";	}

		}

		private void TextBox1_TextChanged(object sender, System.EventArgs e)
		{
		
		}
	}
}
