package account;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class information
{
	private static String account_password;
	private static String account_nicname;
	private static String account_name;
	private static String account_surname;
	private static int account_telephone;
	private static int account_smspass;
	private static String error;
	private static String name;
	private static String table_name = "user_table";
	private static String column_1 = "user_name";
	private static String column_2 = "user_pass";
	private static String column_3 = "nicname";
	private static String column_4 = "name";
	private static String column_5 = "surname";
	private static String column_6 = "telephone";
	private static String column_7 = "smspass";
	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}
	public String getaccount_nicname()
	{
		return account_nicname ;
	}

	public String getaccount_name()
	{
		return account_name;
	}
	public String getaccount_password()
	{
		return account_password;
	}
	public String getaccount_repassword()
	{
		return account_password;
	}
	public String getaccount_surname()
	{
		return account_surname;
	}
	public String getaccount_telephone()
	{
		return String.valueOf(account_telephone);
	}
	public String getaccount_smspass()
	{
		return String.valueOf(account_smspass);
	}
	
	public String getError()
	{
		return error;
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
			query.append(",");
			query.append(column_3);
			query.append(",");
			query.append(column_4);
			query.append(",");
			query.append(column_5);
			query.append(",");
			query.append(column_6);
			query.append(",");
			query.append(column_7);
			query.append(" FROM ");
			query.append(table_name);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\"");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				account_password = rs.getString(column_2);
				account_nicname = rs.getString(column_3);
				account_name = rs.getString(column_4);
				account_surname = rs.getString(column_5);
				account_telephone = rs.getInt(column_6);
				account_smspass = rs.getInt(column_7);
			}
			
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
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
