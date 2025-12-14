package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_viewe
{
	private static String temp_htime;
	private static String temp_mtime;
	private static String temp_hto;
	private static String temp_mto;
	private static String error;
	private static String gname;
	private static int gid;
	private static String name;
	private String appointment_date;
	private String appointment_year;
	private String appointment_month;
	private String appointment_hour_time;
	private String appointment_minute_time;
	private String appointment_hour_to;
	private String appointment_minute_to;
	private String appointment_title;
	private String appointment_detail;
	private static String table_namet = "teamwork_table";
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
	private static String table_namets = "tschedule_table";
	private static String column_s2 = "syear";
	private static String column_s3 = "smonth";
	private static String column_s4 = "sdate";
	private static String column_s5 = "hour_time";
	private static String column_s6 = "minute_time";
	private static String column_s7 = "hour_to";
	private static String column_s8 = "minute_to";
	private static String column_s9 = "title";
	private static String column_s10 = "detail";

	private static String column_s11 = "gid";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}
	public void setGid(String gid)
	{
		this.gid = Integer.parseInt(gid);
	}
	public String getError()
	{
		return error;
	}
	public boolean isValid()
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
			query.append("*");
			query.append(" FROM ");
			query.append(table_namet);
			query.append(" WHERE ");
			query.append(column_t1);
			query.append("=");
			query.append(gid);
			query.append(" AND ");
			query.append(column_t3);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\" ");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			return rs.next();
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query setofname");			
			return true;
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
			query.append(column_s2);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s3);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s4);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s5);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s6);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s7);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s8);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s9);
			query.append(" FROM ");
			query.append(table_namets);
			query.append(" WHERE ");
			query.append(column_s11);
			query.append("=");
			query.append(gid);
			query.append(" ORDER BY ");
			query.append(table_namets);
			query.append(".");
			query.append(column_s2);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s3);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s4);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s5);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s6);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s7);
			query.append(",");
			query.append(table_namets);
			query.append(".");
			query.append(column_s8);
			System.out.println(query);
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
	public String getYear()
	{
		try
		{
		int  temp = rs.getInt(column_s2);

		String _temp = String.valueOf(temp);
		appointment_year = _temp;
		return _temp;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getYear");
			return null;
		}

	}

	public String getMonth()
	{
		try
		{
		int  temp = rs.getInt(column_s3);

		String _temp = String.valueOf(temp);
		appointment_month = _temp;
		return _temp;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getYear");
			return null;
		}

	}	
		public String getDate()
	{
		try
		{
		int  temp = rs.getInt(column_s4);

		String _temp = String.valueOf(temp);
		appointment_date = _temp;
		return _temp;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getYear");
			return null;
		}

	}
	public String getHour_time()
	{
		try
		{
		int  hour = rs.getInt(column_s5);

		String hour_time = String.valueOf(hour);
		temp_htime = hour_time;
		return hour_time;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("gethour_time");
			return null;
		}
	}
	public String getMinute_time() throws Exception
	{
		try
		{
		int  minute = rs.getInt(column_s6);
		String minute_time = String.valueOf(minute);

		if (minute_time.length() == 1)
		{
			minute_time = "0"+ minute_time;
		}
		temp_mtime = minute_time;
		return minute_time;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getminute_time");
			return null;
		}
	}
	public String getHour_to() throws Exception
	{
		try
		{
		int  hour = rs.getInt(column_s7);
		String hour_to = String.valueOf(hour);
		temp_hto = hour_to;
		return hour_to;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("gethour_to");
			return null;
		}
	}
	public String getMinute_to() throws Exception
	{
		try
		{
		int  minute = rs.getInt(column_s8);
		String minute_to = String.valueOf(minute);
		if (minute_to.length() == 1)
		{
			minute_to = "0"+ minute_to;
		}
		temp_mto = minute_to;
		return minute_to;
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getminute_to");
			return null;
		}
	}
	public String getTitle()
	{
		try
		{
			return rs.getString(column_s9);
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			return null;
		}
	}
	public String getLink()
	{
		String link ="appointment_viewde.jsp?year="+appointment_year+"&#x26;month="+appointment_month+"&#x26;date="+appointment_date+"&#x26;htime="+temp_htime+"&#x26;mtime="+temp_mtime+"&#x26;hto="+temp_hto+"&#x26;mto="+temp_mto+"&#x26;gid="+gid;
		return link;
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
