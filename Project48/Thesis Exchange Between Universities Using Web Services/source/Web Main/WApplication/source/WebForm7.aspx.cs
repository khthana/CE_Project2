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
using System.Web.Mail;


namespace WApplication
{
	/// <summary>
	/// Summary description for WebForm7.
	/// </summary>
	public class WebForm7 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.DataList DataList_News;
		protected System.Web.UI.WebControls.Button send;
		protected System.Web.UI.WebControls.TextBox subject;
		protected System.Web.UI.WebControls.TextBox body;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label4;
		
		protected System.Web.UI.WebControls.DropDownList DropGroup1;
		protected System.Web.UI.WebControls.DropDownList DropGroup2;
		DataSet Group1 = new DataSet();
		DataSet Group2 = new DataSet();
		DataSet Group3 = new DataSet();


	//	WApplication.localhost1.Service1 KMITL1 = new WApplication.localhost1.Service1();
	//	WApplication.localhost2.Service1 KMITL2 = new WApplication.localhost2.Service1();
	//	WApplication.localhost3.Service1 KMITL3 = new WApplication.localhost3.Service1();
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.TextBox name;
		protected System.Web.UI.WebControls.Label Label7;

		//==============================================================================
		WApplication.WReference1.Service1 KMITL1 = new WApplication.WReference1.Service1();
		WApplication.WReference2.Service1 KMITL2 = new WApplication.WReference2.Service1();
		WApplication.WReference3.Service1 KMITL3 = new WApplication.WReference3.Service1();
		WApplication.Components.WebDB webDB = new WApplication.Components.WebDB();
		bool dd = false;
		private void Page_Load(object sender, System.EventArgs e)
		{
			//ส่วนที่เเสดงข่าวสารต่าง
			//=============================================================
			
			DataSet newsDS = webDB.GetNews();
			DataList_News.DataSource=newsDS;
			DataList_News.DataBind();
			//==============================================================
		
			Group1 = KMITL1.Group();
			Group2 = KMITL2.Group();
			Group3 = KMITL3.Group();

			for (int i=0;i<Group1.Tables[0].Rows.Count;i++)
			{
				gdr(Group1.Tables[0].Rows[i].ItemArray[0].ToString());
			}

			for (int i=0;i<Group2.Tables[0].Rows.Count;i++)
			{
				gdr(Group2.Tables[0].Rows[i].ItemArray[0].ToString());
			}
			for (int i=0;i<Group3.Tables[0].Rows.Count;i++)
			{
				gdr(Group3.Tables[0].Rows[i].ItemArray[0].ToString());
			}
			//	DropGroup1.se= 0;

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
			this.DropGroup1.SelectedIndexChanged += new System.EventHandler(this.DropGroup1_SelectedIndexChanged);
			this.DropGroup2.SelectedIndexChanged += new System.EventHandler(this.DropGroup2_SelectedIndexChanged);
			this.send.Click += new System.EventHandler(this.send_Click);
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion

		private void send_Click(object sender, System.EventArgs e)
		{
			if (subject.Text != "" && body.Text != "" )
			{

				if (DropGroup1.SelectedValue != "none_set" && DropGroup2.SelectedValue != "none_set")
				{

					DataSet Mail1 = new DataSet();
					DataSet Mail2 = new DataSet();
					DataSet Mail3 = new DataSet();

					Mail1 = KMITL1.Mail(DropGroup2.SelectedValue);
					Mail2 = KMITL2.Mail(DropGroup2.SelectedValue);
					Mail3 = KMITL3.Mail(DropGroup2.SelectedValue);

					string mail="",mail2="";

					try
					{
						if(Mail1.Tables[0].Rows.Count != 0)
						{
							for (int i = 0; i<Mail1.Tables[0].Rows.Count;i++)
							{
								mail +=Mail1.Tables[0].Rows[i].ItemArray[2].ToString() ;
								mail2 = mail;
								mail += ";";
							}
						}
					}
					catch(IndexOutOfRangeException)
					{
					}
				//	mail = mail2;
					try 
					{
						if(Mail2.Tables[0].Rows.Count != 0)
						{
							for (int i = 0; i<Mail2.Tables[0].Rows.Count;i++)
							{
								mail +=Mail2.Tables[0].Rows[i].ItemArray[2].ToString() ;
								mail2 = mail;
								mail += ";";
							}
						}
					}
					catch(IndexOutOfRangeException)
					{
					}
				//			mail = mail2 ;
					try
					{
						if(Mail3.Tables[0].Rows.Count != 0)
						{
							for (int i = 0; i<Mail3.Tables[0].Rows.Count;i++)
							{
								mail +=Mail3.Tables[0].Rows[i].ItemArray[2].ToString() ;
								mail2 = mail;
								mail += ";";
							}
						}
					}
					catch (IndexOutOfRangeException)
					{
					}
					mail = mail2 ;
					webDB.UpdateQuset(subject.Text,body.Text,name.Text);
					body.Text += "โปรดกด link เพื่อตอบคำถาม";
					body.Text += "http://network21.ce.kmitl.ac.th/WApplication/WebAns.aspx?QID="+ webDB.SelectQid();


			/*		MailMessage MyMessage = new MailMessage();
					MyMessage.Subject = subject.Text;
					MyMessage.Body = body.Text;
					//	MyMessage.Cc = mail;
					MyMessage.To = mail ;  //mail
					MyMessage.From = "pop_na@hotmail.com";
					MyMessage.Priority = MailPriority.High;
					SmtpMail.Send(MyMessage);*/
					MailMessage myMail = new MailMessage();
					myMail.From = "pop_na@hotmail.com";
					myMail.To = mail.ToString();
					myMail.Subject = subject.Text;
					myMail.Priority = MailPriority.High;
					myMail.BodyFormat = MailFormat.Text;
					myMail.Body = body.Text;
									//	MailAttachment myAttachment = new MailAttachment("c:\attach\attach1.txt", MailEncoding.Base64);
									////	myMail.Attachments.Add(myAttachment);
					SmtpMail.SmtpServer = "localhost";
					SmtpMail.Send(myMail);
									
				}
				else 
				{
					webDB.UpdateQuset(subject.Text,body.Text,name.Text);
				}
			}
			else

			{
				Label7.Visible = true;
			}

			Response.Redirect("WebQuset.aspx" );
		}
		
		public void gdr(string group)
		{
			int j;
			if (DropGroup1.Items.Count != 0)
			{
				for (  j =0 ;j < DropGroup1.Items.Count ; j++)
				{	
					if (DropGroup1.Items[j].ToString()== group.ToString().Trim())
					{	
						dd = true;
					}
				}
			}
			
			if (dd == false)
			{
				DropGroup1.Items.Add(group.ToString());
				DropGroup1.Items[DropGroup1.Items.Count-1].Value = group.ToString();
			}
			dd = false;
		}

		private void DropGroup1_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			DropGroup2.Items.Clear();	

			DataSet fe1 = new DataSet();
			DataSet fe2 = new DataSet();
			DataSet fe3 = new DataSet();

			fe1  = KMITL1.GroupDB(DropGroup1.SelectedValue.ToString().Trim());
			fe2  = KMITL2.GroupDB(DropGroup1.SelectedValue.ToString().Trim());
			fe3  = KMITL3.GroupDB(DropGroup1.SelectedValue.ToString().Trim());

			for (int i=0;i<fe1.Tables[0].Rows.Count;i++)
			{
				if (fe1.Tables[0].Rows[i].ItemArray[0].ToString().Trim() != "")
					gdr2(fe1.Tables[0].Rows[i].ItemArray[0].ToString());
			}

			for (int i=0;i<fe2.Tables[0].Rows.Count;i++)
			{
				if (fe2.Tables[0].Rows[i].ItemArray[0].ToString().Trim() != "")
					gdr2(fe2.Tables[0].Rows[i].ItemArray[0].ToString());
			}
			for (int i=0;i<fe3.Tables[0].Rows.Count;i++)
			{
				if (fe3.Tables[0].Rows[i].ItemArray[0].ToString().Trim() != "")
					gdr2(fe3.Tables[0].Rows[i].ItemArray[0].ToString());
			}
		}

		public void gdr2(string group)
		{
			int j;
			if (DropGroup2.Items.Count != 0)
			{
				for (  j =0 ;j < DropGroup2.Items.Count ; j++)
				{	
					if (DropGroup2.Items[j].ToString().ToLower() == group.ToString().Trim().ToLower())
					{	
						dd = true;
					}
				}
			}
			else
			{
				DropGroup2.Items.Add("ไม่ระบุ");
				DropGroup2.Items[0].Value = "nono_set";
			}

			if (dd == false)
			{
				DropGroup2.Items.Add(group.ToString());
				DropGroup2.Items[DropGroup2.Items.Count-1].Value = group.ToString();
			}
			dd = false;
		}

		private void DropGroup2_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			DropGroup2.SelectedItem.Selected  = true;

		}
	}
}
