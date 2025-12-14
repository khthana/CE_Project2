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

namespace queryHealthy
{
	/// <summary>
	/// Summary description for WebForm2.
	/// </summary>
	public class WebForm2 : System.Web.UI.Page
	{
		protected System.Web.UI.WebControls.Label Label2;
		protected System.Web.UI.WebControls.Label Label4;
		protected System.Web.UI.WebControls.Label Label3;
		protected System.Web.UI.WebControls.Label Label5;
		protected System.Web.UI.WebControls.Label Label6;
		protected System.Web.UI.WebControls.Label Label7;
		protected System.Web.UI.WebControls.Label Label8;
		protected System.Web.UI.WebControls.Label Label9;
		protected System.Web.UI.WebControls.Label Label10;
		protected System.Web.UI.WebControls.Label Label11;
		protected System.Web.UI.WebControls.Label Label12;
		protected System.Web.UI.WebControls.Label Label13;
		protected System.Web.UI.WebControls.Label Label14;
		protected System.Web.UI.WebControls.Label Label15;
		protected System.Web.UI.WebControls.Label Label16;
		protected System.Web.UI.WebControls.Label Label17;
		protected System.Web.UI.WebControls.Label Label18;
		protected System.Web.UI.WebControls.Label Label19;
		protected System.Web.UI.WebControls.Label Label20;
		protected System.Web.UI.WebControls.Label Label21;
		protected System.Web.UI.WebControls.Label Label22;
		protected System.Web.UI.WebControls.Label Label23;
		protected System.Web.UI.WebControls.Label Label24;
		protected System.Web.UI.WebControls.Label Label25;
		protected System.Web.UI.WebControls.Label Label26;
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
		protected System.Web.UI.WebControls.Label Label38;
		protected System.Web.UI.WebControls.Label Label1;
	
		private void Page_Load(object sender, System.EventArgs e)
		{
			// Put user code to initialize the page here
			String temp = Request.Form["PIDText"]; //รับค่า PID มา
			DataSet dataset = new DataSet(); //สร้าง DataSet
			HospitalComponent.Hospital pomme=new HospitalComponent.Hospital();
			
			dataset = pomme.queryHealthy(temp); //เรียกใช้ Service
			String tempstatus = "";
			try
			{
				tempstatus = dataset.Tables[0].Rows[0]["HSTATUS"].ToString();
			}
			catch{
				Label1.Visible=false;
				Label2.Width=400;
				Label2.Text="ไม่พบ หมายเลขประจำตัวประชาชนดังกล่าว ในระบบ";
				//Label2.Text+=a.StackTrace;
			}
			//แสดงผลของผู้ไม่มีประกันสุขภาพใด ๆ เลย
			if (tempstatus.Equals("0"))
			{
				Label2.Text = "ไม่มีประกันสุขภาพ";
				Label3.Text = "รหัสประจำตัวประชาชน :";
				Label4.Text = dataset.Tables[0].Rows[0]["PID"].ToString();
				Label5.Text = "คำนำหน้าชื่อ :";
				Label6.Text = dataset.Tables[0].Rows[0]["TITLE"].ToString();
				Label7.Text = "ชื่อ :";
				Label8.Text = dataset.Tables[0].Rows[0]["FNAME"].ToString();
				Label9.Text = "นามสกุล :";
				Label10.Text = dataset.Tables[0].Rows[0]["LNAME"].ToString();

				Label11.Text = "เพศ :";
				String sex = dataset.Tables[0].Rows[0]["SEX"].ToString();
				if(sex == "0") Label12.Text = "ชาย";
				if(sex == "1") Label12.Text = "หญิง";

				Label13.Text = "วัน เดือน ปี เกิด :";
				String tempcut= dataset.Tables[0].Rows[0]["DOB"].ToString();
				String day = tempcut.Substring(0,2);
				String month = tempcut.Substring(3,2);
				String year = tempcut.Substring(6,2);

				if(month.Equals("01")){month="มกราคม";}
				else if(month.Equals("02")){month="กุมภาพันธ์";}
				else if(month.Equals("03")){month="มีนาคม";}
				else if(month.Equals("04")){month="เมษายน";}
				else if(month.Equals("05")){month="พฤษภาคม";}
				else if(month.Equals("06")){month="มิถุนายน";}
				else if(month.Equals("07")){month="กรกฎาคม";}
				else if(month.Equals("08")){month="สิงคมคม";}
				else if(month.Equals("09")){month="กันยายน";}
				else if(month.Equals("10")){month="ตุลาคม";}
				else if(month.Equals("11")){month="พฤศจิกายน";}
				else if(month.Equals("12")){month="ธันวาคม";}

				Label14.Text=day+"  "+month+"  20"+year;
//				Label15.Text = "POP ST :";
//				Label16.Text = dataset.Tables[0].Rows[0]["POP_ST"].ToString();
				Label15.Text = "ที่อยู่ :";
				Label16.Text = dataset.Tables[0].Rows[0]["HID"].ToString();
				Label17.Text = "บ้านเลขที่ :";
				Label18.Text = dataset.Tables[0].Rows[0]["HNO"].ToString();
				Label19.Text = "ตรอก :";
				Label20.Text = dataset.Tables[0].Rows[0]["TROK"].ToString();
				Label21.Text = "ซอย :";
				Label22.Text = dataset.Tables[0].Rows[0]["SOI"].ToString();
				Label23.Text = "ถนน :";
				Label24.Text = dataset.Tables[0].Rows[0]["THANON"].ToString();
				Label25.Text = "ที่อยู่ปัจจุบัน :";
				String keepshow=dataset.Tables[0].Rows[0]["CCAATTMM"].ToString();
				String cc=keepshow.Substring(0,2);
				String aa=keepshow.Substring(2,2);
				String tt=keepshow.Substring(4,2);
				String result="ตำบล "+pomme.queryTumbon(cc,aa,tt)+"  อำเภอ ";
				result+=pomme.queryAmpher(cc,aa)+"  จังหวัด ";
				result+=pomme.queryProvince(cc)+"  ";
				Label26.Text = result;
				Label27.Text = "ภูมิลำเนาเดิม :";
				String keepshow2=dataset.Tables[0].Rows[0]["CCAA_OLD"].ToString();
				String cc2=keepshow2.Substring(0,2);
				String aa2=keepshow2.Substring(2,2);
				String result2="อำเภอ ";
				result2+=pomme.queryAmpher(cc2,aa2)+"  จังหวัด ";
				result2+=pomme.queryProvince(cc2)+"  ";
				Label28.Text = result2;
			}

			//แสดงผลของผู้มีสิทธิ์ประกันสุขภาพถ้วนหน้า
			if (tempstatus.Equals("1"))
			{
				Label2.Text = "ประกันสุขภาพถ้วนหน้า";
				Label3.Text = "รหัสประจำตัวประชาชน :";
				Label4.Text = dataset.Tables[0].Rows[0]["PID"].ToString();
				Label5.Text = "หมายเลขบัตร :";
				Label6.Text = dataset.Tables[0].Rows[0]["CARDID"].ToString();
				Label7.Text = "คำนำหน้าชื่อ :";
				Label8.Text = dataset.Tables[0].Rows[0]["TITLE"].ToString();
				Label9.Text = "ชื่อ :";
				Label10.Text = dataset.Tables[0].Rows[0]["FNAME"].ToString();
				Label11.Text = "นามสกุล :";
				Label12.Text = dataset.Tables[0].Rows[0]["LNAME"].ToString();
				
				Label13.Text = "เพศ :";
				String sex = dataset.Tables[0].Rows[0]["SEX"].ToString();
					if(sex == "0") Label14.Text = "ชาย";
					if(sex == "1") Label14.Text = "หญิง";

				Label15.Text = "สถานะภาพบุคคล :";
				Label16.Text = dataset.Tables[0].Rows[0]["STATUS"].ToString();
				Label17.Text = "วัน เดือน ปี เกิด :";

				String tempcut= dataset.Tables[0].Rows[0]["BDATE"].ToString();
				String day = tempcut.Substring(0,2);
				String month = tempcut.Substring(3,2);
				String year = tempcut.Substring(6,4);

				if(month.Equals("01")){month="มกราคม";}
				else if(month.Equals("02")){month="กุมภาพันธ์";}
				else if(month.Equals("03")){month="มีนาคม";}
				else if(month.Equals("04")){month="เมษายน";}
				else if(month.Equals("05")){month="พฤษภาคม";}
				else if(month.Equals("06")){month="มิถุนายน";}
				else if(month.Equals("07")){month="กรกฎาคม";}
				else if(month.Equals("08")){month="สิงคมคม";}
				else if(month.Equals("09")){month="กันยายน";}
				else if(month.Equals("10")){month="ตุลาคม";}
				else if(month.Equals("11")){month="พฤศจิกายน";}
				else if(month.Equals("12")){month="ธันวาคม";}

				Label18.Text=day+"  "+month+"  "+year;


				Label19.Text = "รหัสจังหวัดที่ขึ้นทะเบียน :";
				Label20.Text = dataset.Tables[0].Rows[0]["PROCODE"].ToString();


				String codemain= dataset.Tables[0].Rows[0]["HOSPMAIN"].ToString();
				String codesub = dataset.Tables[0].Rows[0]["HOSPSUB"].ToString();
				Label21.Text = "โรงพยาบาลหลัก :";
				Label22.Text= pomme.getHospitalName(codemain);
				Label23.Text = "โรงพยาบาลรอง :";
				Label24.Text= pomme.getHospitalName(codesub);
//--------------------------------------------------------------------
				Label25.Text = "วันเริ่มสิทธิ :";
				String tempcut1= dataset.Tables[0].Rows[0]["IDATE"].ToString();
				String day1 = tempcut1.Substring(3,2);
				String month1 = tempcut1.Substring(0,2);
				String year1 = tempcut1.Substring(6,4);

				if(month1.Equals("01")){month1="มกราคม";}
				else if(month1.Equals("02")){month1="กุมภาพันธ์";}
				else if(month1.Equals("03")){month1="มีนาคม";}
				else if(month1.Equals("04")){month1="เมษายน";}
				else if(month1.Equals("05")){month1="พฤษภาคม";}
				else if(month1.Equals("06")){month1="มิถุนายน";}
				else if(month1.Equals("07")){month1="กรกฎาคม";}
				else if(month1.Equals("08")){month1="สิงคมคม";}
				else if(month1.Equals("09")){month1="กันยายน";}
				else if(month1.Equals("10")){month1="ตุลาคม";}
				else if(month1.Equals("11")){month1="พฤศจิกายน";}
				else if(month1.Equals("12")){month1="ธันวาคม";}

				Label26.Text = day1+"  "+month1+"  "+year1;
//--------------------------------------------------------------------
				Label27.Text = "วันสิ้นสุดสิทธิ :";
				String tempcut2= dataset.Tables[0].Rows[0]["EDATE"].ToString();
				String day2 = tempcut2.Substring(3,2);
				String month2 = tempcut2.Substring(0,2);
				String year2 = tempcut2.Substring(6,4);

				if(month2.Equals("01")){month2="มกราคม";}
				else if(month2.Equals("02")){month2="กุมภาพันธ์";}
				else if(month2.Equals("03")){month2="มีนาคม";}
				else if(month2.Equals("04")){month2="เมษายน";}
				else if(month2.Equals("05")){month2="พฤษภาคม";}
				else if(month2.Equals("06")){month2="มิถุนายน";}
				else if(month2.Equals("07")){month2="กรกฎาคม";}
				else if(month2.Equals("08")){month2="สิงคมคม";}
				else if(month2.Equals("09")){month2="กันยายน";}
				else if(month2.Equals("10")){month2="ตุลาคม";}
				else if(month2.Equals("11")){month2="พฤศจิกายน";}
				else if(month2.Equals("12")){month2="ธันวาคม";}

				Label28.Text = day2+"  "+month2+"  "+year2;
//--------------------------------------------------------------------
				Label29.Text = "ที่อยู่ :";
				Label30.Text = dataset.Tables[0].Rows[0]["ADDRESS"].ToString();
				Label31.Text = "หมู่ :";
				Label32.Text = dataset.Tables[0].Rows[0]["MOO"].ToString();
				Label33.Text = "ตำบล :";
				String tmpTambon=dataset.Tables[0].Rows[0]["TAMBON"].ToString();
				String tmpAmphur=dataset.Tables[0].Rows[0]["AMPHUR"].ToString();
				String tmpProvince=dataset.Tables[0].Rows[0]["PROVINCE"].ToString();
				Label34.Text = pomme.queryTumbon(tmpProvince,tmpAmphur,tmpTambon);
				Label35.Text = "อำเภอ :";
				Label36.Text = pomme.queryAmpher(tmpProvince,tmpAmphur);
				Label37.Text = "จังหวัด :";
				Label38.Text = pomme.queryProvince(tmpProvince);
			}	
				//แสดงผลของผู้มีสิทธิ์ประกันสังคม
			if (tempstatus.Equals("2"))
			{
				Label2.Text = "ประกันสังคม";
				Label3.Text = "รหัสประจำตัวประชาชน :";
				Label4.Text = dataset.Tables[0].Rows[0]["PID"].ToString();
				Label5.Text = "ชื่อ :";
				Label6.Text = dataset.Tables[0].Rows[0]["FNAME"].ToString();
				Label7.Text = "นามสกุล :";
				Label8.Text = dataset.Tables[0].Rows[0]["LNAME"].ToString();
				Label9.Text = "รหัสจังหวัด :";
				String tmpProvince=dataset.Tables[0].Rows[0]["CC"].ToString();
				Label10.Text = pomme.queryProvince(tmpProvince);
				Label11.Text = "รหัสสาขา :";
				Label12.Text = dataset.Tables[0].Rows[0]["BRANCH"].ToString();
				Label13.Text = "รหัสสถานพยาบาล :";
				Label14.Text = dataset.Tables[0].Rows[0]["HMAIN"].ToString();
				Label15.Text = "ชื่อสถานพยาบาล :";
				Label16.Text = dataset.Tables[0].Rows[0]["HNAME"].ToString();
				Label17.Text = "วันเริ่มมีสิทธิ/วันที่ออกบัตร :";
				Label18.Text = dataset.Tables[0].Rows[0]["STARTDATE"].ToString();
				Label19.Text = "วันสิ้นสุดสิทธิ/วันที่บัตรหมดอายุ :";
				Label20.Text = dataset.Tables[0].Rows[0]["EXPDATE"].ToString();
			}

			//แสดงผลของผู้มีสิทธิ์ข้าราชการ
			if (tempstatus.Equals("3"))
			{
				Label2.Text = "สิทธิข้าราชการ";
				Label3.Text = "รหัสประจำตัวประชาชน :";
				Label4.Text = dataset.Tables[0].Rows[0]["PID"].ToString();
				Label5.Text = "คำนำหน้าชื่อ :";
				Label6.Text = dataset.Tables[0].Rows[0]["TITLE"].ToString();
				Label7.Text = "ชื่อ :";
				Label8.Text = dataset.Tables[0].Rows[0]["FNAME"].ToString();
				Label9.Text = "นามสกุล :";
				Label10.Text = dataset.Tables[0].Rows[0]["LNAME"].ToString();
				
				Label11.Text = "เพศ :";
				String sex = dataset.Tables[0].Rows[0]["SEX"].ToString();
				if(sex == "0") Label12.Text = "ชาย";
				if(sex == "1") Label12.Text = "หญิง";

				Label13.Text = "วัน เดือน ปี เกิด :";
				String tempcut= dataset.Tables[0].Rows[0]["DOB"].ToString();
				String day = tempcut.Substring(0,2);
				String month = tempcut.Substring(3,2);
				String year = tempcut.Substring(6,2);

				if(month.Equals("01")){month="มกราคม";}
				else if(month.Equals("02")){month="กุมภาพันธ์";}
				else if(month.Equals("03")){month="มีนาคม";}
				else if(month.Equals("04")){month="เมษายน";}
				else if(month.Equals("05")){month="พฤษภาคม";}
				else if(month.Equals("06")){month="มิถุนายน";}
				else if(month.Equals("07")){month="กรกฎาคม";}
				else if(month.Equals("08")){month="สิงคมคม";}
				else if(month.Equals("09")){month="กันยายน";}
				else if(month.Equals("10")){month="ตุลาคม";}
				else if(month.Equals("11")){month="พฤศจิกายน";}
				else if(month.Equals("12")){month="ธันวาคม";}

				Label14.Text=day+"  "+month+"  20"+year;

				Label15.Text= "ที่อยู่ :";
				Label16.Text= dataset.Tables[0].Rows[0]["HID"].ToString();
				Label17.Text= "บ้านเลขที่ :";
				Label18.Text= dataset.Tables[0].Rows[0]["HNO"].ToString();
				Label19.Text= "ตรอก :";
				Label20.Text= dataset.Tables[0].Rows[0]["TROK"].ToString();
				Label21.Text= "ซอย :";
				Label22.Text= dataset.Tables[0].Rows[0]["SOI"].ToString();
				Label23.Text= "ถนน :";
				Label24.Text= dataset.Tables[0].Rows[0]["THANON"].ToString();
				Label25.Text= "ที่อยู่ปัจจุบัน :";
				String keepshow=dataset.Tables[0].Rows[0]["CCAATTMM"].ToString();
				String cc=keepshow.Substring(0,2);
				String aa=keepshow.Substring(2,2);
				String tt=keepshow.Substring(4,2);
				String result="ตำบล "+pomme.queryTumbon(cc,aa,tt)+"  อำเภอ ";
				result+=pomme.queryAmpher(cc,aa)+"  จังหวัด ";
				result+=pomme.queryProvince(cc)+"  ";
				Label26.Text = result;
				Label27.Text = "ภูมิลำเนาเดิม :";
				String keepshow2=dataset.Tables[0].Rows[0]["CCAA_OLD"].ToString();
				String cc2=keepshow2.Substring(0,2);
				String aa2=keepshow2.Substring(2,2);
				String result2="อำเภอ ";
				result2+=pomme.queryAmpher(cc2,aa2)+"  จังหวัด ";
				result2+=pomme.queryProvince(cc2)+"  ";
				Label28.Text = result2;
				Label29.Text = "รหัสประจำตัวประชาชนของบิดา :";
				Label30.Text = dataset.Tables[0].Rows[0]["FPID"].ToString();
				Label31.Text = "รหัสประจำตัวประชาชนของมารดา :";
				Label32.Text = dataset.Tables[0].Rows[0]["MPID"].ToString();
				Label33.Text = "รหัสประจำตัวประชาชนของข้าราชการ :";
				Label34.Text = dataset.Tables[0].Rows[0]["PID_SELECT"].ToString();

				String flag = dataset.Tables[0].Rows[0]["FLAG"].ToString();
				Label35.Text = "รหัสของลักษณะการใช้สิทธิ์ :";
				if (flag == "1") Label36.Text = "ใช้สิทธิ์ผ่านบิดา";
				if (flag == "2") Label36.Text = "ใช้สิทธิ์ผ่านมารดา";
				if (flag == "3") Label36.Text = "ใช้สิทธิ์ผ่านคู่สมรส";
				if (flag == "4") Label36.Text = "ใช้สิทธิ์ผ่านบุตร";
				if (flag == "0") Label36.Text = "ใช้สิทธิ์ผ่านตัวเอง";
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
			this.Load += new System.EventHandler(this.Page_Load);

		}
		#endregion
	}
}
