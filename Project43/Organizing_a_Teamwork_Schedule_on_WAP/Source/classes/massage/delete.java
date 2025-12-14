package massage;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class delete
{
	private static String error;
	private String name;
	private String massage_massid;
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

	public void setMassid(String massage_massid)
	{
		this.massage_massid = massage_massid;
	}
	
	public String getName()
	{
		return name;
	}

	public boolean ismassage()
	{
		String user_name;
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
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append(massage_massid);
			query.append(" AND ");
			query.append(column_3);
			query.append("= \"");
			query.append(name);
			query.append("\"");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());
			return rs.next(); 

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("ismassage");
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

			query.append("DELETE FROM  ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append(massage_massid);
			query.append(" AND ");
			query.append(column_3);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			System.out.println(query+"///");
			rs = stmt.executeQuery(query.toString());

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("delet");
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
