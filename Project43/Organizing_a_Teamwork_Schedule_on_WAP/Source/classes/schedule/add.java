package schedule;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class add
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

	public void setschedule_hour_time(String schedule_hour_time)
	{
		this.schedule_hour_time = Integer.parseInt(schedule_hour_time);
	}

	public void setschedule_hour_to(String schedule_hour_to)
	{
		this.schedule_hour_to = Integer.parseInt(schedule_hour_to);
	}

	public void setschedule_minute_time(String schedule_minute_time)
	{
		this.schedule_minute_time = Integer.parseInt(schedule_minute_time);
	}

	public void setschedule_minute_to(String schedule_minute_to)
	{
		this.schedule_minute_to = Integer.parseInt(schedule_minute_to);
	}	
	
	public void setschedule_title(String schedule_title)
	{
		this.schedule_title = schedule_title;
	}
	public void setschedule_detail(String schedule_detail)
	{
		this.schedule_detail = schedule_detail;
	}
	public String getName()
	{
		return name;
	}
		public boolean isValid()
	{
		String tempS = new String();
		boolean tempB;
		GregorianCalendar g = new GregorianCalendar();
		GregorianCalendar g2 = new GregorianCalendar();
		GregorianCalendar g3 = new GregorianCalendar();
		g2.set(schedule_year,schedule_month-1,schedule_date,schedule_hour_time,schedule_minute_time);
		g3.set(schedule_year,schedule_month-1,schedule_date,schedule_hour_to,schedule_minute_to);
		tempB = true;
		if (!(schedule_date <= g2.getActualMaximum(Calendar.DAY_OF_MONTH) && schedule_date > 0))
		{
			tempS = "date";
			tempB = false;
		}
		if (!(schedule_month <= 12 && schedule_month > 0))
		{
			tempS = tempS.concat(" month");
			tempB = false;
		}
		if (!(schedule_year >= g.get(Calendar.YEAR) && schedule_year <= 9999))
		{
			tempS = tempS.concat(" year");
			tempB = false;
		}
		if (!(schedule_hour_time >= 0 && schedule_hour_time < 24 && schedule_hour_to >= 0 && schedule_hour_to < 24 && schedule_hour_time <= schedule_hour_to))
		{
			tempS =tempS.concat(" hour");
			tempB = false;
		}
		if (!(schedule_minute_time >= 0 && schedule_minute_time < 60 && schedule_minute_to >= 0 && schedule_minute_to < 60 && schedule_hour_time*60+schedule_minute_time < schedule_hour_to*60+schedule_minute_to))
		{
			tempS =tempS.concat(" minute");
			tempB = false;
		}
		if (!(g.before(g2) && g.before(g3) ))
		{
			tempS = tempS.concat(" late time");
			tempB = false;
		}
		if (!(g2.before(g3)))
		{
			tempS = tempS.concat(" sequence time");
			tempB = false;
		}
		System.out.println(g.getTime());
		System.out.println(g2.getTime());
		System.out.println(g3.getTime());
		error = tempS;
		return tempB;
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
		GregorianCalendar g_time_db = new GregorianCalendar();
        	GregorianCalendar g_to_db = new GregorianCalendar();
		GregorianCalendar g_time_re = new GregorianCalendar();
		GregorianCalendar g_to_re = new GregorianCalendar();
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
			query.append(column_5);
			query.append(",");
			query.append(column_6);
			query.append(",");
			query.append(column_7);
			query.append(",");
			query.append(column_8);
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
			query.append(schedule_year);
			query.append(" AND ");
			query.append(column_3);
			query.append("=");
			query.append(schedule_month);
			query.append(" AND ");
			query.append(column_4);
			query.append("=");
			query.append(schedule_date);
			//System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			while (rs.next())
			{
				schedule_hour_time_db = rs.getInt(column_5);
				schedule_minute_time_db = rs.getInt(column_6);
				schedule_hour_to_db = rs.getInt(column_7);
				schedule_minute_to_db = rs.getInt(column_8);
				g_time_db.set(schedule_year,schedule_month-1,schedule_date,schedule_hour_time_db,schedule_minute_time_db);
	            g_to_db.set(schedule_year,schedule_month-1,schedule_date,schedule_hour_to_db,schedule_minute_to_db);
				g_time_re.set(schedule_year,schedule_month-1,schedule_date,schedule_hour_time,schedule_minute_time);
				g_to_re.set(schedule_year,schedule_month-1,schedule_date,schedule_hour_to,schedule_minute_to);
				if (!(
					(
						g_time_re.before(g_time_db) && 
						( 
							g_to_re.before(g_time_db) || g_to_re.equals(g_time_db)
						)
					) || 
					(
						(
							g_time_re.after(g_to_db) || g_time_re.equals(g_to_db)
						) && 
						g_to_re.after(g_to_db)
					))
					)
				{
					System.out.println(g_time_db.getTime().getTime()+""+g_time_db.getTime());
					System.out.println(g_to_db.getTime().getTime()+""+g_to_db.getTime());
					System.out.println(g_time_re.getTime().getTime()+""+g_time_re.getTime());
					System.out.println(g_to_re.getTime().getTime()+""+g_to_re.getTime());
					System.out.println(g_time_re.equals(g_time_db));
					return true;
				}

			}
			return false;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isSchedule");
			return true;
		}
	}
	public void insert()
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
			query.append(schedule_year);
			query.append(",");
			query.append(schedule_month);
			query.append(",");
			query.append(schedule_date);
			query.append(",");
			query.append(schedule_hour_time);
			query.append(",");
			query.append(schedule_minute_time);
			query.append(",");
			query.append(schedule_hour_to);
			query.append(",");
			query.append(schedule_minute_to);
			query.append(",\"");
			query.append(schedule_title);
			query.append("\",\"");
			query.append(schedule_detail);
			query.append("\",\"");
			query.append(name);
			query.append("\")");
			//System.out.println(query+"///");
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
