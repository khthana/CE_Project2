package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_getviewde
{

	private String name;
	private int tschedule_id;
	private int appointment_date;
	private int appointment_year;
	private int appointment_month;
	private int appointment_hour_time;
	private int appointment_minute_time;
	private int appointment_hour_to;
	private int appointment_minute_to;
	private String appointment_title;
	private String appointment_detail;
	private String appointment_gname;
	private String appointment_oname;
	private static String table_namet = "teamwork_table";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String table_namets = "tschedule_table";
	private static String column_ts1 = "tschedule_id";
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

	public void setappointment_tschedule(String appointment_tschedule_id)
	{
		this.tschedule_id = Integer.parseInt(appointment_tschedule_id);
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
			query.append(table_namets);
			query.append(",");
			query.append(table_nameg);
			query.append(" WHERE ");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts11);
			query.append("=");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g1);
			query.append(" AND ");
			query.append(column_ts1);
			query.append("=");
			query.append(tschedule_id);
			query.append(" AND ");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g2);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			//System.out.println(query);
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
			query.append(table_namets);
			query.append(".");
			query.append(column_ts2);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts3);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts4);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts5);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts6);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts7);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts8);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts9);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts10);

			query.append(" FROM ");
			query.append(table_namets);
			query.append(" WHERE ");
			query.append(column_ts1);
			query.append("=");
			query.append(tschedule_id);
			query.append(" ORDER BY ");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts2);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts3);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts4);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts5);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts6);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts7);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_ts8);
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				appointment_year = rs.getInt(column_ts2);
				appointment_month = rs.getInt(column_ts3);
				appointment_date = rs.getInt(column_ts4);
				appointment_hour_time = rs.getInt(column_ts5);
				appointment_minute_time = rs.getInt(column_ts6);
				appointment_hour_to = rs.getInt(column_ts7);
				appointment_minute_to = rs.getInt(column_ts8);
				appointment_title = rs.getString(column_ts9);
				appointment_detail = rs.getString(column_ts10);
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
		return Integer.toString(appointment_minute_time);
	}
	public String getHour_to()
	{
		return Integer.toString(appointment_hour_to);
	}
	public String getMinute_to()
	{
		return Integer.toString(appointment_minute_to);
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
