package user;
import java.sql.*;
public class login
{
	private String name;
	private String password;
	private String table_name = "user_table";
	private String colum_name = "user_name";
	private String colum_password = "user_pass";
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
	public boolean check()
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
			query.append(" , ");
			query.append(colum_password);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(colum_name);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			query.append(" AND ");
			query.append(colum_password);
			query.append("=\"");
			query.append(password);
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
