package schedule;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class delete
{
	private static String error;
	private String name;
	private int schedule_date;
	private int schedule_year;
	private int schedule_month;
	private int schedule_hour_time;
	private int schedule_minute_time;
	private int schedule_hour_to;
	private int schedule_minute_to;
	private String schedule_title;
	private String schedule_detail;
	private static String table_name = "schedule_table";
	private static String column_2 = "syear";
	private static String column_3 = "smonth";
	private static String column_4 = "sdate";
	private static String column_5 = "hour_time";
	private static String column_6 = "minute_time";
	private static String column_7 = "hour_to";
	private static String column_8 = "minute_to";
	private static String column_9 = "title";
	private static String column_10 = "detail";

	private static String column_11 = "user_name";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}

	public void setschedule_date(String schedule_date)
	{
		this.schedule_date = Integer.parseInt(schedule_date);
	}

	public void setschedule_month(String schedule_month)
	{
		this.schedule_month = Integer.parseInt(schedule_month);
	}

	public void setschedule_year(String schedule_year)
	{
		this.schedule_year = Integer.parseInt(schedule_year);
	}

	public void setschedule_htime(String schedule_hour_time)
	{
		this.schedule_hour_time = Integer.parseInt(schedule_hour_time);
	}

	public void setschedule_hto(String schedule_hour_to)
	{
		this.schedule_hour_to = Integer.parseInt(schedule_hour_to);
	}

	public void setschedule_mtime(String schedule_minute_time)
	{
		this.schedule_minute_time = Integer.parseInt(schedule_minute_time);
	}

	public void setschedule_mto(String schedule_minute_to)
	{
		this.schedule_minute_to = Integer.parseInt(schedule_minute_to);
	}	
	
	public String getName()
	{
		return name;
	}
	public void setschedule_title(String schedule_title)
	{
		this.schedule_title = schedule_title;
	}
	public void setschedule_detail(String schedule_detail)
	{
		this.schedule_detail = schedule_detail;
	}
	public String getError()
	{
		return error;
	}
	public boolean isSchedule()
	{
		String user_name;
		int schedule_hour_time_db;
		int schedule_hour_to_db;
		int schedule_minute_time_db;
		int schedule_minute_to_db;

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
			query.append(" * ");
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_2);
			query.append("=");
			query.append(schedule_year);
			query.append(" AND ");
			query.append(column_3);
			query.append("=");
			query.append(schedule_month);
			query.append(" AND ");
			query.append(column_4);
			query.append("=");
			query.append(schedule_date);
			query.append(" AND ");
			query.append(column_5);
			query.append("=");
			query.append(schedule_hour_time);
			query.append(" AND ");
			query.append(column_6);
			query.append("=");
			query.append(schedule_minute_time);
			query.append(" AND ");
			query.append(column_7);
			query.append("=");
			query.append(schedule_hour_to);
			query.append(" AND ");
			query.append(column_8);
			query.append("=");
			query.append(schedule_minute_to);
			query.append(" AND ");
			query.append(column_11);
			query.append("= \"");
			query.append(name);
			query.append("\"");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			return rs.next(); 

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isSchedule");
			return false;
		}
	}
	public void delete()
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

			query.append("DELETE FROM  ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_2);
			query.append("=");
			query.append(schedule_year);
			query.append(" AND ");
			query.append(column_3);
			query.append("=");
			query.append(schedule_month);
			query.append(" AND ");
			query.append(column_4);
			query.append("=");
			query.append(schedule_date);
			query.append(" AND ");
			query.append(column_5);
			query.append("=");
			query.append(schedule_hour_time);
			query.append(" AND ");
			query.append(column_6);
			query.append("=");
			query.append(schedule_minute_time);
			query.append(" AND ");
			query.append(column_7);
			query.append("=");
			query.append(schedule_hour_to);
			query.append(" AND ");
			query.append(column_8);
			query.append("=");
			query.append(schedule_minute_to);
			query.append(" AND ");
			query.append(column_11);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			System.out.println(query+"///");
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
