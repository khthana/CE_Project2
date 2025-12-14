package massage;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class deleteview 
{

	private static String name;
	private static int _massid;
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
	StringBuffer query = new StringBuffer(100);

	public void setName(String name)
	{
		this.name = name;
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
			query.append("SELECT ");
			query.append(column_1);
			query.append(",");
			query.append(column_2);
			query.append(",");
			query.append(column_4);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_3);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			query.append(" ORDER BY ");
			query.append(column_1);
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
	public String getMassid()
	{
		try
		{
			_massid = rs.getInt(column_1);
			String _massidS = Integer.toString(_massid);
			return _massidS;
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			return null;
		}
	}
	public String getLink()
	{
		String link ="massage_delete.jsp?id="+_massid;
		return link;
	}
	public void cleanup()
	{
		try
		{
			query.delete(0,query.capacity());
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
