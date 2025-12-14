package Type;

import java.sql.ResultSet;
import java.sql.SQLException;
import ConnectDB.*;

public class ClassRoom 
{
	private int ClassID;
	private String Subject;
	private String StartDate;
	private String FinishDate;
	private String StartTime;
	private String FinishTime;
	private String CourseDate;
	private String Teacher;
	private String Area;
	private int TotalSeat;
	private int AvailableSeat;
	private double Cost;
	private int Period;
	
	public ClassRoom(int ClassID, String Subject, String StartDate, String FinishDate, String StartTime, String FinishTime, 
			String CourseDay, String Teacher, String Area, int TotalSeat, int AvailableSeat, double Cost, int Period)
	{
		this.ClassID = ClassID;
		this.Subject = Subject;
		this.StartDate = StartDate;
		this.FinishDate = FinishDate;
		this.StartTime = StartTime;
		this.FinishTime = FinishTime;
		this.CourseDate = CourseDay;
		this.Teacher = Teacher;
		this.Area = Area;
		this.TotalSeat = TotalSeat;
		this.AvailableSeat = AvailableSeat;
		this.Cost = Cost;
		this.Period = Period;
	}
	
	public ClassRoom()
	{
		this.ClassID = 0;
		this.Subject = null;
		this.StartDate = null;
		this.FinishDate = null;
		this.StartTime = null;
		this.FinishTime = null;
		this.CourseDate = null;
		this.Teacher = null;
		this.Area = null;
		this.TotalSeat = 0;
		this.AvailableSeat = 0;
		this.Cost = 0;
		this.Period = 0;
	}
	
	public static ClassRoom find(int ClassID)
	{
		MySQLDB mysql = new MySQLDB();
		ClassRoom course = null;
		mysql.initialize();
		try{
			String sql = "select * from class where ClassID = " + ClassID;
			ResultSet rs = mysql.find(sql);
			if(rs.next())
			course = new ClassRoom(rs.getInt(1), rs.getString(2), rs.getDate(3).toString(), rs.getDate(4).toString(),
					rs.getTime(5).toString(), rs.getTime(6).toString(), rs.getString(7), rs.getString(8), rs.getString(9),
					rs.getInt(10), rs.getInt(11), rs.getDouble(12), rs.getInt(13));
			//System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7));
		}catch(SQLException e)
		{
			System.err.println(e);
		}finally
		{
			mysql.terminate();
		}
		return course;
	}
		
	public static boolean IsFull(int ClassID)
	{
		ClassRoom cla = find(ClassID);
		if(cla == null)
			return false;
		if(cla.AvailableSeat < cla.TotalSeat)
			return true;
		return false;
	}
	
	public static String findCourse(String Subject, int Period)
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from class ";
		if(Subject != null || Period != 0)
		{
			sql += "where Subject = '" + Subject + "' and Period = " + Period;
		}else
		if(Subject == null || Period != 0)
		{
			sql += "where Period = " + Period ;
		}else
		if(Subject != null || Period == 0)
		{
			sql += "where Subject = '" + Subject + "'";
		}
		String output = mysql.find(sql, "class");
		return output;
	}
	
	public static String findCourse(String Email)
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "SELECT * from class where ClassID IN (SELECT ClassID from booking where Booker = '"+Email+"')";
		String output = mysql.find(sql, "class");
		return output;
	}
	
	public String getAll()
	{
		MySQLDB mysql = new MySQLDB();
		String sql = "select * from class";
		String output = mysql.find(sql, "class");
		return output;
	}
	
	public boolean add()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql;
		if(ClassID == 0)
			sql = "insert into class VALUES(null,'"+Subject+"','"+StartDate+"','"+FinishDate+"','0000-00-00 "+StartTime+"','0000-00-00 "+FinishTime+
			"','"+CourseDate+"','"+Teacher+"','"+Area+"',"+TotalSeat+","+AvailableSeat+","+Cost+","+Period+",Default)";
		else		
			sql = "insert into class VALUES("+ClassID+",'"+Subject+"','"+StartDate+"','"+FinishDate+"','0000-00-00 "+StartTime+"','0000-00-00 "+FinishTime+
			"','"+CourseDate+"','"+Teacher+"','"+Area+"',"+TotalSeat+","+AvailableSeat+","+Cost+","+Period+",Default)";
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;		
	}
	
	public boolean update()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql = "update class Set Subject = '"+Subject+"'," +
				"StartDate = '"+StartDate+"'," +
				"FinishDate = '"+FinishDate+"'," +
				"StartTime = '0000-00-00 "+StartTime+"'," +
				"FinishTime = '0000-00-00 "+FinishTime+"'," +
				"CourseDate = '"+CourseDate+"'," +
				"Teacher = '"+Teacher+"'," +
				"Area = '"+Area+"'," +
				"TotalSeat = "+TotalSeat+"," +
				"AvailableSeat = "+AvailableSeat+"," +
				"Period = "+Period+"," +
				"Cost = "+Cost+" where ClassID = "+ClassID;
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;		
	}
	
	public boolean delete()
	{
		MySQLDB mysql = new MySQLDB();
		mysql.initialize();
		String sql = "delete from class where ClassID = " + ClassID;
		boolean complete = mysql.update(sql);
		mysql.terminate();	
		return complete;	
	}
	
	public void setClassID(int ClassID)
	{
		this.ClassID = ClassID;
	}
	
	public int getClassID()
	{
		return ClassID;
	}
	
	public void setSubject(String Subject)
	{
		this.Subject = Subject;
	}
	
	public String getSubject()
	{
		return Subject;
	}
	
	public void setStartDate(String StartDate)
	{
		this.StartDate = StartDate;
	}
	
	public String getStartDate()
	{
		return StartDate;
	}
	
	public void setFinishDate(String FinishDate)
	{
		this.FinishDate = FinishDate;
	}
	
	public String getFinishDate()
	{
		return FinishDate;
	}
	
	public void setStartTime(String StartTime)
	{
		this.StartTime = StartTime;
	}
	
	public String getStartTime()
	{
		return StartTime;
	}
	
	public void setFinishTime(String FinishTime)
	{
		this.FinishTime = FinishTime;
	}
	
	public String getFinishTime()
	{
		return FinishTime;
	}
	
	public void setCourseDate(String CourseDate)
	{
		this.CourseDate = CourseDate;
	}
	
	public String getCourseDate()
	{
		return CourseDate;  
	}
	
	public void setTeacher(String Teacher)
	{
		this.Teacher = Teacher;
	}
	
	public String getTeacher()
	{
		return Teacher;
	}
	
	public void setArea(String Area)
	{
		this.Area = Area;
	}
	
	public String getArea()
	{
		return Area; 
	}
	
	public void setTotalSeat(int TotalSeat)
	{
		this.TotalSeat = TotalSeat;
	}
	
	public int getTotalSeat()
	{
		return TotalSeat; 
	}
	
	public void setAvailableSeat(int AvailableSeat)
	{
		this.AvailableSeat = AvailableSeat;
	}
	
	public int getAvailableSeat()
	{
		return AvailableSeat; 
	}
		
	public void setCost(double Cost)
	{
		this.Cost = Cost;
	}
	
	public double getCost()
	{
		return Cost;
	}
	
	public void setPeriod(int Period)
	{
		this.Period = Period;
	}
	
	public int getPeriod()
	{
		return Period;
	}
}
