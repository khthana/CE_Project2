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

namespace WebApplication1
{
	/// <summary>
	/// Summary description for WebForm1.
	/// </summary>
	public class CourseChooser: System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label1;
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.DataGrid DataGrid1;
		protected System.Data.DataTable dataTable1;
		private ArrayList mSchoolList = new ArrayList();

		int count;
	
//		string [][] mystring =new string[10][10];
	
		protected System.Data.DataSet dataSet1;
		protected System.Web.UI.WebControls.TextBox TextBox1;
		protected System.Web.UI.WebControls.TextBox TextBox2;
		protected System.Web.UI.WebControls.TextBox TextBox3;
		protected System.Web.UI.WebControls.DropDownList fComboSubject;
		protected System.Web.UI.WebControls.DropDownList fComboPeriod;
		protected System.Web.UI.WebControls.Button fButtonSelectCourse;
		protected System.Web.UI.WebControls.DropDownList fComboSchool;
		protected System.Web.UI.WebControls.Button fButtonSubmit;
		protected System.Web.UI.HtmlControls.HtmlForm Form1;
		protected System.Web.UI.WebControls.Label Label4;
		DataTable selectedCourseDataTable = new DataTable();
		private void Page_Load(object sender, System.EventArgs e)
		{
			if(!IsPostBack)
			{
				if((Session["selectedCourseDataTable"])!=null)
				{
					Session.Remove("selectedCourseDataTable");

				}
			}
			TextBox3.Visible=false;
			count = 1;
			if(Session["count"]!=null)
			count = (int)(Session["count"]);
		
			
			
			//selectedCourseDataTable.Columns.Add("testduyy4",typeof(string));
			//selectedCourseDataTable.PrimaryKey = new DataColumn[]{pkCol};
			dataSet1 = new DataSet("test");
			selectedCourseDataTable = dataSet1.Tables.Add("myTable");
			DataColumn pkCol = selectedCourseDataTable.Columns.Add("No.",typeof(string));
			selectedCourseDataTable.Columns.Add("วิชา",typeof(string));
			selectedCourseDataTable.Columns.Add("สถาบัน",typeof(string));
			selectedCourseDataTable.Columns.Add("เวลา",typeof(string));
			if(Session["selectedCourseDataTable"]!=null)
			{
					
					DataTable tempp =(DataTable)(Session["selectedCourseDataTable"]);
					selectedCourseDataTable = tempp.Copy();
					dataSet1 = (DataSet)(Session["ds"]);
					selectedCourseDataTable =(DataTable)(Session["selectedCourseDataTable"]) ;


			}
			DataGrid1.DataBind();
			

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
			this.dataSet1 = new System.Data.DataSet();
			this.dataTable1 = new System.Data.DataTable();
			((System.ComponentModel.ISupportInitialize)(this.dataSet1)).BeginInit();
			((System.ComponentModel.ISupportInitialize)(this.dataTable1)).BeginInit();
			this.fComboSubject.SelectedIndexChanged += new System.EventHandler(this.fComboSubject_SelectedIndexChanged);
			this.fButtonSelectCourse.Click += new System.EventHandler(this.fButtonSelectCourse_Click);
			this.DataGrid1.DeleteCommand += new System.Web.UI.WebControls.DataGridCommandEventHandler(this.DataGrid1_DeleteCommand);
			this.fButtonSubmit.Click += new System.EventHandler(this.fButtonSubmit_Click);
			// 
			// dataSet1
			// 
			this.dataSet1.DataSetName = "NewDataSet";
			this.dataSet1.Locale = new System.Globalization.CultureInfo("th-TH");
			this.dataSet1.Tables.AddRange(new System.Data.DataTable[] {
																		  this.dataTable1});
			// 
			// dataTable1
			// 
			this.dataTable1.TableName = "Table1";
			this.Load += new System.EventHandler(this.Page_Load);
			((System.ComponentModel.ISupportInitialize)(this.dataSet1)).EndInit();
			((System.ComponentModel.ISupportInitialize)(this.dataTable1)).EndInit();

		}
		#endregion

	
		private void fButtonSubmit_Click(object sender, System.EventArgs e)
		{
			if(selectedCourseDataTable.Rows.Count!=0)
			{
				Response.Redirect("SelectedCourse.aspx");
			}
			else
			{
				TextBox3.Visible=true;
				TextBox3.Text="please select at least a course";;
				
			}
		}

		private void fComboSubject_SelectedIndexChanged(object sender, System.EventArgs e)
		{
			
			if(fComboSubject.SelectedValue=="Choose Subject")
			{
				TextBox1.Text="hide";

				
				fButtonSelectCourse.Visible=false;
				
				fComboSchool.Visible=false;
				fComboPeriod.Visible=false;
				
			
			}
			else 
			{
				if(fComboSubject.Items.Count==4)
				fComboSubject.Items.RemoveAt(3);
				if(!IsPostBack)
				{
					
				}
				fButtonSelectCourse.Visible=true;
				Label2.Visible=true;
				Label3.Visible=true;
				if(fComboSubject.SelectedValue=="physic")
				{
				
					//fButtonSelectCourse.Visible=true;
					//Button3.Visible=true;
					TextBox1.Text="show";
					fComboSchool.Visible=true;
					fComboPeriod.Visible=true;
					fComboSchool.Items.Clear();
					fComboSchool.Items.Add(new ListItem("สถาบันกวดวิชานิโอ", "Neo"));
					fComboSchool.Items.Add(new ListItem("สถาบันกวดวิชา Applied Physic", "Apply"));
					
			
				}
				else if(fComboSubject.SelectedValue=="chem")
				{
					
					//fButtonSelectCourse.Visible=true;
					//Button3.Visible=true;
					TextBox1.Text="show";
					fComboSchool.Visible=true;
					fComboPeriod.Visible=true;
					fComboSchool.Items.Clear();
					fComboSchool.Items.Add(new ListItem("สถาบันกวดวิชาเคมีอาจารย์อุ๊", "Au"));
			
			
		
				}
				else if(fComboSubject.SelectedValue=="math")
				{
					
					//fButtonSelectCourse.Visible=true;
					//Button3.Visible=true;
					TextBox1.Text="show";
					fComboSchool.Visible=true;
					fComboPeriod.Visible=true;
					fComboSchool.Items.Clear();
					fComboSchool.Items.Add(new ListItem("สถาบันกวดวิชาJia", "Jia"));
				
			
				}
			}
		}

		private void Button3_Click(object sender, System.EventArgs e)
		{
			
				fComboSchool.Visible=false;
				fComboPeriod.Visible=false;
				fComboSubject.Enabled=true;
			
				fButtonSelectCourse.Visible=false;
				
		}

		private void fButtonSelectCourse_Click(object sender, System.EventArgs e)
		{
			string [] aaa = new string[4];
			aaa[0] = count.ToString();
			aaa[1] = fComboSubject.SelectedValue.ToString();
			aaa[2] = fComboSchool.SelectedValue.ToString();
			
			mSchoolList.Add(aaa[2]);
			Session.Add("school",mSchoolList);

			aaa[3] = fComboPeriod.SelectedValue.ToString();
			
			selectedCourseDataTable.Rows.Add(aaa);
			DataGrid1.DataBind();
			selectedCourseDataTable.AcceptChanges();
		
			TextBox1.Text=count.ToString();
			count++;
			Session.Add("selectedCourseDataTable",selectedCourseDataTable);
			Session.Add("ds",dataSet1);
			Session.Add("count",count);		
		}
	
		private void DataGrid1_DeleteCommand(object source, System.Web.UI.WebControls.DataGridCommandEventArgs e)
		{
			// Retrieve the name of the item to remove.
			int item = (e.Item.ItemIndex);
			//item;
			selectedCourseDataTable.Rows.RemoveAt(item);
			// Filter the CartView for the selected item and remove it from
			// the data source.
			//dataSet1.Tables.RemoveAt(Convert.ToInt32(item));
			/*if (CartView.Count > 0) 
			{
				CartView.Delete(0);
			}
			CartView.RowFilter = "";

			// Set the EditItemIndex property to -1 to exit editing mode. Be sure
			// to rebind the DataList to the data source to refresh the control.
			ItemsList.EditItemIndex = -1;
			BindList();*/
			DataGrid1.DataBind();
			selectedCourseDataTable.AcceptChanges();
		
		}




	
	}
}
