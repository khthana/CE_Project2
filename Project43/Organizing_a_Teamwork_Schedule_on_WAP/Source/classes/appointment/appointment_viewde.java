package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_viewde
{
	private static int appointment_date;
	private static int appointment_month;
	private static int appointment_year;
	private static int appointment_htime;
	private static int appointment_mtime;
	private static int appointment_hto;
	private static int appointment_mto;
	private static int gid;
	private static String name;
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
	public void setappointment_htime(String appointment_htime)
	{
		this.appointment_htime = Integer.parseInt(appointment_htime);
	}
	public void setappointment_mtime(String appointment_mtime)
	{
		this.appointment_mtime = Integer.parseInt(appointment_mtime);
	}
	public void setappointment_hto(String appointment_hto)
	{
		this.appointment_hto = Integer.parseInt(appointment_hto);
	}
	public void setappointment_mto(String appointment_mto)
	{
		this.appointment_mto = Integer.parseInt(appointment_mto);
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
			query.append("=");
			query.append(gid);
			query.append(" AND ");
			query.append(column_2);
			query.append("=");
			query.append(appointment_year);
			query.append(" AND ");
			query.append(column_3);
			query.append("=");
			query.append(appointment_month);
			query.append(" AND ");
			query.append(column_4);
			query.append("=");
			query.append(appointment_date);
			query.append(" AND ");
			query.append(column_5);
			query.append("=");
			query.append(appointment_htime);
			query.append(" AND ");
			query.append(column_6);
			query.append("=");
			query.append(appointment_mtime);
			query.append(" AND ");
			query.append(column_7);
			query.append("=");
			query.append(appointment_hto);
			query.append(" AND ");
			query.append(column_8);
			query.append("=");
			query.append(appointment_mto);
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
	public String getappointment_htime()
	{
		String temp = String.valueOf(appointment_htime);

		return temp;
	}
	public String getappointment_mtime()
	{
		String temp = String.valueOf(appointment_mtime);
		if (temp.length() == 1)
		{
			temp = "0"+temp;
		}
		return temp;
	}
	public String getappointment_hto()
	{
		String temp = String.valueOf(appointment_hto);
		return temp;
	}
	public String getappointment_mto()
	{
		String temp = String.valueOf(appointment_mto);
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
