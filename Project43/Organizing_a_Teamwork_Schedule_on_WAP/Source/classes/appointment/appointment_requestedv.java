package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_requestedv
{
	private static String _gname;
	private static String _oname;
	private static String _title;
	private static int reschedule_id;
	private static String name;
	private static String nomem;
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
	private static String table_namet = "teamwork_table";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
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
	public String getLink()
	{
		String link ="appointment_requestedde.jsp?reschedule_id="+reschedule_id;
		return link;
	}
	public String getShowlink()
	{
		String showlink = _gname;
		return showlink;
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
			query.append(table_namer);
			query.append(".");
			query.append(column_r1);
			query.append(",");
			query.append(table_namer);
			query.append(".");
			query.append(column_r11);
			query.append(",");
			query.append(table_namet);
			query.append(".");
			query.append(column_t2);
			query.append(",");
			query.append(table_namet);
			query.append(".");
			query.append(column_t3);
			query.append(" FROM ");
			query.append(table_namer);
			query.append(",");
			query.append(table_namet);
			query.append(" WHERE ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t1);
			query.append("=");
			query.append(table_namer);
			query.append(".");
			query.append(column_r13);
			query.append(" AND ");
			query.append(table_namer);
			query.append(".");
			query.append(column_r14);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\"");
			query.append(" ORDER BY ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t3);
			query.append(",");
			query.append(table_namet);
			query.append(".");
			query.append(column_t2);
			query.append(",");
			query.append(table_namer);
			query.append(".");
			query.append(column_r11);
			//System.out.println(query);
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

	public String getTitle() {
		try
		{
			reschedule_id = rs.getInt(column_r1);
			_title = rs.getString(column_r11);
			return _title;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getTitle");
			return null;
		}
	}	
	
	
	public String getGname() {
		try
		{
			_gname = rs.getString(column_t2);
			return _gname;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getGname");
			return null;
		}
	}
	public String getOname() {
		try
		{
			_oname = rs.getString(column_t3);
			return _oname;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getGname");
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
