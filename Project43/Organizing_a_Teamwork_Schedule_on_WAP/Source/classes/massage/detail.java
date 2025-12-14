package massage;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class detail
{
	private static String name;
	private static String massid;
	private static String table_name = "massage_table";
	private static String column_1 = "massid";
	private static String column_2 = "sender";
	private static String column_3 = "receiver";
	private static String column_4 = "title";
	private static String column_5 = "massage";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}
	public void setMass_id(String massid)
	{
		this.massid = massid;
	}
	public boolean isMassid()
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
			query.append("*");
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append(massid);
			query.append(" AND ");
			query.append(column_3);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());

			return rs.next();
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
			return false;
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
	public String getSender()
	{
		try
		{
			return rs.getString(column_2);
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			return null;
		}
	}	
	public String getTitle()
	{
		try
		{
			return rs.getString(column_4);
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			return null;
		}
	}
	public String getMassage()
	{
		try
		{
			return rs.getString(column_5);
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
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
