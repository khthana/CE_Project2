using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Data.Odbc;
using System.Diagnostics;
using System.Web;
using System.Web.Services;
using System.Xml.Serialization;

namespace MHWS
{
	/// <summary>
	/// Summary description for Service1.
	/// </summary>
	public class Service1 : System.Web.Services.WebService
	{
		//public int n;
		public Service1()
		{
			//CODEGEN: This call is required by the ASP.NET Web Services Designer
			InitializeComponent();
		}

		#region Component Designer generated code
		
		//Required by the Web Services Designer 
		private IContainer components = null;
				
		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
		}

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		protected override void Dispose( bool disposing )
		{
			if(disposing && components != null)
			{
				components.Dispose();
			}
			base.Dispose(disposing);		
		}
		
		#endregion

		// WEB SERVICE EXAMPLE
		// The HelloWorld() example service returns the string Hello World
		// To build, uncomment the following lines then save and build the project
		// To test this web service, press F5

//		[WebMethod]
//		public string HelloWorld()
//		{
//			return "Hello World";
//		}

		#region CheckUser
		[WebMethod]   // ตรวจสอบการ Login
		public bool CheckUser(string usr, string pwd)
		{
			bool check = false;

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");
			con.Open();  

			string sql = "SELECT * FROM tbldoctor WHERE "+"Username = '"+usr+"' AND Password = '"+pwd+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			if(dr.Read())
			{
				check = true;
				return check;
			}
			con.Close();
			return check;
		}
		#endregion

		#region CheckPatient
		[WebMethod]   // ตรวจสอบการ Login
		public bool CheckPatient(string PID)
		{
			bool check = false;

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");
			con.Open();  

			string sql = "SELECT * FROM tblpatientbasicdata  WHERE "+"PatientID = '"+PID+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			if(dr.Read())
			{
				check = true;
				return check;
			}
			con.Close();
			return check;
		}
		#endregion

		#region CheckRoomNo
		[WebMethod]   
		public bool CheckRoomNo(string RN)
		{
			bool check = false;

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");
			con.Open();  

			string sql = "SELECT * FROM tbltreathistory  WHERE "+"RoomNo = '"+RN+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			if(dr.Read())
			{
				check = true;
				return check;
			}
			con.Close();
			return check;
		}
		#endregion



		#region GetPatient
		[WebMethod]   // ประวัติส่วนตัวผู้ป่วย
		[XmlInclude(typeof(tblpatientbasicdata))]
		public tblpatientbasicdata GetPatient(string PID)
		{
			ArrayList arr = new ArrayList();
			tblpatientbasicdata  row = new tblpatientbasicdata();

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  

			string sql = "SELECT * FROM tblpatientbasicdata  WHERE "+"PatientID = '"+PID+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			while(dr.Read())
			{	
				row.PatientID			= (string)dr["PatientID"];
				row.IDCard				= (string)dr["IDCard"];
				row.Sex 				= (string)dr["Sex"];	
				row.Name				= (string)dr["Name"];
				row.BirthDay		    = (string)dr["BirthDay"];
				row.BloodGroup		    = (string)dr["BloodGroup"];
				row.Height				= (string)dr["Height"];
				row.Weight				= (string)dr["Weight"];
				row.MarritalStatus      = (string)dr["MarritalStatus"];
				row.Occupation			= (string)dr["Occupation"];
				row.Registered_Address  = (string)dr["Registered_Address"];
		        row.Present_Address 	= (string)dr["Present_Address"];	
				row.Phone			    = (string)dr["Phone"];	
				row.Mobile_Phone		= (string)dr["Mobile_Phone"];				
				row.ContactID			= (string)dr["ContactID"];
				row.AllertcollectID	    = (string)dr["AllertcollectID"];
				row.HeredityID  	    = (string)dr["HeredityID"];
				row.DoctorID    	    = (string)dr["DoctorID"];
				
				arr.Add(row);
			}
			con.Close();
			return row;
		}
		#endregion

		#region GetRoomTypeName
		[WebMethod]  
		[XmlInclude(typeof(tblroom))]
		public tblroom GetRoomTypeName(string RN)
		{
			ArrayList arr = new ArrayList();
			tblroom row	= new tblroom();

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  

			string sql = "SELECT RoomTypeName FROM tblroom  INNER JOIN tbltreathistory ON tblroom.RoomTypeID=tbltreathistory.RoomTypeID  AND "+"RoomNo = '"+RN+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			while(dr.Read())
			{
				row.RoomTypeName		= (string)dr["RoomTypeName"];
			    arr.Add(row);
			}
			con.Close();			
			return row;
		}
		#endregion 

		#region GetDisease
		[WebMethod]  
		[XmlInclude(typeof(tbldisease))]
		public tbldisease GetDisease(string RN)
		{
			ArrayList arr = new ArrayList();
			tbldisease row	= new tbldisease();

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  

			string sql = "SELECT DiseaseName FROM tbldisease  INNER JOIN tbltreathistory ON tbldisease.DiseaseID =tbltreathistory.DiseaseID   AND "+"RoomNo = '"+RN+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			while(dr.Read())
			{			
				row.DiseaseName = (string) dr ["DiseaseName"];
				arr.Add(row);
			}
			con.Close();			
			return row;
		}
		#endregion  

		#region GetAllertCollect
		[WebMethod]  
		[XmlInclude(typeof(tblallertcollect))]
		public tblallertcollect GetAllertCollect(string PID)
		{
			ArrayList arr = new ArrayList();
			tblallertcollect row	= new tblallertcollect();

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  

			string sql = "SELECT AllertcollectName FROM tblallertcollect  INNER JOIN tblpatientbasicdata ON tblallertcollect.AllertcollectID =tblpatientbasicdata.AllertcollectID   AND "+"PatientID = '"+PID+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			while(dr.Read())
			{				
				row.AllertcollectName = (string) dr ["AllertcollectName"];
				arr.Add(row);
			}
			con.Close();			
			return row;
		}
		#endregion  

		#region GetHeredity
		[WebMethod]  
		[XmlInclude(typeof(tblheredity))]
		public tblheredity GetHeredity(string PID)
		{
			ArrayList arr = new ArrayList();
			tblheredity row	= new tblheredity();

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  

			string sql = "SELECT HeredityName FROM tblheredity  INNER JOIN tblpatientbasicdata ON tblheredity.HeredityID =tblpatientbasicdata.HeredityID   AND "+"PatientID = '"+PID+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			while(dr.Read())
			{				
				row.HeredityName = (string) dr ["HeredityName"];
				arr.Add(row);
			}
			con.Close();			
			return row;
		}
		#endregion  

	/*	#region GetDoctor
		[WebMethod]  
		[XmlInclude(typeof(tbldoctor))]
		public tbldoctor GetDoctor(string PID)
		{
			ArrayList arr = new ArrayList();
			tbldoctor row	= new tbldoctor();

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  

			string sql = "SELECT DoctorName FROM tbldoctor INNER JOIN tblpatientbasicdata ON tbldoctor.DoctorID =tblpatientbasicdata.DoctorID   AND "+"PatientID = '"+PID+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			while(dr.Read())
			{				
				row.DoctorName = (string) dr ["DoctorName"];
				arr.Add(row);
			}
			con.Close();			
			return row;
		}
		#endregion  */



		#region GetHistoryClinical
		[WebMethod]  
		[XmlInclude(typeof(tbltestrecord))]
		public tbltestrecord[] GetHistoryClinical(string PID)
		{
			//int n;
			ArrayList arr = new ArrayList();
			//tbltestrecord row	= new tbltestrecord();

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  

			string sql = "SELECT *  FROM tbltestrecord  WHERE "+
                         "PatientID = '"+PID+"'  ";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			while(dr.Read())
			{	
				tbltestrecord row	= new tbltestrecord();
				row.ListID			= (int)dr["ListID"];
				row.PatientID		= (string)dr["PatientID"];
				row.RoomNo			= (string)dr["RoomNo"];
				row.RoomTypeID		= (string)dr["RoomTypeID"];
				row.Bed				= (string)dr["Bed"];
				row.Date 		    = (string)dr["Date"];
				row.Time 		    = (string)dr["Time"];
				row.Degree 		    = (string)dr["Degree"];
				row.Pulse			= (string)dr["Pulse"];
				row.Respiration		= (string)dr["Respiration"];
				row.Systolic 		= (string)dr["Systolic"];
				row.BloodPress 		= (string)dr["BloodPress"];
				row.Diastolic		= (string)dr["Diastolic"];
				row.Stools			= (string)dr["Stools"];
				row.Urine			= (string)dr["Urine"];
				row.State 			= (string)dr["State"];
				row.Diagnosis 		= (string)dr["Diagnosis"];
				row.NotEat			= (string)dr["NotEat"];
				row.DoctorID 		= (string)dr["DoctorID"];
				row.MedicationRecord= (string)dr["MedicationRecord"];			

				arr.Add(row);
			}
			//n = arr.Count;
			con.Close();
			//return row;
			return (tbltestrecord[])arr.ToArray(typeof(tbltestrecord));
		}
		#endregion

		#region GetHistoryOrder
		[WebMethod]  
		[XmlInclude(typeof(tbltreathistory))]
		public tbltreathistory GetHistoryOrder(string RN)
		{
			ArrayList arr = new ArrayList();
			tbltreathistory row	= new tbltreathistory();

			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  

			string sql = "select * from tbltreathistory  where "+"RoomNo = '"+RN+"'";
			OdbcCommand cmd = new OdbcCommand(sql,con);
			OdbcDataReader dr = cmd.ExecuteReader();
			while(dr.Read())
			{	
				row.ListID			= (int)dr["ListID"];
				row.PatientID		= (string)dr["PatientID"];
				row.DoctorID		= (string)dr["DoctorID"];
				row.DiseaseID		= (string)dr["DiseaseID"];
				row.RoomNo 			= (string)dr["RoomNo"];		
				row.Bed				= (string)dr["Bed"];
				row.RoomTypeID		= (string)dr["RoomTypeID"];
				row.CauseSickID		= (string)dr["CauseSickID"];
				row.CauseExitID		= (string)dr["CauseExitID"];
				row.DateAdmission	= (string)dr["DateAdmission"];
				row.DateExit		= (string)dr["DateExit"];

				arr.Add(row);
			}
			con.Close();
			return row;
		}
		#endregion


		#region ClinicalRecord
		[WebMethod]   
		[XmlInclude(typeof(ClinicalRecord))]
		public void ClinicalRecord(string PatientID,string RoomNo,string RoomTypeID,string Bed,string Date,string Time,string Systolic,string Diastolic,string BloodPress,string Respiration,string Pulse,string Degree,string Stools,string Urine,string State,string Diagnosis,string NotEat,string DoctorID,string MedicationRecord,int status)
		{
			OdbcConnection con = new OdbcConnection("DRIVER={MySQL ODBC 3.51 Driver};SERVER=localhost;PORT=3306;DATABASE=hospital; USER=root;PASSWORD=464021;OPTION=3;");			
			con.Open();  
			
			string sql = "INSERT INTO tbltestrecord (PatientID,RoomNo,RoomTypeID,Bed,Date,Time,Systolic,Diastolic,BloodPress,Respiration,Pulse,Degree,Stools,Urine,State,Diagnosis,NotEat,DoctorID,MedicationRecord,Status) VALUES ('"+PatientID+"','"+RoomNo+"','"+RoomTypeID+"','"+Bed+"','"+Date+"','"+Time+"','"+Systolic+"','"+Diastolic+"','"+BloodPress+"','"+Respiration+"','"+Pulse+"','"+Degree+"','"+Stools+"','"+Urine+"','"+State+"','"+Diagnosis+"','"+NotEat+"','"+DoctorID+"','"+MedicationRecord+"','"+status+"')";

			OdbcCommand cmd = new OdbcCommand(sql,con);
			cmd.ExecuteNonQuery();
			con.Close();
		}
		#endregion
	}
}
