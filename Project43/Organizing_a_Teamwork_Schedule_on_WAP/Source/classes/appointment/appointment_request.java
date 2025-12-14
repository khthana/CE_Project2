package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_request
{
	private static String error;
	private static String gname;
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
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
	private static String table_namer = "reschedule_table";
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
	int _gid;

	public void setName(String name)
	{
		this.name = name;
	}
	public void setGname(String gname)
	{
		this.gname = gname;
	}
	public void setNomem(String nomem)
	{
		this.nomem = nomem;
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
	public String getError()
	{
		return error;
	}
	public int getGid()
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
			query.append(column_t1);
			query.append(" FROM ");
			query.append(table_namet);
			query.append(" WHERE ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t2);
			query.append("=");
			query.append("\"");
			query.append(gname);
			query.append("\"");
			query.append(" AND ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t3);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\" ");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				return rs.getInt(column_t1);
			} 
			return -1;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query setofname");			
			return -1;
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
			query.append("INSERT INTO ");
			query.append(table_namer);
			query.append("(");
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
			query.append(",");
			query.append(column_r13);
			query.append(",");
			query.append(column_r14);
			query.append(")");
			query.append(" VALUES ");
			query.append("(");
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
			query.append(",");
			query.append(appointment_ahour);
			query.append(",");
			query.append(appointment_aminute);
			query.append(",");
			query.append("\"");
			query.append(appointment_title);
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append(appointment_detail);
			query.append("\"");
			query.append(",");
			query.append(getGid());
			query.append(",");
			query.append("\"");
			query.append(nomem);
			query.append("\"");
			query.append(")");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query setofname");			
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