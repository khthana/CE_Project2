package teamwork;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class subgroup
{

	private String name;
	private String teamwork_sname_re;
	private String teamwork_oname_re;
	private int temp_gid;
	private static String table_name1 = "teamwork_table";
	private static String table_name2 = "gmember_table";

	private static String column_11 = "gid";
	private static String column_12 = "gname";
	private static String column_13 = "oname";
	private static String column_21 = "gid";
	private static String column_22 = "member";

	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}

	public void setTeamwork_sname(String teamwork_sname)
	{
		this.teamwork_sname_re = teamwork_sname;
	}
	public void setTeamwork_oname(String teamwork_oname)
	{
		this.teamwork_oname_re = teamwork_oname;
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
			boolean _isgroup;
			Class.forName(driverName).newInstance();
			con = DriverManager.getConnection(connectionURL);
			stmt = con.createStatement();
			StringBuffer query = new StringBuffer(100);
			query.append("SELECT  ");
			query.append(" * ");
			query.append(" FROM ");
			query.append(table_name1);
			query.append(" WHERE ");
			query.append(column_12);
			query.append("=\"");
			query.append(teamwork_sname_re);
			query.append("\" AND ");
			query.append(column_13);
			query.append("=\"");
			query.append(teamwork_oname_re);
			query.append("\"");
			System.out.println(query+"///isGroup");

			rs = stmt.executeQuery(query.toString());
			_isgroup = rs.next();
			if (_isgroup)
			{
				temp_gid = rs.getInt(column_11);
			}
			return _isgroup ;

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isteamwork");
			return false;
		}
	}
	public boolean isMember()
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
			query.append(table_name2);
			query.append(" WHERE ");
			query.append(column_21);
			query.append("=\"");
			query.append(temp_gid);
			query.append("\" AND ");
			query.append(column_22);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			System.out.println(query+"///isMember");

			rs = stmt.executeQuery(query.toString());
			return rs.next() ;

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("isteamwork");
			return false;
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
			query.append(table_name2);
			query.append(" ( ");
			query.append(column_21);
			query.append(",");
			query.append(column_22);
			query.append(" ) VALUES ( ");
			query.append(temp_gid);
			query.append(",\"");
			query.append(name);
			query.append("\")");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());

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
