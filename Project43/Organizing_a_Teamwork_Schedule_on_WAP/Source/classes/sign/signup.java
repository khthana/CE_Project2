package sign;
import java.sql.*;
public class signup
{
	private String name;
	private String password;
	private String table_name = "user_table";
	private String colum_name = "user_name";
	String driverName = "org.gjt.mm.mysql.Driver";
	String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}
	public String getName()
	{
		return name;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public String getPassword()
	{
		return password;
	}
	public boolean isAccount()
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
			query.append(colum_name);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(colum_name);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			rs = stmt.executeQuery(query.toString());
			if (rs == null ) return false;
			else return rs.next();	
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
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
			query.append(table_name);
			query.append(" VALUES(\"");
			query.append(name);
			query.append("\",\"");
			query.append(password);
			query.append("\")");
			stmt.executeUpdate(query.toString());
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
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
		}
}
};
