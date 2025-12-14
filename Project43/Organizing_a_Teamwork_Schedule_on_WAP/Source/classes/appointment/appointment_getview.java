package appointment;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class appointment_getview
{
	private static String _gname;
	private static String _oname;
	private static int _gid;
	private static String name;
	private static String table_namet = "teamwork_table";
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
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
		String link ="appointment_getselect.jsp?gid="+_gid;
		return link;
	}
	public String getShowlink()
	{
		String showlink = _gname;
		return showlink;
	}
	public void select()
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
			query.append("SELECT ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t1);
			query.append(",");
			query.append(column_t2);
			query.append(",");
			query.append(column_t3);
			query.append(" FROM ");
			query.append(table_namet);
			query.append(",");
			query.append(table_nameg);
			query.append(" WHERE ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t1);
			query.append("=");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g1);
			query.append(" AND ");
			query.append(column_g2);
			query.append("=\"");
			query.append(name);
			query.append("\" ");
			query.append(" ORDER BY ");
			query.append(column_t3);
			query.append(",");
			query.append(column_t2);
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
	public String getGname() {
		try
		{
			_gid = rs.getInt(column_t1);
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
