package user;
import java.sql.*;
public class signup
{
	private String name;
	private String password;
	private String repassword;
	private String nicname;
	private String sign_name;
	private String surname;
	private String telephone;
	private String smspass;
	private String error = "";
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
	public void setSign_password(String password)
	{
		this.password = password;
	}


	public void setSign_repassword(String repassword)
	{
		this.repassword = repassword;
	}
	public void setSign_nicname(String nicname)
	{
		this.nicname = nicname;
	}
	public void setSign_name(String sign_name)
	{
		this.sign_name = sign_name;
	}
	public void setSign_surname(String surname)
	{
		this.surname = surname;
	}
	public void setSign_telephone(String telephone)
	{
		this.telephone = telephone;
	}
	public void setSign_smspass(String smspass)
	{
		this.smspass = smspass;
	}

	public String getPassword()
	{
		return password;
	}
	public boolean Valid()
	{
		boolean bvalid = true;
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
			bvalid =  !rs.next();
			if (!bvalid)
			{
				System.out.println(query);
				error="User name has been used.<br/>";
			}
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("select");
			return false;
		}
		if (!password.equals(repassword) && password !=null)
		{
			bvalid = false;
			error += "Password not match.<br/>";
		}
		return bvalid;
	}
	public String Geterror()
	{
		return error;
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
			query.append(" VALUES(");
			query.append("\"");
			query.append(name);
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append(password);
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append(nicname);
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append(name);
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append(surname);
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append(telephone);
			query.append("\"");
			query.append(",");
			query.append("\"");
			query.append(smspass);
			query.append("\")");
			stmt.executeUpdate(query.toString());
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
		}
}
};
