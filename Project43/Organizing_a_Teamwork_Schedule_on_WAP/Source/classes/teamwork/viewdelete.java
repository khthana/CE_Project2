package teamwork;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class viewdelete
{
	private static String temp_gname;
	private static String name;
	private static String table_name = "teamwork_table";
	private static String column_2 = "gname";
	private static String column_3 = "oname";
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
		String link ="teamwork_delete_de.jsp?gname="+temp_gname;
		return link;
	}
	public String getShowlink()
	{
		String showlink = temp_gname;
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
			query.append(column_2);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_3);
			query.append("=\"");
			query.append(name);
			query.append("\" ");
			query.append(" ORDER BY ");
			query.append(column_2);
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
			temp_gname = rs.getString(column_2);
			return temp_gname;
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
