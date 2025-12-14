package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_getselect
{
	private static String _title;
	private static int gid;
	private static int _tschedule;
	private static String name;
	private static String table_namet = "teamwork_table";
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
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
	public void setGid(String gid)
	{
		this.gid = Integer.parseInt(gid);
	}
	public String getLink()
	{
		String link ="appointment_getviewde.jsp?tschedule="+_tschedule;
		return link;
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
			query.append(column_ts1);
			query.append(",");
			query.append(column_ts9);
			query.append(" FROM ");
			query.append(table_namets);
	//		query.append(",");
	//		query.append(table_nameg);
			query.append(" WHERE ");
/*			query.append(table_namets);
			query.append(".");
			query.append(column_ts1);
			query.append("=");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g1);
			query.append(" AND ");
	*/		query.append(table_namets);
			query.append(".");
			query.append(column_ts11);
			query.append("=");
			query.append(gid);
			query.append(" ORDER BY ");
			query.append(column_ts9);
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
	public String getTitle() {
		try
		{
			_tschedule = rs.getInt(column_ts1);
			_title = rs.getString(column_ts9);
			return _title;
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
