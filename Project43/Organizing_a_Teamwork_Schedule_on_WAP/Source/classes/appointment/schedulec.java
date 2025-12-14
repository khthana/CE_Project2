package appointment;
import java.util.*;
import java.sql.*;
class schedulec
{
	private int year;
	private int month;
	private int date;
	private int hour_time;
	private int minute_time;
	private int hour_to;
	private int minute_to;
	private String name;
	private static String table_names = "schedule_table";
	private static String column_s1 = "schedule_id";
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
	schedulec(String iname,int iyear,int imonth,int idate,int ihour_time,int iminute_time,int ihour_to,int iminute_to)
	{
		year = iyear;
		month = imonth;
		date = idate;
		hour_time = ihour_time;
		minute_time = iminute_time;
		hour_to = ihour_to;
		minute_to = iminute_to;
		name = iname;
	}
	public boolean overlap()
	{
		int hour_time_db;
		int hour_to_db;
		int minute_time_db;
		int minute_to_db;
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
			query.append(column_s5);
			query.append(",");
			query.append(column_s6);
			query.append(",");
			query.append(column_s7);
			query.append(",");
			query.append(column_s8);
			query.append(" FROM ");
			query.append(table_names);
			query.append(" WHERE ");
			query.append(column_s11);
			query.append("=\"");
			query.append(name);
			query.append("\" ");
			query.append(" AND ");
			query.append(column_s2);
			query.append("=");
			query.append(year);
			query.append(" AND ");
			query.append(column_s3);
			query.append("=");
			query.append(month);
			query.append(" AND ");
			query.append(column_s4);
			query.append("=");
			query.append(date);
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			while (rs.next())
			{
				hour_time_db = rs.getInt(column_s5);
				minute_time_db = rs.getInt(column_s6);
				hour_to_db = rs.getInt(column_s7);
				minute_to_db = rs.getInt(column_s8);
				timers tsdb = new timers(hour_time_db,minute_time_db);
				timers tedb = new timers(hour_to_db,minute_to_db);
				timers tsc = new timers(hour_time,minute_time);
				timers tec = new timers(hour_to,minute_to);
				System.out.print("tsc "+tsc.gethour());System.out.print(tsc.getminute());
				System.out.print("tsdb"+tsdb.gethour());System.out.print(tsdb.getminute());
				System.out.print("tedb"+tedb.gethour());System.out.println(tedb.getminute());
				if (tsdb.lessthan(tsc) && tedb.morethan(tsc))
				{
					System.out.println("overlap");
					return true;
				} else System.out.println("not overlap");
				System.out.print("tec "+tec.gethour());System.out.print(tec.getminute());
				System.out.print("tsdb "+tsdb.gethour());System.out.print(tsdb.getminute());
				System.out.print("tedb "+tedb.gethour());System.out.println(tedb.getminute());
				if (tsdb.lessthan(tec) && tedb.morethan(tec))
				{
					System.out.println("overlap");
					return true;
				} else System.out.println("not overlap");
				System.out.print("tsdb "+tsdb.gethour());System.out.print(tsdb.getminute());
				System.out.print("tsc "+tsc.gethour());System.out.print(tsc.getminute());
				System.out.print("tec "+tec.gethour());System.out.println(tec.getminute());

				if (tsc.lessthan(tsdb) && tec.morethan(tsdb))
				{
					System.out.println("overlap");
					return true;
				} else System.out.println("not overlap");
				System.out.print("tedb "+tedb.gethour());System.out.print(tedb.getminute());
				System.out.print("tsc "+tsc.gethour());System.out.print(tsc.getminute());
				System.out.print("tec "+tec.gethour());System.out.println(tec.getminute());
				if (tsc.lessthan(tedb) && tec.morethan(tedb))
				{
					System.out.println("overlap");
					return true;
				} else System.out.println("not overlap");
			}
			return false;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("Valid");
			return false;
		}

	}
}
