package teamwork;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class viewuser
{
	private static String _member;
	private static String name;
	private static String gname;
	private static String table_namet = "teamwork_table";
	private static String table_nameg = "gmember_table";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
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
	public void setGname(String gname){
		this.gname = gname;
	}
	public String getLink()
	{
		String link ="teamwork_viewuserde.jsp?mem="+_member;
		return link;
	}
	public String getShowlink()
	{
		String showlink = _member;
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
			query.append(column_g2);
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
			query.append(column_t2);
			query.append("=\"");
			query.append(gname);
			query.append("\" AND ");
			query.append(column_t3);
			query.append("=\"");
			query.append(name);
			query.append("\" ");
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
	public String getMember() {
		try
		{
			_member = rs.getString(column_g2);
			return _member;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("getsname");
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
