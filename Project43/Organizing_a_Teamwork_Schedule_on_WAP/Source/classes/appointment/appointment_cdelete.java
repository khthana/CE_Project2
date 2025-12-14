package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_cdelete
{
	private static String error;
	private String name;
	private int reschedule_id;
	private int gid;
	private int appointment_date;
	private int appointment_year;
	private int appointment_month;
	private int appointment_hour_time;
	private int appointment_minute_time;
	private int appointment_hour_to;
	private int appointment_minute_to;
	private String appointment_title;
	private String appointment_detail;
	private static String table_name = "reschedule_table";
	private static String column_1 = "reschedule_id";
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
	private static String column_12 = "user_name";
	private static String table_namem = "massage_table";
	private static String table_nameu= "user_table";
	private static String column_m2 = "sender";
	private static String column_m3 = "receiver";
	private static String column_m4 = "title";
	private static String column_m5 = "massage";
	private static String column_u1 = "user_name";
	private static String table_nameg= "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}


	public void setreschedule_id(String reschedule_id)
	{
		this.reschedule_id = Integer.parseInt(reschedule_id);
	}

	public void setGid(String gid)
	{
		this.gid = Integer.parseInt(gid);
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
			query.append(" * ");
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append(reschedule_id);
			query.append(" AND ");
			query.append(column_11);
			query.append("=");
			query.append(gid);
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			return rs.next(); 
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isappointment");
			return false;
		}
	}
	public void delete()
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

			query.append("DELETE FROM  ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append(reschedule_id);
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
