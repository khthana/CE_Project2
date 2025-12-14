package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_force
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
	private int appointment_ahour;
	private int appointment_aminute;
	private String appointment_title;
	private String appointment_detail;
	private int gid;
	private static String table_namet = "teamwork_table";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
	private static String table_namets = "tschedule_table";
	private static String column_ts2 = "syear";
	private static String column_ts3 = "smonth";
	private static String column_ts4 = "sdate";
	private static String column_ts5 = "hour_time";
	private static String column_ts6 = "minute_time";
	private static String column_ts7 = "hour_to";
	private static String column_ts8 = "minute_to";
	private static String column_ts9 = "title";
	private static String column_ts10 = "detail";
	private static String column_ts11 = "gid";

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
		int hour_time_db;
		int hour_to_db;
		int minute_time_db;
		int minute_to_db;
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
			query.append(column_ts5);
			query.append(",");
			query.append(column_ts6);
			query.append(",");
			query.append(column_ts7);
			query.append(",");
			query.append(column_ts8);
			query.append(",");
			query.append(table_namet);
			query.append(".");
			query.append(column_t1);
			query.append(" FROM ");
			query.append(table_namet);
			query.append(",");
			query.append(table_namets);
			query.append(" WHERE ");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts11);
			query.append("=");
			query.append(table_namet);
			query.append(".");
			query.append(column_t1);
			query.append(" AND ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t3);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\" ");
			query.append(" AND ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t2);
			query.append("=");
			query.append("\"");
			query.append(gname);
			query.append("\" ");
			query.append(" AND ");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts2);
			query.append("=");
			query.append(appointment_year);
			query.append(" AND ");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts3);
			query.append("=");
			query.append(appointment_month);
			query.append(" AND ");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts4);
			query.append("=");
			query.append(appointment_date);
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			while (rs.next())
			{
				hour_time_db = rs.getInt(column_ts5);
				minute_time_db = rs.getInt(column_ts6);
				hour_to_db = rs.getInt(column_ts7);
				minute_to_db = rs.getInt(column_ts8);
				timers tsdb = new timers(hour_time_db,minute_time_db);
				timers tedb = new timers(hour_to_db,minute_to_db);
				timers tsc = new timers(appointment_hour_time,appointment_minute_time);
				timers tec = new timers(appointment_hour_to,appointment_minute_to);
				gid = rs.getInt(column_t1);
				System.out.print(gid);
				System.out.print("tsc "+tsc.gethour());System.out.print(tsc.getminute());
				System.out.print("tsdb"+tsdb.gethour());System.out.print(tsdb.getminute());
				System.out.print("tedb"+tedb.gethour());System.out.println(tedb.getminute());
				if (tsdb.lessthan(tsc) && tedb.morethan(tsc))
				{
					System.out.println("overlap");
					return false;
				} else System.out.println("not overlap");
				System.out.print("tec "+tec.gethour());System.out.print(tec.getminute());
				System.out.print("tsdb "+tsdb.gethour());System.out.print(tsdb.getminute());
				System.out.print("tedb "+tedb.gethour());System.out.println(tedb.getminute());
				if (tsdb.lessthan(tec) && tedb.morethan(tec))
				{
					System.out.println("overlap");
					return false;
				} else System.out.println("not overlap");
				System.out.print("tsdb "+tsdb.gethour());System.out.print(tsdb.getminute());
				System.out.print("tsc "+tsc.gethour());System.out.print(tsc.getminute());
				System.out.print("tec "+tec.gethour());System.out.println(tec.getminute());

				if (tsc.lessthan(tsdb) && tec.morethan(tsdb))
				{
					System.out.println("overlap");
					return false;
				} else System.out.println("not overlap");
				System.out.print("tedb "+tedb.gethour());System.out.print(tedb.getminute());
				System.out.print("tsc "+tsc.gethour());System.out.print(tsc.getminute());
				System.out.print("tec "+tec.gethour());System.out.println(tec.getminute());
				if (tsc.lessthan(tedb) && tec.morethan(tedb))
				{
					System.out.println("overlap");
					return false;
				} else System.out.println("not overlap");
			}
			return true;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("valid");			
			return true;
		}

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
			query.append(table_namets);
			query.append(" ( ");
			query.append(column_ts2);
			query.append(",");
			query.append(column_ts3);
			query.append(",");
			query.append(column_ts4);
			query.append(",");
			query.append(column_ts5);
			query.append(",");
			query.append(column_ts6);
			query.append(",");
			query.append(column_ts7);
			query.append(",");
			query.append(column_ts8);
			query.append(",");
			query.append(column_ts9);
			query.append(",");
			query.append(column_ts10);
			query.append(",");
			query.append(column_ts11);
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
			query.append(gid);
			query.append("\")");
			System.out.println(query+"///");
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
