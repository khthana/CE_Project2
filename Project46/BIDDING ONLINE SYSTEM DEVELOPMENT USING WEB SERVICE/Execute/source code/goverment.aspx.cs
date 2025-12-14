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
using System.Security.Cryptography;
using System.Text;

namespace project
{
	/// <summary>
	/// Summary description for WebForm1.
	/// </summary>
	public class WebForm1 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label19;
		protected System.Web.UI.WebControls.Label Label22;
		protected System.Web.UI.WebControls.Label Label23;
		protected System.Web.UI.WebControls.Label Label25;
		protected System.Web.UI.WebControls.Label Label26;
		protected System.Web.UI.WebControls.Label Label24;
		protected System.Web.UI.WebControls.Label Label31;
		protected System.Web.UI.WebControls.Label Label35;
		protected System.Web.UI.WebControls.Label Label36;
		protected System.Web.UI.WebControls.Label Label37;
		protected System.Web.UI.WebControls.Label Label38;
		protected System.Web.UI.WebControls.Label Label39;
		protected System.Web.UI.WebControls.Label Label40;
		protected System.Web.UI.WebControls.Label Label42;
		protected System.Web.UI.WebControls.Label Label43;
		protected System.Web.UI.WebControls.Label Label44;
		protected System.Web.UI.WebControls.Label Label50;
		protected System.Web.UI.WebControls.Label Label51;
		protected System.Web.UI.WebControls.Label Label52;
		protected System.Web.UI.WebControls.Label Label53;
		protected System.Web.UI.WebControls.Label Label54;
		protected System.Web.UI.WebControls.Label Label55;
		protected System.Web.UI.WebControls.Label Label56;
		protected System.Web.UI.WebControls.Label Label58;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Button Button1;
		protected System.Web.UI.WebControls.Button Button2;
		protected System.Web.UI.WebControls.Label Label18;
		protected System.Web.UI.WebControls.LinkButton lnkmain;
		protected System.Web.UI.WebControls.Label Label60;
		protected System.Web.UI.WebControls.Label Label61;
		protected System.Web.UI.WebControls.TextBox txtnum;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.Label Label62;
		protected System.Web.UI.WebControls.Label Label63;
		protected System.Web.UI.WebControls.Label Label20;
		protected System.Web.UI.WebControls.Label Label21;
		protected System.Web.UI.WebControls.Label Label27;
		protected System.Web.UI.WebControls.Label Label28;
		protected System.Web.UI.WebControls.Label Label32;
		protected System.Web.UI.WebControls.Label Label30;
		protected System.Web.UI.WebControls.TextBox txtProduct;
		protected System.Web.UI.WebControls.TextBox txtBidID;
		protected System.Web.UI.WebControls.DropDownList ddlAtYear;
		protected System.Web.UI.WebControls.TextBox txtPresentPlace;
		protected System.Web.UI.WebControls.TextBox txtDeliver;
		protected System.Web.UI.WebControls.TextBox txtExample;
		protected System.Web.UI.WebControls.TextBox txtDeliverPlace;
		protected System.Web.UI.WebControls.TextBox txtCatalog;
		protected System.Web.UI.WebControls.TextBox txtRealCatalog;
		protected System.Web.UI.WebControls.DropDownList ddldertermind;
		protected System.Web.UI.WebControls.TextBox txtContact;
		protected System.Web.UI.WebControls.TextBox txtGuarantee;
		protected System.Web.UI.WebControls.TextBox txtCheck;
		protected System.Web.UI.WebControls.TextBox txtReturn;
		protected System.Web.UI.WebControls.TextBox txtFine;
		protected System.Web.UI.WebControls.TextBox txtGuaranteeMonth;
		protected System.Web.UI.WebControls.TextBox txtRepair;
		protected System.Web.UI.WebControls.TextBox txtMoneyBefore;
		protected System.Web.UI.WebControls.DropDownList ddlbudget;
		protected System.Web.UI.WebControls.DropDownList ddlAgree;
		protected System.Web.UI.WebControls.TextBox txtDeclareName;
		protected System.Web.UI.WebControls.TextBox txtDeclarePosition;
		protected System.Web.UI.WebControls.Calendar Calendar1;
		protected System.Web.UI.WebControls.Calendar Calendar2;
		protected System.Web.UI.WebControls.Calendar Calendar3;
		protected System.Web.UI.WebControls.Calendar Calendar4;
		protected System.Web.UI.WebControls.Calendar Calendar5;
		protected System.Web.UI.WebControls.Calendar Calendar6;
		protected System.Web.UI.WebControls.Calendar Calendar7;
		protected System.Web.UI.WebControls.Calendar Calendar8;
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator2;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator4;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator1;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator5;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator6;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator2;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator3;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator4;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator5;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator6;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator7;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator8;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator9;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator10;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator11;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator12;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator13;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator7;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator14;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator8;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator15;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator9;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator16;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator10;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator17;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator18;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator11;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator19;
		protected System.Web.UI.WebControls.RangeValidator RangeValidator12;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator3;
		protected System.Web.UI.WebControls.TextBox areaDetailPresent;
		protected System.Web.UI.WebControls.TextBox areaDetermind;
		protected System.Web.UI.WebControls.TextBox areaAuthority;
		protected System.Web.UI.WebControls.Calendar nonVisible;
		protected System.Web.UI.WebControls.RequiredFieldValidator RequiredFieldValidator20;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.Label Label8;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			

			if(!Page.IsPostBack)
			{
////				//txtCall.Text="สถาบัน";
////				txtProduct.Text="ครุภัณฑ์คอมพิงเตอร์"; 
//				
//				txtPresentPlace.Text="ตึก ECC";
//				
//				areaDetailPresent.InnerText="ต้องมีรูปแสดง"; 
//				areaAuthority.InnerText="ใบผู้ประกอบการ"; 
//				txtBidID.Text="ทม5";
//				txtnum.Text="2"; 
//				//ddlAtYear.SelectedItem="2546"; 
//				txtDeclareName.Text="อ.วัชระ"; 
//				txtDeclarePosition.Text="หัวหน้าภาค";
//
//				txtDeliver.Text="5"; 
//				txtRealCatalog.Text="3"; 
//				txtReturn.Text="4";  
//				txtFine.Text="5";  
//				areaDetermind.InnerText="ความคงทน"; 
//				txtGuaranteeMonth.Text="36"; 
//				txtRepair.Text="7"; 
//				txtMoneyBefore.Text="7"; 
//				txtContact.Text="7"; 
//				txtDeliverPlace.Text="ตึก ecc"; 
//				txtGuarantee.Text="5"; 
//				txtCheck.Text="คณะวิศวะ";  
//				txtExample.Text="6"; 
//				txtCatalog.Text="4";
//				TextBox1.Text="เครื่อง server";
//				// ddldertermind.SelectedItem 
//				// ddlbudget.SelectedItem 
//				// ddlAgree.SelectedItem 
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
		}
		
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{    
			this.Button1.Click += new System.EventHandler(this.Button1_Click);
			this.lnkmain.Click += new System.EventHandler(this.lnkmain_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion





		private void lnkmain_Click(object sender, System.EventArgs e)
		{
			Response.Redirect("index.aspx");
		}

		private void Button1_Click(object sender, System.EventArgs e)
		{
			TextBox2.Text="a";
			if((Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar8.SelectedDate))
				|| (Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar7.SelectedDate))
				|| (Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar6.SelectedDate))
				|| (Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar5.SelectedDate))
				|| (Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar4.SelectedDate))
				|| (Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar3.SelectedDate))
				|| (Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar2.SelectedDate))
				|| (Convert.ToString(nonVisible.SelectedDate)==Convert.ToString(Calendar1.SelectedDate)))
			{
				TextBox2.Text="";
			}
			else
			{
				string strconn="server=(local);database=project;uid=sa;password=;";
				SqlConnection sqlconn=new SqlConnection(strconn);

				sqlconn.Open();

			

				string strsql2="INSERT INTO DetailBidding "
					+ "(IDPlace,NameBidding,DayDeclare,BeginSubmit,"
					+ "EndSubmit,BeginAuthor,EndAuthor,DayPresent,"
					+ "PlacePresent,DeclareResult,DayDetermind,"
					+ "DetailPresent,WantAuthor,IDBuying,Num,"
					+ "AtYear,NameAcount,Possition,NameProduct,Cancle,Winner) "


					//						+ "VALUES (" + Request.QueryString["idplace"] + ",'"  
					//						+   txtProduct.Text + "'," 
					//						+ Calendar8.SelectedDate.ToShortDateString() + ","
					//						+	Calendar1.SelectedDate.ToShortDateString() + ",'" 
					//						+ Calendar2.SelectedDate.Date + "',"
					//						+	Calendar3.SelectedDate.ToShortDateString() + "," 
					//						+ Calendar4.SelectedDate.ToShortDateString() + ","
					//						+	Calendar5.SelectedDate.ToShortDateString() + ",'"
					//						+ txtPresentPlace.Text + "',"
					//						+	Calendar7.SelectedDate.ToShortDateString() + "," 
					//						+ Calendar6.SelectedDate.ToShortDateString() +",'"
					//						+	areaDetailPresent.InnerText + "','"
					//						+ areaAuthority.InnerText + "','"
					//						+	txtBidID.Text + "','" 
					//						+ txtnum.Text + "','"
					//						+	ddlAtYear.SelectedItem + "','"
					//						+ txtDeclareName.Text + "','"
					//						+	txtDeclarePosition.Text +"','"
					//						+  TextBox1.Text + "')";


					//must click all date
					+ "VALUES (" + Request.QueryString["idplace"] + ",'"  
					+   txtProduct.Text + "','" 
					+ Calendar8.SelectedDate.Date + "','"
					+	Calendar1.SelectedDate.Date + "','" 
					+ Calendar2.SelectedDate.Date + "','"
					+	Calendar3.SelectedDate.Date + "','" 
					+ Calendar4.SelectedDate.Date + "','"
					+	Calendar5.SelectedDate.Date + "','"
					+ txtPresentPlace.Text + "','"
					+	Calendar7.SelectedDate.Date + "','" 
					+ Calendar6.SelectedDate.Date +"','"
					+	areaDetailPresent.Text + "','"
					+ areaAuthority.Text + "','"
					+	txtBidID.Text + "','" 
					+ txtnum.Text + "','"
					+	ddlAtYear.SelectedItem + "','"
					+ txtDeclareName.Text + "','"
					+	txtDeclarePosition.Text +"','"
					+  TextBox1.Text + "','"
					+ 0 + "','"
					+ 0 +
"')";

			

				SqlCommand sqlcomm2 = new SqlCommand(strsql2,sqlconn);
				sqlcomm2.ExecuteNonQuery();
			
			
				string strsql2_0 = "SELECT max(IDBidding) FROM DetailBidding ";
				SqlCommand sqlcomm2_0 = new SqlCommand(strsql2_0,sqlconn);
				string maxid = sqlcomm2_0.ExecuteScalar().ToString();

			
				string strsql2_1="SELECT IDBidding,IDPlace FROM DetailBidding "
					+" WHERE IDBidding=" + maxid;
				SqlCommand sqlcomm2_1 = new SqlCommand(strsql2_1,sqlconn);
				SqlDataReader dr2 =sqlcomm2_1.ExecuteReader();
				int idbid;
				int idp;
				dr2.Read();
				idbid=dr2.GetInt32(0);
				idp=dr2.GetInt32(1);
				dr2.Close();


				Session["bidding"]=maxid;


				string strsql3="INSERT INTO SpectBidding "	
					+ "(IDBidding,IDPlace,DaySentProduct,DaySentCatalog,"
					+ "DayReturnGuaruntee,Fine,GradeDetermind,"
					+ "GuaranteeRepair,ReturnRepaired,MoneyBefore,"
					+ "MakeContactIn,PlaceGiveProduct,GuaranteeContact,"
					+ "GuaranteeCheck,ExampleProduct,NumCatalog,"
					+ "DetermindWith,BudgetFrom,ContactIfAgreeFrom)"
					+ "VALUES ('"+ idbid + "','"
					+ idp +"','"
					+ txtDeliver.Text + "','" 
					+ txtRealCatalog.Text + "','" 
					+ txtReturn.Text + "','" 
					+ txtFine.Text + "','" 
					+ areaDetermind.Text +"','"
					+ txtGuaranteeMonth.Text + "','" 
					+ txtRepair.Text + "','"
					+ txtMoneyBefore.Text + "','"
					+ txtContact.Text + "','" 
					+ txtDeliverPlace.Text +"','"
					+ txtGuarantee.Text +"','"
					+ txtCheck.Text + "','" 
					+ txtExample.Text + "','" 
					+ txtCatalog.Text + "','" 
					+ ddldertermind.SelectedItem +"','" 
					+ ddlbudget.SelectedItem + "','" 
					+ ddlAgree.SelectedItem + 
					
					"')";
				SqlCommand sqlcomm3 = new SqlCommand(strsql3,sqlconn);
				sqlcomm3.ExecuteNonQuery();
				sqlconn.Close();



				Response.Redirect("detail.aspx");


			}
			
		}




	}
}
