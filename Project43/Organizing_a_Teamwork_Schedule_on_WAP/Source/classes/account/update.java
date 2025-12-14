package account;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class update
{
	private static String account_password;
	private static String account_repassword;
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
	public void setaccount_password(String account_password)
	{
		this.account_password = account_password;
	}
	public void setaccount_repassword(String account_repassword)
	{
		this.account_repassword = account_repassword;
	}

	public void setaccount_nicname(String account_nicname)
	{
		this.account_nicname = account_nicname;
	}

	public void setaccount_name(String account_name)
	{
		this.account_name = account_name;
	}

	public void setaccount_surname(String account_surname)
	{
		this.account_surname = account_surname;
	}
	public void setaccount_telephone(String account_telephone)
	{
		this.account_telephone = Integer.parseInt(account_telephone);
	}
	public void setaccount_smspass(String account_smspass)
	{
		this.account_smspass = Integer.parseInt(account_smspass);
	}

	public boolean Valid()
	{
		if (account_password.equals(account_repassword))
		{
			return true;
		}
		return false;
	}
	public String getError()
	{
		return error;
	}

	public void update()
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
			query.append("UPDATE ");
			query.append(table_name);
			query.append(" SET ");
			query.append(column_2);
			query.append("=");
			query.append("\"");
			query.append(account_password);
			query.append("\"");
			query.append(",");
			query.append(column_3);
			query.append("=");
			query.append("\"");
			query.append(account_nicname);
			query.append("\"");
			query.append(",");
			query.append(column_4);
			query.append("=");
			query.append("\"");
			query.append(account_name);
			query.append("\"");
			query.append(",");
			query.append(column_5);
			query.append("=");
			query.append("\"");
			query.append(account_surname);
			query.append("\"");
			query.append(",");
			query.append(column_6);
			query.append("=");
			query.append(account_telephone);
			query.append(",");
			query.append(column_7);
			query.append("=");
			query.append(account_smspass);
			query.append(" WHERE ");
			query.append(column_1);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\" ");
			//System.out.println(query);
			rs = stmt.executeQuery(query.toString());
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
