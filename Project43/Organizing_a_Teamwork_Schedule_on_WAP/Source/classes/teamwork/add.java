package teamwork;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class add
{
	private String name;
	private String teamwork_gname_re;
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

	public void setteamwork_gname(String teamwork_gname)
	{
		this.teamwork_gname_re = teamwork_gname;
	}

	
	public String getName()
	{
		return name;
	}
	public boolean isGname()
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
			query.append("*");
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_2);
			query.append("=\"");
			query.append(teamwork_gname_re);
			query.append("\" ");
			query.append(" AND ");
			query.append(column_3);
			query.append("=\"");
			query.append(name);
			query.append("\" ");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			return rs.next();

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isGname");
			return true;
		}
	}
	public void insert()
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

			query.append("INSERT INTO  ");
			query.append(table_name);
			query.append(" ( ");
			query.append(column_2);
			query.append(",");
			query.append(column_3);
			query.append(") ");
			query.append(" VALUES(\"");
			query.append(teamwork_gname_re);
			query.append("\",\"");
			query.append(name);
			query.append("\")");
			System.out.println(query+"///");
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
