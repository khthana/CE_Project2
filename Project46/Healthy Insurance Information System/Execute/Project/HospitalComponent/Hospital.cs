using System;
using System.Data;
using System.Data.SqlClient;
using HospitalComponent.WebReference1;
namespace HospitalComponent
{
	/// <summary>
	/// Summary description for Hospital.
	/// </summary>
	public class Hospital
	{
		public Hospital()
		{
			//
			// TODO: Add constructor logic here
			//
		}
		//---------------------------- DATABASE About Clearing -------------------------------
		public DataSet queryClearing(String pid,String dateBill)
		{
			MyDB db=new MyDB();
			return db.queryHealthy(pid,dateBill);
		}
		public String insertClearing(HospitalClearing datainsert)
		{
			MyDB db=new MyDB();
			return db.insertClearing(datainsert);
		}
		public String updateHealthy(HospitalClearing dataupdate)
		{
			MyDB db=new MyDB();
			return db.updateHealthy(dataupdate);
		}
		public String removeClearing(String pid,String dateBill)
		{
			MyDB db=new MyDB();
			return db.removeHealthy(pid,dateBill);
		}
		//-------------------------------------------------------------------------------

		//---------------------------- DATABASE About Detail -------------------------------
		public String queryProvince(String provinceId)
		{
			MyDB db=new MyDB();
			return db.queryProvince(provinceId);
		}
		public String queryAmpher(String provinceId,String AmpherId)
		{
			MyDB db=new MyDB();
			return db.queryAmpher(provinceId,AmpherId);
		}
		public String queryTumbon(String provinceId,String AmpherId,String TumbonId)
		{
			MyDB db=new MyDB();
			return db.queryTumbon(provinceId,AmpherId,TumbonId);
		}
		public String[] queryAllHospital()
		{
			MyDB db=new MyDB();
			return db.queryAllHospital();
		}
		public String[] queryHospitalInProject(String pvcode)
		{
			MyDB db=new MyDB();
			return db.queryHospitalInProject(pvcode);
		}

		public String getHospitalId(String hosName)
		{
			MyDB db=new MyDB();
			return db.getHospitalId(hosName);
		}
		public String getHospitalName(String hosId)
		{
			MyDB db=new MyDB();
			return db.getHospitalName(hosId);
		}
		public String getCurrentHosId()
		{
			MyDB db=new MyDB();
			return db.getCurrentHosId();
		}
		public String getCurrentProvince()
		{
			MyDB db=new MyDB();
			return db.getCurrentProvince();
		}
		//-------------------------------------------------------------------------------

		//---------------------------- Request Web Service -------------------------------
		public DataSet queryHealthy(String pid)
		{
			WebReference1.Service1 requestService=new WebReference1.Service1();
			return requestService.queryHealthy(pid);
		}
		public String checkPrivilegeAccident(String pid)
		{
			WebReference1.Service1 requestService=new WebReference1.Service1();
			return requestService.checkPrivilegeAccident(pid);
		}
		public String registerHealthy(RegisterDataset sendRegis)
		{
			WebReference1.Service1 requestService=new WebReference1.Service1();
			return requestService.registerHealthy(sendRegis);
		}
		public String updateHealthy(String pid,String hmain,String hsub)
		{
			WebReference1.Service1 requestService=new WebReference1.Service1();
			return requestService.updateHealthy(pid,hmain,hsub);
		}
		public String sendClearing(ClearingDataset datasend)
		{
			WebReference1.Service1 requestService=new WebReference1.Service1();
			return requestService.sendClearing(datasend);
		}
		public ClearingDataset receiveClearing(String hnumber,String dateBill)
		{
			WebReference1.Service1 requestService=new WebReference1.Service1();
			return 	requestService.receiveClearing(hnumber,dateBill);
		}
	//-------------------------------------------------------------------------------

	}
}
