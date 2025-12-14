package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_tranfer
{
	private static String error;
	private static String gname;
	private static String name;
	private int appointment_date;
	private int appointment_year;
	private int appointment_month;
	private int appointment_hour_time;
	private int appointment_minute_time;
	private int appointment_hour_to;
	private int appointment_minute_to;
	private String appointment_title;
	private String appointment_detail;
	private static String table_namet = "teamwork_table";
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
	private static String table_names = "schedule_table";
	private static String column_s2 = "syear";
	private static String column_s3 = "smonth";
	private static String column_s4 = "sdate";
	private static String column_s5 = "hour_time";
	private static String column_s6 = "minute_time";
	private static String column_s7 = "hour_to";
	private static String column_s8 = "minute_to";
	private static String column_s9 = "title";
	private static String column_s10 = "detail";

	private static String column_s11 = "user_name";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";

	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;


	public void setName(String name)
	{
		this.name = name;
	}
	public void setGname(String gname)
	{
		this.gname = gname;
	}
	public void setappointment_date(String appointment_date)
	{
		this.appointment_date = Integer.parseInt(appointment_date);
	}

	public void setappointment_month(String appointment_month)
	{
		this.appointment_month = Integer.parseInt(appointment_month);
	}

	public void setappointment_year(String appointment_year)
	{
		this.appointment_year = Integer.parseInt(appointment_year);
	}

	public void setappointment_hour_time(String appointment_hour_time)
	{
		this.appointment_hour_time = Integer.parseInt(appointment_hour_time);
	}

	public void setappointment_hour_to(String appointment_hour_to)
	{
		this.appointment_hour_to = Integer.parseInt(appointment_hour_to);
	}

	public void setappointment_minute_time(String appointment_minute_time)
	{
		this.appointment_minute_time = Integer.parseInt(appointment_minute_time);
	}

	public void setappointment_minute_to(String appointment_minute_to)
	{
		this.appointment_minute_to = Integer.parseInt(appointment_minute_to);
	}	

	public void setappointment_title(String appointment_title)
	{
		this.appointment_title = appointment_title;
	}
	public void setappointment_detail(String appointment_detail)
	{
		this.appointment_detail = appointment_detail;
	}
	public String getError()
	{
		return error;
	}
	public boolean Valid()
	{
		schedulec sc = new schedulec(name,appointment_year,appointment_month,appointment_date,appointment_hour_time,appointment_minute_time,appointment_hour_to,appointment_minute_to);
		//System.out.println(sc.overlap());
		return !sc.overlap();
	}

	public void insert()
	{
		StringBuffer query = new StringBuffer(100);
		try
		{
			if (rs != null)
			{
				rs.close();
			}
			if (stmt != null)
			{
				stmt.close();
			}
			Class.forName(driverName).newInstance();
			con = DriverManager.getConnection(connectionURL);
			stmt = con.createStatement();
			query.append("INSERT INTO  ");
			query.append(table_names);
			query.append(" ( ");
			query.append(column_s2);
			query.append(",");
			query.append(column_s3);
			query.append(",");
			query.append(column_s4);
			query.append(",");
			query.append(column_s5);
			query.append(",");
			query.append(column_s6);
			query.append(",");
			query.append(column_s7);
			query.append(",");
			query.append(column_s8);
			query.append(",");
			query.append(column_s9);
			query.append(",");
			query.append(column_s10);
			query.append(",");
			query.append(column_s11);
			query.append(") ");
			query.append(" VALUES(");
			query.append(appointment_year);
			query.append(",");
			query.append(appointment_month);
			query.append(",");
			query.append(appointment_date);
			query.append(",");
			query.append(appointment_hour_time);
			query.append(",");
			query.append(appointment_minute_time);
			query.append(",");
			query.append(appointment_hour_to);
			query.append(",");
			query.append(appointment_minute_to);
			query.append(",\"");
			query.append(appointment_title);
			query.append("\",\"");
			query.append(appointment_detail);
			query.append("\",\"");
			query.append(name);
			query.append("\")");
			//System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
		}
	}

	public void cleanup()
	{
		try
		{
			if (rs != null)
			{
				rs.close();
			}
			if (stmt != null)
			{
				stmt.close();
			}
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("cleanup");			

		}
	}	
}
