package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_requestedde
{

	private String name;
	private int reschedule_id;
	private int appointment_date;
	private int appointment_year;
	private int appointment_month;
	private int appointment_hour_time;
	private int appointment_minute_time;
	private int appointment_hour_to;
	private int appointment_minute_to;
	private String appointment_title;
	private String appointment_detail;
	private int appointment_ahour;
	private int appointment_aminute;
	private static String table_namer = "reschedule_table";
	private static String column_r1 = "reschedule_id";
	private static String column_r2 = "syear";
	private static String column_r3 = "smonth";
	private static String column_r4 = "sdate";
	private static String column_r5 = "hour_time";
	private static String column_r6 = "minute_time";
	private static String column_r7 = "hour_to";
	private static String column_r8 = "minute_to";
	private static String column_r9 = "ahour";
	private static String column_r10 = "aminute";
	private static String column_r11 = "title";
	private static String column_r12 = "detail";
	private static String column_r13 = "gid";
	private static String column_r14 = "user_name";

	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}

	public void setappointment_reschedule(String appointment_reschedule_id)
	{
		this.reschedule_id = Integer.parseInt(appointment_reschedule_id);
	}

	public String getName()
	{
		return name;
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
			query.append(table_namer);
			query.append(" WHERE ");
			query.append(column_r1);
			query.append("=");
			query.append(reschedule_id);
			query.append(" AND ");
			query.append(column_r14);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			return rs.next();

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("Valid");
			return false;
		}

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
			query.append(column_r2);
			query.append(",");
			query.append(column_r3);
			query.append(",");
			query.append(column_r4);
			query.append(",");
			query.append(column_r5);
			query.append(",");
			query.append(column_r6);
			query.append(",");
			query.append(column_r7);
			query.append(",");
			query.append(column_r8);
			query.append(",");
			query.append(column_r9);
			query.append(",");
			query.append(column_r10);
			query.append(",");
			query.append(column_r11);
			query.append(",");
			query.append(column_r12);
			query.append(" FROM ");
			query.append(table_namer);
			query.append(" WHERE ");
			query.append(column_r1);
			query.append("=");
			query.append(reschedule_id);
			query.append(" ORDER BY ");
			query.append(column_r2);
			query.append(",");
			query.append(column_r3);
			query.append(",");
			query.append(column_r4);
			query.append(",");
			query.append(column_r5);
			query.append(",");
			query.append(column_r6);
			query.append(",");
			query.append(column_r7);
			query.append(",");
			query.append(column_r8);
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				appointment_year = rs.getInt(column_r2);
				appointment_month = rs.getInt(column_r3);
				appointment_date = rs.getInt(column_r4);
				appointment_hour_time = rs.getInt(column_r5);
				appointment_minute_time = rs.getInt(column_r6);
				appointment_hour_to = rs.getInt(column_r7);
				appointment_minute_to = rs.getInt(column_r8);
				appointment_ahour = rs.getInt(column_r9);
				appointment_aminute = rs.getInt(column_r10);
				appointment_title = rs.getString(column_r11);
				appointment_detail = rs.getString(column_r12);
				timers t = new timers(appointment_hour_to,appointment_minute_to);
				timers a = new timers(appointment_ahour,appointment_aminute);
				t.subtime(a);
				appointment_hour_to = t.gethour();
				appointment_minute_to = t.getminute();
			}
			

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
		}
	}
	public String getYear()
	{
		return Integer.toString(appointment_year);
	}
	public String getMonth()
	{
		return Integer.toString(appointment_month);
	}
	public String getDate()
	{
		return Integer.toString(appointment_date);
	}
	public String getHour_time()
	{
		return Integer.toString(appointment_hour_time);
	}
	public String getMinute_time()
	{
		if (appointment_minute_time == 0)
		{
			return "00";
		}
		return Integer.toString(appointment_minute_time);
	}
	public String getHour_to()
	{
		return Integer.toString(appointment_hour_to);
	}
	public String getMinute_to()
	{
		if (appointment_minute_to == 0)
		{
			return "00";
		}
		return Integer.toString(appointment_minute_to);
	}
	public String getAhour()
	{
		return Integer.toString(appointment_ahour);
	}
	public String getAminute()
	{
		if (appointment_aminute == 0)
		{
			return "00";
		}
		return Integer.toString(appointment_aminute);
	}
	public String getTitle()
	{
		return appointment_title;
	}
	public String getDetail()
	{
		return appointment_detail;
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
