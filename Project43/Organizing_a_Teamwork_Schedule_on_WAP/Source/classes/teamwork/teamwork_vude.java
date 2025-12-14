package teamwork;
import java.util.*;
import java.sql.*;
import java.lang.*;
public class teamwork_vude
{

	private String name;
	private String gname;
	private String member;
	private String user_name;
	private String nicname;
	private String uname;
	private String surname;
	private int telephone;
	private static String table_namet = "teamwork_table";
	private static String column_t1 = "gid";
	private static String column_t2 = "gname";
	private static String column_t3 = "oname";
	private static String table_nameg = "gmember_table";
	private static String column_g1 = "gid";
	private static String column_g2 = "member";
	private static String table_nameu = "user_table";
	private static String column_u1 = "user_name";
	private static String column_u2 = "user_pass";
	private static String column_u3 = "nicname";
	private static String column_u4 = "name";
	private static String column_u5 = "surname";
	private static String column_u6 = "telephone";
	private static String column_u7 = "smspass";

	private static String driverName = "org.gjt.mm.mysql.Driver";
	private static String connectionURL = "jdbc:mysql://localhost/project_teamworking";
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;

	public void setName(String name)
	{
		this.name = name;
	}

	public void setGname(String gname)
	{
		this.gname = gname;
	}
	public void setMember(String member)
	{
		this.member = member;
	}
	public String getName()
	{
		return name;
	}

	public boolean Valid()
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
			query.append("*");
			query.append(" FROM ");
			query.append(table_namet);
			query.append(",");
			query.append(table_nameg);
			query.append(" WHERE ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t1);
			query.append("=");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g1);
			query.append(" AND ");
			query.append(column_t2);
			query.append("=");
			query.append("\"");
			query.append(gname);
			query.append("\"");
			query.append(" AND ");
			query.append(table_namet);
			query.append(".");
			query.append(column_t3);
			query.append("=\"");
			query.append(name);
			query.append("\"");
			query.append(" AND ");
			query.append(table_nameg);
			query.append(".");
			query.append(column_g2);
			query.append("=\"");
			query.append(member);
			query.append("\"");
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			return rs.next();

		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("Valid");
			return false;
		}

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
			query.append(column_u1);
			query.append(",");
			query.append(column_u3);
			query.append(",");
			query.append(column_u4);
			query.append(",");
			query.append(column_u5);
			query.append(",");
			query.append(column_u6);
			query.append(" FROM ");
			query.append(table_nameu);
			query.append(" WHERE ");
			query.append(column_u1);
			query.append("=");
			query.append("\"");
			query.append(name);
			query.append("\"");
			System.out.println(query);
			rs = stmt.executeQuery(query.toString());
			if (rs.next())
			{
				user_name = rs.getString(column_u1);
				nicname = rs.getString(column_u3);
				uname = rs.getString(column_u4);
				surname = rs.getString(column_u5);
				telephone = rs.getInt(column_u6);
			}
		}
		catch (Exception e)
		{
			e.printStackTrace(System.err);
			System.out.println("query");			
		}
	}
	public String getUser_name()
	{
		return user_name;
	}
	public String getNicname()
	{
		return nicname;
	}
	public String getUname()
	{
		return uname;
	}
	public String getTelephone()
	{
		return String.valueOf(telephone);
	}
	public String getSurname()
	{
		return surname;
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
