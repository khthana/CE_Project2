package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_accept
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
	private int syear;
	private int smonth;
	private int sdate;
	private int hour_time;
	private int minute_time;
	private int hour_to;
	private int minute_to;
	private int ahour;
	private int aminute ;
	private String title;
	private String detail;
	private int gid;
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
	private static String table_namet = "tschedule_table";
	private static String column_t2 = "syear";
	private static String column_t3 = "smonth";
	private static String column_t4 = "sdate";
	private static String column_t5 = "hour_time";
	private static String column_t6 = "minute_time";
	private static String column_t7 = "hour_to";
	private static String column_t8 = "minute_to";
	private static String column_t9 = "title";
	private static String column_t10 = "detail";
	private static String column_t11 = "gid";

	private static String table_names = "schedule_table";
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

	private static String table_nametw = "teamwork_table";
	private static String column_tw1 = "gid";
	private static String column_tw3 = "oname";

	private static String table_namem = "massage_table";
	private static String column_m1 = "massageid";
	private static String column_m2 = "sender";
	private static String column_m3 = "receiver";
	private static String column_m4 = "title";
	private static String column_m5 = "massage";

	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}
	public void setappointment_reschedule_id(String appointment_reschedule_id)
	{
		this.reschedule_id = Integer.parseInt(appointment_reschedule_id);
	}

	public void setappointment_hour_time(String appointment_hour_time)
	{
		this.appointment_hour_time = Integer.parseInt(appointment_hour_time);
	}
	public void setappointment_minute_time(String appointment_minute_time)
	{
		this.appointment_minute_time = Integer.parseInt(appointment_minute_time);
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
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				syear = rs.getInt(column_r2);
				smonth = rs.getInt(column_r3);
				sdate = rs.getInt(column_r4);
				hour_time = rs.getInt(column_r5);
				minute_time = rs.getInt(column_r6);
				hour_to = rs.getInt(column_r7);
				minute_to = rs.getInt(column_r8);
				ahour = rs.getInt(column_r9);
				aminute = rs.getInt(column_r10);
				title = rs.getString(column_r11);
				detail = rs.getString(column_r12);
				gid = rs.getInt(column_r13);
				timers ti = new timers(appointment_hour_time,appointment_minute_time);
				timers ts = new timers(hour_time,minute_time);
				if (ts.morethan(ti))
				{
					return false;
				}
				timers te = new timers(hour_to,minute_to);
				timers ta = new timers(ahour,aminute);
				te.subtime(ta);
				if (te.lessthan(ti))
				{
					return false;
				}
				return true;
			} else return false;

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("Valid");
			return false;
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
			timers ti = new timers(appointment_hour_time,appointment_minute_time);
			timers ta = new timers(ahour,aminute);
			ti.addtime(ta);
			query.append("INSERT INTO  ");
			query.append(table_namet);
			query.append(" ( ");
			query.append(column_t2);
			query.append(",");
			query.append(column_t3);
			query.append(",");
			query.append(column_t4);
			query.append(",");
			query.append(column_t5);
			query.append(",");
			query.append(column_t6);
			query.append(",");
			query.append(column_t7);
			query.append(",");
			query.append(column_t8);
			query.append(",");
			query.append(column_t9);
			query.append(",");
			query.append(column_t10);
			query.append(",");
			query.append(column_t11);
			query.append(") ");
			query.append(" VALUES(");
			query.append(syear);
			query.append(",");
			query.append(smonth);
			query.append(",");
			query.append(sdate);
			query.append(",");
			query.append(appointment_hour_time);
			query.append(",");
			query.append(appointment_minute_time);
			query.append(",");
			query.append(ti.gethour());
			query.append(",");
			query.append(ti.getminute());
			query.append(",\"");
			query.append(title);
			query.append("\",\"");
			query.append(detail);
			query.append("\",");
			query.append(gid);
			query.append(")");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("insert oname");			
		}
	}
	public String getUser_name()
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
			query.append(column_tw3);
			query.append(" FROM ");
			query.append(table_nametw);
			query.append(" WHERE ");
			query.append(column_tw1);
			query.append("=");
			query.append(gid);
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			rs.next();
			return rs.getString(column_tw3);
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("get user");
			return "";
		}

	}		

	public void insertoname()
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
			timers ti = new timers(appointment_hour_time,appointment_minute_time);
			timers ta = new timers(ahour,aminute);
			ti.addtime(ta);
			query.append("INSERT INTO  ");
			query.append(table_names);
			query.append(" ( ");
			query.append(column_s2);
			query.append(",");
			query.append(column_s3);
			query.append(",");
			query.append(column_s4);
			query.append(",");
			query.append(column_s5);
			query.append(",");
			query.append(column_s6);
			query.append(",");
			query.append(column_s7);
			query.append(",");
			query.append(column_s8);
			query.append(",");
			query.append(column_s9);
			query.append(",");
			query.append(column_s10);
			query.append(",");
			query.append(column_s11);
			query.append(") ");
			query.append(" VALUES(");
			query.append(syear);
			query.append(",");
			query.append(smonth);
			query.append(",");
			query.append(sdate);
			query.append(",");
			query.append(appointment_hour_time);
			query.append(",");
			query.append(appointment_minute_time);
			query.append(",");
			query.append(ti.gethour());
			query.append(",");
			query.append(ti.getminute());
			query.append(",\"");
			query.append(title);
			query.append("\",\"");
			query.append(detail);
			query.append("\",\"");
			query.append(getUser_name());
			query.append("\")");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
		}
	}


	public void delete()
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
			query.append("DELETE FROM ");
			query.append(table_namer);
			query.append(" WHERE ");
			query.append(column_r1);
			query.append("=");
			query.append(reschedule_id);
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("delete");			
		}
	}

	public void message()
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
			timers ti = new timers(appointment_hour_time,appointment_minute_time);
			timers ta = new timers(ahour,aminute);
			ti.addtime(ta);
			query.append("INSERT INTO  ");
			query.append(table_namem);
			query.append(" ( ");
			query.append(column_m2);
			query.append(",");
			query.append(column_m3);
			query.append(",");
			query.append(column_m4);
			query.append(",");
			query.append(column_m5);
			query.append(") ");
			query.append(" VALUES(");
			query.append("\"");
			query.append(name);
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append(getUser_name());
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append("Accept");
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append("Accept appointment title:");
			query.append(title);
			query.append(" from ");
			query.append(appointment_hour_time);
			query.append(":");
			query.append(appointment_minute_time);
			query.append("\")");
			//System.out.println(query);
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
};
