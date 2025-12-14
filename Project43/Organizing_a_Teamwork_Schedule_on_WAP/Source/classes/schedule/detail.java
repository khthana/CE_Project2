package schedule;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class detail
{
	private static int schedule_date_re;
	private static int schedule_month_re;
	private static int schedule_year_re;
	private static int schedule_htime_re;
	private static int schedule_mtime_re;
	private static int schedule_hto_re;
	private static int schedule_mto_re;
	private static String name;
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
	public void setSchedule_date(String schedule_date)
	{
		schedule_date_re = Integer.parseInt(schedule_date);
	}
	public void setSchedule_month(String schedule_month)
	{
		schedule_month_re = Integer.parseInt(schedule_month);
	}
	public void setSchedule_year(String schedule_year)
	{
		schedule_year_re = Integer.parseInt(schedule_year);
	}
	public void setschedule_htime(String schedule_htime)
	{
		schedule_htime_re = Integer.parseInt(schedule_htime);
	}
	public void setSchedule_mtime(String schedule_mtime)
	{
		schedule_mtime_re = Integer.parseInt(schedule_mtime);
	}
	public void setSchedule_hto(String schedule_hto)
	{
		schedule_hto_re = Integer.parseInt(schedule_hto);
	}
	public void setSchedule_mto(String schedule_mto)
	{
		schedule_mto_re = Integer.parseInt(schedule_mto);
	}
	
		
	public void select()
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
			query.append("SELECT ");
			query.append(column_9);
			query.append(",");
			query.append(column_10);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_11);
			query.append("=\"");
			query.append(name);
			query.append("\" ");
			query.append(" AND ");
			query.append(column_2);
			query.append("=");
			query.append(schedule_year_re);
			query.append(" AND ");
			query.append(column_3);
			query.append("=");
			query.append(schedule_month_re);
			query.append(" AND ");
			query.append(column_4);
			query.append("=");
			query.append(schedule_date_re);
			query.append(" AND ");
			query.append(column_5);
			query.append("=");
			query.append(schedule_htime_re);
			query.append(" AND ");
			query.append(column_6);
			query.append("=");
			query.append(schedule_mtime_re);
			query.append(" AND ");
			query.append(column_7);
			query.append("=");
			query.append(schedule_hto_re);
			query.append(" AND ");
			query.append(column_8);
			query.append("=");
			query.append(schedule_mto_re);
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
		}
	}
	public boolean next()
	{
		try
		{
			return rs.next();	
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("next");			

			return false;
		}
	}
	public String getSchedule_htime()
	{
		String temp = String.valueOf(schedule_htime_re);

		return temp;
	}
	public String getSchedule_mtime()
	{
		String temp = String.valueOf(schedule_mtime_re);
		if (temp.length() == 1)
		{
			temp = "0"+temp;
		}
		return temp;
	}
	public String getSchedule_hto()
	{
		String temp = String.valueOf(schedule_hto_re);
		return temp;
	}
	public String getSchedule_mto()
	{
		String temp = String.valueOf(schedule_mto_re);
		if (temp.length() == 1)
		{
			temp = "0"+temp;
		}
		return temp;
	}
	public String getTitle()
	{
		try
		{
			return rs.getString(column_9);
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			return null;
		}
	}	
	public String getDetail()
	{
		try
		{
			return rs.getString(column_10);
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			return null;
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
