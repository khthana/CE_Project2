package teamwork;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class delete
{

	private int _gid;
	private String name;
	private String teamwork_gname_re;
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

	public void setTeamwork_gname(String teamwork_gname)
	{
		this.teamwork_gname_re = teamwork_gname;
	}

	
	public String getName()
	{
		return name;
	}

	public boolean isGroup()
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
			query.append(column_t1);
			query.append(" FROM ");
			query.append(table_namet);
			query.append(" WHERE ");
			query.append(column_t2);
			query.append("=\"");
			query.append(teamwork_gname_re);
			query.append("\" AND ");
			query.append(column_t3);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			System.out.println(query+"///isGroup");
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				_gid = rs.getInt(column_t1);
				return true;
			} 
			return false;

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isteamwork");
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
			StringBuffer query1 = new StringBuffer(100);

			query.append("DELETE FROM  ");
			query.append(table_namet);
			query.append(" WHERE ");
			query.append(column_t1);
			query.append("=");
			query.append(_gid);
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			query1.append("DELETE FROM  ");
			query1.append(table_nameg);
			query1.append(" WHERE ");
			query1.append(column_g1);
			query1.append("=");
			query1.append(_gid);
			System.out.println(query1+"///");
			rs = stmt.executeQuery(query1.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("delete");
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
