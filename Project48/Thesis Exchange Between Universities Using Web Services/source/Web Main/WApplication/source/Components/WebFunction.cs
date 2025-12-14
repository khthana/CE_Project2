using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace WApplication.Components
{
	public class WebFunction
	{
		public WebFunction()
		{
		}
		
		public string getKind(bool kind,bool kind2)
		{
			if(kind==true)
			{
				if(kind2==true)
					return "ta";	//title All
				else
					return "ts";	//title Some
			}
			else
			{
				if(kind2==true)
					return "ka";	//keyword All
				else	
					return "ks";	//keyword Some
			}
		}
		public void defaultDDL(DropDownList Dd)
		{
			Dd.Items.Clear();
			Dd.Items.Add("ไม่ระบุ");
			Dd.Items[0].Value = "none_set";
		}
		public void addDDL(DataSet DS,DropDownList Dd)
		{
			defaultDDL(Dd);
			DataTable TB= new DataTable();
			TB=DS.Tables[0];

			int num = TB.Rows.Count;
			for (int i=0;i<num;i++)
			{
				string temp = TB.Rows[i].ItemArray[0].ToString();
				if(temp != "")
					Dd.Items.Add(temp);
			}
		}
		public void CheckIn(DataSet ds,DropDownList dd)
		{
			string test =dd.SelectedValue;		
			addDDL(ds,dd);				
			DataTable TB= new DataTable();
			TB=ds.Tables[0];
			int check=0;
			int num = TB.Rows.Count;
			for (int i=0;i<num;i++)
			{
				if(test.Equals(TB.Rows[i].ItemArray[0].ToString()))
					check++;
				if(check==1)
				{
					dd.SelectedValue=test;
					i=num;
				}
			}
		}
	}
}
