package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_new_add
{
	private static String error;
	private String name;
	private String gname;
	private int _gid;
	private int appointment_date;
	private int appointment_year;
	private int appointment_month;
	private int appointment_hour_time;
	private int appointment_minute_time;
	private int appointment_hour_to;
	private int appointment_minute_to;
	private int appointment_ahour;
	private int appointment_aminute;
	private String appointment_title;
	private String appointment_detail;
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
	private static String table_name = "tschedule_table";
	private static String column_2 = "syear";
	private static String column_3 = "smonth";
	private static String column_4 = "sdate";
	private static String column_5 = "hour_time";
	private static String column_6 = "minute_time";
	private static String column_7 = "hour_to";
	private static String column_8 = "minute_to";
	private static String column_9 = "title";
	private static String column_10 = "detail";
	private static String column_11 = "gid";
	private static String table_tname = "teamwork_table";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";

	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String Stringday;
	String Stringtime;
	String Stringto;
	public String getDay()
	{
		return Stringday;
	}
	public String getTime()
	{
		return Stringtime;
	}
	public String getTo()
	{
		return Stringto;
	}

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
	public void setappointment_ahour(String appointment_ahour)
	{
		this.appointment_ahour = Integer.parseInt(appointment_ahour);
	}
	public void setappointment_aminute(String appointment_aminute)
	{
		this.appointment_aminute = Integer.parseInt(appointment_aminute);
	}

	public void setappointment_title(String appointment_title)
	{
		this.appointment_title = appointment_title;
	}
	public void setappointment_detail(String appointment_detail)
	{
		this.appointment_detail = appointment_detail;
	}
	public boolean Valid()
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
			Class.forName(driverName).newInstance();
			con = DriverManager.getConnection(connectionURL);
			stmt = con.createStatement();
			StringBuffer query = new StringBuffer(100);

			query.append("SELECT  ");
			query.append("*");
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_2);
			query.append(" = ");
			query.append(appointment_year);
			query.append(" AND ");
			query.append(column_3);
			query.append(" = ");
			query.append(appointment_month);
			query.append(" AND ");
			query.append(column_4);
			query.append(" = ");
			query.append(appointment_date);
			query.append(" AND ");
			query.append(column_5);
			query.append(" = ");
			query.append(appointment_hour_time);
			query.append(" AND ");
			query.append(column_6);
			query.append(" = ");
			query.append(appointment_minute_time);
			query.append(" AND ");
			query.append(column_7);
			query.append(" = ");
			query.append(appointment_hour_to);
			query.append(" AND ");
			query.append(column_8);
			query.append(" = ");
			query.append(appointment_minute_to);
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());

			return !(rs.next());

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("Valid");
			return true;
		}
	}
	public void findgid()
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
			Class.forName(driverName).newInstance();
			con = DriverManager.getConnection(connectionURL);
			stmt = con.createStatement();
			StringBuffer query = new StringBuffer(100);

			query.append("SELECT  ");
			query.append(column_t1);
			query.append(" FROM ");
			query.append(table_tname);
			query.append(" WHERE ");
			query.append(column_t2);
			query.append(" = ");
			query.append("\"");
			query.append(gname);
			query.append("\"");
			query.append(" AND ");
			query.append(column_t3);
			query.append(" = ");
			query.append("\"");
			query.append(name);
			query.append("\"");
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				_gid = rs.getInt(column_t1);
			}



		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("find");
		}
	}
	public void insert()
	{
		findgid();
		timers ts = new timers(appointment_hour_time,appointment_minute_time);
		ts.printtimers();
		timers ta = new timers(appointment_ahour,appointment_aminute);
		ta.printtimers();
		ts.addtime(ta);
		ts.printtimers();
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
			StringBuffer query = new StringBuffer(100);

			query.append("INSERT INTO  ");
			query.append(table_name);
			query.append(" ( ");
			query.append(column_2);
			query.append(",");
			query.append(column_3);
			query.append(",");
			query.append(column_4);
			query.append(",");
			query.append(column_5);
			query.append(",");
			query.append(column_6);
			query.append(",");
			query.append(column_7);
			query.append(",");
			query.append(column_8);
			query.append(",");
			query.append(column_9);
			query.append(",");
			query.append(column_10);
			query.append(",");
			query.append(column_11);
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
			query.append(ts.gethour());
			query.append(",");
			query.append(ts.getminute());
			query.append(",\"");
			query.append(appointment_title);
			query.append("\",\"");
			query.append(appointment_detail);
			query.append("\",\"");
			query.append(_gid);
			query.append("\")");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			Stringday = appointment_date+"-"+appointment_month+"-"+appointment_year;
			Stringtime =  appointment_hour_time+":"+appointment_minute_time;
			Stringto =  ts.gethour()+":"+ts.getminute();
			query.delete(0,query.length());
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
			query.append(ts.gethour());
			query.append(",");
			query.append(ts.getminute());
			query.append(",\"");
			query.append(appointment_title);
			query.append("\",\"");
			query.append(appointment_detail);
			query.append("\",\"");
			query.append(name);
			query.append("\")");
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("insert");
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
};